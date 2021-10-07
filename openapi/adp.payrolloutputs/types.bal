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

# Describes impound details, as applicable, of related monies
public type StatutorydeductionssummaryImpoundinformation record {
    # Indicate the party responsible for paying the taxes; values are ADP or Client
    EarningssummaryImpoundinformationImpoundpartycode impoundPartyCode?;
    # The accounts from which the associated monies will be impounded, as applicable
    Impoundaccount1 impoundAccount?;
    # Set of configuration tags relevant to the related instance
    StatutorydeductionssummaryImpoundinformationConfigurationtags[] configurationTags?;
};

# A simple (string) code.  Can have a code list reference
public type SimplecodetypeV02 string;

public type StringType record {
    IndicatorType readOnly?;
    IndicatorType optional?;
    IndicatorType hidden?;
    SequenceType sequence?;
    # Specified on a target property.  If the passed conditions are true then this property is disallowed and therefore, not presented to a user.
    DisallowItemType[] disallow?;
    # Provides a client defined UI label for the property which is less than an average of 20 characters in length.
    string shortLabelName?;
    # Provides a client defined UI long label for the property.
    string longLabelName?;
    # Indicates the minimum length required for a property.
    int minLength?;
    # Indicates the maximum length supported for a property
    int maxLength?;
    # Indicates the default value which should be populated by default
    string 'default?;
    # Indicates a regular expression on the required pattern for the value
    string pattern?;
    MaskingRuleType masking?;
    # Provides 1 to many properties which the value of this property must be equal to.  If the property is equal to any of the value of the properties then the validation is successful.
    string[] 'equals?;
    # The value of the related property must be greater than the value of  all the given properties in the array.
    string[] greaterThan?;
    # The value of the related property must be less than the value of all the given properties in the array.
    string[] lessThan?;
    # List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
    DependencyListType dependencies?;
    # Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
    HelperMessageType helperMessage?;
    MetaDataType dataType?;
    # A reference to the codelist extended with values
    ValueSetType valueSet?;
    LinktypeV02[] dependencyLinks?;
};

# The type of tax
public type StatutorydeductionssummaryStatutorydeductiontypecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# The amount of the associated output item
public type MemossummaryMemoamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # Standard currency code as per ISO 4212
    string currencyCode?;
};

# Reimbursements
public type PaySummaryReimbursement record {
    # Payroll Accumulator Results
    PaySummaryReimbursementPayrollAccumulation[] payrollAccumulations?;
    # Reimbursement sections
    PaySummaryReimbursementsSection[] reimbursementsSections?;
};

public type PayrolloutputsConfirmmessage record {
    # An identifier for the instance of the confirm message.
    PayrolloutputsConfirmmessageConfirmmessageid confirmMessageID?;
    # The date & time that the message instance was generated.; follows the ISO-8601:2000 format: 2008-05-11T15:30:00-06:00.
    string createDateTime?;
    # The date & time that the request submitted by the client was received. Note, this timestamp may not be the same as the time the client actually submitted the request if there is a queuing mechanism between the client and server processing the request; it follows the ISO-8601:2000 format: 2008-05-11T15:30:00-06:00.
    string requestReceiptDateTime?;
    # Protocol-specific response status code.
    PayrolloutputsConfirmmessageProtocolstatuscode protocolStatusCode?;
    # Code that identifies the protocol used for the request.
    PayrolloutputsConfirmmessageProtocolcode protocolCode?;
    # The identifier of the request that generated this response.
    PayrolloutputsConfirmmessageRequestid requestID?;
    # The process results status code for the request.
    PayrolloutputsConfirmmessageRequeststatuscode requestStatusCode?;
    # The method that was used on the request corresponding to this message instance.
    PayrolloutputsConfirmmessageRequestmethodcode requestMethodCode?;
    # A session identifier if one is available.
    PayrolloutputsConfirmmessageSessionid sessionID?;
    # The entity tag of the entity in the request.
    string requestETag?;
    PayrolloutputsConfirmmessageRequestlink requestLink?;
    # Processing status of the related request message.
    PayrolloutputsConfirmmessageProcessingstatuscode processingStatusCode?;
    # processMessage is optional and contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).  Most often there will be a single instance for an associated request or resource, but this structure allows for more than one if needed, for example, if multiple errors exist for a single resource. 
    PayrolloutputsConfirmmessageProcessmessages[] processMessages?;
    # resource Message contains the resource-specific processing results for resources being managed in the request.  A resource may have its processing reported as:  succeeded or failed.  It must be used to represent resource-specific messages.  In the case of a request managing multiple resources and resource-specific messages are to be returned, then this array will contain one object for each such resource of the request.
    PayrolloutputsConfirmmessageResourcemessages[] resourceMessages?;
};

public type PayrollOutputs record {
    PayrollOutput[] payrollOutputs?;
    # Meta contains the metadata associated with a response.  A GET response may include metadata to support pagination
    PayrolloutputsMeta meta?;
    PayrolloutputsConfirmmessage confirmMessage?;
};

# The simple (string) identifier of an object
public type SimpleidtypeV02 string;

# Reportable earnings and benefits
public type PayAllocationReportableEarningsAndBenefit record {
    # Payroll Accumulator Results
    PayAllocationReportableEarningsAndBenefitPayrollAccumulation[] payrollAccumulations?;
    # Reportable Earnings and Benefits section
    PayAllocationReportableEarningsAndBenefitsSection[] reportableEarningsAndBenefitsSections?;
};

# A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type PaysummaryearningLinks record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # A unique identifier of the feature/function/operation, the link poins to
    string canonicalUri?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request. For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    PaymentdistributionssummaryPayloadarguments[] payLoadArguments?;
};

# An identifier for the instance of the resource message.
public type PayrolloutputsConfirmmessageResourcemessageid record {
    # An ID
    string idValue?;
    # The type of ID
    string schemeName?;
    # The agency that issues the ID
    string schemeAgencyName?;
};

public type PayrollAccumulations record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

public type PayAllocationReimbursementPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

public type DeductionItemBasePayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

# Summary of non-tax deductions 
public type NonStatutoryDeductionSummary record {
    # Payroll Accumulator Results
    NonStatutoryDeductionsSummaryPayrollAccumulation[] payrollAccumulations?;
    # Non-tax deductions
    NonStatutoryDeductionSection[] nonStatutoryDeductionSummarySections?;
};

# Reportable earnings and benefits
public type PaySummaryReportableEarningsAndBenefit record {
    # Payroll Accumulator Results
    ReportableEarningsAndBenefitPayrollAccumulation[] payrollAccumulations?;
    # Reportable Earnings and Benefits section
    PaySummaryReportableEarningsAndBenefitsSection[] reportableEarningsAndBenefitsSections?;
};

# The type of script the in which the associated entity is represented. Associated codelist is ISO15924-A. Use the alpha-4 representation versus the single digit numeric representation. Format is lowercase with initial letter capitalized. For example, Cyrillic is Cyrl
public type ImpoundaccountFinancialpartyAddressScriptcode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# Indicate the party responsible for paying the taxes; values are ADP or Client
public type EarningssummaryImpoundinformationImpoundpartycode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type ImpoundaccountFinancialpartyCommunicationLandlines record {
    # A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary 
    ImpoundaccountFinancialpartyCommunicationNamecode nameCode?;
    # The country dialing code is the national prefix to be used when dialing TO that particular country FROM another country.  
    string countryDialing?;
    # The local area dialing code for a telephone number.
    string areaDialing?;
    # The local communication number, not including country dialing or area dialing codes. If component parts of the telephone number are being communicated then the dialNumber is required.
    string dialNumber?;
    # The extension of the local communication number. In the case of a Telephone Number accessing a Pager Network, the extension may be the Pager Identification Number required to leave a message for the Pager Number (i.e. Pager Pin). These are mutually exclusive.
    string extension?;
    # National Direct Dialing Prefix.  Also known as the trunk prefix or National Prefix.  It is the number to be dialed in a domestic telephone call, preceding any necessary area code and subscriber number (i.e. dial number).  When calling from outside of the country, the national direct dial prefix is omitted by the caller. In Australia, Germany, and United Kingdom the trunk prefix is 0.  In the US and Canada it is 1.
    string access?;
    # The formatted telephone number.  The component parts of the telephone are put together into a presentation pattern as defined by the regex format specified.  Please note that is used as an escape character in regex, but a double is needed to escape within the json schema.  The regex will accept +CC NNNNNNNNNNNNNN where + is the symbol indicating the caller to enter their country specific code to call from outside the country. CC is the country code for an international number (optional), and the area code and dial number.  The local access code (i.e. 1 (201) 333 4444. 1 is the access code in US) is not passed.  The UI will present the phone number following its own presentation convention
    string formattedNumber?;
    # The unique identifier of the object in a collection
    string itemID?;
};

# Code identifying the tag
public type StatutorydeductionssummaryImpoundinformationTagtype record {
    # Code identifying the type of data
    string dataTypeCode?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
    # The format of the property.  Possible values are date, date-time, uri
    string formatCode?;
};

# Summary of taxes
public type StatutoryDeductionsSummary record {
    # Payroll Accumulator Results
    StatutoryDeductionsSummaryPayrollAccumulation[] payrollAccumulations?;
    # Tax sections
    StatutoryDeductionsSummarySection[] statutoryDeductionsSummarySections?;
};

# A country subdivision correlating to a administrative level two levels below country. For example, in the United States, this might be a county
public type ImpoundaccountFinancialpartyAddressCountrysubdivisionlevel2 record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The type of a country sub-division, e.g. state, county
    string subdivisionType?;
};

# A country subdivision correlating to a administrative level one level below country. For example, in the United States, this would be a state
public type ImpoundaccountFinancialpartyAddressCountrysubdivisionlevel1 record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The type of a country sub-division, e.g. state, county
    string subdivisionType?;
};

public type PaySummaryMemoPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

# Units the quantity is based upon
public type MemossummaryMemoquantityUnitcode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type PaymentDistribution record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # The check or voucher number
    PayrolloutputsPaymentdocumentid paymentDocumentID?;
    # The amount of the associated payment item
    PayrolloutputsCheckamount checkAmount?;
    # The amount of the associated payment item
    PayrolloutputsCheckamount cashAmount?;
    # Direct deposit info
    DirectDeposit[] directDeposits?;
};

public type MemosSummarySection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    # Memos are items that are passed through payroll but not actually used during the calculation process
    MemoSummaryItem[] memosSummaryItems?;
};

# IncludedConfigurationTagType
public type EarningssummaryImpoundinformationConfigurationtags record {
    # A code identifying a tag
    string tagCode?;
    # Code identifying the tag
    EarningssummaryImpoundinformationTagtype tagType?;
    # The the values for the given instance
    string[] tagValues?;
};

# Describes impound details, as applicable, of related monies
public type PaymentdistributionssummaryDepositimpoundinformation record {
    # Indicate the party responsible for paying the taxes; values are ADP or Client
    EarningssummaryImpoundinformationImpoundpartycode impoundPartyCode?;
    # The accounts from which the associated monies will be impounded, as applicable
    Impoundaccount2 impoundAccount?;
    # Set of configuration tags relevant to the related instance
    StatutorydeductionssummaryImpoundinformationConfigurationtags[] configurationTags?;
};

