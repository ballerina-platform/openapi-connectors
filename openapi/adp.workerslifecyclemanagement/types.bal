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

# Minumum, maximum and median remuneration rates
public type RangetypeV02 record {
    # A representation of a rate value
    RatetypeV02 minimumRate?;
    # A representation of a rate value
    RatetypeV02 medianRate?;
    # A representation of a rate value
    RatetypeV02 maximumRate?;
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
    LinkType[] dependencyLinks?;
};

# Personal address objects / components
public type PersonaladdresstypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
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
    # A country sub-division correlating to a administrative level one or two levels below country. For example, in the United States, this might be a state or a county
    CountrysubdivisiontypeV02 countrySubdivisionLevel1?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 countryCode?;
    # The string of characters used to identify the postal code
    string postalCode?;
    # The coordinates of the location
    CoordinatetypeV02 geoCoordinate?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 scriptCode?;
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
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 streetTypeCode?;
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
    # A country sub-division correlating to a administrative level one or two levels below country. For example, in the United States, this might be a state or a county
    CountrysubdivisiontypeV02 countrySubdivisionLevel2?;
    # Boolean expression
    IndicatortypeV01 sameAsAddressIndicator?;
    # A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
    LinktypeV02 sameAsAddressLink?;
};

# This identifies the status of the event. An event that has initiated by the system of record, such as a benefits annual enrollment event, will have an event status code of created. An event that is saved in a work in progress state (as determined by the permissible state codes), will have an event status code of inProgress. An event that has been recorded, will have an event status code of complete. This is set by the system of record and valued based on a standard codeslist.
public type WorkeronleaveeventEventstatuscode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# Communication objects to include various communication mechanisms, e,g, phone, email, etc.
public type CommunicationtypeV02 record {
    # A list of land-line telephone numbers
    CommunicationtypeV02Landlines[] landlines?;
    # A list of mobile telephone numbers
    CommunicationtypeV02Landlines[] mobiles?;
    # A list of email addresses
    EmailContactCommunicationType[] emails?;
    # A list of social networks addresses
    SocialNetworkContactCommunicationType[] socialNetworks?;
    # A list of fax telephone numbers
    CommunicationtypeV02Landlines[] faxes?;
    # A list of pager telephone numbers
    CommunicationtypeV02Landlines[] pagers?;
    # A list of internet URIs
    InternetAddressWithItemID[] internetAddresses?;
    # A list of instant messages URIs
    SocialNetworkContactCommunicationType[] instantMessages?;
};

public type WorkAssignmentTransformAdditionalRemuneration record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 typeCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 intervalCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # A representation of a rate value
    RatetypeV02 rate?;
    # Describes the conditions under which the associated rate can be expected
    AdditionalRemunerationAssociatedRateQualifierType[] associatedRateQualifiers?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 effectiveDate?;
};

# The simple (string) identifier of an object
public type SimpleidtypeV02 string;

# A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
public type WorkeronleaveeventLinks record {
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
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource. The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
};

public type WorkerEventContext record {
    # A unique identifier of a covered individual when there is an AOID
    string associateOID?;
};

# The date range of the coverage for the related entity
public type SocialinsuranceprogramitemtypeV02Coverageperiod record {
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 startDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 endDate?;
};

public type StateIncomeTaxInstructionTransform record {
    # The code for the related entity
    CodetypeV01 stateCode?;
    # Boolean expression
    IndicatortypeV01 workedInJurisdictionIndicator?;
    # Boolean expression
    IndicatortypeV01 livedInJurisdictionIndicator?;
};

# The process results status code for the request.
public type ConfirmmessagetypeV01Requeststatuscode record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

# A worker is someone who performs duties and has responsibilities for an organization
public type WorkerTransform record {
    # The unique identifier of the related entity 
    IdtypeV02 workerID?;
    # Object describing the details of a person
    PersontypeV02 person?;
    # These dates are related to the highest level legal relationship that a person has with the organization. If a given worker has multiple relationships with the organization, these are the dates associated with the primary relationship.
    WorkerDatesTransform workerDates?;
    # Status to include the status code, effective date (ISO-8601:2000 format) and the reason for change
    StatusreasontypeV02 workerStatus?;
    # Communication objects to include various communication mechanisms, e,g, phone, email, etc.
    CommunicationtypeV02 businessCommunication?;
    # A work assignment pertains to the duties and responsibilities that should be performed by the worker
    WorkassignmenttransformtypeV02 workAssignment?;
    # A worker is someone who performs duties and has responsibilities for an organization
    PayrollTaxProfileTransform payrollTaxProfile?;
    # A container of custom fields. The category within each custom object allows for the categorizing or grouping of the associated custom field for the purpose of data mining. For example, the typeCode on a custom string object might be valued as SIZE and the correlating name codes might be t-shirt, pants, jacket, etc.
    CustomfieldcontainertypeV02 customFieldGroup?;
};

public type LinktypeV02Payloadarguments record {
    # Code value (typically a key field) of the code list item
    string argumentPath?;
    # Code value (typically a key field) of the code list item
    string argumentValue?;
};

# A work assignment pertains to the duties and responsibilities that should be performed by the worker
public type WorkassignmenttransformtypeV02 record {
    # Boolean expression
    IndicatortypeV01 primaryIndicator?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 offerExtensionDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 offerAcceptanceDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 hireDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 seniorityDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 expectedStartDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 actualStartDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 terminationDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 expectedTerminationDate?;
    # Status to include the status code, effective date (ISO-8601:2000 format) and the reason for change
    StatusreasontypeV02 assignmentStatus?;
    CostcentertypeV02[] assignmentCostCenters?;
    # Boolean expression
    IndicatortypeV01 workerProbationIndicator?;
    # The string reprersentation of the date range. Used to specify effective period.  Follows the ISO-8601:2000 format
    DateperiodtypeV01 workerProbationPeriod?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 workerTypeCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 assignmentTermCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 workLevelCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nationalityContextCode?;
    # Boolean expression
    IndicatortypeV01 vipIndicator?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 vipTypeCode?;
    # Boolean expression
    IndicatortypeV01 executiveIndicator?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 executiveTypeCode?;
    # Boolean expression
    IndicatortypeV01 officerIndicator?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 officerTypeCode?;
    # Boolean expression
    IndicatortypeV01 managementPositionIndicator?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 legalEntityID?;
    # Boolean expression
    IndicatortypeV01 highlyCompensatedIndicator?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 highlyCompensatedTypeCode?;
    # Boolean expression
    IndicatortypeV01 stockOwnerIndicator?;
    # A representation of a percentage value
    PercentagetypeV02 stockOwnerPercentage?;
    # A list of worker groups
    WorkAssignmentTransformWorkerGroup[] workerGroups?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 jobCode?;
    # The job title
    string jobTitle?;
    # A reference to a system used to classify workers into occupational categories for the purpose of collecting, calculating, or disseminating data. In the US, an example of this is the EEOC system; in the UK, an example of this is the SOC system. This is the at the assignment level in France
    WorkAssignmentTransformOccupationalClassification[] occupationalClassifications?;
    # The occupational classification reflects the type of job or work that the person does, while the industry classification reflects the business activity of their employer or company. The occupational and industry classifications are based on a persons sole or primary job, unless otherwise specified. For the unemployed, the occupation and industry are based on the last job held. An example of an industry classification code in the US is the NAICS code.
    WorkAssignmentTransformOccupationalClassification[] industryClassifications?;
    # A code indicating whether the work assignment is covered under applicable wage and labor laws relating to working hours, overtime, and similar protections, e.g. FLSA in the US
    WagelawcoveragetypeV02 wageLawCoverage?;
    # The unique identifier of a position
    PositionidtypeV02 positionID?;
    # The position title
    string positionTitle?;
    # An associated labor union
    LaboruniontypeV02 laborUnion?;
    # A bargaining unit is a group of employees who are so grouped for the purpose of collective bargaining. A bargaining unit is also known as a local labor union
    BargainingunittypeV02 bargainingUnit?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 workShiftCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 workArrangementCode?;
    # The standard number of hours of work associated to a position, typically used to drive the definition of a full time assignment, e.g. 40 in the US, 37.5 in the UK, 35 in FR. This number is usually expressed based on a week. The unitCode is used to convey that measurement.
    StandardhourstypeV02 standardHours?;
    # The ratio
    RatiotypeV02 fullTimeEquivalenceRatio?;
    # A list of the various types of home organizational units
    WorkAssignmentTransformHomeOrganizationalUnitItem[] homeOrganizationalUnits?;
    # A list of organizational units
    WorkAssignmentTransformAssignedOrganizationalUnitItem[] assignedOrganizationalUnits?;
    # Schema to describe details of a location
    LocationtypeV02 homeWorkLocation?;
    # A list of work locations
    WorkAssignmentTransformAssignedWorkLocation[] assignedWorkLocations?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 remunerationBasisCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 payCycleCode?;
    # The standard number of hours of work associated to a position, typically used to drive the definition of a full time assignment, e.g. 40 in the US, 37.5 in the UK, 35 in FR. This number is usually expressed based on a week. The unitCode is used to convey that measurement.
    StandardhourstypeV02 standardPayPeriodHours?;
    # The base or primary pay (i.e. salary, wage) associated to a work assignment. The structure allows for the explicit communication of pre-defined equivalents for the base remuneration
    WorkAssignmentTransformBaseRemuneration baseRemuneration?;
    # A list of pay compensations associated to a given work assignment. Additional remuneration includes all other forms of compensation beyond the base pay associated to a given work assignment.  The typeCode is used to further refine the type of compensation, e.g. bonus, commission, etc.
    WorkAssignmentTransformAdditionalRemuneration[] additionalRemunerations?;
    # A reference list of workers to whom a given worker reports
    WorkAssignmentTransformReportsTo[] reportsTo?;
    # Status to include the status code and effective date (ISO-8601:2000 format)
    StatustypeV02 payrollProcessingStatusCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 payScaleCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 payGradeCode?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 payrollGroupCode?;
    # A representation of a rate amount value
    RateamounttypeV02 annualBenefitBaseRate?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 payrollScheduleGroupID?;
    # The payroll file number
    string payrollFileNumber?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 payrollRegionCode?;
    # Minumum, maximum and median remuneration rates
    RangetypeV02 payGradePayRange?;
    # The ratio
    RatiotypeV02 compaRatio?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 payGradeStepCode?;
    # A representation of a rate value
    RatetypeV02 payGradeStepPayRate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 nextPayGradeStepDate?;
    # Represents the duration of time as represented by ISO 8601. Where the value space is a six dimensional space where the coordinates designate the Gregorian year, month, day, hour, minute, and second. The number of seconds can include decimal digits to arbitary pecision. PnYn MnDTnH nMnS, where: [n] is replaced by the value for each of the date and time elements that follow the [n]. Leading zeros are not required, but the maximum number of digits for each element should be agreed to by the communicating parties. The capital letters 'P', 'Y', 'M', 'W', 'D', 'T', 'H', 'M', and 'S' are designators for each of the date and time elements and are not replaced. P is the duration designator (historically called 'period') placed at the start of the duration representation. Y is the year designator that follows the value for the number of years. M is the month designator that follows the value for the number of months. D is the day designator that follows the value for the number of days. T is the time designator that precedes the time components of the representation. H is the hour designator that follows the value for the number of hours. M is the minute designator that follows the value for the number of minutes. S is the second designator that follows the value for the number of seconds. The number of seconds can include decimal digits to arbitrary precision
    DurationtypeV01 minimumPayGradeStepDuration?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 geographicPayDifferentialCode?;
    # A representation of a percentage value
    PercentagetypeV02 geographicPayDifferentialPercentage?;
    # A container of custom fields. The category within each custom object allows for the categorizing or grouping of the associated custom field for the purpose of data mining. For example, the typeCode on a custom string object might be valued as SIZE and the correlating name codes might be t-shirt, pants, jacket, etc.
    CustomfieldcontainertypeV02 customFieldGroup?;
};

# The assigned work location is the location (or locations) where the worker is physically located.
public type WorkAssignmentTransformAssignedWorkLocation record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # Communication objects to include various communication mechanisms, e,g, phone, email, etc.
    CommunicationtypeV02 communication?;
    # organization address objects / components
    OrganizationaddresstypeV02 address?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# A logical operation
public type WorkerhireeventmetaMetaLogicaloperators record {
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 logicalOperatorCode?;
    # Boolean expression
    IndicatortypeV01 mutuallyExclusiveIndicator?;
    # A list of mutually exclusive operator codes.
    SimplecodetypeV02[] mutuallyExclusiveLogicalOperatorCodes?;
};

# These dates are related to the highest level legal relationship that a person has with the organization. If a given worker has multiple relationships with the organization, these are the dates associated with the primary relationship.
public type WorkerDatesTransform record {
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 originalHireDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 rehireDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 adjustedServiceDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 acquisitionDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 retirementDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 terminationDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 expectedTerminationDate?;
};

public type CustomfieldcontainertypeV02Amountfields record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 categoryCode?;
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 currencyCode?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# The name of the contact
public type ContactnametypeV02 record {
    # The first name of the person
    string givenName?;
    # Person middle name or initial
    string middleName?;
    # Person family name 1
    string familyName1?;
    # Person family name 2
    string familyName2?;
    # A formatted version of the person name
    string formattedName?;
};

public type PersonoutputIdentitydocuments record {
    # The unique identifier of the object in a collection
    ItemidtypeV01 documentID?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 countryCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 typeCode?;
    # Schema describing the details of a party - an agency, bureau, or other organization issuing the associated document; the body or persons exercising power or command. An issuing party is often is a government agency or official authority, but sometimes might be a private organization
    PartybasetypeV02 issuingParty?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 issueDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 expirationDate?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# Social insurance is a government operated social security scheme that provides income loss, maternity, sickness benefits, and retirement pensions to the working population. It is funded by regular contributions based on wage or salary by both employees and employers, and by government through taxation. Examples in the USA are Medicare and Medicaid
public type SocialinsuranceprogramitemtypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 countryCode?;
    # Boolean expression
    IndicatortypeV01 coveredIndicator?;
    # The date range of the coverage for the related entity
    SocialinsuranceprogramitemtypeV02Coverageperiod coveragePeriod?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

public type WorkeronleaveeventmetaMetaDatatransforms record {
    # The unique identifier of the collection.
    string itemID?;
    StringCodeListType '\/eventReasonCode?;
    StringType '\/eventReasonCode\/codeValue?;
    StringType '\/eventReasonCode\/shortName?;
    StringType '\/eventReasonCode\/longName?;
    StringCodeListType '\/eventStatusCode?;
    StringType '\/eventStatusCode\/codeValue?;
    StringType '\/eventStatusCode\/shortName?;
    StringType '\/eventStatusCode\/longName?;
    StringType '\/effectiveDateTime?;
    BooleanType '\/notificationIndicator?;
    ObjectType '\/worker?;
    StringCodeListType '\/worker\/workerStatus?;
    StringType '\/worker\/workerStatus\/codeValue?;
    StringType '\/worker\/workerStatus\/shortName?;
    StringType '\/worker\/workerStatus\/longName?;
    StringType '\/worker\/workerStatus\/effectiveDate?;
};

# Object describing the details of a person
public type PersontypeV02 record {
    # A list of government identifiers
    GovernmentiditemtypeV02[] governmentIDs?;
    # Object describing the details of a person name
    PersonnametypeV02 legalName?;
    # Personal address objects / components
    PersonaladdresstypeV02 legalAddress?;
    # Communication objects to include various communication mechanisms, e,g, phone, email, etc.
    CommunicationtypeV02 communication?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 birthDate?;
    # Boolean expression
    IndicatortypeV01 deceasedIndicator?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 deathDate?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 genderCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 genderIdentityCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 sexualOrientationCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 religionCode?;
    # Status to include the status code and effective date (ISO-8601:2000 format)
    StatustypeV02 maritalStatusCode?;
    # Social insurance is a government operated social security scheme that provides income loss, maternity, sickness benefits, and retirement pensions to the working population. It is funded by regular contributions based on wage or salary by both employees and employers, and by government through taxation. Examples in the USA are Medicare and Medicaid
    SocialinsuranceprogramitemtypeV02[] socialInsurancePrograms?;
    # Boolean expression
    IndicatortypeV01 tobaccoUserIndicator?;
    # Boolean expression
    IndicatortypeV01 disabilityIdentificationDeclinedIndicator?;
    # Boolean expression
    IndicatortypeV01 disabledIndicator?;
    # Person disabilites, e.g. Amputee, Hearing Impairment, etc.
    CodetypeV02[] disabilityTypeCodes?;
    # A representation of a percentage value
    PercentagetypeV02 disabilityPercentage?;
    # Boolean expression
    IndicatortypeV01 studentIndicator?;
    # Status to include the status code and effective date (ISO-8601:2000 format)
    StatustypeV02 studentStatusCode?;
    # A list of identity documents, that serve as to confirm the identification of the holder , e.g. a birth certificate, an ID Card
    PersonoutputIdentitydocuments[] identityDocuments?;
    # A list of immigration documents for a person who is not a citizen of the country in which he or see resides , e.g. a passport, visa, alien registration card, aka, green card, residence permit, etc.
    PersonoutputImmigrationdocuments[] immigrationDocuments?;
    # A list of passport documents, issued by a national govenment which certifies the identiy and nationality of its holder
    PersonoutputIdentitydocuments[] passports?;
    # A list of documents that authorize work, e.g. visas, a work permit, a labor card, etc.
    PersonoutputIdentitydocuments[] workAuthorizationDocuments?;
    # Object describing the details of a person name
    PersonnametypeV02 preferredName?;
    # Other preferred names of the person expressed in a different language or script
    PersonoutputAlternatepreferrednames[] alternatePreferredNames?;
    # Former names of the person in the associated context
    PersonoutputFormernames[] formerNames?;
    # Object describing the details of a person name
    PersonnametypeV02 birthName?;
    # The place a person was born. This can have taxation impacts. Inlcudes certain address components
    BirthplacetypeV02 birthPlace?;
    # A list of addresses related to the associated entity
    PersonoutputOtherpersonaladdresses[] otherPersonalAddresses?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 ethnicityCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 ethnicityGroupCode?;
    # Race is a classification system used to categorize humans into large and distinct populations or groups by heritable phenotypic characteristics, geographic ancestry, culture, history, language, physical appearance, ethnicity, and social status
    PersonoutputRacecode raceCode?;
    # Person countries of citizenship, in which the Address is in. ISO_3166-1-alpha-2 code list
    CodetypeV02[] citizenshipCountryCodes?;
    # Person countries of residence.
    CodetypeV02[] residencyCountryCodes?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 highestEducationLevelCode?;
    # Status to include the status code and effective date (ISO-8601:2000 format)
    StatustypeV02 militaryStatusCode?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 militaryDischargeDate?;
    # Person military classification, e.g. Armed Forces Medal Veteran, Disabled Veteran, etc.
    CodetypeV02[] militaryClassificationCodes?;
    # A container of custom fields. The category within each custom object allows for the categorizing or grouping of the associated custom field for the purpose of data mining. For example, the typeCode on a custom string object might be valued as SIZE and the correlating name codes might be t-shirt, pants, jacket, etc.
    CustomfieldcontainertypeV02 customFieldGroup?;
    LinktypeV02[] links?;
};

# Data which sets the context for the event.  That is, the keys which set context
public type WorkeronleaveeventDataEventcontext record {
    # A globally unique (GUID) identifier of the context expression. This conveys the context of the associated data. For example, if the context is set to Germany, the data would adhere to the business rules and formatting rules relevant to Germany
    string contextExpressionID?;
    WorkerEventContext 'worker?;
};

public type CodeListType record {
    # Code list title
    string codeListTitle?;
    IndicatorType exclusiveIndicator?;
    CodeListItemType[] listItems?;
    LinkType[] links?;
};

# List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
public type DependencyListType record {
};

# This allows for further refinement of the associated event. For example, for a worker.maritalStatus.change event, the reason code could be used to describe whether it is a Marriage vs. Divorce vs. Separation.
public type WorkeronleaveeventDataTransformEventreasoncode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type UriType string;

# A single query parameter
public type WorkerhireQueryCriterion record {
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
    WorkerhireeventmetaMetaLogicaloperators[] logicalOperators?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# The HOME organizational unit defines the work assignment and perhaps funds it. The should only be one home organizational unit for a given type, e.g. only one home department.
public type WorkAssignmentTransformHomeOrganizationalUnitItem record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 typeCode?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# The status of the work assignment, e.g. active, inactive
public type Workeroutput1WorkerstatusStatuscode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# organization address objects / components
public type OrganizationaddresstypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
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
    # A country sub-division correlating to a administrative level one or two levels below country. For example, in the United States, this might be a state or a county
    CountrysubdivisiontypeV02 countrySubdivisionLevel1?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 countryCode?;
    # The string of characters used to identify the postal code
    string postalCode?;
    # The coordinates of the location
    CoordinatetypeV02 geoCoordinate?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 scriptCode?;
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
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 streetTypeCode?;
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
    # A country sub-division correlating to a administrative level one or two levels below country. For example, in the United States, this might be a state or a county
    CountrysubdivisiontypeV02 countrySubdivisionLevel2?;
};

# A worker is someone who performs duties and has responsibilities for an organization
public type Workertransform1 record {
    # The status of the worker in the organization at the highest level. If a given worker has multiple relationships with the organization, this is the status that arches over all those relationships
    Workertransform1Workerstatus workerStatus?;
};

# A worker is someone who performs duties and has responsibilities for an organization
public type Workertransform3 record {
    # These dates are related to the highest level legal relationship that a person has with the organization. If a given worker has multiple relationships with the organization, these are the dates associated with the primary relationship.
    Workerdatestransform1 workerDates?;
    # Status to include the status code and effective date (ISO-8601:2000 format)
    StatustypeV02 workerStatus?;
    # Boolean expression
    IndicatortypeV01 voluntaryIndicator?;
};

# The unique identifier of an assoicate
public type AssociateoidtypeV02 string;

# A worker is someone who performs duties and has responsibilities for an organization
public type Workertransform2 record {
    # The unique identifier of an assoicate
    AssociateoidtypeV02 associateOID?;
    # The unique identifier of the related entity 
    IdtypeV02 workerID?;
    # Object describing the details of a person
    PersontypeV02 person?;
    # These dates are related to the highest level legal relationship that a person has with the organization. If a given worker has multiple relationships with the organization, these are the dates associated with the primary relationship.
    WorkerDatesTransform workerDates?;
    # Status to include the status code, effective date (ISO-8601:2000 format) and the reason for change
    StatusreasontypeV02 workerStatus?;
    # Communication objects to include various communication mechanisms, e,g, phone, email, etc.
    CommunicationtypeV02 businessCommunication?;
    # A work assignment pertains to the duties and responsibilities that should be performed by the worker
    WorkassignmenttransformtypeV02 workAssignment?;
    # A container of custom fields. The category within each custom object allows for the categorizing or grouping of the associated custom field for the purpose of data mining. For example, the typeCode on a custom string object might be valued as SIZE and the correlating name codes might be t-shirt, pants, jacket, etc.
    CustomfieldcontainertypeV02 customFieldGroup?;
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

# Event Data
public type WorkeronleaveeventData record {
    # Data which sets the context for the event.  That is, the keys which set context
    WorkeronleaveeventDataEventcontext eventContext?;
    # Data which is transformed as a result of the event
    WorkeronleaveeventDataTransform transform?;
    # Result of the event
    WorkeronleaveeventDataOutput output?;
};

# The standard number of hours of work associated to a position, typically used to drive the definition of a full time assignment, e.g. 40 in the US, 37.5 in the UK, 35 in FR. This number is usually expressed based on a week. The unitCode is used to convey that measurement.
public type StandardhourstypeV02 record {
    # The number of hours
    decimal hoursQuantity?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 unitCode?;
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
    LinkType[] links?;
};

public type CustomfieldcontainertypeV02Percentfields record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 categoryCode?;
    # The percentage value
    decimal percentValue?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

public type WorkerTerminateEventMeta record {
    # Event meta data
    WorkerterminateeventmetaMeta meta?;
};

public type CustomfieldcontainertypeV02Stringfields record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 categoryCode?;
    # A custom string
    string stringValue?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# Data which sets the context for the event.  That is, the keys which set context
public type WorkerterminateeventDataEventcontext record {
    # The simple (string) identifier of an object
    SimpleidtypeV02 contextExpressionID?;
    Workereventcontext1 'worker?;
};

public type PersonoutputAlternatepreferrednames record {
    # The first name of the person
    string givenName?;
    # Person middle name or initial
    string middleName?;
    # Person family name 1
    string familyName1?;
    # Person family name 2
    string familyName2?;
    # A formatted version of the person name
    string formattedName?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 scriptCode?;
    # A list of preferred salutations
    SalutationtypeV02[] preferredSalutations?;
    # Person title Prefix Codes
    TitleaffixtypeV02[] titlePrefixCodes?;
    # A preferred name, e.g. a nickname
    string nickName?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 generationAffixCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 qualificationAffixCode?;
    # Person titles
    TitleaffixtypeV02[] titleAffixCodes?;
    # Person family name pre-fix
    string familyName1Prefix?;
    # Person family name pre-fix
    string familyName2Prefix?;
    # Person initials
    string initials?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 languageCode?;
};

# Data which is transformed as a result of the event
public type WorkeronleaveeventDataTransform record {
    # This allows for further refinement of the associated event. For example, for a worker.maritalStatus.change event, the reason code could be used to describe whether it is a Marriage vs. Divorce vs. Separation.
    WorkeronleaveeventDataTransformEventreasoncode eventReasonCode?;
    # This identifies the status of the event. An event that has been created, either by the system of record or as the result of a user, will have an event status code of Created. An event that is saved in a work in progress state (as determined by the permissable state codes), will have an event status code of InProgress. An event that has been recorded, will have an event status code of Complete. This value is set by the system of record.
    WorkeronleaveeventDataTransformEventstatuscode eventStatusCode?;
    # This is the effective date, or effective date time fo the event from a business perspective. In some systems, this may be referred to as the Event Date. For example, for a birth event, this is the date of birth. If there is no effective date from a business perspective, this is set equal to the record date time.
    string effectiveDateTime?;
    # A worker is someone who performs duties and has responsibilities for an organization
    Workertransform1 'worker?;
};

# Status to include the status code and effective date (ISO-8601:2000 format)
public type StatustypeV02 record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 effectiveDate?;
};

# The scheme code
public type WorkeronleaveeventOriginatorApplicationidSchemecode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type StringCodeListType record {
    CodeListType codeList?;
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
    LinkType[] dependencyLinks?;
};

# An instance to capture the worker rehire event
public type WorkerrehireeventEvents record {
    # The unique identifier of the event instance. This is set by the system of record once an event is recorded as in progress or complete
    string eventID?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 serviceCategoryCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventNameCode?;
    # The event title offers a way to describe a particular instance of an event at a level more granular than the event name, e.g. 2014 Annual Enrollment
    string eventTitle?;
    # The event sub title provides event instance summary details, e.g. All Annual Enrollment elections become effective on January 1, 2014
    string eventSubTitle?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventReasonCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventStatusCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 priorityCode?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 recordDateTime?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 creationDateTime?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 effectiveDateTime?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 expirationDateTime?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 dueDateTime?;
    # Boolean expression
    IndicatortypeV01 notificationIndicator?;
    EventoriginatortypeV01 originator?;
    EventactortypeV01 actor?;
    # The party (client employee) information that the actor is acting as to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) in read only mode.
    WorkerhireeventActasparty actAsParty?;
    # The party (client employee) that the actor is acting on behalf of to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) and can take action on that person's behalf.  The Actor may have access to certain features or screens that the Client Employee cannot view, e.g. diagnostics screens.
    WorkerhireeventOnbehalfofparty onBehalfOfParty?;
    # The entity tag of the entity in the request
    string eTag?;
    LinktypeV02[] links?;
    # Event Data
    WorkerrehireeventData data?;
};

# The coordinates of the location
public type CoordinatetypeV02 record {
    # The angle, in degrees, of a position on Earth above the equator. (Latitude is negative for a place below the equator.) specified in decimal degrees
    decimal latitude?;
    # The angle, in degrees, of a position on Earth around the equator from the Greenwich Meridian specified in decimal degrees
    decimal longitude?;
};

public type CommunicationtypeV02Landlines record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The country dialing code is the national prefix to be used when dialing TO that particular country FROM another country. 
    string countryDialing?;
    # The local area dialing code for a telephone number.
    string areaDialing?;
    # The local communication number, not including country dialing or area dialing codes.   If component parts of the telephone number are being communicated then the dialNumber is required.
    string dialNumber?;
    # The extension of the local communication number.  In the case of a Telephone Number accessing a Pager Network, the extension may be the Pager Identification Number required to leave a message for the Pager Number (i.e. Pager Pin).  These are mutually exclusive.
    string extension?;
    # National Direct Dialing Prefix.  Also known as the trunk prefix or National Prefix.  It is the number to be dialed in a domestic telephone call, preceding any necessary area code and subscriber number (i.e. dial number).  When calling from outside of the country, the national direct dial prefix is omitted by the caller.  In Australia, Germany, and United Kingdom the trunk prefix is 0.  In the US and Canada it is 1.
    string access?;
    # The formatted telephone number.  The component parts of the telephone are put together into a presentation pattern as defined by the regex format specified.  Please note that is used as an escape character in regex, but a double  is needed to escape within the json schema.  The regex will accept +CC NNNNNNNNNNNNNN where + is the symbol indicating the caller to enter their country specific code to call from outside the country.  CC is the country code for an international number (optional), and the area code and dial number.  The local access code (i.e. 1 (201) 333 4444. 1 is the access code in US) is not passed.  The UI will present the phone number following its own presentation convention
    string formattedNumber?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    boolean notificationIndicator?;
};

# Identifies the language used for expressions communicated in this message.
public type ConfirmmessagetypeV01Expressionlanguagecode record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

# A country sub-division correlating to a administrative level one or two levels below country. For example, in the United States, this might be a state or a county
public type CountrysubdivisiontypeV02 record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The type of a country sub-division, e.g. state, county
    string subdivisionType?;
};

public type BooleanSameAsAddressIndicatorType record {
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
    # Indicates the default value which should be populated by default
    boolean 'default?;
    # Provides 1 to many properties which the value of this property must be equal to.  If the property is equal to any of the value of the properties then the validation is successful.
    string[] 'equals?;
    # List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
    DependencyListType dependencies?;
    # Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
    HelperMessageType helperMessage?;
    MetaDataType dataType?;
    LinkType[] dependencyLinks?;
    LinkType[] links?;
};

# The ASSIGNED organizational unit is one for which the work assignment is doing work
public type WorkAssignmentTransformAssignedOrganizationalUnitItem record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 typeCode?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

public type EventoriginatortypeV01 record {
    *OriginatortypeV02;
};

public type CustomfieldcontainertypeV02Numberfields record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 categoryCode?;
    # A custom number
    decimal numberValue?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
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

# A worker is someone who performs duties and has responsibilities for an organization
public type PayrollTaxProfileTransform record {
    StateIncomeTaxInstructionTransform[] stateIncomeTaxInstructions?;
    SUIInstructionTransform suiTaxInstruction?;
};

# Object describing the details of a person name
public type PersonnametypeV02 record {
    # The first name of the person
    string givenName?;
    # Person middle name or initial
    string middleName?;
    # Person family name 1
    string familyName1?;
    # Person family name 2
    string familyName2?;
    # A formatted version of the person name
    string formattedName?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 scriptCode?;
    # A list of preferred salutations
    SalutationtypeV02[] preferredSalutations?;
    # Person title Prefix Codes
    TitleaffixtypeV02[] titlePrefixCodes?;
    # A preferred name, e.g. a nickname
    string nickName?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 generationAffixCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 qualificationAffixCode?;
    # Person titles
    TitleaffixtypeV02[] titleAffixCodes?;
    # Person family name pre-fix
    string familyName1Prefix?;
    # Person family name pre-fix
    string familyName2Prefix?;
    # Person initials
    string initials?;
};

