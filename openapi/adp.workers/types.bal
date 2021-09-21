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

public type Meta record {
    *MetatypeV02;
};

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

# A simple (string) code.  Can have a code list reference
public type SimplecodetypeV02 string;

public type StringType record {
    # Indicator type
    IndicatorType readOnly?;
    # Indicator type
    IndicatorType optional?;
    # Indicator type
    IndicatorType hidden?;
    # Sequence type
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
    # Masking rule type
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
    ValueSetType valueSet?;
    # Links
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
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
    LinktypeV02 sameAsAddressLink?;
};

# Schema describing the details of a party - an agency, bureau, or other organization issuing the associated document; the body or persons exercising power or command. An issuing party is often is a government agency or official authority, but sometimes might be a private organization
public type PartybasetypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    # organization address objects / components
    OrganizationaddresstypeV02 address?;
};

# Argument
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

# The place a person was born. This can have taxation impacts.  Inlcudes certain address components
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

public type LinktypeV02Payloadarguments record {
    # Code value (typically a key field) of the code list item
    string argumentPath?;
    # Code value (typically a key field) of the code list item
    string argumentValue?;
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
    # Links
    LinkType[] links?;
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

public type NumberType record {
    # True indicates that the property is marked read only in the given context
    boolean readOnly?;
    # True indicates that this property does not need to be valued
    boolean optional?;
    # True indicates that the property is carried in the message - to and from the System of Record, but is not exposed in the UI
    boolean hidden?;
    # Sequence type
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
    # Masking rule type
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
    # Links
    LinkType[] dependencyLinks?;
};

# These dates are related to the highest level legal relationship that a person has with the organization. If a given worker has multiple relationships with the organization, these are the dates associated with the primary relationship.
public type WorkersWorkerdates record {
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
    # The place a person was born. This can have taxation impacts.  Inlcudes certain address components
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
    # Links
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

# A single query parameter
public type WorkersQueryCriterion record {
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
    # Code list
    CodelisttypeV03 queryValueCodeList?;
    # A collection of logical operators
    WorkersmetaLogicaloperators[] logicalOperators?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

public type CodeListType record {
    # Code list title
    string codeListTitle?;
    # Indicator type
    IndicatorType exclusiveIndicator?;
    # list items
    CodeListItemType[] listItems?;
    # Links
    LinkType[] links?;
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

# Sequence type
public type SequenceType int;

public type WorkersPhotos record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 nameCode?;
    LinktypeV02[] links?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
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

public type ObjectType record {
    # True indicates that the property is marked read only in the given context
    boolean readOnly?;
    # True indicates that this property does not need to be valued
    boolean optional?;
    # True indicates that the property is carried in the message - to and from the System of Record, but is not exposed in the UI
    boolean hidden?;
    # Sequence type
    SequenceType sequence?;
    # Specified on a target property.  If the passed conditions are true then this property is disallowed and therefore, not presented to a user.
    DisallowItemType[] disallow?;
    # List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
    DependencyListType dependencies?;
    # Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
    HelperMessageType helperMessage?;
    MetaDataType dataType?;
    # Dependency links
    LinkType[] dependencyLinks?;
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
    # Indicator type
    IndicatorType inactiveIndicator?;
    # Indicator type
    IndicatorType defaultIndicator?;
    # Links
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
    # Sequence type
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
    # Links
    LinkType[] dependencyLinks?;
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
    CodeListType codeList?;
    # Indicator type
    IndicatorType readOnly?;
    # Indicator type
    IndicatorType optional?;
    # Indicator type
    IndicatorType hidden?;
    # Sequence type
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
    # Masking rule type
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
    ValueSetType valueSet?;
    # Dependency links
    LinkType[] dependencyLinks?;
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
    # The formatted telephone number.  The component parts of the telephone are put together into a presentation pattern as defined by the regex format specified.  Please note that \ is used as an escape character in regex, but a double \ is needed to escape within the json schema.  The regex will accept +CC NNNNNNNNNNNNNN where + is the symbol indicating the caller to enter their country specific code to call from outside the country.  CC is the country code for an international number (optional), and the area code and dial number.  The local access code (i.e. 1 (201) 333 4444. 1 is the access code in US) is not passed.  The UI will present the phone number following its own presentation convention
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

public type BooleanSameAsAddressIndicatorType record {
    # True indicates that the property is marked read only in the given context
    boolean readOnly?;
    # True indicates that this property does not need to be valued
    boolean optional?;
    # True indicates that the property is carried in the message - to and from the System of Record, but is not exposed in the UI
    boolean hidden?;
    # Sequence type
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
    # Links
    LinkType[] dependencyLinks?;
    # Links
    LinkType[] links?;
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
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
    LinktypeV02 requestLink?;
    # Processing status of the related request message.
    ConfirmmessagetypeV01Processingstatuscode processingStatusCode?;
    # processMessage is optional and contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).  Most often there will be a single instance for an associated request or resource, but this structure allows for more than one if needed, for example, if multiple errors exist for a single resource. 
    ProcessmessageV01[] processMessages?;
    # resource Message contains the resource-specific processing results for resources being managed in the request.  A resource may have its processing reported as:  succeeded or failed.  It must be used to represent resource-specific messages.  In the case of a request managing multiple resources and resource-specific messages are to be returned, then this array will contain one object for each such resource of the request.
    ConfirmmessagetypeV01Resourcemessages[] resourceMessages?;
};

public type ArrayType record {
    # Indicates the minimum items required for an array type.  This is only relevant if the given property is an array.
    int minItems?;
    # Indicates the maximum items supported for an array type.  This is only relevant if the given property is an array.
    int maxItems?;
    # A list of properties which must have the exact same value within the array
    string[] sameValueProperties?;
    # A list of properties which together must be unique
    string[] uniqueProperties?;
    # Indicator type
    IndicatorType uniqueItems?;
    # List conditional dependencies of supported properties (readOnly, pattern, hidden, disallow etc.) of an attribute or an object. Dependencies can be defined using oneOf (OR) / allOf (AND) object. oneOf - successful if one of the conditions satisfies, allOf - successful if all the conditions satisfies. Refer API specification for dependencies context object syntax and rules. Dependencies context cannot be validated against context schema if dependencies is defined context JSON, because the dependencies JSON structure is dynamically defined for attributes and the not defined in the context schema. Attribute level properties and dependencies properties are mutually exclusive, example - readOnly property can be set either at attribute level or inside dependencies. If both hidden and disallow properties are set inside dependencies or at attribute level, hidden property takes precedence.
    DependencyListType dependencies?;
    # Helper text provided to the user when they take an action to affirm to be correct, true, or genuine.
    HelperMessageType helperMessage?;
    MetaDataType dataType?;
    # Link type
    LinkType[] dependencyLinks?;
};

public type MetaData record {
    WorkersMeta meta?;
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
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    LinktypeV02[] links?;
    # Representation of a message.
    MessagetypeV01 userMessage?;
    # Representation of a message.
    MessagetypeV01 developerMessage?;
};

# A logical operation
public type WorkersmetaLogicaloperators record {
    # A simple (string) code.  Can have a code list reference
    SimplecodetypeV02 logicalOperatorCode?;
    # Boolean expression
    IndicatortypeV01 mutuallyExclusiveIndicator?;
    # A list of mutually exclusive operator codes.
    SimplecodetypeV02[] mutuallyExclusiveLogicalOperatorCodes?;
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
    # Assignment cost centers
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
    # A list of pay compensations associated to a given work assignment.  Additional remuneration includes all other forms of compensation beyond the base pay associated to a given work assignment.  The typeCode is used to further refine the type of compensation, e.g. bonus, commission, etc.
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
    # Links
    LinktypeV02[] links?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# Simple ID type
public type SimpleIDType string;

# A unique identifier of an object within the collection
public type ItemIDType string;

# The ratio
public type RatiotypeV02 decimal;

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
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
    LinktypeV02[] links?;
};

# Masking rule type
public type MaskingRuleType record {
    # Indicator type
    IndicatorType authorizationRequiredIndicator?;
    # Simple ID type
    SimpleIDType authorizationResourceID?;
    # Links
    LinkType[] links?;
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

public type ConfirmMessage record {
    *ConfirmmessagetypeV01;
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
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
    LinktypeV02 resourceLink?;
    # processMessage is optional and contains processing information for either the request (at the ConfirmMessage level) or a resource being managed in the request (at the ResourceMessage level).  Most often there will be a single instance for an associated request or resource, but this structure allows for more than one if needed, for example, if multiple errors exist for a single resource. 
    ProcessMessageWithResourceStatusCode[] processMessages?;
};

# A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
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
    # Payload arguments
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

public type Workers record {
    WorkersWorkers[] workers?;
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

# Code list
public type CodelisttypeV03 record {
    # Code list title
    string codeListTitle?;
    # Boolean expression
    IndicatortypeV01 exclusiveIndicator?;
    # Code list items
    CodelistitemtypeV02[] listItems?;
    # Links
    LinktypeV02[] links?;
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

public type WorkersMeta record {
    # A collection of query criteria
    WorkersQueryCriterion[] queryCriteria?;
    ArrayType '\/workers?;
    StringType '\/workers\/associateOID?;
    ObjectType '\/workers\/workerID?;
    StringType '\/workers\/workerID\/idValue?;
    StringCodeListType '\/workers\/workerID\/schemeCode?;
    StringType '\/workers\/workerID\/schemeCode\/codeValue?;
    StringType '\/workers\/workerID\/schemeCode\/shortName?;
    StringType '\/workers\/workerID\/schemeCode\/longName?;
    ObjectType '\/workers\/person?;
    ArrayType '\/workers\/person\/governmentIDs?;
    StringType '\/workers\/person\/governmentIDs\/idValue?;
    StringCodeListType '\/workers\/person\/governmentIDs\/nameCode?;
    StringType '\/workers\/person\/governmentIDs\/nameCode\/codeValue?;
    StringType '\/workers\/person\/governmentIDs\/nameCode\/shortName?;
    StringType '\/workers\/person\/governmentIDs\/nameCode\/longName?;
    StringCodeListType '\/workers\/person\/governmentIDs\/countryCode?;
    StringCodeListType '\/workers\/person\/governmentIDs\/statusCode?;
    StringType '\/workers\/person\/governmentIDs\/statusCode\/codeValue?;
    StringType '\/workers\/person\/governmentIDs\/statusCode\/shortName?;
    StringType '\/workers\/person\/governmentIDs\/statusCode\/longName?;
    StringType '\/workers\/person\/governmentIDs\/statusCode\/effectiveDate?;
    StringType '\/workers\/person\/governmentIDs\/expirationDate?;
    StringType '\/workers\/person\/governmentIDs\/itemID?;
    ObjectType '\/workers\/person\/legalName?;
    StringType '\/workers\/person\/legalName\/givenName?;
    StringType '\/workers\/person\/legalName\/middleName?;
    StringType '\/workers\/person\/legalName\/familyName1?;
    StringType '\/workers\/person\/legalName\/familyName2?;
    StringType '\/workers\/person\/legalName\/formattedName?;
    StringCodeListType '\/workers\/person\/legalName\/nameCode?;
    StringType '\/workers\/person\/legalName\/nameCode\/codeValue?;
    StringType '\/workers\/person\/legalName\/nameCode\/shortName?;
    StringType '\/workers\/person\/legalName\/nameCode\/longName?;
    StringCodeListType '\/workers\/person\/legalName\/scriptCode?;
    StringType '\/workers\/person\/legalName\/scriptCode\/codeValue?;
    StringType '\/workers\/person\/legalName\/scriptCode\/shortName?;
    StringType '\/workers\/person\/legalName\/scriptCode\/longName?;
    ArrayType '\/workers\/person\/legalName\/preferredSalutations?;
    StringCodeListType '\/workers\/person\/legalName\/preferredSalutations\/salutationCode?;
    StringType '\/workers\/person\/legalName\/preferredSalutations\/salutationCode\/codeValue?;
    StringType '\/workers\/person\/legalName\/preferredSalutations\/salutationCode\/shortName?;
    StringType '\/workers\/person\/legalName\/preferredSalutations\/salutationCode\/longName?;
    StringCodeListType '\/workers\/person\/legalName\/preferredSalutations\/typeCode?;
    StringType '\/workers\/person\/legalName\/preferredSalutations\/typeCode\/codeValue?;
    StringType '\/workers\/person\/legalName\/preferredSalutations\/typeCode\/shortName?;
    StringType '\/workers\/person\/legalName\/preferredSalutations\/typeCode\/longName?;
    NumberType '\/workers\/person\/legalName\/preferredSalutations\/sequenceNumber?;
    ArrayType '\/workers\/person\/legalName\/titlePrefixCodes?;
    StringCodeListType '\/workers\/person\/legalName\/titlePrefixCodes\/affixCode?;
    StringType '\/workers\/person\/legalName\/titlePrefixCodes\/affixCode\/codeValue?;
    StringType '\/workers\/person\/legalName\/titlePrefixCodes\/affixCode\/shortName?;
    StringType '\/workers\/person\/legalName\/titlePrefixCodes\/affixCode\/longName?;
    NumberType '\/workers\/person\/legalName\/titlePrefixCodes\/sequenceNumber?;
    StringType '\/workers\/person\/legalName\/nickName?;
    StringCodeListType '\/workers\/person\/legalName\/generationAffixCode?;
    StringType '\/workers\/person\/legalName\/generationAffixCode\/codeValue?;
    StringType '\/workers\/person\/legalName\/generationAffixCode\/shortName?;
    StringType '\/workers\/person\/legalName\/generationAffixCode\/longName?;
    StringCodeListType '\/workers\/person\/legalName\/qualificationAffixCode?;
    StringType '\/workers\/person\/legalName\/qualificationAffixCode\/codeValue?;
    StringType '\/workers\/person\/legalName\/qualificationAffixCode\/shortName?;
    StringType '\/workers\/person\/legalName\/qualificationAffixCode\/longName?;
    ArrayType '\/workers\/person\/legalName\/titleAffixCodes?;
    StringCodeListType '\/workers\/person\/legalName\/titleAffixCodes\/affixCode?;
    StringType '\/workers\/person\/legalName\/titleAffixCodes\/affixCode\/codeValue?;
    StringType '\/workers\/person\/legalName\/titleAffixCodes\/affixCode\/shortName?;
    StringType '\/workers\/person\/legalName\/titleAffixCodes\/affixCode\/longName?;
    NumberType '\/workers\/person\/legalName\/titleAffixCodes\/sequenceNumber?;
    StringType '\/workers\/person\/legalName\/familyName1Prefix?;
    StringType '\/workers\/person\/legalName\/familyName2Prefix?;
    StringType '\/workers\/person\/legalName\/initials?;
    ObjectType '\/workers\/person\/legalAddress?;
    StringCodeListType '\/workers\/person\/legalAddress\/nameCode?;
    StringType '\/workers\/person\/legalAddress\/nameCode\/codeValue?;
    StringType '\/workers\/person\/legalAddress\/nameCode\/shortName?;
    StringType '\/workers\/person\/legalAddress\/nameCode\/longName?;
    StringType '\/workers\/person\/legalAddress\/attentionOfName?;
    StringType '\/workers\/person\/legalAddress\/careOfName?;
    StringType '\/workers\/person\/legalAddress\/lineOne?;
    StringType '\/workers\/person\/legalAddress\/lineTwo?;
    StringType '\/workers\/person\/legalAddress\/lineThree?;
    StringType '\/workers\/person\/legalAddress\/cityName?;
    StringCodeListType '\/workers\/person\/legalAddress\/countrySubdivisionLevel1?;
    StringType '\/workers\/person\/legalAddress\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/workers\/person\/legalAddress\/countrySubdivisionLevel1\/shortName?;
    StringType '\/workers\/person\/legalAddress\/countrySubdivisionLevel1\/longName?;
    StringType '\/workers\/person\/legalAddress\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/workers\/person\/legalAddress\/countryCode?;
    StringCodeListType '\/workers\/person\/legalAddress\/postalCode?;
    ObjectType '\/workers\/person\/legalAddress\/geoCoordinate?;
    NumberType '\/workers\/person\/legalAddress\/geoCoordinate\/latitude?;
    NumberType '\/workers\/person\/legalAddress\/geoCoordinate\/longitude?;
    StringCodeListType '\/workers\/person\/legalAddress\/scriptCode?;
    StringType '\/workers\/person\/legalAddress\/scriptCode\/codeValue?;
    StringType '\/workers\/person\/legalAddress\/scriptCode\/shortName?;
    StringType '\/workers\/person\/legalAddress\/scriptCode\/longName?;
    StringType '\/workers\/person\/legalAddress\/lineFour?;
    StringType '\/workers\/person\/legalAddress\/lineFive?;
    StringType '\/workers\/person\/legalAddress\/buildingNumber?;
    StringType '\/workers\/person\/legalAddress\/buildingName?;
    StringType '\/workers\/person\/legalAddress\/blockName?;
    StringType '\/workers\/person\/legalAddress\/streetName?;
    StringCodeListType '\/workers\/person\/legalAddress\/streetTypeCode?;
    StringType '\/workers\/person\/legalAddress\/streetTypeCode\/codeValue?;
    StringType '\/workers\/person\/legalAddress\/streetTypeCode\/shortName?;
    StringType '\/workers\/person\/legalAddress\/streetTypeCode\/longName?;
    StringType '\/workers\/person\/legalAddress\/unit?;
    StringType '\/workers\/person\/legalAddress\/floor?;
    StringType '\/workers\/person\/legalAddress\/stairCase?;
    StringType '\/workers\/person\/legalAddress\/door?;
    StringType '\/workers\/person\/legalAddress\/postOfficeBox?;
    StringType '\/workers\/person\/legalAddress\/deliveryPoint?;
    StringType '\/workers\/person\/legalAddress\/plotID?;
    StringCodeListType '\/workers\/person\/legalAddress\/countrySubdivisionLevel2?;
    StringType '\/workers\/person\/legalAddress\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/workers\/person\/legalAddress\/countrySubdivisionLevel2\/shortName?;
    StringType '\/workers\/person\/legalAddress\/countrySubdivisionLevel2\/longName?;
    StringType '\/workers\/person\/legalAddress\/countrySubdivisionLevel2\/subdivisionType?;
    BooleanSameAsAddressIndicatorType '\/workers\/person\/legalAddress\/sameAsAddressIndicator?;
    ObjectType '\/workers\/person\/legalAddress\/sameAsAddressLink?;
    StringType '\/workers\/person\/legalAddress\/sameAsAddressLink\/href?;
    StringType '\/workers\/person\/legalAddress\/sameAsAddressLink\/rel?;
    StringType '\/workers\/person\/legalAddress\/sameAsAddressLink\/canonicalUri?;
    StringType '\/workers\/person\/legalAddress\/sameAsAddressLink\/title?;
    StringType '\/workers\/person\/legalAddress\/sameAsAddressLink\/targetSchema?;
    StringType '\/workers\/person\/legalAddress\/sameAsAddressLink\/mediaType?;
    StringType '\/workers\/person\/legalAddress\/sameAsAddressLink\/method?;
    StringType '\/workers\/person\/legalAddress\/sameAsAddressLink\/encType?;
    StringType '\/workers\/person\/legalAddress\/sameAsAddressLink\/schema?;
    ArrayType '\/workers\/person\/legalAddress\/sameAsAddressLink\/payLoadArguments?;
    StringType '\/workers\/person\/legalAddress\/sameAsAddressLink\/payLoadArguments\/argumentPath?;
    StringType '\/workers\/person\/legalAddress\/sameAsAddressLink\/payLoadArguments\/argumentValue?;
    ObjectType '\/workers\/person\/communication?;
    ArrayType '\/workers\/person\/communication\/landlines?;
    StringCodeListType '\/workers\/person\/communication\/landlines\/nameCode?;
    StringType '\/workers\/person\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/workers\/person\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/workers\/person\/communication\/landlines\/nameCode\/longName?;
    StringType '\/workers\/person\/communication\/landlines\/countryDialing?;
    StringType '\/workers\/person\/communication\/landlines\/areaDialing?;
    StringType '\/workers\/person\/communication\/landlines\/dialNumber?;
    StringType '\/workers\/person\/communication\/landlines\/extension?;
    StringType '\/workers\/person\/communication\/landlines\/access?;
    StringType '\/workers\/person\/communication\/landlines\/formattedNumber?;
    StringType '\/workers\/person\/communication\/landlines\/itemID?;
    BooleanType '\/workers\/person\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/workers\/person\/communication\/mobiles?;
    StringCodeListType '\/workers\/person\/communication\/mobiles\/nameCode?;
    StringType '\/workers\/person\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/workers\/person\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/workers\/person\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/workers\/person\/communication\/mobiles\/countryDialing?;
    StringType '\/workers\/person\/communication\/mobiles\/areaDialing?;
    StringType '\/workers\/person\/communication\/mobiles\/dialNumber?;
    StringType '\/workers\/person\/communication\/mobiles\/extension?;
    StringType '\/workers\/person\/communication\/mobiles\/access?;
    StringType '\/workers\/person\/communication\/mobiles\/formattedNumber?;
    StringType '\/workers\/person\/communication\/mobiles\/itemID?;
    BooleanType '\/workers\/person\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/workers\/person\/communication\/emails?;
    StringCodeListType '\/workers\/person\/communication\/emails\/nameCode?;
    StringType '\/workers\/person\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/workers\/person\/communication\/emails\/nameCode\/shortName?;
    StringType '\/workers\/person\/communication\/emails\/nameCode\/longName?;
    StringType '\/workers\/person\/communication\/emails\/emailUri?;
    StringType '\/workers\/person\/communication\/emails\/itemID?;
    BooleanType '\/workers\/person\/communication\/emails\/notificationIndicator?;
    ArrayType '\/workers\/person\/communication\/socialNetworks?;
    StringCodeListType '\/workers\/person\/communication\/socialNetworks\/nameCode?;
    StringType '\/workers\/person\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/workers\/person\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/workers\/person\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/workers\/person\/communication\/socialNetworks\/uri?;
    StringType '\/workers\/person\/communication\/socialNetworks\/itemID?;
    BooleanType '\/workers\/person\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/workers\/person\/communication\/faxes?;
    StringCodeListType '\/workers\/person\/communication\/faxes\/nameCode?;
    StringType '\/workers\/person\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/workers\/person\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/workers\/person\/communication\/faxes\/nameCode\/longName?;
    StringType '\/workers\/person\/communication\/faxes\/countryDialing?;
    StringType '\/workers\/person\/communication\/faxes\/areaDialing?;
    StringType '\/workers\/person\/communication\/faxes\/dialNumber?;
    StringType '\/workers\/person\/communication\/faxes\/extension?;
    StringType '\/workers\/person\/communication\/faxes\/access?;
    StringType '\/workers\/person\/communication\/faxes\/formattedNumber?;
    StringType '\/workers\/person\/communication\/faxes\/itemID?;
    BooleanType '\/workers\/person\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/workers\/person\/communication\/pagers?;
    StringCodeListType '\/workers\/person\/communication\/pagers\/nameCode?;
    StringType '\/workers\/person\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/workers\/person\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/workers\/person\/communication\/pagers\/nameCode\/longName?;
    StringType '\/workers\/person\/communication\/pagers\/countryDialing?;
    StringType '\/workers\/person\/communication\/pagers\/areaDialing?;
    StringType '\/workers\/person\/communication\/pagers\/dialNumber?;
    StringType '\/workers\/person\/communication\/pagers\/extension?;
    StringType '\/workers\/person\/communication\/pagers\/access?;
    StringType '\/workers\/person\/communication\/pagers\/formattedNumber?;
    StringType '\/workers\/person\/communication\/pagers\/itemID?;
    BooleanType '\/workers\/person\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/workers\/person\/communication\/internetAddresses?;
    StringCodeListType '\/workers\/person\/communication\/internetAddresses\/nameCode?;
    StringType '\/workers\/person\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/workers\/person\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/workers\/person\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/workers\/person\/communication\/internetAddresses\/uri?;
    StringType '\/workers\/person\/communication\/internetAddresses\/itemID?;
    ArrayType '\/workers\/person\/communication\/instantMessages?;
    StringCodeListType '\/workers\/person\/communication\/instantMessages\/nameCode?;
    StringType '\/workers\/person\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/workers\/person\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/workers\/person\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/workers\/person\/communication\/instantMessages\/uri?;
    StringType '\/workers\/person\/communication\/instantMessages\/itemID?;
    BooleanType '\/workers\/person\/communication\/instantMessages\/notificationIndicator?;
    StringType '\/workers\/person\/birthDate?;
    BooleanType '\/workers\/person\/deceasedIndicator?;
    StringType '\/workers\/person\/deathDate?;
    StringCodeListType '\/workers\/person\/genderCode?;
    StringType '\/workers\/person\/genderCode\/codeValue?;
    StringType '\/workers\/person\/genderCode\/shortName?;
    StringType '\/workers\/person\/genderCode\/longName?;
    StringCodeListType '\/workers\/person\/genderIdentityCode?;
    StringType '\/workers\/person\/genderIdentityCode\/codeValue?;
    StringType '\/workers\/person\/genderIdentityCode\/shortName?;
    StringType '\/workers\/person\/genderIdentityCode\/longName?;
    StringCodeListType '\/workers\/person\/sexualOrientationCode?;
    StringType '\/workers\/person\/sexualOrientationCode\/codeValue?;
    StringType '\/workers\/person\/sexualOrientationCode\/shortName?;
    StringType '\/workers\/person\/sexualOrientationCode\/longName?;
    StringCodeListType '\/workers\/person\/religionCode?;
    StringType '\/workers\/person\/religionCode\/codeValue?;
    StringType '\/workers\/person\/religionCode\/shortName?;
    StringType '\/workers\/person\/religionCode\/longName?;
    StringCodeListType '\/workers\/person\/maritalStatusCode?;
    StringType '\/workers\/person\/maritalStatusCode\/codeValue?;
    StringType '\/workers\/person\/maritalStatusCode\/shortName?;
    StringType '\/workers\/person\/maritalStatusCode\/longName?;
    StringType '\/workers\/person\/maritalStatusCode\/effectiveDate?;
    ArrayType '\/workers\/person\/socialInsurancePrograms?;
    StringCodeListType '\/workers\/person\/socialInsurancePrograms\/nameCode?;
    StringType '\/workers\/person\/socialInsurancePrograms\/nameCode\/codeValue?;
    StringType '\/workers\/person\/socialInsurancePrograms\/nameCode\/shortName?;
    StringType '\/workers\/person\/socialInsurancePrograms\/nameCode\/longName?;
    StringCodeListType '\/workers\/person\/socialInsurancePrograms\/countryCode?;
    BooleanType '\/workers\/person\/socialInsurancePrograms\/coveredIndicator?;
    ObjectType '\/workers\/person\/socialInsurancePrograms\/coveragePeriod?;
    StringType '\/workers\/person\/socialInsurancePrograms\/coveragePeriod\/startDate?;
    StringType '\/workers\/person\/socialInsurancePrograms\/coveragePeriod\/endDate?;
    StringType '\/workers\/person\/socialInsurancePrograms\/itemID?;
    BooleanType '\/workers\/person\/tobaccoUserIndicator?;
    BooleanType '\/workers\/person\/disabilityIdentificationDeclinedIndicator?;
    BooleanType '\/workers\/person\/disabledIndicator?;
    StringCodeListType '\/workers\/person\/disabilityTypeCodes?;
    StringType '\/workers\/person\/disabilityTypeCodes\/codeValue?;
    StringType '\/workers\/person\/disabilityTypeCodes\/shortName?;
    StringType '\/workers\/person\/disabilityTypeCodes\/longName?;
    NumberType '\/workers\/person\/disabilityPercentage?;
    BooleanType '\/workers\/person\/studentIndicator?;
    StringCodeListType '\/workers\/person\/studentStatusCode?;
    StringType '\/workers\/person\/studentStatusCode\/codeValue?;
    StringType '\/workers\/person\/studentStatusCode\/shortName?;
    StringType '\/workers\/person\/studentStatusCode\/longName?;
    StringType '\/workers\/person\/studentStatusCode\/effectiveDate?;
    ArrayType '\/workers\/person\/identityDocuments?;
    StringType '\/workers\/person\/identityDocuments\/documentID?;
    StringCodeListType '\/workers\/person\/identityDocuments\/countryCode?;
    StringCodeListType '\/workers\/person\/identityDocuments\/typeCode?;
    StringType '\/workers\/person\/identityDocuments\/typeCode\/codeValue?;
    StringType '\/workers\/person\/identityDocuments\/typeCode\/shortName?;
    StringType '\/workers\/person\/identityDocuments\/typeCode\/longName?;
    ObjectType '\/workers\/person\/identityDocuments\/issuingParty?;
    StringCodeListType '\/workers\/person\/identityDocuments\/issuingParty\/nameCode?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/nameCode\/codeValue?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/nameCode\/shortName?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/nameCode\/longName?;
    ObjectType '\/workers\/person\/identityDocuments\/issuingParty\/address?;
    StringCodeListType '\/workers\/person\/identityDocuments\/issuingParty\/address\/nameCode?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/nameCode\/codeValue?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/nameCode\/shortName?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/nameCode\/longName?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/attentionOfName?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/careOfName?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/lineOne?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/lineTwo?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/lineThree?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/cityName?;
    StringCodeListType '\/workers\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel1?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/workers\/person\/identityDocuments\/issuingParty\/address\/countryCode?;
    StringCodeListType '\/workers\/person\/identityDocuments\/issuingParty\/address\/postalCode?;
    ObjectType '\/workers\/person\/identityDocuments\/issuingParty\/address\/geoCoordinate?;
    NumberType '\/workers\/person\/identityDocuments\/issuingParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/workers\/person\/identityDocuments\/issuingParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/workers\/person\/identityDocuments\/issuingParty\/address\/scriptCode?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/scriptCode\/codeValue?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/scriptCode\/shortName?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/scriptCode\/longName?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/lineFour?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/lineFive?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/buildingNumber?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/buildingName?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/blockName?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/streetName?;
    StringCodeListType '\/workers\/person\/identityDocuments\/issuingParty\/address\/streetTypeCode?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/streetTypeCode\/shortName?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/streetTypeCode\/longName?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/unit?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/floor?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/stairCase?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/door?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/postOfficeBox?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/deliveryPoint?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/plotID?;
    StringCodeListType '\/workers\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel2?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/workers\/person\/identityDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    StringType '\/workers\/person\/identityDocuments\/issueDate?;
    StringType '\/workers\/person\/identityDocuments\/expirationDate?;
    StringType '\/workers\/person\/identityDocuments\/itemID?;
    ArrayType '\/workers\/person\/immigrationDocuments?;
    StringType '\/workers\/person\/immigrationDocuments\/documentID?;
    StringCodeListType '\/workers\/person\/immigrationDocuments\/countryCode?;
    StringCodeListType '\/workers\/person\/immigrationDocuments\/typeCode?;
    StringType '\/workers\/person\/immigrationDocuments\/typeCode\/codeValue?;
    StringType '\/workers\/person\/immigrationDocuments\/typeCode\/shortName?;
    StringType '\/workers\/person\/immigrationDocuments\/typeCode\/longName?;
    ObjectType '\/workers\/person\/immigrationDocuments\/issuingParty?;
    StringCodeListType '\/workers\/person\/immigrationDocuments\/issuingParty\/nameCode?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/nameCode\/codeValue?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/nameCode\/shortName?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/nameCode\/longName?;
    ObjectType '\/workers\/person\/immigrationDocuments\/issuingParty\/address?;
    StringCodeListType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/nameCode?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/nameCode\/codeValue?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/nameCode\/shortName?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/nameCode\/longName?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/attentionOfName?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/careOfName?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/lineOne?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/lineTwo?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/lineThree?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/cityName?;
    StringCodeListType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel1?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/countryCode?;
    StringCodeListType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/postalCode?;
    ObjectType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/geoCoordinate?;
    NumberType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/scriptCode?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/scriptCode\/codeValue?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/scriptCode\/shortName?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/scriptCode\/longName?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/lineFour?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/lineFive?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/buildingNumber?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/buildingName?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/blockName?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/streetName?;
    StringCodeListType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/streetTypeCode?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/streetTypeCode\/shortName?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/streetTypeCode\/longName?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/unit?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/floor?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/stairCase?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/door?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/postOfficeBox?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/deliveryPoint?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/plotID?;
    StringCodeListType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel2?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/workers\/person\/immigrationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    StringType '\/workers\/person\/immigrationDocuments\/issueDate?;
    StringType '\/workers\/person\/immigrationDocuments\/expirationDate?;
    StringType '\/workers\/person\/immigrationDocuments\/authorizedStayDuration?;
    StringType '\/workers\/person\/immigrationDocuments\/reentryRequirementDuration?;
    StringType '\/workers\/person\/immigrationDocuments\/itemID?;
    ArrayType '\/workers\/person\/passports?;
    StringType '\/workers\/person\/passports\/documentID?;
    StringCodeListType '\/workers\/person\/passports\/countryCode?;
    StringCodeListType '\/workers\/person\/passports\/typeCode?;
    StringType '\/workers\/person\/passports\/typeCode\/codeValue?;
    StringType '\/workers\/person\/passports\/typeCode\/shortName?;
    StringType '\/workers\/person\/passports\/typeCode\/longName?;
    ObjectType '\/workers\/person\/passports\/issuingParty?;
    StringCodeListType '\/workers\/person\/passports\/issuingParty\/nameCode?;
    StringType '\/workers\/person\/passports\/issuingParty\/nameCode\/codeValue?;
    StringType '\/workers\/person\/passports\/issuingParty\/nameCode\/shortName?;
    StringType '\/workers\/person\/passports\/issuingParty\/nameCode\/longName?;
    ObjectType '\/workers\/person\/passports\/issuingParty\/address?;
    StringCodeListType '\/workers\/person\/passports\/issuingParty\/address\/nameCode?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/nameCode\/codeValue?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/nameCode\/shortName?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/nameCode\/longName?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/attentionOfName?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/careOfName?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/lineOne?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/lineTwo?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/lineThree?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/cityName?;
    StringCodeListType '\/workers\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel1?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/workers\/person\/passports\/issuingParty\/address\/countryCode?;
    StringCodeListType '\/workers\/person\/passports\/issuingParty\/address\/postalCode?;
    ObjectType '\/workers\/person\/passports\/issuingParty\/address\/geoCoordinate?;
    NumberType '\/workers\/person\/passports\/issuingParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/workers\/person\/passports\/issuingParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/workers\/person\/passports\/issuingParty\/address\/scriptCode?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/scriptCode\/codeValue?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/scriptCode\/shortName?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/scriptCode\/longName?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/lineFour?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/lineFive?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/buildingNumber?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/buildingName?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/blockName?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/streetName?;
    StringCodeListType '\/workers\/person\/passports\/issuingParty\/address\/streetTypeCode?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/streetTypeCode\/shortName?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/streetTypeCode\/longName?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/unit?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/floor?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/stairCase?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/door?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/postOfficeBox?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/deliveryPoint?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/plotID?;
    StringCodeListType '\/workers\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel2?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/workers\/person\/passports\/issuingParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    StringType '\/workers\/person\/passports\/issueDate?;
    StringType '\/workers\/person\/passports\/expirationDate?;
    StringType '\/workers\/person\/passports\/itemID?;
    ArrayType '\/workers\/person\/workAuthorizationDocuments?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/documentID?;
    StringCodeListType '\/workers\/person\/workAuthorizationDocuments\/countryCode?;
    StringCodeListType '\/workers\/person\/workAuthorizationDocuments\/typeCode?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/typeCode\/codeValue?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/typeCode\/shortName?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/typeCode\/longName?;
    ObjectType '\/workers\/person\/workAuthorizationDocuments\/issuingParty?;
    StringCodeListType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/nameCode?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/nameCode\/codeValue?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/nameCode\/shortName?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/nameCode\/longName?;
    ObjectType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address?;
    StringCodeListType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/nameCode?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/nameCode\/codeValue?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/nameCode\/shortName?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/nameCode\/longName?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/attentionOfName?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/careOfName?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/lineOne?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/lineTwo?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/lineThree?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/cityName?;
    StringCodeListType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel1?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/countryCode?;
    StringCodeListType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/postalCode?;
    ObjectType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/geoCoordinate?;
    NumberType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/geoCoordinate\/latitude?;
    NumberType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/scriptCode?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/scriptCode\/codeValue?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/scriptCode\/shortName?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/scriptCode\/longName?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/lineFour?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/lineFive?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/buildingNumber?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/buildingName?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/blockName?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/streetName?;
    StringCodeListType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/streetTypeCode?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/streetTypeCode\/codeValue?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/streetTypeCode\/shortName?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/streetTypeCode\/longName?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/unit?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/floor?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/stairCase?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/door?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/postOfficeBox?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/deliveryPoint?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/plotID?;
    StringCodeListType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel2?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issuingParty\/address\/countrySubdivisionLevel2\/subdivisionType?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/issueDate?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/expirationDate?;
    StringType '\/workers\/person\/workAuthorizationDocuments\/itemID?;
    ObjectType '\/workers\/person\/preferredName?;
    StringType '\/workers\/person\/preferredName\/givenName?;
    StringType '\/workers\/person\/preferredName\/middleName?;
    StringType '\/workers\/person\/preferredName\/familyName1?;
    StringType '\/workers\/person\/preferredName\/familyName2?;
    StringType '\/workers\/person\/preferredName\/formattedName?;
    StringCodeListType '\/workers\/person\/preferredName\/nameCode?;
    StringType '\/workers\/person\/preferredName\/nameCode\/codeValue?;
    StringType '\/workers\/person\/preferredName\/nameCode\/shortName?;
    StringType '\/workers\/person\/preferredName\/nameCode\/longName?;
    StringCodeListType '\/workers\/person\/preferredName\/scriptCode?;
    StringType '\/workers\/person\/preferredName\/scriptCode\/codeValue?;
    StringType '\/workers\/person\/preferredName\/scriptCode\/shortName?;
    StringType '\/workers\/person\/preferredName\/scriptCode\/longName?;
    ArrayType '\/workers\/person\/preferredName\/preferredSalutations?;
    StringCodeListType '\/workers\/person\/preferredName\/preferredSalutations\/salutationCode?;
    StringType '\/workers\/person\/preferredName\/preferredSalutations\/salutationCode\/codeValue?;
    StringType '\/workers\/person\/preferredName\/preferredSalutations\/salutationCode\/shortName?;
    StringType '\/workers\/person\/preferredName\/preferredSalutations\/salutationCode\/longName?;
    StringCodeListType '\/workers\/person\/preferredName\/preferredSalutations\/typeCode?;
    StringType '\/workers\/person\/preferredName\/preferredSalutations\/typeCode\/codeValue?;
    StringType '\/workers\/person\/preferredName\/preferredSalutations\/typeCode\/shortName?;
    StringType '\/workers\/person\/preferredName\/preferredSalutations\/typeCode\/longName?;
    NumberType '\/workers\/person\/preferredName\/preferredSalutations\/sequenceNumber?;
    ArrayType '\/workers\/person\/preferredName\/titlePrefixCodes?;
    StringCodeListType '\/workers\/person\/preferredName\/titlePrefixCodes\/affixCode?;
    StringType '\/workers\/person\/preferredName\/titlePrefixCodes\/affixCode\/codeValue?;
    StringType '\/workers\/person\/preferredName\/titlePrefixCodes\/affixCode\/shortName?;
    StringType '\/workers\/person\/preferredName\/titlePrefixCodes\/affixCode\/longName?;
    NumberType '\/workers\/person\/preferredName\/titlePrefixCodes\/sequenceNumber?;
    StringType '\/workers\/person\/preferredName\/nickName?;
    StringCodeListType '\/workers\/person\/preferredName\/generationAffixCode?;
    StringType '\/workers\/person\/preferredName\/generationAffixCode\/codeValue?;
    StringType '\/workers\/person\/preferredName\/generationAffixCode\/shortName?;
    StringType '\/workers\/person\/preferredName\/generationAffixCode\/longName?;
    StringCodeListType '\/workers\/person\/preferredName\/qualificationAffixCode?;
    StringType '\/workers\/person\/preferredName\/qualificationAffixCode\/codeValue?;
    StringType '\/workers\/person\/preferredName\/qualificationAffixCode\/shortName?;
    StringType '\/workers\/person\/preferredName\/qualificationAffixCode\/longName?;
    ArrayType '\/workers\/person\/preferredName\/titleAffixCodes?;
    StringCodeListType '\/workers\/person\/preferredName\/titleAffixCodes\/affixCode?;
    StringType '\/workers\/person\/preferredName\/titleAffixCodes\/affixCode\/codeValue?;
    StringType '\/workers\/person\/preferredName\/titleAffixCodes\/affixCode\/shortName?;
    StringType '\/workers\/person\/preferredName\/titleAffixCodes\/affixCode\/longName?;
    NumberType '\/workers\/person\/preferredName\/titleAffixCodes\/sequenceNumber?;
    StringType '\/workers\/person\/preferredName\/familyName1Prefix?;
    StringType '\/workers\/person\/preferredName\/familyName2Prefix?;
    StringType '\/workers\/person\/preferredName\/initials?;
    ArrayType '\/workers\/person\/alternatePreferredNames?;
    StringType '\/workers\/person\/alternatePreferredNames\/givenName?;
    StringType '\/workers\/person\/alternatePreferredNames\/middleName?;
    StringType '\/workers\/person\/alternatePreferredNames\/familyName1?;
    StringType '\/workers\/person\/alternatePreferredNames\/familyName2?;
    StringType '\/workers\/person\/alternatePreferredNames\/formattedName?;
    StringCodeListType '\/workers\/person\/alternatePreferredNames\/nameCode?;
    StringType '\/workers\/person\/alternatePreferredNames\/nameCode\/codeValue?;
    StringType '\/workers\/person\/alternatePreferredNames\/nameCode\/shortName?;
    StringType '\/workers\/person\/alternatePreferredNames\/nameCode\/longName?;
    StringCodeListType '\/workers\/person\/alternatePreferredNames\/scriptCode?;
    StringType '\/workers\/person\/alternatePreferredNames\/scriptCode\/codeValue?;
    StringType '\/workers\/person\/alternatePreferredNames\/scriptCode\/shortName?;
    StringType '\/workers\/person\/alternatePreferredNames\/scriptCode\/longName?;
    ArrayType '\/workers\/person\/alternatePreferredNames\/preferredSalutations?;
    StringCodeListType '\/workers\/person\/alternatePreferredNames\/preferredSalutations\/salutationCode?;
    StringType '\/workers\/person\/alternatePreferredNames\/preferredSalutations\/salutationCode\/codeValue?;
    StringType '\/workers\/person\/alternatePreferredNames\/preferredSalutations\/salutationCode\/shortName?;
    StringType '\/workers\/person\/alternatePreferredNames\/preferredSalutations\/salutationCode\/longName?;
    StringCodeListType '\/workers\/person\/alternatePreferredNames\/preferredSalutations\/typeCode?;
    StringType '\/workers\/person\/alternatePreferredNames\/preferredSalutations\/typeCode\/codeValue?;
    StringType '\/workers\/person\/alternatePreferredNames\/preferredSalutations\/typeCode\/shortName?;
    StringType '\/workers\/person\/alternatePreferredNames\/preferredSalutations\/typeCode\/longName?;
    NumberType '\/workers\/person\/alternatePreferredNames\/preferredSalutations\/sequenceNumber?;
    ArrayType '\/workers\/person\/alternatePreferredNames\/titlePrefixCodes?;
    StringCodeListType '\/workers\/person\/alternatePreferredNames\/titlePrefixCodes\/affixCode?;
    StringType '\/workers\/person\/alternatePreferredNames\/titlePrefixCodes\/affixCode\/codeValue?;
    StringType '\/workers\/person\/alternatePreferredNames\/titlePrefixCodes\/affixCode\/shortName?;
    StringType '\/workers\/person\/alternatePreferredNames\/titlePrefixCodes\/affixCode\/longName?;
    NumberType '\/workers\/person\/alternatePreferredNames\/titlePrefixCodes\/sequenceNumber?;
    StringType '\/workers\/person\/alternatePreferredNames\/nickName?;
    StringCodeListType '\/workers\/person\/alternatePreferredNames\/generationAffixCode?;
    StringType '\/workers\/person\/alternatePreferredNames\/generationAffixCode\/codeValue?;
    StringType '\/workers\/person\/alternatePreferredNames\/generationAffixCode\/shortName?;
    StringType '\/workers\/person\/alternatePreferredNames\/generationAffixCode\/longName?;
    StringCodeListType '\/workers\/person\/alternatePreferredNames\/qualificationAffixCode?;
    StringType '\/workers\/person\/alternatePreferredNames\/qualificationAffixCode\/codeValue?;
    StringType '\/workers\/person\/alternatePreferredNames\/qualificationAffixCode\/shortName?;
    StringType '\/workers\/person\/alternatePreferredNames\/qualificationAffixCode\/longName?;
    ArrayType '\/workers\/person\/alternatePreferredNames\/titleAffixCodes?;
    StringCodeListType '\/workers\/person\/alternatePreferredNames\/titleAffixCodes\/affixCode?;
    StringType '\/workers\/person\/alternatePreferredNames\/titleAffixCodes\/affixCode\/codeValue?;
    StringType '\/workers\/person\/alternatePreferredNames\/titleAffixCodes\/affixCode\/shortName?;
    StringType '\/workers\/person\/alternatePreferredNames\/titleAffixCodes\/affixCode\/longName?;
    NumberType '\/workers\/person\/alternatePreferredNames\/titleAffixCodes\/sequenceNumber?;
    StringType '\/workers\/person\/alternatePreferredNames\/familyName1Prefix?;
    StringType '\/workers\/person\/alternatePreferredNames\/familyName2Prefix?;
    StringType '\/workers\/person\/alternatePreferredNames\/initials?;
    StringType '\/workers\/person\/alternatePreferredNames\/itemID?;
    StringCodeListType '\/workers\/person\/alternatePreferredNames\/languageCode?;
    StringType '\/workers\/person\/alternatePreferredNames\/languageCode\/codeValue?;
    StringType '\/workers\/person\/alternatePreferredNames\/languageCode\/shortName?;
    StringType '\/workers\/person\/alternatePreferredNames\/languageCode\/longName?;
    ArrayType '\/workers\/person\/formerNames?;
    StringType '\/workers\/person\/formerNames\/givenName?;
    StringType '\/workers\/person\/formerNames\/middleName?;
    StringType '\/workers\/person\/formerNames\/familyName1?;
    StringType '\/workers\/person\/formerNames\/familyName2?;
    StringType '\/workers\/person\/formerNames\/formattedName?;
    StringCodeListType '\/workers\/person\/formerNames\/nameCode?;
    StringType '\/workers\/person\/formerNames\/nameCode\/codeValue?;
    StringType '\/workers\/person\/formerNames\/nameCode\/shortName?;
    StringType '\/workers\/person\/formerNames\/nameCode\/longName?;
    StringCodeListType '\/workers\/person\/formerNames\/scriptCode?;
    StringType '\/workers\/person\/formerNames\/scriptCode\/codeValue?;
    StringType '\/workers\/person\/formerNames\/scriptCode\/shortName?;
    StringType '\/workers\/person\/formerNames\/scriptCode\/longName?;
    ArrayType '\/workers\/person\/formerNames\/preferredSalutations?;
    StringCodeListType '\/workers\/person\/formerNames\/preferredSalutations\/salutationCode?;
    StringType '\/workers\/person\/formerNames\/preferredSalutations\/salutationCode\/codeValue?;
    StringType '\/workers\/person\/formerNames\/preferredSalutations\/salutationCode\/shortName?;
    StringType '\/workers\/person\/formerNames\/preferredSalutations\/salutationCode\/longName?;
    StringCodeListType '\/workers\/person\/formerNames\/preferredSalutations\/typeCode?;
    StringType '\/workers\/person\/formerNames\/preferredSalutations\/typeCode\/codeValue?;
    StringType '\/workers\/person\/formerNames\/preferredSalutations\/typeCode\/shortName?;
    StringType '\/workers\/person\/formerNames\/preferredSalutations\/typeCode\/longName?;
    NumberType '\/workers\/person\/formerNames\/preferredSalutations\/sequenceNumber?;
    ArrayType '\/workers\/person\/formerNames\/titlePrefixCodes?;
    StringCodeListType '\/workers\/person\/formerNames\/titlePrefixCodes\/affixCode?;
    StringType '\/workers\/person\/formerNames\/titlePrefixCodes\/affixCode\/codeValue?;
    StringType '\/workers\/person\/formerNames\/titlePrefixCodes\/affixCode\/shortName?;
    StringType '\/workers\/person\/formerNames\/titlePrefixCodes\/affixCode\/longName?;
    NumberType '\/workers\/person\/formerNames\/titlePrefixCodes\/sequenceNumber?;
    StringType '\/workers\/person\/formerNames\/nickName?;
    StringCodeListType '\/workers\/person\/formerNames\/generationAffixCode?;
    StringType '\/workers\/person\/formerNames\/generationAffixCode\/codeValue?;
    StringType '\/workers\/person\/formerNames\/generationAffixCode\/shortName?;
    StringType '\/workers\/person\/formerNames\/generationAffixCode\/longName?;
    StringCodeListType '\/workers\/person\/formerNames\/qualificationAffixCode?;
    StringType '\/workers\/person\/formerNames\/qualificationAffixCode\/codeValue?;
    StringType '\/workers\/person\/formerNames\/qualificationAffixCode\/shortName?;
    StringType '\/workers\/person\/formerNames\/qualificationAffixCode\/longName?;
    ArrayType '\/workers\/person\/formerNames\/titleAffixCodes?;
    StringCodeListType '\/workers\/person\/formerNames\/titleAffixCodes\/affixCode?;
    StringType '\/workers\/person\/formerNames\/titleAffixCodes\/affixCode\/codeValue?;
    StringType '\/workers\/person\/formerNames\/titleAffixCodes\/affixCode\/shortName?;
    StringType '\/workers\/person\/formerNames\/titleAffixCodes\/affixCode\/longName?;
    NumberType '\/workers\/person\/formerNames\/titleAffixCodes\/sequenceNumber?;
    StringType '\/workers\/person\/formerNames\/familyName1Prefix?;
    StringType '\/workers\/person\/formerNames\/familyName2Prefix?;
    StringType '\/workers\/person\/formerNames\/initials?;
    StringType '\/workers\/person\/formerNames\/itemID?;
    StringCodeListType '\/workers\/person\/formerNames\/typeCode?;
    StringType '\/workers\/person\/formerNames\/typeCode\/codeValue?;
    StringType '\/workers\/person\/formerNames\/typeCode\/shortName?;
    StringType '\/workers\/person\/formerNames\/typeCode\/longName?;
    ObjectType '\/workers\/person\/birthName?;
    StringType '\/workers\/person\/birthName\/givenName?;
    StringType '\/workers\/person\/birthName\/middleName?;
    StringType '\/workers\/person\/birthName\/familyName1?;
    StringType '\/workers\/person\/birthName\/familyName2?;
    StringType '\/workers\/person\/birthName\/formattedName?;
    StringCodeListType '\/workers\/person\/birthName\/nameCode?;
    StringType '\/workers\/person\/birthName\/nameCode\/codeValue?;
    StringType '\/workers\/person\/birthName\/nameCode\/shortName?;
    StringType '\/workers\/person\/birthName\/nameCode\/longName?;
    StringCodeListType '\/workers\/person\/birthName\/scriptCode?;
    StringType '\/workers\/person\/birthName\/scriptCode\/codeValue?;
    StringType '\/workers\/person\/birthName\/scriptCode\/shortName?;
    StringType '\/workers\/person\/birthName\/scriptCode\/longName?;
    ArrayType '\/workers\/person\/birthName\/preferredSalutations?;
    StringCodeListType '\/workers\/person\/birthName\/preferredSalutations\/salutationCode?;
    StringType '\/workers\/person\/birthName\/preferredSalutations\/salutationCode\/codeValue?;
    StringType '\/workers\/person\/birthName\/preferredSalutations\/salutationCode\/shortName?;
    StringType '\/workers\/person\/birthName\/preferredSalutations\/salutationCode\/longName?;
    StringCodeListType '\/workers\/person\/birthName\/preferredSalutations\/typeCode?;
    StringType '\/workers\/person\/birthName\/preferredSalutations\/typeCode\/codeValue?;
    StringType '\/workers\/person\/birthName\/preferredSalutations\/typeCode\/shortName?;
    StringType '\/workers\/person\/birthName\/preferredSalutations\/typeCode\/longName?;
    NumberType '\/workers\/person\/birthName\/preferredSalutations\/sequenceNumber?;
    ArrayType '\/workers\/person\/birthName\/titlePrefixCodes?;
    StringCodeListType '\/workers\/person\/birthName\/titlePrefixCodes\/affixCode?;
    StringType '\/workers\/person\/birthName\/titlePrefixCodes\/affixCode\/codeValue?;
    StringType '\/workers\/person\/birthName\/titlePrefixCodes\/affixCode\/shortName?;
    StringType '\/workers\/person\/birthName\/titlePrefixCodes\/affixCode\/longName?;
    NumberType '\/workers\/person\/birthName\/titlePrefixCodes\/sequenceNumber?;
    StringType '\/workers\/person\/birthName\/nickName?;
    StringCodeListType '\/workers\/person\/birthName\/generationAffixCode?;
    StringType '\/workers\/person\/birthName\/generationAffixCode\/codeValue?;
    StringType '\/workers\/person\/birthName\/generationAffixCode\/shortName?;
    StringType '\/workers\/person\/birthName\/generationAffixCode\/longName?;
    StringCodeListType '\/workers\/person\/birthName\/qualificationAffixCode?;
    StringType '\/workers\/person\/birthName\/qualificationAffixCode\/codeValue?;
    StringType '\/workers\/person\/birthName\/qualificationAffixCode\/shortName?;
    StringType '\/workers\/person\/birthName\/qualificationAffixCode\/longName?;
    ArrayType '\/workers\/person\/birthName\/titleAffixCodes?;
    StringCodeListType '\/workers\/person\/birthName\/titleAffixCodes\/affixCode?;
    StringType '\/workers\/person\/birthName\/titleAffixCodes\/affixCode\/codeValue?;
    StringType '\/workers\/person\/birthName\/titleAffixCodes\/affixCode\/shortName?;
    StringType '\/workers\/person\/birthName\/titleAffixCodes\/affixCode\/longName?;
    NumberType '\/workers\/person\/birthName\/titleAffixCodes\/sequenceNumber?;
    StringType '\/workers\/person\/birthName\/familyName1Prefix?;
    StringType '\/workers\/person\/birthName\/familyName2Prefix?;
    StringType '\/workers\/person\/birthName\/initials?;
    ObjectType '\/workers\/person\/birthPlace?;
    StringType '\/workers\/person\/birthPlace\/cityName?;
    StringCodeListType '\/workers\/person\/birthPlace\/countrySubdivisionLevel1?;
    StringType '\/workers\/person\/birthPlace\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/workers\/person\/birthPlace\/countrySubdivisionLevel1\/shortName?;
    StringType '\/workers\/person\/birthPlace\/countrySubdivisionLevel1\/longName?;
    StringType '\/workers\/person\/birthPlace\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/workers\/person\/birthPlace\/countrySubdivisionLevel2?;
    StringType '\/workers\/person\/birthPlace\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/workers\/person\/birthPlace\/countrySubdivisionLevel2\/shortName?;
    StringType '\/workers\/person\/birthPlace\/countrySubdivisionLevel2\/longName?;
    StringType '\/workers\/person\/birthPlace\/countrySubdivisionLevel2\/subdivisionType?;
    StringCodeListType '\/workers\/person\/birthPlace\/postalCode?;
    StringCodeListType '\/workers\/person\/birthPlace\/countryCode?;
    StringType '\/workers\/person\/birthPlace\/formattedBirthPlace?;
    ArrayType '\/workers\/person\/otherPersonalAddresses?;
    StringCodeListType '\/workers\/person\/otherPersonalAddresses\/nameCode?;
    StringType '\/workers\/person\/otherPersonalAddresses\/nameCode\/codeValue?;
    StringType '\/workers\/person\/otherPersonalAddresses\/nameCode\/shortName?;
    StringType '\/workers\/person\/otherPersonalAddresses\/nameCode\/longName?;
    StringType '\/workers\/person\/otherPersonalAddresses\/attentionOfName?;
    StringType '\/workers\/person\/otherPersonalAddresses\/careOfName?;
    StringType '\/workers\/person\/otherPersonalAddresses\/lineOne?;
    StringType '\/workers\/person\/otherPersonalAddresses\/lineTwo?;
    StringType '\/workers\/person\/otherPersonalAddresses\/lineThree?;
    StringType '\/workers\/person\/otherPersonalAddresses\/cityName?;
    StringCodeListType '\/workers\/person\/otherPersonalAddresses\/countrySubdivisionLevel1?;
    StringType '\/workers\/person\/otherPersonalAddresses\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/workers\/person\/otherPersonalAddresses\/countrySubdivisionLevel1\/shortName?;
    StringType '\/workers\/person\/otherPersonalAddresses\/countrySubdivisionLevel1\/longName?;
    StringType '\/workers\/person\/otherPersonalAddresses\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/workers\/person\/otherPersonalAddresses\/countryCode?;
    StringCodeListType '\/workers\/person\/otherPersonalAddresses\/postalCode?;
    ObjectType '\/workers\/person\/otherPersonalAddresses\/geoCoordinate?;
    NumberType '\/workers\/person\/otherPersonalAddresses\/geoCoordinate\/latitude?;
    NumberType '\/workers\/person\/otherPersonalAddresses\/geoCoordinate\/longitude?;
    StringCodeListType '\/workers\/person\/otherPersonalAddresses\/scriptCode?;
    StringType '\/workers\/person\/otherPersonalAddresses\/scriptCode\/codeValue?;
    StringType '\/workers\/person\/otherPersonalAddresses\/scriptCode\/shortName?;
    StringType '\/workers\/person\/otherPersonalAddresses\/scriptCode\/longName?;
    StringType '\/workers\/person\/otherPersonalAddresses\/lineFour?;
    StringType '\/workers\/person\/otherPersonalAddresses\/lineFive?;
    StringType '\/workers\/person\/otherPersonalAddresses\/buildingNumber?;
    StringType '\/workers\/person\/otherPersonalAddresses\/buildingName?;
    StringType '\/workers\/person\/otherPersonalAddresses\/blockName?;
    StringType '\/workers\/person\/otherPersonalAddresses\/streetName?;
    StringCodeListType '\/workers\/person\/otherPersonalAddresses\/streetTypeCode?;
    StringType '\/workers\/person\/otherPersonalAddresses\/streetTypeCode\/codeValue?;
    StringType '\/workers\/person\/otherPersonalAddresses\/streetTypeCode\/shortName?;
    StringType '\/workers\/person\/otherPersonalAddresses\/streetTypeCode\/longName?;
    StringType '\/workers\/person\/otherPersonalAddresses\/unit?;
    StringType '\/workers\/person\/otherPersonalAddresses\/floor?;
    StringType '\/workers\/person\/otherPersonalAddresses\/stairCase?;
    StringType '\/workers\/person\/otherPersonalAddresses\/door?;
    StringType '\/workers\/person\/otherPersonalAddresses\/postOfficeBox?;
    StringType '\/workers\/person\/otherPersonalAddresses\/deliveryPoint?;
    StringType '\/workers\/person\/otherPersonalAddresses\/plotID?;
    StringCodeListType '\/workers\/person\/otherPersonalAddresses\/countrySubdivisionLevel2?;
    StringType '\/workers\/person\/otherPersonalAddresses\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/workers\/person\/otherPersonalAddresses\/countrySubdivisionLevel2\/shortName?;
    StringType '\/workers\/person\/otherPersonalAddresses\/countrySubdivisionLevel2\/longName?;
    StringType '\/workers\/person\/otherPersonalAddresses\/countrySubdivisionLevel2\/subdivisionType?;
    BooleanSameAsAddressIndicatorType '\/workers\/person\/otherPersonalAddresses\/sameAsAddressIndicator?;
    ObjectType '\/workers\/person\/otherPersonalAddresses\/sameAsAddressLink?;
    StringType '\/workers\/person\/otherPersonalAddresses\/sameAsAddressLink\/href?;
    StringType '\/workers\/person\/otherPersonalAddresses\/sameAsAddressLink\/rel?;
    StringType '\/workers\/person\/otherPersonalAddresses\/sameAsAddressLink\/canonicalUri?;
    StringType '\/workers\/person\/otherPersonalAddresses\/sameAsAddressLink\/title?;
    StringType '\/workers\/person\/otherPersonalAddresses\/sameAsAddressLink\/targetSchema?;
    StringType '\/workers\/person\/otherPersonalAddresses\/sameAsAddressLink\/mediaType?;
    StringType '\/workers\/person\/otherPersonalAddresses\/sameAsAddressLink\/method?;
    StringType '\/workers\/person\/otherPersonalAddresses\/sameAsAddressLink\/encType?;
    StringType '\/workers\/person\/otherPersonalAddresses\/sameAsAddressLink\/schema?;
    ArrayType '\/workers\/person\/otherPersonalAddresses\/sameAsAddressLink\/payLoadArguments?;
    StringType '\/workers\/person\/otherPersonalAddresses\/sameAsAddressLink\/payLoadArguments\/argumentPath?;
    StringType '\/workers\/person\/otherPersonalAddresses\/sameAsAddressLink\/payLoadArguments\/argumentValue?;
    StringType '\/workers\/person\/otherPersonalAddresses\/itemID?;
    StringCodeListType '\/workers\/person\/otherPersonalAddresses\/typeCode?;
    StringType '\/workers\/person\/otherPersonalAddresses\/typeCode\/codeValue?;
    StringType '\/workers\/person\/otherPersonalAddresses\/typeCode\/shortName?;
    StringType '\/workers\/person\/otherPersonalAddresses\/typeCode\/longName?;
    StringCodeListType '\/workers\/person\/ethnicityCode?;
    StringType '\/workers\/person\/ethnicityCode\/codeValue?;
    StringType '\/workers\/person\/ethnicityCode\/shortName?;
    StringType '\/workers\/person\/ethnicityCode\/longName?;
    StringCodeListType '\/workers\/person\/ethnicityGroupCode?;
    StringType '\/workers\/person\/ethnicityGroupCode\/codeValue?;
    StringType '\/workers\/person\/ethnicityGroupCode\/shortName?;
    StringType '\/workers\/person\/ethnicityGroupCode\/longName?;
    StringCodeListType '\/workers\/person\/raceCode?;
    StringType '\/workers\/person\/raceCode\/codeValue?;
    StringType '\/workers\/person\/raceCode\/shortName?;
    StringType '\/workers\/person\/raceCode\/longName?;
    StringCodeListType '\/workers\/person\/raceCode\/identificationMethodCode?;
    StringType '\/workers\/person\/raceCode\/identificationMethodCode\/codeValue?;
    StringType '\/workers\/person\/raceCode\/identificationMethodCode\/shortName?;
    StringType '\/workers\/person\/raceCode\/identificationMethodCode\/longName?;
    StringCodeListType '\/workers\/person\/citizenshipCountryCodes?;
    StringType '\/workers\/person\/citizenshipCountryCodes\/codeValue?;
    StringType '\/workers\/person\/citizenshipCountryCodes\/shortName?;
    StringType '\/workers\/person\/citizenshipCountryCodes\/longName?;
    StringCodeListType '\/workers\/person\/residencyCountryCodes?;
    StringType '\/workers\/person\/residencyCountryCodes\/codeValue?;
    StringType '\/workers\/person\/residencyCountryCodes\/shortName?;
    StringType '\/workers\/person\/residencyCountryCodes\/longName?;
    StringCodeListType '\/workers\/person\/highestEducationLevelCode?;
    StringType '\/workers\/person\/highestEducationLevelCode\/codeValue?;
    StringType '\/workers\/person\/highestEducationLevelCode\/shortName?;
    StringType '\/workers\/person\/highestEducationLevelCode\/longName?;
    StringCodeListType '\/workers\/person\/militaryStatusCode?;
    StringType '\/workers\/person\/militaryStatusCode\/codeValue?;
    StringType '\/workers\/person\/militaryStatusCode\/shortName?;
    StringType '\/workers\/person\/militaryStatusCode\/longName?;
    StringType '\/workers\/person\/militaryStatusCode\/effectiveDate?;
    StringType '\/workers\/person\/militaryDischargeDate?;
    StringCodeListType '\/workers\/person\/militaryClassificationCodes?;
    StringType '\/workers\/person\/militaryClassificationCodes\/codeValue?;
    StringType '\/workers\/person\/militaryClassificationCodes\/shortName?;
    StringType '\/workers\/person\/militaryClassificationCodes\/longName?;
    ObjectType '\/workers\/person\/customFieldGroup?;
    ArrayType '\/workers\/person\/customFieldGroup\/amountFields?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/amountFields\/nameCode?;
    StringType '\/workers\/person\/customFieldGroup\/amountFields\/nameCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/amountFields\/nameCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/amountFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/amountFields\/categoryCode?;
    StringType '\/workers\/person\/customFieldGroup\/amountFields\/categoryCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/amountFields\/categoryCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/amountFields\/categoryCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/workers\/person\/customFieldGroup\/amountFields\/amountValue?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/amountFields\/currencyCode?;
    StringType '\/workers\/person\/customFieldGroup\/amountFields\/itemID?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/codeFields?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/codeFields\/nameCode?;
    StringType '\/workers\/person\/customFieldGroup\/codeFields\/nameCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/codeFields\/nameCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/codeFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/codeFields\/categoryCode?;
    StringType '\/workers\/person\/customFieldGroup\/codeFields\/categoryCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/codeFields\/categoryCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/codeFields\/categoryCode\/longName?;
    StringType '\/workers\/person\/customFieldGroup\/codeFields\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/codeFields\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/codeFields\/longName?;
    StringType '\/workers\/person\/customFieldGroup\/codeFields\/itemID?;
    ArrayType '\/workers\/person\/customFieldGroup\/dateFields?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/dateFields\/nameCode?;
    StringType '\/workers\/person\/customFieldGroup\/dateFields\/nameCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/dateFields\/nameCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/dateFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/dateFields\/categoryCode?;
    StringType '\/workers\/person\/customFieldGroup\/dateFields\/categoryCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/dateFields\/categoryCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/dateFields\/categoryCode\/longName?;
    StringType '\/workers\/person\/customFieldGroup\/dateFields\/dateValue?;
    StringType '\/workers\/person\/customFieldGroup\/dateFields\/itemID?;
    ArrayType '\/workers\/person\/customFieldGroup\/dateTimeFields?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/dateTimeFields\/nameCode?;
    StringType '\/workers\/person\/customFieldGroup\/dateTimeFields\/nameCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/dateTimeFields\/nameCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/dateTimeFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/dateTimeFields\/categoryCode?;
    StringType '\/workers\/person\/customFieldGroup\/dateTimeFields\/categoryCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/dateTimeFields\/categoryCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/dateTimeFields\/categoryCode\/longName?;
    StringType '\/workers\/person\/customFieldGroup\/dateTimeFields\/dateTimeValue?;
    StringType '\/workers\/person\/customFieldGroup\/dateTimeFields\/itemID?;
    ArrayType '\/workers\/person\/customFieldGroup\/indicatorFields?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/indicatorFields\/nameCode?;
    StringType '\/workers\/person\/customFieldGroup\/indicatorFields\/nameCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/indicatorFields\/nameCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/indicatorFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/indicatorFields\/categoryCode?;
    StringType '\/workers\/person\/customFieldGroup\/indicatorFields\/categoryCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/indicatorFields\/categoryCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/indicatorFields\/categoryCode\/longName?;
    BooleanType '\/workers\/person\/customFieldGroup\/indicatorFields\/indicatorValue?;
    StringType '\/workers\/person\/customFieldGroup\/indicatorFields\/itemID?;
    ArrayType '\/workers\/person\/customFieldGroup\/numberFields?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/numberFields\/nameCode?;
    StringType '\/workers\/person\/customFieldGroup\/numberFields\/nameCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/numberFields\/nameCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/numberFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/numberFields\/categoryCode?;
    StringType '\/workers\/person\/customFieldGroup\/numberFields\/categoryCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/numberFields\/categoryCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/numberFields\/categoryCode\/longName?;
    NumberType '\/workers\/person\/customFieldGroup\/numberFields\/numberValue?;
    StringType '\/workers\/person\/customFieldGroup\/numberFields\/itemID?;
    ArrayType '\/workers\/person\/customFieldGroup\/percentFields?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/percentFields\/nameCode?;
    StringType '\/workers\/person\/customFieldGroup\/percentFields\/nameCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/percentFields\/nameCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/percentFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/percentFields\/categoryCode?;
    StringType '\/workers\/person\/customFieldGroup\/percentFields\/categoryCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/percentFields\/categoryCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/percentFields\/categoryCode\/longName?;
    NumberType '\/workers\/person\/customFieldGroup\/percentFields\/percentValue?;
    StringType '\/workers\/person\/customFieldGroup\/percentFields\/itemID?;
    ArrayType '\/workers\/person\/customFieldGroup\/stringFields?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/stringFields\/nameCode?;
    StringType '\/workers\/person\/customFieldGroup\/stringFields\/nameCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/stringFields\/nameCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/stringFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/stringFields\/categoryCode?;
    StringType '\/workers\/person\/customFieldGroup\/stringFields\/categoryCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/stringFields\/categoryCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/stringFields\/categoryCode\/longName?;
    StringType '\/workers\/person\/customFieldGroup\/stringFields\/stringValue?;
    StringType '\/workers\/person\/customFieldGroup\/stringFields\/itemID?;
    ArrayType '\/workers\/person\/customFieldGroup\/telephoneFields?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/telephoneFields\/nameCode?;
    StringType '\/workers\/person\/customFieldGroup\/telephoneFields\/nameCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/telephoneFields\/nameCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/telephoneFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/person\/customFieldGroup\/telephoneFields\/categoryCode?;
    StringType '\/workers\/person\/customFieldGroup\/telephoneFields\/categoryCode\/codeValue?;
    StringType '\/workers\/person\/customFieldGroup\/telephoneFields\/categoryCode\/shortName?;
    StringType '\/workers\/person\/customFieldGroup\/telephoneFields\/categoryCode\/longName?;
    StringType '\/workers\/person\/customFieldGroup\/telephoneFields\/countryDialing?;
    StringType '\/workers\/person\/customFieldGroup\/telephoneFields\/areaDialing?;
    StringType '\/workers\/person\/customFieldGroup\/telephoneFields\/dialNumber?;
    StringType '\/workers\/person\/customFieldGroup\/telephoneFields\/extension?;
    StringType '\/workers\/person\/customFieldGroup\/telephoneFields\/access?;
    StringType '\/workers\/person\/customFieldGroup\/telephoneFields\/formattedNumber?;
    StringType '\/workers\/person\/customFieldGroup\/telephoneFields\/itemID?;
    ArrayType '\/workers\/person\/customFieldGroup\/links?;
    StringType '\/workers\/person\/customFieldGroup\/links\/href?;
    StringType '\/workers\/person\/customFieldGroup\/links\/rel?;
    StringType '\/workers\/person\/customFieldGroup\/links\/canonicalUri?;
    StringType '\/workers\/person\/customFieldGroup\/links\/title?;
    StringType '\/workers\/person\/customFieldGroup\/links\/targetSchema?;
    StringType '\/workers\/person\/customFieldGroup\/links\/mediaType?;
    StringType '\/workers\/person\/customFieldGroup\/links\/method?;
    StringType '\/workers\/person\/customFieldGroup\/links\/encType?;
    StringType '\/workers\/person\/customFieldGroup\/links\/schema?;
    ArrayType '\/workers\/person\/customFieldGroup\/links\/payLoadArguments?;
    StringType '\/workers\/person\/customFieldGroup\/links\/payLoadArguments\/argumentPath?;
    StringType '\/workers\/person\/customFieldGroup\/links\/payLoadArguments\/argumentValue?;
    ArrayType '\/workers\/person\/links?;
    StringType '\/workers\/person\/links\/href?;
    StringType '\/workers\/person\/links\/rel?;
    StringType '\/workers\/person\/links\/canonicalUri?;
    StringType '\/workers\/person\/links\/title?;
    StringType '\/workers\/person\/links\/targetSchema?;
    StringType '\/workers\/person\/links\/mediaType?;
    StringType '\/workers\/person\/links\/method?;
    StringType '\/workers\/person\/links\/encType?;
    StringType '\/workers\/person\/links\/schema?;
    ArrayType '\/workers\/person\/links\/payLoadArguments?;
    StringType '\/workers\/person\/links\/payLoadArguments\/argumentPath?;
    StringType '\/workers\/person\/links\/payLoadArguments\/argumentValue?;
    ObjectType '\/workers\/workerDates?;
    StringType '\/workers\/workerDates\/originalHireDate?;
    StringType '\/workers\/workerDates\/rehireDate?;
    StringType '\/workers\/workerDates\/adjustedServiceDate?;
    StringType '\/workers\/workerDates\/acquisitionDate?;
    StringType '\/workers\/workerDates\/retirementDate?;
    StringType '\/workers\/workerDates\/terminationDate?;
    StringType '\/workers\/workerDates\/expectedTerminationDate?;
    ObjectType '\/workers\/workerStatus?;
    StringCodeListType '\/workers\/workerStatus\/statusCode?;
    StringType '\/workers\/workerStatus\/statusCode\/codeValue?;
    StringType '\/workers\/workerStatus\/statusCode\/shortName?;
    StringType '\/workers\/workerStatus\/statusCode\/longName?;
    StringCodeListType '\/workers\/workerStatus\/reasonCode?;
    StringType '\/workers\/workerStatus\/reasonCode\/codeValue?;
    StringType '\/workers\/workerStatus\/reasonCode\/shortName?;
    StringType '\/workers\/workerStatus\/reasonCode\/longName?;
    StringType '\/workers\/workerStatus\/effectiveDate?;
    ArrayType '\/workers\/photos?;
    StringCodeListType '\/workers\/photos\/nameCode?;
    StringType '\/workers\/photos\/nameCode\/codeValue?;
    StringType '\/workers\/photos\/nameCode\/shortName?;
    StringType '\/workers\/photos\/nameCode\/longName?;
    ArrayType '\/workers\/photos\/links?;
    StringType '\/workers\/photos\/links\/href?;
    StringType '\/workers\/photos\/links\/rel?;
    StringType '\/workers\/photos\/links\/canonicalUri?;
    StringType '\/workers\/photos\/links\/title?;
    StringType '\/workers\/photos\/links\/targetSchema?;
    StringType '\/workers\/photos\/links\/mediaType?;
    StringType '\/workers\/photos\/links\/method?;
    StringType '\/workers\/photos\/links\/encType?;
    StringType '\/workers\/photos\/links\/schema?;
    ArrayType '\/workers\/photos\/links\/payLoadArguments?;
    StringType '\/workers\/photos\/links\/payLoadArguments\/argumentPath?;
    StringType '\/workers\/photos\/links\/payLoadArguments\/argumentValue?;
    StringType '\/workers\/photos\/itemID?;
    ObjectType '\/workers\/businessCommunication?;
    ArrayType '\/workers\/businessCommunication\/landlines?;
    StringCodeListType '\/workers\/businessCommunication\/landlines\/nameCode?;
    StringType '\/workers\/businessCommunication\/landlines\/nameCode\/codeValue?;
    StringType '\/workers\/businessCommunication\/landlines\/nameCode\/shortName?;
    StringType '\/workers\/businessCommunication\/landlines\/nameCode\/longName?;
    StringType '\/workers\/businessCommunication\/landlines\/countryDialing?;
    StringType '\/workers\/businessCommunication\/landlines\/areaDialing?;
    StringType '\/workers\/businessCommunication\/landlines\/dialNumber?;
    StringType '\/workers\/businessCommunication\/landlines\/extension?;
    StringType '\/workers\/businessCommunication\/landlines\/access?;
    StringType '\/workers\/businessCommunication\/landlines\/formattedNumber?;
    StringType '\/workers\/businessCommunication\/landlines\/itemID?;
    BooleanType '\/workers\/businessCommunication\/landlines\/notificationIndicator?;
    ArrayType '\/workers\/businessCommunication\/mobiles?;
    StringCodeListType '\/workers\/businessCommunication\/mobiles\/nameCode?;
    StringType '\/workers\/businessCommunication\/mobiles\/nameCode\/codeValue?;
    StringType '\/workers\/businessCommunication\/mobiles\/nameCode\/shortName?;
    StringType '\/workers\/businessCommunication\/mobiles\/nameCode\/longName?;
    StringType '\/workers\/businessCommunication\/mobiles\/countryDialing?;
    StringType '\/workers\/businessCommunication\/mobiles\/areaDialing?;
    StringType '\/workers\/businessCommunication\/mobiles\/dialNumber?;
    StringType '\/workers\/businessCommunication\/mobiles\/extension?;
    StringType '\/workers\/businessCommunication\/mobiles\/access?;
    StringType '\/workers\/businessCommunication\/mobiles\/formattedNumber?;
    StringType '\/workers\/businessCommunication\/mobiles\/itemID?;
    BooleanType '\/workers\/businessCommunication\/mobiles\/notificationIndicator?;
    ArrayType '\/workers\/businessCommunication\/emails?;
    StringCodeListType '\/workers\/businessCommunication\/emails\/nameCode?;
    StringType '\/workers\/businessCommunication\/emails\/nameCode\/codeValue?;
    StringType '\/workers\/businessCommunication\/emails\/nameCode\/shortName?;
    StringType '\/workers\/businessCommunication\/emails\/nameCode\/longName?;
    StringType '\/workers\/businessCommunication\/emails\/emailUri?;
    StringType '\/workers\/businessCommunication\/emails\/itemID?;
    BooleanType '\/workers\/businessCommunication\/emails\/notificationIndicator?;
    ArrayType '\/workers\/businessCommunication\/socialNetworks?;
    StringCodeListType '\/workers\/businessCommunication\/socialNetworks\/nameCode?;
    StringType '\/workers\/businessCommunication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/workers\/businessCommunication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/workers\/businessCommunication\/socialNetworks\/nameCode\/longName?;
    StringType '\/workers\/businessCommunication\/socialNetworks\/uri?;
    StringType '\/workers\/businessCommunication\/socialNetworks\/itemID?;
    BooleanType '\/workers\/businessCommunication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/workers\/businessCommunication\/faxes?;
    StringCodeListType '\/workers\/businessCommunication\/faxes\/nameCode?;
    StringType '\/workers\/businessCommunication\/faxes\/nameCode\/codeValue?;
    StringType '\/workers\/businessCommunication\/faxes\/nameCode\/shortName?;
    StringType '\/workers\/businessCommunication\/faxes\/nameCode\/longName?;
    StringType '\/workers\/businessCommunication\/faxes\/countryDialing?;
    StringType '\/workers\/businessCommunication\/faxes\/areaDialing?;
    StringType '\/workers\/businessCommunication\/faxes\/dialNumber?;
    StringType '\/workers\/businessCommunication\/faxes\/extension?;
    StringType '\/workers\/businessCommunication\/faxes\/access?;
    StringType '\/workers\/businessCommunication\/faxes\/formattedNumber?;
    StringType '\/workers\/businessCommunication\/faxes\/itemID?;
    BooleanType '\/workers\/businessCommunication\/faxes\/notificationIndicator?;
    ArrayType '\/workers\/businessCommunication\/pagers?;
    StringCodeListType '\/workers\/businessCommunication\/pagers\/nameCode?;
    StringType '\/workers\/businessCommunication\/pagers\/nameCode\/codeValue?;
    StringType '\/workers\/businessCommunication\/pagers\/nameCode\/shortName?;
    StringType '\/workers\/businessCommunication\/pagers\/nameCode\/longName?;
    StringType '\/workers\/businessCommunication\/pagers\/countryDialing?;
    StringType '\/workers\/businessCommunication\/pagers\/areaDialing?;
    StringType '\/workers\/businessCommunication\/pagers\/dialNumber?;
    StringType '\/workers\/businessCommunication\/pagers\/extension?;
    StringType '\/workers\/businessCommunication\/pagers\/access?;
    StringType '\/workers\/businessCommunication\/pagers\/formattedNumber?;
    StringType '\/workers\/businessCommunication\/pagers\/itemID?;
    BooleanType '\/workers\/businessCommunication\/pagers\/notificationIndicator?;
    ArrayType '\/workers\/businessCommunication\/internetAddresses?;
    StringCodeListType '\/workers\/businessCommunication\/internetAddresses\/nameCode?;
    StringType '\/workers\/businessCommunication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/workers\/businessCommunication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/workers\/businessCommunication\/internetAddresses\/nameCode\/longName?;
    StringType '\/workers\/businessCommunication\/internetAddresses\/uri?;
    StringType '\/workers\/businessCommunication\/internetAddresses\/itemID?;
    ArrayType '\/workers\/businessCommunication\/instantMessages?;
    StringCodeListType '\/workers\/businessCommunication\/instantMessages\/nameCode?;
    StringType '\/workers\/businessCommunication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/workers\/businessCommunication\/instantMessages\/nameCode\/shortName?;
    StringType '\/workers\/businessCommunication\/instantMessages\/nameCode\/longName?;
    StringType '\/workers\/businessCommunication\/instantMessages\/uri?;
    StringType '\/workers\/businessCommunication\/instantMessages\/itemID?;
    BooleanType '\/workers\/businessCommunication\/instantMessages\/notificationIndicator?;
    ArrayType '\/workers\/workAssignments?;
    BooleanType '\/workers\/workAssignments\/primaryIndicator?;
    StringType '\/workers\/workAssignments\/offerExtensionDate?;
    StringType '\/workers\/workAssignments\/offerAcceptanceDate?;
    StringType '\/workers\/workAssignments\/hireDate?;
    StringType '\/workers\/workAssignments\/seniorityDate?;
    StringType '\/workers\/workAssignments\/expectedStartDate?;
    StringType '\/workers\/workAssignments\/actualStartDate?;
    StringType '\/workers\/workAssignments\/terminationDate?;
    StringType '\/workers\/workAssignments\/expectedTerminationDate?;
    ObjectType '\/workers\/workAssignments\/assignmentStatus?;
    StringCodeListType '\/workers\/workAssignments\/assignmentStatus\/statusCode?;
    StringType '\/workers\/workAssignments\/assignmentStatus\/statusCode\/codeValue?;
    StringType '\/workers\/workAssignments\/assignmentStatus\/statusCode\/shortName?;
    StringType '\/workers\/workAssignments\/assignmentStatus\/statusCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/assignmentStatus\/reasonCode?;
    StringType '\/workers\/workAssignments\/assignmentStatus\/reasonCode\/codeValue?;
    StringType '\/workers\/workAssignments\/assignmentStatus\/reasonCode\/shortName?;
    StringType '\/workers\/workAssignments\/assignmentStatus\/reasonCode\/longName?;
    StringType '\/workers\/workAssignments\/assignmentStatus\/effectiveDate?;
    ArrayType '\/workers\/workAssignments\/assignmentCostCenters?;
    StringType '\/workers\/workAssignments\/assignmentCostCenters\/costCenterID?;
    StringType '\/workers\/workAssignments\/assignmentCostCenters\/costCenterName?;
    NumberType '\/workers\/workAssignments\/assignmentCostCenters\/costCenterPercentage?;
    BooleanType '\/workers\/workAssignments\/workerProbationIndicator?;
    ObjectType '\/workers\/workAssignments\/workerProbationPeriod?;
    StringType '\/workers\/workAssignments\/workerProbationPeriod\/startDate?;
    StringType '\/workers\/workAssignments\/workerProbationPeriod\/endDate?;
    StringCodeListType '\/workers\/workAssignments\/workerTypeCode?;
    StringType '\/workers\/workAssignments\/workerTypeCode\/codeValue?;
    StringType '\/workers\/workAssignments\/workerTypeCode\/shortName?;
    StringType '\/workers\/workAssignments\/workerTypeCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/assignmentTermCode?;
    StringType '\/workers\/workAssignments\/assignmentTermCode\/codeValue?;
    StringType '\/workers\/workAssignments\/assignmentTermCode\/shortName?;
    StringType '\/workers\/workAssignments\/assignmentTermCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/workLevelCode?;
    StringType '\/workers\/workAssignments\/workLevelCode\/codeValue?;
    StringType '\/workers\/workAssignments\/workLevelCode\/shortName?;
    StringType '\/workers\/workAssignments\/workLevelCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/nationalityContextCode?;
    StringType '\/workers\/workAssignments\/nationalityContextCode\/codeValue?;
    StringType '\/workers\/workAssignments\/nationalityContextCode\/shortName?;
    StringType '\/workers\/workAssignments\/nationalityContextCode\/longName?;
    BooleanType '\/workers\/workAssignments\/vipIndicator?;
    StringCodeListType '\/workers\/workAssignments\/vipTypeCode?;
    StringType '\/workers\/workAssignments\/vipTypeCode\/codeValue?;
    StringType '\/workers\/workAssignments\/vipTypeCode\/shortName?;
    StringType '\/workers\/workAssignments\/vipTypeCode\/longName?;
    BooleanType '\/workers\/workAssignments\/executiveIndicator?;
    StringCodeListType '\/workers\/workAssignments\/executiveTypeCode?;
    StringType '\/workers\/workAssignments\/executiveTypeCode\/codeValue?;
    StringType '\/workers\/workAssignments\/executiveTypeCode\/shortName?;
    StringType '\/workers\/workAssignments\/executiveTypeCode\/longName?;
    BooleanType '\/workers\/workAssignments\/officerIndicator?;
    StringCodeListType '\/workers\/workAssignments\/officerTypeCode?;
    StringType '\/workers\/workAssignments\/officerTypeCode\/codeValue?;
    StringType '\/workers\/workAssignments\/officerTypeCode\/shortName?;
    StringType '\/workers\/workAssignments\/officerTypeCode\/longName?;
    BooleanType '\/workers\/workAssignments\/managementPositionIndicator?;
    StringType '\/workers\/workAssignments\/legalEntityID?;
    BooleanType '\/workers\/workAssignments\/highlyCompensatedIndicator?;
    StringCodeListType '\/workers\/workAssignments\/highlyCompensatedTypeCode?;
    StringType '\/workers\/workAssignments\/highlyCompensatedTypeCode\/codeValue?;
    StringType '\/workers\/workAssignments\/highlyCompensatedTypeCode\/shortName?;
    StringType '\/workers\/workAssignments\/highlyCompensatedTypeCode\/longName?;
    BooleanType '\/workers\/workAssignments\/stockOwnerIndicator?;
    NumberType '\/workers\/workAssignments\/stockOwnerPercentage?;
    ArrayType '\/workers\/workAssignments\/workerGroups?;
    StringCodeListType '\/workers\/workAssignments\/workerGroups\/nameCode?;
    StringType '\/workers\/workAssignments\/workerGroups\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/workerGroups\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/workerGroups\/nameCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/workerGroups\/groupCode?;
    StringType '\/workers\/workAssignments\/workerGroups\/groupCode\/codeValue?;
    StringType '\/workers\/workAssignments\/workerGroups\/groupCode\/shortName?;
    StringType '\/workers\/workAssignments\/workerGroups\/groupCode\/longName?;
    StringType '\/workers\/workAssignments\/workerGroups\/itemID?;
    StringCodeListType '\/workers\/workAssignments\/jobCode?;
    StringType '\/workers\/workAssignments\/jobCode\/codeValue?;
    StringType '\/workers\/workAssignments\/jobCode\/shortName?;
    StringType '\/workers\/workAssignments\/jobCode\/longName?;
    StringType '\/workers\/workAssignments\/jobCode\/effectiveDate?;
    StringType '\/workers\/workAssignments\/jobTitle?;
    ArrayType '\/workers\/workAssignments\/occupationalClassifications?;
    StringCodeListType '\/workers\/workAssignments\/occupationalClassifications\/nameCode?;
    StringType '\/workers\/workAssignments\/occupationalClassifications\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/occupationalClassifications\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/occupationalClassifications\/nameCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/occupationalClassifications\/classificationCode?;
    StringType '\/workers\/workAssignments\/occupationalClassifications\/classificationCode\/codeValue?;
    StringType '\/workers\/workAssignments\/occupationalClassifications\/classificationCode\/shortName?;
    StringType '\/workers\/workAssignments\/occupationalClassifications\/classificationCode\/longName?;
    StringType '\/workers\/workAssignments\/occupationalClassifications\/itemID?;
    ArrayType '\/workers\/workAssignments\/industryClassifications?;
    StringCodeListType '\/workers\/workAssignments\/industryClassifications\/nameCode?;
    StringType '\/workers\/workAssignments\/industryClassifications\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/industryClassifications\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/industryClassifications\/nameCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/industryClassifications\/classificationCode?;
    StringType '\/workers\/workAssignments\/industryClassifications\/classificationCode\/codeValue?;
    StringType '\/workers\/workAssignments\/industryClassifications\/classificationCode\/shortName?;
    StringType '\/workers\/workAssignments\/industryClassifications\/classificationCode\/longName?;
    StringType '\/workers\/workAssignments\/industryClassifications\/itemID?;
    ObjectType '\/workers\/workAssignments\/wageLawCoverage?;
    StringCodeListType '\/workers\/workAssignments\/wageLawCoverage\/wageLawNameCode?;
    StringType '\/workers\/workAssignments\/wageLawCoverage\/wageLawNameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/wageLawCoverage\/wageLawNameCode\/shortName?;
    StringType '\/workers\/workAssignments\/wageLawCoverage\/wageLawNameCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/wageLawCoverage\/coverageCode?;
    StringType '\/workers\/workAssignments\/wageLawCoverage\/coverageCode\/codeValue?;
    StringType '\/workers\/workAssignments\/wageLawCoverage\/coverageCode\/shortName?;
    StringType '\/workers\/workAssignments\/wageLawCoverage\/coverageCode\/longName?;
    StringType '\/workers\/workAssignments\/positionID?;
    StringType '\/workers\/workAssignments\/positionTitle?;
    ObjectType '\/workers\/workAssignments\/laborUnion?;
    StringCodeListType '\/workers\/workAssignments\/laborUnion\/laborUnionCode?;
    StringType '\/workers\/workAssignments\/laborUnion\/laborUnionCode\/codeValue?;
    StringType '\/workers\/workAssignments\/laborUnion\/laborUnionCode\/shortName?;
    StringType '\/workers\/workAssignments\/laborUnion\/laborUnionCode\/longName?;
    StringType '\/workers\/workAssignments\/laborUnion\/seniorityDate?;
    ObjectType '\/workers\/workAssignments\/bargainingUnit?;
    StringCodeListType '\/workers\/workAssignments\/bargainingUnit\/bargainingUnitCode?;
    StringType '\/workers\/workAssignments\/bargainingUnit\/bargainingUnitCode\/codeValue?;
    StringType '\/workers\/workAssignments\/bargainingUnit\/bargainingUnitCode\/shortName?;
    StringType '\/workers\/workAssignments\/bargainingUnit\/bargainingUnitCode\/longName?;
    StringType '\/workers\/workAssignments\/bargainingUnit\/seniorityDate?;
    StringCodeListType '\/workers\/workAssignments\/workShiftCode?;
    StringType '\/workers\/workAssignments\/workShiftCode\/codeValue?;
    StringType '\/workers\/workAssignments\/workShiftCode\/shortName?;
    StringType '\/workers\/workAssignments\/workShiftCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/workArrangementCode?;
    StringType '\/workers\/workAssignments\/workArrangementCode\/codeValue?;
    StringType '\/workers\/workAssignments\/workArrangementCode\/shortName?;
    StringType '\/workers\/workAssignments\/workArrangementCode\/longName?;
    ObjectType '\/workers\/workAssignments\/standardHours?;
    NumberType '\/workers\/workAssignments\/standardHours\/hoursQuantity?;
    StringCodeListType '\/workers\/workAssignments\/standardHours\/unitCode?;
    StringType '\/workers\/workAssignments\/standardHours\/unitCode\/codeValue?;
    StringType '\/workers\/workAssignments\/standardHours\/unitCode\/shortName?;
    StringType '\/workers\/workAssignments\/standardHours\/unitCode\/longName?;
    NumberType '\/workers\/workAssignments\/fullTimeEquivalenceRatio?;
    ArrayType '\/workers\/workAssignments\/homeOrganizationalUnits?;
    StringCodeListType '\/workers\/workAssignments\/homeOrganizationalUnits\/nameCode?;
    StringType '\/workers\/workAssignments\/homeOrganizationalUnits\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/homeOrganizationalUnits\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/homeOrganizationalUnits\/nameCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/homeOrganizationalUnits\/typeCode?;
    StringType '\/workers\/workAssignments\/homeOrganizationalUnits\/typeCode\/codeValue?;
    StringType '\/workers\/workAssignments\/homeOrganizationalUnits\/typeCode\/shortName?;
    StringType '\/workers\/workAssignments\/homeOrganizationalUnits\/typeCode\/longName?;
    StringType '\/workers\/workAssignments\/homeOrganizationalUnits\/itemID?;
    ArrayType '\/workers\/workAssignments\/assignedOrganizationalUnits?;
    StringCodeListType '\/workers\/workAssignments\/assignedOrganizationalUnits\/nameCode?;
    StringType '\/workers\/workAssignments\/assignedOrganizationalUnits\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/assignedOrganizationalUnits\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/assignedOrganizationalUnits\/nameCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/assignedOrganizationalUnits\/typeCode?;
    StringType '\/workers\/workAssignments\/assignedOrganizationalUnits\/typeCode\/codeValue?;
    StringType '\/workers\/workAssignments\/assignedOrganizationalUnits\/typeCode\/shortName?;
    StringType '\/workers\/workAssignments\/assignedOrganizationalUnits\/typeCode\/longName?;
    StringType '\/workers\/workAssignments\/assignedOrganizationalUnits\/itemID?;
    ObjectType '\/workers\/workAssignments\/homeWorkLocation?;
    StringCodeListType '\/workers\/workAssignments\/homeWorkLocation\/nameCode?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/nameCode\/longName?;
    ObjectType '\/workers\/workAssignments\/homeWorkLocation\/communication?;
    ArrayType '\/workers\/workAssignments\/homeWorkLocation\/communication\/landlines?;
    StringCodeListType '\/workers\/workAssignments\/homeWorkLocation\/communication\/landlines\/nameCode?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/landlines\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/landlines\/countryDialing?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/landlines\/areaDialing?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/landlines\/dialNumber?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/landlines\/extension?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/landlines\/access?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/landlines\/formattedNumber?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/landlines\/itemID?;
    BooleanType '\/workers\/workAssignments\/homeWorkLocation\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/workers\/workAssignments\/homeWorkLocation\/communication\/mobiles?;
    StringCodeListType '\/workers\/workAssignments\/homeWorkLocation\/communication\/mobiles\/nameCode?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/mobiles\/countryDialing?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/mobiles\/areaDialing?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/mobiles\/dialNumber?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/mobiles\/extension?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/mobiles\/access?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/mobiles\/formattedNumber?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/mobiles\/itemID?;
    BooleanType '\/workers\/workAssignments\/homeWorkLocation\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/workers\/workAssignments\/homeWorkLocation\/communication\/emails?;
    StringCodeListType '\/workers\/workAssignments\/homeWorkLocation\/communication\/emails\/nameCode?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/emails\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/emails\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/emails\/emailUri?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/emails\/itemID?;
    BooleanType '\/workers\/workAssignments\/homeWorkLocation\/communication\/emails\/notificationIndicator?;
    ArrayType '\/workers\/workAssignments\/homeWorkLocation\/communication\/socialNetworks?;
    StringCodeListType '\/workers\/workAssignments\/homeWorkLocation\/communication\/socialNetworks\/nameCode?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/socialNetworks\/uri?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/socialNetworks\/itemID?;
    BooleanType '\/workers\/workAssignments\/homeWorkLocation\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/workers\/workAssignments\/homeWorkLocation\/communication\/faxes?;
    StringCodeListType '\/workers\/workAssignments\/homeWorkLocation\/communication\/faxes\/nameCode?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/faxes\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/faxes\/countryDialing?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/faxes\/areaDialing?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/faxes\/dialNumber?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/faxes\/extension?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/faxes\/access?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/faxes\/formattedNumber?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/faxes\/itemID?;
    BooleanType '\/workers\/workAssignments\/homeWorkLocation\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/workers\/workAssignments\/homeWorkLocation\/communication\/pagers?;
    StringCodeListType '\/workers\/workAssignments\/homeWorkLocation\/communication\/pagers\/nameCode?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/pagers\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/pagers\/countryDialing?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/pagers\/areaDialing?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/pagers\/dialNumber?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/pagers\/extension?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/pagers\/access?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/pagers\/formattedNumber?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/pagers\/itemID?;
    BooleanType '\/workers\/workAssignments\/homeWorkLocation\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/workers\/workAssignments\/homeWorkLocation\/communication\/internetAddresses?;
    StringCodeListType '\/workers\/workAssignments\/homeWorkLocation\/communication\/internetAddresses\/nameCode?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/internetAddresses\/uri?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/internetAddresses\/itemID?;
    ArrayType '\/workers\/workAssignments\/homeWorkLocation\/communication\/instantMessages?;
    StringCodeListType '\/workers\/workAssignments\/homeWorkLocation\/communication\/instantMessages\/nameCode?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/instantMessages\/uri?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/communication\/instantMessages\/itemID?;
    BooleanType '\/workers\/workAssignments\/homeWorkLocation\/communication\/instantMessages\/notificationIndicator?;
    ObjectType '\/workers\/workAssignments\/homeWorkLocation\/address?;
    StringCodeListType '\/workers\/workAssignments\/homeWorkLocation\/address\/nameCode?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/attentionOfName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/careOfName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/lineOne?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/lineTwo?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/lineThree?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/cityName?;
    StringCodeListType '\/workers\/workAssignments\/homeWorkLocation\/address\/countrySubdivisionLevel1?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/workers\/workAssignments\/homeWorkLocation\/address\/countryCode?;
    StringCodeListType '\/workers\/workAssignments\/homeWorkLocation\/address\/postalCode?;
    ObjectType '\/workers\/workAssignments\/homeWorkLocation\/address\/geoCoordinate?;
    NumberType '\/workers\/workAssignments\/homeWorkLocation\/address\/geoCoordinate\/latitude?;
    NumberType '\/workers\/workAssignments\/homeWorkLocation\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/workers\/workAssignments\/homeWorkLocation\/address\/scriptCode?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/scriptCode\/codeValue?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/scriptCode\/shortName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/scriptCode\/longName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/lineFour?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/lineFive?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/buildingNumber?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/buildingName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/blockName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/streetName?;
    StringCodeListType '\/workers\/workAssignments\/homeWorkLocation\/address\/streetTypeCode?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/streetTypeCode\/codeValue?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/streetTypeCode\/shortName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/streetTypeCode\/longName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/unit?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/floor?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/stairCase?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/door?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/postOfficeBox?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/deliveryPoint?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/plotID?;
    StringCodeListType '\/workers\/workAssignments\/homeWorkLocation\/address\/countrySubdivisionLevel2?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/workers\/workAssignments\/homeWorkLocation\/address\/countrySubdivisionLevel2\/subdivisionType?;
    ArrayType '\/workers\/workAssignments\/assignedWorkLocations?;
    StringCodeListType '\/workers\/workAssignments\/assignedWorkLocations\/nameCode?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/nameCode\/longName?;
    ObjectType '\/workers\/workAssignments\/assignedWorkLocations\/communication?;
    ArrayType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/landlines?;
    StringCodeListType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/landlines\/nameCode?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/landlines\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/landlines\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/landlines\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/landlines\/countryDialing?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/landlines\/areaDialing?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/landlines\/dialNumber?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/landlines\/extension?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/landlines\/access?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/landlines\/formattedNumber?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/landlines\/itemID?;
    BooleanType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/landlines\/notificationIndicator?;
    ArrayType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/mobiles?;
    StringCodeListType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/mobiles\/nameCode?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/mobiles\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/mobiles\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/mobiles\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/mobiles\/countryDialing?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/mobiles\/areaDialing?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/mobiles\/dialNumber?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/mobiles\/extension?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/mobiles\/access?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/mobiles\/formattedNumber?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/mobiles\/itemID?;
    BooleanType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/mobiles\/notificationIndicator?;
    ArrayType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/emails?;
    StringCodeListType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/emails\/nameCode?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/emails\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/emails\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/emails\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/emails\/emailUri?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/emails\/itemID?;
    BooleanType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/emails\/notificationIndicator?;
    ArrayType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/socialNetworks?;
    StringCodeListType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/socialNetworks\/nameCode?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/socialNetworks\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/socialNetworks\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/socialNetworks\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/socialNetworks\/uri?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/socialNetworks\/itemID?;
    BooleanType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/socialNetworks\/notificationIndicator?;
    ArrayType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/faxes?;
    StringCodeListType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/faxes\/nameCode?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/faxes\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/faxes\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/faxes\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/faxes\/countryDialing?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/faxes\/areaDialing?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/faxes\/dialNumber?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/faxes\/extension?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/faxes\/access?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/faxes\/formattedNumber?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/faxes\/itemID?;
    BooleanType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/faxes\/notificationIndicator?;
    ArrayType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/pagers?;
    StringCodeListType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/pagers\/nameCode?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/pagers\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/pagers\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/pagers\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/pagers\/countryDialing?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/pagers\/areaDialing?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/pagers\/dialNumber?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/pagers\/extension?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/pagers\/access?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/pagers\/formattedNumber?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/pagers\/itemID?;
    BooleanType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/pagers\/notificationIndicator?;
    ArrayType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/internetAddresses?;
    StringCodeListType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/internetAddresses\/nameCode?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/internetAddresses\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/internetAddresses\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/internetAddresses\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/internetAddresses\/uri?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/internetAddresses\/itemID?;
    ArrayType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/instantMessages?;
    StringCodeListType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/instantMessages\/nameCode?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/instantMessages\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/instantMessages\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/instantMessages\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/instantMessages\/uri?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/instantMessages\/itemID?;
    BooleanType '\/workers\/workAssignments\/assignedWorkLocations\/communication\/instantMessages\/notificationIndicator?;
    ObjectType '\/workers\/workAssignments\/assignedWorkLocations\/address?;
    StringCodeListType '\/workers\/workAssignments\/assignedWorkLocations\/address\/nameCode?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/nameCode\/longName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/attentionOfName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/careOfName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/lineOne?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/lineTwo?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/lineThree?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/cityName?;
    StringCodeListType '\/workers\/workAssignments\/assignedWorkLocations\/address\/countrySubdivisionLevel1?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/countrySubdivisionLevel1\/codeValue?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/countrySubdivisionLevel1\/shortName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/countrySubdivisionLevel1\/longName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/countrySubdivisionLevel1\/subdivisionType?;
    StringCodeListType '\/workers\/workAssignments\/assignedWorkLocations\/address\/countryCode?;
    StringCodeListType '\/workers\/workAssignments\/assignedWorkLocations\/address\/postalCode?;
    ObjectType '\/workers\/workAssignments\/assignedWorkLocations\/address\/geoCoordinate?;
    NumberType '\/workers\/workAssignments\/assignedWorkLocations\/address\/geoCoordinate\/latitude?;
    NumberType '\/workers\/workAssignments\/assignedWorkLocations\/address\/geoCoordinate\/longitude?;
    StringCodeListType '\/workers\/workAssignments\/assignedWorkLocations\/address\/scriptCode?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/scriptCode\/codeValue?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/scriptCode\/shortName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/scriptCode\/longName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/lineFour?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/lineFive?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/buildingNumber?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/buildingName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/blockName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/streetName?;
    StringCodeListType '\/workers\/workAssignments\/assignedWorkLocations\/address\/streetTypeCode?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/streetTypeCode\/codeValue?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/streetTypeCode\/shortName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/streetTypeCode\/longName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/unit?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/floor?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/stairCase?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/door?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/postOfficeBox?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/deliveryPoint?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/plotID?;
    StringCodeListType '\/workers\/workAssignments\/assignedWorkLocations\/address\/countrySubdivisionLevel2?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/countrySubdivisionLevel2\/codeValue?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/countrySubdivisionLevel2\/shortName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/countrySubdivisionLevel2\/longName?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/address\/countrySubdivisionLevel2\/subdivisionType?;
    StringType '\/workers\/workAssignments\/assignedWorkLocations\/itemID?;
    StringCodeListType '\/workers\/workAssignments\/remunerationBasisCode?;
    StringType '\/workers\/workAssignments\/remunerationBasisCode\/codeValue?;
    StringType '\/workers\/workAssignments\/remunerationBasisCode\/shortName?;
    StringType '\/workers\/workAssignments\/remunerationBasisCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/payCycleCode?;
    StringType '\/workers\/workAssignments\/payCycleCode\/codeValue?;
    StringType '\/workers\/workAssignments\/payCycleCode\/shortName?;
    StringType '\/workers\/workAssignments\/payCycleCode\/longName?;
    ObjectType '\/workers\/workAssignments\/standardPayPeriodHours?;
    NumberType '\/workers\/workAssignments\/standardPayPeriodHours\/hoursQuantity?;
    StringCodeListType '\/workers\/workAssignments\/standardPayPeriodHours\/unitCode?;
    StringType '\/workers\/workAssignments\/standardPayPeriodHours\/unitCode\/codeValue?;
    StringType '\/workers\/workAssignments\/standardPayPeriodHours\/unitCode\/shortName?;
    StringType '\/workers\/workAssignments\/standardPayPeriodHours\/unitCode\/longName?;
    ObjectType '\/workers\/workAssignments\/baseRemuneration?;
    ObjectType '\/workers\/workAssignments\/baseRemuneration\/hourlyRateAmount?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/hourlyRateAmount\/nameCode?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/hourlyRateAmount\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/hourlyRateAmount\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/hourlyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/workers\/workAssignments\/baseRemuneration\/hourlyRateAmount\/amountValue?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/hourlyRateAmount\/currencyCode?;
    ObjectType '\/workers\/workAssignments\/baseRemuneration\/dailyRateAmount?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/dailyRateAmount\/nameCode?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/dailyRateAmount\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/dailyRateAmount\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/dailyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/workers\/workAssignments\/baseRemuneration\/dailyRateAmount\/amountValue?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/dailyRateAmount\/currencyCode?;
    ObjectType '\/workers\/workAssignments\/baseRemuneration\/weeklyRateAmount?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/weeklyRateAmount\/nameCode?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/weeklyRateAmount\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/weeklyRateAmount\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/weeklyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/workers\/workAssignments\/baseRemuneration\/weeklyRateAmount\/amountValue?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/weeklyRateAmount\/currencyCode?;
    ObjectType '\/workers\/workAssignments\/baseRemuneration\/monthlyRateAmount?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/monthlyRateAmount\/nameCode?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/monthlyRateAmount\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/monthlyRateAmount\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/monthlyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/workers\/workAssignments\/baseRemuneration\/monthlyRateAmount\/amountValue?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/monthlyRateAmount\/currencyCode?;
    ObjectType '\/workers\/workAssignments\/baseRemuneration\/annualRateAmount?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/annualRateAmount\/nameCode?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/annualRateAmount\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/annualRateAmount\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/annualRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/workers\/workAssignments\/baseRemuneration\/annualRateAmount\/amountValue?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/annualRateAmount\/currencyCode?;
    ObjectType '\/workers\/workAssignments\/baseRemuneration\/commissionRatePercentage?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/commissionRatePercentage\/nameCode?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/commissionRatePercentage\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/commissionRatePercentage\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/commissionRatePercentage\/nameCode\/longName?;
    NumberType '\/workers\/workAssignments\/baseRemuneration\/commissionRatePercentage\/percentageValue?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/commissionRatePercentage\/baseUnitCode?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/commissionRatePercentage\/baseUnitCode\/codeValue?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/commissionRatePercentage\/baseUnitCode\/shortName?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/commissionRatePercentage\/baseUnitCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/recordingBasisCode?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/recordingBasisCode\/codeValue?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/recordingBasisCode\/shortName?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/recordingBasisCode\/longName?;
    ObjectType '\/workers\/workAssignments\/baseRemuneration\/biweeklyRateAmount?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/biweeklyRateAmount\/nameCode?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/biweeklyRateAmount\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/biweeklyRateAmount\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/biweeklyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/workers\/workAssignments\/baseRemuneration\/biweeklyRateAmount\/amountValue?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/biweeklyRateAmount\/currencyCode?;
    ObjectType '\/workers\/workAssignments\/baseRemuneration\/semiMonthlyRateAmount?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/semiMonthlyRateAmount\/nameCode?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/semiMonthlyRateAmount\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/semiMonthlyRateAmount\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/semiMonthlyRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/workers\/workAssignments\/baseRemuneration\/semiMonthlyRateAmount\/amountValue?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/semiMonthlyRateAmount\/currencyCode?;
    ObjectType '\/workers\/workAssignments\/baseRemuneration\/payPeriodRateAmount?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/payPeriodRateAmount\/nameCode?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/payPeriodRateAmount\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/payPeriodRateAmount\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/payPeriodRateAmount\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/workers\/workAssignments\/baseRemuneration\/payPeriodRateAmount\/amountValue?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/payPeriodRateAmount\/currencyCode?;
    ArrayType '\/workers\/workAssignments\/baseRemuneration\/associatedRateQualifiers?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/associatedRateQualifiers\/qualifierObjectTypeCode?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/associatedRateQualifiers\/qualifierObjectTypeCode\/codeValue?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/associatedRateQualifiers\/qualifierObjectTypeCode\/shortName?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/associatedRateQualifiers\/qualifierObjectTypeCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/baseRemuneration\/associatedRateQualifiers\/qualifierObjectCode?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/associatedRateQualifiers\/qualifierObjectCode\/codeValue?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/associatedRateQualifiers\/qualifierObjectCode\/shortName?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/associatedRateQualifiers\/qualifierObjectCode\/longName?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/associatedRateQualifiers\/qualifierObjectID?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/associatedRateQualifiers\/itemID?;
    StringType '\/workers\/workAssignments\/baseRemuneration\/effectiveDate?;
    ArrayType '\/workers\/workAssignments\/additionalRemunerations?;
    StringCodeListType '\/workers\/workAssignments\/additionalRemunerations\/typeCode?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/typeCode\/codeValue?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/typeCode\/shortName?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/typeCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/additionalRemunerations\/intervalCode?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/intervalCode\/codeValue?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/intervalCode\/shortName?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/intervalCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/additionalRemunerations\/nameCode?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/nameCode\/longName?;
    ObjectType '\/workers\/workAssignments\/additionalRemunerations\/rate?;
    # Context rules for a given object
    AmountValueType '\/workers\/workAssignments\/additionalRemunerations\/rate\/amountValue?;
    StringCodeListType '\/workers\/workAssignments\/additionalRemunerations\/rate\/currencyCode?;
    StringCodeListType '\/workers\/workAssignments\/additionalRemunerations\/rate\/unitCode?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/rate\/unitCode\/codeValue?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/rate\/unitCode\/shortName?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/rate\/unitCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/additionalRemunerations\/rate\/baseUnitCode?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/rate\/baseUnitCode\/codeValue?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/rate\/baseUnitCode\/shortName?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/rate\/baseUnitCode\/longName?;
    NumberType '\/workers\/workAssignments\/additionalRemunerations\/rate\/baseMultiplierValue?;
    ArrayType '\/workers\/workAssignments\/additionalRemunerations\/associatedRateQualifiers?;
    StringCodeListType '\/workers\/workAssignments\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectTypeCode?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectTypeCode\/codeValue?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectTypeCode\/shortName?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectTypeCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectCode?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectCode\/codeValue?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectCode\/shortName?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectCode\/longName?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/associatedRateQualifiers\/qualifierObjectID?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/associatedRateQualifiers\/itemID?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/itemID?;
    StringType '\/workers\/workAssignments\/additionalRemunerations\/effectiveDate?;
    ArrayType '\/workers\/workAssignments\/reportsTo?;
    StringType '\/workers\/workAssignments\/reportsTo\/positionID?;
    StringType '\/workers\/workAssignments\/reportsTo\/positionTitle?;
    StringType '\/workers\/workAssignments\/reportsTo\/associateOID?;
    ObjectType '\/workers\/workAssignments\/reportsTo\/workerID?;
    StringType '\/workers\/workAssignments\/reportsTo\/workerID\/idValue?;
    StringCodeListType '\/workers\/workAssignments\/reportsTo\/workerID\/schemeCode?;
    StringType '\/workers\/workAssignments\/reportsTo\/workerID\/schemeCode\/codeValue?;
    StringType '\/workers\/workAssignments\/reportsTo\/workerID\/schemeCode\/shortName?;
    StringType '\/workers\/workAssignments\/reportsTo\/workerID\/schemeCode\/longName?;
    ObjectType '\/workers\/workAssignments\/reportsTo\/reportsToWorkerName?;
    StringType '\/workers\/workAssignments\/reportsTo\/reportsToWorkerName\/givenName?;
    StringType '\/workers\/workAssignments\/reportsTo\/reportsToWorkerName\/middleName?;
    StringType '\/workers\/workAssignments\/reportsTo\/reportsToWorkerName\/familyName1?;
    StringType '\/workers\/workAssignments\/reportsTo\/reportsToWorkerName\/familyName2?;
    StringType '\/workers\/workAssignments\/reportsTo\/reportsToWorkerName\/formattedName?;
    StringCodeListType '\/workers\/workAssignments\/reportsTo\/reportsToRelationshipCode?;
    StringType '\/workers\/workAssignments\/reportsTo\/reportsToRelationshipCode\/codeValue?;
    StringType '\/workers\/workAssignments\/reportsTo\/reportsToRelationshipCode\/shortName?;
    StringType '\/workers\/workAssignments\/reportsTo\/reportsToRelationshipCode\/longName?;
    StringType '\/workers\/workAssignments\/reportsTo\/itemID?;
    StringCodeListType '\/workers\/workAssignments\/payrollProcessingStatusCode?;
    StringType '\/workers\/workAssignments\/payrollProcessingStatusCode\/codeValue?;
    StringType '\/workers\/workAssignments\/payrollProcessingStatusCode\/shortName?;
    StringType '\/workers\/workAssignments\/payrollProcessingStatusCode\/longName?;
    StringType '\/workers\/workAssignments\/payrollProcessingStatusCode\/effectiveDate?;
    StringCodeListType '\/workers\/workAssignments\/payrollGroupCode?;
    ObjectType '\/workers\/workAssignments\/annualBenefitBaseRate?;
    StringCodeListType '\/workers\/workAssignments\/annualBenefitBaseRate\/nameCode?;
    StringType '\/workers\/workAssignments\/annualBenefitBaseRate\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/annualBenefitBaseRate\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/annualBenefitBaseRate\/nameCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/workers\/workAssignments\/annualBenefitBaseRate\/amountValue?;
    StringCodeListType '\/workers\/workAssignments\/annualBenefitBaseRate\/currencyCode?;
    StringType '\/workers\/workAssignments\/payrollScheduleGroupID?;
    StringType '\/workers\/workAssignments\/payrollFileNumber?;
    StringCodeListType '\/workers\/workAssignments\/payrollRegionCode?;
    StringCodeListType '\/workers\/workAssignments\/payScaleCode?;
    StringType '\/workers\/workAssignments\/payScaleCode\/codeValue?;
    StringType '\/workers\/workAssignments\/payScaleCode\/shortName?;
    StringType '\/workers\/workAssignments\/payScaleCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/payGradeCode?;
    StringType '\/workers\/workAssignments\/payGradeCode\/codeValue?;
    StringType '\/workers\/workAssignments\/payGradeCode\/shortName?;
    StringType '\/workers\/workAssignments\/payGradeCode\/longName?;
    ObjectType '\/workers\/workAssignments\/payGradePayRange?;
    ObjectType '\/workers\/workAssignments\/payGradePayRange\/minimumRate?;
    # Context rules for a given object
    AmountValueType '\/workers\/workAssignments\/payGradePayRange\/minimumRate\/amountValue?;
    StringCodeListType '\/workers\/workAssignments\/payGradePayRange\/minimumRate\/currencyCode?;
    StringCodeListType '\/workers\/workAssignments\/payGradePayRange\/minimumRate\/unitCode?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/minimumRate\/unitCode\/codeValue?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/minimumRate\/unitCode\/shortName?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/minimumRate\/unitCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/payGradePayRange\/minimumRate\/baseUnitCode?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/minimumRate\/baseUnitCode\/codeValue?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/minimumRate\/baseUnitCode\/shortName?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/minimumRate\/baseUnitCode\/longName?;
    NumberType '\/workers\/workAssignments\/payGradePayRange\/minimumRate\/baseMultiplierValue?;
    ObjectType '\/workers\/workAssignments\/payGradePayRange\/medianRate?;
    # Context rules for a given object
    AmountValueType '\/workers\/workAssignments\/payGradePayRange\/medianRate\/amountValue?;
    StringCodeListType '\/workers\/workAssignments\/payGradePayRange\/medianRate\/currencyCode?;
    StringCodeListType '\/workers\/workAssignments\/payGradePayRange\/medianRate\/unitCode?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/medianRate\/unitCode\/codeValue?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/medianRate\/unitCode\/shortName?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/medianRate\/unitCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/payGradePayRange\/medianRate\/baseUnitCode?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/medianRate\/baseUnitCode\/codeValue?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/medianRate\/baseUnitCode\/shortName?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/medianRate\/baseUnitCode\/longName?;
    NumberType '\/workers\/workAssignments\/payGradePayRange\/medianRate\/baseMultiplierValue?;
    ObjectType '\/workers\/workAssignments\/payGradePayRange\/maximumRate?;
    # Context rules for a given object
    AmountValueType '\/workers\/workAssignments\/payGradePayRange\/maximumRate\/amountValue?;
    StringCodeListType '\/workers\/workAssignments\/payGradePayRange\/maximumRate\/currencyCode?;
    StringCodeListType '\/workers\/workAssignments\/payGradePayRange\/maximumRate\/unitCode?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/maximumRate\/unitCode\/codeValue?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/maximumRate\/unitCode\/shortName?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/maximumRate\/unitCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/payGradePayRange\/maximumRate\/baseUnitCode?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/maximumRate\/baseUnitCode\/codeValue?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/maximumRate\/baseUnitCode\/shortName?;
    StringType '\/workers\/workAssignments\/payGradePayRange\/maximumRate\/baseUnitCode\/longName?;
    NumberType '\/workers\/workAssignments\/payGradePayRange\/maximumRate\/baseMultiplierValue?;
    NumberType '\/workers\/workAssignments\/compaRatio?;
    StringCodeListType '\/workers\/workAssignments\/payGradeStepCode?;
    StringType '\/workers\/workAssignments\/payGradeStepCode\/codeValue?;
    StringType '\/workers\/workAssignments\/payGradeStepCode\/shortName?;
    StringType '\/workers\/workAssignments\/payGradeStepCode\/longName?;
    ObjectType '\/workers\/workAssignments\/payGradeStepPayRate?;
    # Context rules for a given object
    AmountValueType '\/workers\/workAssignments\/payGradeStepPayRate\/amountValue?;
    StringCodeListType '\/workers\/workAssignments\/payGradeStepPayRate\/currencyCode?;
    StringCodeListType '\/workers\/workAssignments\/payGradeStepPayRate\/unitCode?;
    StringType '\/workers\/workAssignments\/payGradeStepPayRate\/unitCode\/codeValue?;
    StringType '\/workers\/workAssignments\/payGradeStepPayRate\/unitCode\/shortName?;
    StringType '\/workers\/workAssignments\/payGradeStepPayRate\/unitCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/payGradeStepPayRate\/baseUnitCode?;
    StringType '\/workers\/workAssignments\/payGradeStepPayRate\/baseUnitCode\/codeValue?;
    StringType '\/workers\/workAssignments\/payGradeStepPayRate\/baseUnitCode\/shortName?;
    StringType '\/workers\/workAssignments\/payGradeStepPayRate\/baseUnitCode\/longName?;
    NumberType '\/workers\/workAssignments\/payGradeStepPayRate\/baseMultiplierValue?;
    StringType '\/workers\/workAssignments\/nextPayGradeStepDate?;
    StringType '\/workers\/workAssignments\/minimumPayGradeStepDuration?;
    StringCodeListType '\/workers\/workAssignments\/geographicPayDifferentialCode?;
    StringType '\/workers\/workAssignments\/geographicPayDifferentialCode\/codeValue?;
    StringType '\/workers\/workAssignments\/geographicPayDifferentialCode\/shortName?;
    StringType '\/workers\/workAssignments\/geographicPayDifferentialCode\/longName?;
    NumberType '\/workers\/workAssignments\/geographicPayDifferentialPercentage?;
    ObjectType '\/workers\/workAssignments\/customFieldGroup?;
    ArrayType '\/workers\/workAssignments\/customFieldGroup\/amountFields?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/amountFields\/nameCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/amountFields\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/amountFields\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/amountFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/amountFields\/categoryCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/amountFields\/categoryCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/amountFields\/categoryCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/amountFields\/categoryCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/workers\/workAssignments\/customFieldGroup\/amountFields\/amountValue?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/amountFields\/currencyCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/amountFields\/itemID?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/codeFields?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/codeFields\/nameCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/codeFields\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/codeFields\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/codeFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/codeFields\/categoryCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/codeFields\/categoryCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/codeFields\/categoryCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/codeFields\/categoryCode\/longName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/codeFields\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/codeFields\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/codeFields\/longName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/codeFields\/itemID?;
    ArrayType '\/workers\/workAssignments\/customFieldGroup\/dateFields?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/dateFields\/nameCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/dateFields\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/dateFields\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/dateFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/dateFields\/categoryCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/dateFields\/categoryCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/dateFields\/categoryCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/dateFields\/categoryCode\/longName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/dateFields\/dateValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/dateFields\/itemID?;
    ArrayType '\/workers\/workAssignments\/customFieldGroup\/dateTimeFields?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/dateTimeFields\/nameCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/dateTimeFields\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/dateTimeFields\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/dateTimeFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/dateTimeFields\/categoryCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/dateTimeFields\/categoryCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/dateTimeFields\/categoryCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/dateTimeFields\/categoryCode\/longName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/dateTimeFields\/dateTimeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/dateTimeFields\/itemID?;
    ArrayType '\/workers\/workAssignments\/customFieldGroup\/indicatorFields?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/indicatorFields\/nameCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/indicatorFields\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/indicatorFields\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/indicatorFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/indicatorFields\/categoryCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/indicatorFields\/categoryCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/indicatorFields\/categoryCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/indicatorFields\/categoryCode\/longName?;
    BooleanType '\/workers\/workAssignments\/customFieldGroup\/indicatorFields\/indicatorValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/indicatorFields\/itemID?;
    ArrayType '\/workers\/workAssignments\/customFieldGroup\/numberFields?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/numberFields\/nameCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/numberFields\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/numberFields\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/numberFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/numberFields\/categoryCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/numberFields\/categoryCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/numberFields\/categoryCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/numberFields\/categoryCode\/longName?;
    NumberType '\/workers\/workAssignments\/customFieldGroup\/numberFields\/numberValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/numberFields\/itemID?;
    ArrayType '\/workers\/workAssignments\/customFieldGroup\/percentFields?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/percentFields\/nameCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/percentFields\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/percentFields\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/percentFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/percentFields\/categoryCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/percentFields\/categoryCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/percentFields\/categoryCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/percentFields\/categoryCode\/longName?;
    NumberType '\/workers\/workAssignments\/customFieldGroup\/percentFields\/percentValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/percentFields\/itemID?;
    ArrayType '\/workers\/workAssignments\/customFieldGroup\/stringFields?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/stringFields\/nameCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/stringFields\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/stringFields\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/stringFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/stringFields\/categoryCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/stringFields\/categoryCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/stringFields\/categoryCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/stringFields\/categoryCode\/longName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/stringFields\/stringValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/stringFields\/itemID?;
    ArrayType '\/workers\/workAssignments\/customFieldGroup\/telephoneFields?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/telephoneFields\/nameCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/telephoneFields\/nameCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/telephoneFields\/nameCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/telephoneFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/workAssignments\/customFieldGroup\/telephoneFields\/categoryCode?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/telephoneFields\/categoryCode\/codeValue?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/telephoneFields\/categoryCode\/shortName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/telephoneFields\/categoryCode\/longName?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/telephoneFields\/countryDialing?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/telephoneFields\/areaDialing?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/telephoneFields\/dialNumber?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/telephoneFields\/extension?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/telephoneFields\/access?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/telephoneFields\/formattedNumber?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/telephoneFields\/itemID?;
    ArrayType '\/workers\/workAssignments\/customFieldGroup\/links?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/links\/href?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/links\/rel?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/links\/canonicalUri?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/links\/title?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/links\/targetSchema?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/links\/mediaType?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/links\/method?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/links\/encType?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/links\/schema?;
    ArrayType '\/workers\/workAssignments\/customFieldGroup\/links\/payLoadArguments?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/links\/payLoadArguments\/argumentPath?;
    StringType '\/workers\/workAssignments\/customFieldGroup\/links\/payLoadArguments\/argumentValue?;
    ArrayType '\/workers\/workAssignments\/links?;
    StringType '\/workers\/workAssignments\/links\/href?;
    StringType '\/workers\/workAssignments\/links\/rel?;
    StringType '\/workers\/workAssignments\/links\/canonicalUri?;
    StringType '\/workers\/workAssignments\/links\/title?;
    StringType '\/workers\/workAssignments\/links\/targetSchema?;
    StringType '\/workers\/workAssignments\/links\/mediaType?;
    StringType '\/workers\/workAssignments\/links\/method?;
    StringType '\/workers\/workAssignments\/links\/encType?;
    StringType '\/workers\/workAssignments\/links\/schema?;
    ArrayType '\/workers\/workAssignments\/links\/payLoadArguments?;
    StringType '\/workers\/workAssignments\/links\/payLoadArguments\/argumentPath?;
    StringType '\/workers\/workAssignments\/links\/payLoadArguments\/argumentValue?;
    StringType '\/workers\/workAssignments\/itemID?;
    ObjectType '\/workers\/customFieldGroup?;
    ArrayType '\/workers\/customFieldGroup\/amountFields?;
    StringCodeListType '\/workers\/customFieldGroup\/amountFields\/nameCode?;
    StringType '\/workers\/customFieldGroup\/amountFields\/nameCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/amountFields\/nameCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/amountFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/customFieldGroup\/amountFields\/categoryCode?;
    StringType '\/workers\/customFieldGroup\/amountFields\/categoryCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/amountFields\/categoryCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/amountFields\/categoryCode\/longName?;
    # Context rules for a given object
    AmountValueType '\/workers\/customFieldGroup\/amountFields\/amountValue?;
    StringCodeListType '\/workers\/customFieldGroup\/amountFields\/currencyCode?;
    StringType '\/workers\/customFieldGroup\/amountFields\/itemID?;
    StringCodeListType '\/workers\/customFieldGroup\/codeFields?;
    StringCodeListType '\/workers\/customFieldGroup\/codeFields\/nameCode?;
    StringType '\/workers\/customFieldGroup\/codeFields\/nameCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/codeFields\/nameCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/codeFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/customFieldGroup\/codeFields\/categoryCode?;
    StringType '\/workers\/customFieldGroup\/codeFields\/categoryCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/codeFields\/categoryCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/codeFields\/categoryCode\/longName?;
    StringType '\/workers\/customFieldGroup\/codeFields\/codeValue?;
    StringType '\/workers\/customFieldGroup\/codeFields\/shortName?;
    StringType '\/workers\/customFieldGroup\/codeFields\/longName?;
    StringType '\/workers\/customFieldGroup\/codeFields\/itemID?;
    ArrayType '\/workers\/customFieldGroup\/dateFields?;
    StringCodeListType '\/workers\/customFieldGroup\/dateFields\/nameCode?;
    StringType '\/workers\/customFieldGroup\/dateFields\/nameCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/dateFields\/nameCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/dateFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/customFieldGroup\/dateFields\/categoryCode?;
    StringType '\/workers\/customFieldGroup\/dateFields\/categoryCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/dateFields\/categoryCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/dateFields\/categoryCode\/longName?;
    StringType '\/workers\/customFieldGroup\/dateFields\/dateValue?;
    StringType '\/workers\/customFieldGroup\/dateFields\/itemID?;
    ArrayType '\/workers\/customFieldGroup\/dateTimeFields?;
    StringCodeListType '\/workers\/customFieldGroup\/dateTimeFields\/nameCode?;
    StringType '\/workers\/customFieldGroup\/dateTimeFields\/nameCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/dateTimeFields\/nameCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/dateTimeFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/customFieldGroup\/dateTimeFields\/categoryCode?;
    StringType '\/workers\/customFieldGroup\/dateTimeFields\/categoryCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/dateTimeFields\/categoryCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/dateTimeFields\/categoryCode\/longName?;
    StringType '\/workers\/customFieldGroup\/dateTimeFields\/dateTimeValue?;
    StringType '\/workers\/customFieldGroup\/dateTimeFields\/itemID?;
    ArrayType '\/workers\/customFieldGroup\/indicatorFields?;
    StringCodeListType '\/workers\/customFieldGroup\/indicatorFields\/nameCode?;
    StringType '\/workers\/customFieldGroup\/indicatorFields\/nameCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/indicatorFields\/nameCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/indicatorFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/customFieldGroup\/indicatorFields\/categoryCode?;
    StringType '\/workers\/customFieldGroup\/indicatorFields\/categoryCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/indicatorFields\/categoryCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/indicatorFields\/categoryCode\/longName?;
    BooleanType '\/workers\/customFieldGroup\/indicatorFields\/indicatorValue?;
    StringType '\/workers\/customFieldGroup\/indicatorFields\/itemID?;
    ArrayType '\/workers\/customFieldGroup\/numberFields?;
    StringCodeListType '\/workers\/customFieldGroup\/numberFields\/nameCode?;
    StringType '\/workers\/customFieldGroup\/numberFields\/nameCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/numberFields\/nameCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/numberFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/customFieldGroup\/numberFields\/categoryCode?;
    StringType '\/workers\/customFieldGroup\/numberFields\/categoryCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/numberFields\/categoryCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/numberFields\/categoryCode\/longName?;
    NumberType '\/workers\/customFieldGroup\/numberFields\/numberValue?;
    StringType '\/workers\/customFieldGroup\/numberFields\/itemID?;
    ArrayType '\/workers\/customFieldGroup\/percentFields?;
    StringCodeListType '\/workers\/customFieldGroup\/percentFields\/nameCode?;
    StringType '\/workers\/customFieldGroup\/percentFields\/nameCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/percentFields\/nameCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/percentFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/customFieldGroup\/percentFields\/categoryCode?;
    StringType '\/workers\/customFieldGroup\/percentFields\/categoryCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/percentFields\/categoryCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/percentFields\/categoryCode\/longName?;
    NumberType '\/workers\/customFieldGroup\/percentFields\/percentValue?;
    StringType '\/workers\/customFieldGroup\/percentFields\/itemID?;
    ArrayType '\/workers\/customFieldGroup\/stringFields?;
    StringCodeListType '\/workers\/customFieldGroup\/stringFields\/nameCode?;
    StringType '\/workers\/customFieldGroup\/stringFields\/nameCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/stringFields\/nameCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/stringFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/customFieldGroup\/stringFields\/categoryCode?;
    StringType '\/workers\/customFieldGroup\/stringFields\/categoryCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/stringFields\/categoryCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/stringFields\/categoryCode\/longName?;
    StringType '\/workers\/customFieldGroup\/stringFields\/stringValue?;
    StringType '\/workers\/customFieldGroup\/stringFields\/itemID?;
    ArrayType '\/workers\/customFieldGroup\/telephoneFields?;
    StringCodeListType '\/workers\/customFieldGroup\/telephoneFields\/nameCode?;
    StringType '\/workers\/customFieldGroup\/telephoneFields\/nameCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/telephoneFields\/nameCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/telephoneFields\/nameCode\/longName?;
    StringCodeListType '\/workers\/customFieldGroup\/telephoneFields\/categoryCode?;
    StringType '\/workers\/customFieldGroup\/telephoneFields\/categoryCode\/codeValue?;
    StringType '\/workers\/customFieldGroup\/telephoneFields\/categoryCode\/shortName?;
    StringType '\/workers\/customFieldGroup\/telephoneFields\/categoryCode\/longName?;
    StringType '\/workers\/customFieldGroup\/telephoneFields\/countryDialing?;
    StringType '\/workers\/customFieldGroup\/telephoneFields\/areaDialing?;
    StringType '\/workers\/customFieldGroup\/telephoneFields\/dialNumber?;
    StringType '\/workers\/customFieldGroup\/telephoneFields\/extension?;
    StringType '\/workers\/customFieldGroup\/telephoneFields\/access?;
    StringType '\/workers\/customFieldGroup\/telephoneFields\/formattedNumber?;
    StringType '\/workers\/customFieldGroup\/telephoneFields\/itemID?;
    ArrayType '\/workers\/customFieldGroup\/links?;
    StringType '\/workers\/customFieldGroup\/links\/href?;
    StringType '\/workers\/customFieldGroup\/links\/rel?;
    StringType '\/workers\/customFieldGroup\/links\/canonicalUri?;
    StringType '\/workers\/customFieldGroup\/links\/title?;
    StringType '\/workers\/customFieldGroup\/links\/targetSchema?;
    StringType '\/workers\/customFieldGroup\/links\/mediaType?;
    StringType '\/workers\/customFieldGroup\/links\/method?;
    StringType '\/workers\/customFieldGroup\/links\/encType?;
    StringType '\/workers\/customFieldGroup\/links\/schema?;
    ArrayType '\/workers\/customFieldGroup\/links\/payLoadArguments?;
    StringType '\/workers\/customFieldGroup\/links\/payLoadArguments\/argumentPath?;
    StringType '\/workers\/customFieldGroup\/links\/payLoadArguments\/argumentValue?;
    ArrayType '\/workers\/links?;
    StringType '\/workers\/links\/href?;
    StringType '\/workers\/links\/rel?;
    StringType '\/workers\/links\/canonicalUri?;
    StringType '\/workers\/links\/title?;
    StringType '\/workers\/links\/targetSchema?;
    StringType '\/workers\/links\/mediaType?;
    StringType '\/workers\/links\/method?;
    StringType '\/workers\/links\/encType?;
    StringType '\/workers\/links\/schema?;
    ArrayType '\/workers\/links\/payLoadArguments?;
    StringType '\/workers\/links\/payLoadArguments\/argumentPath?;
    StringType '\/workers\/links\/payLoadArguments\/argumentValue?;
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

# Context rules for a given object
public type AmountValueType record {
    # True indicates that the property is marked read only in the given context
    boolean readOnly?;
    # True indicates that this property does not need to be valued
    boolean optional?;
    # True indicates that the property is carried in the message - to and from the System of Record, but is not exposed in the UI
    boolean hidden?;
    # Sequence type
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
    # Masking rule type
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
    # Links
    LinkType[] dependencyLinks?;
};

# The URI of the related entity
public type UritypeV01 string;

# Indicator type
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
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links
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
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    LinktypeV02[] links?;
};

public type ValueSetType record {
    ValueSetMeta meta?;
    ValueSetItemType[] valueSetListItems?;
    # Links
    LinkType[] links?;
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
    # Links
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
    # The formatted telephone number.  The component parts of the telephone are put together into a presentation pattern as defined by the regex format specified.  Please note that \ is used as an escape character in regex, but a double \ is needed to escape within the json schema.  The regex will accept +CC NNNNNNNNNNNNNN where + is the symbol indicating the caller to enter their country specific code to call from outside the country.  CC is the country code for an international number (optional), and the area code and dial number.  The local access code (i.e. 1 (201) 333 4444. 1 is the access code in US) is not passed.  The UI will present the phone number following its own presentation convention
    string formattedNumber?;
    # The unique identifier of the object in a collection
    ItemidtypeV01 itemID?;
};

# A code indicating whether the work assignment is covered under applicable wage and labor laws relating to working hours, overtime, and similar protections, e.g. FLSA in the US
public type WagelawcoveragetypeV02 record {
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 wageLawNameCode?;
    # The code for the related entity.  If this is a coded value, codeValue and shortName should be used. If this is just a string value, only shortName is necessary
    CodetypeV02 coverageCode?;
};

# A worker is someone who performs duties and has responsibilities for an organization
public type WorkersWorkers record {
    # The unique identifier of an assoicate
    AssociateoidtypeV02 associateOID?;
    # The unique identifier of the related entity 
    IdtypeV02 workerID?;
    # Object describing the details of a person
    PersontypeV02 person?;
    # These dates are related to the highest level legal relationship that a person has with the organization. If a given worker has multiple relationships with the organization, these are the dates associated with the primary relationship.
    WorkersWorkerdates workerDates?;
    # Status to include the status code, effective date (ISO-8601:2000 format) and the reason for change
    StatusreasontypeV02 workerStatus?;
    # A list of photos
    WorkersPhotos[] photos?;
    # Communication objects to include various communication mechanisms, e,g, phone, email, etc.
    CommunicationtypeV02 businessCommunication?;
    # Work assignments
    WorkassignmentitemtypeV02[] workAssignments?;
    # A container of custom fields. The category within each custom object allows for the categorizing or grouping of the associated custom field for the purpose of data mining. For example, the typeCode on a custom string object might be valued as SIZE and the correlating name codes might be t-shirt, pants, jacket, etc.
    CustomfieldcontainertypeV02 customFieldGroup?;
    # Links
    LinktypeV02[] links?;
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