# DEPRECATED - Use messageTypeCode instead. The processing results status code of the resource of the request.
public type PayrolloutputsConfirmmessageResourcestatuscode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type PayrollOutputsMeta record {
    # A collection of query criteria
    PayrollOutputsQueryCriterion[] queryCriteria?;
    ArrayType '\/payrollOutputs?;
    StringType '\/payrollOutputs\/itemID?;
    StringType '\/payrollOutputs\/payrollProcessingJobID?;
    StringCodeListType '\/payrollOutputs\/payrollRegionCode?;
    StringType '\/payrollOutputs\/payrollRegionCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollRegionCode\/shortName?;
    StringType '\/payrollOutputs\/payrollRegionCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollGroupCode?;
    StringType '\/payrollOutputs\/payrollGroupCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollGroupCode\/shortName?;
    StringType '\/payrollOutputs\/payrollGroupCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollScheduleReference?;
    StringType '\/payrollOutputs\/payrollScheduleReference\/payrollScheduleID?;
    StringType '\/payrollOutputs\/payrollScheduleReference\/scheduleEntryID?;
    StringType '\/payrollOutputs\/payrollScheduleReference\/payrollYear?;
    StringType '\/payrollOutputs\/payrollScheduleReference\/payrollWeekNumber?;
    StringType '\/payrollOutputs\/payrollScheduleReference\/payrollRunNumber?;
    StringCodeListType '\/payrollOutputs\/payrollProcessingJobStatusCode?;
    StringType '\/payrollOutputs\/payrollProcessingJobStatusCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollProcessingJobStatusCode\/shortName?;
    StringType '\/payrollOutputs\/payrollProcessingJobStatusCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary?;
    ObjectType '\/payrollOutputs\/payrollSummary\/earningsSummary?;
    ArrayType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/itemID?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/sectionCategory?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/sectionName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundPartyCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundPartyCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundPartyCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundPartyCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/BBAN?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/IBAN?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/UPIC?;
    ObjectType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/attentionOfName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/careOfName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineOne?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineTwo?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineThree?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/cityName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countryCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/postalCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate?;
    NumberType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineFour?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineFive?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/buildingNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/buildingName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/blockName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/unit?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/floor?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/stairCase?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/door?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/postOfficeBox?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/deliveryPoint?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/plotID?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    ObjectType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/idValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/SWIFTCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/idValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication?;
    ArrayType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/emailUri?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/notificationIndicator?;
    ObjectType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialAccount?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/accountNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/accountName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/typeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/currencyCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/impoundInformation\/configurationTags\/tagType\/formatCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/itemID?;
    ObjectType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/earningID?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/earningID\/idValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/earningID\/idDescription?;
    ArrayType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/earningID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/earningID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/earningID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/earningID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/earningID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/earningID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/earningID\/schemeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/earningClassificationCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/earningClassificationCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/earningClassificationCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/earningClassificationCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/earningAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/earningAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/earningAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/timeWorkedQuantity?;
    NumberType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/timeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/timeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/timeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/timeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/timeWorkedQuantity\/unitTimeCode\/longName?;
    ArrayType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/configurationTags?;
    StringType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/configurationTags\/itemID?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/configurationTags\/tagCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/configurationTags\/tagType\/formatCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/earningsSummary\/earningsSummarySections\/earningsSummaryItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/itemID?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/sectionCategory?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/sectionName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundPartyCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundPartyCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundPartyCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundPartyCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/BBAN?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/IBAN?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/UPIC?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/attentionOfName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/careOfName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineOne?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineTwo?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineThree?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/cityName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countryCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/postalCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate?;
    NumberType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineFour?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineFive?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/buildingNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/buildingName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/blockName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/unit?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/floor?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/stairCase?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/door?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/postOfficeBox?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/deliveryPoint?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/plotID?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/idValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/SWIFTCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/idValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/emailUri?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/notificationIndicator?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialAccount?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/accountNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/accountName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/typeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/currencyCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/impoundInformation\/configurationTags\/tagType\/formatCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/reportableEarningAndBenefitID?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/reportableEarningAndBenefitID\/idValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/reportableEarningAndBenefitID\/idDescription?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/reportableEarningAndBenefitID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/reportableEarningAndBenefitID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/reportableEarningAndBenefitID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/reportableEarningAndBenefitID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/reportableEarningAndBenefitID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/reportableEarningAndBenefitID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/reportableEarningAndBenefitID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/reportableEarningAndBenefitAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/reportableEarningAndBenefitAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/reportableEarningAndBenefitAmount\/currencyCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reportableEarningsAndBenefitsSummary\/reportableEarningsAndBenefitsSummarySections\/reportableEarningsAndBenefitsSummaryItems\/itemID?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/itemID?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/sectionCategory?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/sectionName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundPartyCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundPartyCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundPartyCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundPartyCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/BBAN?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/IBAN?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/UPIC?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/attentionOfName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/careOfName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineOne?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineTwo?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineThree?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/cityName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countryCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/postalCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate?;
    NumberType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineFour?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineFive?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/buildingNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/buildingName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/blockName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/unit?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/floor?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/stairCase?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/door?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/postOfficeBox?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/deliveryPoint?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/plotID?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/idValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/SWIFTCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/idValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/emailUri?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/notificationIndicator?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialAccount?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/accountNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/accountName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/typeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/currencyCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/impoundInformation\/configurationTags\/tagType\/formatCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/reimbursementID?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/reimbursementID\/idValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/reimbursementID\/idDescription?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/reimbursementID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/reimbursementID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/reimbursementID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/reimbursementID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/reimbursementID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/reimbursementID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/reimbursementID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/reimbursementAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/reimbursementAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/reimbursementAmount\/currencyCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/payrollSummary\/reimbursementsSummary\/reimbursementsSummarySections\/reimbursementsSummaryItems\/itemID?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary?;
    ArrayType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/itemID?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/sectionCategory?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/sectionName?;
    ArrayType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction\/countryCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction\/administrativeLevel1?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction\/administrativeLevel1\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction\/administrativeLevel1\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction\/administrativeLevel1\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction\/administrativeLevel1\/subdivisionType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction\/administrativeLevel2?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction\/administrativeLevel2\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction\/administrativeLevel2\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction\/administrativeLevel2\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction\/administrativeLevel2\/subdivisionType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction\/jurisdictionCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction\/jurisdictionCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction\/jurisdictionCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction\/jurisdictionCode\/longName?;
    BooleanType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction\/livedInIndicator?;
    BooleanType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryJurisdiction\/workedInIndicator?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryDeductionTypeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryDeductionTypeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryDeductionTypeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/statutoryDeductionTypeCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateDeductionAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateDeductionAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateDeductionAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateDeductionTakenAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateDeductionTakenAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateDeductionTakenAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateDeductionUntakenAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateDeductionUntakenAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateDeductionUntakenAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateDeductionInArrearsAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateDeductionInArrearsAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateDeductionInArrearsAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateDeductionCarryOverAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateDeductionCarryOverAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateDeductionCarryOverAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateTaxableAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateTaxableAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/associateTaxableAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/employerTaxableAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/employerTaxableAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/employerTaxableAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/employerPaidAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/employerPaidAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/employerPaidAmount\/currencyCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/configurationTags\/tagType\/formatCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundPartyCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundPartyCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundPartyCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundPartyCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/BBAN?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/IBAN?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/UPIC?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/attentionOfName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/careOfName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/lineOne?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/lineTwo?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/lineThree?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/cityName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/countryCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/postalCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate?;
    NumberType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/lineFour?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/lineFive?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/buildingNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/buildingName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/blockName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/streetName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/unit?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/floor?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/stairCase?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/door?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/postOfficeBox?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/deliveryPoint?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/plotID?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/idValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/SWIFTCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/idValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication?;
    ArrayType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/emailUri?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/notificationIndicator?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialAccount?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialAccount\/accountNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialAccount\/accountName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialAccount\/typeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/impoundAccount\/financialAccount\/currencyCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/impoundInformation\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/payrollSummary\/statutoryDeductionsSummary\/statutoryDeductionsSummarySections\/statutoryDeductionsSummaryItems\/itemID?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary?;
    ArrayType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/itemID?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/sectionCategory?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/sectionName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundPartyCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundPartyCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundPartyCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundPartyCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/BBAN?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/IBAN?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/UPIC?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/attentionOfName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/careOfName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineOne?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineTwo?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineThree?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/cityName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countryCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/postalCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate?;
    NumberType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineFour?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/lineFive?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/buildingNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/buildingName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/blockName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/unit?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/floor?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/stairCase?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/door?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/postOfficeBox?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/deliveryPoint?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/plotID?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/idValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/SWIFTCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/idValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication?;
    ArrayType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/emailUri?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/notificationIndicator?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialAccount?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/accountNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/accountName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/typeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/impoundAccount\/financialAccount\/currencyCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/impoundInformation\/configurationTags\/tagType\/formatCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/deductionID?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/deductionID\/idValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/deductionID\/idDescription?;
    ArrayType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/deductionID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/deductionID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/deductionID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/deductionID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/deductionID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/deductionID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/deductionID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/associateDeductionAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/associateDeductionAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/associateDeductionAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/associateDeductionTakenAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/associateDeductionTakenAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/associateDeductionTakenAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/associateDeductionUntakenAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/associateDeductionUntakenAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/associateDeductionUntakenAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/associateDeductionInArrearsAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/associateDeductionInArrearsAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/associateDeductionInArrearsAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/associateDeductionCarryOverAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/associateDeductionCarryOverAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/associateDeductionCarryOverAmount\/currencyCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/payrollSummary\/nonStatutoryDeductionsSummary\/nonStatutoryDeductionSummarySections\/nonStatutoryDeductionsSummaryItems\/itemID?;
    ObjectType '\/payrollOutputs\/payrollSummary\/memosSummary?;
    ArrayType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/itemID?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/sectionCategory?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/sectionName?;
    ArrayType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems?;
    ObjectType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoID?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoID\/idValue?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoID\/idDescription?;
    ArrayType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoQuantity?;
    NumberType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoQuantity\/unitCode?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoQuantity\/unitCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoQuantity\/unitCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/memoQuantity\/unitCode\/longName?;
    ArrayType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/payrollSummary\/memosSummary\/memosSummarySections\/memosSummaryItems\/itemID?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalPayDocumentQuantities?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalPayDocumentQuantities\/payDocumentTypeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalPayDocumentQuantities\/payDocumentTypeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalPayDocumentQuantities\/payDocumentTypeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalPayDocumentQuantities\/payDocumentTypeCode\/longName?;
    NumberType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalPayDocumentQuantities\/totalPayDocumentQuantity?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalCheckAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalCheckAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalCheckAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalCashAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalCashAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalCashAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundPartyCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundPartyCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundPartyCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundPartyCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/BBAN?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/IBAN?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/UPIC?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/nameCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/attentionOfName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/careOfName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/lineOne?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/lineTwo?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/lineThree?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/cityName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/countryCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/postalCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate?;
    NumberType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/scriptCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/lineFour?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/lineFive?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/buildingNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/buildingName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/blockName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/streetName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/unit?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/floor?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/stairCase?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/door?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/postOfficeBox?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/deliveryPoint?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/plotID?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/financialPartyID?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/financialPartyID\/idValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/SWIFTCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/branchNameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/branchNameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/branchNameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/branchNameCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/routingTransitID?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/routingTransitID\/idValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/emails?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/emails\/emailUri?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/emails\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/emails\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/notificationIndicator?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialAccount?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialAccount\/accountNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialAccount\/accountName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialAccount\/typeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialAccount\/typeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialAccount\/typeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialAccount\/typeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/impoundAccount\/financialAccount\/currencyCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/depositImpoundInformation\/configurationTags\/tagType\/formatCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundPartyCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundPartyCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundPartyCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundPartyCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/BBAN?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/IBAN?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/UPIC?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/nameCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/attentionOfName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/careOfName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/lineOne?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/lineTwo?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/lineThree?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/cityName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/countryCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/postalCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate?;
    NumberType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/scriptCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/lineFour?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/lineFive?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/buildingNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/buildingName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/blockName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/streetName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/unit?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/floor?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/stairCase?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/door?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/postOfficeBox?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/deliveryPoint?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/plotID?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/financialPartyID?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/financialPartyID\/idValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/SWIFTCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/branchNameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/branchNameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/branchNameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/branchNameCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/routingTransitID?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/routingTransitID\/idValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/emails?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/emails\/emailUri?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/emails\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/emails\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/notificationIndicator?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialAccount?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialAccount\/accountNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialAccount\/accountName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialAccount\/typeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialAccount\/typeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialAccount\/typeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialAccount\/typeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/impoundAccount\/financialAccount\/currencyCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/checkImpoundInformation\/configurationTags\/tagType\/formatCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/itemID?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/depositID?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/depositID\/idValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/depositID\/idDescription?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/depositID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/depositID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/depositID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/depositID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/depositID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/depositID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/depositID\/schemeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/financialAccountTypeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/financialAccountTypeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/financialAccountTypeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/financialAccountTypeCode\/longName?;
    NumberType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/totalDepositQuantity?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/totalDepositAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/totalDepositAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/totalDirectDeposits\/totalDepositAmount\/currencyCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/configurationTags?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/configurationTags\/itemID?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/configurationTags\/tagCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/configurationTags\/tagType\/formatCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/configurationTags\/tagValues?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/links?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/links\/href?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/links\/rel?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/links\/title?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/links\/targetSchema?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/links\/mediaType?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/links\/method?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/links\/encType?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/links\/schema?;
    ArrayType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/links\/payLoadArguments?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/links\/payLoadArguments\/argumentPath?;
    StringType '\/payrollOutputs\/payrollSummary\/paymentDistributionsSummary\/links\/payLoadArguments\/argumentValue?;
    ArrayType '\/payrollOutputs\/payrollSummary\/payrollAdjustments?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/payrollAdjustments\/adjustmentTypeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/payrollAdjustments\/adjustmentTypeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/payrollAdjustments\/adjustmentTypeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/payrollAdjustments\/adjustmentTypeCode\/longName?;
    NumberType '\/payrollOutputs\/payrollSummary\/payrollAdjustments\/totalAdjustmentQuantity?;
    ObjectType '\/payrollOutputs\/payrollSummary\/payrollAdjustments\/totalAdjustmentAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/payrollAdjustments\/totalAdjustmentAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/payrollAdjustments\/totalAdjustmentAmount\/currencyCode?;
    StringType '\/payrollOutputs\/payrollSummary\/payrollAdjustments\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/thirdPartyPaymentTypeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/thirdPartyPaymentTypeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/thirdPartyPaymentTypeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/thirdPartyPaymentTypeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/thirdPartyCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/thirdPartyCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/thirdPartyCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/thirdPartyCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/totalThirdPartyPaymentAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/totalThirdPartyPaymentAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/totalThirdPartyPaymentAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundPartyCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundPartyCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundPartyCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundPartyCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/BBAN?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/IBAN?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/UPIC?;
    ObjectType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/nameCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/attentionOfName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/careOfName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/lineOne?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/lineTwo?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/lineThree?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/cityName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/countryCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/postalCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate?;
    NumberType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/scriptCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/lineFour?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/lineFive?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/buildingNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/buildingName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/blockName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/streetName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/streetTypeCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/unit?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/floor?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/stairCase?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/door?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/postOfficeBox?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/deliveryPoint?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/plotID?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    ObjectType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/idValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/financialPartyID\/schemeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/SWIFTCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/branchNameCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/idValue?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/routingTransitID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication?;
    ArrayType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/emailUri?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/emails\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/countryDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/areaDialing?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/dialNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/extension?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/access?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/formattedNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/internetAddresses\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/uri?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/itemID?;
    BooleanType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialParty\/communication\/instantMessages\/notificationIndicator?;
    ObjectType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialAccount?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialAccount\/accountNumber?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialAccount\/accountName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialAccount\/typeCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/codeValue?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/shortName?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialAccount\/typeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/impoundAccount\/financialAccount\/currencyCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/impoundInformation\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/payrollSummary\/thirdPartyPayments\/itemID?;
    ArrayType '\/payrollOutputs\/payrollSummary\/configurationTags?;
    StringType '\/payrollOutputs\/payrollSummary\/configurationTags\/itemID?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/configurationTags\/tagCode?;
    ObjectType '\/payrollOutputs\/payrollSummary\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/payrollSummary\/configurationTags\/tagType\/formatCode?;
    ArrayType '\/payrollOutputs\/payrollSummary\/configurationTags\/tagValues?;
    ArrayType '\/payrollOutputs\/payrollSummary\/links?;
    StringType '\/payrollOutputs\/payrollSummary\/links\/href?;
    StringType '\/payrollOutputs\/payrollSummary\/links\/rel?;
    StringType '\/payrollOutputs\/payrollSummary\/links\/canonicalUri?;
    StringType '\/payrollOutputs\/payrollSummary\/links\/title?;
    StringType '\/payrollOutputs\/payrollSummary\/links\/targetSchema?;
    StringType '\/payrollOutputs\/payrollSummary\/links\/mediaType?;
    StringType '\/payrollOutputs\/payrollSummary\/links\/method?;
    StringType '\/payrollOutputs\/payrollSummary\/links\/encType?;
    StringType '\/payrollOutputs\/payrollSummary\/links\/schema?;
    ArrayType '\/payrollOutputs\/payrollSummary\/links\/payLoadArguments?;
    StringType '\/payrollOutputs\/payrollSummary\/links\/payLoadArguments\/argumentPath?;
    StringType '\/payrollOutputs\/payrollSummary\/links\/payLoadArguments\/argumentValue?;
    ArrayType '\/payrollOutputs\/associatePayments?;
    StringType '\/payrollOutputs\/associatePayments\/itemID?;
    StringType '\/payrollOutputs\/associatePayments\/associateOID?;
    ObjectType '\/payrollOutputs\/associatePayments\/payrollID?;
    StringType '\/payrollOutputs\/associatePayments\/payrollID\/idValue?;
    StringType '\/payrollOutputs\/associatePayments\/payrollID\/idDescription?;
    ArrayType '\/payrollOutputs\/associatePayments\/payrollID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payrollID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/associatePayments\/payrollID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payrollID\/schemeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payrollID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payrollID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payrollID\/schemeCode\/longName?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/itemID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDate?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/payPeriodStartDate?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/payPeriodEndDate?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/itemID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/sectionCategory?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/sectionName?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/earningID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/earningID\/idValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/earningID\/idDescription?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/earningID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/earningID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/earningID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/earningID\/schemeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/earningID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/earningID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/earningID\/schemeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/earningClassificationCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/earningClassificationCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/earningClassificationCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/earningClassificationCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/earningAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/earningAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/earningAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/timeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/timeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/timeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/timeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/timeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/timeWorkedQuantity\/unitTimeCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payRate?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payRate\/rateValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payRate\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payRate\/unitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payRate\/unitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payRate\/unitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payRate\/unitCode\/longName?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payRate\/baseUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payRate\/baseUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payRate\/baseUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payRate\/baseUnitCode\/longName?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payRate\/baseMultiplierValue?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/links?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/links\/href?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/links\/rel?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/links\/canonicalUri?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/links\/title?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/links\/targetSchema?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/links\/mediaType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/links\/method?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/links\/encType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/links\/schema?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/links\/payLoadArguments?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/links\/payLoadArguments\/argumentPath?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/earnings\/earningsSections\/earningsItems\/links\/payLoadArguments\/argumentValue?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/itemID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/sectionCategory?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/sectionName?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/idValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/idDescription?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/schemeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitAmount\/currencyCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/href?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/rel?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/canonicalUri?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/title?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/targetSchema?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/mediaType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/method?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/encType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/schema?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/payLoadArguments?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/payLoadArguments\/argumentPath?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/payLoadArguments\/argumentValue?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/itemID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/sectionCategory?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/sectionName?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/idValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/idDescription?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/schemeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementAmount\/currencyCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/href?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/rel?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/canonicalUri?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/title?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/targetSchema?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/mediaType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/method?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/encType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/schema?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/payLoadArguments?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/payLoadArguments\/argumentPath?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/payLoadArguments\/argumentValue?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/itemID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/sectionCategory?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/sectionName?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/countryCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel1?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel1\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel1\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel1\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel1\/subdivisionType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel2?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel2\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel2\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel2\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel2\/subdivisionType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/jurisdictionCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/jurisdictionCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/jurisdictionCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/jurisdictionCode\/longName?;
    BooleanType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/livedInIndicator?;
    BooleanType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/workedInIndicator?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryDeductionTypeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryDeductionTypeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryDeductionTypeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryDeductionTypeCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionTakenAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionTakenAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionTakenAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionUntakenAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionUntakenAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionUntakenAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionInArrearsAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionInArrearsAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionInArrearsAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionCarryOverAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionCarryOverAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionCarryOverAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateTaxableAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateTaxableAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateTaxableAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/employerTaxableAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/employerTaxableAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/employerTaxableAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/employerPaidAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/employerPaidAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/employerPaidAmount\/currencyCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/href?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/rel?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/canonicalUri?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/title?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/targetSchema?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/mediaType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/method?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/encType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/schema?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/payLoadArguments?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/payLoadArguments\/argumentPath?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/payLoadArguments\/argumentValue?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/itemID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/sectionCategory?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/sectionName?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/idValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/idDescription?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/schemeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionTakenAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionTakenAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionTakenAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionUntakenAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionUntakenAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionUntakenAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionInArrearsAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionInArrearsAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionInArrearsAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionCarryOverAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionCarryOverAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionCarryOverAmount\/currencyCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/href?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/rel?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/canonicalUri?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/title?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/targetSchema?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/mediaType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/method?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/encType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/schema?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/payLoadArguments?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/payLoadArguments\/argumentPath?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/payLoadArguments\/argumentValue?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/itemID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/sectionCategory?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/sectionName?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoID\/idValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoID\/idDescription?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoID\/schemeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoQuantity\/unitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoQuantity\/unitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoQuantity\/unitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/memoQuantity\/unitCode\/longName?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/links?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/links\/href?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/links\/rel?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/links\/canonicalUri?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/links\/title?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/links\/targetSchema?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/links\/mediaType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/links\/method?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/links\/encType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/links\/schema?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/links\/payLoadArguments?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/links\/payLoadArguments\/argumentPath?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/memos\/memosSections\/memoItems\/links\/payLoadArguments\/argumentValue?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/configurationTags?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/configurationTags\/itemID?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/configurationTags\/tagCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/configurationTags\/tagType\/formatCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentSummary\/configurationTags\/tagValues?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/itemID?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/payAllocationID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/payAllocationID\/idValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/payAllocationID\/idDescription?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/payAllocationID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/payAllocationID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/payAllocationID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/payAllocationID\/schemeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/payAllocationID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/payAllocationID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/payAllocationID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/itemID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/sectionCategory?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/sectionName?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/earningID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/earningID\/idValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/earningID\/idDescription?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/earningID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/earningID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/earningID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/earningID\/schemeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/earningID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/earningID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/earningID\/schemeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/earningClassificationCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/earningClassificationCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/earningClassificationCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/earningClassificationCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/earningAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/earningAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/earningAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/timeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/timeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/timeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/timeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/timeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/timeWorkedQuantity\/unitTimeCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payRate?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payRate\/rateValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payRate\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payRate\/unitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payRate\/unitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payRate\/unitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payRate\/unitCode\/longName?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payRate\/baseUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payRate\/baseUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payRate\/baseUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payRate\/baseUnitCode\/longName?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payRate\/baseMultiplierValue?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/links?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/links\/href?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/links\/rel?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/links\/canonicalUri?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/links\/title?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/links\/targetSchema?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/links\/mediaType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/links\/method?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/links\/encType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/links\/schema?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/links\/payLoadArguments?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/links\/payLoadArguments\/argumentPath?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/earnings\/earningsSections\/earningsItems\/links\/payLoadArguments\/argumentValue?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/itemID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/sectionCategory?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/sectionName?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/idValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/idDescription?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/schemeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/reportableEarningAndBenefitAmount\/currencyCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/href?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/rel?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/canonicalUri?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/title?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/targetSchema?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/mediaType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/method?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/encType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/schema?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/payLoadArguments?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/payLoadArguments\/argumentPath?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reportableEarningsAndBenefits\/reportableEarningsAndBenefitsSections\/reportableEarningsAndBenefitsItems\/links\/payLoadArguments\/argumentValue?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/itemID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/sectionCategory?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/sectionName?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/idValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/idDescription?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/schemeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/reimbursementAmount\/currencyCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/href?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/rel?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/canonicalUri?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/title?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/targetSchema?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/mediaType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/method?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/encType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/schema?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/payLoadArguments?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/payLoadArguments\/argumentPath?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/reimbursements\/reimbursementsSections\/reimbursementsItems\/links\/payLoadArguments\/argumentValue?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/itemID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/sectionCategory?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/sectionName?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/countryCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel1?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel1\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel1\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel1\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel1\/subdivisionType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel2?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel2\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel2\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel2\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/administrativeLevel2\/subdivisionType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/jurisdictionCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/jurisdictionCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/jurisdictionCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/jurisdictionCode\/longName?;
    BooleanType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/livedInIndicator?;
    BooleanType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryJurisdiction\/workedInIndicator?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryDeductionTypeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryDeductionTypeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryDeductionTypeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/statutoryDeductionTypeCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionTakenAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionTakenAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionTakenAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionUntakenAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionUntakenAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionUntakenAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionInArrearsAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionInArrearsAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionInArrearsAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionCarryOverAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionCarryOverAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateDeductionCarryOverAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateTaxableAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateTaxableAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/associateTaxableAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/employerTaxableAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/employerTaxableAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/employerTaxableAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/employerPaidAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/employerPaidAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/employerPaidAmount\/currencyCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/href?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/rel?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/canonicalUri?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/title?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/targetSchema?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/mediaType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/method?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/encType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/schema?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/payLoadArguments?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/payLoadArguments\/argumentPath?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/statutoryDeductions\/statutoryDeductionsSections\/statutoryDeductionsItems\/links\/payLoadArguments\/argumentValue?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/itemID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/sectionCategory?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/sectionName?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/idValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/idDescription?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/schemeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/deductionID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionTakenAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionTakenAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionTakenAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionUntakenAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionUntakenAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionUntakenAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionInArrearsAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionInArrearsAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionInArrearsAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionCarryOverAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionCarryOverAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/associateDeductionCarryOverAmount\/currencyCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/href?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/rel?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/canonicalUri?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/title?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/targetSchema?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/mediaType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/method?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/encType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/schema?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/payLoadArguments?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/payLoadArguments\/argumentPath?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/nonStatutoryDeductions\/nonStatutoryDeductionSections\/nonStatutoryDeductionsItems\/links\/payLoadArguments\/argumentValue?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/itemID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/sectionCategory?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/sectionName?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoID\/idValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoID\/idDescription?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoID\/schemeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoQuantity\/unitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoQuantity\/unitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoQuantity\/unitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/memoQuantity\/unitCode\/longName?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorTimeUnitCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorTimeUnitCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorTimeUnitCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatorTimeUnitCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/quantityValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/accumulatedTimeWorkedQuantity\/unitTimeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/payrollAccumulations\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/configurationTags?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/configurationTags\/tagCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/configurationTags\/tagValues?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/configurationTags\/tagType\/formatCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/links?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/links\/href?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/links\/rel?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/links\/canonicalUri?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/links\/title?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/links\/targetSchema?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/links\/mediaType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/links\/method?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/links\/encType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/links\/schema?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/links\/payLoadArguments?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/links\/payLoadArguments\/argumentPath?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/memos\/memosSections\/memoItems\/links\/payLoadArguments\/argumentValue?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/configurationTags?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/configurationTags\/itemID?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/configurationTags\/tagCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/configurationTags\/tagType\/formatCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentAllocations\/configurationTags\/tagValues?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/itemID?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/paymentDocumentID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/paymentDocumentID\/idValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/paymentDocumentID\/idDescription?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/paymentDocumentID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/paymentDocumentID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/paymentDocumentID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/paymentDocumentID\/schemeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/paymentDocumentID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/paymentDocumentID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/paymentDocumentID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/checkAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/checkAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/checkAmount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/cashAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/cashAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/cashAmount\/currencyCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/itemID?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositID\/idValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositID\/idDescription?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositID\/alternateDescriptions?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositID\/alternateDescriptions\/languageCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositID\/alternateDescriptions\/idDescription?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositID\/schemeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/BBAN?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/IBAN?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/UPIC?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/nameCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/nameCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/nameCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/nameCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/attentionOfName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/careOfName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/lineOne?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/lineTwo?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/lineThree?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/cityName?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/countrySubdivisionLevel1?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/countryCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/postalCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/geoCoordinate?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/scriptCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/scriptCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/scriptCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/scriptCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/lineFour?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/lineFive?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/buildingNumber?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/buildingName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/blockName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/streetName?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/streetTypeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/streetTypeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/streetTypeCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/unit?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/floor?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/stairCase?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/door?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/postOfficeBox?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/deliveryPoint?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/plotID?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/countrySubdivisionLevel2?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/financialPartyID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/financialPartyID\/idValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/financialPartyID\/schemeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/financialPartyID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/financialPartyID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/financialPartyID\/schemeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/SWIFTCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/branchNameCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/branchNameCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/branchNameCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/branchNameCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/routingTransitID?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/routingTransitID\/idValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/routingTransitID\/schemeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/routingTransitID\/schemeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/routingTransitID\/schemeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/routingTransitID\/schemeCode\/longName?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/landlines?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/landlines\/nameCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/landlines\/nameCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/landlines\/countryDialing?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/landlines\/areaDialing?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/landlines\/dialNumber?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/landlines\/extension?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/landlines\/access?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/landlines\/formattedNumber?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/landlines\/itemID?;
    BooleanType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/mobiles?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/mobiles\/nameCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/mobiles\/countryDialing?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/mobiles\/areaDialing?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/mobiles\/dialNumber?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/mobiles\/extension?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/mobiles\/access?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/mobiles\/formattedNumber?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/mobiles\/itemID?;
    BooleanType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/emails?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/emails\/nameCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/emails\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/emails\/nameCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/emails\/emailUri?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/emails\/itemID?;
    BooleanType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/emails\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/socialNetworks?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/socialNetworks\/nameCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/socialNetworks\/uri?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/socialNetworks\/itemID?;
    BooleanType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/faxes?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/faxes\/nameCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/faxes\/nameCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/faxes\/countryDialing?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/faxes\/areaDialing?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/faxes\/dialNumber?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/faxes\/extension?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/faxes\/access?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/faxes\/formattedNumber?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/faxes\/itemID?;
    BooleanType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/pagers?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/pagers\/nameCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/pagers\/nameCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/pagers\/countryDialing?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/pagers\/areaDialing?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/pagers\/dialNumber?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/pagers\/extension?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/pagers\/access?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/pagers\/formattedNumber?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/pagers\/itemID?;
    BooleanType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/internetAddresses?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/internetAddresses\/nameCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/internetAddresses\/uri?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/internetAddresses\/itemID?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/instantMessages?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/instantMessages\/nameCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/instantMessages\/uri?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/instantMessages\/itemID?;
    BooleanType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialParty\/communication\/instantMessages\/notificationIndicator?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialAccount?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialAccount\/accountNumber?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialAccount\/accountName?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialAccount\/typeCode?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialAccount\/typeCode\/codeValue?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialAccount\/typeCode\/shortName?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialAccount\/typeCode\/longName?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAccount\/financialAccount\/currencyCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAmount?;
    # Context rules for a given object
    AmountValueType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAmount\/amountValue?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/paymentDistributions\/directDeposits\/depositAmount\/currencyCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/configurationTags?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/configurationTags\/itemID?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/configurationTags\/tagCode?;
    ObjectType '\/payrollOutputs\/associatePayments\/payments\/configurationTags\/tagType?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/configurationTags\/tagType\/dataTypeCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/configurationTags\/tagType\/currencyCode?;
    StringCodeListType '\/payrollOutputs\/associatePayments\/payments\/configurationTags\/tagType\/formatCode?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/configurationTags\/tagValues?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/links?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/links\/href?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/links\/rel?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/links\/canonicalUri?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/links\/title?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/links\/targetSchema?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/links\/mediaType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/links\/method?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/links\/encType?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/links\/schema?;
    ArrayType '\/payrollOutputs\/associatePayments\/payments\/links\/payLoadArguments?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/links\/payLoadArguments\/argumentPath?;
    StringType '\/payrollOutputs\/associatePayments\/payments\/links\/payLoadArguments\/argumentValue?;
    ArrayType '\/payrollOutputs\/associatePayments\/links?;
    StringType '\/payrollOutputs\/associatePayments\/links\/href?;
    StringType '\/payrollOutputs\/associatePayments\/links\/rel?;
    StringType '\/payrollOutputs\/associatePayments\/links\/canonicalUri?;
    StringType '\/payrollOutputs\/associatePayments\/links\/title?;
    StringType '\/payrollOutputs\/associatePayments\/links\/targetSchema?;
    StringType '\/payrollOutputs\/associatePayments\/links\/mediaType?;
    StringType '\/payrollOutputs\/associatePayments\/links\/method?;
    StringType '\/payrollOutputs\/associatePayments\/links\/encType?;
    StringType '\/payrollOutputs\/associatePayments\/links\/schema?;
    ArrayType '\/payrollOutputs\/associatePayments\/links\/payLoadArguments?;
    StringType '\/payrollOutputs\/associatePayments\/links\/payLoadArguments\/argumentPath?;
    StringType '\/payrollOutputs\/associatePayments\/links\/payLoadArguments\/argumentValue?;
    ArrayType '\/payrollOutputs\/links?;
    StringType '\/payrollOutputs\/links\/href?;
    StringType '\/payrollOutputs\/links\/rel?;
    StringType '\/payrollOutputs\/links\/canonicalUri?;
    StringType '\/payrollOutputs\/links\/title?;
    StringType '\/payrollOutputs\/links\/targetSchema?;
    StringType '\/payrollOutputs\/links\/mediaType?;
    StringType '\/payrollOutputs\/links\/method?;
    StringType '\/payrollOutputs\/links\/encType?;
    StringType '\/payrollOutputs\/links\/schema?;
    ArrayType '\/payrollOutputs\/links\/payLoadArguments?;
    StringType '\/payrollOutputs\/links\/payLoadArguments\/argumentPath?;
    StringType '\/payrollOutputs\/links\/payLoadArguments\/argumentValue?;
};

