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

# traveler type
# age restrictions : CHILD < 12y, HELD_INFANT < 2y, SEATED_INFANT < 2y, SENIOR >=60y
public type TravelerType string;

public type Dictionaries record {
    LocationEntry locations?;
    AircraftEntry aircraft?;
    CurrencyEntry currencies?;
    CarrierEntry carriers?;
};

public type Issue record {
    # the HTTP status code applicable to this error
    int status?;
    # an application-specific error code
    int code?;
    # a short summary of the error
    string title?;
    # explanation of the error
    string detail?;
    # an object containing references to the source of the error
    IssueSource 'source?;
};

# loyalty program information
public type LoyaltyProgram record {
    # loyalty program airline code
    string programOwner?;
    # loyalty program number
    string id?;
};

# address information
public type Address record {
    # Line 1 = Street address, Line 2 = Apartment, suite, unit, building, floor, etc 
    # Each line is limited to 35 characters
    string[] lines?;
    # Example: 74130
    string postalCode?;
    # country code [ISO 3166-1 country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)
    string countryCode?;
    # Full city name. Example: Dublin
    string cityName?;
    # Full state name
    string stateName?;
    # E.g. BP 220
    string postalBox?;
};

public type LocationEntry record {
    string 'key?;
};

public type AircraftEntry record {
    string 'key?;
};

# other payment method
public type OtherPaymentMethod string;

# form of payment used
public type FormOfPayment record {
    # b2b wallet
    B2bWallet b2bWallet?;
    # credit card
    CreditCard creditCard?;
    # other payment method
    OtherMethod other?;
};

public type CurrencyEntry record {
    string 'key?;
};

# a tax
public type Tax record {
    string amount?;
    string code?;
};

# b2b wallet
public type B2bWallet record {
    # card identifier
    string cardId?;
    # card usage name
    string cardUsageName?;
    # card name
    string cardFriendlyName?;
    ReportingData[] reportingData?;
    # detail information of the virtual card
    VirtualCreditCardDetails virtualCreditCardDetails?;
    # Id of the concern flightOffers
    string[] flightOfferIds?;
};

public type AdditionalServicesRequest record {
    # baggageAllowance
    BaggageAllowance chargeableCheckedBags?;
    # seat number
    string chargeableSeatNumber?;
    # Other services to add
    ServiceName[] otherServices?;
};

# the information that are found on an ID document
public type Document record {
    # The document number (shown on the document) . E.g. QFU514563221J
    string number?;
    # Date at which the document has been issued.
    string issuanceDate?;
    # Date after which the document is not valid anymore.
    string expiryDate?;
    # [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the country that issued the document
    string issuanceCountry?;
    # A more precise information concerning the place where the document has been issued, when available. It may be a country, a state, a city or any other type of location. e.g. New-York
    string issuanceLocation?;
    # [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the nationality appearing on the document
    string nationality?;
    # Birth place as indicated on the document
    string birthPlace?;
};

# ticket information
public type AirTravelDocument record {
    *AirTravelDocumentCommon;
    # id of the impacted traveler
    string travelerId?;
    # Ids of the impacted segments
    string[] segmentIds?;
};

# general remark type
public type GeneralRemarkType string;

# name
public type Name record {
    *BaseName;
    # second last name
    string secondLastName?;
};

# an object containing references to the source of the error
public type IssueSource record {
    # a JSON Pointer [RFC6901] to the associated entity in the request document
    string pointer?;
    # a string indicating which URI query parameter caused the issue
    string 'parameter?;
    # a string indicating an example of the right value
    string example?;
};

# stakeholder definition
public type Stakeholder record {
    # item identifier
    string id;
    # The date of birth in ISO 8601 format (yyyy-mm-dd)
    string dateOfBirth?;
    # Gender for individual
    StakeholderGender gender?;
    # name
    Name name;
    # Advanced Passenger Information - regulatory identity documents - SSR DOCS & DOCO elements
    IdentityDocument[] documents?;
};

