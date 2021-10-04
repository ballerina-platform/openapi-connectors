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

# uri to a photo image of the related entity
public type CorporatecontactCorporatecontactPhotouri record {
    # URI
    string href?;
};

# the person (i.e. associate) which the related associate reports to (e.g. Manager)
public type CorporatecontactCorporatecontactReportstoperson record {
    # Person's first name
    string givenName?;
    # A person's middle name or initial
    string middleName?;
    # A person's last name
    string familyName?;
    # A preferred name
    string preferredName?;
    # The name parts of the person to be shown in the UI in the array item order.  They will be sorted based on the sortseq
    CorporatecontactCorporatecontactFormattedname formattedName?;
    # the relative uri of a specific associates detail information.
    CorporatecontactsCorporatecontactsAssociateuri associateUri?;
};

public type CorporatecontactsCorporatecontactsEmail record {
    # The label to be shown on the UI
    string labelName?;
    # Identifies the channel in which the associated entity comes
    string channelCode?;
    # The label shown on the UI identifying the channel
    string channelLabelName?;
    # An email address (i.e. email)
    string uri?;
};

# object describing the details of a contact with respect to the corporate directory.  Corporate Directory limits the information to business information
public type CorporatecontactCorporatecontact record {
    # Person's first name
    string givenName?;
    # A person's middle name or initial
    string middleName?;
    # A person's last name
    string familyName?;
    # A preferred name
    string preferredName?;
    # The name parts of the person to be shown in the UI in the array item order.  They will be sorted based on the sortseq
    CorporatecontactCorporatecontactFormattedname formattedName?;
    # The alternate names of the person to be shown in the UI. Can be expressed in different scripts.
    CorporatecontactsCorporatecontactsAlternatenames[] alternateNames?;
    # Job TItle Description
    string jobTitleDesc?;
    # Department Description
    string departmentDesc?;
    # Employment Status Description
    string employmentStatusDesc?;
    # the person (i.e. associate) which the related associate reports to (e.g. Manager)
    CorporatecontactCorporatecontactReportstoperson reportsToPerson?;
    # Location
    CorporatecontactCorporatecontactLocation[] location?;
    # A list of telephone numbers
    CorporatecontactCorporatecontactPhone[] phone?;
    # A list of electronic addresses (i.e. email)
    CorporatecontactsCorporatecontactsEmail[] email?;
    # list of internet uri.  For example website, home page, etc...
    CorporatecontactCorporatecontactInternet[] internet?;
    # Instant Messaging
    CorporatecontactCorporatecontactInstantmessage[] instantMessage?;
    # the relative uri of a specific associates detail information.
    CorporatecontactsCorporatecontactsAssociateuri associateUri?;
    # uri to a photo image of the related entity
    CorporatecontactCorporatecontactPhotouri photoUri?;
};

# The coordinates of the location of the device as captured by the gps of the device.  Following the W3C Geolocation API Specification.  Reference: http://dev.w3.org/geo/api/spec-source.html#altitude
public type CorporatecontactCorporatecontactCoordinate record {
    # The angle, in degrees, of a position on Earth above the equator. (Latitude is negative for a place below the equator.) specified in decimal degrees
    decimal latitude?;
    # The angle, in degrees, of a position on Earth around the equator from the Greenwich Meridian specified in decimal degrees.
    decimal longitude?;
    # Denotes the height of th eposition, specified in meters above the [WGS84] ellipsoid.
    decimal altitudeMeasure?;
};

public type CorporatecontactCorporatecontactAddressCountrysubdivision record {
    # Qualifies the further division of the Country. These may be Districts, Regions, States, Provinces etc. A possible list of values is as specified in ISO 3166-2. The type attribute identifies the type of this e.g. District, Region etc, and there is a pre-defined list of types supported, with the ability to add new ones as necessary
    string code?;
    string typeCode?;
};

public type CorporateContacts record {
    # object describing the corporate directory list.  last-modified-date: 10-29-2010 rev. 002
    CorporatecontactsCorporatecontacts corporateContacts?;
};