public type CodeListType record {
    # Code list title
    string codeListTitle?;
    IndicatorType exclusiveIndicator?;
    CodeListItemType[] listItems?;
    LinktypeV02[] links?;
};

public type StatutoryDeductionPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

# Configuration Tags
public type EarningssummaryConfigurationtags record {
    # A code identifying a tag
    string tagCode?;
    # The type of tag
    TagTypePayeePayInput tagType?;
    # The the values for the given instance
    string[] tagValues?;
};

public type PaySummaryReimbursementsSection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    # Reimbursement items
    PaySummaryReimbursementAllocationItem[] reimbursementsItems?;
};

# List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
public type DependencyListType record {
};

# Each object contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).
public type PayrolloutputsConfirmmessageProcessmessages record {
    # An identifier for the instance of the process message.
    PayrolloutputsConfirmmessageProcessmessageid processMessageID?;
    # Process Message instances may be of type: success, warning, error, or info.
    PayrolloutputsConfirmmessageMessagetypecode messageTypeCode?;
    # Expression that provides the location (or source) of content in a message instance that is associated with a process message. Examples of expression languages include: XPath, XQuery, JSON Pointer.
    string sourceLocationExpression?;
    # Identifies the language used for expressions communicated in this message.
    PayrolloutputsConfirmmessageExpressionlanguagecode expressionLanguageCode?;
    PayrolloutputsPayrollsummaryLinks[] links?;
    # Message returned to the user
    PayrolloutputsConfirmmessageUsermessage userMessage?;
    # Message returned to the user
    PayrolloutputsConfirmmessageUsermessage developerMessage?;
};

public type EarningItemBasePayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

# The tax authority jurisdiction
public type StatutorydeductionssummaryStatutoryjurisdiction record {
    # A simple (string) code.  Can have a code list reference
    string countryCode?;
    # A country subdivision correlating to a administrative level one level below country. For example, in the United States, this would be a state
    ImpoundaccountFinancialpartyAddressCountrysubdivisionlevel1 administrativeLevel1?;
    # A country subdivision correlating to a administrative level two level below country. For example, in the United States, this would be a county
    StatutorydeductionssummaryStatutoryjurisdictionAdministrativelevel2 administrativeLevel2?;
    # The tax jurisdiction code
    StatutorydeductionssummaryStatutoryjurisdictionJurisdictioncode jurisdictionCode?;
    # Indicates whether the related jurisdiction is lived in
    boolean livedInIndicator?;
    # Indicates whether the related jurisdiction is worked in
    boolean workedInIndicator?;
};

public type UriType string;

# The distribution target, e.g. bank account info
public type PayrolloutputsDepositaccount record {
    # Basic Bank Account Number. The BBAN format is decided by each national banking community under the restriction that it must be of a fixed length of case-insensitive alphanumeric characters. It includes the domestic bank account number, branch identifier, and potential routing information
    string BBAN?;
    # International Bank Account Number. The IBAN consists of up to 34 alphanumeric characters: first the two-letter ISO 3166-1 alpha-2 country code, then two check digits, and finally a country-specific Basic Bank Account Number (BBAN). The check digits enable a sanity check of the bank account number to confirm its integrity even before submitting a transaction. 
    string IBAN?;
    # Universal Payment Identification Code. A UPIC is an identifier (or banking address) for a bank account in the United States used to receive electronic credit payments. A UPIC acts exactly like a US bank account number and protects your sensitive banking information. The actual bank account number, including the bank's routing transit number, is masked by the UPIC. Only credit transactions to an account can be initiated with a UPIC. All direct debits are blocked which should mitigate unauthorized transactions to an account.
    string UPIC?;
    # The account where the monies are to be distributed
    Impoundaccount1Financialparty financialParty?;
    # The account where the moneis are to be distributed
    ImpoundaccountFinancialaccount financialAccount?;
};