# A work assignment pertains to the duties and responsibilities that should be performed by the worker
public type WorkassignmenttypeV02 record {
    # Boolean expression
    IndicatortypeV01 primaryIndicator?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 offerExtensionDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 offerAcceptanceDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 hireDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 seniorityDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 expectedStartDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 actualStartDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 terminationDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 expectedTerminationDate?;
    # Status to include the status code, effective date (ISO-8601:2000 format) and the reason for change
    StatusreasontypeV02 assignmentStatus?;
    CostcentertypeV02[] assignmentCostCenters?;
    # Boolean expression
    IndicatortypeV01 workerProbationIndicator?;
    # The string reprersentation of the date range. Used to specify effective period.  Follows the ISO-8601:2000 format
    DateperiodtypeV01 workerProbationPeriod?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 workerTypeCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 assignmentTermCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 workLevelCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nationalityContextCode?;
    # Boolean expression
    IndicatortypeV01 vipIndicator?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 vipTypeCode?;
    # Boolean expression
    IndicatortypeV01 executiveIndicator?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 executiveTypeCode?;
    # Boolean expression
    IndicatortypeV01 officerIndicator?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 officerTypeCode?;
    # Boolean expression
    IndicatortypeV01 managementPositionIndicator?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 legalEntityID?;
    # Boolean expression
    IndicatortypeV01 highlyCompensatedIndicator?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 highlyCompensatedTypeCode?;
    # Boolean expression
    IndicatortypeV01 stockOwnerIndicator?;
    # A representation of a percentage value
    PercentagetypeV02 stockOwnerPercentage?;
    # A list of worker groups
    WorkAssignmentTransformWorkerGroup[] workerGroups?;
    # Status to include the status code and effective date (ISO-8601:2000 format)
    StatustypeV02 jobCode?;
    # The job title
    string jobTitle?;
    # A reference to a system used to classify workers into occupational categories for the purpose of collecting, calculating, or disseminating data. In the US, an example of this is the EEOC system; in the UK, an example of this is the SOC system. This is the at the assignment level in France
    WorkAssignmentTransformOccupationalClassification[] occupationalClassifications?;
    # The occupational classification reflects the type of job or work that the person does, while the industry classification reflects the business activity of their employer or company. The occupational and industry classifications are based on a persons sole or primary job, unless otherwise specified. For the unemployed, the occupation and industry are based on the last job held. An example of an industry classification code in the US is the NAICS code.
    WorkAssignmentTransformOccupationalClassification[] industryClassifications?;
    # A code indicating whether the work assignment is covered under applicable wage and labor laws relating to working hours, overtime, and similar protections, e.g. FLSA in the US
    WagelawcoveragetypeV02 wageLawCoverage?;
    # The unique identifier of a position
    PositionidtypeV02 positionID?;
    # The position title
    string positionTitle?;
    # An associated labor union
    LaboruniontypeV02 laborUnion?;
    # A bargaining unit is a group of employees who are so grouped for the purpose of collective bargaining. A bargaining unit is also known as a local labor union
    BargainingunittypeV02 bargainingUnit?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 workShiftCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 workArrangementCode?;
    # The standard number of hours of work associated to a position, typically used to drive the definition of a full time assignment, e.g. 40 in the US, 37.5 in the UK, 35 in FR. This number is usually expressed based on a week. The unitCode is used to convey that measurement.
    StandardhourstypeV02 standardHours?;
    # The ratio
    RatiotypeV02 fullTimeEquivalenceRatio?;
    # A list of the various types of home organizational units
    WorkAssignmentTransformHomeOrganizationalUnitItem[] homeOrganizationalUnits?;
    # A list of organizational units
    WorkAssignmentTransformAssignedOrganizationalUnitItem[] assignedOrganizationalUnits?;
    # Schema to describe details of a location
    LocationtypeV02 homeWorkLocation?;
    # A list of work locations
    WorkAssignmentTransformAssignedWorkLocation[] assignedWorkLocations?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 remunerationBasisCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 payCycleCode?;
    # The standard number of hours of work associated to a position, typically used to drive the definition of a full time assignment, e.g. 40 in the US, 37.5 in the UK, 35 in FR. This number is usually expressed based on a week. The unitCode is used to convey that measurement.
    StandardhourstypeV02 standardPayPeriodHours?;
    # The base or primary pay (i.e. salary, wage) associated to a work assignment. The structure allows for the explicit communication of pre-defined equivalents for the base remuneration
    WorkassignmenttypeV02Baseremuneration baseRemuneration?;
    # A list of pay compensations associated to a given work assignment. Additional remuneration includes all other forms of compensation beyond the base pay associated to a given work assignment.  The typeCode is used to further refine the type of compensation, e.g. bonus, commission, etc.
    WorkAssignmentTransformAdditionalRemuneration[] additionalRemunerations?;
    # A reference list of workers to whom a given worker reports
    WorkAssignmentTransformReportsTo[] reportsTo?;
    # Status to include the status code and effective date (ISO-8601:2000 format)
    StatustypeV02 payrollProcessingStatusCode?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 payrollGroupCode?;
    # A representation of a rate amount value
    RateamounttypeV02 annualBenefitBaseRate?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 payrollScheduleGroupID?;
    # The payroll file number
    string payrollFileNumber?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 payrollRegionCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 payScaleCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 payGradeCode?;
    # Minumum, maximum and median remuneration rates
    RangetypeV02 payGradePayRange?;
    # The ratio
    RatiotypeV02 compaRatio?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 payGradeStepCode?;
    # A representation of a rate value
    RatetypeV02 payGradeStepPayRate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 nextPayGradeStepDate?;
    # Represents the duration of time as represented by ISO 8601. Where the value space is a six dimensional space where the coordinates designate the Gregorian year, month, day, hour, minute, and second. The number of seconds can include decimal digits to arbitary pecision. PnYn MnDTnH nMnS, where: [n] is replaced by the value for each of the date and time elements that follow the [n]. Leading zeros are not required, but the maximum number of digits for each element should be agreed to by the communicating parties. The capital letters 'P', 'Y', 'M', 'W', 'D', 'T', 'H', 'M', and 'S' are designators for each of the date and time elements and are not replaced. P is the duration designator (historically called 'period') placed at the start of the duration representation. Y is the year designator that follows the value for the number of years. M is the month designator that follows the value for the number of months. D is the day designator that follows the value for the number of days. T is the time designator that precedes the time components of the representation. H is the hour designator that follows the value for the number of hours. M is the minute designator that follows the value for the number of minutes. S is the second designator that follows the value for the number of seconds. The number of seconds can include decimal digits to arbitrary precision
    DurationtypeV01 minimumPayGradeStepDuration?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 geographicPayDifferentialCode?;
    # A representation of a percentage value
    PercentagetypeV02 geographicPayDifferentialPercentage?;
    # A container of custom fields. The category within each custom object allows for the categorizing or grouping of the associated custom field for the purpose of data mining. For example, the typeCode on a custom string object might be valued as SIZE and the correlating name codes might be t-shirt, pants, jacket, etc.
    CustomfieldcontainertypeV02 customFieldGroup?;
    LinktypeV02[] links?;
};

public type DisallowItemType record {
    # A unique identifier of an object within the collection
    ItemIDType itemID?;
};

# The ConfirmMessage contains the processing results for the corresponding request.  A request may have its processing reported as: succeeded, partially failed, or failed.
public type ConfirmmessagetypeV01 record {
    # The unique identifier of the related entity 
    IdtypeV01 confirmMessageID?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 createDateTime?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 requestReceiptDateTime?;
    # The code for the related entity
    CodetypeV01 protocolStatusCode?;
    # The code for the related entity
    CodetypeV01 protocolCode?;
    # The unique identifier of the related entity 
    IdtypeV01 requestID?;
    # The process results status code for the request.
    ConfirmmessagetypeV01Requeststatuscode requestStatusCode?;
    # The method that was used on the request corresponding to this message instance.
    ConfirmmessagetypeV01Requestmethodcode requestMethodCode?;
    # The unique identifier of the related entity 
    IdtypeV01 sessionID?;
    # The entity tag of the entity in the request.
    string requestETag?;
    # A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
    LinktypeV02 requestLink?;
    # Processing status of the related request message.
    ConfirmmessagetypeV01Processingstatuscode processingStatusCode?;
    # processMessage is optional and contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).  Most often there will be a single instance for an associated request or resource, but this structure allows for more than one if needed, for example, if multiple errors exist for a single resource. 
    ProcessmessageV01[] processMessages?;
    # resource Message contains the resource-specific processing results for resources being managed in the request.  A resource may have its processing reported as:  succeeded or failed.  It must be used to represent resource-specific messages.  In the case of a request managing multiple resources and resource-specific messages are to be returned, then this array will contain one object for each such resource of the request.
    ConfirmmessagetypeV01Resourcemessages[] resourceMessages?;
};

# Status to include the status code, effective date (ISO-8601:2000 format) and the reason for change
public type StatusreasontypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 statusCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 reasonCode?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 effectiveDate?;
};

# An instance to capture the worker hire event
public type WorkerhireeventEvents record {
    # The unique identifier of the event instance. This is set by the system of record once an event is recorded as in progress or complete
    string eventID?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 serviceCategoryCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventNameCode?;
    # The event title offers a way to describe a particular instance of an event at a level more granular than the event name, e.g. 2014 Annual Enrollment
    string eventTitle?;
    # The event sub title provides event instance summary details, e.g. All Annual Enrollment elections become effective on January 1, 2014
    string eventSubTitle?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventReasonCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventStatusCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 priorityCode?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 recordDateTime?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 creationDateTime?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 effectiveDateTime?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 expirationDateTime?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 dueDateTime?;
    # Boolean expression
    IndicatortypeV01 notificationIndicator?;
    EventoriginatortypeV01 originator?;
    EventactortypeV01 actor?;
    # The party (client employee) information that the actor is acting as to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) in read only mode.
    WorkerhireeventActasparty actAsParty?;
    # The party (client employee) that the actor is acting on behalf of to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) and can take action on that person's behalf.  The Actor may have access to certain features or screens that the Client Employee cannot view, e.g. diagnostics screens.
    WorkerhireeventOnbehalfofparty onBehalfOfParty?;
    # The entity tag of the entity in the request
    string eTag?;
    LinktypeV02[] links?;
    # Event Data
    WorkerhireeventData data?;
};

public type SimpleIDType string;

# The party (client employee) information that the actor is acting as to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) in read only mode.
public type WorkerhireeventActasparty record {
    # The unique identifier of the related entity 
    IdtypeV02 applicationID?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 associateOID?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 personOID?;
    # Human readable name of the actor
    string formattedName?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 deviceID?;
    # The coordinates of the location
    CoordinatetypeV02 geoCoordinate?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 deviceUserAgentID?;
    # An event instance
    AssignedGroup[] assignedGroups?;
    # The unique identifier - UUID
    OidtypeV02 organizationOID?;
};

# Each object contains detailed information for a resource referenced in the original request.
public type ConfirmmessagetypeV01Resourcemessages record {
    # The unique identifier of the related entity 
    IdtypeV01 resourceMessageID?;
    # The processing results status code of the resource of the request.
    ResourceMessageResourceStatus resourceStatusCode?;
    # A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
    LinktypeV02 resourceLink?;
    # processMessage is optional and contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level). Most often there will be a single instance for an associated request or resource, but this structure allows for more than one if needed, for example, if multiple errors exist for a single resource. 
    ProcessMessageWithResourceStatusCode[] processMessages?;
};

public type InternetAddressWithItemID record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The URI of the related entity
    UritypeV01 uri?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

public type Workereventcontext1 record {
    # The unique identifier of an assoicate
    AssociateoidtypeV02 associateOID?;
    # The unique identifier of the related entity 
    IdtypeV02 workerID?;
};

public type CodelisttypeV03 record {
    # Code list title
    string codeListTitle?;
    # Boolean expression
    IndicatortypeV01 exclusiveIndicator?;
    CodelistitemtypeV02[] listItems?;
    LinktypeV02[] links?;
};

# An originator is a user, machine or event that triggered the event.
public type WorkeronleaveeventOriginator record {
    # The unique identifier of the application which originated the event.
    WorkeronleaveeventOriginatorApplicationid applicationID?;
    # The unique identifier of an associate who originated the event.
    string associateOID?;
    # Human readable name of the event originator
    string formattedName?;
    # The unique identifier of the event instance. This is generated once an event is recorded with an event status code equal to Complete. This value is set by the system of record.
    string eventID?;
    # This is the canonical name of the event, e.g. dependent.add, worker.hire.
    WorkeronleaveeventOriginatorEventnamecode eventNameCode?;
    # The unique identifier of the device, e.g. a time clock, door entry beam.
    string deviceID?;
};

public type SocialNetworkContactCommunicationType record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The URI of the related entity
    UritypeV01 uri?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    boolean notificationIndicator?;
};

public type WorkAssignmentTransformWorkerGroup record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 groupCode?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

public type WorkerHireEventMeta record {
    # Event meta data
    WorkerhireeventmetaMeta meta?;
};

public type WorkerRehireEvent record {
    # An event instance
    WorkerrehireeventEvents[] events?;
    # Meta contains the metadata associated with a response.  A GET response may include metadata to support pagination
    MetatypeV02 meta?;
    # The ConfirmMessage contains the processing results for the corresponding request.  A request may have its processing reported as: succeeded, partially failed, or failed.
    ConfirmmessagetypeV01 confirmMessage?;
};

# Result of the event
public type WorkerrehireeventDataOutput record {
    # A worker is someone who performs duties and has responsibilities for an organization
    Workeroutput2 'worker?;
};

# The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
public type DatetimetypeV01 string;

# Processing status of the related request message.
public type ConfirmmessagetypeV01Processingstatuscode record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

# Data which sets the context for the event.  That is, the keys which set context
public type EventcontextbaseV01 record {
    # The simple (string) identifier of an object
    SimpleidtypeV02 contextExpressionID?;
};

public type WorkerHireEvent record {
    # An event instance
    WorkerhireeventEvents[] events?;
    # Meta contains the metadata associated with a response.  A GET response may include metadata to support pagination
    MetatypeV02 meta?;
    # The ConfirmMessage contains the processing results for the corresponding request.  A request may have its processing reported as: succeeded, partially failed, or failed.
    ConfirmmessagetypeV01 confirmMessage?;
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
    LinkType[] dependencyLinks?;
};

public type PersonoutputOtherpersonaladdresses record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
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
    # A country sub-division correlating to a administrative level one or two levels below country. For example, in the United States, this might be a state or a county
    CountrysubdivisiontypeV02 countrySubdivisionLevel1?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 countryCode?;
    # The string of characters used to identify the postal code
    string postalCode?;
    # The coordinates of the location
    CoordinatetypeV02 geoCoordinate?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 scriptCode?;
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
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 streetTypeCode?;
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
    # A country sub-division correlating to a administrative level one or two levels below country. For example, in the United States, this might be a state or a county
    CountrysubdivisiontypeV02 countrySubdivisionLevel2?;
    # Boolean expression
    IndicatortypeV01 sameAsAddressIndicator?;
    # A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
    LinktypeV02 sameAsAddressLink?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 typeCode?;
};

# The reason associated to the correlating status, e.g. new hire, rehire, termination, etc.
public type Workeroutput1WorkerstatusReasoncode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# This identifies the status of the event. An event that has been created, either by the system of record or as the result of a user, will have an event status code of Created. An event that is saved in a work in progress state (as determined by the permissable state codes), will have an event status code of InProgress. An event that has been recorded, will have an event status code of Complete. This value is set by the system of record.
public type WorkeronleaveeventDataTransformEventstatuscode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# Validation rules for the event context
public type WorkeronleaveeventmetaMetaDataeventcontext record {
    StringType '\/contextExpressionID?;
    ObjectType '\/worker?;
    StringType '\/worker\/associateOID?;
};

# Validation rules for the event context
public type WorkerterminateeventmetaMetaDataeventcontext record {
    StringType '\/contextExpressionID?;
    ObjectType '\/worker?;
    StringType '\/worker\/associateOID?;
    ObjectType '\/worker\/workerID?;
    StringType '\/worker\/workerID\/idValue?;
    StringCodeListType '\/worker\/workerID\/schemeCode?;
    StringType '\/worker\/workerID\/schemeCode\/codeValue?;
    StringType '\/worker\/workerID\/schemeCode\/shortName?;
    StringType '\/worker\/workerID\/schemeCode\/longName?;
};

# This is the canonical name of the event, e.g. dependent.add, worker.hire. This field is always present and valued based on a standard codelist.
public type WorkeronleaveeventEventnamecode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type WorkerterminateeventmetaMetaDatatransforms record {
    # The unique identifier of the collection.
    string itemID?;
    StringCodeListType '\/eventReasonCode?;
    StringType '\/eventReasonCode\/codeValue?;
    StringType '\/eventReasonCode\/shortName?;
    StringType '\/eventReasonCode\/longName?;
    StringCodeListType '\/eventStatusCode?;
    StringType '\/eventStatusCode\/codeValue?;
    StringType '\/eventStatusCode\/shortName?;
    StringType '\/eventStatusCode\/longName?;
    StringType '\/effectiveDateTime?;
    BooleanType '\/notificationIndicator?;
    ObjectType '\/worker?;
    ObjectType '\/worker\/workerDates?;
    StringType '\/worker\/workerDates\/terminationDate?;
    StringType '\/worker\/workerDates\/expectedTerminationDate?;
    StringCodeListType '\/worker\/workerStatus?;
    StringType '\/worker\/workerStatus\/codeValue?;
    StringType '\/worker\/workerStatus\/shortName?;
    StringType '\/worker\/workerStatus\/longName?;
    StringType '\/worker\/workerStatus\/effectiveDate?;
    BooleanType '\/worker\/voluntaryIndicator?;
};

# Representation of a message.
public type MessagetypeV01 record {
    # The code associated with the message description.
    string codeValue?;
    # Title of the message description.
    string title?;
    # The value/content of the message description.
    string messageTxt?;
    # A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    LinktypeV02[] links?;
};

# Result of the event
public type WorkerterminateeventDataOutput record {
    # A worker is someone who performs duties and has responsibilities for an organization
    Workeroutput3 'worker?;
};

# An associate is a person with a relationship to an organization
public type PersonOutput record {
    # A list of government identifiers
    GovernmentiditemtypeV02[] governmentIDs?;
    # Object describing the details of a person name
    PersonnametypeV02 legalName?;
    # Personal address objects / components
    PersonaladdresstypeV02 legalAddress?;
    # Communication objects to include various communication mechanisms, e,g, phone, email, etc.
    CommunicationtypeV02 communication?;
    # The birth date of the person. Follows the ISO-8601:2000 format
    string birthDate?;
    # Boolean expression
    IndicatortypeV01 deceasedIndicator?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 deathDate?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 genderCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 genderIdentityCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 sexualOrientationCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 religionCode?;
    # Status to include the status code and effective date (ISO-8601:2000 format)
    StatustypeV02 maritalStatusCode?;
    # Social insurance is a government operated social security scheme that provides income loss, maternity, sickness benefits, and retirement pensions to the working population. It is funded by regular contributions based on wage or salary by both employees and employers, and by government through taxation. Examples in the USA are Medicare and Medicaid
    SocialinsuranceprogramitemtypeV02[] socialInsurancePrograms?;
    # Boolean expression
    IndicatortypeV01 tobaccoUserIndicator?;
    # Boolean expression
    IndicatortypeV01 disabilityIdentificationDeclinedIndicator?;
    # Boolean expression
    IndicatortypeV01 disabledIndicator?;
    # Person disabilites, e.g. Amputee, Hearing Impairment, etc.
    CodetypeV02[] disabilityTypeCodes?;
    # A representation of a percentage value
    PercentagetypeV02 disabilityPercentage?;
    # Boolean expression
    IndicatortypeV01 studentIndicator?;
    # Status to include the status code and effective date (ISO-8601:2000 format)
    StatustypeV02 studentStatusCode?;
    # A list of identity documents, that serve as to confirm the identification of the holder , e.g. a birth certificate, an ID Card
    PersonoutputIdentitydocuments[] identityDocuments?;
    # A list of immigration documents for a person who is not a citizen of the country in which he or see resides , e.g. a passport, visa, alien registration card, aka, green card, residence permit, etc.
    PersonoutputImmigrationdocuments[] immigrationDocuments?;
    # A list of passport documents, issued by a national govenment which certifies the identiy and nationality of its holder
    PersonoutputIdentitydocuments[] passports?;
    # A list of documents that authorize work, e.g. visas, a work permit, a labor card, etc.
    PersonoutputIdentitydocuments[] workAuthorizationDocuments?;
    # Object describing the details of a person name
    PersonnametypeV02 preferredName?;
    # Other preferred names of the person expressed in a different language or script
    PersonoutputAlternatepreferrednames[] alternatePreferredNames?;
    # Former names of the person in the associated context
    PersonoutputFormernames[] formerNames?;
    # Object describing the details of a person name
    PersonnametypeV02 birthName?;
    # The place a person was born. This can have taxation impacts. Inlcudes certain address components
    BirthplacetypeV02 birthPlace?;
    # A list of addresses related to the associated entity
    PersonoutputOtherpersonaladdresses[] otherPersonalAddresses?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 ethnicityCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 ethnicityGroupCode?;
    # Race is a classification system used to categorize humans into large and distinct populations or groups by heritable phenotypic characteristics, geographic ancestry, culture, history, language, physical appearance, ethnicity, and social status
    PersonoutputRacecode raceCode?;
    # Person countries of citizenship, in which the Address is in. ISO_3166-1-alpha-2 code list
    CodetypeV02[] citizenshipCountryCodes?;
    # Person countries of residence.
    CodetypeV02[] residencyCountryCodes?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 highestEducationLevelCode?;
    # Status to include the status code and effective date (ISO-8601:2000 format)
    StatustypeV02 militaryStatusCode?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 militaryDischargeDate?;
    # Person military classification, e.g. Armed Forces Medal Veteran, Disabled Veteran, etc.
    CodetypeV02[] militaryClassificationCodes?;
    # A container of custom fields. The category within each custom object allows for the categorizing or grouping of the associated custom field for the purpose of data mining. For example, the typeCode on a custom string object might be valued as SIZE and the correlating name codes might be t-shirt, pants, jacket, etc.
    CustomfieldcontainertypeV02 customFieldGroup?;
    LinktypeV02[] links?;
};

# The cost Center is used for taxing the costs of the related entity
public type CostcentertypeV02 record {
    # The simple (string) identifier of an object
    SimpleidtypeV02 costCenterID?;
    # The cost center name of the activity
    string costCenterName?;
    # A representation of a percentage value
    PercentagetypeV02 costCenterPercentage?;
};

# The party (client employee) that the actor is acting on behalf of to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) and can take action on that person's behalf.  The Actor may have access to certain features or screens that the Client Employee cannot view, e.g. diagnostics screens.
public type WorkerhireeventOnbehalfofparty record {
    # The unique identifier of the related entity 
    IdtypeV02 applicationID?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 associateOID?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 personOID?;
    # Human readable name of the actor
    string formattedName?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 deviceID?;
    # The coordinates of the location
    CoordinatetypeV02 geoCoordinate?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 deviceUserAgentID?;
    # An event instance
    AssignedGroup[] assignedGroups?;
    # The unique identifier - UUID
    OidtypeV02 organizationOID?;
};

# The email URI of the related entity
public type EmailuritypeV02 string;