# remarks
public type Remarks record {
    # list of general remarks
    GeneralRemark[] general?;
    # list of airline remarks
    AirlineRemark[] airline?;
};

public type SuccessBooking record {
    CollectionMetaLink meta?;
    Issue[] warnings?;
    # input parameter to create a flight order
    FlightOrder data;
    Dictionaries dictionaries?;
};

# credit card common attribute
public type CreditCardCommon record {
    # credit card brand
    CreditCardBrand brand?;
    # card holder as on the card
    string holder?;
    # card number
    string number?;
    # credit card expiration date following [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) (YYYY-MM format, e.g. 2012-08)
    string expiryDate?;
};

public type Error500 record {
    Issue[] errors;
};

public type LocationValue record {
    # City code associated to the airport
    string cityCode?;
    # Country code of the airport
    string countryCode?;
};

public type FlightOffer record {
    # the resource name
    string 'type;
    # Id of the flight offer
    string id;
    # source of the flight offer
    FlightOfferSource 'source?;
    # If true, inform that a ticketing will be required at booking step.
    boolean instantTicketingRequired?;
    # BOOK step ONLY - If true, allows to book a PNR without pricing. Only for the source "GDS"
    boolean disablePricing?;
    # If true, upon completion of the booking, this pricing solution is expected to yield multiple records (a record contains booking information confirmed and stored, typically a Passenger Name Record (PNR), in the provider GDS or system)
    boolean nonHomogeneous?;
    # If true, the flight offer fulfills only one originDestination and has to be combined with other oneWays to complete the whole journey.
    boolean oneWay?;
    # If true, a payment card is mandatory to book this flight offer
    boolean paymentCardRequired?;
    # If booked on the same day as the search (with respect to timezone), this flight offer is guaranteed to be thereafter valid for ticketing until this date (included). Unspecified when it does not make sense for this flight offer (e.g. no control over ticketing once booked). YYYY-MM-DD format, e.g. 2019-06-07
    string lastTicketingDate?;
    # Number of seats bookable in a single request. Can not be higher than 9.
    decimal numberOfBookableSeats?;
    Itineraries[] itineraries?;
    # price information
    ExtendedPrice price?;
    PricingOptions pricingOptions?;
    # This option ensures that the system will only consider these airlines.
    string[] validatingAirlineCodes?;
    # Fare information for each traveler/segment
    TravelerPricing[] travelerPricings?;
};

# describes the relation between the current reservation and another one
public type AssociatedRecordCommon record {
    # Record locator [Amadeus or OA] with which the current reservation is related. In case of a codeshare relation, it enables to identify the operating PNR.
    string reference?;
    # Creation date of the referenced reservation. Date and time in [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) YYYY-MM-ddThh:mm:ss.sss format, e.g. 2019-07-09T12:30:00.000
    string creationDate?;
    # Designates the system which has originated the referenced reservation.
    string originSystemCode?;
};

# Provides information on ticketing arrangements and Amadeus Time Limits
public type AutomatedProcessCommon record {
    # queuing action to be taken
    AutomatedProcessCode code?;
    # Identifies the queue onto which PNR must be automatically placed upon process execution.
    Queue queue?;
    # Free text
    string text?;
};

# quality of service offered in the cabin where the seat is located in this flight. Economy, premium economy, business or first class
public type TravelClass string;

# ticketing agreement
public type TicketingAgreement record {
    # Ticketing agreement option
    # * **CONFIRM**, when the payment is done
    # * **DELAY_TO_QUEUE**, queue the reservation at a wished date if the payment is not done
    # * **DELAY_TO_CANCEL**, cancel the reservation at a wished date if the payment is not done
    # 
    # Queueing and cancellation occurs at local date and time. When no time is specified, reservation is queued or cancelled at 00:00.
    TicketingAgreementOption option?;
    # Delay before applying automatic process if no issuance in days
    string delay?;
    # Exact date to apply automatic process if no issuance. YYYY-MM-DD format, e.g. 2019-06-07
    string dateTime?;
    # Ids of the impacted segments
    string[] segmentIds?;
};