public type PayAllocationStatutoryDeductionsSection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    #  Tax deductions
    PayAllocationStatutoryDeductionItem[] statutoryDeductionsItems?;
};

# Communication mechanisms, e,g, phone, email, etc
public type Impoundaccount1FinancialpartyCommunication record {
    # A list of land-line telephone numbers
    Impoundaccount1FinancialpartyCommunicationLandlines[] landlines?;
    # A list of mobile telephone numbers
    Impoundaccount1FinancialpartyCommunicationLandlines[] mobiles?;
    # A list of email addresses
    EmailContactCommunicationType[] emails?;
    # A list of social networks addresses
    SocialNetworkContactCommunicationType[] socialNetworks?;
    # A list of fax telephone numbers
    Impoundaccount1FinancialpartyCommunicationLandlines[] faxes?;
    # A list of pager telephone numbers
    Impoundaccount1FinancialpartyCommunicationLandlines[] pagers?;
    # A list of internet URIs
    InternetAddressWithItemID[] internetAddresses?;
    # A list of instant messages URIs
    ImpoundaccountFinancialpartyCommunicationInstantmessages[] instantMessages?;
};

# The total check amount
public type PaymentdistributionssummaryTotalcheckamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # Standard currency code as per ISO 4212
    string currencyCode?;
};

public type PaySummaryReimbursementAllocationItem record {
    # An identifier for a payroll item, e.g. an earning code or a policy type
    ReimbursementssummaryReimbursementid reimbursementID?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount reimbursementAmount?;
    # Payroll Accumulator Results
    ReimbursementItemBasePayrollAccumulation[] payrollAccumulations?;
    # Set of configuration tags relevant to the related instance
    StatutorydeductionssummaryImpoundinformationConfigurationtags[] configurationTags?;
    # The unique identifier of a instance within the collection
    string itemID?;
    PaysummaryearningLinks[] links?;
};

# Taxes
public type PayAllocationStatutoryDeduction record {
    # Payroll Accumulator Results
    PayAllocationStatutoryDeductionPayrollAccumulation[] payrollAccumulations?;
    # Tax sections
    PayAllocationStatutoryDeductionsSection[] statutoryDeductionsSections?;
};

# Code identifying the tag
public type EarningssummaryImpoundinformationTagtype record {
    # Code identifying the type of data
    string dataTypeCode?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
    # The format of the property. Possible values are date, date-time, uri
    string formatCode?;
};

public type PaySummaryEarningsSection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    # Earnings allocation section
    PaySummaryEarningItem[] earningsItems?;
};

public type TotalPayDocumentQuantities record {
    # The type of pay document, e.g paycheck, voucher, eVoucher, void paycheck.
    PaymentdistributionssummaryPaydocumenttypecode payDocumentTypeCode?;
    # The total number of the associated pay document type code resulting from a given payroll
    decimal totalPayDocumentQuantity?;
};

public type CodelistitemtypeV02 record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    # Additional list item description
    string valueDescription?;
    # Allows for filtering the code list
    string foreignKey?;
    # Boolean expression
    IndicatortypeV01 inactiveIndicator?;
    # Boolean expression
    IndicatortypeV01 defaultIndicator?;
};

# The coordinates of the location of the address
public type ImpoundaccountFinancialpartyAddressGeocoordinate record {
    # The angle, in degrees, of a position on Earth above the equator. (Latitude is negative for a place below the equator.) specified in decimal degrees
    decimal latitude?;
    # The angle, in degrees, of a position on Earth around the equator from the Greenwich Meridian specified in decimal degrees
    decimal longitude?;
};

public type ReimbursementsSummaryPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

# Memos are items that are passed through payroll but not actually used during the calculation process
public type PaySummaryMemo record {
    # Payroll Accumulator Results
    PaySummaryMemoPayrollAccumulation[] payrollAccumulations?;
    # memos
    PaySummaryMemoSection[] memosSections?;
};

public type CodeListItemType record {
    # The code value for the related entity
    string code?;
    # The code name for description of the related code
    string name?;
    # Additional list item description
    string valueDescription?;
    # Allows for specifying the pattern (regex) for validating the list values
    string valuePattern?;
    # Allows for filtering the code list
    string filter?;
    IndicatorType inactiveIndicator?;
    IndicatorType defaultIndicator?;
    LinktypeV02[] links?;
};

public type PaySummaryReportableEarningsAndBenefitsSection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    # Earnings and or benefits that must be reported for the purpose of taxation but do not count toward gross or net
    PaySummaryReportableEarningsBenefitsItem[] reportableEarningsAndBenefitsItems?;
};

# An identifier for a payroll item, e.g. an earning code or a policy type
public type ReimbursementssummaryReimbursementid record {
    # An actual ID value
    string idValue?;
    # ID description
    string idDescription?;
    EarningssummaryEarningidAlternatedescriptions[] alternateDescriptions?;
    # The scheme code
    ImpoundaccountFinancialpartyFinancialpartyidSchemecode schemeCode?;
};

# Process Message instances may be of type: success, warning, error, or info.
public type PayrolloutputsConfirmmessageMessagetypecode record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

# Taxes
public type PaySummaryStatutoryDeduction record {
    # Payroll Accumulator Results
    StatutoryDeductionPayrollAccumulation[] payrollAccumulations?;
    # Tax sections
    PaySummaryStatutoryDeductionsSection[] statutoryDeductionsSections?;
};

# Units the quantity is based upon
public type EarningssummaryAccumulatedtimeworkedquantityUnittimecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# Pay rate
public type PaysummaryearningPayrate record {
    # The numeric value associated to the rate. In the example 5 US dollars per hour, the number 5 is the rate value. In the example 3 bags of rice per month, the number 3 is the rate value. In the example, 20 percent of annual sales, the amountValue would be 20
    decimal rateValue?;
    # List of standard currency codes ISO 4217 For any given rate, either the currencyCode or the unitCode is present. In the example 5 US dollars per hour, the unitCode would not be present, and the currency code would be USD
    string currencyCode?;
    # For any given rate, either the currencyCode or the unitCode is present. In the example 3 bags of rice per month, currencyCode would not be present, and the unitCode would be bags of rice. In the example, 20 percent of annual sales, the unitCode would be percent
    PaysummaryearningPayrateUnitcode unitCode?;
    # For any given rate, the baseUnitCode is used to define the denominator of the rate, or rate over what. In the example 5 US dollars per hour, the baseUnitCode is hour. In the example 3 bags of rice per month, the baseUnitCode is month. If for example, the rate was 10 US dollars for every widget produced, the baseUnitCode would be widget. In the example, 20 percent of annual sales, the baseUnitCode would equate to annual sales
    PaysummaryearningPayrateBaseunitcode baseUnitCode?;
    # For any given rate, the base rate value is presumed to be 1, e.g. per one hour, per one month. If for example, the rate was 10 US dollars for every widget produced, the base rate value is presumed to be one and there is no need to communicate a baseMultiplierValue. If however, the rate was 10 US Dollars for every 3 widgets produced, the baseMultiplierValue would be 3
    decimal baseMultiplierValue?;
};

public type ReimbursementsSummarySection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    # Describes impound details, as applicable, of related monies
    EarningssummaryImpoundinformation impoundInformation?;
    # Reimbursement items
    ReimbursementsSummaryItem[] reimbursementsSummaryItems?;
};

# Meta contains the metadata associated with a response.  A GET response may include metadata to support pagination
public type PayrolloutputsMeta record {
    # The instance resource sequence (number) identifying the first resource returned in the response. The server generates this sequence.  It is used by the client to determine the start sequence of the subsequent Get request
    int startSequence?;
    # Indicates whether the response completes the return of all of the resources of the instance resource set to the requesting system
    boolean completeIndicator?;
    # Number of total instance resources in an instance resource set. Note: An instance resource set is a set of instance resources that is determined by a server to satisfy the sets membership criteria (i.e., selection, filter, expansion and search criteria) of a resource management operation (e.g. GET request) upon a collection resource
    int totalNumber?;
    # Unique identifier of the instance resource set.  It is generated by the server as a result of the original Get request
    string resourceSetID?;
    # A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
    PayrolloutputsMetaLinks[] links?;
};

public type StringCodeListType record {
    CodelisttypeV03 codeList?;
    IndicatorType readOnly?;
    IndicatorType optional?;
    IndicatorType hidden?;
    SequenceType sequence?;
    # Specified on a target property.  If the passed conditions are true then this property is disallowed and therefore, not presented to a user.
    DisallowItemType[] disallow?;
    # Provides a client defined UI label for the property which is less than an average of 20 characters in length.
    string shortLabelName?;
    # Provides a client defined UI long label for the property.
    string longLabelName?;
    # Indicates the minimum length required for a property.
    int minLength?;
    # Indicates the maximum length supported for a property
    int maxLength?;
    # Indicates the default value which should be populated by default
    string 'default?;
    # Indicates a regular expression on the required pattern for the value
    string pattern?;
    MaskingRuleType masking?;
    # Provides 1 to many properties which the value of this property must be equal to.  If the property is equal to any of the value of the properties then the validation is successful.
    string[] 'equals?;
    # The value of the related property must be greater than the value of  all the given properties in the array.
    string[] greaterThan?;
    # The value of the related property must be less than the value of all the given properties in the array.
    string[] lessThan?;
    # List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
    DependencyListType dependencies?;
    # Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
    HelperMessageType helperMessage?;
    MetaDataType dataType?;
    # A reference to the codelist extended with values
    ValueSetType valueSet?;
    LinktypeV02[] dependencyLinks?;
};

# Protocol-specific response status code.
public type PayrolloutputsConfirmmessageProtocolstatuscode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type PaySummaryNonStatutoryDeductionItem record {
    # An identifier for a payroll item, e.g. an deduction code or a policy type
    NonstatutorydeductionsummaryDeductionid deductionID?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionTakenAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionUntakenAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionInArrearsAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionCarryOverAmount?;
    # Payroll Accumulator Results
    DeductionItemBasePayrollAccumulation[] payrollAccumulations?;
    # Set of configuration tags relevant to the related instance
    StatutorydeductionssummaryImpoundinformationConfigurationtags[] configurationTags?;
    # The unique identifier of a instance within the collection
    string itemID?;
    PaysummaryearningLinks[] links?;
};

# A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type PaymentdistributionssummaryLinks record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    PaymentdistributionssummaryPayloadarguments[] payLoadArguments?;
};

# Simple (string) code identifying the http method used to invoke the API
public type HttpMethodType string;

# The unique identifier of the object in a collection
public type ItemidtypeV01 string;

# The value set item type
public type ValueSetItemType record {
    # The code for the related entity
    string idValue?;
    # Short description of the related code
    string itemDescription?;
    # Indicates if the current value is a default (pre-selected)
    boolean defaultIndicator?;
};

public type MemosSummaryPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

public type PaySummaryReportableEarningsBenefitsItem record {
    # An identifier for a payroll item, e.g. an memo code or a policy type
    ReportableearningsandbenefitssummaryReportableearningandbenefitid reportableEarningAndBenefitID?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount reportableEarningAndBenefitAmount?;
    # Payroll Accumulator Results
    ReportableEarningAndBenefitItemBasePayrollAccumulation[] payrollAccumulations?;
    # Set of configuration tags relevant to the related instance
    StatutorydeductionssummaryImpoundinformationConfigurationtags[] configurationTags?;
    # The unique identifier of a instance within the collection
    string itemID?;
    PaysummaryearningLinks[] links?;
};

public type DisallowItemType record {
    # A unique identifier of an object within the collection
    ItemIDType itemID?;
};

# The accumulator code.
public type EarningssummaryAccumulatorcode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type PaySummaryStatutoryDeductionItem record {
    # The tax authority jurisdiction
    StatutorydeductionssummaryStatutoryjurisdiction statutoryJurisdiction?;
    # The type of tax
    StatutorydeductionssummaryStatutorydeductiontypecode statutoryDeductionTypeCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionTakenAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionUntakenAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionInArrearsAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionCarryOverAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateTaxableAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount employerTaxableAmount?;
    # The statutory amount paid by the employer
    StatutorydeductionssummaryEmployerpaidamount employerPaidAmount?;
    # Payroll Accumulator Results
    PayrollAccumulations[] payrollAccumulations?;
    # Set of configuration tags relevant to the related instance
    StatutorydeductionssummaryImpoundinformationConfigurationtags[] configurationTags?;
    # The unique identifier of a instance within the collection
    string itemID?;
    PaysummaryearningLinks[] links?;
};

public type PayAllocationReportableEarningsAndBenefitsSection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    # Earnings and or benefits that must be reported for the purpose of taxation but do not count toward gross or net
    PayAllocationReportableEarningsBenefitsItem[] reportableEarningsAndBenefitsItems?;
};

# Non-tax deductions 
public type PaySummaryNonStatutoryDeduction record {
    # Payroll Accumulator Results
    NonStatutoryDeductionPayrollAccumulation[] payrollAccumulations?;
    # Non-tax deductions
    PaySummaryNonStatutoryDeductionSection[] nonStatutoryDeductionSections?;
};

# Summary of reportable earnings and benefits
public type ReportableEarningsAndBenefitsSummary record {
    # Payroll Accumulator Results
    ReportableEarningsAndBenefitSummaryPayrollAccumulation[] payrollAccumulations?;
    # Earnings sections
    ReportableEarningsAndBenefitsSection[] reportableEarningsAndBenefitsSummarySections?;
};

public type NonStatutoryDeductionSummaryItem record {
    # An identifier for a payroll item, e.g. an deduction code or a policy type
    NonstatutorydeductionsummaryDeductionid deductionID?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionTakenAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionUntakenAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionInArrearsAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionCarryOverAmount?;
    # Payroll Accumulator Results
    DeductionItemBasePayrollAccumulation[] payrollAccumulations?;
    # Set of configuration tags relevant to the related instance
    EarningssummaryImpoundinformationConfigurationtags[] configurationTags?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

public type PaymentAllocation record {
    # The unique identifier of the array
    string itemID?;
    # This is used to distribute the pay data across organizational allocation entities, e.g. cost number, department number, etc.
    PayrolloutputsPayallocationid payAllocationID?;
    # Earnings
    PayAllocationEarning earnings?;
    # Reportable earnings and benefits
    PayAllocationReportableEarningsAndBenefit reportableEarningsAndBenefits?;
    # Reimbursements
    PayAllocationReimbursement reimbursements?;
    # Taxes
    PayAllocationStatutoryDeduction statutoryDeductions?;
    # Non-tax deductions 
    PayAllocationNonStatutoryDeduction nonStatutoryDeductions?;
    # Memos are items that are passed through payroll but not actually used during the calculation process
    PayAllocationMemo memos?;
    # Set of configuration tags relevant to the related instance
    EarningssummaryConfigurationtags[] configurationTags?;
};

public type SimpleIDType string;

# The number of hours, days, etc. worked relative to the associated earning
public type EarningssummaryAccumulatedtimeworkedquantity record {
    # Quantity value
    decimal quantityValue?;
    # Units the quantity is based upon
    EarningssummaryAccumulatedtimeworkedquantityUnittimecode unitTimeCode?;
};

# An identifier for a payroll item, e.g. an deduction code or a policy type
public type NonstatutorydeductionsummaryDeductionid record {
    # An actual ID value
    string idValue?;
    # ID description
    string idDescription?;
    EarningssummaryEarningidAlternatedescriptions[] alternateDescriptions?;
    # The scheme code
    ImpoundaccountFinancialpartyFinancialpartyidSchemecode schemeCode?;
};

public type MemoItemBasePayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

# Data that is the Output of a payroll run
public type AssociatePayment record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A unique identifier of a worker the schedule is copied from
    string associateOID?;
    EarningssummaryEarningid payrollID?;
    # The term payment equates to a pay statement or check. 
    Payment[] payments?;
    # Links
    PayrolloutputsPayrollsummaryLinks[] links?;
};