# A government identifier, e.g. a national identity number or a social insurance number
public type GovernmentiditemtypeV02 record {
    # An actual ID
    string idValue?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 countryCode?;
    # Status to include the status code and effective date (ISO-8601:2000 format)
    StatustypeV02 statusCode?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 expirationDate?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

public type WorkerhireeventmetaMetaDatatransforms record {
    # The unique identifier of the collection.
    string itemID?;
    StringCodeListType '\/eventReasonCode?;
    StringType '\/eventReasonCode\/codeValue?;
    StringType '\/eventReasonCode\/shortName?;
    StringType '\/eventReasonCode\/longName?;
    StringCodeListType '\/eventStatusCode?;
    StringType '\/eventStatusCode\/codeValue?;
    StringType '\/eventStatusCode\/shortName?;
    StringType '\/eventStatusCode\/longName?;
    StringType '\/effectiveDateTime?;
    BooleanType '\/notificationIndicator?;
    ObjectType '\/worker?;
    ObjectType '\/worker\/workerID?;
    StringType '\/worker\/workerID\/idValue?;
    StringCodeListType '\/worker\/workerID\/schemeCode?;
    StringType '\/worker\/workerID\/schemeCode\/codeValue?;
    StringType '\/worker\/workerID\/schemeCode\/shortName?;
    StringType '\/worker\/workerID\/schemeCode\/longName?;
    ObjectType '\/worker\/person?;
    ArrayType '\/worker\/person\/governmentIDs?;
    StringType '\/worker\/person\/governmentIDs\/idValue?;
    StringCodeListType '\/worker\/person\/governmentIDs\/nameCode?;
    StringType '\/worker\/person\/governmentIDs\/nameCode\/codeValue?;
    StringType '\/worker\/person\/governmentIDs\/nameCode\/shortName?;
    StringType '\/worker\/person\/governmentIDs\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/governmentIDs\/countryCode?;
    StringCodeListType '\/worker\/person\/governmentIDs\/statusCode?;
    StringType '\/worker\/person\/governmentIDs\/statusCode\/codeValue?;
    StringType '\/worker\/person\/governmentIDs\/statusCode\/shortName?;
    StringType '\/worker\/person\/governmentIDs\/statusCode\/longName?;
    StringType '\/worker\/person\/governmentIDs\/statusCode\/effectiveDate?;
    StringType '\/worker\/person\/governmentIDs\/expirationDate?;
    StringType '\/worker\/person\/governmentIDs\/itemID?;
    ObjectType '\/worker\/person\/legalName?;
    StringType '\/worker\/person\/legalName\/givenName?;
    StringType '\/worker\/person\/legalName\/middleName?;
    StringType '\/worker\/person\/legalName\/familyName1?;
    StringType '\/worker\/person\/legalName\/familyName2?;
    StringType '\/worker\/person\/legalName\/formattedName?;
    StringCodeListType '\/worker\/person\/legalName\/nameCode?;
    StringType '\/worker\/person\/legalName\/nameCode\/codeValue?;
    StringType '\/worker\/person\/legalName\/nameCode\/shortName?;
    StringType '\/worker\/person\/legalName\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/legalName\/scriptCode?;
    StringType '\/worker\/person\/legalName\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/legalName\/scriptCode\/shortName?;
    StringType '\/worker\/person\/legalName\/scriptCode\/longName?;
    ArrayType '\/worker\/person\/legalName\/preferredSalutations?;
    StringCodeListType '\/worker\/person\/legalName\/preferredSalutations\/salutationCode?;
    StringType '\/worker\/person\/legalName\/preferredSalutations\/salutationCode\/codeValue?;
    StringType '\/worker\/person\/legalName\/preferredSalutations\/salutationCode\/shortName?;
    StringType '\/worker\/person\/legalName\/preferredSalutations\/salutationCode\/longName?;
    StringCodeListType '\/worker\/person\/legalName\/preferredSalutations\/typeCode?;
    StringType '\/worker\/person\/legalName\/preferredSalutations\/typeCode\/codeValue?;
    StringType '\/worker\/person\/legalName\/preferredSalutations\/typeCode\/shortName?;
    StringType '\/worker\/person\/legalName\/preferredSalutations\/typeCode\/longName?;
    NumberType '\/worker\/person\/legalName\/preferredSalutations\/sequenceNumber?;
    ArrayType '\/worker\/person\/legalName\/titlePrefixCodes?;
    StringCodeListType '\/worker\/person\/legalName\/titlePrefixCodes\/affixCode?;
    StringType '\/worker\/person\/legalName\/titlePrefixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/legalName\/titlePrefixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/legalName\/titlePrefixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/legalName\/titlePrefixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/legalName\/nickName?;
    StringCodeListType '\/worker\/person\/legalName\/generationAffixCode?;
    StringType '\/worker\/person\/legalName\/generationAffixCode\/codeValue?;
    StringType '\/worker\/person\/legalName\/generationAffixCode\/shortName?;
    StringType '\/worker\/person\/legalName\/generationAffixCode\/longName?;
    StringCodeListType '\/worker\/person\/legalName\/qualificationAffixCode?;
    StringType '\/worker\/person\/legalName\/qualificationAffixCode\/codeValue?;
    StringType '\/worker\/person\/legalName\/qualificationAffixCode\/shortName?;
    StringType '\/worker\/person\/legalName\/qualificationAffixCode\/longName?;
    ArrayType '\/worker\/person\/legalName\/titleAffixCodes?;
    StringCodeListType '\/worker\/person\/legalName\/titleAffixCodes\/affixCode?;
    StringType '\/worker\/person\/legalName\/titleAffixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/legalName\/titleAffixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/legalName\/titleAffixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/legalName\/titleAffixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/legalName\/familyName1Prefix?;
    StringType '\/worker\/person\/legalName\/familyName2Prefix?;
    StringType '\/worker\/person\/legalName\/initials?;
    ObjectType '\/worker\/person\/legalAddress?;
    StringCodeListType '\/worker\/person\/legalAddress\/nameCode?;
    StringType '\/worker\/person\/legalAddress\/nameCode\/codeValue?;
    StringType '\/worker\/person\/legalAddress\/nameCode\/shortName?;
    StringType '\/worker\/person\/legalAddress\/nameCode\/longName?;
    StringType '\/worker\/person\/legalAddress\/attentionOfName?;
    StringType '\/worker\/person\/legalAddress\/careOfName?;
    StringType '\/worker\/person\/legalAddress\/lineOne?;
    StringType '\/worker\/person\/legalAddress\/lineTwo?;
    StringType '\/worker\/person\/legalAddress\/lineThree?;
    StringType '\/worker\/person\/legalAddress\/cityName?;
    StringCodeListType '\/worker\/person\/legalAddress\/countrySubdivisionLevel1?;
    StringType '\/worker\/person\/legalAddress\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/person\/legalAddress\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/person\/legalAddress\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/person\/legalAddress\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/person\/legalAddress\/countryCode?;
    StringCodeListType '\/worker\/person\/legalAddress\/postalCode?;
    ObjectType '\/worker\/person\/legalAddress\/geoCoordinate?;
    NumberType '\/worker\/person\/legalAddress\/geoCoordinate\/latitude?;
    NumberType '\/worker\/person\/legalAddress\/geoCoordinate\/longitude?;
    StringCodeListType '\/worker\/person\/legalAddress\/scriptCode?;
    StringType '\/worker\/person\/legalAddress\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/legalAddress\/scriptCode\/shortName?;
    StringType '\/worker\/person\/legalAddress\/scriptCode\/longName?;
    StringType '\/worker\/person\/legalAddress\/lineFour?;
    StringType '\/worker\/person\/legalAddress\/lineFive?;
    StringType '\/worker\/person\/legalAddress\/buildingNumber?;
    StringType '\/worker\/person\/legalAddress\/buildingName?;
    StringType '\/worker\/person\/legalAddress\/blockName?;
    StringType '\/worker\/person\/legalAddress\/streetName?;
    StringCodeListType '\/worker\/person\/legalAddress\/streetTypeCode?;
    StringType '\/worker\/person\/legalAddress\/streetTypeCode\/codeValue?;
    StringType '\/worker\/person\/legalAddress\/streetTypeCode\/shortName?;
    StringType '\/worker\/person\/legalAddress\/streetTypeCode\/longName?;
    StringType '\/worker\/person\/legalAddress\/unit?;
    StringType '\/worker\/person\/legalAddress\/floor?;
    StringType '\/worker\/person\/legalAddress\/stairCase?;
    StringType '\/worker\/person\/legalAddress\/door?;
    StringType '\/worker\/person\/legalAddress\/postOfficeBox?;
    StringType '\/worker\/person\/legalAddress\/deliveryPoint?;
    StringType '\/worker\/person\/legalAddress\/plotID?;
    StringCodeListType '\/worker\/person\/legalAddress\/countrySubdivisionLevel2?;
    StringType '\/worker\/person\/legalAddress\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/person\/legalAddress\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/person\/legalAddress\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/person\/legalAddress\/countrySubdivisionLevel2\/subdivisionType?;
    BooleanSameAsAddressIndicatorType '\/worker\/person\/legalAddress\/sameAsAddressIndicator?;
    ObjectType '\/worker\/person\/legalAddress\/sameAsAddressLink?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/href?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/rel?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/canonicalUri?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/title?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/targetSchema?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/mediaType?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/method?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/encType?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/schema?;
    ArrayType '\/worker\/person\/legalAddress\/sameAsAddressLink\/payLoadArguments?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/payLoadArguments\/argumentPath?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/payLoadArguments\/argumentValue?;
    ObjectType '\/worker\/person\/communication?;
    ArrayType '\/worker\/person\/communication\/landlines?;
    StringCodeListType '\/worker\/person\/communication\/landlines\/nameCode?;
    StringType '\/worker\/person\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/worker\/person\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/worker\/person\/communication\/landlines\/nameCode\/longName?;
    StringType '\/worker\/person\/communication\/landlines\/countryDialing?;
    StringType '\/worker\/person\/communication\/landlines\/areaDialing?;
    StringType '\/worker\/person\/communication\/landlines\/dialNumber?;
    StringType '\/worker\/person\/communication\/landlines\/extension?;
    StringType '\/worker\/person\/communication\/landlines\/access?;
    StringType '\/worker\/person\/communication\/landlines\/formattedNumber?;
    StringType '\/worker\/person\/communication\/landlines\/itemID?;
    BooleanType '\/worker\/person\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/worker\/person\/communication\/mobiles?;
    StringCodeListType '\/worker\/person\/communication\/mobiles\/nameCode?;
    StringType '\/worker\/person\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/worker\/person\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/worker\/person\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/worker\/person\/communication\/mobiles\/countryDialing?;
    StringType '\/worker\/person\/communication\/mobiles\/areaDialing?;
    StringType '\/worker\/person\/communication\/mobiles\/dialNumber?;
    StringType '\/worker\/person\/communication\/mobiles\/extension?;
    StringType '\/worker\/person\/communication\/mobiles\/access?;
    StringType '\/worker\/person\/communication\/mobiles\/formattedNumber?;
    StringType '\/worker\/person\/communication\/mobiles\/itemID?;
    BooleanType '\/worker\/person\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/worker\/person\/communication\/emails?;
    StringCodeListType '\/worker\/person\/communication\/emails\/nameCode?;
    StringType '\/worker\/person\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/worker\/person\/communication\/emails\/nameCode\/shortName?;
    StringType '\/worker\/person\/communication\/emails\/nameCode\/longName?;
    StringType '\/worker\/person\/communication\/emails\/emailUri?;
    StringType '\/worker\/person\/communication\/emails\/itemID?;
    BooleanType '\/worker\/person\/communication\/emails\/notificationIndicator?;
    ArrayType '\/worker\/person\/communication\/socialNetworks?;
    StringCodeListType '\/worker\/person\/communication\/socialNetworks\/nameCode?;
    StringType '\/worker\/person\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/worker\/person\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/worker\/person\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/worker\/person\/communication\/socialNetworks\/uri?;
    StringType '\/worker\/person\/communication\/socialNetworks\/itemID?;
    BooleanType '\/worker\/person\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/worker\/person\/communication\/faxes?;
    StringCodeListType '\/worker\/person\/communication\/faxes\/nameCode?;
    StringType '\/worker\/person\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/worker\/person\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/worker\/person\/communication\/faxes\/nameCode\/longName?;
    StringType '\/worker\/person\/communication\/faxes\/countryDialing?;
    StringType '\/worker\/person\/communication\/faxes\/areaDialing?;
    StringType '\/worker\/person\/communication\/faxes\/dialNumber?;
    StringType '\/worker\/person\/communication\/faxes\/extension?;
    StringType '\/worker\/person\/communication\/faxes\/access?;
    StringType '\/worker\/person\/communication\/faxes\/formattedNumber?;
    StringType '\/worker\/person\/communication\/faxes\/itemID?;
    BooleanType '\/worker\/person\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/worker\/person\/communication\/pagers?;
    StringCodeListType '\/worker\/person\/communication\/pagers\/nameCode?;
    StringType '\/worker\/person\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/worker\/person\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/worker\/person\/communication\/pagers\/nameCode\/longName?;
    StringType '\/worker\/person\/communication\/pagers\/countryDialing?;
    StringType '\/worker\/person\/communication\/pagers\/areaDialing?;
    StringType '\/worker\/person\/communication\/pagers\/dialNumber?;
    StringType '\/worker\/person\/communication\/pagers\/extension?;
    StringType '\/worker\/person\/communication\/pagers\/access?;
    StringType '\/worker\/person\/communication\/pagers\/formattedNumber?;
    StringType '\/worker\/person\/communication\/pagers\/itemID?;
    BooleanType '\/worker\/person\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/worker\/person\/communication\/internetAddresses?;
    StringCodeListType '\/worker\/person\/communication\/internetAddresses\/nameCode?;
    StringType '\/worker\/person\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/worker\/person\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/worker\/person\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/worker\/person\/communication\/internetAddresses\/uri?;
    StringType '\/worker\/person\/communication\/internetAddresses\/itemID?;
    ArrayType '\/worker\/person\/communication\/instantMessages?;
    StringCodeListType '\/worker\/person\/communication\/instantMessages\/nameCode?;
    StringType '\/worker\/person\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/worker\/person\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/worker\/person\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/worker\/person\/communication\/instantMessages\/uri?;
    StringType '\/worker\/person\/communication\/instantMessages\/itemID?;
    BooleanType '\/worker\/person\/communication\/instantMessages\/notificationIndicator?;
    StringType '\/worker\/person\/birthDate?;
    BooleanType '\/worker\/person\/deceasedIndicator?;
    StringType '\/worker\/person\/deathDate?;
    StringCodeListType '\/worker\/person\/genderCode?;
    StringType '\/worker\/person\/genderCode\/codeValue?;
    StringType '\/worker\/person\/genderCode\/shortName?;
    StringType '\/worker\/person\/genderCode\/longName?;
    StringCodeListType '\/worker\/person\/genderIdentityCode?;
    StringType '\/worker\/person\/genderIdentityCode\/codeValue?;
    StringType '\/worker\/person\/genderIdentityCode\/shortName?;
    StringType '\/worker\/person\/genderIdentityCode\/longName?;
    StringCodeListType '\/worker\/person\/sexualOrientationCode?;
    StringType '\/worker\/person\/sexualOrientationCode\/codeValue?;
    StringType '\/worker\/person\/sexualOrientationCode\/shortName?;
    StringType '\/worker\/person\/sexualOrientationCode\/longName?;
    StringCodeListType '\/worker\/person\/religionCode?;
    StringType '\/worker\/person\/religionCode\/codeValue?;
    StringType '\/worker\/person\/religionCode\/shortName?;
    StringType '\/worker\/person\/religionCode\/longName?;
    StringCodeListType '\/worker\/person\/maritalStatusCode?;
    StringType '\/worker\/person\/maritalStatusCode\/codeValue?;
    StringType '\/worker\/person\/maritalStatusCode\/shortName?;
    StringType '\/worker\/person\/maritalStatusCode\/longName?;
    StringType '\/worker\/person\/maritalStatusCode\/effectiveDate?;
    ArrayType '\/worker\/person\/socialInsurancePrograms?;
    StringCodeListType '\/worker\/person\/socialInsurancePrograms\/nameCode?;
    StringType '\/worker\/person\/socialInsurancePrograms\/nameCode\/codeValue?;
    StringType '\/worker\/person\/socialInsurancePrograms\/nameCode\/shortName?;
    StringType '\/worker\/person\/socialInsurancePrograms\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/socialInsurancePrograms\/countryCode?;
    BooleanType '\/worker\/person\/socialInsurancePrograms\/coveredIndicator?;
    ObjectType '\/worker\/person\/socialInsurancePrograms\/coveragePeriod?;
    StringType '\/worker\/person\/socialInsurancePrograms\/coveragePeriod\/startDate?;
    StringType '\/worker\/person\/socialInsurancePrograms\/coveragePeriod\/endDate?;
    StringType '\/worker\/person\/socialInsurancePrograms\/itemID?;
    BooleanType '\/worker\/person\/tobaccoUserIndicator?;
    BooleanType '\/worker\/person\/disabilityIdentificationDeclinedIndicator?;
    BooleanType '\/worker\/person\/disabledIndicator?;
    StringCodeListType '\/worker\/person\/disabilityTypeCodes?;
    StringType '\/worker\/person\/disabilityTypeCodes\/codeValue?;
    StringType '\/worker\/person\/disabilityTypeCodes\/shortName?;
    StringType '\/worker\/person\/disabilityTypeCodes\/longName?;
    NumberType '\/worker\/person\/disabilityPercentage?;
    BooleanType '\/worker\/person\/studentIndicator?;
    StringCodeListType '\/worker\/person\/studentStatusCode?;
    StringType '\/worker\/person\/studentStatusCode\/codeValue?;
    StringType '\/worker\/person\/studentStatusCode\/shortName?;
    StringType '\/worker\/person\/studentStatusCode\/longName?;
    StringType '\/worker\/person\/studentStatusCode\/effectiveDate?;
    ArrayType '\/worker\/person\/identityDocuments?;
    StringType '\/worker\/person\/identityDocuments\/documentID?;
    StringCodeListType '\/worker\/person\/identityDocuments\/countryCode?;
    StringCodeListType '\/worker\/person\/identityDocuments\/typeCode?;
    StringType '\/worker\/person\/identityDocuments\/typeCode\/codeValue?;
    StringType '\/worker\/person\/identityDocuments\/typeCode\/shortName?;
    StringType '\/worker\/person\/identityDocuments\/typeCode\/longName?;
    ObjectType '\/worker\/person\/identityDocuments\/issuingParty?;
    StringCodeListType '\/worker\/person\/identityDocuments\/issuingParty\/nameCode?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/nameCode\/codeValue?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/nameCode\/shortName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/nameCode\/longName?;
    ObjectType '\/worker\/person\/identityDocuments\/issuingParty\/address?;
    StringCodeListType '\/worker\/person\/identityDocuments\/issuingParty\/address\/nameCode?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/nameCode\/codeValue?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/nameCode\/shortName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/nameCode\/longName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/attentionOfName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/careOfName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/lineOne?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/lineTwo?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/lineThree?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/cityName?;
    StringCodeListType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel1?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countryCode?;
    StringCodeListType '\/worker\/person\/identityDocuments\/issuingParty\/address\/postalCode?;
    ObjectType '\/worker\/person\/identityDocuments\/issuingParty\/address\/geoCoordinate?;
    NumberType '\/worker\/person\/identityDocuments\/issuingParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/worker\/person\/identityDocuments\/issuingParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/worker\/person\/identityDocuments\/issuingParty\/address\/scriptCode?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/scriptCode\/shortName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/scriptCode\/longName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/lineFour?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/lineFive?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/buildingNumber?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/buildingName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/blockName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/streetName?;
    StringCodeListType '\/worker\/person\/identityDocuments\/issuingParty\/address\/streetTypeCode?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/streetTypeCode\/shortName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/streetTypeCode\/longName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/unit?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/floor?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/stairCase?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/door?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/postOfficeBox?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/deliveryPoint?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/plotID?;
    StringCodeListType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel2?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    StringType '\/worker\/person\/identityDocuments\/issueDate?;
    StringType '\/worker\/person\/identityDocuments\/expirationDate?;
    StringType '\/worker\/person\/identityDocuments\/itemID?;
    ArrayType '\/worker\/person\/immigrationDocuments?;
    StringType '\/worker\/person\/immigrationDocuments\/documentID?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/countryCode?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/typeCode?;
    StringType '\/worker\/person\/immigrationDocuments\/typeCode\/codeValue?;
    StringType '\/worker\/person\/immigrationDocuments\/typeCode\/shortName?;
    StringType '\/worker\/person\/immigrationDocuments\/typeCode\/longName?;
    ObjectType '\/worker\/person\/immigrationDocuments\/issuingParty?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/issuingParty\/nameCode?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/nameCode\/codeValue?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/nameCode\/shortName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/nameCode\/longName?;
    ObjectType '\/worker\/person\/immigrationDocuments\/issuingParty\/address?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/nameCode?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/nameCode\/codeValue?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/nameCode\/shortName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/nameCode\/longName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/attentionOfName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/careOfName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/lineOne?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/lineTwo?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/lineThree?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/cityName?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel1?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countryCode?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/postalCode?;
    ObjectType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/geoCoordinate?;
    NumberType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/scriptCode?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/scriptCode\/shortName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/scriptCode\/longName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/lineFour?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/lineFive?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/buildingNumber?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/buildingName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/blockName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/streetName?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/streetTypeCode?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/streetTypeCode\/shortName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/streetTypeCode\/longName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/unit?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/floor?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/stairCase?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/door?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/postOfficeBox?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/deliveryPoint?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/plotID?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel2?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    StringType '\/worker\/person\/immigrationDocuments\/issueDate?;
    StringType '\/worker\/person\/immigrationDocuments\/expirationDate?;
    StringType '\/worker\/person\/immigrationDocuments\/authorizedStayDuration?;
    StringType '\/worker\/person\/immigrationDocuments\/reentryRequirementDuration?;
    StringType '\/worker\/person\/immigrationDocuments\/itemID?;
    ArrayType '\/worker\/person\/passports?;
    StringType '\/worker\/person\/passports\/documentID?;
    StringCodeListType '\/worker\/person\/passports\/countryCode?;
    StringCodeListType '\/worker\/person\/passports\/typeCode?;
    StringType '\/worker\/person\/passports\/typeCode\/codeValue?;
    StringType '\/worker\/person\/passports\/typeCode\/shortName?;
    StringType '\/worker\/person\/passports\/typeCode\/longName?;
    ObjectType '\/worker\/person\/passports\/issuingParty?;
    StringCodeListType '\/worker\/person\/passports\/issuingParty\/nameCode?;
    StringType '\/worker\/person\/passports\/issuingParty\/nameCode\/codeValue?;
    StringType '\/worker\/person\/passports\/issuingParty\/nameCode\/shortName?;
    StringType '\/worker\/person\/passports\/issuingParty\/nameCode\/longName?;
    ObjectType '\/worker\/person\/passports\/issuingParty\/address?;
    StringCodeListType '\/worker\/person\/passports\/issuingParty\/address\/nameCode?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/nameCode\/codeValue?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/nameCode\/shortName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/nameCode\/longName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/attentionOfName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/careOfName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/lineOne?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/lineTwo?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/lineThree?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/cityName?;
    StringCodeListType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel1?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/person\/passports\/issuingParty\/address\/countryCode?;
    StringCodeListType '\/worker\/person\/passports\/issuingParty\/address\/postalCode?;
    ObjectType '\/worker\/person\/passports\/issuingParty\/address\/geoCoordinate?;
    NumberType '\/worker\/person\/passports\/issuingParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/worker\/person\/passports\/issuingParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/worker\/person\/passports\/issuingParty\/address\/scriptCode?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/scriptCode\/shortName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/scriptCode\/longName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/lineFour?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/lineFive?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/buildingNumber?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/buildingName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/blockName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/streetName?;
    StringCodeListType '\/worker\/person\/passports\/issuingParty\/address\/streetTypeCode?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/streetTypeCode\/shortName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/streetTypeCode\/longName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/unit?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/floor?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/stairCase?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/door?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/postOfficeBox?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/deliveryPoint?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/plotID?;
    StringCodeListType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel2?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    StringType '\/worker\/person\/passports\/issueDate?;
    StringType '\/worker\/person\/passports\/expirationDate?;
    StringType '\/worker\/person\/passports\/itemID?;
    ArrayType '\/worker\/person\/workAuthorizationDocuments?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/documentID?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/countryCode?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/typeCode?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/typeCode\/codeValue?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/typeCode\/shortName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/typeCode\/longName?;
    ObjectType '\/worker\/person\/workAuthorizationDocuments\/issuingParty?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/nameCode?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/nameCode\/codeValue?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/nameCode\/shortName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/nameCode\/longName?;
    ObjectType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/nameCode?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/nameCode\/codeValue?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/nameCode\/shortName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/nameCode\/longName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/attentionOfName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/careOfName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/lineOne?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/lineTwo?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/lineThree?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/cityName?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel1?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countryCode?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/postalCode?;
    ObjectType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/geoCoordinate?;
    NumberType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/scriptCode?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/scriptCode\/shortName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/scriptCode\/longName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/lineFour?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/lineFive?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/buildingNumber?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/buildingName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/blockName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/streetName?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/streetTypeCode?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/streetTypeCode\/shortName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/streetTypeCode\/longName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/unit?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/floor?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/stairCase?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/door?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/postOfficeBox?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/deliveryPoint?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/plotID?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel2?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issueDate?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/expirationDate?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/itemID?;
    ObjectType '\/worker\/person\/preferredName?;
    StringType '\/worker\/person\/preferredName\/givenName?;
    StringType '\/worker\/person\/preferredName\/middleName?;
    StringType '\/worker\/person\/preferredName\/familyName1?;
    StringType '\/worker\/person\/preferredName\/familyName2?;
    StringType '\/worker\/person\/preferredName\/formattedName?;
    StringCodeListType '\/worker\/person\/preferredName\/nameCode?;
    StringType '\/worker\/person\/preferredName\/nameCode\/codeValue?;
    StringType '\/worker\/person\/preferredName\/nameCode\/shortName?;
    StringType '\/worker\/person\/preferredName\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/preferredName\/scriptCode?;
    StringType '\/worker\/person\/preferredName\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/preferredName\/scriptCode\/shortName?;
    StringType '\/worker\/person\/preferredName\/scriptCode\/longName?;
    ArrayType '\/worker\/person\/preferredName\/preferredSalutations?;
    StringCodeListType '\/worker\/person\/preferredName\/preferredSalutations\/salutationCode?;
    StringType '\/worker\/person\/preferredName\/preferredSalutations\/salutationCode\/codeValue?;
    StringType '\/worker\/person\/preferredName\/preferredSalutations\/salutationCode\/shortName?;
    StringType '\/worker\/person\/preferredName\/preferredSalutations\/salutationCode\/longName?;
    StringCodeListType '\/worker\/person\/preferredName\/preferredSalutations\/typeCode?;
    StringType '\/worker\/person\/preferredName\/preferredSalutations\/typeCode\/codeValue?;
    StringType '\/worker\/person\/preferredName\/preferredSalutations\/typeCode\/shortName?;
    StringType '\/worker\/person\/preferredName\/preferredSalutations\/typeCode\/longName?;
    NumberType '\/worker\/person\/preferredName\/preferredSalutations\/sequenceNumber?;
    ArrayType '\/worker\/person\/preferredName\/titlePrefixCodes?;
    StringCodeListType '\/worker\/person\/preferredName\/titlePrefixCodes\/affixCode?;
    StringType '\/worker\/person\/preferredName\/titlePrefixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/preferredName\/titlePrefixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/preferredName\/titlePrefixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/preferredName\/titlePrefixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/preferredName\/nickName?;
    StringCodeListType '\/worker\/person\/preferredName\/generationAffixCode?;
    StringType '\/worker\/person\/preferredName\/generationAffixCode\/codeValue?;
    StringType '\/worker\/person\/preferredName\/generationAffixCode\/shortName?;
    StringType '\/worker\/person\/preferredName\/generationAffixCode\/longName?;
    StringCodeListType '\/worker\/person\/preferredName\/qualificationAffixCode?;
    StringType '\/worker\/person\/preferredName\/qualificationAffixCode\/codeValue?;
    StringType '\/worker\/person\/preferredName\/qualificationAffixCode\/shortName?;
    StringType '\/worker\/person\/preferredName\/qualificationAffixCode\/longName?;
    ArrayType '\/worker\/person\/preferredName\/titleAffixCodes?;
    StringCodeListType '\/worker\/person\/preferredName\/titleAffixCodes\/affixCode?;
    StringType '\/worker\/person\/preferredName\/titleAffixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/preferredName\/titleAffixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/preferredName\/titleAffixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/preferredName\/titleAffixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/preferredName\/familyName1Prefix?;
    StringType '\/worker\/person\/preferredName\/familyName2Prefix?;
    StringType '\/worker\/person\/preferredName\/initials?;
    ArrayType '\/worker\/person\/alternatePreferredNames?;
    StringType '\/worker\/person\/alternatePreferredNames\/givenName?;
    StringType '\/worker\/person\/alternatePreferredNames\/middleName?;
    StringType '\/worker\/person\/alternatePreferredNames\/familyName1?;
    StringType '\/worker\/person\/alternatePreferredNames\/familyName2?;
    StringType '\/worker\/person\/alternatePreferredNames\/formattedName?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/nameCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/nameCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/nameCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/scriptCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/scriptCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/scriptCode\/longName?;
    ArrayType '\/worker\/person\/alternatePreferredNames\/preferredSalutations?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/salutationCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/salutationCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/salutationCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/salutationCode\/longName?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/typeCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/typeCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/typeCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/typeCode\/longName?;
    NumberType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/sequenceNumber?;
    ArrayType '\/worker\/person\/alternatePreferredNames\/titlePrefixCodes?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/titlePrefixCodes\/affixCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/titlePrefixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/titlePrefixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/titlePrefixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/alternatePreferredNames\/titlePrefixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/alternatePreferredNames\/nickName?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/generationAffixCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/generationAffixCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/generationAffixCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/generationAffixCode\/longName?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/qualificationAffixCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/qualificationAffixCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/qualificationAffixCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/qualificationAffixCode\/longName?;
    ArrayType '\/worker\/person\/alternatePreferredNames\/titleAffixCodes?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/titleAffixCodes\/affixCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/titleAffixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/titleAffixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/titleAffixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/alternatePreferredNames\/titleAffixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/alternatePreferredNames\/familyName1Prefix?;
    StringType '\/worker\/person\/alternatePreferredNames\/familyName2Prefix?;
    StringType '\/worker\/person\/alternatePreferredNames\/initials?;
    StringType '\/worker\/person\/alternatePreferredNames\/itemID?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/languageCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/languageCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/languageCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/languageCode\/longName?;
    ArrayType '\/worker\/person\/formerNames?;
    StringType '\/worker\/person\/formerNames\/givenName?;
    StringType '\/worker\/person\/formerNames\/middleName?;
    StringType '\/worker\/person\/formerNames\/familyName1?;
    StringType '\/worker\/person\/formerNames\/familyName2?;
    StringType '\/worker\/person\/formerNames\/formattedName?;
    StringCodeListType '\/worker\/person\/formerNames\/nameCode?;
    StringType '\/worker\/person\/formerNames\/nameCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/nameCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/formerNames\/scriptCode?;
    StringType '\/worker\/person\/formerNames\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/scriptCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/scriptCode\/longName?;
    ArrayType '\/worker\/person\/formerNames\/preferredSalutations?;
    StringCodeListType '\/worker\/person\/formerNames\/preferredSalutations\/salutationCode?;
    StringType '\/worker\/person\/formerNames\/preferredSalutations\/salutationCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/preferredSalutations\/salutationCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/preferredSalutations\/salutationCode\/longName?;
    StringCodeListType '\/worker\/person\/formerNames\/preferredSalutations\/typeCode?;
    StringType '\/worker\/person\/formerNames\/preferredSalutations\/typeCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/preferredSalutations\/typeCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/preferredSalutations\/typeCode\/longName?;
    NumberType '\/worker\/person\/formerNames\/preferredSalutations\/sequenceNumber?;
    ArrayType '\/worker\/person\/formerNames\/titlePrefixCodes?;
    StringCodeListType '\/worker\/person\/formerNames\/titlePrefixCodes\/affixCode?;
    StringType '\/worker\/person\/formerNames\/titlePrefixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/titlePrefixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/titlePrefixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/formerNames\/titlePrefixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/formerNames\/nickName?;
    StringCodeListType '\/worker\/person\/formerNames\/generationAffixCode?;
    StringType '\/worker\/person\/formerNames\/generationAffixCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/generationAffixCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/generationAffixCode\/longName?;
    StringCodeListType '\/worker\/person\/formerNames\/qualificationAffixCode?;
    StringType '\/worker\/person\/formerNames\/qualificationAffixCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/qualificationAffixCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/qualificationAffixCode\/longName?;
    ArrayType '\/worker\/person\/formerNames\/titleAffixCodes?;
    StringCodeListType '\/worker\/person\/formerNames\/titleAffixCodes\/affixCode?;
    StringType '\/worker\/person\/formerNames\/titleAffixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/titleAffixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/titleAffixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/formerNames\/titleAffixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/formerNames\/familyName1Prefix?;
    StringType '\/worker\/person\/formerNames\/familyName2Prefix?;
    StringType '\/worker\/person\/formerNames\/initials?;
    StringType '\/worker\/person\/formerNames\/itemID?;
    StringCodeListType '\/worker\/person\/formerNames\/typeCode?;
    StringType '\/worker\/person\/formerNames\/typeCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/typeCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/typeCode\/longName?;
    ObjectType '\/worker\/person\/birthName?;
    StringType '\/worker\/person\/birthName\/givenName?;
    StringType '\/worker\/person\/birthName\/middleName?;
    StringType '\/worker\/person\/birthName\/familyName1?;
    StringType '\/worker\/person\/birthName\/familyName2?;
    StringType '\/worker\/person\/birthName\/formattedName?;
    StringCodeListType '\/worker\/person\/birthName\/nameCode?;
    StringType '\/worker\/person\/birthName\/nameCode\/codeValue?;
    StringType '\/worker\/person\/birthName\/nameCode\/shortName?;
    StringType '\/worker\/person\/birthName\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/birthName\/scriptCode?;
    StringType '\/worker\/person\/birthName\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/birthName\/scriptCode\/shortName?;
    StringType '\/worker\/person\/birthName\/scriptCode\/longName?;
    ArrayType '\/worker\/person\/birthName\/preferredSalutations?;
    StringCodeListType '\/worker\/person\/birthName\/preferredSalutations\/salutationCode?;
    StringType '\/worker\/person\/birthName\/preferredSalutations\/salutationCode\/codeValue?;
    StringType '\/worker\/person\/birthName\/preferredSalutations\/salutationCode\/shortName?;
    StringType '\/worker\/person\/birthName\/preferredSalutations\/salutationCode\/longName?;
    StringCodeListType '\/worker\/person\/birthName\/preferredSalutations\/typeCode?;
    StringType '\/worker\/person\/birthName\/preferredSalutations\/typeCode\/codeValue?;
    StringType '\/worker\/person\/birthName\/preferredSalutations\/typeCode\/shortName?;
    StringType '\/worker\/person\/birthName\/preferredSalutations\/typeCode\/longName?;
    NumberType '\/worker\/person\/birthName\/preferredSalutations\/sequenceNumber?;
    ArrayType '\/worker\/person\/birthName\/titlePrefixCodes?;
    StringCodeListType '\/worker\/person\/birthName\/titlePrefixCodes\/affixCode?;
    StringType '\/worker\/person\/birthName\/titlePrefixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/birthName\/titlePrefixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/birthName\/titlePrefixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/birthName\/titlePrefixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/birthName\/nickName?;
    StringCodeListType '\/worker\/person\/birthName\/generationAffixCode?;
    StringType '\/worker\/person\/birthName\/generationAffixCode\/codeValue?;
    StringType '\/worker\/person\/birthName\/generationAffixCode\/shortName?;
    StringType '\/worker\/person\/birthName\/generationAffixCode\/longName?;
    StringCodeListType '\/worker\/person\/birthName\/qualificationAffixCode?;
    StringType '\/worker\/person\/birthName\/qualificationAffixCode\/codeValue?;
    StringType '\/worker\/person\/birthName\/qualificationAffixCode\/shortName?;
    StringType '\/worker\/person\/birthName\/qualificationAffixCode\/longName?;
    ArrayType '\/worker\/person\/birthName\/titleAffixCodes?;
    StringCodeListType '\/worker\/person\/birthName\/titleAffixCodes\/affixCode?;
    StringType '\/worker\/person\/birthName\/titleAffixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/birthName\/titleAffixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/birthName\/titleAffixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/birthName\/titleAffixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/birthName\/familyName1Prefix?;
    StringType '\/worker\/person\/birthName\/familyName2Prefix?;
    StringType '\/worker\/person\/birthName\/initials?;
    ObjectType '\/worker\/person\/birthPlace?;
    StringType '\/worker\/person\/birthPlace\/cityName?;
    StringCodeListType '\/worker\/person\/birthPlace\/countrySubdivisionLevel1?;
    StringType '\/worker\/person\/birthPlace\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/person\/birthPlace\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/person\/birthPlace\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/person\/birthPlace\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/person\/birthPlace\/countrySubdivisionLevel2?;
    StringType '\/worker\/person\/birthPlace\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/person\/birthPlace\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/person\/birthPlace\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/person\/birthPlace\/countrySubdivisionLevel2\/subdivisionType?;
    StringCodeListType '\/worker\/person\/birthPlace\/postalCode?;
    StringCodeListType '\/worker\/person\/birthPlace\/countryCode?;
    StringType '\/worker\/person\/birthPlace\/formattedBirthPlace?;
    ArrayType '\/worker\/person\/otherPersonalAddresses?;
    StringCodeListType '\/worker\/person\/otherPersonalAddresses\/nameCode?;
    StringType '\/worker\/person\/otherPersonalAddresses\/nameCode\/codeValue?;
    StringType '\/worker\/person\/otherPersonalAddresses\/nameCode\/shortName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/nameCode\/longName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/attentionOfName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/careOfName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/lineOne?;
    StringType '\/worker\/person\/otherPersonalAddresses\/lineTwo?;
    StringType '\/worker\/person\/otherPersonalAddresses\/lineThree?;
    StringType '\/worker\/person\/otherPersonalAddresses\/cityName?;
    StringCodeListType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel1?;
    StringType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/person\/otherPersonalAddresses\/countryCode?;
    StringCodeListType '\/worker\/person\/otherPersonalAddresses\/postalCode?;
    ObjectType '\/worker\/person\/otherPersonalAddresses\/geoCoordinate?;
    NumberType '\/worker\/person\/otherPersonalAddresses\/geoCoordinate\/latitude?;
    NumberType '\/worker\/person\/otherPersonalAddresses\/geoCoordinate\/longitude?;
    StringCodeListType '\/worker\/person\/otherPersonalAddresses\/scriptCode?;
    StringType '\/worker\/person\/otherPersonalAddresses\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/otherPersonalAddresses\/scriptCode\/shortName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/scriptCode\/longName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/lineFour?;
    StringType '\/worker\/person\/otherPersonalAddresses\/lineFive?;
    StringType '\/worker\/person\/otherPersonalAddresses\/buildingNumber?;
    StringType '\/worker\/person\/otherPersonalAddresses\/buildingName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/blockName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/streetName?;
    StringCodeListType '\/worker\/person\/otherPersonalAddresses\/streetTypeCode?;
    StringType '\/worker\/person\/otherPersonalAddresses\/streetTypeCode\/codeValue?;
    StringType '\/worker\/person\/otherPersonalAddresses\/streetTypeCode\/shortName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/streetTypeCode\/longName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/unit?;
    StringType '\/worker\/person\/otherPersonalAddresses\/floor?;
    StringType '\/worker\/person\/otherPersonalAddresses\/stairCase?;
    StringType '\/worker\/person\/otherPersonalAddresses\/door?;
    StringType '\/worker\/person\/otherPersonalAddresses\/postOfficeBox?;
    StringType '\/worker\/person\/otherPersonalAddresses\/deliveryPoint?;
    StringType '\/worker\/person\/otherPersonalAddresses\/plotID?;
    StringCodeListType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel2?;
    StringType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel2\/subdivisionType?;
    BooleanSameAsAddressIndicatorType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressIndicator?;
    ObjectType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/href?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/rel?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/canonicalUri?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/title?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/targetSchema?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/mediaType?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/method?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/encType?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/schema?;
    ArrayType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/payLoadArguments?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/payLoadArguments\/argumentPath?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/payLoadArguments\/argumentValue?;
    StringType '\/worker\/person\/otherPersonalAddresses\/itemID?;
    StringCodeListType '\/worker\/person\/otherPersonalAddresses\/typeCode?;
    StringType '\/worker\/person\/otherPersonalAddresses\/typeCode\/codeValue?;
    StringType '\/worker\/person\/otherPersonalAddresses\/typeCode\/shortName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/typeCode\/longName?;
    StringCodeListType '\/worker\/person\/ethnicityCode?;
    StringType '\/worker\/person\/ethnicityCode\/codeValue?;
    StringType '\/worker\/person\/ethnicityCode\/shortName?;
    StringType '\/worker\/person\/ethnicityCode\/longName?;
    StringCodeListType '\/worker\/person\/ethnicityGroupCode?;
    StringType '\/worker\/person\/ethnicityGroupCode\/codeValue?;
    StringType '\/worker\/person\/ethnicityGroupCode\/shortName?;
    StringType '\/worker\/person\/ethnicityGroupCode\/longName?;
    StringCodeListType '\/worker\/person\/raceCode?;
    StringType '\/worker\/person\/raceCode\/codeValue?;
    StringType '\/worker\/person\/raceCode\/shortName?;
    StringType '\/worker\/person\/raceCode\/longName?;
    StringCodeListType '\/worker\/person\/raceCode\/identificationMethodCode?;
    StringType '\/worker\/person\/raceCode\/identificationMethodCode\/codeValue?;
    StringType '\/worker\/person\/raceCode\/identificationMethodCode\/shortName?;
    StringType '\/worker\/person\/raceCode\/identificationMethodCode\/longName?;
    StringCodeListType '\/worker\/person\/citizenshipCountryCodes?;
    StringType '\/worker\/person\/citizenshipCountryCodes\/codeValue?;
    StringType '\/worker\/person\/citizenshipCountryCodes\/shortName?;
    StringType '\/worker\/person\/citizenshipCountryCodes\/longName?;
    StringCodeListType '\/worker\/person\/residencyCountryCodes?;
    StringType '\/worker\/person\/residencyCountryCodes\/codeValue?;
    StringType '\/worker\/person\/residencyCountryCodes\/shortName?;
    StringType '\/worker\/person\/residencyCountryCodes\/longName?;
    StringCodeListType '\/worker\/person\/highestEducationLevelCode?;
    StringType '\/worker\/person\/highestEducationLevelCode\/codeValue?;
    StringType '\/worker\/person\/highestEducationLevelCode\/shortName?;
    StringType '\/worker\/person\/highestEducationLevelCode\/longName?;
    StringCodeListType '\/worker\/person\/militaryStatusCode?;
    StringType '\/worker\/person\/militaryStatusCode\/codeValue?;
    StringType '\/worker\/person\/militaryStatusCode\/shortName?;
    StringType '\/worker\/person\/militaryStatusCode\/longName?;
    StringType '\/worker\/person\/militaryStatusCode\/effectiveDate?;
    StringType '\/worker\/person\/militaryDischargeDate?;
    StringCodeListType '\/worker\/person\/militaryClassificationCodes?;
    StringType '\/worker\/person\/militaryClassificationCodes\/codeValue?;
    StringType '\/worker\/person\/militaryClassificationCodes\/shortName?;
    StringType '\/worker\/person\/militaryClassificationCodes\/longName?;
    ObjectType '\/worker\/person\/customFieldGroup?;
    ArrayType '\/worker\/person\/customFieldGroup\/amountFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/amountFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/amountFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/amountFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/amountFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/amountFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/amountFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/amountFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/amountFields\/categoryCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/person\/customFieldGroup\/amountFields\/amountValue?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/amountFields\/currencyCode?;
    StringType '\/worker\/person\/customFieldGroup\/amountFields\/itemID?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/codeFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/codeFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/codeFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/categoryCode\/longName?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/longName?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/itemID?;
    ArrayType '\/worker\/person\/customFieldGroup\/dateFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/dateFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/dateFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/dateFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/dateFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/dateFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/dateFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/dateFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/dateFields\/categoryCode\/longName?;
    StringType '\/worker\/person\/customFieldGroup\/dateFields\/dateValue?;
    StringType '\/worker\/person\/customFieldGroup\/dateFields\/itemID?;
    ArrayType '\/worker\/person\/customFieldGroup\/dateTimeFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/dateTimeFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/dateTimeFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/dateTimeFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/dateTimeFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/dateTimeFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/dateTimeFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/dateTimeFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/dateTimeFields\/categoryCode\/longName?;
    StringType '\/worker\/person\/customFieldGroup\/dateTimeFields\/dateTimeValue?;
    StringType '\/worker\/person\/customFieldGroup\/dateTimeFields\/itemID?;
    ArrayType '\/worker\/person\/customFieldGroup\/indicatorFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/indicatorFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/indicatorFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/indicatorFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/indicatorFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/indicatorFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/indicatorFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/indicatorFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/indicatorFields\/categoryCode\/longName?;
    BooleanType '\/worker\/person\/customFieldGroup\/indicatorFields\/indicatorValue?;
    StringType '\/worker\/person\/customFieldGroup\/indicatorFields\/itemID?;
    ArrayType '\/worker\/person\/customFieldGroup\/numberFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/numberFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/numberFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/numberFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/numberFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/numberFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/numberFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/numberFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/numberFields\/categoryCode\/longName?;
    NumberType '\/worker\/person\/customFieldGroup\/numberFields\/numberValue?;
    StringType '\/worker\/person\/customFieldGroup\/numberFields\/itemID?;
    ArrayType '\/worker\/person\/customFieldGroup\/percentFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/percentFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/percentFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/percentFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/percentFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/percentFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/percentFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/percentFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/percentFields\/categoryCode\/longName?;
    NumberType '\/worker\/person\/customFieldGroup\/percentFields\/percentValue?;
    StringType '\/worker\/person\/customFieldGroup\/percentFields\/itemID?;
    ArrayType '\/worker\/person\/customFieldGroup\/stringFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/stringFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/stringFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/stringFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/stringFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/stringFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/stringFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/stringFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/stringFields\/categoryCode\/longName?;
    StringType '\/worker\/person\/customFieldGroup\/stringFields\/stringValue?;
    StringType '\/worker\/person\/customFieldGroup\/stringFields\/itemID?;
    ArrayType '\/worker\/person\/customFieldGroup\/telephoneFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/telephoneFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/telephoneFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/categoryCode\/longName?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/countryDialing?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/areaDialing?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/dialNumber?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/extension?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/access?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/formattedNumber?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/itemID?;
    ArrayType '\/worker\/person\/customFieldGroup\/links?;
    StringType '\/worker\/person\/customFieldGroup\/links\/href?;
    StringType '\/worker\/person\/customFieldGroup\/links\/rel?;
    StringType '\/worker\/person\/customFieldGroup\/links\/canonicalUri?;
    StringType '\/worker\/person\/customFieldGroup\/links\/title?;
    StringType '\/worker\/person\/customFieldGroup\/links\/targetSchema?;
    StringType '\/worker\/person\/customFieldGroup\/links\/mediaType?;
    StringType '\/worker\/person\/customFieldGroup\/links\/method?;
    StringType '\/worker\/person\/customFieldGroup\/links\/encType?;
    StringType '\/worker\/person\/customFieldGroup\/links\/schema?;
    ArrayType '\/worker\/person\/customFieldGroup\/links\/payLoadArguments?;
    StringType '\/worker\/person\/customFieldGroup\/links\/payLoadArguments\/argumentPath?;
    StringType '\/worker\/person\/customFieldGroup\/links\/payLoadArguments\/argumentValue?;
    ArrayType '\/worker\/person\/links?;
    StringType '\/worker\/person\/links\/href?;
    StringType '\/worker\/person\/links\/rel?;
    StringType '\/worker\/person\/links\/canonicalUri?;
    StringType '\/worker\/person\/links\/title?;
    StringType '\/worker\/person\/links\/targetSchema?;
    StringType '\/worker\/person\/links\/mediaType?;
    StringType '\/worker\/person\/links\/method?;
    StringType '\/worker\/person\/links\/encType?;
    StringType '\/worker\/person\/links\/schema?;
    ArrayType '\/worker\/person\/links\/payLoadArguments?;
    StringType '\/worker\/person\/links\/payLoadArguments\/argumentPath?;
    StringType '\/worker\/person\/links\/payLoadArguments\/argumentValue?;
    ObjectType '\/worker\/workerDates?;
    StringType '\/worker\/workerDates\/originalHireDate?;
    StringType '\/worker\/workerDates\/rehireDate?;
    StringType '\/worker\/workerDates\/adjustedServiceDate?;
    StringType '\/worker\/workerDates\/acquisitionDate?;
    StringType '\/worker\/workerDates\/retirementDate?;
    StringType '\/worker\/workerDates\/terminationDate?;
    StringType '\/worker\/workerDates\/expectedTerminationDate?;
    ObjectType '\/worker\/workerStatus?;
    StringCodeListType '\/worker\/workerStatus\/statusCode?;
    StringType '\/worker\/workerStatus\/statusCode\/codeValue?;
    StringType '\/worker\/workerStatus\/statusCode\/shortName?;
    StringType '\/worker\/workerStatus\/statusCode\/longName?;
    StringCodeListType '\/worker\/workerStatus\/reasonCode?;
    StringType '\/worker\/workerStatus\/reasonCode\/codeValue?;
    StringType '\/worker\/workerStatus\/reasonCode\/shortName?;
    StringType '\/worker\/workerStatus\/reasonCode\/longName?;
    StringType '\/worker\/workerStatus\/effectiveDate?;
    ObjectType '\/worker\/businessCommunication?;
    ArrayType '\/worker\/businessCommunication\/landlines?;
    StringCodeListType '\/worker\/businessCommunication\/landlines\/nameCode?;
    StringType '\/worker\/businessCommunication\/landlines\/nameCode\/codeValue?;
    StringType '\/worker\/businessCommunication\/landlines\/nameCode\/shortName?;
    StringType '\/worker\/businessCommunication\/landlines\/nameCode\/longName?;
    StringType '\/worker\/businessCommunication\/landlines\/countryDialing?;
    StringType '\/worker\/businessCommunication\/landlines\/areaDialing?;
    StringType '\/worker\/businessCommunication\/landlines\/dialNumber?;
    StringType '\/worker\/businessCommunication\/landlines\/extension?;
    StringType '\/worker\/businessCommunication\/landlines\/access?;
    StringType '\/worker\/businessCommunication\/landlines\/formattedNumber?;
    StringType '\/worker\/businessCommunication\/landlines\/itemID?;
    BooleanType '\/worker\/businessCommunication\/landlines\/notificationIndicator?;
    ArrayType '\/worker\/businessCommunication\/mobiles?;
    StringCodeListType '\/worker\/businessCommunication\/mobiles\/nameCode?;
    StringType '\/worker\/businessCommunication\/mobiles\/nameCode\/codeValue?;
    StringType '\/worker\/businessCommunication\/mobiles\/nameCode\/shortName?;
    StringType '\/worker\/businessCommunication\/mobiles\/nameCode\/longName?;
    StringType '\/worker\/businessCommunication\/mobiles\/countryDialing?;
    StringType '\/worker\/businessCommunication\/mobiles\/areaDialing?;
    StringType '\/worker\/businessCommunication\/mobiles\/dialNumber?;
    StringType '\/worker\/businessCommunication\/mobiles\/extension?;
    StringType '\/worker\/businessCommunication\/mobiles\/access?;
    StringType '\/worker\/businessCommunication\/mobiles\/formattedNumber?;
    StringType '\/worker\/businessCommunication\/mobiles\/itemID?;
    BooleanType '\/worker\/businessCommunication\/mobiles\/notificationIndicator?;
    ArrayType '\/worker\/businessCommunication\/emails?;
    StringCodeListType '\/worker\/businessCommunication\/emails\/nameCode?;
    StringType '\/worker\/businessCommunication\/emails\/nameCode\/codeValue?;
    StringType '\/worker\/businessCommunication\/emails\/nameCode\/shortName?;
    StringType '\/worker\/businessCommunication\/emails\/nameCode\/longName?;
    StringType '\/worker\/businessCommunication\/emails\/emailUri?;
    StringType '\/worker\/businessCommunication\/emails\/itemID?;
    BooleanType '\/worker\/businessCommunication\/emails\/notificationIndicator?;
    ArrayType '\/worker\/businessCommunication\/socialNetworks?;
    StringCodeListType '\/worker\/businessCommunication\/socialNetworks\/nameCode?;
    StringType '\/worker\/businessCommunication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/worker\/businessCommunication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/worker\/businessCommunication\/socialNetworks\/nameCode\/longName?;
    StringType '\/worker\/businessCommunication\/socialNetworks\/uri?;
    StringType '\/worker\/businessCommunication\/socialNetworks\/itemID?;
    BooleanType '\/worker\/businessCommunication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/worker\/businessCommunication\/faxes?;
    StringCodeListType '\/worker\/businessCommunication\/faxes\/nameCode?;
    StringType '\/worker\/businessCommunication\/faxes\/nameCode\/codeValue?;
    StringType '\/worker\/businessCommunication\/faxes\/nameCode\/shortName?;
    StringType '\/worker\/businessCommunication\/faxes\/nameCode\/longName?;
    StringType '\/worker\/businessCommunication\/faxes\/countryDialing?;
    StringType '\/worker\/businessCommunication\/faxes\/areaDialing?;
    StringType '\/worker\/businessCommunication\/faxes\/dialNumber?;
    StringType '\/worker\/businessCommunication\/faxes\/extension?;
    StringType '\/worker\/businessCommunication\/faxes\/access?;
    StringType '\/worker\/businessCommunication\/faxes\/formattedNumber?;
    StringType '\/worker\/businessCommunication\/faxes\/itemID?;
    BooleanType '\/worker\/businessCommunication\/faxes\/notificationIndicator?;
    ArrayType '\/worker\/businessCommunication\/pagers?;
    StringCodeListType '\/worker\/businessCommunication\/pagers\/nameCode?;
    StringType '\/worker\/businessCommunication\/pagers\/nameCode\/codeValue?;
    StringType '\/worker\/businessCommunication\/pagers\/nameCode\/shortName?;
    StringType '\/worker\/businessCommunication\/pagers\/nameCode\/longName?;
    StringType '\/worker\/businessCommunication\/pagers\/countryDialing?;
    StringType '\/worker\/businessCommunication\/pagers\/areaDialing?;
    StringType '\/worker\/businessCommunication\/pagers\/dialNumber?;
    StringType '\/worker\/businessCommunication\/pagers\/extension?;
    StringType '\/worker\/businessCommunication\/pagers\/access?;
    StringType '\/worker\/businessCommunication\/pagers\/formattedNumber?;
    StringType '\/worker\/businessCommunication\/pagers\/itemID?;
    BooleanType '\/worker\/businessCommunication\/pagers\/notificationIndicator?;
    ArrayType '\/worker\/businessCommunication\/internetAddresses?;
    StringCodeListType '\/worker\/businessCommunication\/internetAddresses\/nameCode?;
    StringType '\/worker\/businessCommunication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/worker\/businessCommunication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/worker\/businessCommunication\/internetAddresses\/nameCode\/longName?;
    StringType '\/worker\/businessCommunication\/internetAddresses\/uri?;
    StringType '\/worker\/businessCommunication\/internetAddresses\/itemID?;
    ArrayType '\/worker\/businessCommunication\/instantMessages?;
    StringCodeListType '\/worker\/businessCommunication\/instantMessages\/nameCode?;
    StringType '\/worker\/businessCommunication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/worker\/businessCommunication\/instantMessages\/nameCode\/shortName?;
    StringType '\/worker\/businessCommunication\/instantMessages\/nameCode\/longName?;
    StringType '\/worker\/businessCommunication\/instantMessages\/uri?;
    StringType '\/worker\/businessCommunication\/instantMessages\/itemID?;
    BooleanType '\/worker\/businessCommunication\/instantMessages\/notificationIndicator?;
    ObjectType '\/worker\/workAssignment?;
    BooleanType '\/worker\/workAssignment\/primaryIndicator?;
    StringType '\/worker\/workAssignment\/offerExtensionDate?;
    StringType '\/worker\/workAssignment\/offerAcceptanceDate?;
    StringType '\/worker\/workAssignment\/hireDate?;
    StringType '\/worker\/workAssignment\/seniorityDate?;
    StringType '\/worker\/workAssignment\/expectedStartDate?;
    StringType '\/worker\/workAssignment\/actualStartDate?;
    StringType '\/worker\/workAssignment\/terminationDate?;
    StringType '\/worker\/workAssignment\/expectedTerminationDate?;
    ObjectType '\/worker\/workAssignment\/assignmentStatus?;
    StringCodeListType '\/worker\/workAssignment\/assignmentStatus\/statusCode?;
    StringType '\/worker\/workAssignment\/assignmentStatus\/statusCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignmentStatus\/statusCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignmentStatus\/statusCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/assignmentStatus\/reasonCode?;
    StringType '\/worker\/workAssignment\/assignmentStatus\/reasonCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignmentStatus\/reasonCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignmentStatus\/reasonCode\/longName?;
    StringType '\/worker\/workAssignment\/assignmentStatus\/effectiveDate?;
    ArrayType '\/worker\/workAssignment\/assignmentCostCenters?;
    StringType '\/worker\/workAssignment\/assignmentCostCenters\/costCenterID?;
    StringType '\/worker\/workAssignment\/assignmentCostCenters\/costCenterName?;
    NumberType '\/worker\/workAssignment\/assignmentCostCenters\/costCenterPercentage?;
    BooleanType '\/worker\/workAssignment\/workerProbationIndicator?;
    ObjectType '\/worker\/workAssignment\/workerProbationPeriod?;
    StringType '\/worker\/workAssignment\/workerProbationPeriod\/startDate?;
    StringType '\/worker\/workAssignment\/workerProbationPeriod\/endDate?;
    StringCodeListType '\/worker\/workAssignment\/workerTypeCode?;
    StringType '\/worker\/workAssignment\/workerTypeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/workerTypeCode\/shortName?;
    StringType '\/worker\/workAssignment\/workerTypeCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/assignmentTermCode?;
    StringType '\/worker\/workAssignment\/assignmentTermCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignmentTermCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignmentTermCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/workLevelCode?;
    StringType '\/worker\/workAssignment\/workLevelCode\/codeValue?;
    StringType '\/worker\/workAssignment\/workLevelCode\/shortName?;
    StringType '\/worker\/workAssignment\/workLevelCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/nationalityContextCode?;
    StringType '\/worker\/workAssignment\/nationalityContextCode\/codeValue?;
    StringType '\/worker\/workAssignment\/nationalityContextCode\/shortName?;
    StringType '\/worker\/workAssignment\/nationalityContextCode\/longName?;
    BooleanType '\/worker\/workAssignment\/vipIndicator?;
    StringCodeListType '\/worker\/workAssignment\/vipTypeCode?;
    StringType '\/worker\/workAssignment\/vipTypeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/vipTypeCode\/shortName?;
    StringType '\/worker\/workAssignment\/vipTypeCode\/longName?;
    BooleanType '\/worker\/workAssignment\/executiveIndicator?;
    StringCodeListType '\/worker\/workAssignment\/executiveTypeCode?;
    StringType '\/worker\/workAssignment\/executiveTypeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/executiveTypeCode\/shortName?;
    StringType '\/worker\/workAssignment\/executiveTypeCode\/longName?;
    BooleanType '\/worker\/workAssignment\/officerIndicator?;
    StringCodeListType '\/worker\/workAssignment\/officerTypeCode?;
    StringType '\/worker\/workAssignment\/officerTypeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/officerTypeCode\/shortName?;
    StringType '\/worker\/workAssignment\/officerTypeCode\/longName?;
    BooleanType '\/worker\/workAssignment\/managementPositionIndicator?;
    StringType '\/worker\/workAssignment\/legalEntityID?;
    BooleanType '\/worker\/workAssignment\/highlyCompensatedIndicator?;
    StringCodeListType '\/worker\/workAssignment\/highlyCompensatedTypeCode?;
    StringType '\/worker\/workAssignment\/highlyCompensatedTypeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/highlyCompensatedTypeCode\/shortName?;
    StringType '\/worker\/workAssignment\/highlyCompensatedTypeCode\/longName?;
    BooleanType '\/worker\/workAssignment\/stockOwnerIndicator?;
    NumberType '\/worker\/workAssignment\/stockOwnerPercentage?;
    ArrayType '\/worker\/workAssignment\/workerGroups?;
    StringCodeListType '\/worker\/workAssignment\/workerGroups\/nameCode?;
    StringType '\/worker\/workAssignment\/workerGroups\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/workerGroups\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/workerGroups\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/workerGroups\/groupCode?;
    StringType '\/worker\/workAssignment\/workerGroups\/groupCode\/codeValue?;
    StringType '\/worker\/workAssignment\/workerGroups\/groupCode\/shortName?;
    StringType '\/worker\/workAssignment\/workerGroups\/groupCode\/longName?;
    StringType '\/worker\/workAssignment\/workerGroups\/itemID?;
    StringCodeListType '\/worker\/workAssignment\/jobCode?;
    StringType '\/worker\/workAssignment\/jobCode\/codeValue?;
    StringType '\/worker\/workAssignment\/jobCode\/shortName?;
    StringType '\/worker\/workAssignment\/jobCode\/longName?;
    StringType '\/worker\/workAssignment\/jobTitle?;
    ArrayType '\/worker\/workAssignment\/occupationalClassifications?;
    StringCodeListType '\/worker\/workAssignment\/occupationalClassifications\/nameCode?;
    StringType '\/worker\/workAssignment\/occupationalClassifications\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/occupationalClassifications\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/occupationalClassifications\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/occupationalClassifications\/classificationCode?;
    StringType '\/worker\/workAssignment\/occupationalClassifications\/classificationCode\/codeValue?;
    StringType '\/worker\/workAssignment\/occupationalClassifications\/classificationCode\/shortName?;
    StringType '\/worker\/workAssignment\/occupationalClassifications\/classificationCode\/longName?;
    StringType '\/worker\/workAssignment\/occupationalClassifications\/itemID?;
    ArrayType '\/worker\/workAssignment\/industryClassifications?;
    StringCodeListType '\/worker\/workAssignment\/industryClassifications\/nameCode?;
    StringType '\/worker\/workAssignment\/industryClassifications\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/industryClassifications\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/industryClassifications\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/industryClassifications\/classificationCode?;
    StringType '\/worker\/workAssignment\/industryClassifications\/classificationCode\/codeValue?;
    StringType '\/worker\/workAssignment\/industryClassifications\/classificationCode\/shortName?;
    StringType '\/worker\/workAssignment\/industryClassifications\/classificationCode\/longName?;
    StringType '\/worker\/workAssignment\/industryClassifications\/itemID?;
    ObjectType '\/worker\/workAssignment\/wageLawCoverage?;
    StringCodeListType '\/worker\/workAssignment\/wageLawCoverage\/wageLawNameCode?;
    StringType '\/worker\/workAssignment\/wageLawCoverage\/wageLawNameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/wageLawCoverage\/wageLawNameCode\/shortName?;
    StringType '\/worker\/workAssignment\/wageLawCoverage\/wageLawNameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/wageLawCoverage\/coverageCode?;
    StringType '\/worker\/workAssignment\/wageLawCoverage\/coverageCode\/codeValue?;
    StringType '\/worker\/workAssignment\/wageLawCoverage\/coverageCode\/shortName?;
    StringType '\/worker\/workAssignment\/wageLawCoverage\/coverageCode\/longName?;
    StringType '\/worker\/workAssignment\/positionID?;
    StringType '\/worker\/workAssignment\/positionTitle?;
    ObjectType '\/worker\/workAssignment\/laborUnion?;
    StringCodeListType '\/worker\/workAssignment\/laborUnion\/laborUnionCode?;
    StringType '\/worker\/workAssignment\/laborUnion\/laborUnionCode\/codeValue?;
    StringType '\/worker\/workAssignment\/laborUnion\/laborUnionCode\/shortName?;
    StringType '\/worker\/workAssignment\/laborUnion\/laborUnionCode\/longName?;
    StringType '\/worker\/workAssignment\/laborUnion\/seniorityDate?;
    ObjectType '\/worker\/workAssignment\/bargainingUnit?;
    StringCodeListType '\/worker\/workAssignment\/bargainingUnit\/bargainingUnitCode?;
    StringType '\/worker\/workAssignment\/bargainingUnit\/bargainingUnitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/bargainingUnit\/bargainingUnitCode\/shortName?;
    StringType '\/worker\/workAssignment\/bargainingUnit\/bargainingUnitCode\/longName?;
    StringType '\/worker\/workAssignment\/bargainingUnit\/seniorityDate?;
    StringCodeListType '\/worker\/workAssignment\/workShiftCode?;
    StringType '\/worker\/workAssignment\/workShiftCode\/codeValue?;
    StringType '\/worker\/workAssignment\/workShiftCode\/shortName?;
    StringType '\/worker\/workAssignment\/workShiftCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/workArrangementCode?;
    StringType '\/worker\/workAssignment\/workArrangementCode\/codeValue?;
    StringType '\/worker\/workAssignment\/workArrangementCode\/shortName?;
    StringType '\/worker\/workAssignment\/workArrangementCode\/longName?;
    ObjectType '\/worker\/workAssignment\/standardHours?;
    NumberType '\/worker\/workAssignment\/standardHours\/hoursQuantity?;
    StringCodeListType '\/worker\/workAssignment\/standardHours\/unitCode?;
    StringType '\/worker\/workAssignment\/standardHours\/unitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/standardHours\/unitCode\/shortName?;
    StringType '\/worker\/workAssignment\/standardHours\/unitCode\/longName?;
    NumberType '\/worker\/workAssignment\/fullTimeEquivalenceRatio?;
    ArrayType '\/worker\/workAssignment\/homeOrganizationalUnits?;
    StringCodeListType '\/worker\/workAssignment\/homeOrganizationalUnits\/nameCode?;
    StringType '\/worker\/workAssignment\/homeOrganizationalUnits\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeOrganizationalUnits\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeOrganizationalUnits\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/homeOrganizationalUnits\/typeCode?;
    StringType '\/worker\/workAssignment\/homeOrganizationalUnits\/typeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeOrganizationalUnits\/typeCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeOrganizationalUnits\/typeCode\/longName?;
    StringType '\/worker\/workAssignment\/homeOrganizationalUnits\/itemID?;
    ArrayType '\/worker\/workAssignment\/assignedOrganizationalUnits?;
    StringCodeListType '\/worker\/workAssignment\/assignedOrganizationalUnits\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedOrganizationalUnits\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedOrganizationalUnits\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedOrganizationalUnits\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/assignedOrganizationalUnits\/typeCode?;
    StringType '\/worker\/workAssignment\/assignedOrganizationalUnits\/typeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedOrganizationalUnits\/typeCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedOrganizationalUnits\/typeCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedOrganizationalUnits\/itemID?;
    ObjectType '\/worker\/workAssignment\/homeWorkLocation?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/nameCode\/longName?;
    ObjectType '\/worker\/workAssignment\/homeWorkLocation\/communication?;
    ArrayType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/countryDialing?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/areaDialing?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/dialNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/extension?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/access?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/formattedNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/itemID?;
    BooleanType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/countryDialing?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/areaDialing?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/dialNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/extension?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/access?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/formattedNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/itemID?;
    BooleanType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/homeWorkLocation\/communication\/emails?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/communication\/emails\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/emails\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/emails\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/emails\/emailUri?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/emails\/itemID?;
    BooleanType '\/worker\/workAssignment\/homeWorkLocation\/communication\/emails\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/homeWorkLocation\/communication\/socialNetworks?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/communication\/socialNetworks\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/socialNetworks\/uri?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/socialNetworks\/itemID?;
    BooleanType '\/worker\/workAssignment\/homeWorkLocation\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/countryDialing?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/areaDialing?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/dialNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/extension?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/access?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/formattedNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/itemID?;
    BooleanType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/countryDialing?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/areaDialing?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/dialNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/extension?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/access?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/formattedNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/itemID?;
    BooleanType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/homeWorkLocation\/communication\/internetAddresses?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/communication\/internetAddresses\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/internetAddresses\/uri?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/internetAddresses\/itemID?;
    ArrayType '\/worker\/workAssignment\/homeWorkLocation\/communication\/instantMessages?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/communication\/instantMessages\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/instantMessages\/uri?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/instantMessages\/itemID?;
    BooleanType '\/worker\/workAssignment\/homeWorkLocation\/communication\/instantMessages\/notificationIndicator?;
    ObjectType '\/worker\/workAssignment\/homeWorkLocation\/address?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/address\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/attentionOfName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/careOfName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/lineOne?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/lineTwo?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/lineThree?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/cityName?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel1?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/address\/countryCode?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/address\/postalCode?;
    ObjectType '\/worker\/workAssignment\/homeWorkLocation\/address\/geoCoordinate?;
    NumberType '\/worker\/workAssignment\/homeWorkLocation\/address\/geoCoordinate\/latitude?;
    NumberType '\/worker\/workAssignment\/homeWorkLocation\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/address\/scriptCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/scriptCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/scriptCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/scriptCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/lineFour?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/lineFive?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/buildingNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/buildingName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/blockName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/streetName?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/address\/streetTypeCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/streetTypeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/streetTypeCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/streetTypeCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/unit?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/floor?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/stairCase?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/door?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/postOfficeBox?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/deliveryPoint?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/plotID?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel2?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel2\/subdivisionType?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/nameCode\/longName?;
    ObjectType '\/worker\/workAssignment\/assignedWorkLocations\/communication?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/countryDialing?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/areaDialing?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/dialNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/extension?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/access?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/formattedNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/itemID?;
    BooleanType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/countryDialing?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/areaDialing?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/dialNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/extension?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/access?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/formattedNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/itemID?;
    BooleanType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/emails?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/emails\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/emails\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/emails\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/emails\/emailUri?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/emails\/itemID?;
    BooleanType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/emails\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/socialNetworks?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/socialNetworks\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/socialNetworks\/uri?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/socialNetworks\/itemID?;
    BooleanType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/countryDialing?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/areaDialing?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/dialNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/extension?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/access?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/formattedNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/itemID?;
    BooleanType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/countryDialing?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/areaDialing?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/dialNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/extension?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/access?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/formattedNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/itemID?;
    BooleanType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/internetAddresses?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/internetAddresses\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/internetAddresses\/uri?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/internetAddresses\/itemID?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/instantMessages?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/instantMessages\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/instantMessages\/uri?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/instantMessages\/itemID?;
    BooleanType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/instantMessages\/notificationIndicator?;
    ObjectType '\/worker\/workAssignment\/assignedWorkLocations\/address?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/address\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/attentionOfName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/careOfName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/lineOne?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/lineTwo?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/lineThree?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/cityName?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel1?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countryCode?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/address\/postalCode?;
    ObjectType '\/worker\/workAssignment\/assignedWorkLocations\/address\/geoCoordinate?;
    NumberType '\/worker\/workAssignment\/assignedWorkLocations\/address\/geoCoordinate\/latitude?;
    NumberType '\/worker\/workAssignment\/assignedWorkLocations\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/address\/scriptCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/scriptCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/scriptCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/scriptCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/lineFour?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/lineFive?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/buildingNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/buildingName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/blockName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/streetName?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/address\/streetTypeCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/streetTypeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/streetTypeCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/streetTypeCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/unit?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/floor?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/stairCase?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/door?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/postOfficeBox?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/deliveryPoint?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/plotID?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel2?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel2\/subdivisionType?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/itemID?;
    StringCodeListType '\/worker\/workAssignment\/remunerationBasisCode?;
    StringType '\/worker\/workAssignment\/remunerationBasisCode\/codeValue?;
    StringType '\/worker\/workAssignment\/remunerationBasisCode\/shortName?;
    StringType '\/worker\/workAssignment\/remunerationBasisCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/payCycleCode?;
    StringType '\/worker\/workAssignment\/payCycleCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payCycleCode\/shortName?;
    StringType '\/worker\/workAssignment\/payCycleCode\/longName?;
    ObjectType '\/worker\/workAssignment\/standardPayPeriodHours?;
    NumberType '\/worker\/workAssignment\/standardPayPeriodHours\/hoursQuantity?;
    StringCodeListType '\/worker\/workAssignment\/standardPayPeriodHours\/unitCode?;
    StringType '\/worker\/workAssignment\/standardPayPeriodHours\/unitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/standardPayPeriodHours\/unitCode\/shortName?;
    StringType '\/worker\/workAssignment\/standardPayPeriodHours\/unitCode\/longName?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/recordingBasisCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/recordingBasisCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/recordingBasisCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/recordingBasisCode\/longName?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/hourlyRateAmount?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/hourlyRateAmount\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/hourlyRateAmount\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/hourlyRateAmount\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/hourlyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/baseRemuneration\/hourlyRateAmount\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/hourlyRateAmount\/currencyCode?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/dailyRateAmount?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/dailyRateAmount\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/dailyRateAmount\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/dailyRateAmount\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/dailyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/baseRemuneration\/dailyRateAmount\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/dailyRateAmount\/currencyCode?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/weeklyRateAmount?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/weeklyRateAmount\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/weeklyRateAmount\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/weeklyRateAmount\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/weeklyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/baseRemuneration\/weeklyRateAmount\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/weeklyRateAmount\/currencyCode?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/biweeklyRateAmount?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/biweeklyRateAmount\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/biweeklyRateAmount\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/biweeklyRateAmount\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/biweeklyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/baseRemuneration\/biweeklyRateAmount\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/biweeklyRateAmount\/currencyCode?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/semiMonthlyRateAmount?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/semiMonthlyRateAmount\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/semiMonthlyRateAmount\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/semiMonthlyRateAmount\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/semiMonthlyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/baseRemuneration\/semiMonthlyRateAmount\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/semiMonthlyRateAmount\/currencyCode?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/monthlyRateAmount?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/monthlyRateAmount\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/monthlyRateAmount\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/monthlyRateAmount\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/monthlyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/baseRemuneration\/monthlyRateAmount\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/monthlyRateAmount\/currencyCode?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/annualRateAmount?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/annualRateAmount\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/annualRateAmount\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/annualRateAmount\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/annualRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/baseRemuneration\/annualRateAmount\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/annualRateAmount\/currencyCode?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/payPeriodRateAmount?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/payPeriodRateAmount\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/payPeriodRateAmount\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/payPeriodRateAmount\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/payPeriodRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/baseRemuneration\/payPeriodRateAmount\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/payPeriodRateAmount\/currencyCode?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/nameCode\/longName?;
    NumberType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/percentageValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/baseUnitCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/baseUnitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/baseUnitCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/baseUnitCode\/longName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/effectiveDate?;
    ArrayType '\/worker\/workAssignment\/additionalRemunerations?;
    StringCodeListType '\/worker\/workAssignment\/additionalRemunerations\/typeCode?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/typeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/typeCode\/shortName?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/typeCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/additionalRemunerations\/intervalCode?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/intervalCode\/codeValue?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/intervalCode\/shortName?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/intervalCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/additionalRemunerations\/nameCode?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/nameCode\/longName?;
    ObjectType '\/worker\/workAssignment\/additionalRemunerations\/rate?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/additionalRemunerations\/rate\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/additionalRemunerations\/rate\/currencyCode?;
    StringCodeListType '\/worker\/workAssignment\/additionalRemunerations\/rate\/unitCode?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/rate\/unitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/rate\/unitCode\/shortName?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/rate\/unitCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/additionalRemunerations\/rate\/baseUnitCode?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/rate\/baseUnitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/rate\/baseUnitCode\/shortName?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/rate\/baseUnitCode\/longName?;
    NumberType '\/worker\/workAssignment\/additionalRemunerations\/rate\/baseMultiplierValue?;
    ArrayType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers?;
    StringCodeListType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectTypeCode?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectTypeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectTypeCode\/shortName?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectTypeCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectCode?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectCode\/codeValue?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectCode\/shortName?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectCode\/longName?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectID?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/itemID?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/itemID?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/effectiveDate?;
    ArrayType '\/worker\/workAssignment\/reportsTo?;
    StringType '\/worker\/workAssignment\/reportsTo\/positionID?;
    StringType '\/worker\/workAssignment\/reportsTo\/positionTitle?;
    StringType '\/worker\/workAssignment\/reportsTo\/associateOID?;
    ObjectType '\/worker\/workAssignment\/reportsTo\/workerID?;
    StringType '\/worker\/workAssignment\/reportsTo\/workerID\/idValue?;
    StringCodeListType '\/worker\/workAssignment\/reportsTo\/workerID\/schemeCode?;
    StringType '\/worker\/workAssignment\/reportsTo\/workerID\/schemeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/reportsTo\/workerID\/schemeCode\/shortName?;
    StringType '\/worker\/workAssignment\/reportsTo\/workerID\/schemeCode\/longName?;
    ObjectType '\/worker\/workAssignment\/reportsTo\/reportsToWorkerName?;
    StringType '\/worker\/workAssignment\/reportsTo\/reportsToWorkerName\/givenName?;
    StringType '\/worker\/workAssignment\/reportsTo\/reportsToWorkerName\/middleName?;
    StringType '\/worker\/workAssignment\/reportsTo\/reportsToWorkerName\/familyName1?;
    StringType '\/worker\/workAssignment\/reportsTo\/reportsToWorkerName\/familyName2?;
    StringType '\/worker\/workAssignment\/reportsTo\/reportsToWorkerName\/formattedName?;
    StringCodeListType '\/worker\/workAssignment\/reportsTo\/reportsToRelationshipCode?;
    StringType '\/worker\/workAssignment\/reportsTo\/reportsToRelationshipCode\/codeValue?;
    StringType '\/worker\/workAssignment\/reportsTo\/reportsToRelationshipCode\/shortName?;
    StringType '\/worker\/workAssignment\/reportsTo\/reportsToRelationshipCode\/longName?;
    StringType '\/worker\/workAssignment\/reportsTo\/itemID?;
    StringCodeListType '\/worker\/workAssignment\/payrollProcessingStatusCode?;
    StringType '\/worker\/workAssignment\/payrollProcessingStatusCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payrollProcessingStatusCode\/shortName?;
    StringType '\/worker\/workAssignment\/payrollProcessingStatusCode\/longName?;
    StringType '\/worker\/workAssignment\/payrollProcessingStatusCode\/effectiveDate?;
    StringCodeListType '\/worker\/workAssignment\/payScaleCode?;
    StringType '\/worker\/workAssignment\/payScaleCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payScaleCode\/shortName?;
    StringType '\/worker\/workAssignment\/payScaleCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/payGradeCode?;
    StringType '\/worker\/workAssignment\/payGradeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradeCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradeCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/payrollGroupCode?;
    ObjectType '\/worker\/workAssignment\/annualBenefitBaseRate?;
    StringCodeListType '\/worker\/workAssignment\/annualBenefitBaseRate\/nameCode?;
    StringType '\/worker\/workAssignment\/annualBenefitBaseRate\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/annualBenefitBaseRate\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/annualBenefitBaseRate\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/annualBenefitBaseRate\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/annualBenefitBaseRate\/currencyCode?;
    StringType '\/worker\/workAssignment\/payrollScheduleGroupID?;
    StringType '\/worker\/workAssignment\/payrollFileNumber?;
    StringCodeListType '\/worker\/workAssignment\/payrollRegionCode?;
    ObjectType '\/worker\/workAssignment\/payGradePayRange?;
    ObjectType '\/worker\/workAssignment\/payGradePayRange\/minimumRate?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/currencyCode?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/unitCode?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/unitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/unitCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/unitCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/baseUnitCode?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/baseUnitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/baseUnitCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/baseUnitCode\/longName?;
    NumberType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/baseMultiplierValue?;
    ObjectType '\/worker\/workAssignment\/payGradePayRange\/medianRate?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/currencyCode?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/unitCode?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/unitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/unitCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/unitCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/baseUnitCode?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/baseUnitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/baseUnitCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/baseUnitCode\/longName?;
    NumberType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/baseMultiplierValue?;
    ObjectType '\/worker\/workAssignment\/payGradePayRange\/maximumRate?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/currencyCode?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/unitCode?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/unitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/unitCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/unitCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/baseUnitCode?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/baseUnitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/baseUnitCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/baseUnitCode\/longName?;
    NumberType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/baseMultiplierValue?;
    NumberType '\/worker\/workAssignment\/compaRatio?;
    StringCodeListType '\/worker\/workAssignment\/payGradeStepCode?;
    StringType '\/worker\/workAssignment\/payGradeStepCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradeStepCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradeStepCode\/longName?;
    ObjectType '\/worker\/workAssignment\/payGradeStepPayRate?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/payGradeStepPayRate\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/payGradeStepPayRate\/currencyCode?;
    StringCodeListType '\/worker\/workAssignment\/payGradeStepPayRate\/unitCode?;
    StringType '\/worker\/workAssignment\/payGradeStepPayRate\/unitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradeStepPayRate\/unitCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradeStepPayRate\/unitCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/payGradeStepPayRate\/baseUnitCode?;
    StringType '\/worker\/workAssignment\/payGradeStepPayRate\/baseUnitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradeStepPayRate\/baseUnitCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradeStepPayRate\/baseUnitCode\/longName?;
    NumberType '\/worker\/workAssignment\/payGradeStepPayRate\/baseMultiplierValue?;
    StringType '\/worker\/workAssignment\/nextPayGradeStepDate?;
    StringType '\/worker\/workAssignment\/minimumPayGradeStepDuration?;
    StringCodeListType '\/worker\/workAssignment\/geographicPayDifferentialCode?;
    StringType '\/worker\/workAssignment\/geographicPayDifferentialCode\/codeValue?;
    StringType '\/worker\/workAssignment\/geographicPayDifferentialCode\/shortName?;
    StringType '\/worker\/workAssignment\/geographicPayDifferentialCode\/longName?;
    NumberType '\/worker\/workAssignment\/geographicPayDifferentialPercentage?;
    ObjectType '\/worker\/workAssignment\/customFieldGroup?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/amountFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/categoryCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/currencyCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/itemID?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/codeFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/categoryCode\/longName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/longName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/itemID?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/dateFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/categoryCode\/longName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/dateValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/itemID?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/categoryCode\/longName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/dateTimeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/itemID?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/categoryCode\/longName?;
    BooleanType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/indicatorValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/itemID?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/numberFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/categoryCode\/longName?;
    NumberType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/numberValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/itemID?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/percentFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/categoryCode\/longName?;
    NumberType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/percentValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/itemID?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/stringFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/categoryCode\/longName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/stringValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/itemID?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/categoryCode\/longName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/countryDialing?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/areaDialing?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/dialNumber?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/extension?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/access?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/formattedNumber?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/itemID?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/links?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/href?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/rel?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/canonicalUri?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/title?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/targetSchema?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/mediaType?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/method?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/encType?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/schema?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/links\/payLoadArguments?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/payLoadArguments\/argumentPath?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/payLoadArguments\/argumentValue?;
    ObjectType '\/worker\/payrollTaxProfile?;
    ArrayType '\/worker\/payrollTaxProfile\/stateIncomeTaxInstructions?;
    StringCodeListType '\/worker\/payrollTaxProfile\/stateIncomeTaxInstructions\/stateCode?;
    StringType '\/worker\/payrollTaxProfile\/stateIncomeTaxInstructions\/stateCode\/codeValue?;
    StringType '\/worker\/payrollTaxProfile\/stateIncomeTaxInstructions\/stateCode\/shortName?;
    StringType '\/worker\/payrollTaxProfile\/stateIncomeTaxInstructions\/stateCode\/longName?;
    BooleanType '\/worker\/payrollTaxProfile\/stateIncomeTaxInstructions\/workedInJurisdictionIndicator?;
    BooleanType '\/worker\/payrollTaxProfile\/stateIncomeTaxInstructions\/livedInJurisdictionIndicator?;
    ObjectType '\/worker\/payrollTaxProfile\/suiTaxInstruction?;
    StringCodeListType '\/worker\/payrollTaxProfile\/suiTaxInstruction\/stateCode?;
    StringType '\/worker\/payrollTaxProfile\/suiTaxInstruction\/stateCode\/codeValue?;
    StringType '\/worker\/payrollTaxProfile\/suiTaxInstruction\/stateCode\/shortName?;
    StringType '\/worker\/payrollTaxProfile\/suiTaxInstruction\/stateCode\/longName?;
    ObjectType '\/worker\/customFieldGroup?;
    ArrayType '\/worker\/customFieldGroup\/amountFields?;
    StringCodeListType '\/worker\/customFieldGroup\/amountFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/amountFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/amountFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/amountFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/amountFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/amountFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/amountFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/amountFields\/categoryCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/customFieldGroup\/amountFields\/amountValue?;
    StringCodeListType '\/worker\/customFieldGroup\/amountFields\/currencyCode?;
    StringType '\/worker\/customFieldGroup\/amountFields\/itemID?;
    StringCodeListType '\/worker\/customFieldGroup\/codeFields?;
    StringCodeListType '\/worker\/customFieldGroup\/codeFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/codeFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/codeFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/codeFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/codeFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/codeFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/codeFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/codeFields\/categoryCode\/longName?;
    StringType '\/worker\/customFieldGroup\/codeFields\/codeValue?;
    StringType '\/worker\/customFieldGroup\/codeFields\/shortName?;
    StringType '\/worker\/customFieldGroup\/codeFields\/longName?;
    StringType '\/worker\/customFieldGroup\/codeFields\/itemID?;
    ArrayType '\/worker\/customFieldGroup\/dateFields?;
    StringCodeListType '\/worker\/customFieldGroup\/dateFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/dateFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/dateFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/dateFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/dateFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/dateFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/dateFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/dateFields\/categoryCode\/longName?;
    StringType '\/worker\/customFieldGroup\/dateFields\/dateValue?;
    StringType '\/worker\/customFieldGroup\/dateFields\/itemID?;
    ArrayType '\/worker\/customFieldGroup\/dateTimeFields?;
    StringCodeListType '\/worker\/customFieldGroup\/dateTimeFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/dateTimeFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/dateTimeFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/dateTimeFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/dateTimeFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/dateTimeFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/dateTimeFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/dateTimeFields\/categoryCode\/longName?;
    StringType '\/worker\/customFieldGroup\/dateTimeFields\/dateTimeValue?;
    StringType '\/worker\/customFieldGroup\/dateTimeFields\/itemID?;
    ArrayType '\/worker\/customFieldGroup\/indicatorFields?;
    StringCodeListType '\/worker\/customFieldGroup\/indicatorFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/indicatorFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/indicatorFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/indicatorFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/indicatorFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/indicatorFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/indicatorFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/indicatorFields\/categoryCode\/longName?;
    BooleanType '\/worker\/customFieldGroup\/indicatorFields\/indicatorValue?;
    StringType '\/worker\/customFieldGroup\/indicatorFields\/itemID?;
    ArrayType '\/worker\/customFieldGroup\/numberFields?;
    StringCodeListType '\/worker\/customFieldGroup\/numberFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/numberFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/numberFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/numberFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/numberFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/numberFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/numberFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/numberFields\/categoryCode\/longName?;
    NumberType '\/worker\/customFieldGroup\/numberFields\/numberValue?;
    StringType '\/worker\/customFieldGroup\/numberFields\/itemID?;
    ArrayType '\/worker\/customFieldGroup\/percentFields?;
    StringCodeListType '\/worker\/customFieldGroup\/percentFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/percentFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/percentFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/percentFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/percentFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/percentFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/percentFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/percentFields\/categoryCode\/longName?;
    NumberType '\/worker\/customFieldGroup\/percentFields\/percentValue?;
    StringType '\/worker\/customFieldGroup\/percentFields\/itemID?;
    ArrayType '\/worker\/customFieldGroup\/stringFields?;
    StringCodeListType '\/worker\/customFieldGroup\/stringFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/stringFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/stringFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/stringFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/stringFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/stringFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/stringFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/stringFields\/categoryCode\/longName?;
    StringType '\/worker\/customFieldGroup\/stringFields\/stringValue?;
    StringType '\/worker\/customFieldGroup\/stringFields\/itemID?;
    ArrayType '\/worker\/customFieldGroup\/telephoneFields?;
    StringCodeListType '\/worker\/customFieldGroup\/telephoneFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/telephoneFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/categoryCode\/longName?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/countryDialing?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/areaDialing?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/dialNumber?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/extension?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/access?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/formattedNumber?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/itemID?;
    ArrayType '\/worker\/customFieldGroup\/links?;
    StringType '\/worker\/customFieldGroup\/links\/href?;
    StringType '\/worker\/customFieldGroup\/links\/rel?;
    StringType '\/worker\/customFieldGroup\/links\/canonicalUri?;
    StringType '\/worker\/customFieldGroup\/links\/title?;
    StringType '\/worker\/customFieldGroup\/links\/targetSchema?;
    StringType '\/worker\/customFieldGroup\/links\/mediaType?;
    StringType '\/worker\/customFieldGroup\/links\/method?;
    StringType '\/worker\/customFieldGroup\/links\/encType?;
    StringType '\/worker\/customFieldGroup\/links\/schema?;
    ArrayType '\/worker\/customFieldGroup\/links\/payLoadArguments?;
    StringType '\/worker\/customFieldGroup\/links\/payLoadArguments\/argumentPath?;
    StringType '\/worker\/customFieldGroup\/links\/payLoadArguments\/argumentValue?;
};

# A code indicating whether the work assignment is covered under applicable wage and labor laws relating to working hours, overtime, and similar protections, e.g. FLSA in the US
public type WagelawcoveragetypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 wageLawNameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 coverageCode?;
};