# departure or arrival information
public type FlightEndPoint record {
    *OriginalFlightEndPoint;
    # local date and time in [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) YYYY-MM-ddThh:mm:ss format, e.g. 2017-02-10T20:40:00
    string at?;
};

# input parameter to create a flight order
public type FlightOrder record {
    # the resource name
    string 'type;
    # unique identifier of the flight order
    string id?;
    # office Id where to queue the order
    string queuingOfficeId?;
    # office Id where will be transfered the ownership of the order
    string ownerOfficeId?;
    # list of associated record
    AssociatedRecord[] associatedRecords?;
    # list of flight offer
    FlightOffer[] flightOffers;
    # list of travelers
    Traveler[] travelers;
    # remarks
    Remarks remarks?;
    # list of form of payments
    FormOfPayment[] formOfPayments?;
    # ticketing agreement
    TicketingAgreement ticketingAgreement?;
    # list of automatic queuing
    AutomatedProcess[] automatedProcess?;
    # list of general contact information
    Contact[] contacts;
    # list of tickets
    AirTravelDocument[] tickets?;
};

# credit card brand
public type CreditCardBrand string;

# documents of the traveler
public type IdentityDocument record {
    *Document;
    # the nature/type of the document
    DocumentType documentType?;
    # [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the country where the document is valid
    string validityCountry?;
    # [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the country of birth
    string birthCountry?;
    # boolean to specify if the traveler is the holder of the document
    boolean holder?;
};

# description of the name of a physical person
public type BaseName record {
    # First name.
    string firstName?;
    # Last name.
    string lastName?;
    # Middle name(s), for example "Lee" in "John Lee Smith".
    string middleName?;
};

# airline remark type
public type AirlineRemarkType string;

# type of discount applied
public type DiscountTravelerType string;

# departure or arrival information
public type OriginalFlightEndPoint record {
    # [IATA airline codes](http://www.iata.org/publications/Pages/code-search.aspx)
    string iataCode?;
    # terminal name / number
    string terminal?;
};

# details of stops for direct or change of gauge flights
public type OriginalFlightStop record {
    # [IATA airline codes](http://www.iata.org/publications/Pages/code-search.aspx)
    string iataCode?;
    # stop duration in [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) PnYnMnDTnHnMnS format, e.g. PT2H10M
    string duration?;
};

public type CollectionLinks record {
    string self?;
    string next?;
    string previous?;
    string last?;
    string first?;
    string up?;
};

# Fare details of the segment
public type FareDetailsBySegment record {
    # Id of the segment
    string segmentId;
    # quality of service offered in the cabin where the seat is located in this flight. Economy, premium economy, business or first class
    TravelClass cabin?;
    # Fare basis specifying the rules of a fare. Usually, though not always, is composed of the booking class code followed by a set of letters and digits representing other characteristics of the ticket, such as refundability, minimum stay requirements, discounts or special promotional elements.
    string fareBasis?;
    # The name of the Fare Family corresponding to the fares. Only for the GDS provider and if the airline has fare families filled
    string brandedFare?;
    # The code of the booking class, a.k.a. class of service or Reservations/Booking Designator (RBD)
    string 'class?;
    # True if the corresponding booking class is in an allotment
    boolean isAllotment?;
    AllotmentDetails allotmentDetails?;
    # slice and Dice indicator, such as Local Availability, Sub OnD(Origin and Destination) 1 Availability and Sub OnD 2 Availability
    SliceDiceIndicator sliceDiceIndicator?;
    # baggageAllowance
    BaggageAllowance includedCheckedBags?;
    AdditionalServicesRequest additionalServices?;
};