# The accounts from which the associated monies will be impounded, as applicable
public type Impoundaccount3 record {
    # Basic Bank Account Number. The BBAN format is decided by each national banking community under the restriction that it must be of a fixed length of case-insensitive alphanumeric characters. It includes the domestic bank account number, branch identifier, and potential routing information
    string BBAN?;
    # International Bank Account Number. The IBAN consists of up to 34 alphanumeric characters: first the two-letter ISO 3166-1 alpha-2 country code, then two check digits, and finally a country-specific Basic Bank Account Number (BBAN). The check digits enable a sanity check of the bank account number to confirm its integrity even before submitting a transaction. 
    string IBAN?;
    # Universal Payment Identification Code. A UPIC is an identifier (or banking address) for a bank account in the United States used to receive electronic credit payments. A UPIC acts exactly like a US bank account number and protects your sensitive banking information. The actual bank account number, including the bank's routing transit number, is masked by the UPIC. Only credit transactions to an account can be initiated with a UPIC. All direct debits are blocked which should mitigate unauthorized transactions to an account.
    string UPIC?;
    # The account where the monies are to be distributed
    Impoundaccount3Financialparty financialParty?;
    # The account where the moneis are to be distributed
    ImpoundaccountFinancialaccount financialAccount?;
};

# Code that identifies the protocol used for the request.
public type PayrolloutputsConfirmmessageProtocolcode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# The accounts from which the associated monies will be impounded, as applicable
public type Impoundaccount2 record {
    # Basic Bank Account Number. The BBAN format is decided by each national banking community under the restriction that it must be of a fixed length of case-insensitive alphanumeric characters. It includes the domestic bank account number, branch identifier, and potential routing information
    string BBAN?;
    # International Bank Account Number. The IBAN consists of up to 34 alphanumeric characters: first the two-letter ISO 3166-1 alpha-2 country code, then two check digits, and finally a country-specific Basic Bank Account Number (BBAN). The check digits enable a sanity check of the bank account number to confirm its integrity even before submitting a transaction. 
    string IBAN?;
    # Universal Payment Identification Code. A UPIC is an identifier (or banking address) for a bank account in the United States used to receive electronic credit payments. A UPIC acts exactly like a US bank account number and protects your sensitive banking information. The actual bank account number, including the bank's routing transit number, is masked by the UPIC. Only credit transactions to an account can be initiated with a UPIC. All direct debits are blocked which should mitigate unauthorized transactions to an account.
    string UPIC?;
    # The account where the monies are to be distributed
    Impoundaccount2Financialparty financialParty?;
    # The account where the moneis are to be distributed
    ImpoundaccountFinancialaccount financialAccount?;
};

# The code for the third party
public type PayrolloutputsPayrollsummaryThirdpartycode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# The accounts from which the associated monies will be impounded, as applicable
public type Impoundaccount1 record {
    # Basic Bank Account Number. The BBAN format is decided by each national banking community under the restriction that it must be of a fixed length of case-insensitive alphanumeric characters. It includes the domestic bank account number, branch identifier, and potential routing information
    string BBAN?;
    # International Bank Account Number. The IBAN consists of up to 34 alphanumeric characters: first the two-letter ISO 3166-1 alpha-2 country code, then two check digits, and finally a country-specific Basic Bank Account Number (BBAN). The check digits enable a sanity check of the bank account number to confirm its integrity even before submitting a transaction. 
    string IBAN?;
    # Universal Payment Identification Code. A UPIC is an identifier (or banking address) for a bank account in the United States used to receive electronic credit payments. A UPIC acts exactly like a US bank account number and protects your sensitive banking information. The actual bank account number, including the bank's routing transit number, is masked by the UPIC. Only credit transactions to an account can be initiated with a UPIC. All direct debits are blocked which should mitigate unauthorized transactions to an account.
    string UPIC?;
    # The account where the monies are to be distributed
    Impoundaccount1Financialparty financialParty?;
    # The account where the moneis are to be distributed
    ImpoundaccountFinancialaccount financialAccount?;
};

public type PayrolloutputsConfirmmessageResourcelink record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # A unique identifier of the feature/function/operation, the link poins to
    string canonicalUri?;
    # This property defines a title for the link. The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    PaymentdistributionssummaryPayloadarguments[] payLoadArguments?;
};

# The process results status code for the request.
public type PayrolloutputsConfirmmessageRequeststatuscode record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

# The amount associated to an associate payment. e.g. the net pay.
public type PayrolloutputsPaymentamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # Standard currency code as per ISO 4212
    string currencyCode?;
};

public type ReportableEarningsAndBenefitSummaryPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

public type ThirdPartyPayment record {
    # the type of third party payment
    PayrolloutputsPayrollsummaryThirdpartypaymenttypecode thirdPartyPaymentTypeCode?;
    # The code for the third party
    PayrolloutputsPayrollsummaryThirdpartycode thirdPartyCode?;
    # Third party payment amount
    PayrolloutputsPayrollsummaryTotalthirdpartypaymentamount totalThirdPartyPaymentAmount?;
    # Describes impound details, as applicable, of related monies
    PayrolloutputsPayrollsummaryImpoundinformation impoundInformation?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

public type InternetAddressWithItemID record {
    # A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary 
    ImpoundaccountFinancialpartyCommunicationNamecode nameCode?;
    # The URI of the associated email address
    string uri?;
    # The unique identifier of the object in a collection
    string itemID?;
};

public type CodelisttypeV03 record {
    # Code list title
    string codeListTitle?;
    # Boolean expression
    IndicatortypeV01 exclusiveIndicator?;
    CodelistitemtypeV02[] listItems?;
    LinktypeV02[] links?;
};

# A country subdivision correlating to a administrative level two level below country. For example, in the United States, this would be a county
public type StatutorydeductionssummaryStatutoryjurisdictionAdministrativelevel2 record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The type of a country sub-division, e.g. state, county
    string subdivisionType?;
};

public type SocialNetworkContactCommunicationType record {
    # A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary 
    ImpoundaccountFinancialpartyCommunicationNamecode nameCode?;
    # The URI of the associated email address
    string uri?;
    # The unique identifier of the object in a collection
    string itemID?;
};

public type StatutoryDeductionsSummarySection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    #  Tax deductions
    StatutoryDeductionSummaryItem[] statutoryDeductionsSummaryItems?;
};

# A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values. The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type PayrolloutputsConfirmmessageLinks record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # A unique identifier of the feature/function/operation, the link poins to
    string canonicalUri?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    PaymentdistributionssummaryPayloadarguments[] payLoadArguments?;
};

# The status of the payroll processing, e.g. complete
public type PayrolloutputsPayrollprocessingjobstatuscode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type PayAllocationMemoSection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    # Memos are items that are passed through payroll but not actually used during the calculation process
    PayAllocationMemoItem[] memoItems?;
};

# Context rules for a given object
public type AmountValueType record {
    # True indicates that the property is marked read only in the given context
    boolean readOnly?;
    # True indicates that this property does not need to be valued
    boolean optional?;
    # True indicates that the property is carried in the message - to and from the System of Record, but is not exposed in the UI
    boolean hidden?;
    SequenceType sequence?;
    # Specified on a target property.  If the passed conditions are true then this property is disallowed and therefore, not presented to a user.
    DisallowItemType[] disallow?;
    # Provides a client defined UI label for the property which is less than an average of 20 characters in length.
    string shortLabelName?;
    # Provides a client defined UI long label for the property.
    string longLabelName?;
    # Indicates the minimum length required for a property.
    int minLength?;
    # Indicates the maximum length supported for a property
    int maxLength?;
    # Indicates the minimum amout value required for a property.
    decimal minAmountValue?;
    # Indicates the maximum amount value supported for a property
    decimal maxAmountValue?;
    # Indicates the minimum value required for a property.
    decimal minValue?;
    # Indicates the maximum value supported for a property
    decimal maxValue?;
    # Indicates that the value must be a multiple of this value or divisible by this value.
    decimal multipleOf?;
    # Indicates the default value which should be populated by default
    decimal 'default?;
    # Indicates a regular expression on the required pattern for the value
    string pattern?;
    MaskingRuleType masking?;
    # Provides 1 to many properties which the value of this property must be equal to.  If the property is equal to any of the value of the properties then the validation is successful.
    string[] 'equals?;
    # The value of the related property must be greater than the value of  all the given properties in the array.
    string[] greaterThan?;
    # The value of the related property must be less than the value of all the given properties in the array.
    string[] lessThan?;
    # List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
    DependencyListType dependencies?;
    # Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
    HelperMessageType helperMessage?;
    # Data type of the attribute
    string dataType?;
    LinktypeV02[] dependencyLinks?;
};

# A routing (transit) number is a bank code used to facilitate automated monetary transfers, e.g. as issued by the American Bankers Association or the Canadian Payments Association or EU
public type ImpoundaccountFinancialpartyRoutingtransitid record {
    # An actual ID value
    string idValue?;
    # The scheme code
    ImpoundaccountFinancialpartyFinancialpartyidSchemecode schemeCode?;
};

# The total adjustment amount
public type PayrolloutputsPayrollsummaryTotaladjustmentamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # Standard currency code as per ISO 4212
    string currencyCode?;
};

# Earnings
public type PayAllocationEarning record {
    # Payroll Accumulator Results
    PayAllocationEarningPayrollAccumulation[] payrollAccumulations?;
    # Earnings sections
    PayAllocationEarningsSection[] earningsSections?;
};

public type PaymentSummary record {
    # Earnings
    PaySummaryEarning earnings?;
    # Reportable earnings and benefits
    PaySummaryReportableEarningsAndBenefit reportableEarningsAndBenefits?;
    # Reimbursements
    PaySummaryReimbursement reimbursements?;
    # Taxes
    PaySummaryStatutoryDeduction statutoryDeductions?;
    # Non-tax deductions 
    PaySummaryNonStatutoryDeduction nonStatutoryDeductions?;
    # Memos are items that are passed through payroll but not actually used during the calculation process
    PaySummaryMemo memos?;
    # Set of configuration tags relevant to the related instance
    EarningssummaryConfigurationtags[] configurationTags?;
};

public type StatutoryDeductionSummaryItem record {
    # The tax authority jurisdiction
    StatutorydeductionssummaryStatutoryjurisdiction statutoryJurisdiction?;
    # The type of tax
    StatutorydeductionssummaryStatutorydeductiontypecode statutoryDeductionTypeCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionTakenAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionUntakenAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionInArrearsAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionCarryOverAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateTaxableAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount employerTaxableAmount?;
    # The statutory amount paid by the employer
    StatutorydeductionssummaryEmployerpaidamount employerPaidAmount?;
    # Payroll Accumulator Results
    PayrollAccumulations[] payrollAccumulations?;
    # Set of configuration tags relevant to the related instance
    EarningssummaryImpoundinformationConfigurationtags[] configurationTags?;
    # Describes impound details, as applicable, of related monies
    StatutorydeductionssummaryImpoundinformation impoundInformation?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

public type PayAllocationMemoItem record {
    # An identifier for a payroll item, e.g. a memo code or a policy type
    MemossummaryMemoid memoID?;
    # The amount of the associated output item
    MemossummaryMemoamount memoAmount?;
    # The number of the units associated to the output item
    MemossummaryMemoquantity memoQuantity?;
    # Payroll Accumulator Results
    MemoItemBasePayrollAccumulation[] payrollAccumulations?;
    # Set of configuration tags relevant to the related instance
    EarningssummaryImpoundinformationConfigurationtags[] configurationTags?;
    # The unique identifier of a instance within the collection
    string itemID?;
    PayallocationearningLinks[] links?;
};

# The type of adjustment
public type PayrolloutputsPayrollsummaryAdjustmenttypecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type PayAllocationMemoPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

# The type of tag
public type TagTypePayeePayInput record {
    # Code identifying the type of data
    string dataTypeCode?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
    # The format of the property. Possible values are date, date-time, uri
    string formatCode?;
};

public type PaySummaryNonStatutoryDeductionSection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    # non tax deductions
    PaySummaryNonStatutoryDeductionItem[] nonStatutoryDeductionsItems?;
};

public type ReportableEarningAndBenefitItemBasePayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

public type PayAllocationNonStatutoryDeductionPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

# The code describing the language of the category
public type EarningssummaryEarningidLanguagecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type ReportableEarningsBenefitsItem record {
    # An identifier for a payroll item, e.g. an memo code or a policy type
    ReportableearningsandbenefitssummaryReportableearningandbenefitid reportableEarningAndBenefitID?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount reportableEarningAndBenefitAmount?;
    # Payroll Accumulator Results
    ReportableEarningAndBenefitItemBasePayrollAccumulation[] payrollAccumulations?;
    # Set of configuration tags relevant to the related instance
    EarningssummaryImpoundinformationConfigurationtags[] configurationTags?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

public type PaymentDistributionsSummary record {
    # Total pay documents counts
    TotalPayDocumentQuantities[] totalPayDocumentQuantities?;
    # The total check amount
    PaymentdistributionssummaryTotalcheckamount totalCheckAmount?;
    # The total cash amount
    PaymentdistributionssummaryTotalcashamount totalCashAmount?;
    # Describes impound details, as applicable, of related monies
    PaymentdistributionssummaryDepositimpoundinformation depositImpoundInformation?;
    # Describes impound details, as applicable, of related monies
    PaymentdistributionssummaryDepositimpoundinformation checkImpoundInformation?;
    # Direct deposit info
    DirectDeposits[] totalDirectDeposits?;
    # Set of configuration tags relevant to the related instance
    PaymentdistributionssummaryConfigurationtags[] configurationTags?;
    PaymentdistributionssummaryLinks[] links?;
};

public type PayAllocationStatutoryDeductionPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

# A session identifier if one is available.
public type PayrolloutputsConfirmmessageSessionid record {
    # An ID
    string idValue?;
    # The type of ID
    string schemeName?;
    # The agency that issues the ID
    string schemeAgencyName?;
};

# The time unit upon which the accumulator is based, e.g. YTD, QTD
public type EarningssummaryAccumulatortimeunitcode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
public type ImpoundaccountFinancialpartyNamecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# The scheme code
public type ImpoundaccountFinancialpartyFinancialpartyidSchemecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# A reference to the payroll schedule
public type PayrolloutputsPayrollschedulereference record {
    # The unique identifier of the payroll schedule associated with the payroll output
    string payrollScheduleID?;
    # The unique identifier of payroll schedule entry associated to the payroll schedule associated with the payroll output
    string scheduleEntryID?;
    # The year associated to a payroll in the payroll schedule.
    string payrollYear?;
    # The week number for a payroll in the payroll schedule. This does not necessarily align with the calendar week number.
    string payrollWeekNumber?;
    # For a given payroll week number, this is the numbered run for that week.
    string payrollRunNumber?;
};

# The total cash amount
public type PaymentdistributionssummaryTotalcashamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # Standard currency code as per ISO 4212
    string currencyCode?;
};

public type PayAllocationReportableEarningsBenefitsItem record {
    # An identifier for a payroll item, e.g. an memo code or a policy type
    ReportableearningsandbenefitssummaryReportableearningandbenefitid reportableEarningAndBenefitID?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount reportableEarningAndBenefitAmount?;
    # Payroll Accumulator Results
    ReportableEarningAndBenefitItemBasePayrollAccumulation[] payrollAccumulations?;
    # Set of configuration tags relevant to the related instance
    EarningssummaryImpoundinformationConfigurationtags[] configurationTags?;
    # The unique identifier of a instance within the collection
    string itemID?;
    PayallocationearningLinks[] links?;
};

# An identifier for the instance of the confirm message.
public type PayrolloutputsConfirmmessageConfirmmessageid record {
    # An ID
    string idValue?;
    # The type of ID
    string schemeName?;
    # The agency that issues the ID
    string schemeAgencyName?;
};

# The statutory amount paid by the employer
public type StatutorydeductionssummaryEmployerpaidamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # Standard currency code as per ISO 4212
    string currencyCode?;
};

public type PayAllocationNonStatutoryDeductionItem record {
    # An identifier for a payroll item, e.g. an deduction code or a policy type
    NonstatutorydeductionsummaryDeductionid deductionID?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionTakenAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionUntakenAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionInArrearsAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionCarryOverAmount?;
    # Payroll Accumulator Results
    DeductionItemBasePayrollAccumulation[] payrollAccumulations?;
    # Set of configuration tags relevant to the related instance
    EarningssummaryImpoundinformationConfigurationtags[] configurationTags?;
    # The unique identifier of a instance within the collection
    string itemID?;
    PayallocationearningLinks[] links?;
};

# The method that was used on the request corresponding to this message instance.
public type PayrolloutputsConfirmmessageRequestmethodcode record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

public type ValueSetMeta record {
    # Code value (typically a key field) of the code list item
    string idValuePath?;
    # Short name field of the code list item
    string itemDescriptionPath?;
};

public type ReportableEarningsAndBenefitPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

public type EarningsSummarySection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    # Describes impound details, as applicable, of related monies
    EarningssummaryImpoundinformation impoundInformation?;
    # Earnings Items
    EarningItem[] earningsSummaryItems?;
};