public type ValueSetMeta record {
    # Code value (typically a key field) of the code list item
    string idValuePath?;
    # Short name field of the code list item
    string itemDescriptionPath?;
};

# Base structure for  actor
public type ActortypeV02 record {
    # The unique identifier of the related entity 
    IdtypeV02 applicationID?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 associateOID?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 personOID?;
    # Human readable name of the actor
    string formattedName?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 deviceID?;
    # The coordinates of the location
    CoordinatetypeV02 geoCoordinate?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 deviceUserAgentID?;
    # An event instance
    AssignedGroup[] assignedGroups?;
};

# Schema describing the details of a party - an agency, bureau, or other organization issuing the associated document; the body or persons exercising power or command. An issuing party is often is a government agency or official authority, but sometimes might be a private organization
public type PartybasetypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # organization address objects / components
    OrganizationaddresstypeV02 address?;
};

# This allows for further refinement of the associated event. For example, for a worker.maritalStatus.change event, the reason code could be used to describe whether it is a Marriage vs. Divorce vs. Separation. This is optional and valued as defined by the system of record.
public type WorkeronleaveeventEventreasoncode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
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

# The string reprersentation of the date range. Used to specify effective period.  Follows the ISO-8601:2000 format
public type DateperiodtypeV01 record {
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 startDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 endDate?;
};