public type CorporatecontactsCorporatecontactsAlternatenames record {
    # The language in which the associated entity is represented
    string languageCode?;
    # The type of script the in which the associated entity is represented. Associated codelist is ISO15924-A. Use the alpha-4 representation versus the single digit numeric representation. Format is lowercase with initial letter capitalized. For example, Cyrillic is Cyrl
    string scriptCode?;
    # The items in the array which the name will be sorted by. First item in the array is 0.
    decimal[] sortseq?;
    # Component parts of the name
    string[] nameParts?;
    # Separators to be inserted between name parts, e.g. space, comma, no separator (null), etc.
    string[] namePartSeparators?;
};

# object describing the corporate directory list.  last-modified-date: 10-29-2010 rev. 002
public type CorporatecontactsCorporatecontacts record {
    # The list of workers of an Organization (Employee or Consultants)
    CorporatecontactsCorporatecontactsContacts[] contacts?;
};

# A worker within the context of an organization (employee or contractor)
public type CorporatecontactsCorporatecontactsContacts record {
    # Person's first name
    string givenName?;
    # A person's middle name or initial
    string middleName?;
    # A person's last name
    string familyName?;
    # The name parts of the person to be shown in the UI in the array item order.  They will be sorted based on the sortseq
    CorporatecontactsCorporatecontactsFormattedname formattedName?;
    # The alternate names of the person to be shown in the UI.  Can be expressed in different scripts.
    CorporatecontactsCorporatecontactsAlternatenames[] alternateNames?;
    # A list of telephone numbers
    CorporatecontactsCorporatecontactsPhone[] phone?;
    # A list of electronic addresses (i.e. email)
    CorporatecontactsCorporatecontactsEmail[] email?;
    # the relative uri of a specific associates detail information.
    CorporatecontactsCorporatecontactsAssociateuri associateUri?;
};

# components of an address
public type CorporatecontactCorporatecontactAddress record {
    # Line One consists of any valid set of the following address components: primary address number, pre-directional (e.g. East) , street name, suffix, post-directional (e.g. SW), secondary address identifier, and secondary address. It may have a Post Office Box, or Private Mail Box Address (e.g. APO/FPO) if it is a Communication Address
    string lineOne?;
    # Line Two consists of any secondary address identifiers which do not fit in Line One. Example is an Apartment or Suite designation. The preference is to fit all designators on Line One which the USPS considers the Delivery Point.
    string lineTwo?;
    # Line Three consists of any additional address designators.
    string lineThree?;
    # Line Four consists of any additional address designators.
    string lineFour?;
    # Line Five consists of any additional address designators.
    string lineFive?;
    # Identifies the town or city.
    string cityName?;
    # Qualifies the further division of the City, for example, a city may have many districts or boroughs. The type attribute identifies the type of this entity; e.g., City, Borough etc., and there is a pre-defined list of types supported, with the ability to add new ones as necessary.
    string citySubdivisionName?;
    # Qualifies the further division of the Country. These may be Districts, Regions, States, Provinces etc. A possible list of values is as specified in ISO 3166-2. The type attribute identifies the type of this e.g. District, Region etc, and there is a pre-defined list of types supported, with the ability to add new ones as necessary
    CorporatecontactCorporatecontactAddressCountrysubdivision[] countrySubdivision?;
    # Country in which the Address is in. ISO_3166-1-alpha-2 code list
    string countryCode?;
    # The string of characters used to identify the postal zone specific to the country where the mail is delivered.
    string postalCode?;
};

public type CorporatecontactCorporatecontactInternet record {
    # The label to be shown on the UI
    string labelName?;
    # Identifies the channel in which the associated entity comes
    string channelCode?;
    # The label shown on the UI identifying the channel
    string channelLabelName?;
    # Uri of the internet address
    string uri?;
};