# This is used to distribute the pay data across organizational allocation entities, e.g. cost number, department number, etc.
public type PayrolloutputsPayallocationid record {
    # An actual ID value
    string idValue?;
    # ID description
    string idDescription?;
    EarningssummaryEarningidAlternatedescriptions[] alternateDescriptions?;
    # The scheme code
    ImpoundaccountFinancialpartyFinancialpartyidSchemecode schemeCode?;
};

public type ArgumentType record {
    # Argument name to be passed in
    string argumentName?;
    # The path of the argument to be passed in
    string argumentPath?;
    # The value of the argument name to be passed in
    string argumentValue?;
};

public type MetaDataType string;

# Communication mechanisms, e,g, phone, email, etc
public type ImpoundaccountFinancialpartyCommunication record {
    # A list of land-line telephone numbers
    ImpoundaccountFinancialpartyCommunicationLandlines[] landlines?;
    # A list of mobile telephone numbers
    ImpoundaccountFinancialpartyCommunicationLandlines[] mobiles?;
    # A list of email addresses
    EmailContactCommunicationType[] emails?;
    # A list of social networks addresses
    SocialNetworkContactCommunicationType[] socialNetworks?;
    # A list of fax telephone numbers
    ImpoundaccountFinancialpartyCommunicationLandlines[] faxes?;
    # A list of pager telephone numbers
    ImpoundaccountFinancialpartyCommunicationLandlines[] pagers?;
    # A list of internet URIs
    InternetAddressWithItemID[] internetAddresses?;
    # A list of instant messages URIs
    ImpoundaccountFinancialpartyCommunicationInstantmessages[] instantMessages?;
};

# For any given rate, the baseUnitCode is used to define the denominator of the rate, or rate over what. In the example 5 US dollars per hour, the baseUnitCode is hour. In the example 3 bags of rice per month, the baseUnitCode is month. If for example, the rate was 10 US dollars for every widget produced, the baseUnitCode would be widget. In the example, 20 percent of annual sales, the baseUnitCode would equate to annual sales
public type PaysummaryearningPayrateBaseunitcode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# The payroll group relevant to payroll processing
public type PayrolloutputsPayrollgroupcode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type PaySummaryReimbursementPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

public type ReimbursementItemBasePayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

# For any given rate, either the currencyCode or the unitCode is present. In the example 3 bags of rice per month, currencyCode would not be present, and the unitCode would be bags of rice. In the example, 20 percent of annual sales, the unitCode would be percent
public type PaysummaryearningPayrateUnitcode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type PayallocationearningLinks record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # A unique identifier of the feature/function/operation, the link poins to
    string canonicalUri?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource. The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    PaymentdistributionssummaryPayloadarguments[] payLoadArguments?;
};

# base pay, additional pay, allowance
public type EarningssummaryEarningclassificationcode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# The processing results status code of the resource of the request.
public type ResourceMessageResourceStatus record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

# Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
public type HelperMessageType record {
    # Message to present to the user.
    string messageTxt?;
    LinktypeV02[] links?;
};

# A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type PayrolloutputsMetaLinks record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # A unique identifier of the feature/function/operation, the link poins to
    string canonicalUri?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    PaymentdistributionssummaryPayloadarguments[] payLoadArguments?;
};

# A single query parameter
public type PayrollOutputsQueryCriterion record {
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 queryOptionCode?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 obligationCode?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 queryOptionTypeCode?;
    # The default number value
    decimal defaultNumberValue?;
    # The default string value
    string defaultStringValue?;
    # Maximum number of resource paths supported
    int resourcePathMax?;
    # Indicates a regular expression on the required pattern for the value
    string pattern?;
    # A collection of acceptable resource paths to pass to the query option
    string[] resourcePaths?;
    # A collection of resource paths which may not be passed to the query option.  An example use of this is where you allow all paths except 1 or 2.  You would want to only specify those which are excluded
    string[] excludedResourcePaths?;
    CodelisttypeV03 queryValueCodeList?;
    # A collection of logical operators
    PayrolloutputsmetaLogicaloperators[] logicalOperators?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

public type NonStatutoryDeductionPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

public type StatutoryDeductionsSummaryPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

public type PayAllocationStatutoryDeductionItem record {
    # The tax authority jurisdiction
    StatutorydeductionssummaryStatutoryjurisdiction statutoryJurisdiction?;
    # The type of tax
    StatutorydeductionssummaryStatutorydeductiontypecode statutoryDeductionTypeCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionTakenAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionUntakenAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionInArrearsAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateDeductionCarryOverAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount associateTaxableAmount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount employerTaxableAmount?;
    # The statutory amount paid by the employer
    StatutorydeductionssummaryEmployerpaidamount employerPaidAmount?;
    # Payroll Accumulator Results
    PayrollAccumulations[] payrollAccumulations?;
    # Set of configuration tags relevant to the related instance
    EarningssummaryImpoundinformationConfigurationtags[] configurationTags?;
    # The unique identifier of a instance within the collection
    string itemID?;
    PayallocationearningLinks[] links?;
};

public type EarningssummaryEarningidAlternatedescriptions record {
    # The code describing the language of the category
    EarningssummaryEarningidLanguagecode languageCode?;
    # ID description
    string idDescription?;
};

public type NumberType record {
    # True indicates that the property is marked read only in the given context
    boolean readOnly?;
    # True indicates that this property does not need to be valued
    boolean optional?;
    # True indicates that the property is carried in the message - to and from the System of Record, but is not exposed in the UI
    boolean hidden?;
    SequenceType sequence?;
    # Specified on a target property.  If the passed conditions are true then this property is disallowed and therefore, not presented to a user.
    DisallowItemType[] disallow?;
    # Provides a client defined UI label for the property which is less than an average of 20 characters in length.
    string shortLabelName?;
    # Provides a client defined UI long label for the property.
    string longLabelName?;
    # Indicates the minimum length required for a property.
    int minLength?;
    # Indicates the maximum length supported for a property
    int maxLength?;
    # Indicates the minimum value required for a property.
    decimal minValue?;
    # Indicates the maximum value supported for a property
    decimal maxValue?;
    # Indicates that the value must be a multiple of this value or divisible by this value.
    decimal multipleOf?;
    # Indicates the default value which should be populated by default
    decimal 'default?;
    # Indicates a regular expression on the required pattern for the value
    string pattern?;
    MaskingRuleType masking?;
    # Provides 1 to many properties which the value of this property must be equal to.  If the property is equal to any of the value of the properties then the validation is successful.
    string[] 'equals?;
    # The value of the related property must be greater than the value of  all the given properties in the array.
    string[] greaterThan?;
    # The value of the related property must be less than the value of all the given properties in the array.
    string[] lessThan?;
    # List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
    DependencyListType dependencies?;
    # Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
    HelperMessageType helperMessage?;
    MetaDataType dataType?;
    LinktypeV02[] dependencyLinks?;
};

# Data that is the output of a payroll run
public type PayrollOutput record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # The unique identifier of the related payroll processing job. This is generated as the result of the payrollProcessingJob.initiate event.
    string payrollProcessingJobID?;
    # The region in which the payroll is processed
    PayrolloutputsPayrollregioncode payrollRegionCode?;
    # The payroll group relevant to payroll processing
    PayrolloutputsPayrollgroupcode payrollGroupCode?;
    # A reference to the payroll schedule
    PayrolloutputsPayrollschedulereference payrollScheduleReference?;
    # The status of the payroll processing, e.g. complete
    PayrolloutputsPayrollprocessingjobstatuscode payrollProcessingJobStatusCode?;
    # This is check level summary data.
    PayrolloutputsPayrollsummary payrollSummary?;
    AssociatePayment[] associatePayments?;
    PayallocationearningLinks[] links?;
};

# An identifier for a payroll item, e.g. a distribution code
public type PaymentdistributionssummaryDepositid record {
    # An actual ID value
    string idValue?;
    # ID description
    string idDescription?;
    # Alternative description list
    EarningssummaryEarningidAlternatedescriptions[] alternateDescriptions?;
    # The scheme code
    ImpoundaccountFinancialpartyFinancialpartyidSchemecode schemeCode?;
};

public type Impoundaccount1FinancialpartyCommunicationLandlines record {
    # A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary 
    ImpoundaccountFinancialpartyCommunicationNamecode nameCode?;
    # The country dialing code is the national prefix to be used when dialing TO that particular country FROM another country. 
    string countryDialing?;
    # The local area dialing code for a telephone number.
    string areaDialing?;
    # The local communication number, not including country dialing or area dialing codes.   If component parts of the telephone number are being communicated then the dialNumber is required.
    string dialNumber?;
    # The extension of the local communication number.  In the case of a Telephone Number accessing a Pager Network, the extension may be the Pager Identification Number required to leave a message for the Pager Number (i.e. Pager Pin). These are mutually exclusive.
    string extension?;
    # National Direct Dialing Prefix.  Also known as the trunk prefix or National Prefix. It is the number to be dialed in a domestic telephone call, preceding any necessary area code and subscriber number (i.e. dial number). When calling from outside of the country, the national direct dial prefix is omitted by the caller.  In Australia, Germany, and United Kingdom the trunk prefix is 0.  In the US and Canada it is 1.
    string access?;
    # The formatted telephone number.  The component parts of the telephone are put together into a presentation pattern as defined by the regex format specified. Please note that is used as an escape character in regex, but a double  is needed to escape within the json schema.  The regex will accept +CC NNNNNNNNNNNNNN where + is the symbol indicating the caller to enter their country specific code to call from outside the country. CC is the country code for an international number (optional), and the area code and dial number.  The local access code (i.e. 1 (201) 333 4444. 1 is the access code in US) is not passed. The UI will present the phone number following its own presentation convention
    string formattedNumber?;
    # The unique identifier of the object in a collection
    string itemID?;
};

# The type of pay document, e.g paycheck, voucher, eVoucher, void paycheck.
public type PaymentdistributionssummaryPaydocumenttypecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type EarningPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

public type PayAllocationReimbursementsSection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    # Reimbursement items
    PayAllocationReimbursementAllocationItem[] reimbursementsItems?;
};

# Communication mechanisms, e,g, phone, email, etc
public type Impoundaccount2FinancialpartyCommunication record {
    # A list of land-line telephone numbers
    Impoundaccount2FinancialpartyCommunicationLandlines[] landlines?;
    # A list of mobile telephone numbers
    Impoundaccount2FinancialpartyCommunicationLandlines[] mobiles?;
    # A list of email addresses
    EmailContactCommunicationType[] emails?;
    # A list of social networks addresses
    SocialNetworkContactCommunicationType[] socialNetworks?;
    # A list of fax telephone numbers
    Impoundaccount2FinancialpartyCommunicationLandlines[] faxes?;
    # A list of pager telephone numbers
    Impoundaccount2FinancialpartyCommunicationLandlines[] pagers?;
    # A list of internet URIs
    InternetAddressWithItemID[] internetAddresses?;
    # A list of instant messages URIs
    ImpoundaccountFinancialpartyCommunicationInstantmessages[] instantMessages?;
};

# Reimbursements
public type PayAllocationReimbursement record {
    # Payroll Accumulator Results
    PayAllocationReimbursementPayrollAccumulation[] payrollAccumulations?;
    # Reimbursement sections
    PayAllocationReimbursementsSection[] reimbursementsSections?;
};

public type PaySummaryEarningItem record {
    # An identifier for a payroll item, e.g. an earning code or a policy type
    ReimbursementssummaryReimbursementid earningID?;
    # base pay, additional pay, allowance
    EarningssummaryEarningclassificationcode earningClassificationCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount earningAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity timeWorkedQuantity?;
    # Pay rate
    PaysummaryearningPayrate payRate?;
    # Payroll Accumulator Results
    EarningItemBasePayrollAccumulation[] payrollAccumulations?;
    # Set of configuration tags relevant to the related instance
    StatutorydeductionssummaryImpoundinformationConfigurationtags[] configurationTags?;
    # The unique identifier of a instance within the collection
    string itemID?;
    PaysummaryearningLinks[] links?;
};

public type Impoundaccount3FinancialpartyCommunicationLandlines record {
    # A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary 
    ImpoundaccountFinancialpartyCommunicationNamecode nameCode?;
    # The country dialing code is the national prefix to be used when dialing TO that particular country FROM another country. 
    string countryDialing?;
    # The local area dialing code for a telephone number.
    string areaDialing?;
    # The local communication number, not including country dialing or area dialing codes. If component parts of the telephone number are being communicated then the dialNumber is required.
    string dialNumber?;
    # The extension of the local communication number.  In the case of a Telephone Number accessing a Pager Network, the extension may be the Pager Identification Number required to leave a message for the Pager Number (i.e. Pager Pin).  These are mutually exclusive.
    string extension?;
    # National Direct Dialing Prefix.  Also known as the trunk prefix or National Prefix.  It is the number to be dialed in a domestic telephone call, preceding any necessary area code and subscriber number (i.e. dial number).  When calling from outside of the country, the national direct dial prefix is omitted by the caller.  In Australia, Germany, and United Kingdom the trunk prefix is 0. In the US and Canada it is 1.
    string access?;
    # The formatted telephone number.  The component parts of the telephone are put together into a presentation pattern as defined by the regex format specified. Please note that  is used as an escape character in regex, but a double  is needed to escape within the json schema.  The regex will accept +CC NNNNNNNNNNNNNN where + is the symbol indicating the caller to enter their country specific code to call from outside the country.  CC is the country code for an international number (optional), and the area code and dial number.  The local access code (i.e. 1 (201) 333 4444. 1 is the access code in US) is not passed.  The UI will present the phone number following its own presentation convention
    string formattedNumber?;
    # The unique identifier of the object in a collection
    string itemID?;
};

# An identifier for the instance of the process message.
public type PayrolloutputsConfirmmessageProcessmessageid record {
    # An ID
    string idValue?;
    # The type of ID
    string schemeName?;
    # The agency that issues the ID
    string schemeAgencyName?;
};

public type PayAllocationEarningItem record {
    # An identifier for a payroll item, e.g. an earning code or a policy type
    ReimbursementssummaryReimbursementid earningID?;
    # base pay, additional pay, allowance
    EarningssummaryEarningclassificationcode earningClassificationCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount earningAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity timeWorkedQuantity?;
    # Pay rate
    PaysummaryearningPayrate payRate?;
    # Payroll Accumulator Results
    EarningItemBasePayrollAccumulation[] payrollAccumulations?;
    # Set of configuration tags relevant to the related instance
    EarningssummaryImpoundinformationConfigurationtags[] configurationTags?;
    # The unique identifier of a instance within the collection
    string itemID?;
    PayallocationearningLinks[] links?;
};

public type SequenceType int;

# Memos are items that are passed through payroll but not actually used during the calculation process
public type MemosSummary record {
    # Payroll Accumulator Results
    MemosSummaryPayrollAccumulation[] payrollAccumulations?;
    # memos
    MemosSummarySection[] memosSummarySections?;
};

public type EmailContactCommunicationType record {
    # A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary 
    ImpoundaccountFinancialpartyCommunicationNamecode nameCode?;
    # The URI of the associated email address
    string emailUri?;
    # The unique identifier of the object in a collection
    string itemID?;
};

# Configuration Tags
public type PaymentdistributionssummaryConfigurationtags record {
    # A code identifying a tag
    string tagCode?;
    # The type of tag
    Tagtypepayeepayinput1 tagType?;
    # The the values for the given instance
    string[] tagValues?;
};

public type ObjectType record {
    # True indicates that the property is marked read only in the given context
    boolean readOnly?;
    # True indicates that this property does not need to be valued
    boolean optional?;
    # True indicates that the property is carried in the message - to and from the System of Record, but is not exposed in the UI
    boolean hidden?;
    SequenceType sequence?;
    # Specified on a target property.  If the passed conditions are true then this property is disallowed and therefore, not presented to a user.
    DisallowItemType[] disallow?;
    # List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
    DependencyListType dependencies?;
    # Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
    HelperMessageType helperMessage?;
    MetaDataType dataType?;
    LinktypeV02[] dependencyLinks?;
};

public type EarningsSummaryPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

# The account where the moneis are to be distributed
public type ImpoundaccountFinancialaccount record {
    # The unique identifier of the account where the moneis are to be distributed
    string accountNumber?;
    # The name of the related account
    string accountName?;
    # The type of account, e.g. Checking, Savings
    ImpoundaccountFinancialaccountTypecode typeCode?;
    # The default account currency code. As per ISO 4212
    string currencyCode?;
};

