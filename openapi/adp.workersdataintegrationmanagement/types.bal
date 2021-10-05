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

public type PersontypeV02Alternatepreferrednames record {
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

# Minumum, maximum and median remuneration rates
public type RangetypeV02 record {
    # A representation of a rate value
    RatetypeV02 minimumRate?;
    # A representation of a rate value
    RatetypeV02 medianRate?;
    # A representation of a rate value
    RatetypeV02 maximumRate?;
};

public type ValueSetMeta record {
    # Code value (typically a key field) of the code list item
    string idValuePath?;
    # Short name field of the code list item
    string itemDescriptionPath?;
};

# The party (client employee) information that the actor is acting as to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) in read only mode.
public type WorkerreadeventActasparty record {
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

# A simple (string) code.  Can have a code list reference
public type SimplecodetypeV02 string;

public type WorkerReadEventMeta record {
    # Event meta data
    WorkerreadeventmetaMeta meta?;
};

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

# Event Data
public type WorkerreadeventData record {
    # Data which sets the context for the event.  That is, the keys which set context
    WorkerreadeventDataEventcontext eventContext?;
    # Data which is transformed as a result of the event
    WorkerReadTransform transform?;
    # Result of the event
    WorkerReadOutput output?;
};

# Schema describing the details of a party - an agency, bureau, or other organization issuing the associated document; the body or persons exercising power or command. An issuing party is often is a government agency or official authority, but sometimes might be a private organization
public type PartybasetypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # organization address objects / components
    OrganizationaddresstypeV02 address?;
};

public type ArgumentType record {
    # Argument name to be passed in
    string argumentName?;
    # The path of the argument to be passed in
    string argumentPath?;
    # The value of the argument name to be passed in
    string argumentValue?;
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

# Meta contains the metadata associated with a response.  A GET response may include metadata to support pagination.
public type WorkerReadMeta record {
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

# The simple (string) identifier of an object
public type SimpleidtypeV02 string;

public type MetaDataType string;

# The string reprersentation of the date range. Used to specify effective period.  Follows the ISO-8601:2000 format
public type DateperiodtypeV01 record {
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 startDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 endDate?;
};

# The date range of the coverage for the related entity
public type SocialinsuranceprogramitemtypeV02Coverageperiod record {
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 startDate?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 endDate?;
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

# The process results status code for the request.
public type ConfirmmessagetypeV01Requeststatuscode record {
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.
    string codeValue?;
};

# Result of the event
public type WorkerReadOutput record {
    Worker[] workers?;
};

public type LinktypeV02Payloadarguments record {
    # Code value (typically a key field) of the code list item
    string argumentPath?;
    # Code value (typically a key field) of the code list item
    string argumentValue?;
};

public type EventactortypeV01 record {
    *ActortypeV02;
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

# Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
public type HelperMessageType record {
    # Message to present to the user.
    string messageTxt?;
    LinktypeV02[] links?;
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

# A representation of a rate amount value
public type RateamounttypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The numeric value associated to the rate. In the example 5 US dollars per hour, the number 5 is the rate value. In the example 3 bags of rice per month, the number 3 is the rate value. In the example, 20 percent of annual sales, the amountValue would be 20
    decimal amountValue?;
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 currencyCode?;
};

# A single query parameter
public type WorkerreadQueryCriterion record {
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
    WorkerreadeventmetaMetaLogicaloperators[] logicalOperators?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
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
    PersontypeV02Identitydocuments[] identityDocuments?;
    # A list of immigration documents for a person who is not a citizen of the country in which he or see resides , e.g. a passport, visa, alien registration card, aka, green card, residence permit, etc.
    PersontypeV02Immigrationdocuments[] immigrationDocuments?;
    # A list of passport documents, issued by a national govenment which certifies the identiy and nationality of its holder
    PersontypeV02Identitydocuments[] passports?;
    # A list of documents that authorize work, e.g. visas, a work permit, a labor card, etc.
    PersontypeV02Identitydocuments[] workAuthorizationDocuments?;
    # Object describing the details of a person name
    PersonnametypeV02 preferredName?;
    # Other preferred names of the person expressed in a different language or script
    PersontypeV02Alternatepreferrednames[] alternatePreferredNames?;
    # Former names of the person in the associated context
    PersontypeV02Formernames[] formerNames?;
    # Object describing the details of a person name
    PersonnametypeV02 birthName?;
    # The place a person was born. This can have taxation impacts. Inlcudes certain address components
    BirthplacetypeV02 birthPlace?;
    # A list of addresses related to the associated entity
    PersontypeV02Otherpersonaladdresses[] otherPersonalAddresses?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 ethnicityCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 ethnicityGroupCode?;
    # Race is a classification system used to categorize humans into large and distinct populations or groups by heritable phenotypic characteristics, geographic ancestry, culture, history, language, physical appearance, ethnicity, and social status
    PersontypeV02Racecode raceCode?;
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

public type CodeListType record {
    # Code list title
    string codeListTitle?;
    IndicatorType exclusiveIndicator?;
    CodeListItemType[] listItems?;
    LinktypeV02[] links?;
};

# The unique identifier of a position
public type PositionidtypeV02 string;

# List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
public type DependencyListType record {
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

public type WorkerReadEvent record {
    # Meta contains the metadata associated with a response.  A GET response may include metadata to support pagination.
    WorkerReadMeta meta?;
    # An event instance
    WorkerreadeventEvents[] events?;
    # The ConfirmMessage contains the processing results for the corresponding request.  A request may have its processing reported as: succeeded, partially failed, or failed.
    ConfirmmessagetypeV01 confirmMessage?;
};

public type EmailContactCommunicationType record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The email URI of the related entity
    EmailuritypeV02 emailUri?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    boolean notificationIndicator?;
};

public type UriType string;

# An instance to capture the worker read event
public type WorkerreadeventEvents record {
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
    WorkerreadeventActasparty actAsParty?;
    # The party (client employee) that the actor is acting on behalf of to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) and can take action on that person's behalf.  The Actor may have access to certain features or screens that the Client Employee cannot view, e.g. diagnostics screens.
    WorkerreadeventOnbehalfofparty onBehalfOfParty?;
    # The entity tag of the entity in the request
    string eTag?;
    LinktypeV02[] links?;
    # Event Data
    WorkerreadeventData data?;
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

# A worker is someone who performs duties and has responsibilities for an organization
public type Worker record {
    # The unique identifier of an assoicate
    AssociateoidtypeV02 associateOID?;
    # The unique identifier of the related entity 
    IdtypeV02 workerID?;
    # Object describing the details of a person
    PersontypeV02 person?;
    # These dates are related to the highest level legal relationship that a person has with the organization. If a given worker has multiple relationships with the organization, these are the dates associated with the primary relationship.
    WorkerreadoutputWorkerdates workerDates?;
    # Status to include the status code, effective date (ISO-8601:2000 format) and the reason for change
    StatusreasontypeV02 workerStatus?;
    # A list of photos
    WorkerreadoutputPhotos[] photos?;
    # Communication objects to include various communication mechanisms, e,g, phone, email, etc.
    CommunicationtypeV02 businessCommunication?;
    WorkassignmentitemtypeV02[] workAssignments?;
    # A container of custom fields. The category within each custom object allows for the categorizing or grouping of the associated custom field for the purpose of data mining. For example, the typeCode on a custom string object might be valued as SIZE and the correlating name codes might be t-shirt, pants, jacket, etc.
    CustomfieldcontainertypeV02 customFieldGroup?;
    LinktypeV02[] links?;
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

# The unique identifier of the related entity 
public type IdtypeV02 record {
    # An actual ID value
    string idValue?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 schemeCode?;
};

# The string representation of the date value. Follows the ISO-8601:2000 format
public type DatetypeV01 string;

# The unique identifier of an assoicate
public type AssociateoidtypeV02 string;

# The unique identifier of the related entity 
public type IdtypeV01 record {
    # An ID
    string idValue?;
    # The type of ID
    string schemeName?;
    # The agency that issues the ID
    string schemeAgencyName?;
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
    LinktypeV02[] links?;
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

public type WorkassignmentitemtypeV02Additionalremunerations record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 typeCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 intervalCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # A representation of a rate value
    RatetypeV02 rate?;
    # Describes the conditions under which the associated rate can be expected
    AssociatedRateQualifierType[] associatedRateQualifiers?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 effectiveDate?;
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

# The coordinates of the location
public type CoordinatetypeV02 record {
    # The angle, in degrees, of a position on Earth above the equator. (Latitude is negative for a place below the equator.) specified in decimal degrees
    decimal latitude?;
    # The angle, in degrees, of a position on Earth around the equator from the Greenwich Meridian specified in decimal degrees
    decimal longitude?;
};

# A representation of a percentage value
public type PercentagetypeV02 decimal;

# The party (client employee) that the actor is acting on behalf of to complete the recording of the event. Example: An ADP Support User (principal A = Actor) views data within an ADP Application as a client employee (principal B) and can take action on that person's behalf.  The Actor may have access to certain features or screens that the Client Employee cannot view, e.g. diagnostics screens.
public type WorkerreadeventOnbehalfofparty record {
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

public type WorkerreadoutputPhotos record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    LinktypeV02[] links?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
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

public type EventoriginatortypeV01 record {
    *OriginatortypeV02;
};

public type AssociatedRateQualifierType record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 qualifierObjectTypeCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 qualifierObjectCode?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 qualifierObjectID?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
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

# Validation rules for the event context
public type WorkerreadeventmetaMetaDataeventcontext record {
    StringType '\/contextExpressionID?;
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

# Represents the duration of time as represented by ISO 8601. Where the value space is a six dimensional space where the coordinates designate the Gregorian year, month, day, hour, minute, and second. The number of seconds can include decimal digits to arbitary pecision. PnYn MnDTnH nMnS, where: [n] is replaced by the value for each of the date and time elements that follow the [n]. Leading zeros are not required, but the maximum number of digits for each element should be agreed to by the communicating parties. The capital letters 'P', 'Y', 'M', 'W', 'D', 'T', 'H', 'M', and 'S' are designators for each of the date and time elements and are not replaced. P is the duration designator (historically called 'period') placed at the start of the duration representation. Y is the year designator that follows the value for the number of years. M is the month designator that follows the value for the number of months. D is the day designator that follows the value for the number of days. T is the time designator that precedes the time components of the representation. H is the hour designator that follows the value for the number of hours. M is the minute designator that follows the value for the number of minutes. S is the second designator that follows the value for the number of seconds. The number of seconds can include decimal digits to arbitrary precision
public type DurationtypeV01 string;

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

public type WorkassignmentitemtypeV02Workergroups record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 groupCode?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
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

public type WorkerreadeventmetaMetaDatatransforms record {
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
    StringType '\/queryParameter?;
};

# An object describing the details of a work assignment. A work assignment pertains to the duties and responsibilities that should be performed by the worker.  A member of the list or another collection
public type WorkassignmentitemtypeV02 record {
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
    WorkassignmentitemtypeV02Workergroups[] workerGroups?;
    # Status to include the status code and effective date (ISO-8601:2000 format)
    StatustypeV02 jobCode?;
    # The job title
    string jobTitle?;
    # A reference to a system used to classify workers into occupational categories for the purpose of collecting, calculating, or disseminating data. In the US, an example of this is the EEOC system; in the UK, an example of this is the SOC system. This is the at the assignment level in France
    WorkassignmentitemtypeV02Occupationalclassifications[] occupationalClassifications?;
    # The occupational classification reflects the type of job or work that the person does, while the industry classification reflects the business activity of their employer or company. The occupational and industry classifications are based on a persons sole or primary job, unless otherwise specified. For the unemployed, the occupation and industry are based on the last job held. An example of an industry classification code in the US is the NAICS code.
    WorkassignmentitemtypeV02Occupationalclassifications[] industryClassifications?;
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
    HomeOrganizationalUnitItem[] homeOrganizationalUnits?;
    # A list of organizational units
    AssignedOrganizationalUnitItem[] assignedOrganizationalUnits?;
    # Schema to describe details of a location
    LocationtypeV02 homeWorkLocation?;
    # A list of work locations
    WorkassignmentitemtypeV02Assignedworklocations[] assignedWorkLocations?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 remunerationBasisCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 payCycleCode?;
    # The standard number of hours of work associated to a position, typically used to drive the definition of a full time assignment, e.g. 40 in the US, 37.5 in the UK, 35 in FR. This number is usually expressed based on a week. The unitCode is used to convey that measurement.
    StandardhourstypeV02 standardPayPeriodHours?;
    # The base or primary pay (i.e. salary, wage) associated to a work assignment. The structure allows for the explicit communication of pre-defined equivalents for the base remuneration
    WorkassignmentitemtypeV02Baseremuneration baseRemuneration?;
    # A list of pay compensations associated to a given work assignment. Additional remuneration includes all other forms of compensation beyond the base pay associated to a given work assignment.  The typeCode is used to further refine the type of compensation, e.g. bonus, commission, etc.
    WorkassignmentitemtypeV02Additionalremunerations[] additionalRemunerations?;
    # A reference list of workers to whom a given worker reports
    WorkAssignmentReportsTo[] reportsTo?;
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
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

public type SimpleIDType string;

# A unique identifier of an object within the collection
public type ItemIDType string;

# The unique identifier - UUID
public type OidtypeV02 string;

# The ratio
public type RatiotypeV02 decimal;

public type MaskingRuleType record {
    IndicatorType authorizationRequiredIndicator?;
    SimpleIDType authorizationResourceID?;
    LinktypeV02[] links?;
};

# Race is a classification system used to categorize humans into large and distinct populations or groups by heritable phenotypic characteristics, geographic ancestry, culture, history, language, physical appearance, ethnicity, and social status
public type PersontypeV02Racecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 identificationMethodCode?;
};

public type PersontypeV02Identitydocuments record {
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

# The HOME organizational unit defines the work assignment and perhaps funds it. The should only be one home organizational unit for a given type, e.g. only one home department.
public type HomeOrganizationalUnitItem record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 typeCode?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
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

public type InternetAddressWithItemID record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The URI of the related entity
    UritypeV01 uri?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
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

# The work assignment to whom a given worker reports
public type WorkAssignmentReportsTo record {
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

public type CodelisttypeV03 record {
    # Code list title
    string codeListTitle?;
    # Boolean expression
    IndicatortypeV01 exclusiveIndicator?;
    CodelistitemtypeV02[] listItems?;
    LinktypeV02[] links?;
};

# Data which sets the context for the event.  That is, the keys which set context
public type WorkerreadeventDataEventcontext record {
    # The simple (string) identifier of an object
    SimpleidtypeV02 contextExpressionID?;
};

public type PersontypeV02Immigrationdocuments record {
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

# Sequence of a related entity when included in the collection or a group
public type SequencetypeV01 int;

# The ASSIGNED organizational unit is one for which the work assignment is doing work
public type AssignedOrganizationalUnitItem record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 typeCode?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
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

# These dates are related to the highest level legal relationship that a person has with the organization. If a given worker has multiple relationships with the organization, these are the dates associated with the primary relationship.
public type WorkerreadoutputWorkerdates record {
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

# Data which is transformed as a result of the event
public type WorkerReadTransform record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventReasonCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 eventStatusCode?;
    # The string reprersentation of the date-time value. Follows the ISO-8601:2000 format
    DatetimetypeV01 effectiveDateTime?;
    # Boolean expression
    IndicatortypeV01 notificationIndicator?;
    # The odata query string or some other supported query parameters.  These need to be url encoded
    string queryParameter?;
};

# A logical operation
public type WorkerreadeventmetaMetaLogicaloperators record {
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 logicalOperatorCode?;
    # Boolean expression
    IndicatortypeV01 mutuallyExclusiveIndicator?;
    # A list of mutually exclusive operator codes.
    SimplecodetypeV02[] mutuallyExclusiveLogicalOperatorCodes?;
};

# The URI of the related entity
public type UritypeV01 string;

# Event meta data
public type WorkerreadeventmetaMeta record {
    # The service domain, e.g HR, Payroll, Benefits, etc. This field is always present and valued based on a standard codelist.
    string '\/serviceCategoryCode\/codeValue;
    # This is the canonical name of the event, e.g. dependent.add, worker.hire. This field is always present and valued based on a standard codelist.
    string '\/eventNameCode\/codeValue;
    # A collection of query criteria
    WorkerreadQueryCriterion[] queryCriteria?;
    # Validation rules for the event context
    WorkerreadeventmetaMetaDataeventcontext '\/data\/eventContext?;
    # A collection of transform rules
    WorkerreadeventmetaMetaDatatransforms[] '\/data\/transforms?;
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

public type PersontypeV02Otherpersonaladdresses record {
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

# The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
public type CodetypeV02 record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
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

# A reference to the codelist extended with values
public type ValueSetType record {
    ValueSetMeta meta?;
    ValueSetItemType[] valueSetListItems?;
    LinktypeV02[] links?;
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

# The cost Center is used for taxing the costs of the related entity
public type CostcentertypeV02 record {
    # The simple (string) identifier of an object
    SimpleidtypeV02 costCenterID?;
    # The cost center name of the activity
    string costCenterName?;
    # A representation of a percentage value
    PercentagetypeV02 costCenterPercentage?;
};

# An associated labor union
public type LaboruniontypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 laborUnionCode?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 seniorityDate?;
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

# A representation of a rate percentage value
public type RatepercentagetypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The numeric value associated to the rate. In the example 5 US dollars per hour, the number 5 is the rate value. In the example 3 bags of rice per month, the number 3 is the rate value. In the example, 20 percent of annual sales, the percentageValue would be 20
    decimal percentageValue?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 baseUnitCode?;
};

# The base or primary pay (i.e. salary, wage) associated to a work assignment. The structure allows for the explicit communication of pre-defined equivalents for the base remuneration
public type WorkassignmentitemtypeV02Baseremuneration record {
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
    AssociatedRateQualifierType[] associatedRateQualifiers?;
    # The string representation of the date value. Follows the ISO-8601:2000 format
    DatetypeV01 effectiveDate?;
};

# The email URI of the related entity
public type EmailuritypeV02 string;

public type WorkassignmentitemtypeV02Occupationalclassifications record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 classificationCode?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

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

# A code indicating whether the work assignment is covered under applicable wage and labor laws relating to working hours, overtime, and similar protections, e.g. FLSA in the US
public type WagelawcoveragetypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 wageLawNameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 coverageCode?;
};

public type PersontypeV02Formernames record {
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

# The assigned work location is the location (or locations) where the worker is physically located.
public type WorkassignmentitemtypeV02Assignedworklocations record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # Communication objects to include various communication mechanisms, e,g, phone, email, etc.
    CommunicationtypeV02 communication?;
    # organization address objects / components
    OrganizationaddresstypeV02 address?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

public type AssignedGroup record {
    # The simple (string) identifier of an object
    SimpleidtypeV02 groupID?;
    # The name of the group
    string groupName?;
    # Associates that are part of the group(s) assigned to the review event.  The actor is the member that actually completes the event.
    AssignedGroupMember[] assignedGroupMembers?;
};