public type AdditionalRemunerationAssociatedRateQualifierType record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 qualifierObjectTypeCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 qualifierObjectCode?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 qualifierObjectID?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# An instance of an Associate that is part of the group(s) assigned to the review event.  The actor is the member that actually completes the event.
public type AssignedGroupMember record {
    # The simple (string) identifier of an object
    SimpleidtypeV02 associateOID?;
    # Human readable name of the actor
    string formattedName?;
};

# The place a person was born. This can have taxation impacts. Inlcudes certain address components
public type BirthplacetypeV02 record {
    # A city in the context of an address
    string cityName?;
    # A country sub-division correlating to a administrative level one or two levels below country. For example, in the United States, this might be a state or a county
    CountrysubdivisiontypeV02 countrySubdivisionLevel1?;
    # A country sub-division correlating to a administrative level one or two levels below country. For example, in the United States, this might be a state or a county
    CountrysubdivisiontypeV02 countrySubdivisionLevel2?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 postalCode?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 countryCode?;
    # A formatted version of the place where a person is born.
    string formattedBirthPlace?;
};

public type EventactortypeV01 record {
    *ActortypeV02;
};

public type WorkAssignmentTransformOccupationalClassification record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 classificationCode?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# Schema describing the type of the user or developer message
public type MessagetypecodetypeV01 record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
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
    LinkType[] links?;
};

# A representation of a rate amount value
public type RateamounttypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The numeric value associated to the rate. In the example 5 US dollars per hour, the number 5 is the rate value. In the example 3 bags of rice per month, the number 3 is the rate value. In the example, 20 percent of annual sales, the amountValue would be 20
    decimal amountValue?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 currencyCode?;
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
    LinkType[] dependencyLinks?;
};

# The base or primary pay (i.e. salary, wage) associated to a work assignment. The structure allows for the explicit communication of pre-defined equivalents for the base remuneration
public type WorkassignmenttypeV02Baseremuneration record {
    # A representation of a rate amount value
    RateamounttypeV02 hourlyRateAmount?;
    # A representation of a rate amount value
    RateamounttypeV02 dailyRateAmount?;
    # A representation of a rate amount value
    RateamounttypeV02 weeklyRateAmount?;
    # A representation of a rate amount value
    RateamounttypeV02 monthlyRateAmount?;
    # A representation of a rate amount value
    RateamounttypeV02 annualRateAmount?;
    # A representation of a rate percentage value
    RatepercentagetypeV02 commissionRatePercentage?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 recordingBasisCode?;
    # A representation of a rate amount value
    RateamounttypeV02 biweeklyRateAmount?;
    # A representation of a rate amount value
    RateamounttypeV02 semiMonthlyRateAmount?;
    # A representation of a rate amount value
    RateamounttypeV02 payPeriodRateAmount?;
    # Describes the conditions under which the associated rate can be expected
    AdditionalRemunerationAssociatedRateQualifierType[] associatedRateQualifiers?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 effectiveDate?;
};

public type CustomfieldcontainertypeV02Datetimefields record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 categoryCode?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 dateTimeValue?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# The status of the worker in the organization at the highest level. If a given worker has multiple relationships with the organization, this is the status that arches over all those relationships
public type Workertransform1Workerstatus record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# The actor is the party that completed the recording of the event.
public type WorkeronleaveeventActor record {
    # The unique identifier of the application which originated the event.
    WorkeronleaveeventOriginatorApplicationid applicationID?;
    # The unique identifier of an associate who originated the event.
    string associateOID?;
    # Human readable name of the event actor
    string formattedName?;
    # The unique identifier of the device, e.g. a time clock, door entry beam.
    string deviceID?;
    # The coordinates of the location of the actor
    WorkeronleaveeventActorGeocoordinate geoCoordinate?;
    # Identifier of the user agent of the device used by the actor who worked on the event
    string deviceUserAgentID?;
};

# The coordinates of the location of the actor
public type WorkeronleaveeventActorGeocoordinate record {
    # The angle, in degrees, of a position on Earth above the equator. (Latitude is negative for a place below the equator.) specified in decimal degrees
    decimal latitude?;
    # The angle, in degrees, of a position on Earth around the equator from the Greenwich Meridian specified in decimal degrees
    decimal longitude?;
};

# The unique identifier of a position
public type PositionidtypeV02 string;

# An identifier for a worker, e.g. an Employee ID
public type Workeroutput1Workerid record {
    # An actual ID value
    string idValue?;
    # The scheme code
    WorkeronleaveeventOriginatorApplicationidSchemecode schemeCode?;
};

# A representation of a rate value
public type RatetypeV02 record {
    # The numeric value associated to the rate. In the example 5 US dollars per hour, the number 5 is the rate value. In the example 3 bags of rice per month, the number 3 is the rate value. In the example, 20 percent of annual sales, the amountValue would be 20
    decimal amountValue?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 currencyCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 unitCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 baseUnitCode?;
    # For any given rate, the base rate value is presumed to be 1, e.g. per one hour, per one month. If for example, the rate was 10 US dollars for every widget produced, the base rate value is presumed to be one and there is no need to communicate a baseMultiplierValue. If however, the rate was 10 US Dollars for every 3 widgets produced, the baseMultiplierValue would be 3
    decimal baseMultiplierValue?;
};

public type SequenceType int;

public type EmailContactCommunicationType record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The email URI of the related entity
    EmailuritypeV02 emailUri?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    boolean notificationIndicator?;
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
    LinkType[] dependencyLinks?;
};

public type WorkerOnLeaveEvent record {
    WorkeronleaveeventEvents[] events?;
};

# Event meta data
public type WorkerterminateeventmetaMeta record {
    # The service domain, e.g HR, Payroll, Benefits, etc. This field is always present and valued based on a standard codelist.
    string '\/serviceCategoryCode\/codeValue;
    # This is the canonical name of the event, e.g. dependent.add, worker.hire. This field is always present and valued based on a standard codelist.
    string '\/eventNameCode\/codeValue;
    # A collection of query criteria
    WorkerhireQueryCriterion[] queryCriteria?;
    # Validation rules for the event context
    WorkerterminateeventmetaMetaDataeventcontext '\/data\/eventContext?;
    # A collection of transform rules
    WorkerterminateeventmetaMetaDatatransforms[] '\/data\/transforms?;
};

public type WorkerOnLeaveEventMeta record {
    # Event meta data
    WorkeronleaveeventmetaMeta meta?;
};

public type SUIInstructionTransform record {
    # The code for the related entity
    CodetypeV01 stateCode?;
};

# The unique identifier of the related entity 
public type IdtypeV02 record {
    # An actual ID value
    string idValue?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 schemeCode?;
};

# The string representation of the date value. Follows the ISO-8601:2000 format
public type DatetypeV01 string;

# Data which is transformed as a result of the event
public type WorkerhireeventDataTransform record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventReasonCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventStatusCode?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 effectiveDateTime?;
    # Boolean expression
    IndicatortypeV01 notificationIndicator?;
    # A worker is someone who performs duties and has responsibilities for an organization
    WorkerTransform 'worker?;
};

# The unique identifier of the related entity 
public type IdtypeV01 record {
    # An ID
    string idValue?;
    # The type of ID
    string schemeName?;
    # The agency that issues the ID
    string schemeAgencyName?;
};

public type WorkerTerminateEvent record {
    WorkerterminateeventEvents[] events?;
    # Meta contains the metadata associated with a response.  A GET response may include metadata to support pagination
    MetatypeV02 meta?;
    # The ConfirmMessage contains the processing results for the corresponding request.  A request may have its processing reported as: succeeded, partially failed, or failed.
    ConfirmmessagetypeV01 confirmMessage?;
};

# This allows the system of record to prioritize events and is valued based on a standard codelist.
public type WorkeronleaveeventPrioritycode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
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
    LinkType[] dependencyLinks?;
};

# A preferred salutation, e.g. Mr., Dr., etc.
public type SalutationtypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 salutationCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 typeCode?;
    # Sequence of a related entity when included in the collection or a group
    SequencetypeV01 sequenceNumber?;
};

# Person titles, e.g. social, professional, generational, etc.
public type TitleaffixtypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 affixCode?;
    # Sequence of a related entity when included in the collection or a group
    SequencetypeV01 sequenceNumber?;
};

# A bargaining unit is a group of employees who are so grouped for the purpose of collective bargaining. A bargaining unit is also known as a local labor union
public type BargainingunittypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 bargainingUnitCode?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 seniorityDate?;
};

# Schema to describe details of a location
public type LocationtypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # Communication objects to include various communication mechanisms, e,g, phone, email, etc.
    CommunicationtypeV02 communication?;
    # organization address objects / components
    OrganizationaddresstypeV02 address?;
};

# Boolean expression
public type IndicatortypeV01 boolean;

# This is the canonical name of the event, e.g. dependent.add, worker.hire.
public type WorkeronleaveeventOriginatorEventnamecode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# A representation of a percentage value
public type PercentagetypeV02 decimal;

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

# Event Data
public type WorkerterminateeventData record {
    # Data which sets the context for the event.  That is, the keys which set context
    WorkerterminateeventDataEventcontext eventContext?;
    # Data which is transformed as a result of the event
    WorkerterminateeventDataTransform transform?;
    # Result of the event
    WorkerterminateeventDataOutput output?;
};

# An instance to capture the worker on leave event
public type WorkeronleaveeventEvents record {
    # The unique identifier of the event instance. This is set by the system of record once an event is recorded as in progress or complete.
    string eventID?;
    # The service domain, e.g. HR, Payroll, Benefits, etc. This field is always present and valued based on a standard codelist.
    WorkeronleaveeventServicecategorycode serviceCategoryCode?;
    # This is the canonical name of the event, e.g. dependent.add, worker.hire. This field is always present and valued based on a standard codelist.
    WorkeronleaveeventEventnamecode eventNameCode?;
    # The event title offers a way to describe a particular instance of an event at a level more granular than the event name, e.g. 2014 Annual Enrollment.
    string eventTitle?;
    # This allows for further refinement of the associated event. For example, for a worker.maritalStatus.change event, the reason code could be used to describe whether it is a Marriage vs. Divorce vs. Separation. This is optional and valued as defined by the system of record.
    WorkeronleaveeventEventreasoncode eventReasonCode?;
    # This identifies the status of the event. An event that has initiated by the system of record, such as a benefits annual enrollment event, will have an event status code of created. An event that is saved in a work in progress state (as determined by the permissible state codes), will have an event status code of inProgress. An event that has been recorded, will have an event status code of complete. This is set by the system of record and valued based on a standard codeslist.
    WorkeronleaveeventEventstatuscode eventStatusCode?;
    # This allows the system of record to prioritize events and is valued based on a standard codelist.
    WorkeronleaveeventPrioritycode priorityCode?;
    # This is the date time the event is recorded in the system of record with an event status code equal to complete. This value is set by the system of record.
    string recordDateTime?;
    # This is the date time the event is created. If a system of record creates the event instance, as in the case of an annual enrollment for example, then is sets the creation date time. If a user declares an event, then this is set to the date time when the first call is made to the system of record.
    string creationDateTime?;
    # This is the effective date, or effective date time fo the event from a business perspective. In some systems, this may be referred to as the Event Date. For example, for a birth event, this is the date of birth. If there is no effective date from a business perspective, this is set equal to the record date time.
    string effectiveDateTime?;
    # This value is set by the system of record and used to term the life cycle of an event instance. 
    string expirationDateTime?;
    # This value is set by the system of record and allows for the presentation of a date by which the system of record would like the user to complete the event.
    string dueDateTime?;
    # An originator is a user, machine or event that triggered the event.
    WorkeronleaveeventOriginator originator?;
    # The actor is the party that completed the recording of the event.
    WorkeronleaveeventActor actor?;
    WorkeronleaveeventLinks[] links?;
    # Event Data
    WorkeronleaveeventData data?;
};

# Represents the duration of time as represented by ISO 8601. Where the value space is a six dimensional space where the coordinates designate the Gregorian year, month, day, hour, minute, and second. The number of seconds can include decimal digits to arbitary pecision. PnYn MnDTnH nMnS, where: [n] is replaced by the value for each of the date and time elements that follow the [n]. Leading zeros are not required, but the maximum number of digits for each element should be agreed to by the communicating parties. The capital letters 'P', 'Y', 'M', 'W', 'D', 'T', 'H', 'M', and 'S' are designators for each of the date and time elements and are not replaced. P is the duration designator (historically called 'period') placed at the start of the duration representation. Y is the year designator that follows the value for the number of years. M is the month designator that follows the value for the number of months. D is the day designator that follows the value for the number of days. T is the time designator that precedes the time components of the representation. H is the hour designator that follows the value for the number of hours. M is the minute designator that follows the value for the number of minutes. S is the second designator that follows the value for the number of seconds. The number of seconds can include decimal digits to arbitrary precision
public type DurationtypeV01 string;

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
    LinkType[] dependencyLinks?;
};

# The unique identifier of the application which originated the event.
public type WorkeronleaveeventOriginatorApplicationid record {
    # An actual ID value
    string idValue?;
    # The scheme code
    WorkeronleaveeventOriginatorApplicationidSchemecode schemeCode?;
};

# A worker is someone who performs duties and has responsibilities for an organization
public type WorkerOutput record {
    # A unique identifier of an associate
    string associateOID?;
    # The unique identifier of the related entity 
    IdtypeV02 workerID?;
    # An associate is a person with a relationship to an organization
    PersonOutput person?;
    # These dates are related to the highest level legal relationship that a person has with the organization. If a given worker has multiple relationships with the organization, these are the dates associated with the primary relationship.
    WorkerDatesTransform workerDates?;
    # Status to include the status code, effective date (ISO-8601:2000 format) and the reason for change
    StatusreasontypeV02 workerStatus?;
    # Communication objects to include various communication mechanisms, e,g, phone, email, etc.
    CommunicationtypeV02 businessCommunication?;
    # A work assignment pertains to the duties and responsibilities that should be performed by the worker
    WorkassignmenttypeV02 workAssignment?;
    # A worker is someone who performs duties and has responsibilities for an organization
    PayrollTaxProfileTransform payrollTaxProfile?;
    # A container of custom fields. The category within each custom object allows for the categorizing or grouping of the associated custom field for the purpose of data mining. For example, the typeCode on a custom string object might be valued as SIZE and the correlating name codes might be t-shirt, pants, jacket, etc.
    CustomfieldcontainertypeV02 customFieldGroup?;
};

# Each object contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).
public type ProcessmessageV01 record {
    # The unique identifier of the related entity 
    IdtypeV01 processMessageID?;
    # Schema describing the type of the user or developer message
    MessagetypecodetypeV01 messageTypeCode?;
    # Expression that provides the location (or source) of content in a message instance that is associated with a process message. Examples of expression languages include: XPath, XQuery, JSON Pointer.
    string sourceLocationExpression?;
    # Identifies the language used for expressions communicated in this message.
    ConfirmmessagetypeV01Expressionlanguagecode expressionLanguageCode?;
    # A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    LinktypeV02[] links?;
    # Representation of a message.
    MessagetypeV01 userMessage?;
    # Representation of a message.
    MessagetypeV01 developerMessage?;
};

# A worker is someone who performs duties and has responsibilities for an organization
public type Workeroutput3 record {
    # The unique identifier of an assoicate
    AssociateoidtypeV02 associateOID?;
    # The unique identifier of the related entity 
    IdtypeV02 workerID?;
    # These dates are related to the highest level legal relationship that a person has with the organization. If a given worker has multiple relationships with the organization, these are the dates associated with the primary relationship.
    WorkerDatesTransform workerDates?;
    # Status to include the status code, effective date (ISO-8601:2000 format) and the reason for change
    StatusreasontypeV02 workerStatus?;
    # Boolean expression
    IndicatortypeV01 voluntaryIndicator?;
};

# A worker is someone who performs duties and has responsibilities for an organization
public type Workeroutput2 record {
    # The unique identifier of an assoicate
    AssociateoidtypeV02 associateOID?;
    # The unique identifier of the related entity 
    IdtypeV02 workerID?;
    # An associate is a person with a relationship to an organization
    PersonOutput person?;
    # These dates are related to the highest level legal relationship that a person has with the organization. If a given worker has multiple relationships with the organization, these are the dates associated with the primary relationship.
    WorkerDatesTransform workerDates?;
    # Status to include the status code, effective date (ISO-8601:2000 format) and the reason for change
    StatusreasontypeV02 workerStatus?;
    # Communication objects to include various communication mechanisms, e,g, phone, email, etc.
    CommunicationtypeV02 businessCommunication?;
    # A work assignment pertains to the duties and responsibilities that should be performed by the worker
    WorkassignmenttypeV02 workAssignment?;
    # A container of custom fields. The category within each custom object allows for the categorizing or grouping of the associated custom field for the purpose of data mining. For example, the typeCode on a custom string object might be valued as SIZE and the correlating name codes might be t-shirt, pants, jacket, etc.
    CustomfieldcontainertypeV02 customFieldGroup?;
};

# The base or primary pay (i.e. salary, wage) associated to a work assignment. The structure allows for the explicit communication of pre-defined equivalents for the base remuneration
public type WorkAssignmentTransformBaseRemuneration record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 recordingBasisCode?;
    # A representation of a rate amount value
    RateamounttypeV02 hourlyRateAmount?;
    # A representation of a rate amount value
    RateamounttypeV02 dailyRateAmount?;
    # A representation of a rate amount value
    RateamounttypeV02 weeklyRateAmount?;
    # A representation of a rate amount value
    RateamounttypeV02 biweeklyRateAmount?;
    # A representation of a rate amount value
    RateamounttypeV02 semiMonthlyRateAmount?;
    # A representation of a rate amount value
    RateamounttypeV02 monthlyRateAmount?;
    # A representation of a rate amount value
    RateamounttypeV02 annualRateAmount?;
    # A representation of a rate amount value
    RateamounttypeV02 payPeriodRateAmount?;
    # A representation of a rate percentage value
    RatepercentagetypeV02 commissionRatePercentage?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 effectiveDate?;
};

# A worker is someone who performs duties and has responsibilities for an organization
public type Workeroutput1 record {
    # A unique identifier of an associate
    string associateOID?;
    # An identifier for a worker, e.g. an Employee ID
    Workeroutput1Workerid workerID?;
    # The status of the worker in the organization at the highest level. If a given worker has multiple relationships with the organization, this is the status that arches over all those relationships
    Workeroutput1Workerstatus workerStatus?;
};

# A unique identifier of an object within the collection
public type ItemIDType string;

# The unique identifier - UUID
public type OidtypeV02 string;

# The ratio
public type RatiotypeV02 decimal;

public type WorkerRehireEventMeta record {
    # Event meta data
    WorkerrehireeventmetaMeta meta?;
};

# Event meta data
public type WorkerhireeventmetaMeta record {
    # The service domain, e.g HR, Payroll, Benefits, etc. This field is always present and valued based on a standard codelist.
    string '\/serviceCategoryCode\/codeValue;
    # This is the canonical name of the event, e.g. dependent.add, worker.hire. This field is always present and valued based on a standard codelist.
    string '\/eventNameCode\/codeValue;
    # A collection of query criteria
    WorkerhireQueryCriterion[] queryCriteria?;
    # Validation rules for the event context
    record  { }  '\/data\/eventContext?;
    # A collection of transform rules
    WorkerhireeventmetaMetaDatatransforms[] '\/data\/transforms?;
};

# Meta contains the metadata associated with a response.  A GET response may include metadata to support pagination
public type MetatypeV02 record {
    # Sequence of a related entity when included in the collection or a group
    SequencetypeV01 startSequence?;
    # Boolean expression
    IndicatortypeV01 completeIndicator?;
    # Number of total instance resources in an instance resource set. Note: An instance resource set is a set of instance resources that is determined by a server to satisfy the sets membership criteria (i.e., selection, filter, expansion and search criteria) of a resource management operation (e.g. GET request) upon a collection resource
    int totalNumber?;
    # The simple (string) identifier of an object
    SimpleidtypeV02 resourceSetID?;
    # A link description object is used to describe link relations. In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
    LinktypeV02[] links?;
};

# Result of the event
public type WorkeronleaveeventDataOutput record {
    # A worker is someone who performs duties and has responsibilities for an organization
    Workeroutput1 'worker?;
};

public type MaskingRuleType record {
    IndicatorType authorizationRequiredIndicator?;
    SimpleIDType authorizationResourceID?;
    LinkType[] links?;
};

# The status of the worker in the organization at the highest level. If a given worker has multiple relationships with the organization, this is the status that arches over all those relationships
public type Workeroutput1Workerstatus record {
    # The status of the work assignment, e.g. active, inactive
    Workeroutput1WorkerstatusStatuscode statusCode?;
    # The reason associated to the correlating status, e.g. new hire, rehire, termination, etc.
    Workeroutput1WorkerstatusReasoncode reasonCode?;
    # The effective date of the related entity. Follows the ISO-8601:2000 format
    string effectiveDate?;
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
    LinktypeV02Payloadarguments[] payLoadArguments?;
};

public type CustomfieldcontainertypeV02Codefields record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 categoryCode?;
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# Data which is transformed as a result of the event
public type WorkerterminateeventDataTransform record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventReasonCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventStatusCode?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 effectiveDateTime?;
    # Boolean expression
    IndicatortypeV01 notificationIndicator?;
    # A worker is someone who performs duties and has responsibilities for an organization
    Workertransform3 'worker?;
};

# Sequence of a related entity when included in the collection or a group
public type SequencetypeV01 int;