# The amount of the associated payment item
public type PayrolloutputsCheckamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # Standard currency code as per ISO 4212
    string currencyCode?;
};

public type PayAllocationReportableEarningsAndBenefitPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

# Each object contains detailed information for a resource referenced in the original request.
public type PayrolloutputsConfirmmessageResourcemessages record {
    # An identifier for the instance of the resource message.
    PayrolloutputsConfirmmessageResourcemessageid resourceMessageID?;
    # The processing results status code of the resource of the request.
    ResourceMessageResourceStatus resourceStatusCode?;
    PayrolloutputsConfirmmessageResourcelink resourceLink?;
    # processMessage is optional and contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).  Most often there will be a single instance for an associated request or resource, but this structure allows for more than one if needed, for example, if multiple errors exist for a single resource. 
    ProcessMessageWithResourceStatusCode[] processMessages?;
};

public type NonStatutoryDeductionSection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    # Describes impound details, as applicable, of related monies
    EarningssummaryImpoundinformation impoundInformation?;
    # non tax deductions
    NonStatutoryDeductionSummaryItem[] nonStatutoryDeductionsSummaryItems?;
};

# The region in which the payroll is processed
public type PayrolloutputsPayrollregioncode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type BooleanType record {
    # True indicates that the property is marked read only in the given context
    boolean readOnly?;
    # True indicates that this property does not need to be valued
    boolean optional?;
    # True indicates that the property is carried in the message - to and from the System of Record, but is not exposed in the UI
    boolean hidden?;
    SequenceType sequence?;
    # Specified on a target property.  If the passed conditions are true then this property is disallowed and therefore, not presented to a user.
    DisallowItemType[] disallow?;
    # Provides a client defined UI label for the property which is less than an average of 20 characters in length.
    string shortLabelName?;
    # Provides a client defined UI long label for the property
    string longLabelName?;
    # Indicates the default value which should be populated by default
    boolean 'default?;
    # Provides 1 to many properties which the value of this property must be equal to.  If the property is equal to any of the value of the properties then the validation is successful.
    string[] 'equals?;
    # List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
    DependencyListType dependencies?;
    # Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
    HelperMessageType helperMessage?;
    # Data type of the attribute
    string dataType?;
    LinktypeV02[] dependencyLinks?;
};

# Summary of reimbursements
public type ReimbursementsSummary record {
    # Payroll Accumulator Results
    ReimbursementsSummaryPayrollAccumulation[] payrollAccumulations?;
    # Reimbursement sections
    ReimbursementsSummarySection[] reimbursementsSummarySections?;
};

public type Impoundaccount2FinancialpartyCommunicationLandlines record {
    # A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary 
    ImpoundaccountFinancialpartyCommunicationNamecode nameCode?;
    # The country dialing code is the national prefix to be used when dialing TO that particular country FROM another country.  
    string countryDialing?;
    # The local area dialing code for a telephone number.
    string areaDialing?;
    # The local communication number, not including country dialing or area dialing codes.   If component parts of the telephone number are being communicated then the dialNumber is required.
    string dialNumber?;
    # The extension of the local communication number.  In the case of a Telephone Number accessing a Pager Network, the extension may be the Pager Identification Number required to leave a message for the Pager Number (i.e. Pager Pin). These are mutually exclusive.
    string extension?;
    # National Direct Dialing Prefix.  Also known as the trunk prefix or National Prefix.  It is the number to be dialed in a domestic telephone call, preceding any necessary area code and subscriber number (i.e. dial number).  When calling from outside of the country, the national direct dial prefix is omitted by the caller.  In Australia, Germany, and United Kingdom the trunk prefix is 0.  In the US and Canada it is 1.
    string access?;
    # The formatted telephone number.  The component parts of the telephone are put together into a presentation pattern as defined by the regex format specified. Please note that  is used as an escape character in regex, but a double  is needed to escape within the json schema.  The regex will accept +CC NNNNNNNNNNNNNN where + is the symbol indicating the caller to enter their country specific code to call from outside the country. CC is the country code for an international number (optional), and the area code and dial number.  The local access code (i.e. 1 (201) 333 4444. 1 is the access code in US) is not passed.  The UI will present the phone number following its own presentation convention
    string formattedNumber?;
    # The unique identifier of the object in a collection
    string itemID?;
};

# An identifier for a payroll item, e.g. an memo code or a policy type
public type ReportableearningsandbenefitssummaryReportableearningandbenefitid record {
    # An actual ID value
    string idValue?;
    # ID description
    string idDescription?;
    EarningssummaryEarningidAlternatedescriptions[] alternateDescriptions?;
    # The scheme code
    ImpoundaccountFinancialpartyFinancialpartyidSchemecode schemeCode?;
};

# The tax jurisdiction code
public type StatutorydeductionssummaryStatutoryjurisdictionJurisdictioncode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# Boolean expression
public type IndicatortypeV01 boolean;

public type ReportableEarningsAndBenefitsSection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    # Describes impound details, as applicable, of related monies
    EarningssummaryImpoundinformation impoundInformation?;
    # Earnings and or benefits that must be reported for the purpose of taxation but do not count toward gross or net
    ReportableEarningsBenefitsItem[] reportableEarningsAndBenefitsSummaryItems?;
};

# The type of account, e.g. Checking, Savings
public type ImpoundaccountFinancialaccountTypecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type LinkType record {
    UriType canonicalUri?;
    UriType href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # Simple (string) code identifying the http method used to invoke the API
    HttpMethodType method?;
    ArgumentType[] payloadArguments?;
};

# The address of the party
public type ImpoundaccountFinancialpartyAddress record {
    # The type of script the in which the associated entity is represented. Associated codelist is ISO15924-A. Use the alpha-4 representation versus the single digit numeric representation. Format is lowercase with initial letter capitalized. For example, Cyrillic is Cyrl
    ImpoundaccountFinancialpartyAddressScriptcode scriptCode?;
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
    ImpoundaccountFinancialpartyAddressStreettypecode streetTypeCode?;
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
    # A country subdivision correlating to a administrative level two levels below country. For example, in the United States, this might be a county
    ImpoundaccountFinancialpartyAddressCountrysubdivisionlevel2 countrySubdivisionLevel2?;
    # A descriptive coded name of the address
    ImpoundaccountFinancialpartyAddressNamecode nameCode?;
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
    # A city in the context of an address
    string cityName?;
    # A country subdivision correlating to a administrative level one level below country. For example, in the United States, this would be a state
    ImpoundaccountFinancialpartyAddressCountrysubdivisionlevel1 countrySubdivisionLevel1?;
    # A simple (string) code. Can have a code list reference
    string countryCode?;
    # The string of characters used to identify the postal code
    string postalCode?;
    # The coordinates of the location of the address
    ImpoundaccountFinancialpartyAddressGeocoordinate geoCoordinate?;
};

# A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type PayrolloutputsPayrollsummaryLinks record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # A unique identifier of the feature/function/operation, the link poins to
    string canonicalUri?;
    # This property defines a title for the link. The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request. For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    PaymentdistributionssummaryPayloadarguments[] payLoadArguments?;
};

public type NonStatutoryDeductionsSummaryPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

public type MemoSummaryItem record {
    # An identifier for a payroll item, e.g. a memo code or a policy type
    MemossummaryMemoid memoID?;
    # The amount of the associated output item
    MemossummaryMemoamount memoAmount?;
    # The number of the units associated to the output item
    MemossummaryMemoquantity memoQuantity?;
    # Payroll Accumulator Results
    MemoItemBasePayrollAccumulation[] payrollAccumulations?;
    # Set of configuration tags relevant to the related instance
    EarningssummaryImpoundinformationConfigurationtags[] configurationTags?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

# The identifier of the request that generated this response.
public type PayrolloutputsConfirmmessageRequestid record {
    # An ID
    string idValue?;
    # The type of ID
    string schemeName?;
    # The agency that issues the ID
    string schemeAgencyName?;
};

# Describes impound details, as applicable, of related monies
public type EarningssummaryImpoundinformation record {
    # Indicate the party responsible for paying the taxes; values are ADP or Client
    EarningssummaryImpoundinformationImpoundpartycode impoundPartyCode?;
    # The accounts from which the associated monies will be impounded, as applicable
    ImpoundAccount impoundAccount?;
    # Set of configuration tags relevant to the related instance
    EarningssummaryImpoundinformationConfigurationtags[] configurationTags?;
};

# The type of tag
public type Tagtypepayeepayinput1 record {
    # Code identifying the type of data
    string dataTypeCode?;
    # List of standard currency codes ISO 4212
    string currencyCode?;
    # The format of the property.  Possible values are date, date-time, uri
    string formatCode?;
};

# This is check level summary data.
public type PayrolloutputsPayrollsummary record {
    # Summary of earnings
    EarningsSummary earningsSummary?;
    # Summary of reportable earnings and benefits
    ReportableEarningsAndBenefitsSummary reportableEarningsAndBenefitsSummary?;
    # Summary of reimbursements
    ReimbursementsSummary reimbursementsSummary?;
    # Summary of taxes
    StatutoryDeductionsSummary statutoryDeductionsSummary?;
    # Summary of non-tax deductions 
    NonStatutoryDeductionSummary nonStatutoryDeductionsSummary?;
    # Memos are items that are passed through payroll but not actually used during the calculation process
    MemosSummary memosSummary?;
    PaymentDistributionsSummary paymentDistributionsSummary?;
    # e.g. third party sick pay, social security sui, etc
    PayrollAdjustments[] payrollAdjustments?;
    # e.g. pay by pay, cobra premium assistance
    ThirdPartyPayment[] thirdPartyPayments?;
    # Set of configuration tags relevant to the related instance
    PaymentdistributionssummaryConfigurationtags[] configurationTags?;
    PayrolloutputsPayrollsummaryLinks[] links?;
};

public type PayrollOutputsMetaType record {
    PayrollOutputsMeta meta?;
};

# Earnings
public type PaySummaryEarning record {
    # Payroll Accumulator Results
    EarningPayrollAccumulation[] payrollAccumulations?;
    # Earnings sections
    PaySummaryEarningsSection[] earningsSections?;
};

public type DirectDeposit record {
    # The unique identifier of a instance within the collection
    string itemID?;
    EarningssummaryEarningid depositID?;
    # The distribution target, e.g. bank account info
    PayrolloutputsDepositaccount depositAccount?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount depositAmount?;
};

public type ArrayType record {
    # Indicates the minimum items required for an array type.  This is only relevant if the given property is an array.
    int minItems?;
    # Indicates the maximum items supported for an array type. This is only relevant if the given property is an array.
    int maxItems?;
    # A list of properties which must have the exact same value within the array
    string[] sameValueProperties?;
    # A list of properties which together must be unique
    string[] uniqueProperties?;
    IndicatorType uniqueItems?;
    # List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
    DependencyListType dependencies?;
    # Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
    HelperMessageType helperMessage?;
    MetaDataType dataType?;
    LinktypeV02[] dependencyLinks?;
};

# A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type PayrolloutputsLinks record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # A unique identifier of the feature/function/operation, the link poins to
    string canonicalUri?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    PaymentdistributionssummaryPayloadarguments[] payLoadArguments?;
};

# Identifies the language used for expressions communicated in this message.
public type PayrolloutputsConfirmmessageExpressionlanguagecode record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

# The amount of the associated payroll item
public type EarningssummaryAccumulatedamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # Standard currency code as per ISO 4212
    string currencyCode?;
};

# The unique identifier of the associated party entity
public type ImpoundaccountFinancialpartyFinancialpartyid record {
    # An actual ID value
    string idValue?;
    # The scheme code
    ImpoundaccountFinancialpartyFinancialpartyidSchemecode schemeCode?;
};

public type EarningssummaryEarningid record {
    # An actual ID value
    string idValue?;
    # ID description
    string idDescription?;
    EarningssummaryEarningidAlternatedescriptions[] alternateDescriptions?;
    # The scheme code
    ImpoundaccountFinancialpartyFinancialpartyidSchemecode schemeCode?;
};

public type PayAllocationReimbursementAllocationItem record {
    # An identifier for a payroll item, e.g. an earning code or a policy type
    ReimbursementssummaryReimbursementid reimbursementID?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount reimbursementAmount?;
    # Payroll Accumulator Results
    ReimbursementItemBasePayrollAccumulation[] payrollAccumulations?;
    # Set of configuration tags relevant to the related instance
    EarningssummaryImpoundinformationConfigurationtags[] configurationTags?;
    # The unique identifier of a instance within the collection
    string itemID?;
    PayallocationearningLinks[] links?;
};

# A unique identifier of an object within the collection
public type ItemIDType string;

# The accounts from which the associated monies will be impounded, as applicable
public type ImpoundAccount record {
    # Basic Bank Account Number. The BBAN format is decided by each national banking community under the restriction that it must be of a fixed length of case-insensitive alphanumeric characters. It includes the domestic bank account number, branch identifier, and potential routing information
    string BBAN?;
    # International Bank Account Number. The IBAN consists of up to 34 alphanumeric characters: first the two-letter ISO 3166-1 alpha-2 country code, then two check digits, and finally a country-specific Basic Bank Account Number (BBAN). The check digits enable a sanity check of the bank account number to confirm its integrity even before submitting a transaction. 
    string IBAN?;
    # Universal Payment Identification Code. A UPIC is an identifier (or banking address) for a bank account in the United States used to receive electronic credit payments. A UPIC acts exactly like a US bank account number and protects your sensitive banking information. The actual bank account number, including the bank's routing transit number, is masked by the UPIC. Only credit transactions to an account can be initiated with a UPIC. All direct debits are blocked which should mitigate unauthorized transactions to an account.
    string UPIC?;
    # The account where the monies are to be distributed
    ImpoundaccountFinancialparty financialParty?;
    # The account where the moneis are to be distributed
    ImpoundaccountFinancialaccount financialAccount?;
};

# A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary 
public type ImpoundaccountFinancialpartyCommunicationNamecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# A descriptive coded name of the address
public type ImpoundaccountFinancialpartyAddressNamecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# IncludedConfigurationTagType
public type StatutorydeductionssummaryImpoundinformationConfigurationtags record {
    # A code identifying a tag
    string tagCode?;
    # Code identifying the tag
    StatutorydeductionssummaryImpoundinformationTagtype tagType?;
    # The the values for the given instance
    string[] tagValues?;
};

# A logical operation
public type PayrolloutputsmetaLogicaloperators record {
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 logicalOperatorCode?;
    # Boolean expression
    IndicatortypeV01 mutuallyExclusiveIndicator?;
    # A list of mutually exclusive operator codes.
    SimplecodetypeV02[] mutuallyExclusiveLogicalOperatorCodes?;
};

public type PayAllocationEarningsSection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    # Earnings allocation section
    PayAllocationEarningItem[] earningsItems?;
};

public type MaskingRuleType record {
    IndicatorType authorizationRequiredIndicator?;
    SimpleIDType authorizationResourceID?;
    LinktypeV02[] links?;
};

# The type of street, e.g. Lane, Passage, Way
public type ImpoundaccountFinancialpartyAddressStreettypecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# The address of the party
public type Impoundaccount1FinancialpartyAddress record {
    # The type of script the in which the associated entity is represented. Associated codelist is ISO15924-A. Use the alpha-4 representation versus the single digit numeric representation. Format is lowercase with initial letter capitalized. For example, Cyrillic is Cyrl
    ImpoundaccountFinancialpartyAddressScriptcode scriptCode?;
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
    ImpoundaccountFinancialpartyAddressStreettypecode streetTypeCode?;
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
    # A country subdivision correlating to a administrative level two levels below country. For example, in the United States, this might be a county
    ImpoundaccountFinancialpartyAddressCountrysubdivisionlevel2 countrySubdivisionLevel2?;
    # A descriptive coded name of the address
    ImpoundaccountFinancialpartyAddressNamecode nameCode?;
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
    # A city in the context of an address
    string cityName?;
    # A country subdivision correlating to a administrative level one level below country. For example, in the United States, this would be a state
    ImpoundaccountFinancialpartyAddressCountrysubdivisionlevel1 countrySubdivisionLevel1?;
    # A simple (string) code.  Can have a code list reference
    string countryCode?;
    # The string of characters used to identify the postal code
    string postalCode?;
    # The coordinates of the location of the address
    ImpoundaccountFinancialpartyAddressGeocoordinate geoCoordinate?;
};

# Processing status of the related request message.
public type PayrolloutputsConfirmmessageProcessingstatuscode record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

