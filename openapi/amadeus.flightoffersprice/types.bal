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

public type CurrencyEntry record {
    string 'key?;
};

# a tax
public type Tax record {
    string amount?;
    string code?;
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
    string id?;
    # The date of birth in ISO 8601 format (yyyy-mm-dd)
    string dateOfBirth?;
    # The gender
    StakeholderGender gender?;
    # name
    Name name?;
    # Advanced Passenger Information - regulatory identity documents - SSR DOCS & DOCO elements
    IdentityDocument[] documents?;
};

# checked bag
public type Bags record {
    *BaggageAllowance;
    # Type of service
    string name?;
    # elementaryPrice
    ElementaryPrice price?;
    # Specify if the service is bookable by itinerary  or for all itineraries
    boolean bookableByItinerary?;
    # Id of the segment concerned by the service
    string[] segmentIds?;
    # Id of the traveler concerned by the service
    string[] travelerIds?;
};

public type TermAndCondition record {
    # This defines what type of modification is concerned in this rule.
    string category?;
    string circumstances?;
    boolean notApplicable?;
    string maxPenaltyAmount?;
    Description[] descriptions?;
};

public type IncludedResourcesMap record {
    # Map of fee applied by credit card brand
    record {} 'credit\-card\-fees?;
    # Map of fee applied by bag option
    record {} bags?;
    # Map of fee applied by service
    record {} 'other\-services?;
    # Map of fare rules applied by farebasis
    record {} 'detailed\-fare\-rules?;
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

public type DetailedFareRules record {
    string fareBasis?;
    string name?;
    TermAndCondition fareNotes?;
    # Id of the segment concerned by the fare rule
    string segmentId?;
};

# quality of service offered in the cabin where the seat is located in this flight. Economy, premium economy, business or first class
public type TravelClass string;

# departure or arrival information
public type FlightEndPoint record {
    *OriginalFlightEndPoint;
    # local date and time in [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) YYYY-MM-ddThh:mm:ss format, e.g. 2017-02-10T20:40:00
    string at?;
};

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

public type GetPriceQuery record {
    # input parameter to price flight offers element
    FlightOfferPricingIn data;
};

public type Payment record {
    # credit card brand
    PaymentBrand brand?;
    # The first 6 digits of the credit card
    int binNumber?;
    # Id of the flightOffers to pay
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

public type OtherServices record {
    # type of service
    ServiceName name?;
    # elementaryPrice
    ElementaryPrice price?;
    # Specify if the service is bookable by traveler or for all travelers
    boolean bookableByTraveler?;
    # Specify if the service is bookable by itinerary or for all itineraries
    boolean bookableByItinerary?;
    # Id of the segment concerned by the service
    string[] segmentIds?;
    # Id of the traveler concerned by the service
    string[] travelerIds?;
};

# source of the flight offer
public type FlightOfferSource string;

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

public type Description record {
    string descriptionType?;
    string text?;
};

# type of fee
public type FeeType string;

# the purpose for which this contact is to be used
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

# priced flight Offers and conditions
public type FlightOfferPricingOut record {
    # the resource name
    string 'type;
    # list of flight offer to price
    FlightOffer[] flightOffers;
    # pricing condition at booking level
    BookingRequirements bookingRequirements?;
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

# credit card brand
public type PaymentBrand string;

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
    PhoneDeviceType deviceType?;
    # Country calling code of the phone number, as defined by the International Communication Union. Examples - "1" for US, "371" for Latvia.
    string countryCallingCode?;
    # Phone number. Composed of digits only. The number of digits depends on the country.
    string number?;
};

# elementaryPrice
public type ElementaryPrice record {
    # Amount of the fare. could be alpha numeric. Ex- 500.20 or 514.13A, 'A'signifies additional collection.
    string amount?;
    # Currency type of the fare.
    string currencyCode?;
};

public type CreditCardFee record {
    # credit card brand
    PaymentBrand brand?;
    string amount?;
    string currency?;
    # Id of the flightOffer concerned by the credit card fee
    string flightOfferId?;
};

# represents a contact
public type ContactDictionary record {
    # name
    Name addresseeName?;
    # address information
    Address address?;
    # the preferred language of communication with this Contact
    string language?;
    # the purpose for which this contact is to be used
    ContactPurpose purpose?;
};

public type Error400 record {
    Issue[] errors;
};

public type SuccessPricing record {
    Issue[] warnings?;
    # priced flight Offers and conditions
    FlightOfferPricingOut data;
    IncludedResourcesMap included?;
    Dictionaries dictionaries?;
};

# information related to the aircraft
public type AircraftEquipment record {
    # IATA aircraft code (http://www.flugzeuginfo.net/table_accodes_iata_en.php)
    string code?;
};

# The gender
public type StakeholderGender string;

public type PassengerConditions record {
    # Id of the traveler
    string travelerId?;
    # If true, the gender is required for the concerned traveler for the creation of the flight-order
    boolean genderRequired?;
    # If true, a document is required for the concerned traveler for the creation of the flight-order
    boolean documentRequired?;
    # If true, the isuance city of the document is required for the concerned traveler for the creation of the flight-order
    boolean documentIssuanceCityRequired?;
    # If true, the date of bitrth is required for the concerned traveler for the creation of the flight-order
    boolean dateOfBirthRequired?;
    # If true, the redress is required if any for the concerned traveler for the creation of the flight-order
    boolean redressRequiredIfAny?;
    # If true, the Air France discount is required for the concerned traveler for the creation of the flight-order
    boolean airFranceDiscountRequired?;
    # If true, the Spanish resident discount is required for the concerned traveler for the creation of the flight-order
    boolean spanishResidentDiscountRequired?;
    # If true, the address is required for the concerned traveler for the creation of the flight-order
    boolean residenceRequired?;
};

# input parameter to price flight offers element
public type FlightOfferPricingIn record {
    # the resource name
    string 'type;
    # list of flight offer to price
    FlightOffer[] flightOffers;
    # payment information for retrieve eventual credit card fees
    Payment[] payments?;
    # list of travelers
    Traveler[] travelers?;
};

# a fee
public type Fee record {
    string amount?;
    # type of fee
    FeeType 'type?;
};

# pricing condition at booking level
public type BookingRequirements record {
    # If true, an invoice address is required for the creation of the flight-order
    boolean invoiceAddressRequired?;
    # If true, a postal address is required for the creation of the flight-order
    boolean mailingAddressRequired?;
    # If true, an email address is required for the creation of the flight-order
    boolean emailAddressRequired?;
    # If true, the phone country code (e.g. '33') associated for each phone number is required for the creation of the flight-order
    boolean phoneCountryCodeRequired?;
    # If true, a mobile phone number is required for the creation of the flight-order
    boolean mobilePhoneNumberRequired?;
    # If true, a phone number is required for the creation of the flight-order
    boolean phoneNumberRequired?;
    # If true, a postal code is required for the creation of the flight-order
    boolean postalCodeRequired?;
    # traveler pricing condition
    PassengerConditions[] travelerRequirements?;
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

public type FareRules record {
    # The currency of the penalties
    string currency?;
    TermAndCondition[] rules?;
};

# slice and Dice indicator, such as Local Availability, Sub OnD(Origin and Destination) 1 Availability and Sub OnD 2 Availability
public type SliceDiceIndicator string;

# type of fare of the flight-offer
public type PricingOptionsFareType string[];

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

# baggageAllowance
public type BaggageAllowance record {
    # Total number of units
    int quantity?;
    # Weight of the baggage allowance
    int weight?;
    # Code to qualify unit as pounds or kilos
    string weightUnit?;
};