public type WorkerrehireeventmetaMetaDatatransforms record {
    # The unique identifier of the collection.
    string itemID?;
    StringCodeListType '\/eventReasonCode?;
    StringType '\/eventReasonCode\/codeValue?;
    StringType '\/eventReasonCode\/shortName?;
    StringType '\/eventReasonCode\/longName?;
    StringCodeListType '\/eventStatusCode?;
    StringType '\/eventStatusCode\/codeValue?;
    StringType '\/eventStatusCode\/shortName?;
    StringType '\/eventStatusCode\/longName?;
    StringType '\/effectiveDateTime?;
    BooleanType '\/notificationIndicator?;
    ObjectType '\/worker?;
    StringType '\/worker\/associateOID?;
    ObjectType '\/worker\/workerID?;
    StringType '\/worker\/workerID\/idValue?;
    StringCodeListType '\/worker\/workerID\/schemeCode?;
    StringType '\/worker\/workerID\/schemeCode\/codeValue?;
    StringType '\/worker\/workerID\/schemeCode\/shortName?;
    StringType '\/worker\/workerID\/schemeCode\/longName?;
    ObjectType '\/worker\/person?;
    ArrayType '\/worker\/person\/governmentIDs?;
    StringType '\/worker\/person\/governmentIDs\/idValue?;
    StringCodeListType '\/worker\/person\/governmentIDs\/nameCode?;
    StringType '\/worker\/person\/governmentIDs\/nameCode\/codeValue?;
    StringType '\/worker\/person\/governmentIDs\/nameCode\/shortName?;
    StringType '\/worker\/person\/governmentIDs\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/governmentIDs\/countryCode?;
    StringCodeListType '\/worker\/person\/governmentIDs\/statusCode?;
    StringType '\/worker\/person\/governmentIDs\/statusCode\/codeValue?;
    StringType '\/worker\/person\/governmentIDs\/statusCode\/shortName?;
    StringType '\/worker\/person\/governmentIDs\/statusCode\/longName?;
    StringType '\/worker\/person\/governmentIDs\/statusCode\/effectiveDate?;
    StringType '\/worker\/person\/governmentIDs\/expirationDate?;
    StringType '\/worker\/person\/governmentIDs\/itemID?;
    ObjectType '\/worker\/person\/legalName?;
    StringType '\/worker\/person\/legalName\/givenName?;
    StringType '\/worker\/person\/legalName\/middleName?;
    StringType '\/worker\/person\/legalName\/familyName1?;
    StringType '\/worker\/person\/legalName\/familyName2?;
    StringType '\/worker\/person\/legalName\/formattedName?;
    StringCodeListType '\/worker\/person\/legalName\/nameCode?;
    StringType '\/worker\/person\/legalName\/nameCode\/codeValue?;
    StringType '\/worker\/person\/legalName\/nameCode\/shortName?;
    StringType '\/worker\/person\/legalName\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/legalName\/scriptCode?;
    StringType '\/worker\/person\/legalName\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/legalName\/scriptCode\/shortName?;
    StringType '\/worker\/person\/legalName\/scriptCode\/longName?;
    ArrayType '\/worker\/person\/legalName\/preferredSalutations?;
    StringCodeListType '\/worker\/person\/legalName\/preferredSalutations\/salutationCode?;
    StringType '\/worker\/person\/legalName\/preferredSalutations\/salutationCode\/codeValue?;
    StringType '\/worker\/person\/legalName\/preferredSalutations\/salutationCode\/shortName?;
    StringType '\/worker\/person\/legalName\/preferredSalutations\/salutationCode\/longName?;
    StringCodeListType '\/worker\/person\/legalName\/preferredSalutations\/typeCode?;
    StringType '\/worker\/person\/legalName\/preferredSalutations\/typeCode\/codeValue?;
    StringType '\/worker\/person\/legalName\/preferredSalutations\/typeCode\/shortName?;
    StringType '\/worker\/person\/legalName\/preferredSalutations\/typeCode\/longName?;
    NumberType '\/worker\/person\/legalName\/preferredSalutations\/sequenceNumber?;
    ArrayType '\/worker\/person\/legalName\/titlePrefixCodes?;
    StringCodeListType '\/worker\/person\/legalName\/titlePrefixCodes\/affixCode?;
    StringType '\/worker\/person\/legalName\/titlePrefixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/legalName\/titlePrefixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/legalName\/titlePrefixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/legalName\/titlePrefixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/legalName\/nickName?;
    StringCodeListType '\/worker\/person\/legalName\/generationAffixCode?;
    StringType '\/worker\/person\/legalName\/generationAffixCode\/codeValue?;
    StringType '\/worker\/person\/legalName\/generationAffixCode\/shortName?;
    StringType '\/worker\/person\/legalName\/generationAffixCode\/longName?;
    StringCodeListType '\/worker\/person\/legalName\/qualificationAffixCode?;
    StringType '\/worker\/person\/legalName\/qualificationAffixCode\/codeValue?;
    StringType '\/worker\/person\/legalName\/qualificationAffixCode\/shortName?;
    StringType '\/worker\/person\/legalName\/qualificationAffixCode\/longName?;
    ArrayType '\/worker\/person\/legalName\/titleAffixCodes?;
    StringCodeListType '\/worker\/person\/legalName\/titleAffixCodes\/affixCode?;
    StringType '\/worker\/person\/legalName\/titleAffixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/legalName\/titleAffixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/legalName\/titleAffixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/legalName\/titleAffixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/legalName\/familyName1Prefix?;
    StringType '\/worker\/person\/legalName\/familyName2Prefix?;
    StringType '\/worker\/person\/legalName\/initials?;
    ObjectType '\/worker\/person\/legalAddress?;
    StringCodeListType '\/worker\/person\/legalAddress\/nameCode?;
    StringType '\/worker\/person\/legalAddress\/nameCode\/codeValue?;
    StringType '\/worker\/person\/legalAddress\/nameCode\/shortName?;
    StringType '\/worker\/person\/legalAddress\/nameCode\/longName?;
    StringType '\/worker\/person\/legalAddress\/attentionOfName?;
    StringType '\/worker\/person\/legalAddress\/careOfName?;
    StringType '\/worker\/person\/legalAddress\/lineOne?;
    StringType '\/worker\/person\/legalAddress\/lineTwo?;
    StringType '\/worker\/person\/legalAddress\/lineThree?;
    StringType '\/worker\/person\/legalAddress\/cityName?;
    StringCodeListType '\/worker\/person\/legalAddress\/countrySubdivisionLevel1?;
    StringType '\/worker\/person\/legalAddress\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/person\/legalAddress\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/person\/legalAddress\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/person\/legalAddress\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/person\/legalAddress\/countryCode?;
    StringCodeListType '\/worker\/person\/legalAddress\/postalCode?;
    ObjectType '\/worker\/person\/legalAddress\/geoCoordinate?;
    NumberType '\/worker\/person\/legalAddress\/geoCoordinate\/latitude?;
    NumberType '\/worker\/person\/legalAddress\/geoCoordinate\/longitude?;
    StringCodeListType '\/worker\/person\/legalAddress\/scriptCode?;
    StringType '\/worker\/person\/legalAddress\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/legalAddress\/scriptCode\/shortName?;
    StringType '\/worker\/person\/legalAddress\/scriptCode\/longName?;
    StringType '\/worker\/person\/legalAddress\/lineFour?;
    StringType '\/worker\/person\/legalAddress\/lineFive?;
    StringType '\/worker\/person\/legalAddress\/buildingNumber?;
    StringType '\/worker\/person\/legalAddress\/buildingName?;
    StringType '\/worker\/person\/legalAddress\/blockName?;
    StringType '\/worker\/person\/legalAddress\/streetName?;
    StringCodeListType '\/worker\/person\/legalAddress\/streetTypeCode?;
    StringType '\/worker\/person\/legalAddress\/streetTypeCode\/codeValue?;
    StringType '\/worker\/person\/legalAddress\/streetTypeCode\/shortName?;
    StringType '\/worker\/person\/legalAddress\/streetTypeCode\/longName?;
    StringType '\/worker\/person\/legalAddress\/unit?;
    StringType '\/worker\/person\/legalAddress\/floor?;
    StringType '\/worker\/person\/legalAddress\/stairCase?;
    StringType '\/worker\/person\/legalAddress\/door?;
    StringType '\/worker\/person\/legalAddress\/postOfficeBox?;
    StringType '\/worker\/person\/legalAddress\/deliveryPoint?;
    StringType '\/worker\/person\/legalAddress\/plotID?;
    StringCodeListType '\/worker\/person\/legalAddress\/countrySubdivisionLevel2?;
    StringType '\/worker\/person\/legalAddress\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/person\/legalAddress\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/person\/legalAddress\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/person\/legalAddress\/countrySubdivisionLevel2\/subdivisionType?;
    BooleanSameAsAddressIndicatorType '\/worker\/person\/legalAddress\/sameAsAddressIndicator?;
    ObjectType '\/worker\/person\/legalAddress\/sameAsAddressLink?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/href?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/rel?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/canonicalUri?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/title?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/targetSchema?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/mediaType?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/method?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/encType?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/schema?;
    ArrayType '\/worker\/person\/legalAddress\/sameAsAddressLink\/payLoadArguments?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/payLoadArguments\/argumentPath?;
    StringType '\/worker\/person\/legalAddress\/sameAsAddressLink\/payLoadArguments\/argumentValue?;
    ObjectType '\/worker\/person\/communication?;
    ArrayType '\/worker\/person\/communication\/landlines?;
    StringCodeListType '\/worker\/person\/communication\/landlines\/nameCode?;
    StringType '\/worker\/person\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/worker\/person\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/worker\/person\/communication\/landlines\/nameCode\/longName?;
    StringType '\/worker\/person\/communication\/landlines\/countryDialing?;
    StringType '\/worker\/person\/communication\/landlines\/areaDialing?;
    StringType '\/worker\/person\/communication\/landlines\/dialNumber?;
    StringType '\/worker\/person\/communication\/landlines\/extension?;
    StringType '\/worker\/person\/communication\/landlines\/access?;
    StringType '\/worker\/person\/communication\/landlines\/formattedNumber?;
    StringType '\/worker\/person\/communication\/landlines\/itemID?;
    BooleanType '\/worker\/person\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/worker\/person\/communication\/mobiles?;
    StringCodeListType '\/worker\/person\/communication\/mobiles\/nameCode?;
    StringType '\/worker\/person\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/worker\/person\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/worker\/person\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/worker\/person\/communication\/mobiles\/countryDialing?;
    StringType '\/worker\/person\/communication\/mobiles\/areaDialing?;
    StringType '\/worker\/person\/communication\/mobiles\/dialNumber?;
    StringType '\/worker\/person\/communication\/mobiles\/extension?;
    StringType '\/worker\/person\/communication\/mobiles\/access?;
    StringType '\/worker\/person\/communication\/mobiles\/formattedNumber?;
    StringType '\/worker\/person\/communication\/mobiles\/itemID?;
    BooleanType '\/worker\/person\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/worker\/person\/communication\/emails?;
    StringCodeListType '\/worker\/person\/communication\/emails\/nameCode?;
    StringType '\/worker\/person\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/worker\/person\/communication\/emails\/nameCode\/shortName?;
    StringType '\/worker\/person\/communication\/emails\/nameCode\/longName?;
    StringType '\/worker\/person\/communication\/emails\/emailUri?;
    StringType '\/worker\/person\/communication\/emails\/itemID?;
    BooleanType '\/worker\/person\/communication\/emails\/notificationIndicator?;
    ArrayType '\/worker\/person\/communication\/socialNetworks?;
    StringCodeListType '\/worker\/person\/communication\/socialNetworks\/nameCode?;
    StringType '\/worker\/person\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/worker\/person\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/worker\/person\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/worker\/person\/communication\/socialNetworks\/uri?;
    StringType '\/worker\/person\/communication\/socialNetworks\/itemID?;
    BooleanType '\/worker\/person\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/worker\/person\/communication\/faxes?;
    StringCodeListType '\/worker\/person\/communication\/faxes\/nameCode?;
    StringType '\/worker\/person\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/worker\/person\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/worker\/person\/communication\/faxes\/nameCode\/longName?;
    StringType '\/worker\/person\/communication\/faxes\/countryDialing?;
    StringType '\/worker\/person\/communication\/faxes\/areaDialing?;
    StringType '\/worker\/person\/communication\/faxes\/dialNumber?;
    StringType '\/worker\/person\/communication\/faxes\/extension?;
    StringType '\/worker\/person\/communication\/faxes\/access?;
    StringType '\/worker\/person\/communication\/faxes\/formattedNumber?;
    StringType '\/worker\/person\/communication\/faxes\/itemID?;
    BooleanType '\/worker\/person\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/worker\/person\/communication\/pagers?;
    StringCodeListType '\/worker\/person\/communication\/pagers\/nameCode?;
    StringType '\/worker\/person\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/worker\/person\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/worker\/person\/communication\/pagers\/nameCode\/longName?;
    StringType '\/worker\/person\/communication\/pagers\/countryDialing?;
    StringType '\/worker\/person\/communication\/pagers\/areaDialing?;
    StringType '\/worker\/person\/communication\/pagers\/dialNumber?;
    StringType '\/worker\/person\/communication\/pagers\/extension?;
    StringType '\/worker\/person\/communication\/pagers\/access?;
    StringType '\/worker\/person\/communication\/pagers\/formattedNumber?;
    StringType '\/worker\/person\/communication\/pagers\/itemID?;
    BooleanType '\/worker\/person\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/worker\/person\/communication\/internetAddresses?;
    StringCodeListType '\/worker\/person\/communication\/internetAddresses\/nameCode?;
    StringType '\/worker\/person\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/worker\/person\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/worker\/person\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/worker\/person\/communication\/internetAddresses\/uri?;
    StringType '\/worker\/person\/communication\/internetAddresses\/itemID?;
    ArrayType '\/worker\/person\/communication\/instantMessages?;
    StringCodeListType '\/worker\/person\/communication\/instantMessages\/nameCode?;
    StringType '\/worker\/person\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/worker\/person\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/worker\/person\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/worker\/person\/communication\/instantMessages\/uri?;
    StringType '\/worker\/person\/communication\/instantMessages\/itemID?;
    BooleanType '\/worker\/person\/communication\/instantMessages\/notificationIndicator?;
    StringType '\/worker\/person\/birthDate?;
    BooleanType '\/worker\/person\/deceasedIndicator?;
    StringType '\/worker\/person\/deathDate?;
    StringCodeListType '\/worker\/person\/genderCode?;
    StringType '\/worker\/person\/genderCode\/codeValue?;
    StringType '\/worker\/person\/genderCode\/shortName?;
    StringType '\/worker\/person\/genderCode\/longName?;
    StringCodeListType '\/worker\/person\/genderIdentityCode?;
    StringType '\/worker\/person\/genderIdentityCode\/codeValue?;
    StringType '\/worker\/person\/genderIdentityCode\/shortName?;
    StringType '\/worker\/person\/genderIdentityCode\/longName?;
    StringCodeListType '\/worker\/person\/sexualOrientationCode?;
    StringType '\/worker\/person\/sexualOrientationCode\/codeValue?;
    StringType '\/worker\/person\/sexualOrientationCode\/shortName?;
    StringType '\/worker\/person\/sexualOrientationCode\/longName?;
    StringCodeListType '\/worker\/person\/religionCode?;
    StringType '\/worker\/person\/religionCode\/codeValue?;
    StringType '\/worker\/person\/religionCode\/shortName?;
    StringType '\/worker\/person\/religionCode\/longName?;
    StringCodeListType '\/worker\/person\/maritalStatusCode?;
    StringType '\/worker\/person\/maritalStatusCode\/codeValue?;
    StringType '\/worker\/person\/maritalStatusCode\/shortName?;
    StringType '\/worker\/person\/maritalStatusCode\/longName?;
    StringType '\/worker\/person\/maritalStatusCode\/effectiveDate?;
    ArrayType '\/worker\/person\/socialInsurancePrograms?;
    StringCodeListType '\/worker\/person\/socialInsurancePrograms\/nameCode?;
    StringType '\/worker\/person\/socialInsurancePrograms\/nameCode\/codeValue?;
    StringType '\/worker\/person\/socialInsurancePrograms\/nameCode\/shortName?;
    StringType '\/worker\/person\/socialInsurancePrograms\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/socialInsurancePrograms\/countryCode?;
    BooleanType '\/worker\/person\/socialInsurancePrograms\/coveredIndicator?;
    ObjectType '\/worker\/person\/socialInsurancePrograms\/coveragePeriod?;
    StringType '\/worker\/person\/socialInsurancePrograms\/coveragePeriod\/startDate?;
    StringType '\/worker\/person\/socialInsurancePrograms\/coveragePeriod\/endDate?;
    StringType '\/worker\/person\/socialInsurancePrograms\/itemID?;
    BooleanType '\/worker\/person\/tobaccoUserIndicator?;
    BooleanType '\/worker\/person\/disabilityIdentificationDeclinedIndicator?;
    BooleanType '\/worker\/person\/disabledIndicator?;
    StringCodeListType '\/worker\/person\/disabilityTypeCodes?;
    StringType '\/worker\/person\/disabilityTypeCodes\/codeValue?;
    StringType '\/worker\/person\/disabilityTypeCodes\/shortName?;
    StringType '\/worker\/person\/disabilityTypeCodes\/longName?;
    NumberType '\/worker\/person\/disabilityPercentage?;
    BooleanType '\/worker\/person\/studentIndicator?;
    StringCodeListType '\/worker\/person\/studentStatusCode?;
    StringType '\/worker\/person\/studentStatusCode\/codeValue?;
    StringType '\/worker\/person\/studentStatusCode\/shortName?;
    StringType '\/worker\/person\/studentStatusCode\/longName?;
    StringType '\/worker\/person\/studentStatusCode\/effectiveDate?;
    ArrayType '\/worker\/person\/identityDocuments?;
    StringType '\/worker\/person\/identityDocuments\/documentID?;
    StringCodeListType '\/worker\/person\/identityDocuments\/countryCode?;
    StringCodeListType '\/worker\/person\/identityDocuments\/typeCode?;
    StringType '\/worker\/person\/identityDocuments\/typeCode\/codeValue?;
    StringType '\/worker\/person\/identityDocuments\/typeCode\/shortName?;
    StringType '\/worker\/person\/identityDocuments\/typeCode\/longName?;
    ObjectType '\/worker\/person\/identityDocuments\/issuingParty?;
    StringCodeListType '\/worker\/person\/identityDocuments\/issuingParty\/nameCode?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/nameCode\/codeValue?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/nameCode\/shortName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/nameCode\/longName?;
    ObjectType '\/worker\/person\/identityDocuments\/issuingParty\/address?;
    StringCodeListType '\/worker\/person\/identityDocuments\/issuingParty\/address\/nameCode?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/nameCode\/codeValue?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/nameCode\/shortName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/nameCode\/longName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/attentionOfName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/careOfName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/lineOne?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/lineTwo?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/lineThree?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/cityName?;
    StringCodeListType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel1?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countryCode?;
    StringCodeListType '\/worker\/person\/identityDocuments\/issuingParty\/address\/postalCode?;
    ObjectType '\/worker\/person\/identityDocuments\/issuingParty\/address\/geoCoordinate?;
    NumberType '\/worker\/person\/identityDocuments\/issuingParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/worker\/person\/identityDocuments\/issuingParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/worker\/person\/identityDocuments\/issuingParty\/address\/scriptCode?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/scriptCode\/shortName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/scriptCode\/longName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/lineFour?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/lineFive?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/buildingNumber?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/buildingName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/blockName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/streetName?;
    StringCodeListType '\/worker\/person\/identityDocuments\/issuingParty\/address\/streetTypeCode?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/streetTypeCode\/shortName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/streetTypeCode\/longName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/unit?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/floor?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/stairCase?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/door?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/postOfficeBox?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/deliveryPoint?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/plotID?;
    StringCodeListType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel2?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    StringType '\/worker\/person\/identityDocuments\/issueDate?;
    StringType '\/worker\/person\/identityDocuments\/expirationDate?;
    StringType '\/worker\/person\/identityDocuments\/itemID?;
    ArrayType '\/worker\/person\/immigrationDocuments?;
    StringType '\/worker\/person\/immigrationDocuments\/documentID?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/countryCode?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/typeCode?;
    StringType '\/worker\/person\/immigrationDocuments\/typeCode\/codeValue?;
    StringType '\/worker\/person\/immigrationDocuments\/typeCode\/shortName?;
    StringType '\/worker\/person\/immigrationDocuments\/typeCode\/longName?;
    ObjectType '\/worker\/person\/immigrationDocuments\/issuingParty?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/issuingParty\/nameCode?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/nameCode\/codeValue?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/nameCode\/shortName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/nameCode\/longName?;
    ObjectType '\/worker\/person\/immigrationDocuments\/issuingParty\/address?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/nameCode?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/nameCode\/codeValue?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/nameCode\/shortName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/nameCode\/longName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/attentionOfName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/careOfName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/lineOne?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/lineTwo?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/lineThree?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/cityName?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel1?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countryCode?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/postalCode?;
    ObjectType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/geoCoordinate?;
    NumberType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/scriptCode?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/scriptCode\/shortName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/scriptCode\/longName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/lineFour?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/lineFive?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/buildingNumber?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/buildingName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/blockName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/streetName?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/streetTypeCode?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/streetTypeCode\/shortName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/streetTypeCode\/longName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/unit?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/floor?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/stairCase?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/door?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/postOfficeBox?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/deliveryPoint?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/plotID?;
    StringCodeListType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel2?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    StringType '\/worker\/person\/immigrationDocuments\/issueDate?;
    StringType '\/worker\/person\/immigrationDocuments\/expirationDate?;
    StringType '\/worker\/person\/immigrationDocuments\/authorizedStayDuration?;
    StringType '\/worker\/person\/immigrationDocuments\/reentryRequirementDuration?;
    StringType '\/worker\/person\/immigrationDocuments\/itemID?;
    ArrayType '\/worker\/person\/passports?;
    StringType '\/worker\/person\/passports\/documentID?;
    StringCodeListType '\/worker\/person\/passports\/countryCode?;
    StringCodeListType '\/worker\/person\/passports\/typeCode?;
    StringType '\/worker\/person\/passports\/typeCode\/codeValue?;
    StringType '\/worker\/person\/passports\/typeCode\/shortName?;
    StringType '\/worker\/person\/passports\/typeCode\/longName?;
    ObjectType '\/worker\/person\/passports\/issuingParty?;
    StringCodeListType '\/worker\/person\/passports\/issuingParty\/nameCode?;
    StringType '\/worker\/person\/passports\/issuingParty\/nameCode\/codeValue?;
    StringType '\/worker\/person\/passports\/issuingParty\/nameCode\/shortName?;
    StringType '\/worker\/person\/passports\/issuingParty\/nameCode\/longName?;
    ObjectType '\/worker\/person\/passports\/issuingParty\/address?;
    StringCodeListType '\/worker\/person\/passports\/issuingParty\/address\/nameCode?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/nameCode\/codeValue?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/nameCode\/shortName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/nameCode\/longName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/attentionOfName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/careOfName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/lineOne?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/lineTwo?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/lineThree?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/cityName?;
    StringCodeListType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel1?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/person\/passports\/issuingParty\/address\/countryCode?;
    StringCodeListType '\/worker\/person\/passports\/issuingParty\/address\/postalCode?;
    ObjectType '\/worker\/person\/passports\/issuingParty\/address\/geoCoordinate?;
    NumberType '\/worker\/person\/passports\/issuingParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/worker\/person\/passports\/issuingParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/worker\/person\/passports\/issuingParty\/address\/scriptCode?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/scriptCode\/shortName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/scriptCode\/longName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/lineFour?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/lineFive?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/buildingNumber?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/buildingName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/blockName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/streetName?;
    StringCodeListType '\/worker\/person\/passports\/issuingParty\/address\/streetTypeCode?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/streetTypeCode\/shortName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/streetTypeCode\/longName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/unit?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/floor?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/stairCase?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/door?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/postOfficeBox?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/deliveryPoint?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/plotID?;
    StringCodeListType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel2?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    StringType '\/worker\/person\/passports\/issueDate?;
    StringType '\/worker\/person\/passports\/expirationDate?;
    StringType '\/worker\/person\/passports\/itemID?;
    ArrayType '\/worker\/person\/workAuthorizationDocuments?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/documentID?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/countryCode?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/typeCode?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/typeCode\/codeValue?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/typeCode\/shortName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/typeCode\/longName?;
    ObjectType '\/worker\/person\/workAuthorizationDocuments\/issuingParty?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/nameCode?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/nameCode\/codeValue?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/nameCode\/shortName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/nameCode\/longName?;
    ObjectType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/nameCode?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/nameCode\/codeValue?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/nameCode\/shortName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/nameCode\/longName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/attentionOfName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/careOfName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/lineOne?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/lineTwo?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/lineThree?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/cityName?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel1?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countryCode?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/postalCode?;
    ObjectType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/geoCoordinate?;
    NumberType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/scriptCode?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/scriptCode\/shortName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/scriptCode\/longName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/lineFour?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/lineFive?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/buildingNumber?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/buildingName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/blockName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/streetName?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/streetTypeCode?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/streetTypeCode\/shortName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/streetTypeCode\/longName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/unit?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/floor?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/stairCase?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/door?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/postOfficeBox?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/deliveryPoint?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/plotID?;
    StringCodeListType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel2?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/issueDate?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/expirationDate?;
    StringType '\/worker\/person\/workAuthorizationDocuments\/itemID?;
    ObjectType '\/worker\/person\/preferredName?;
    StringType '\/worker\/person\/preferredName\/givenName?;
    StringType '\/worker\/person\/preferredName\/middleName?;
    StringType '\/worker\/person\/preferredName\/familyName1?;
    StringType '\/worker\/person\/preferredName\/familyName2?;
    StringType '\/worker\/person\/preferredName\/formattedName?;
    StringCodeListType '\/worker\/person\/preferredName\/nameCode?;
    StringType '\/worker\/person\/preferredName\/nameCode\/codeValue?;
    StringType '\/worker\/person\/preferredName\/nameCode\/shortName?;
    StringType '\/worker\/person\/preferredName\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/preferredName\/scriptCode?;
    StringType '\/worker\/person\/preferredName\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/preferredName\/scriptCode\/shortName?;
    StringType '\/worker\/person\/preferredName\/scriptCode\/longName?;
    ArrayType '\/worker\/person\/preferredName\/preferredSalutations?;
    StringCodeListType '\/worker\/person\/preferredName\/preferredSalutations\/salutationCode?;
    StringType '\/worker\/person\/preferredName\/preferredSalutations\/salutationCode\/codeValue?;
    StringType '\/worker\/person\/preferredName\/preferredSalutations\/salutationCode\/shortName?;
    StringType '\/worker\/person\/preferredName\/preferredSalutations\/salutationCode\/longName?;
    StringCodeListType '\/worker\/person\/preferredName\/preferredSalutations\/typeCode?;
    StringType '\/worker\/person\/preferredName\/preferredSalutations\/typeCode\/codeValue?;
    StringType '\/worker\/person\/preferredName\/preferredSalutations\/typeCode\/shortName?;
    StringType '\/worker\/person\/preferredName\/preferredSalutations\/typeCode\/longName?;
    NumberType '\/worker\/person\/preferredName\/preferredSalutations\/sequenceNumber?;
    ArrayType '\/worker\/person\/preferredName\/titlePrefixCodes?;
    StringCodeListType '\/worker\/person\/preferredName\/titlePrefixCodes\/affixCode?;
    StringType '\/worker\/person\/preferredName\/titlePrefixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/preferredName\/titlePrefixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/preferredName\/titlePrefixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/preferredName\/titlePrefixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/preferredName\/nickName?;
    StringCodeListType '\/worker\/person\/preferredName\/generationAffixCode?;
    StringType '\/worker\/person\/preferredName\/generationAffixCode\/codeValue?;
    StringType '\/worker\/person\/preferredName\/generationAffixCode\/shortName?;
    StringType '\/worker\/person\/preferredName\/generationAffixCode\/longName?;
    StringCodeListType '\/worker\/person\/preferredName\/qualificationAffixCode?;
    StringType '\/worker\/person\/preferredName\/qualificationAffixCode\/codeValue?;
    StringType '\/worker\/person\/preferredName\/qualificationAffixCode\/shortName?;
    StringType '\/worker\/person\/preferredName\/qualificationAffixCode\/longName?;
    ArrayType '\/worker\/person\/preferredName\/titleAffixCodes?;
    StringCodeListType '\/worker\/person\/preferredName\/titleAffixCodes\/affixCode?;
    StringType '\/worker\/person\/preferredName\/titleAffixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/preferredName\/titleAffixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/preferredName\/titleAffixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/preferredName\/titleAffixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/preferredName\/familyName1Prefix?;
    StringType '\/worker\/person\/preferredName\/familyName2Prefix?;
    StringType '\/worker\/person\/preferredName\/initials?;
    ArrayType '\/worker\/person\/alternatePreferredNames?;
    StringType '\/worker\/person\/alternatePreferredNames\/givenName?;
    StringType '\/worker\/person\/alternatePreferredNames\/middleName?;
    StringType '\/worker\/person\/alternatePreferredNames\/familyName1?;
    StringType '\/worker\/person\/alternatePreferredNames\/familyName2?;
    StringType '\/worker\/person\/alternatePreferredNames\/formattedName?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/nameCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/nameCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/nameCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/scriptCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/scriptCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/scriptCode\/longName?;
    ArrayType '\/worker\/person\/alternatePreferredNames\/preferredSalutations?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/salutationCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/salutationCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/salutationCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/salutationCode\/longName?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/typeCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/typeCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/typeCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/typeCode\/longName?;
    NumberType '\/worker\/person\/alternatePreferredNames\/preferredSalutations\/sequenceNumber?;
    ArrayType '\/worker\/person\/alternatePreferredNames\/titlePrefixCodes?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/titlePrefixCodes\/affixCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/titlePrefixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/titlePrefixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/titlePrefixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/alternatePreferredNames\/titlePrefixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/alternatePreferredNames\/nickName?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/generationAffixCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/generationAffixCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/generationAffixCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/generationAffixCode\/longName?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/qualificationAffixCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/qualificationAffixCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/qualificationAffixCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/qualificationAffixCode\/longName?;
    ArrayType '\/worker\/person\/alternatePreferredNames\/titleAffixCodes?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/titleAffixCodes\/affixCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/titleAffixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/titleAffixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/titleAffixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/alternatePreferredNames\/titleAffixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/alternatePreferredNames\/familyName1Prefix?;
    StringType '\/worker\/person\/alternatePreferredNames\/familyName2Prefix?;
    StringType '\/worker\/person\/alternatePreferredNames\/initials?;
    StringType '\/worker\/person\/alternatePreferredNames\/itemID?;
    StringCodeListType '\/worker\/person\/alternatePreferredNames\/languageCode?;
    StringType '\/worker\/person\/alternatePreferredNames\/languageCode\/codeValue?;
    StringType '\/worker\/person\/alternatePreferredNames\/languageCode\/shortName?;
    StringType '\/worker\/person\/alternatePreferredNames\/languageCode\/longName?;
    ArrayType '\/worker\/person\/formerNames?;
    StringType '\/worker\/person\/formerNames\/givenName?;
    StringType '\/worker\/person\/formerNames\/middleName?;
    StringType '\/worker\/person\/formerNames\/familyName1?;
    StringType '\/worker\/person\/formerNames\/familyName2?;
    StringType '\/worker\/person\/formerNames\/formattedName?;
    StringCodeListType '\/worker\/person\/formerNames\/nameCode?;
    StringType '\/worker\/person\/formerNames\/nameCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/nameCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/formerNames\/scriptCode?;
    StringType '\/worker\/person\/formerNames\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/scriptCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/scriptCode\/longName?;
    ArrayType '\/worker\/person\/formerNames\/preferredSalutations?;
    StringCodeListType '\/worker\/person\/formerNames\/preferredSalutations\/salutationCode?;
    StringType '\/worker\/person\/formerNames\/preferredSalutations\/salutationCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/preferredSalutations\/salutationCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/preferredSalutations\/salutationCode\/longName?;
    StringCodeListType '\/worker\/person\/formerNames\/preferredSalutations\/typeCode?;
    StringType '\/worker\/person\/formerNames\/preferredSalutations\/typeCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/preferredSalutations\/typeCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/preferredSalutations\/typeCode\/longName?;
    NumberType '\/worker\/person\/formerNames\/preferredSalutations\/sequenceNumber?;
    ArrayType '\/worker\/person\/formerNames\/titlePrefixCodes?;
    StringCodeListType '\/worker\/person\/formerNames\/titlePrefixCodes\/affixCode?;
    StringType '\/worker\/person\/formerNames\/titlePrefixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/titlePrefixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/titlePrefixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/formerNames\/titlePrefixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/formerNames\/nickName?;
    StringCodeListType '\/worker\/person\/formerNames\/generationAffixCode?;
    StringType '\/worker\/person\/formerNames\/generationAffixCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/generationAffixCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/generationAffixCode\/longName?;
    StringCodeListType '\/worker\/person\/formerNames\/qualificationAffixCode?;
    StringType '\/worker\/person\/formerNames\/qualificationAffixCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/qualificationAffixCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/qualificationAffixCode\/longName?;
    ArrayType '\/worker\/person\/formerNames\/titleAffixCodes?;
    StringCodeListType '\/worker\/person\/formerNames\/titleAffixCodes\/affixCode?;
    StringType '\/worker\/person\/formerNames\/titleAffixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/titleAffixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/titleAffixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/formerNames\/titleAffixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/formerNames\/familyName1Prefix?;
    StringType '\/worker\/person\/formerNames\/familyName2Prefix?;
    StringType '\/worker\/person\/formerNames\/initials?;
    StringType '\/worker\/person\/formerNames\/itemID?;
    StringCodeListType '\/worker\/person\/formerNames\/typeCode?;
    StringType '\/worker\/person\/formerNames\/typeCode\/codeValue?;
    StringType '\/worker\/person\/formerNames\/typeCode\/shortName?;
    StringType '\/worker\/person\/formerNames\/typeCode\/longName?;
    ObjectType '\/worker\/person\/birthName?;
    StringType '\/worker\/person\/birthName\/givenName?;
    StringType '\/worker\/person\/birthName\/middleName?;
    StringType '\/worker\/person\/birthName\/familyName1?;
    StringType '\/worker\/person\/birthName\/familyName2?;
    StringType '\/worker\/person\/birthName\/formattedName?;
    StringCodeListType '\/worker\/person\/birthName\/nameCode?;
    StringType '\/worker\/person\/birthName\/nameCode\/codeValue?;
    StringType '\/worker\/person\/birthName\/nameCode\/shortName?;
    StringType '\/worker\/person\/birthName\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/birthName\/scriptCode?;
    StringType '\/worker\/person\/birthName\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/birthName\/scriptCode\/shortName?;
    StringType '\/worker\/person\/birthName\/scriptCode\/longName?;
    ArrayType '\/worker\/person\/birthName\/preferredSalutations?;
    StringCodeListType '\/worker\/person\/birthName\/preferredSalutations\/salutationCode?;
    StringType '\/worker\/person\/birthName\/preferredSalutations\/salutationCode\/codeValue?;
    StringType '\/worker\/person\/birthName\/preferredSalutations\/salutationCode\/shortName?;
    StringType '\/worker\/person\/birthName\/preferredSalutations\/salutationCode\/longName?;
    StringCodeListType '\/worker\/person\/birthName\/preferredSalutations\/typeCode?;
    StringType '\/worker\/person\/birthName\/preferredSalutations\/typeCode\/codeValue?;
    StringType '\/worker\/person\/birthName\/preferredSalutations\/typeCode\/shortName?;
    StringType '\/worker\/person\/birthName\/preferredSalutations\/typeCode\/longName?;
    NumberType '\/worker\/person\/birthName\/preferredSalutations\/sequenceNumber?;
    ArrayType '\/worker\/person\/birthName\/titlePrefixCodes?;
    StringCodeListType '\/worker\/person\/birthName\/titlePrefixCodes\/affixCode?;
    StringType '\/worker\/person\/birthName\/titlePrefixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/birthName\/titlePrefixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/birthName\/titlePrefixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/birthName\/titlePrefixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/birthName\/nickName?;
    StringCodeListType '\/worker\/person\/birthName\/generationAffixCode?;
    StringType '\/worker\/person\/birthName\/generationAffixCode\/codeValue?;
    StringType '\/worker\/person\/birthName\/generationAffixCode\/shortName?;
    StringType '\/worker\/person\/birthName\/generationAffixCode\/longName?;
    StringCodeListType '\/worker\/person\/birthName\/qualificationAffixCode?;
    StringType '\/worker\/person\/birthName\/qualificationAffixCode\/codeValue?;
    StringType '\/worker\/person\/birthName\/qualificationAffixCode\/shortName?;
    StringType '\/worker\/person\/birthName\/qualificationAffixCode\/longName?;
    ArrayType '\/worker\/person\/birthName\/titleAffixCodes?;
    StringCodeListType '\/worker\/person\/birthName\/titleAffixCodes\/affixCode?;
    StringType '\/worker\/person\/birthName\/titleAffixCodes\/affixCode\/codeValue?;
    StringType '\/worker\/person\/birthName\/titleAffixCodes\/affixCode\/shortName?;
    StringType '\/worker\/person\/birthName\/titleAffixCodes\/affixCode\/longName?;
    NumberType '\/worker\/person\/birthName\/titleAffixCodes\/sequenceNumber?;
    StringType '\/worker\/person\/birthName\/familyName1Prefix?;
    StringType '\/worker\/person\/birthName\/familyName2Prefix?;
    StringType '\/worker\/person\/birthName\/initials?;
    ObjectType '\/worker\/person\/birthPlace?;
    StringType '\/worker\/person\/birthPlace\/cityName?;
    StringCodeListType '\/worker\/person\/birthPlace\/countrySubdivisionLevel1?;
    StringType '\/worker\/person\/birthPlace\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/person\/birthPlace\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/person\/birthPlace\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/person\/birthPlace\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/person\/birthPlace\/countrySubdivisionLevel2?;
    StringType '\/worker\/person\/birthPlace\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/person\/birthPlace\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/person\/birthPlace\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/person\/birthPlace\/countrySubdivisionLevel2\/subdivisionType?;
    StringCodeListType '\/worker\/person\/birthPlace\/postalCode?;
    StringCodeListType '\/worker\/person\/birthPlace\/countryCode?;
    StringType '\/worker\/person\/birthPlace\/formattedBirthPlace?;
    ArrayType '\/worker\/person\/otherPersonalAddresses?;
    StringCodeListType '\/worker\/person\/otherPersonalAddresses\/nameCode?;
    StringType '\/worker\/person\/otherPersonalAddresses\/nameCode\/codeValue?;
    StringType '\/worker\/person\/otherPersonalAddresses\/nameCode\/shortName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/nameCode\/longName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/attentionOfName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/careOfName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/lineOne?;
    StringType '\/worker\/person\/otherPersonalAddresses\/lineTwo?;
    StringType '\/worker\/person\/otherPersonalAddresses\/lineThree?;
    StringType '\/worker\/person\/otherPersonalAddresses\/cityName?;
    StringCodeListType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel1?;
    StringType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/person\/otherPersonalAddresses\/countryCode?;
    StringCodeListType '\/worker\/person\/otherPersonalAddresses\/postalCode?;
    ObjectType '\/worker\/person\/otherPersonalAddresses\/geoCoordinate?;
    NumberType '\/worker\/person\/otherPersonalAddresses\/geoCoordinate\/latitude?;
    NumberType '\/worker\/person\/otherPersonalAddresses\/geoCoordinate\/longitude?;
    StringCodeListType '\/worker\/person\/otherPersonalAddresses\/scriptCode?;
    StringType '\/worker\/person\/otherPersonalAddresses\/scriptCode\/codeValue?;
    StringType '\/worker\/person\/otherPersonalAddresses\/scriptCode\/shortName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/scriptCode\/longName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/lineFour?;
    StringType '\/worker\/person\/otherPersonalAddresses\/lineFive?;
    StringType '\/worker\/person\/otherPersonalAddresses\/buildingNumber?;
    StringType '\/worker\/person\/otherPersonalAddresses\/buildingName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/blockName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/streetName?;
    StringCodeListType '\/worker\/person\/otherPersonalAddresses\/streetTypeCode?;
    StringType '\/worker\/person\/otherPersonalAddresses\/streetTypeCode\/codeValue?;
    StringType '\/worker\/person\/otherPersonalAddresses\/streetTypeCode\/shortName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/streetTypeCode\/longName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/unit?;
    StringType '\/worker\/person\/otherPersonalAddresses\/floor?;
    StringType '\/worker\/person\/otherPersonalAddresses\/stairCase?;
    StringType '\/worker\/person\/otherPersonalAddresses\/door?;
    StringType '\/worker\/person\/otherPersonalAddresses\/postOfficeBox?;
    StringType '\/worker\/person\/otherPersonalAddresses\/deliveryPoint?;
    StringType '\/worker\/person\/otherPersonalAddresses\/plotID?;
    StringCodeListType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel2?;
    StringType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/countrySubdivisionLevel2\/subdivisionType?;
    BooleanSameAsAddressIndicatorType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressIndicator?;
    ObjectType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/href?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/rel?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/canonicalUri?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/title?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/targetSchema?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/mediaType?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/method?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/encType?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/schema?;
    ArrayType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/payLoadArguments?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/payLoadArguments\/argumentPath?;
    StringType '\/worker\/person\/otherPersonalAddresses\/sameAsAddressLink\/payLoadArguments\/argumentValue?;
    StringType '\/worker\/person\/otherPersonalAddresses\/itemID?;
    StringCodeListType '\/worker\/person\/otherPersonalAddresses\/typeCode?;
    StringType '\/worker\/person\/otherPersonalAddresses\/typeCode\/codeValue?;
    StringType '\/worker\/person\/otherPersonalAddresses\/typeCode\/shortName?;
    StringType '\/worker\/person\/otherPersonalAddresses\/typeCode\/longName?;
    StringCodeListType '\/worker\/person\/ethnicityCode?;
    StringType '\/worker\/person\/ethnicityCode\/codeValue?;
    StringType '\/worker\/person\/ethnicityCode\/shortName?;
    StringType '\/worker\/person\/ethnicityCode\/longName?;
    StringCodeListType '\/worker\/person\/ethnicityGroupCode?;
    StringType '\/worker\/person\/ethnicityGroupCode\/codeValue?;
    StringType '\/worker\/person\/ethnicityGroupCode\/shortName?;
    StringType '\/worker\/person\/ethnicityGroupCode\/longName?;
    StringCodeListType '\/worker\/person\/raceCode?;
    StringType '\/worker\/person\/raceCode\/codeValue?;
    StringType '\/worker\/person\/raceCode\/shortName?;
    StringType '\/worker\/person\/raceCode\/longName?;
    StringCodeListType '\/worker\/person\/raceCode\/identificationMethodCode?;
    StringType '\/worker\/person\/raceCode\/identificationMethodCode\/codeValue?;
    StringType '\/worker\/person\/raceCode\/identificationMethodCode\/shortName?;
    StringType '\/worker\/person\/raceCode\/identificationMethodCode\/longName?;
    StringCodeListType '\/worker\/person\/citizenshipCountryCodes?;
    StringType '\/worker\/person\/citizenshipCountryCodes\/codeValue?;
    StringType '\/worker\/person\/citizenshipCountryCodes\/shortName?;
    StringType '\/worker\/person\/citizenshipCountryCodes\/longName?;
    StringCodeListType '\/worker\/person\/residencyCountryCodes?;
    StringType '\/worker\/person\/residencyCountryCodes\/codeValue?;
    StringType '\/worker\/person\/residencyCountryCodes\/shortName?;
    StringType '\/worker\/person\/residencyCountryCodes\/longName?;
    StringCodeListType '\/worker\/person\/highestEducationLevelCode?;
    StringType '\/worker\/person\/highestEducationLevelCode\/codeValue?;
    StringType '\/worker\/person\/highestEducationLevelCode\/shortName?;
    StringType '\/worker\/person\/highestEducationLevelCode\/longName?;
    StringCodeListType '\/worker\/person\/militaryStatusCode?;
    StringType '\/worker\/person\/militaryStatusCode\/codeValue?;
    StringType '\/worker\/person\/militaryStatusCode\/shortName?;
    StringType '\/worker\/person\/militaryStatusCode\/longName?;
    StringType '\/worker\/person\/militaryStatusCode\/effectiveDate?;
    StringType '\/worker\/person\/militaryDischargeDate?;
    StringCodeListType '\/worker\/person\/militaryClassificationCodes?;
    StringType '\/worker\/person\/militaryClassificationCodes\/codeValue?;
    StringType '\/worker\/person\/militaryClassificationCodes\/shortName?;
    StringType '\/worker\/person\/militaryClassificationCodes\/longName?;
    ObjectType '\/worker\/person\/customFieldGroup?;
    ArrayType '\/worker\/person\/customFieldGroup\/amountFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/amountFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/amountFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/amountFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/amountFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/amountFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/amountFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/amountFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/amountFields\/categoryCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/person\/customFieldGroup\/amountFields\/amountValue?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/amountFields\/currencyCode?;
    StringType '\/worker\/person\/customFieldGroup\/amountFields\/itemID?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/codeFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/codeFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/codeFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/categoryCode\/longName?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/longName?;
    StringType '\/worker\/person\/customFieldGroup\/codeFields\/itemID?;
    ArrayType '\/worker\/person\/customFieldGroup\/dateFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/dateFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/dateFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/dateFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/dateFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/dateFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/dateFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/dateFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/dateFields\/categoryCode\/longName?;
    StringType '\/worker\/person\/customFieldGroup\/dateFields\/dateValue?;
    StringType '\/worker\/person\/customFieldGroup\/dateFields\/itemID?;
    ArrayType '\/worker\/person\/customFieldGroup\/dateTimeFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/dateTimeFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/dateTimeFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/dateTimeFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/dateTimeFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/dateTimeFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/dateTimeFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/dateTimeFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/dateTimeFields\/categoryCode\/longName?;
    StringType '\/worker\/person\/customFieldGroup\/dateTimeFields\/dateTimeValue?;
    StringType '\/worker\/person\/customFieldGroup\/dateTimeFields\/itemID?;
    ArrayType '\/worker\/person\/customFieldGroup\/indicatorFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/indicatorFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/indicatorFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/indicatorFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/indicatorFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/indicatorFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/indicatorFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/indicatorFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/indicatorFields\/categoryCode\/longName?;
    BooleanType '\/worker\/person\/customFieldGroup\/indicatorFields\/indicatorValue?;
    StringType '\/worker\/person\/customFieldGroup\/indicatorFields\/itemID?;
    ArrayType '\/worker\/person\/customFieldGroup\/numberFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/numberFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/numberFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/numberFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/numberFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/numberFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/numberFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/numberFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/numberFields\/categoryCode\/longName?;
    NumberType '\/worker\/person\/customFieldGroup\/numberFields\/numberValue?;
    StringType '\/worker\/person\/customFieldGroup\/numberFields\/itemID?;
    ArrayType '\/worker\/person\/customFieldGroup\/percentFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/percentFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/percentFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/percentFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/percentFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/percentFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/percentFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/percentFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/percentFields\/categoryCode\/longName?;
    NumberType '\/worker\/person\/customFieldGroup\/percentFields\/percentValue?;
    StringType '\/worker\/person\/customFieldGroup\/percentFields\/itemID?;
    ArrayType '\/worker\/person\/customFieldGroup\/stringFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/stringFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/stringFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/stringFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/stringFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/stringFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/stringFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/stringFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/stringFields\/categoryCode\/longName?;
    StringType '\/worker\/person\/customFieldGroup\/stringFields\/stringValue?;
    StringType '\/worker\/person\/customFieldGroup\/stringFields\/itemID?;
    ArrayType '\/worker\/person\/customFieldGroup\/telephoneFields?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/telephoneFields\/nameCode?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/nameCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/nameCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/person\/customFieldGroup\/telephoneFields\/categoryCode?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/categoryCode\/codeValue?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/categoryCode\/shortName?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/categoryCode\/longName?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/countryDialing?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/areaDialing?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/dialNumber?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/extension?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/access?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/formattedNumber?;
    StringType '\/worker\/person\/customFieldGroup\/telephoneFields\/itemID?;
    ArrayType '\/worker\/person\/customFieldGroup\/links?;
    StringType '\/worker\/person\/customFieldGroup\/links\/href?;
    StringType '\/worker\/person\/customFieldGroup\/links\/rel?;
    StringType '\/worker\/person\/customFieldGroup\/links\/canonicalUri?;
    StringType '\/worker\/person\/customFieldGroup\/links\/title?;
    StringType '\/worker\/person\/customFieldGroup\/links\/targetSchema?;
    StringType '\/worker\/person\/customFieldGroup\/links\/mediaType?;
    StringType '\/worker\/person\/customFieldGroup\/links\/method?;
    StringType '\/worker\/person\/customFieldGroup\/links\/encType?;
    StringType '\/worker\/person\/customFieldGroup\/links\/schema?;
    ArrayType '\/worker\/person\/customFieldGroup\/links\/payLoadArguments?;
    StringType '\/worker\/person\/customFieldGroup\/links\/payLoadArguments\/argumentPath?;
    StringType '\/worker\/person\/customFieldGroup\/links\/payLoadArguments\/argumentValue?;
    ArrayType '\/worker\/person\/links?;
    StringType '\/worker\/person\/links\/href?;
    StringType '\/worker\/person\/links\/rel?;
    StringType '\/worker\/person\/links\/canonicalUri?;
    StringType '\/worker\/person\/links\/title?;
    StringType '\/worker\/person\/links\/targetSchema?;
    StringType '\/worker\/person\/links\/mediaType?;
    StringType '\/worker\/person\/links\/method?;
    StringType '\/worker\/person\/links\/encType?;
    StringType '\/worker\/person\/links\/schema?;
    ArrayType '\/worker\/person\/links\/payLoadArguments?;
    StringType '\/worker\/person\/links\/payLoadArguments\/argumentPath?;
    StringType '\/worker\/person\/links\/payLoadArguments\/argumentValue?;
    ObjectType '\/worker\/workerDates?;
    StringType '\/worker\/workerDates\/originalHireDate?;
    StringType '\/worker\/workerDates\/rehireDate?;
    StringType '\/worker\/workerDates\/adjustedServiceDate?;
    StringType '\/worker\/workerDates\/acquisitionDate?;
    StringType '\/worker\/workerDates\/retirementDate?;
    StringType '\/worker\/workerDates\/terminationDate?;
    StringType '\/worker\/workerDates\/expectedTerminationDate?;
    ObjectType '\/worker\/workerStatus?;
    StringCodeListType '\/worker\/workerStatus\/statusCode?;
    StringType '\/worker\/workerStatus\/statusCode\/codeValue?;
    StringType '\/worker\/workerStatus\/statusCode\/shortName?;
    StringType '\/worker\/workerStatus\/statusCode\/longName?;
    StringCodeListType '\/worker\/workerStatus\/reasonCode?;
    StringType '\/worker\/workerStatus\/reasonCode\/codeValue?;
    StringType '\/worker\/workerStatus\/reasonCode\/shortName?;
    StringType '\/worker\/workerStatus\/reasonCode\/longName?;
    StringType '\/worker\/workerStatus\/effectiveDate?;
    ObjectType '\/worker\/businessCommunication?;
    ArrayType '\/worker\/businessCommunication\/landlines?;
    StringCodeListType '\/worker\/businessCommunication\/landlines\/nameCode?;
    StringType '\/worker\/businessCommunication\/landlines\/nameCode\/codeValue?;
    StringType '\/worker\/businessCommunication\/landlines\/nameCode\/shortName?;
    StringType '\/worker\/businessCommunication\/landlines\/nameCode\/longName?;
    StringType '\/worker\/businessCommunication\/landlines\/countryDialing?;
    StringType '\/worker\/businessCommunication\/landlines\/areaDialing?;
    StringType '\/worker\/businessCommunication\/landlines\/dialNumber?;
    StringType '\/worker\/businessCommunication\/landlines\/extension?;
    StringType '\/worker\/businessCommunication\/landlines\/access?;
    StringType '\/worker\/businessCommunication\/landlines\/formattedNumber?;
    StringType '\/worker\/businessCommunication\/landlines\/itemID?;
    BooleanType '\/worker\/businessCommunication\/landlines\/notificationIndicator?;
    ArrayType '\/worker\/businessCommunication\/mobiles?;
    StringCodeListType '\/worker\/businessCommunication\/mobiles\/nameCode?;
    StringType '\/worker\/businessCommunication\/mobiles\/nameCode\/codeValue?;
    StringType '\/worker\/businessCommunication\/mobiles\/nameCode\/shortName?;
    StringType '\/worker\/businessCommunication\/mobiles\/nameCode\/longName?;
    StringType '\/worker\/businessCommunication\/mobiles\/countryDialing?;
    StringType '\/worker\/businessCommunication\/mobiles\/areaDialing?;
    StringType '\/worker\/businessCommunication\/mobiles\/dialNumber?;
    StringType '\/worker\/businessCommunication\/mobiles\/extension?;
    StringType '\/worker\/businessCommunication\/mobiles\/access?;
    StringType '\/worker\/businessCommunication\/mobiles\/formattedNumber?;
    StringType '\/worker\/businessCommunication\/mobiles\/itemID?;
    BooleanType '\/worker\/businessCommunication\/mobiles\/notificationIndicator?;
    ArrayType '\/worker\/businessCommunication\/emails?;
    StringCodeListType '\/worker\/businessCommunication\/emails\/nameCode?;
    StringType '\/worker\/businessCommunication\/emails\/nameCode\/codeValue?;
    StringType '\/worker\/businessCommunication\/emails\/nameCode\/shortName?;
    StringType '\/worker\/businessCommunication\/emails\/nameCode\/longName?;
    StringType '\/worker\/businessCommunication\/emails\/emailUri?;
    StringType '\/worker\/businessCommunication\/emails\/itemID?;
    BooleanType '\/worker\/businessCommunication\/emails\/notificationIndicator?;
    ArrayType '\/worker\/businessCommunication\/socialNetworks?;
    StringCodeListType '\/worker\/businessCommunication\/socialNetworks\/nameCode?;
    StringType '\/worker\/businessCommunication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/worker\/businessCommunication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/worker\/businessCommunication\/socialNetworks\/nameCode\/longName?;
    StringType '\/worker\/businessCommunication\/socialNetworks\/uri?;
    StringType '\/worker\/businessCommunication\/socialNetworks\/itemID?;
    BooleanType '\/worker\/businessCommunication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/worker\/businessCommunication\/faxes?;
    StringCodeListType '\/worker\/businessCommunication\/faxes\/nameCode?;
    StringType '\/worker\/businessCommunication\/faxes\/nameCode\/codeValue?;
    StringType '\/worker\/businessCommunication\/faxes\/nameCode\/shortName?;
    StringType '\/worker\/businessCommunication\/faxes\/nameCode\/longName?;
    StringType '\/worker\/businessCommunication\/faxes\/countryDialing?;
    StringType '\/worker\/businessCommunication\/faxes\/areaDialing?;
    StringType '\/worker\/businessCommunication\/faxes\/dialNumber?;
    StringType '\/worker\/businessCommunication\/faxes\/extension?;
    StringType '\/worker\/businessCommunication\/faxes\/access?;
    StringType '\/worker\/businessCommunication\/faxes\/formattedNumber?;
    StringType '\/worker\/businessCommunication\/faxes\/itemID?;
    BooleanType '\/worker\/businessCommunication\/faxes\/notificationIndicator?;
    ArrayType '\/worker\/businessCommunication\/pagers?;
    StringCodeListType '\/worker\/businessCommunication\/pagers\/nameCode?;
    StringType '\/worker\/businessCommunication\/pagers\/nameCode\/codeValue?;
    StringType '\/worker\/businessCommunication\/pagers\/nameCode\/shortName?;
    StringType '\/worker\/businessCommunication\/pagers\/nameCode\/longName?;
    StringType '\/worker\/businessCommunication\/pagers\/countryDialing?;
    StringType '\/worker\/businessCommunication\/pagers\/areaDialing?;
    StringType '\/worker\/businessCommunication\/pagers\/dialNumber?;
    StringType '\/worker\/businessCommunication\/pagers\/extension?;
    StringType '\/worker\/businessCommunication\/pagers\/access?;
    StringType '\/worker\/businessCommunication\/pagers\/formattedNumber?;
    StringType '\/worker\/businessCommunication\/pagers\/itemID?;
    BooleanType '\/worker\/businessCommunication\/pagers\/notificationIndicator?;
    ArrayType '\/worker\/businessCommunication\/internetAddresses?;
    StringCodeListType '\/worker\/businessCommunication\/internetAddresses\/nameCode?;
    StringType '\/worker\/businessCommunication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/worker\/businessCommunication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/worker\/businessCommunication\/internetAddresses\/nameCode\/longName?;
    StringType '\/worker\/businessCommunication\/internetAddresses\/uri?;
    StringType '\/worker\/businessCommunication\/internetAddresses\/itemID?;
    ArrayType '\/worker\/businessCommunication\/instantMessages?;
    StringCodeListType '\/worker\/businessCommunication\/instantMessages\/nameCode?;
    StringType '\/worker\/businessCommunication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/worker\/businessCommunication\/instantMessages\/nameCode\/shortName?;
    StringType '\/worker\/businessCommunication\/instantMessages\/nameCode\/longName?;
    StringType '\/worker\/businessCommunication\/instantMessages\/uri?;
    StringType '\/worker\/businessCommunication\/instantMessages\/itemID?;
    BooleanType '\/worker\/businessCommunication\/instantMessages\/notificationIndicator?;
    ObjectType '\/worker\/workAssignment?;
    BooleanType '\/worker\/workAssignment\/primaryIndicator?;
    StringType '\/worker\/workAssignment\/offerExtensionDate?;
    StringType '\/worker\/workAssignment\/offerAcceptanceDate?;
    StringType '\/worker\/workAssignment\/hireDate?;
    StringType '\/worker\/workAssignment\/seniorityDate?;
    StringType '\/worker\/workAssignment\/expectedStartDate?;
    StringType '\/worker\/workAssignment\/actualStartDate?;
    StringType '\/worker\/workAssignment\/terminationDate?;
    StringType '\/worker\/workAssignment\/expectedTerminationDate?;
    ObjectType '\/worker\/workAssignment\/assignmentStatus?;
    StringCodeListType '\/worker\/workAssignment\/assignmentStatus\/statusCode?;
    StringType '\/worker\/workAssignment\/assignmentStatus\/statusCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignmentStatus\/statusCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignmentStatus\/statusCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/assignmentStatus\/reasonCode?;
    StringType '\/worker\/workAssignment\/assignmentStatus\/reasonCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignmentStatus\/reasonCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignmentStatus\/reasonCode\/longName?;
    StringType '\/worker\/workAssignment\/assignmentStatus\/effectiveDate?;
    ArrayType '\/worker\/workAssignment\/assignmentCostCenters?;
    StringType '\/worker\/workAssignment\/assignmentCostCenters\/costCenterID?;
    StringType '\/worker\/workAssignment\/assignmentCostCenters\/costCenterName?;
    NumberType '\/worker\/workAssignment\/assignmentCostCenters\/costCenterPercentage?;
    BooleanType '\/worker\/workAssignment\/workerProbationIndicator?;
    ObjectType '\/worker\/workAssignment\/workerProbationPeriod?;
    StringType '\/worker\/workAssignment\/workerProbationPeriod\/startDate?;
    StringType '\/worker\/workAssignment\/workerProbationPeriod\/endDate?;
    StringCodeListType '\/worker\/workAssignment\/workerTypeCode?;
    StringType '\/worker\/workAssignment\/workerTypeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/workerTypeCode\/shortName?;
    StringType '\/worker\/workAssignment\/workerTypeCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/assignmentTermCode?;
    StringType '\/worker\/workAssignment\/assignmentTermCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignmentTermCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignmentTermCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/workLevelCode?;
    StringType '\/worker\/workAssignment\/workLevelCode\/codeValue?;
    StringType '\/worker\/workAssignment\/workLevelCode\/shortName?;
    StringType '\/worker\/workAssignment\/workLevelCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/nationalityContextCode?;
    StringType '\/worker\/workAssignment\/nationalityContextCode\/codeValue?;
    StringType '\/worker\/workAssignment\/nationalityContextCode\/shortName?;
    StringType '\/worker\/workAssignment\/nationalityContextCode\/longName?;
    BooleanType '\/worker\/workAssignment\/vipIndicator?;
    StringCodeListType '\/worker\/workAssignment\/vipTypeCode?;
    StringType '\/worker\/workAssignment\/vipTypeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/vipTypeCode\/shortName?;
    StringType '\/worker\/workAssignment\/vipTypeCode\/longName?;
    BooleanType '\/worker\/workAssignment\/executiveIndicator?;
    StringCodeListType '\/worker\/workAssignment\/executiveTypeCode?;
    StringType '\/worker\/workAssignment\/executiveTypeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/executiveTypeCode\/shortName?;
    StringType '\/worker\/workAssignment\/executiveTypeCode\/longName?;
    BooleanType '\/worker\/workAssignment\/officerIndicator?;
    StringCodeListType '\/worker\/workAssignment\/officerTypeCode?;
    StringType '\/worker\/workAssignment\/officerTypeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/officerTypeCode\/shortName?;
    StringType '\/worker\/workAssignment\/officerTypeCode\/longName?;
    BooleanType '\/worker\/workAssignment\/managementPositionIndicator?;
    StringType '\/worker\/workAssignment\/legalEntityID?;
    BooleanType '\/worker\/workAssignment\/highlyCompensatedIndicator?;
    StringCodeListType '\/worker\/workAssignment\/highlyCompensatedTypeCode?;
    StringType '\/worker\/workAssignment\/highlyCompensatedTypeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/highlyCompensatedTypeCode\/shortName?;
    StringType '\/worker\/workAssignment\/highlyCompensatedTypeCode\/longName?;
    BooleanType '\/worker\/workAssignment\/stockOwnerIndicator?;
    NumberType '\/worker\/workAssignment\/stockOwnerPercentage?;
    ArrayType '\/worker\/workAssignment\/workerGroups?;
    StringCodeListType '\/worker\/workAssignment\/workerGroups\/nameCode?;
    StringType '\/worker\/workAssignment\/workerGroups\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/workerGroups\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/workerGroups\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/workerGroups\/groupCode?;
    StringType '\/worker\/workAssignment\/workerGroups\/groupCode\/codeValue?;
    StringType '\/worker\/workAssignment\/workerGroups\/groupCode\/shortName?;
    StringType '\/worker\/workAssignment\/workerGroups\/groupCode\/longName?;
    StringType '\/worker\/workAssignment\/workerGroups\/itemID?;
    StringCodeListType '\/worker\/workAssignment\/jobCode?;
    StringType '\/worker\/workAssignment\/jobCode\/codeValue?;
    StringType '\/worker\/workAssignment\/jobCode\/shortName?;
    StringType '\/worker\/workAssignment\/jobCode\/longName?;
    StringType '\/worker\/workAssignment\/jobTitle?;
    ArrayType '\/worker\/workAssignment\/occupationalClassifications?;
    StringCodeListType '\/worker\/workAssignment\/occupationalClassifications\/nameCode?;
    StringType '\/worker\/workAssignment\/occupationalClassifications\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/occupationalClassifications\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/occupationalClassifications\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/occupationalClassifications\/classificationCode?;
    StringType '\/worker\/workAssignment\/occupationalClassifications\/classificationCode\/codeValue?;
    StringType '\/worker\/workAssignment\/occupationalClassifications\/classificationCode\/shortName?;
    StringType '\/worker\/workAssignment\/occupationalClassifications\/classificationCode\/longName?;
    StringType '\/worker\/workAssignment\/occupationalClassifications\/itemID?;
    ArrayType '\/worker\/workAssignment\/industryClassifications?;
    StringCodeListType '\/worker\/workAssignment\/industryClassifications\/nameCode?;
    StringType '\/worker\/workAssignment\/industryClassifications\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/industryClassifications\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/industryClassifications\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/industryClassifications\/classificationCode?;
    StringType '\/worker\/workAssignment\/industryClassifications\/classificationCode\/codeValue?;
    StringType '\/worker\/workAssignment\/industryClassifications\/classificationCode\/shortName?;
    StringType '\/worker\/workAssignment\/industryClassifications\/classificationCode\/longName?;
    StringType '\/worker\/workAssignment\/industryClassifications\/itemID?;
    ObjectType '\/worker\/workAssignment\/wageLawCoverage?;
    StringCodeListType '\/worker\/workAssignment\/wageLawCoverage\/wageLawNameCode?;
    StringType '\/worker\/workAssignment\/wageLawCoverage\/wageLawNameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/wageLawCoverage\/wageLawNameCode\/shortName?;
    StringType '\/worker\/workAssignment\/wageLawCoverage\/wageLawNameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/wageLawCoverage\/coverageCode?;
    StringType '\/worker\/workAssignment\/wageLawCoverage\/coverageCode\/codeValue?;
    StringType '\/worker\/workAssignment\/wageLawCoverage\/coverageCode\/shortName?;
    StringType '\/worker\/workAssignment\/wageLawCoverage\/coverageCode\/longName?;
    StringType '\/worker\/workAssignment\/positionID?;
    StringType '\/worker\/workAssignment\/positionTitle?;
    ObjectType '\/worker\/workAssignment\/laborUnion?;
    StringCodeListType '\/worker\/workAssignment\/laborUnion\/laborUnionCode?;
    StringType '\/worker\/workAssignment\/laborUnion\/laborUnionCode\/codeValue?;
    StringType '\/worker\/workAssignment\/laborUnion\/laborUnionCode\/shortName?;
    StringType '\/worker\/workAssignment\/laborUnion\/laborUnionCode\/longName?;
    StringType '\/worker\/workAssignment\/laborUnion\/seniorityDate?;
    ObjectType '\/worker\/workAssignment\/bargainingUnit?;
    StringCodeListType '\/worker\/workAssignment\/bargainingUnit\/bargainingUnitCode?;
    StringType '\/worker\/workAssignment\/bargainingUnit\/bargainingUnitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/bargainingUnit\/bargainingUnitCode\/shortName?;
    StringType '\/worker\/workAssignment\/bargainingUnit\/bargainingUnitCode\/longName?;
    StringType '\/worker\/workAssignment\/bargainingUnit\/seniorityDate?;
    StringCodeListType '\/worker\/workAssignment\/workShiftCode?;
    StringType '\/worker\/workAssignment\/workShiftCode\/codeValue?;
    StringType '\/worker\/workAssignment\/workShiftCode\/shortName?;
    StringType '\/worker\/workAssignment\/workShiftCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/workArrangementCode?;
    StringType '\/worker\/workAssignment\/workArrangementCode\/codeValue?;
    StringType '\/worker\/workAssignment\/workArrangementCode\/shortName?;
    StringType '\/worker\/workAssignment\/workArrangementCode\/longName?;
    ObjectType '\/worker\/workAssignment\/standardHours?;
    NumberType '\/worker\/workAssignment\/standardHours\/hoursQuantity?;
    StringCodeListType '\/worker\/workAssignment\/standardHours\/unitCode?;
    StringType '\/worker\/workAssignment\/standardHours\/unitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/standardHours\/unitCode\/shortName?;
    StringType '\/worker\/workAssignment\/standardHours\/unitCode\/longName?;
    NumberType '\/worker\/workAssignment\/fullTimeEquivalenceRatio?;
    ArrayType '\/worker\/workAssignment\/homeOrganizationalUnits?;
    StringCodeListType '\/worker\/workAssignment\/homeOrganizationalUnits\/nameCode?;
    StringType '\/worker\/workAssignment\/homeOrganizationalUnits\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeOrganizationalUnits\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeOrganizationalUnits\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/homeOrganizationalUnits\/typeCode?;
    StringType '\/worker\/workAssignment\/homeOrganizationalUnits\/typeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeOrganizationalUnits\/typeCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeOrganizationalUnits\/typeCode\/longName?;
    StringType '\/worker\/workAssignment\/homeOrganizationalUnits\/itemID?;
    ArrayType '\/worker\/workAssignment\/assignedOrganizationalUnits?;
    StringCodeListType '\/worker\/workAssignment\/assignedOrganizationalUnits\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedOrganizationalUnits\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedOrganizationalUnits\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedOrganizationalUnits\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/assignedOrganizationalUnits\/typeCode?;
    StringType '\/worker\/workAssignment\/assignedOrganizationalUnits\/typeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedOrganizationalUnits\/typeCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedOrganizationalUnits\/typeCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedOrganizationalUnits\/itemID?;
    ObjectType '\/worker\/workAssignment\/homeWorkLocation?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/nameCode\/longName?;
    ObjectType '\/worker\/workAssignment\/homeWorkLocation\/communication?;
    ArrayType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/countryDialing?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/areaDialing?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/dialNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/extension?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/access?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/formattedNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/itemID?;
    BooleanType '\/worker\/workAssignment\/homeWorkLocation\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/countryDialing?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/areaDialing?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/dialNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/extension?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/access?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/formattedNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/itemID?;
    BooleanType '\/worker\/workAssignment\/homeWorkLocation\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/homeWorkLocation\/communication\/emails?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/communication\/emails\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/emails\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/emails\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/emails\/emailUri?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/emails\/itemID?;
    BooleanType '\/worker\/workAssignment\/homeWorkLocation\/communication\/emails\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/homeWorkLocation\/communication\/socialNetworks?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/communication\/socialNetworks\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/socialNetworks\/uri?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/socialNetworks\/itemID?;
    BooleanType '\/worker\/workAssignment\/homeWorkLocation\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/countryDialing?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/areaDialing?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/dialNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/extension?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/access?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/formattedNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/itemID?;
    BooleanType '\/worker\/workAssignment\/homeWorkLocation\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/countryDialing?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/areaDialing?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/dialNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/extension?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/access?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/formattedNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/itemID?;
    BooleanType '\/worker\/workAssignment\/homeWorkLocation\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/homeWorkLocation\/communication\/internetAddresses?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/communication\/internetAddresses\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/internetAddresses\/uri?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/internetAddresses\/itemID?;
    ArrayType '\/worker\/workAssignment\/homeWorkLocation\/communication\/instantMessages?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/communication\/instantMessages\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/instantMessages\/uri?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/communication\/instantMessages\/itemID?;
    BooleanType '\/worker\/workAssignment\/homeWorkLocation\/communication\/instantMessages\/notificationIndicator?;
    ObjectType '\/worker\/workAssignment\/homeWorkLocation\/address?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/address\/nameCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/attentionOfName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/careOfName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/lineOne?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/lineTwo?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/lineThree?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/cityName?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel1?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/address\/countryCode?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/address\/postalCode?;
    ObjectType '\/worker\/workAssignment\/homeWorkLocation\/address\/geoCoordinate?;
    NumberType '\/worker\/workAssignment\/homeWorkLocation\/address\/geoCoordinate\/latitude?;
    NumberType '\/worker\/workAssignment\/homeWorkLocation\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/address\/scriptCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/scriptCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/scriptCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/scriptCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/lineFour?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/lineFive?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/buildingNumber?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/buildingName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/blockName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/streetName?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/address\/streetTypeCode?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/streetTypeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/streetTypeCode\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/streetTypeCode\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/unit?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/floor?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/stairCase?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/door?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/postOfficeBox?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/deliveryPoint?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/plotID?;
    StringCodeListType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel2?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/workAssignment\/homeWorkLocation\/address\/countrySubdivisionLevel2\/subdivisionType?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/nameCode\/longName?;
    ObjectType '\/worker\/workAssignment\/assignedWorkLocations\/communication?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/countryDialing?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/areaDialing?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/dialNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/extension?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/access?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/formattedNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/itemID?;
    BooleanType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/countryDialing?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/areaDialing?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/dialNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/extension?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/access?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/formattedNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/itemID?;
    BooleanType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/emails?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/emails\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/emails\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/emails\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/emails\/emailUri?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/emails\/itemID?;
    BooleanType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/emails\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/socialNetworks?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/socialNetworks\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/socialNetworks\/uri?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/socialNetworks\/itemID?;
    BooleanType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/countryDialing?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/areaDialing?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/dialNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/extension?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/access?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/formattedNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/itemID?;
    BooleanType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/countryDialing?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/areaDialing?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/dialNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/extension?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/access?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/formattedNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/itemID?;
    BooleanType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/internetAddresses?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/internetAddresses\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/internetAddresses\/uri?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/internetAddresses\/itemID?;
    ArrayType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/instantMessages?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/instantMessages\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/instantMessages\/uri?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/instantMessages\/itemID?;
    BooleanType '\/worker\/workAssignment\/assignedWorkLocations\/communication\/instantMessages\/notificationIndicator?;
    ObjectType '\/worker\/workAssignment\/assignedWorkLocations\/address?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/address\/nameCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/nameCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/attentionOfName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/careOfName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/lineOne?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/lineTwo?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/lineThree?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/cityName?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel1?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countryCode?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/address\/postalCode?;
    ObjectType '\/worker\/workAssignment\/assignedWorkLocations\/address\/geoCoordinate?;
    NumberType '\/worker\/workAssignment\/assignedWorkLocations\/address\/geoCoordinate\/latitude?;
    NumberType '\/worker\/workAssignment\/assignedWorkLocations\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/address\/scriptCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/scriptCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/scriptCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/scriptCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/lineFour?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/lineFive?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/buildingNumber?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/buildingName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/blockName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/streetName?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/address\/streetTypeCode?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/streetTypeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/streetTypeCode\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/streetTypeCode\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/unit?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/floor?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/stairCase?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/door?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/postOfficeBox?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/deliveryPoint?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/plotID?;
    StringCodeListType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel2?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/address\/countrySubdivisionLevel2\/subdivisionType?;
    StringType '\/worker\/workAssignment\/assignedWorkLocations\/itemID?;
    StringCodeListType '\/worker\/workAssignment\/remunerationBasisCode?;
    StringType '\/worker\/workAssignment\/remunerationBasisCode\/codeValue?;
    StringType '\/worker\/workAssignment\/remunerationBasisCode\/shortName?;
    StringType '\/worker\/workAssignment\/remunerationBasisCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/payCycleCode?;
    StringType '\/worker\/workAssignment\/payCycleCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payCycleCode\/shortName?;
    StringType '\/worker\/workAssignment\/payCycleCode\/longName?;
    ObjectType '\/worker\/workAssignment\/standardPayPeriodHours?;
    NumberType '\/worker\/workAssignment\/standardPayPeriodHours\/hoursQuantity?;
    StringCodeListType '\/worker\/workAssignment\/standardPayPeriodHours\/unitCode?;
    StringType '\/worker\/workAssignment\/standardPayPeriodHours\/unitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/standardPayPeriodHours\/unitCode\/shortName?;
    StringType '\/worker\/workAssignment\/standardPayPeriodHours\/unitCode\/longName?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/recordingBasisCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/recordingBasisCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/recordingBasisCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/recordingBasisCode\/longName?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/hourlyRateAmount?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/hourlyRateAmount\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/hourlyRateAmount\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/hourlyRateAmount\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/hourlyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/baseRemuneration\/hourlyRateAmount\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/hourlyRateAmount\/currencyCode?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/dailyRateAmount?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/dailyRateAmount\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/dailyRateAmount\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/dailyRateAmount\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/dailyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/baseRemuneration\/dailyRateAmount\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/dailyRateAmount\/currencyCode?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/weeklyRateAmount?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/weeklyRateAmount\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/weeklyRateAmount\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/weeklyRateAmount\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/weeklyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/baseRemuneration\/weeklyRateAmount\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/weeklyRateAmount\/currencyCode?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/biweeklyRateAmount?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/biweeklyRateAmount\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/biweeklyRateAmount\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/biweeklyRateAmount\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/biweeklyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/baseRemuneration\/biweeklyRateAmount\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/biweeklyRateAmount\/currencyCode?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/semiMonthlyRateAmount?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/semiMonthlyRateAmount\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/semiMonthlyRateAmount\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/semiMonthlyRateAmount\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/semiMonthlyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/baseRemuneration\/semiMonthlyRateAmount\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/semiMonthlyRateAmount\/currencyCode?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/monthlyRateAmount?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/monthlyRateAmount\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/monthlyRateAmount\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/monthlyRateAmount\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/monthlyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/baseRemuneration\/monthlyRateAmount\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/monthlyRateAmount\/currencyCode?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/annualRateAmount?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/annualRateAmount\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/annualRateAmount\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/annualRateAmount\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/annualRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/baseRemuneration\/annualRateAmount\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/annualRateAmount\/currencyCode?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/payPeriodRateAmount?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/payPeriodRateAmount\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/payPeriodRateAmount\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/payPeriodRateAmount\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/payPeriodRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/baseRemuneration\/payPeriodRateAmount\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/payPeriodRateAmount\/currencyCode?;
    ObjectType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/nameCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/nameCode\/longName?;
    NumberType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/percentageValue?;
    StringCodeListType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/baseUnitCode?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/baseUnitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/baseUnitCode\/shortName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/commissionRatePercentage\/baseUnitCode\/longName?;
    StringType '\/worker\/workAssignment\/baseRemuneration\/effectiveDate?;
    ArrayType '\/worker\/workAssignment\/additionalRemunerations?;
    StringCodeListType '\/worker\/workAssignment\/additionalRemunerations\/typeCode?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/typeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/typeCode\/shortName?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/typeCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/additionalRemunerations\/intervalCode?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/intervalCode\/codeValue?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/intervalCode\/shortName?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/intervalCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/additionalRemunerations\/nameCode?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/nameCode\/longName?;
    ObjectType '\/worker\/workAssignment\/additionalRemunerations\/rate?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/additionalRemunerations\/rate\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/additionalRemunerations\/rate\/currencyCode?;
    StringCodeListType '\/worker\/workAssignment\/additionalRemunerations\/rate\/unitCode?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/rate\/unitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/rate\/unitCode\/shortName?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/rate\/unitCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/additionalRemunerations\/rate\/baseUnitCode?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/rate\/baseUnitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/rate\/baseUnitCode\/shortName?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/rate\/baseUnitCode\/longName?;
    NumberType '\/worker\/workAssignment\/additionalRemunerations\/rate\/baseMultiplierValue?;
    ArrayType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers?;
    StringCodeListType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectTypeCode?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectTypeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectTypeCode\/shortName?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectTypeCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectCode?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectCode\/codeValue?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectCode\/shortName?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectCode\/longName?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectID?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/associatedRateQualifiers\/itemID?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/itemID?;
    StringType '\/worker\/workAssignment\/additionalRemunerations\/effectiveDate?;
    ArrayType '\/worker\/workAssignment\/reportsTo?;
    StringType '\/worker\/workAssignment\/reportsTo\/positionID?;
    StringType '\/worker\/workAssignment\/reportsTo\/positionTitle?;
    StringType '\/worker\/workAssignment\/reportsTo\/associateOID?;
    ObjectType '\/worker\/workAssignment\/reportsTo\/workerID?;
    StringType '\/worker\/workAssignment\/reportsTo\/workerID\/idValue?;
    StringCodeListType '\/worker\/workAssignment\/reportsTo\/workerID\/schemeCode?;
    StringType '\/worker\/workAssignment\/reportsTo\/workerID\/schemeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/reportsTo\/workerID\/schemeCode\/shortName?;
    StringType '\/worker\/workAssignment\/reportsTo\/workerID\/schemeCode\/longName?;
    ObjectType '\/worker\/workAssignment\/reportsTo\/reportsToWorkerName?;
    StringType '\/worker\/workAssignment\/reportsTo\/reportsToWorkerName\/givenName?;
    StringType '\/worker\/workAssignment\/reportsTo\/reportsToWorkerName\/middleName?;
    StringType '\/worker\/workAssignment\/reportsTo\/reportsToWorkerName\/familyName1?;
    StringType '\/worker\/workAssignment\/reportsTo\/reportsToWorkerName\/familyName2?;
    StringType '\/worker\/workAssignment\/reportsTo\/reportsToWorkerName\/formattedName?;
    StringCodeListType '\/worker\/workAssignment\/reportsTo\/reportsToRelationshipCode?;
    StringType '\/worker\/workAssignment\/reportsTo\/reportsToRelationshipCode\/codeValue?;
    StringType '\/worker\/workAssignment\/reportsTo\/reportsToRelationshipCode\/shortName?;
    StringType '\/worker\/workAssignment\/reportsTo\/reportsToRelationshipCode\/longName?;
    StringType '\/worker\/workAssignment\/reportsTo\/itemID?;
    StringCodeListType '\/worker\/workAssignment\/payrollProcessingStatusCode?;
    StringType '\/worker\/workAssignment\/payrollProcessingStatusCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payrollProcessingStatusCode\/shortName?;
    StringType '\/worker\/workAssignment\/payrollProcessingStatusCode\/longName?;
    StringType '\/worker\/workAssignment\/payrollProcessingStatusCode\/effectiveDate?;
    StringCodeListType '\/worker\/workAssignment\/payScaleCode?;
    StringType '\/worker\/workAssignment\/payScaleCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payScaleCode\/shortName?;
    StringType '\/worker\/workAssignment\/payScaleCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/payGradeCode?;
    StringType '\/worker\/workAssignment\/payGradeCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradeCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradeCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/payrollGroupCode?;
    ObjectType '\/worker\/workAssignment\/annualBenefitBaseRate?;
    StringCodeListType '\/worker\/workAssignment\/annualBenefitBaseRate\/nameCode?;
    StringType '\/worker\/workAssignment\/annualBenefitBaseRate\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/annualBenefitBaseRate\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/annualBenefitBaseRate\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/annualBenefitBaseRate\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/annualBenefitBaseRate\/currencyCode?;
    StringType '\/worker\/workAssignment\/payrollScheduleGroupID?;
    StringType '\/worker\/workAssignment\/payrollFileNumber?;
    StringCodeListType '\/worker\/workAssignment\/payrollRegionCode?;
    ObjectType '\/worker\/workAssignment\/payGradePayRange?;
    ObjectType '\/worker\/workAssignment\/payGradePayRange\/minimumRate?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/currencyCode?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/unitCode?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/unitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/unitCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/unitCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/baseUnitCode?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/baseUnitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/baseUnitCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/baseUnitCode\/longName?;
    NumberType '\/worker\/workAssignment\/payGradePayRange\/minimumRate\/baseMultiplierValue?;
    ObjectType '\/worker\/workAssignment\/payGradePayRange\/medianRate?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/currencyCode?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/unitCode?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/unitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/unitCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/unitCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/baseUnitCode?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/baseUnitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/baseUnitCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/baseUnitCode\/longName?;
    NumberType '\/worker\/workAssignment\/payGradePayRange\/medianRate\/baseMultiplierValue?;
    ObjectType '\/worker\/workAssignment\/payGradePayRange\/maximumRate?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/currencyCode?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/unitCode?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/unitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/unitCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/unitCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/baseUnitCode?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/baseUnitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/baseUnitCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/baseUnitCode\/longName?;
    NumberType '\/worker\/workAssignment\/payGradePayRange\/maximumRate\/baseMultiplierValue?;
    NumberType '\/worker\/workAssignment\/compaRatio?;
    StringCodeListType '\/worker\/workAssignment\/payGradeStepCode?;
    StringType '\/worker\/workAssignment\/payGradeStepCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradeStepCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradeStepCode\/longName?;
    ObjectType '\/worker\/workAssignment\/payGradeStepPayRate?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/payGradeStepPayRate\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/payGradeStepPayRate\/currencyCode?;
    StringCodeListType '\/worker\/workAssignment\/payGradeStepPayRate\/unitCode?;
    StringType '\/worker\/workAssignment\/payGradeStepPayRate\/unitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradeStepPayRate\/unitCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradeStepPayRate\/unitCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/payGradeStepPayRate\/baseUnitCode?;
    StringType '\/worker\/workAssignment\/payGradeStepPayRate\/baseUnitCode\/codeValue?;
    StringType '\/worker\/workAssignment\/payGradeStepPayRate\/baseUnitCode\/shortName?;
    StringType '\/worker\/workAssignment\/payGradeStepPayRate\/baseUnitCode\/longName?;
    NumberType '\/worker\/workAssignment\/payGradeStepPayRate\/baseMultiplierValue?;
    StringType '\/worker\/workAssignment\/nextPayGradeStepDate?;
    StringType '\/worker\/workAssignment\/minimumPayGradeStepDuration?;
    StringCodeListType '\/worker\/workAssignment\/geographicPayDifferentialCode?;
    StringType '\/worker\/workAssignment\/geographicPayDifferentialCode\/codeValue?;
    StringType '\/worker\/workAssignment\/geographicPayDifferentialCode\/shortName?;
    StringType '\/worker\/workAssignment\/geographicPayDifferentialCode\/longName?;
    NumberType '\/worker\/workAssignment\/geographicPayDifferentialPercentage?;
    ObjectType '\/worker\/workAssignment\/customFieldGroup?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/amountFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/categoryCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/amountValue?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/currencyCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/amountFields\/itemID?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/codeFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/categoryCode\/longName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/longName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/codeFields\/itemID?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/dateFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/categoryCode\/longName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/dateValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateFields\/itemID?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/categoryCode\/longName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/dateTimeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/dateTimeFields\/itemID?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/categoryCode\/longName?;
    BooleanType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/indicatorValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/indicatorFields\/itemID?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/numberFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/categoryCode\/longName?;
    NumberType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/numberValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/numberFields\/itemID?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/percentFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/categoryCode\/longName?;
    NumberType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/percentValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/percentFields\/itemID?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/stringFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/categoryCode\/longName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/stringValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/stringFields\/itemID?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/nameCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/nameCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/nameCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/categoryCode?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/categoryCode\/codeValue?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/categoryCode\/shortName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/categoryCode\/longName?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/countryDialing?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/areaDialing?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/dialNumber?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/extension?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/access?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/formattedNumber?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/telephoneFields\/itemID?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/links?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/href?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/rel?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/canonicalUri?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/title?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/targetSchema?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/mediaType?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/method?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/encType?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/schema?;
    ArrayType '\/worker\/workAssignment\/customFieldGroup\/links\/payLoadArguments?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/payLoadArguments\/argumentPath?;
    StringType '\/worker\/workAssignment\/customFieldGroup\/links\/payLoadArguments\/argumentValue?;
    ObjectType '\/worker\/customFieldGroup?;
    ArrayType '\/worker\/customFieldGroup\/amountFields?;
    StringCodeListType '\/worker\/customFieldGroup\/amountFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/amountFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/amountFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/amountFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/amountFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/amountFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/amountFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/amountFields\/categoryCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/worker\/customFieldGroup\/amountFields\/amountValue?;
    StringCodeListType '\/worker\/customFieldGroup\/amountFields\/currencyCode?;
    StringType '\/worker\/customFieldGroup\/amountFields\/itemID?;
    StringCodeListType '\/worker\/customFieldGroup\/codeFields?;
    StringCodeListType '\/worker\/customFieldGroup\/codeFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/codeFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/codeFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/codeFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/codeFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/codeFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/codeFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/codeFields\/categoryCode\/longName?;
    StringType '\/worker\/customFieldGroup\/codeFields\/codeValue?;
    StringType '\/worker\/customFieldGroup\/codeFields\/shortName?;
    StringType '\/worker\/customFieldGroup\/codeFields\/longName?;
    StringType '\/worker\/customFieldGroup\/codeFields\/itemID?;
    ArrayType '\/worker\/customFieldGroup\/dateFields?;
    StringCodeListType '\/worker\/customFieldGroup\/dateFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/dateFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/dateFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/dateFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/dateFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/dateFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/dateFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/dateFields\/categoryCode\/longName?;
    StringType '\/worker\/customFieldGroup\/dateFields\/dateValue?;
    StringType '\/worker\/customFieldGroup\/dateFields\/itemID?;
    ArrayType '\/worker\/customFieldGroup\/dateTimeFields?;
    StringCodeListType '\/worker\/customFieldGroup\/dateTimeFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/dateTimeFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/dateTimeFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/dateTimeFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/dateTimeFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/dateTimeFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/dateTimeFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/dateTimeFields\/categoryCode\/longName?;
    StringType '\/worker\/customFieldGroup\/dateTimeFields\/dateTimeValue?;
    StringType '\/worker\/customFieldGroup\/dateTimeFields\/itemID?;
    ArrayType '\/worker\/customFieldGroup\/indicatorFields?;
    StringCodeListType '\/worker\/customFieldGroup\/indicatorFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/indicatorFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/indicatorFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/indicatorFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/indicatorFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/indicatorFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/indicatorFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/indicatorFields\/categoryCode\/longName?;
    BooleanType '\/worker\/customFieldGroup\/indicatorFields\/indicatorValue?;
    StringType '\/worker\/customFieldGroup\/indicatorFields\/itemID?;
    ArrayType '\/worker\/customFieldGroup\/numberFields?;
    StringCodeListType '\/worker\/customFieldGroup\/numberFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/numberFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/numberFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/numberFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/numberFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/numberFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/numberFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/numberFields\/categoryCode\/longName?;
    NumberType '\/worker\/customFieldGroup\/numberFields\/numberValue?;
    StringType '\/worker\/customFieldGroup\/numberFields\/itemID?;
    ArrayType '\/worker\/customFieldGroup\/percentFields?;
    StringCodeListType '\/worker\/customFieldGroup\/percentFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/percentFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/percentFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/percentFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/percentFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/percentFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/percentFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/percentFields\/categoryCode\/longName?;
    NumberType '\/worker\/customFieldGroup\/percentFields\/percentValue?;
    StringType '\/worker\/customFieldGroup\/percentFields\/itemID?;
    ArrayType '\/worker\/customFieldGroup\/stringFields?;
    StringCodeListType '\/worker\/customFieldGroup\/stringFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/stringFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/stringFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/stringFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/stringFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/stringFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/stringFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/stringFields\/categoryCode\/longName?;
    StringType '\/worker\/customFieldGroup\/stringFields\/stringValue?;
    StringType '\/worker\/customFieldGroup\/stringFields\/itemID?;
    ArrayType '\/worker\/customFieldGroup\/telephoneFields?;
    StringCodeListType '\/worker\/customFieldGroup\/telephoneFields\/nameCode?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/nameCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/nameCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/nameCode\/longName?;
    StringCodeListType '\/worker\/customFieldGroup\/telephoneFields\/categoryCode?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/categoryCode\/codeValue?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/categoryCode\/shortName?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/categoryCode\/longName?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/countryDialing?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/areaDialing?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/dialNumber?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/extension?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/access?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/formattedNumber?;
    StringType '\/worker\/customFieldGroup\/telephoneFields\/itemID?;
    ArrayType '\/worker\/customFieldGroup\/links?;
    StringType '\/worker\/customFieldGroup\/links\/href?;
    StringType '\/worker\/customFieldGroup\/links\/rel?;
    StringType '\/worker\/customFieldGroup\/links\/canonicalUri?;
    StringType '\/worker\/customFieldGroup\/links\/title?;
    StringType '\/worker\/customFieldGroup\/links\/targetSchema?;
    StringType '\/worker\/customFieldGroup\/links\/mediaType?;
    StringType '\/worker\/customFieldGroup\/links\/method?;
    StringType '\/worker\/customFieldGroup\/links\/encType?;
    StringType '\/worker\/customFieldGroup\/links\/schema?;
    ArrayType '\/worker\/customFieldGroup\/links\/payLoadArguments?;
    StringType '\/worker\/customFieldGroup\/links\/payLoadArguments\/argumentPath?;
    StringType '\/worker\/customFieldGroup\/links\/payLoadArguments\/argumentValue?;
};