public type GeneralRemark record {
    # general remark type
    GeneralRemarkType subType;
    # remark category
    string category?;
    # remark free text
    string text;
    # Id of the concerned traveler
    string[] travelerIds?;
    # Id of the concern flightOffers
    string[] flightOfferIds?;
};

public type Price record {
    string currency?;
    # Total amount paid by the user
    string total?;
    # Amount without taxes
    string base?;
    # List of applicable fees
    Fee[] fees?;
    Tax[] taxes?;
    # The amount of taxes which are refundable
    string refundableTaxes?;
};

# type of service
public type ServiceName string;

# type of discount applied
public type DiscountType string;

# source of the flight offer
public type FlightOfferSource string;

public type ReportingData record {
    string name?;
    string value?;
};

# Ticketing agreement option
# * **CONFIRM**, when the payment is done
# * **DELAY_TO_QUEUE**, queue the reservation at a wished date if the payment is not done
# * **DELAY_TO_CANCEL**, cancel the reservation at a wished date if the payment is not done
# 
# Queueing and cancellation occurs at local date and time. When no time is specified, reservation is queued or cancelled at 00:00.
public type TicketingAgreementOption string;

# details of stops for direct or change of gauge flights
public type FlightStop record {
    *OriginalFlightStop;
    # arrival at the stop in [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) YYYY-MM-ddThh:mm:ss format, e.g. 2017-02-10T20:40:00
    string arrivalAt?;
    # departure from the stop in [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) YYYY-MM-ddThh:mm:ss format, e.g. 2017-02-10T20:40:00
    string departureAt?;
};

# emergency contact number
public type EmergencyContact record {
    # Adressee name (e.g. in case of emergency purpose it corresponds to name of the person to be contacted).
    string addresseeName?;
    # Country code of the country (ISO3166-1). E.g. "US" for the United States
    string countryCode?;
    # Phone number. Composed of digits only. The number of digits depends on the country.
    string number?;
    # additional details
    string text?;
};

public type AirTravelDocumentCommon record {
    # Type of the travel document
    string documentType?;
    # Identifier of the travel document prefixed by its owner code [NALC - 3 digits]. Can either be a primary or a conjunctive document number. Necessary for TicketingReference definition.
    string documentNumber?;
    # Status of the travel document contained in the fare element
    string documentStatus?;
};

# traveler discount
public type Discount record {
    # type of discount applied
    DiscountType subType?;
    # city of residence
    string cityName?;
    # type of discount applied
    DiscountTravelerType travelerType?;
    # resident card number
    string cardNumber?;
    # resident certificate number
    string certificateNumber?;
};

# type of fee
public type FeeType string;

# record associated to the order
public type AssociatedRecord record {
    *AssociatedRecordCommon;
    # id of the impacted flight offer
    string flightOfferId?;
};

# the purpose for which this contact is to be used.
#  - STANDARD for standard use, comunication, advertissement etc...
#  - INVOICE for your invoice contact, usually its your billing adress. it's mandatory in france when you buy online
#  - STANDARD_WITHOUT_TRANSMISSION is standard contact that are not share with third party outside of Amadeus
public type ContactPurpose string;

public type AdditionalService record {
    string amount?;
    # additional service type
    AdditionalServiceType 'type?;
};

public type AllotmentDetails record {
    string tourName?;
    string tourReference?;
};

# queuing action to be taken
public type AutomatedProcessCode string;

public type Co2Emission record {
    # Weight of Co2 emitted for the concerned segment
    int weight?;
    # Code to qualify unit as pounds or kilos
    string weightUnit?;
    # quality of service offered in the cabin where the seat is located in this flight. Economy, premium economy, business or first class
    TravelClass cabin?;
};