# name and address of a physical location
public type CorporatecontactCorporatecontactLocation record {
    # The label to be shown on the UI
    string labelName?;
    # The name of the location
    string locationName?;
    # The coordinates of the location of the device as captured by the gps of the device.  Following the W3C Geolocation API Specification.  Reference: http://dev.w3.org/geo/api/spec-source.html#altitude
    CorporatecontactCorporatecontactCoordinate coordinate?;
    # A list of formatted address lines which will be shown on the UI in the order of the array items.  This is mutually exclusive to the component parts of the the address. If this is returned in the JSON it will be used to present on the UI
    string[] formattedAddressLines?;
    # components of an address
    CorporatecontactCorporatecontactAddress address?;
};

public type CorporatecontactCorporatecontactInstantmessage record {
    # The label to be shown on the UI
    string labelName?;
    # Identifies the channel in which the associated entity comes
    string channelCode?;
    # The label shown on the UI identifying the channel
    string channelLabelName?;
    # instant messaging address
    string uri?;
};

public type CorporateContact record {
    # object describing the details of a contact with respect to the corporate directory.  Corporate Directory limits the information to business information
    CorporatecontactCorporatecontact corporateContact?;
};

# The name parts of the person to be shown in the UI in the array item order.  They will be sorted based on the sortseq
public type CorporatecontactsCorporatecontactsFormattedname record {
    # The items in the array which the name will be sorted by. First item in the array is 0.
    decimal[] sortseq?;
    # Component parts of the name
    string[] nameParts?;
    # Separators to be inserted between name parts, e.g. space, comma, no separator (null), etc.
    string[] namePartSeparators?;
};

# the relative uri of a specific associates detail information.
public type CorporatecontactsCorporatecontactsAssociateuri record {
    # URI
    string href?;
};

public type CorporatecontactsCorporatecontactsPhone record {
    # The label to be shown on the UI
    string labelName?;
    # Identifies the channel in which the associated entity comes
    string channelCode?;
    # The label shown on the UI identifying the channel
    string channelLabelName?;
    # The country dialing code is the national prefix to be used when dialing TO that particular country FROM another country.  
    string countryDialing?;
    # The local area dialing code for a telephone number.
    string areaDialing?;
    # The local communication number, not including country dialing or area dialing codes.   If component parts of the telephone number are being communicated then the dialNumber is required.
    string dialNumber?;
    # The extension of the local communication number. In the case of a Telephone Number accessing a Pager Network the Extension maybe the Pager Identification Number required to leave a message for the Pager Number.
    string extension?;
    # The formatted telephone number.  The formatted dial number should start with a + followed by the country code for international phone numbers.
    string formattedDialNumber?;
};

# The name parts of the person to be shown in the UI in the array item order.  They will be sorted based on the sortseq
public type CorporatecontactCorporatecontactFormattedname record {
    # The items in the array which the name will be sorted by. First item in the array is 0.
    decimal[] sortseq?;
    # Component parts of the name
    string[] nameParts?;
    # Separators to be inserted between name parts, e.g. space, comma, no separator (null), etc.
    string[] namePartSeparators?;
};

public type CorporatecontactCorporatecontactPhone record {
    # The label to be shown on the UI
    string labelName?;
    # Identifies the channel in which the associated entity comes
    string channelCode?;
    # The label shown on the UI identifying the channel
    string channelLabelName?;
    # The country dialing code is the national prefix to be used when dialing TO that particular country FROM another country.  
    string countryDialing?;
    # The local area dialing code for a telephone number.
    string areaDialing?;
    # The local communication number, not including country dialing or area dialing codes.   If component parts of the telephone number are being communicated then the dialNumber is required.
    string dialNumber?;
    # The extension of the local communication number. In the case of a Telephone Number accessing a Pager Network the Extension maybe the Pager Identification Number required to leave a message for the Pager Number.
    string extension?;
    # The formatted telephone number.  The formatted dial number should start with a + followed by the country code for international phone numbers.
    string formattedDialNumber?;
};