# Event Data
public type WorkerhireeventData record {
    # Data which sets the context for the event.  That is, the keys which set context
    EventcontextbaseV01 eventContext?;
    # Data which is transformed as a result of the event
    WorkerhireeventDataTransform transform?;
    # Result of the event
    WorkerhireeventDataOutput output?;
};

public type PersonoutputImmigrationdocuments record {
    # The unique identifier of the object in a collection
    ItemidtypeV01 documentID?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 countryCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 typeCode?;
    # Schema describing the details of a party - an agency, bureau, or other organization issuing the associated document; the body or persons exercising power or command. An issuing party is often is a government agency or official authority, but sometimes might be a private organization
    PartybasetypeV02 issuingParty?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 issueDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 expirationDate?;
    # Represents the duration of time as represented by ISO 8601. Where the value space is a six dimensional space where the coordinates designate the Gregorian year, month, day, hour, minute, and second. The number of seconds can include decimal digits to arbitary pecision. PnYn MnDTnH nMnS, where: [n] is replaced by the value for each of the date and time elements that follow the [n]. Leading zeros are not required, but the maximum number of digits for each element should be agreed to by the communicating parties. The capital letters 'P', 'Y', 'M', 'W', 'D', 'T', 'H', 'M', and 'S' are designators for each of the date and time elements and are not replaced. P is the duration designator (historically called 'period') placed at the start of the duration representation. Y is the year designator that follows the value for the number of years. M is the month designator that follows the value for the number of months. D is the day designator that follows the value for the number of days. T is the time designator that precedes the time components of the representation. H is the hour designator that follows the value for the number of hours. M is the minute designator that follows the value for the number of minutes. S is the second designator that follows the value for the number of seconds. The number of seconds can include decimal digits to arbitrary precision
    DurationtypeV01 authorizedStayDuration?;
    # Represents the duration of time as represented by ISO 8601. Where the value space is a six dimensional space where the coordinates designate the Gregorian year, month, day, hour, minute, and second. The number of seconds can include decimal digits to arbitary pecision. PnYn MnDTnH nMnS, where: [n] is replaced by the value for each of the date and time elements that follow the [n]. Leading zeros are not required, but the maximum number of digits for each element should be agreed to by the communicating parties. The capital letters 'P', 'Y', 'M', 'W', 'D', 'T', 'H', 'M', and 'S' are designators for each of the date and time elements and are not replaced. P is the duration designator (historically called 'period') placed at the start of the duration representation. Y is the year designator that follows the value for the number of years. M is the month designator that follows the value for the number of months. D is the day designator that follows the value for the number of days. T is the time designator that precedes the time components of the representation. H is the hour designator that follows the value for the number of hours. M is the minute designator that follows the value for the number of minutes. S is the second designator that follows the value for the number of seconds. The number of seconds can include decimal digits to arbitrary precision
    DurationtypeV01 reentryRequirementDuration?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# The URI of the related entity
public type UritypeV01 string;

# Event Data
public type WorkerrehireeventData record {
    # Data which sets the context for the event.  That is, the keys which set context
    EventcontextbaseV01 eventContext?;
    # Data which is transformed as a result of the event
    WorkerrehireeventDataTransform transform?;
    # Result of the event
    WorkerrehireeventDataOutput output?;
};

# An instance to capture the worker termination event
public type WorkerterminateeventEvents record {
    # The unique identifier of the event instance. This is set by the system of record once an event is recorded as in progress or complete
    string eventID?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 serviceCategoryCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventNameCode?;
    # The event title offers a way to describe a particular instance of an event at a level more granular than the event name, e.g. 2014 Annual Enrollment
    string eventTitle?;
    # The event sub title provides event instance summary details, e.g. All Annual Enrollment elections become effective on January 1, 2014
    string eventSubTitle?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventReasonCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventStatusCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 priorityCode?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 recordDateTime?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 creationDateTime?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 effectiveDateTime?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 expirationDateTime?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 dueDateTime?;
    # Boolean expression
    IndicatortypeV01 notificationIndicator?;
    EventoriginatortypeV01 originator?;
    EventactortypeV01 actor?;
    # The party (client employee) information that the actor is acting as to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) in read only mode.
    WorkerhireeventActasparty actAsParty?;
    # The party (client employee) that the actor is acting on behalf of to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) and can take action on that person's behalf.  The Actor may have access to certain features or screens that the Client Employee cannot view, e.g. diagnostics screens.
    WorkerhireeventOnbehalfofparty onBehalfOfParty?;
    # The entity tag of the entity in the request
    string eTag?;
    LinktypeV02[] links?;
    # Event Data
    WorkerterminateeventData data?;
};

public type IndicatorType boolean;

public type CustomfieldcontainertypeV02Datefields record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 categoryCode?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 dateValue?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

public type CustomfieldcontainertypeV02Indicatorfields record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 categoryCode?;
    # Boolean expression
    IndicatortypeV01 indicatorValue?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# These dates are related to the highest level legal relationship that a person has with the organization. If a given worker has multiple relationships with the organization, these are the dates associated with the primary relationship.
public type Workerdatestransform1 record {
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 terminationDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 expectedTerminationDate?;
};

# The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
public type CodetypeV02 record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

# Race is a classification system used to categorize humans into large and distinct populations or groups by heritable phenotypic characteristics, geographic ancestry, culture, history, language, physical appearance, ethnicity, and social status
public type PersonoutputRacecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 identificationMethodCode?;
};