public type PricingOptions record {
    # type of fare of the flight-offer
    PricingOptionsFareType fareType?;
    # If true, returns the flight-offers with included checked bags only
    boolean includedCheckedBagsOnly?;
    # If true, returns the flight-offers with refundable fares only
    boolean refundableFare?;
    # If true, returns the flight-offers with no restriction fares only
    boolean noRestrictionFare?;
    # If true, returns the flight-offers with no penalty fares only
    boolean noPenaltyFare?;
};

public type Segment record {
    # Id of the segment
    string id?;
    # Number of stops
    int numberOfStops?;
    # When the flight has a marketing or/and operating airline that is identified as blacklisted by the European Commission. 
    # 
    # To improve travel safety, the European Commission regularly updates the list of the banned carriers from operating in Europe. It allows any Travel Agency located in the European Union to easily identify and hide any travel recommendation based on some unsafe airlines. 
    # The [list of the banned airlines](https://ec.europa.eu/transport/sites/transport/files/air-safety-list_en.pdf) is published in the Official Journal of the European Union, where they are included as annexes A and B to the Commission Regulation. The blacklist of an airline can concern all its flights or some specific aircraft types pertaining to the airline   
    boolean blacklistedInEU?;
    # Co2 informations
    Co2Emission[] co2Emissions?;
    *FlightSegment;
};

# defining a flight segment; including both operating and marketing details when applicable
public type FlightSegment record {
    # departure or arrival information
    FlightEndPoint departure?;
    # departure or arrival information
    FlightEndPoint arrival?;
    # providing the airline / carrier code
    string carrierCode?;
    # the flight number as assigned by the carrier
    string number?;
    # information related to the aircraft
    AircraftEquipment aircraft?;
    # information about the operating flight
    OperatingFlight operating?;
    # stop duration in [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) PnYnMnDTnHnMnS format, e.g. PT2H10M
    string duration?;
    # information regarding the different stops composing the flight segment. E.g. technical stop, change of gauge...
    FlightStop[] stops?;
};

# automatic process applied to the Order
public type AutomatedProcess record {
    *AutomatedProcessCommon;
    # Delay before applying process in days
    string delay?;
    # Office into which the process must be triggered.
    string officeId?;
    # Datetime limit at which the process takes action in case issuance is not done.
    string dateTime?;
};

# price information
public type ExtendedPrice record {
    # BOOK step ONLY - The price margin percentage (plus or minus) that the booking can tolerate. When set to 0, then no price magin is tolerated.
    string margin?;
    # Total amount paid by the user (including fees and selected additional services).
    string grandTotal?;
    # Currency of the payment. It may be different than the requested currency
    string billingCurrency?;
    AdditionalService[] additionalServices?;
    *Price;
};

# phone information
public type Phone record {
    # Type of the device (Landline, Mobile or Fax)
    PhoneDeviceType deviceType;
    # Country calling code of the phone number, as defined by the International Communication Union. Examples - "1" for US, "371" for Latvia.
    string countryCallingCode;
    # Phone number. Composed of digits only. The number of digits depends on the country.
    string number;
};

public type CollectionMetaLink record {
    int count?;
    CollectionLinks links?;
};

# elementaryPrice
public type ElementaryPrice record {
    # Amount of the fare. could be alpha numeric. Ex- 500.20 or 514.13A, 'A'signifies additional collection.
    string amount?;
    # Currency type of the fare.
    string currencyCode?;
};

# represents a contact
public type ContactDictionary record {
    # name
    Name addresseeName?;
    # address information
    Address address?;
    # the preferred language of communication with this Contact
    string language?;
    # the purpose for which this contact is to be used.
    #  - STANDARD for standard use, comunication, advertissement etc...
    #  - INVOICE for your invoice contact, usually its your billing adress. it's mandatory in france when you buy online
    #  - STANDARD_WITHOUT_TRANSMISSION is standard contact that are not share with third party outside of Amadeus
    ContactPurpose purpose?;
};

public type FlightOrderQuery record {
    # input parameter to create a flight order
    FlightOrder data?;
};