# the type of third party payment
public type PayrolloutputsPayrollsummaryThirdpartypaymenttypecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type Payment record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # The date on which any funds to be distributed as the result of a payroll run will be available to the payee. Follows the ISO-8601:2000 format
    string paymentDate?;
    # The start date of the pay period. Follows the ISO-8601:2000 format
    string payPeriodStartDate?;
    # The end date of the pay period. Follows the ISO-8601:2000 format
    string payPeriodEndDate?;
    # The amount associated to an associate payment. e.g. the net pay.
    PayrolloutputsPaymentamount paymentAmount?;
    PaymentSummary paymentSummary?;
    # Describes how the payment is allocated
    PaymentAllocation[] paymentAllocations?;
    # Data relevant to the distribution of a payment amount across payment methods, e.g. check, cash, direct deposit
    PaymentDistribution[] paymentDistributions?;
    # Set of configuration tags relevant to the related instance
    PaymentdistributionssummaryConfigurationtags[] configurationTags?;
    PayrolloutputsLinks[] links?;
};

# A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type LinktypeV02 record {
    # The URI of the related entity
    UritypeV01 href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # The URI of the related entity
    UritypeV01 canonicalUri?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body
    string schema?;
    PaymentdistributionssummaryPayloadarguments[] payLoadArguments?;
};

# The account where the monies are to be distributed
public type ImpoundaccountFinancialparty record {
    # A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    ImpoundaccountFinancialpartyNamecode nameCode?;
    # The address of the party
    ImpoundaccountFinancialpartyAddress address?;
    # The unique identifier of the associated party entity
    ImpoundaccountFinancialpartyFinancialpartyid financialPartyID?;
    # Identifies a standard format of Business Identifier Codes approved by the International Organization for Standardization (ISO). It is a unique identification code for both financial and non-financial institutions. The acronym SWIFT stands for the Society for Worldwide Interbank Financial Telecommunication. The SWIFT code consists of 8 or 11 characters. When 8-digits code is given, it refers to the primary office. First 4 characters - bank code (only letters), next 2 characters - ISO 3166-1 alpha-2 country code (only letters), next 2 characters - location code (letters and digits) (passive participant will have 1 in the second character). Last 3 characters - branch code
    string SWIFTCode?;
    # Branch code / number used to compose the routing id, along with the name if applicable
    ImpoundaccountFinancialpartyBranchnamecode branchNameCode?;
    # A routing (transit) number is a bank code used to facilitate automated monetary transfers, e.g. as issued by the American Bankers Association or the Canadian Payments Association or EU
    ImpoundaccountFinancialpartyRoutingtransitid routingTransitID?;
    # Communication mechanisms, e,g, phone, email, etc
    ImpoundaccountFinancialpartyCommunication communication?;
};

public type EarningItem record {
    # The unique identifier of a instance within the collection
    string itemID?;
    EarningssummaryEarningid earningID?;
    # base pay, additional pay, allowance
    EarningssummaryEarningclassificationcode earningClassificationCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount earningAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity timeWorkedQuantity?;
    # Set of configuration tags relevant to the related instance
    EarningssummaryConfigurationtags[] configurationTags?;
};

public type ReimbursementsSummaryItem record {
    # An identifier for a payroll item, e.g. an earning code or a policy type
    ReimbursementssummaryReimbursementid reimbursementID?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount reimbursementAmount?;
    # Payroll Accumulator Results
    ReimbursementItemBasePayrollAccumulation[] payrollAccumulations?;
    # Set of configuration tags relevant to the related instance
    EarningssummaryImpoundinformationConfigurationtags[] configurationTags?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

public type DirectDeposits record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # An identifier for a payroll item, e.g. a distribution code
    PaymentdistributionssummaryDepositid depositID?;
    # The type of account, e.g. Checking, Savings
    ImpoundaccountFinancialaccountTypecode financialAccountTypeCode?;
    # The total number of unique deposits relative to a given payroll run
    decimal totalDepositQuantity?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount totalDepositAmount?;
};

public type PaySummaryMemoSection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    # Memos are items that are passed through payroll but not actually used during the calculation process
    PaySummaryMemoItem[] memoItems?;
};

# An identifier for a payroll item, e.g. a memo code or a policy type
public type MemossummaryMemoid record {
    # An actual ID value
    string idValue?;
    # ID description
    string idDescription?;
    EarningssummaryEarningidAlternatedescriptions[] alternateDescriptions?;
    # The scheme code
    ImpoundaccountFinancialpartyFinancialpartyidSchemecode schemeCode?;
};

public type PaymentdistributionssummaryPayloadarguments record {
    # Code value (typically a key field) of the code list item
    string argumentPath?;
    # Code value (typically a key field) of the code list item
    string argumentValue?;
};

# Communication mechanisms, e,g, phone, email, etc
public type Impoundaccount3FinancialpartyCommunication record {
    # A list of land-line telephone numbers
    Impoundaccount3FinancialpartyCommunicationLandlines[] landlines?;
    # A list of mobile telephone numbers
    Impoundaccount3FinancialpartyCommunicationLandlines[] mobiles?;
    # A list of email addresses
    EmailContactCommunicationType[] emails?;
    # A list of social networks addresses
    SocialNetworkContactCommunicationType[] socialNetworks?;
    # A list of fax telephone numbers
    Impoundaccount3FinancialpartyCommunicationLandlines[] faxes?;
    # A list of pager telephone numbers
    Impoundaccount3FinancialpartyCommunicationLandlines[] pagers?;
    # A list of internet URIs
    InternetAddressWithItemID[] internetAddresses?;
    # A list of instant messages URIs
    ImpoundaccountFinancialpartyCommunicationInstantmessages[] instantMessages?;
};

# Memos are items that are passed through payroll but not actually used during the calculation process
public type PayAllocationMemo record {
    # Payroll Accumulator Results
    PayAllocationMemoPayrollAccumulation[] payrollAccumulations?;
    # memos
    PayAllocationMemoSection[] memosSections?;
};

# The account where the monies are to be distributed
public type Impoundaccount1Financialparty record {
    # A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    ImpoundaccountFinancialpartyNamecode nameCode?;
    # The address of the party
    Impoundaccount1FinancialpartyAddress address?;
    # The unique identifier of the associated party entity
    ImpoundaccountFinancialpartyFinancialpartyid financialPartyID?;
    # Identifies a standard format of Business Identifier Codes approved by the International Organization for Standardization (ISO). It is a unique identification code for both financial and non-financial institutions. The acronym SWIFT stands for the Society for Worldwide Interbank Financial Telecommunication. The SWIFT code consists of 8 or 11 characters. When 8-digits code is given, it refers to the primary office. First 4 characters - bank code (only letters), next 2 characters - ISO 3166-1 alpha-2 country code (only letters), next 2 characters - location code (letters and digits) (passive participant will have 1 in the second character). Last 3 characters - branch code
    string SWIFTCode?;
    # Branch code / number used to compose the routing id, along with the name if applicable
    ImpoundaccountFinancialpartyBranchnamecode branchNameCode?;
    # A routing (transit) number is a bank code used to facilitate automated monetary transfers, e.g. as issued by the American Bankers Association or the Canadian Payments Association or EU
    ImpoundaccountFinancialpartyRoutingtransitid routingTransitID?;
    # Communication mechanisms, e,g, phone, email, etc
    Impoundaccount1FinancialpartyCommunication communication?;
};

# The URI of the related entity
public type UritypeV01 string;

public type PayAllocationNonStatutoryDeductionSection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    # non tax deductions
    PayAllocationNonStatutoryDeductionItem[] nonStatutoryDeductionsItems?;
};

public type IndicatorType boolean;

# The check or voucher number
public type PayrolloutputsPaymentdocumentid record {
    # An actual ID value
    string idValue?;
    # ID description
    string idDescription?;
    EarningssummaryEarningidAlternatedescriptions[] alternateDescriptions?;
    # The scheme code
    ImpoundaccountFinancialpartyFinancialpartyidSchemecode schemeCode?;
};

public type ImpoundaccountFinancialpartyCommunicationInstantmessages record {
    # A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary 
    ImpoundaccountFinancialpartyCommunicationNamecode nameCode?;
    # The URI of the associated email address
    string uri?;
    # The unique identifier of the object in a collection
    string itemID?;
};

# The account where the monies are to be distributed
public type Impoundaccount2Financialparty record {
    # A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    ImpoundaccountFinancialpartyNamecode nameCode?;
    # The address of the party
    Impoundaccount1FinancialpartyAddress address?;
    # The unique identifier of the associated party entity
    ImpoundaccountFinancialpartyFinancialpartyid financialPartyID?;
    # Identifies a standard format of Business Identifier Codes approved by the International Organization for Standardization (ISO). It is a unique identification code for both financial and non-financial institutions. The acronym SWIFT stands for the Society for Worldwide Interbank Financial Telecommunication. The SWIFT code consists of 8 or 11 characters. When 8-digits code is given, it refers to the primary office. First 4 characters - bank code (only letters), next 2 characters - ISO 3166-1 alpha-2 country code (only letters), next 2 characters - location code (letters and digits) (passive participant will have 1 in the second character). Last 3 characters - branch code
    string SWIFTCode?;
    # Branch code / number used to compose the routing id, along with the name if applicable
    ImpoundaccountFinancialpartyBranchnamecode branchNameCode?;
    # A routing (transit) number is a bank code used to facilitate automated monetary transfers, e.g. as issued by the American Bankers Association or the Canadian Payments Association or EU
    ImpoundaccountFinancialpartyRoutingtransitid routingTransitID?;
    # Communication mechanisms, e,g, phone, email, etc
    Impoundaccount2FinancialpartyCommunication communication?;
};

# Describes impound details, as applicable, of related monies
public type PayrolloutputsPayrollsummaryImpoundinformation record {
    # Indicate the party responsible for paying the taxes; values are ADP or Client
    EarningssummaryImpoundinformationImpoundpartycode impoundPartyCode?;
    # The accounts from which the associated monies will be impounded, as applicable
    Impoundaccount3 impoundAccount?;
    # Set of configuration tags relevant to the related instance
    EarningssummaryImpoundinformationConfigurationtags[] configurationTags?;
};

# A reference to the codelist extended with values
public type ValueSetType record {
    ValueSetMeta meta?;
    ValueSetItemType[] valueSetListItems?;
    LinktypeV02[] links?;
};

public type PaySummaryStatutoryDeductionsSection record {
    # The unique identifier of a instance within the collection
    string itemID?;
    # A description of the grouping of the associated data
    string sectionCategory?;
    # A descriptive name of the information contained in the section
    string sectionName?;
    #  Tax deductions
    PaySummaryStatutoryDeductionItem[] statutoryDeductionsItems?;
};

public type PaySummaryMemoItem record {
    # An identifier for a payroll item, e.g. a memo code or a policy type
    MemossummaryMemoid memoID?;
    # The amount of the associated output item
    MemossummaryMemoamount memoAmount?;
    # The number of the units associated to the output item
    MemossummaryMemoquantity memoQuantity?;
    # Payroll Accumulator Results
    MemoItemBasePayrollAccumulation[] payrollAccumulations?;
    # Set of configuration tags relevant to the related instance
    StatutorydeductionssummaryImpoundinformationConfigurationtags[] configurationTags?;
    # The unique identifier of a instance within the collection
    string itemID?;
    PaysummaryearningLinks[] links?;
};

# Each object contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).
public type ProcessMessageWithResourceStatusCode record {
    # An identifier for the instance of the process message.
    PayrolloutputsConfirmmessageProcessmessageid processMessageID?;
    # Process Message instances may be of type: success, warning, error, or info.
    PayrolloutputsConfirmmessageMessagetypecode messageTypeCode?;
    # Expression that provides the location (or source) of content in a message instance that is associated with a process message. Examples of expression languages include: XPath, XQuery, JSON Pointer.
    string sourceLocationExpression?;
    # Identifies the language used for expressions communicated in this message.
    PayrolloutputsConfirmmessageExpressionlanguagecode expressionLanguageCode?;
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    PayrolloutputsConfirmmessageLinks[] links?;
    # Message returned to the user
    PayrolloutputsConfirmmessageUsermessage userMessage?;
    # Message returned to the user
    PayrolloutputsConfirmmessageUsermessage developerMessage?;
    # DEPRECATED - Use messageTypeCode instead. The processing results status code of the resource of the request.
    PayrolloutputsConfirmmessageResourcestatuscode resourceStatusCode?;
};

public type PayrolloutputsConfirmmessageRequestlink record {
    # The URI of the related entity
    string href?;
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    # A unique identifier of the feature/function/operation, the link poins to
    string canonicalUri?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # The HTTP method code (HTTP Verb) traverse the link (GET, POST, PUT or DELETE)
    string method?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    PaymentdistributionssummaryPayloadarguments[] payLoadArguments?;
};

public type PayrollAdjustments record {
    # The type of adjustment
    PayrolloutputsPayrollsummaryAdjustmenttypecode adjustmentTypeCode?;
    # Total number of adjustments
    decimal totalAdjustmentQuantity?;
    # The total adjustment amount
    PayrolloutputsPayrollsummaryTotaladjustmentamount totalAdjustmentAmount?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

# The number of the units associated to the output item
public type MemossummaryMemoquantity record {
    # Quantity value
    decimal quantityValue?;
    # Units the quantity is based upon
    MemossummaryMemoquantityUnitcode unitCode?;
};

# Third party payment amount
public type PayrolloutputsPayrollsummaryTotalthirdpartypaymentamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # Standard currency code as per ISO 4212
    string currencyCode?;
};

# The account where the monies are to be distributed
public type Impoundaccount3Financialparty record {
    # A coded name or descriptive label of the associated entity. If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    ImpoundaccountFinancialpartyNamecode nameCode?;
    # The address of the party
    Impoundaccount1FinancialpartyAddress address?;
    # The unique identifier of the associated party entity
    ImpoundaccountFinancialpartyFinancialpartyid financialPartyID?;
    # Identifies a standard format of Business Identifier Codes approved by the International Organization for Standardization (ISO). It is a unique identification code for both financial and non-financial institutions. The acronym SWIFT stands for the Society for Worldwide Interbank Financial Telecommunication. The SWIFT code consists of 8 or 11 characters. When 8-digits code is given, it refers to the primary office. First 4 characters - bank code (only letters), next 2 characters - ISO 3166-1 alpha-2 country code (only letters), next 2 characters - location code (letters and digits) (passive participant will have 1 in the second character). Last 3 characters - branch code
    string SWIFTCode?;
    # Branch code / number used to compose the routing id, along with the name if applicable
    ImpoundaccountFinancialpartyBranchnamecode branchNameCode?;
    # A routing (transit) number is a bank code used to facilitate automated monetary transfers, e.g. as issued by the American Bankers Association or the Canadian Payments Association or EU
    ImpoundaccountFinancialpartyRoutingtransitid routingTransitID?;
    # Communication mechanisms, e,g, phone, email, etc
    Impoundaccount3FinancialpartyCommunication communication?;
};

# Summary of earnings
public type EarningsSummary record {
    # Payroll Accumulator Results
    EarningsSummaryPayrollAccumulation[] payrollAccumulations?;
    # Earnings sections
    EarningsSummarySection[] earningsSummarySections?;
};

public type PayAllocationEarningPayrollAccumulation record {
    # The accumulator code.
    EarningssummaryAccumulatorcode accumulatorCode?;
    # The accumulator description.
    string accumulatorDescription?;
    # The time unit upon which the accumulator is based, e.g. YTD, QTD
    EarningssummaryAccumulatortimeunitcode accumulatorTimeUnitCode?;
    # The amount of the associated payroll item
    EarningssummaryAccumulatedamount accumulatedAmount?;
    # The number of hours, days, etc. worked relative to the associated earning
    EarningssummaryAccumulatedtimeworkedquantity accumulatedTimeWorkedQuantity?;
    # The unique identifier of a instance within the collection
    string itemID?;
};

# Message returned to the user
public type PayrolloutputsConfirmmessageUsermessage record {
    # The code associated with the message description.
    string codeValue?;
    # Title of the message description.
    string title?;
    # The value/content of the message description.
    string messageTxt?;
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    PayrolloutputsLinks[] links?;
};

# Non-tax deductions 
public type PayAllocationNonStatutoryDeduction record {
    # Payroll Accumulator Results
    PayAllocationNonStatutoryDeductionPayrollAccumulation[] payrollAccumulations?;
    # Non-tax deductions
    PayAllocationNonStatutoryDeductionSection[] nonStatutoryDeductionSections?;
};

# Branch code / number used to compose the routing id, along with the name if applicable
public type ImpoundaccountFinancialpartyBranchnamecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};