# The code for the related entity
public type CodetypeV01 record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# A reference to the codelist extended with values
public type ValueSetType record {
    ValueSetMeta meta?;
    ValueSetItemType[] valueSetListItems?;
    LinkType[] links?;
};

# Event meta data
public type WorkeronleaveeventmetaMeta record {
    # The service domain, e.g HR, Payroll, Benefits, etc. This field is always present and valued based on a standard codelist.
    string '\/serviceCategoryCode\/codeValue;
    # This is the canonical name of the event, e.g. dependent.add, worker.hire. This field is always present and valued based on a standard codelist.
    string '\/eventNameCode\/codeValue;
    # A collection of query criteria
    WorkerhireQueryCriterion[] queryCriteria?;
    # Validation rules for the event context
    WorkeronleaveeventmetaMetaDataeventcontext '\/data\/eventContext?;
    # A collection of transform rules
    WorkeronleaveeventmetaMetaDatatransforms[] '\/data\/transforms?;
};

# Each object contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).
public type ProcessMessageWithResourceStatusCode record {
    # The unique identifier of the related entity 
    IdtypeV01 processMessageID?;
    # Schema describing the type of the user or developer message
    MessagetypecodetypeV01 messageTypeCode?;
    # Expression that provides the location (or source) of content in a message instance that is associated with a process message. Examples of expression languages include: XPath, XQuery, JSON Pointer.
    string sourceLocationExpression?;
    # Identifies the language used for expressions communicated in this message.
    ConfirmmessagetypeV01Expressionlanguagecode expressionLanguageCode?;
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    LinktypeV02[] links?;
    # Representation of a message.
    MessagetypeV01 userMessage?;
    # Representation of a message.
    MessagetypeV01 developerMessage?;
    # The code for the related entity
    CodetypeV01 resourceStatusCode?;
};

# A container of custom fields. The category within each custom object allows for the categorizing or grouping of the associated custom field for the purpose of data mining. For example, the typeCode on a custom string object might be valued as SIZE and the correlating name codes might be t-shirt, pants, jacket, etc.
public type CustomfieldcontainertypeV02 record {
    # A list of custom amounts
    CustomfieldcontainertypeV02Amountfields[] amountFields?;
    # A list of custom codes
    CustomfieldcontainertypeV02Codefields[] codeFields?;
    # A list of custom dates
    CustomfieldcontainertypeV02Datefields[] dateFields?;
    # A list of custom datetimes
    CustomfieldcontainertypeV02Datetimefields[] dateTimeFields?;
    # A list of custom indicators
    CustomfieldcontainertypeV02Indicatorfields[] indicatorFields?;
    # A list of custom numbers
    CustomfieldcontainertypeV02Numberfields[] numberFields?;
    # A list of custom percentages
    CustomfieldcontainertypeV02Percentfields[] percentFields?;
    # A list of custom strings
    CustomfieldcontainertypeV02Stringfields[] stringFields?;
    # A list of custom telephone numbers
    CustomfieldcontainertypeV02Telephonefields[] telephoneFields?;
    LinktypeV02[] links?;
};

# An associated labor union
public type LaboruniontypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 laborUnionCode?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 seniorityDate?;
};

# The work assignment to whom a given worker reports
public type WorkAssignmentTransformReportsTo record {
    # The simple (string) identifier of an object
    SimpleidtypeV02 positionID?;
    # The position title
    string positionTitle?;
    # The unique identifier of an assoicate
    AssociateoidtypeV02 associateOID?;
    # The unique identifier of the related entity 
    IdtypeV02 workerID?;
    # The name of the contact
    ContactnametypeV02 reportsToWorkerName?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 reportsToRelationshipCode?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# The method that was used on the request corresponding to this message instance.
public type ConfirmmessagetypeV01Requestmethodcode record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

# Event meta data
public type WorkerrehireeventmetaMeta record {
    # The service domain, e.g HR, Payroll, Benefits, etc. This field is always present and valued based on a standard codelist.
    string '\/serviceCategoryCode\/codeValue;
    # This is the canonical name of the event, e.g. dependent.add, worker.hire. This field is always present and valued based on a standard codelist.
    string '\/eventNameCode\/codeValue;
    # A collection of query criteria
    WorkerhireQueryCriterion[] queryCriteria?;
    # Validation rules for the event context
    record  { }  '\/data\/eventContext?;
    # A collection of transform rules
    WorkerrehireeventmetaMetaDatatransforms[] '\/data\/transforms?;
};

# A representation of a rate percentage value
public type RatepercentagetypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The numeric value associated to the rate. In the example 5 US dollars per hour, the number 5 is the rate value. In the example 3 bags of rice per month, the number 3 is the rate value. In the example, 20 percent of annual sales, the percentageValue would be 20
    decimal percentageValue?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 baseUnitCode?;
};

# Result of the event
public type WorkerhireeventDataOutput record {
    # A worker is someone who performs duties and has responsibilities for an organization
    WorkerOutput 'worker?;
};

# The service domain, e.g. HR, Payroll, Benefits, etc. This field is always present and valued based on a standard codelist.
public type WorkeronleaveeventServicecategorycode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# Data which is transformed as a result of the event
public type WorkerrehireeventDataTransform record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventReasonCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventStatusCode?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 effectiveDateTime?;
    # Boolean expression
    IndicatortypeV01 notificationIndicator?;
    # A worker is someone who performs duties and has responsibilities for an organization
    Workertransform2 'worker?;
};

public type CustomfieldcontainertypeV02Telephonefields record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 categoryCode?;
    # The country dialing code is the national prefix to be used when dialing TO that particular country FROM another country. 
    string countryDialing?;
    # The local area dialing code for a telephone number.
    string areaDialing?;
    # The local communication number, not including country dialing or area dialing codes.   If component parts of the telephone number are being communicated then the dialNumber is required.
    string dialNumber?;
    # The extension of the local communication number.  In the case of a Telephone Number accessing a Pager Network, the extension may be the Pager Identification Number required to leave a message for the Pager Number (i.e. Pager Pin).  These are mutually exclusive.
    string extension?;
    # National Direct Dialing Prefix.  Also known as the trunk prefix or National Prefix.  It is the number to be dialed in a domestic telephone call, preceding any necessary area code and subscriber number (i.e. dial number).  When calling from outside of the country, the national direct dial prefix is omitted by the caller.  In Australia, Germany, and United Kingdom the trunk prefix is 0.  In the US and Canada it is 1.
    string access?;
    # The formatted telephone number.  The component parts of the telephone are put together into a presentation pattern as defined by the regex format specified.  Please note that is used as an escape character in regex, but a double  is needed to escape within the json schema.  The regex will accept +CC NNNNNNNNNNNNNN where + is the symbol indicating the caller to enter their country specific code to call from outside the country.  CC is the country code for an international number (optional), and the area code and dial number.  The local access code (i.e. 1 (201) 333 4444. 1 is the access code in US) is not passed.  The UI will present the phone number following its own presentation convention
    string formattedNumber?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# Base structure for event or process originator
public type OriginatortypeV02 record {
    # The unique identifier of the related entity 
    IdtypeV02 applicationID?;
    # The unique identifier of an associate who originated the event.
    string associateOID?;
    # The unique identifier of a person who originated the event or a process
    string personOID?;
    # Human readable name of the event originator
    string formattedName?;
    # The unique identifier of the event instance. This is generated once an event is recorded with an event status code equal to Complete. This value is set by the system of record.
    string eventID?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventNameCode?;
    # The unique identifier of the device, e.g. a time clock, door entry beam
    string deviceID?;
};

public type PersonoutputFormernames record {
    # The first name of the person
    string givenName?;
    # Person middle name or initial
    string middleName?;
    # Person family name 1
    string familyName1?;
    # Person family name 2
    string familyName2?;
    # A formatted version of the person name
    string formattedName?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 scriptCode?;
    # A list of preferred salutations
    SalutationtypeV02[] preferredSalutations?;
    # Person title Prefix Codes
    TitleaffixtypeV02[] titlePrefixCodes?;
    # A preferred name, e.g. a nickname
    string nickName?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 generationAffixCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 qualificationAffixCode?;
    # Person titles
    TitleaffixtypeV02[] titleAffixCodes?;
    # Person family name pre-fix
    string familyName1Prefix?;
    # Person family name pre-fix
    string familyName2Prefix?;
    # Person initials
    string initials?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 typeCode?;
};

public type AssignedGroup record {
    # The simple (string) identifier of an object
    SimpleidtypeV02 groupID?;
    # The name of the group
    string groupName?;
    # Associates that are part of the group(s) assigned to the review event.  The actor is the member that actually completes the event.
    AssignedGroupMember[] assignedGroupMembers?;
};