public type Error400 record {
    Issue[] errors;
};

# Identifies the queue onto which PNR must be automatically placed upon process execution.
public type Queue record {
    string number?;
    string category?;
};

# other payment method
public type OtherMethod record {
    # other payment method
    OtherPaymentMethod method?;
    # Id of the concern flightOffers
    string[] flightOfferIds?;
};

# information related to the aircraft
public type AircraftEquipment record {
    # IATA aircraft code (http://www.flugzeuginfo.net/table_accodes_iata_en.php)
    string code?;
};

# Gender for individual
public type StakeholderGender string;

# a fee
public type Fee record {
    string amount?;
    # type of fee
    FeeType 'type?;
};

public type TravelerPricing record {
    # Id of the traveler
    string travelerId;
    # option specifying a group of fares, which may be valid under certain conditons
    # Can be used to specify special fare discount for a passenger
    TravelerPricingFareOption fareOption;
    # traveler type
    # age restrictions : CHILD < 12y, HELD_INFANT < 2y, SEATED_INFANT < 2y, SENIOR >=60y
    TravelerType travelerType;
    # if type="HELD_INFANT", corresponds to the adult traveler's id who will share the seat
    string associatedAdultId?;
    Price price?;
    FareDetailsBySegment[] fareDetailsBySegment;
};

# the nature/type of the document
public type DocumentType string;

# slice and Dice indicator, such as Local Availability, Sub OnD(Origin and Destination) 1 Availability and Sub OnD 2 Availability
public type SliceDiceIndicator string;

# type of fare of the flight-offer
public type PricingOptionsFareType string[];

# credit card
public type CreditCard record {
    *CreditCardCommon;
    # card security code
    string securityCode?;
    # Id of the concern flightOffers
    string[] flightOfferIds?;
};

# contact information
public type Contact record {
    *ContactDictionary;
    # Phone numbers
    Phone[] phones?;
    # Name of the company
    string companyName?;
    # Email address (e.g. john@smith.com)
    string emailAddress?;
};

# Type of the device (Landline, Mobile or Fax)
public type PhoneDeviceType string;

public type AirlineRemark record {
    # airline remark type
    AirlineRemarkType subType;
    # keyword code - only applicable for subType Keyword
    string keyword?;
    # Code of the airline following IATA standard ([IATA table codes](http://www.iata.org/publications/Pages/code-search.aspx))
    # 
    # When it apply to any airline, value is YY.
    string airlineCode;
    # remark free text
    string text;
    # Id of the concerned traveler
    string[] travelerIds?;
    # Id of the concern flightOffers
    string[] flightOfferIds?;
};

public type Itineraries record {
    # duration in [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) PnYnMnDTnHnMnS format, e.g. PT2H10M for a duration of 2h10m
    string duration?;
    Segment[] segments;
};

# information about the operating flight
public type OperatingFlight record {
    # providing the airline / carrier code
    string carrierCode?;
};

# additional service type
public type AdditionalServiceType string;

public type CarrierEntry record {
    string 'key?;
};

# option specifying a group of fares, which may be valid under certain conditons
# Can be used to specify special fare discount for a passenger
public type TravelerPricingFareOption string;

# the traveler of the trip
public type Traveler record {
    *Stakeholder;
    # emergency contact number
    EmergencyContact emergencyContact?;
    # list of loyalty program followed by the traveler
    LoyaltyProgram[] loyaltyPrograms?;
    # list of element that allow a discount.
    Discount[] discountEligibility?;
    # contact information
    Contact contact?;
};

# detail information of the virtual card
public type VirtualCreditCardDetails record {
    *CreditCardCommon;
    *ElementaryPrice;
};

# baggageAllowance
public type BaggageAllowance record {
    # Total number of units
    int quantity?;
    # Weight of the baggage allowance
    int weight?;
    # Code to qualify unit as pounds or kilos
    string weightUnit?;
};
