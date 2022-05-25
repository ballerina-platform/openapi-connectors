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

# Restriction towards number of connections.
public type ConnectionRestriction record {
    # The maximal number of connections for each itinerary. Value can be 0, 1 or 2.
    decimal maxNumberOfConnections?;
    # Allow to change airport during connection
    boolean airportChangeAllowed?;
    # This option allows the single segment to have one or more intermediate stops (technical stops).
    boolean technicalStopsAllowed?;
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

public type Success record {
    Issue[] warnings?;
    CollectionMetaLink meta?;
    FlightOffer[] data;
    Dictionaries dictionaries?;
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
    # If true, the flight offer can be combined with other oneWays flight-offers to complete the whole journey (one-Way combinable feature).
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
    # This option ensures that the system will only consider offers with these airlines as validating carrier.
    string[] validatingAirlineCodes?;
    # Fare information for each traveler/segment
    TravelerPricing[] travelerPricings?;
};

# quality of service offered in the cabin where the seat is located in this flight. Economy, premium economy, business or first class
public type TravelClass string;

# departure or arrival information
public type FlightEndPoint record {
    *OriginalFlightEndPoint;
    # local date and time in [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) YYYY-MM-ddThh:mm:ss format, e.g. 2017-02-10T20:40:00
    string at?;
};

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

public type CollectionMeta record {
    int count?;
    OneWayCombinations[] oneWayCombinations?;
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

public type OriginDestination record {
    string id?;
    # Origin location, such as a city or an airport. Currently, only the locations defined in [IATA](http://www.iata.org/publications/Pages/code-search.aspx) are supported.
    string originLocationCode?;
    # Include other possible locations around the point, located less than this distance in kilometers away. Max:300
    # 
    # Can not be combined with "dateWindow" or "timeWindow".
    decimal originRadius?;
    # Set of alternative origin location, such as a city or an airport. Currently, only the locations defined in [IATA](http://www.iata.org/publications/Pages/code-search.aspx) are supported.
    string[] alternativeOriginsCodes?;
    # Destination location, such as a city or an airport. Currently, only the locations defined in [IATA](http://www.iata.org/publications/Pages/code-search.aspx) are supported.
    string destinationLocationCode?;
    # Include other possible locations around the point, located less than this distance in kilometers away. Max:300
    # 
    # Can not be combined with "dateWindow" or "timeWindow".
    decimal destinationRadius?;
    # Set of alternative destination location, such as a city or an airport. Currently, only the locations defined in [IATA](http://www.iata.org/publications/Pages/code-search.aspx) are supported.
    string[] alternativeDestinationsCodes?;
    DateTimeRange departureDateTimeRange?;
    DateTimeRange arrivalDateTimeRange?;
    # List of included connections points. When an includedViaPoints option is specified, all FlightOffer returned must at least go via this Connecting Point. Currently, only the locations defined in IATA are supported. Used only by the AMADEUS provider
    string[] includedConnectionPoints?;
    # List of excluded connections points. Any FlightOffer with these connections points will be present in response. Currently, only the locations defined in IATA are supported. Used only by the AMADEUS provider
    string[] excludedConnectionPoints?;
};

# type of service
public type ServiceName string;

# Restriction towards carriers.
public type CarrierRestrictions record {
    # This flag enable/disable filtering of blacklisted airline by EU. The list of the banned airlines is published in the Official Journal of the European Union, where they are included as annexes A and B to the Commission Regulation. The blacklist of an airline can concern all its flights or some specific aircraft types pertaining to the airline
    boolean blacklistedInEUAllowed?;
    # This option ensures that the system will only consider these airlines.
    string[] excludedCarrierCodes?;
    # This option ensures that the system will only consider these airlines.
    string[] includedCarrierCodes?;
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

# type of fee
public type FeeType string;

public type AdditionalService record {
    string amount?;
    # additional service type
    AdditionalServiceType 'type?;
};

public type AllotmentDetails record {
    string tourName?;
    string tourReference?;
};

public type GetFlightOffersQuery record {
    # The currency code, as defined in [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217), to reflect the currency in which this amount is expressed.
    string currencyCode?;
    # Origins and Destinations must be properly ordered in time (chronological order in accordance with the timezone of each location) to describe the journey consistently. Dates and times must not be past nor more than 365 days in the future, according to provider settings.Number of Origins and Destinations must not exceed the limit defined in provider settings.
    OriginDestination[] originDestinations;
    # travelers in the trip. 
    # 
    #  Maximum number of passengers older than 2 yo (CHILD, ADULT, YOUGHT): 9.
    #  Each adult can travel with one INFANT so maximum total number of passengers: 18
    Traveler[] travelers;
    # Allows enable one or more sources. If present in the list, these sources will be called by the system.
    FlightOfferSource[] sources;
    SearchCriteria searchCriteria?;
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
    # Number of stops planned on the segment for technical or operation purpose i.e. refueling
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

public type CollectionMetaLink record {
    int count?;
    CollectionLinks links?;
};

public type DateTimeRange record {
    # Dates are specified in the [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) YYYY-MM-DD format, e.g. 2018-12-25
    string date;
    # Either 1, 2 or 3 extra days around the local date (IxD for +/- x days - Ex: I3D), Either 1 to 3 days after the local date (PxD for +x days - Ex: P3D), or 1 to 3 days before the local date (MxD for -x days - Ex: M3D)
    # 
    # Can not be combined with "originRadius" or "destinationRadius".
    string dateWindow?;
    # Local time. hh:mm:ss format, e.g 10:30:00
    string time?;
    # 1 to 12 hours around (both +and -) the local time. Possibly limited by the number of extra days when specified, i.e.  in some situations, it may not be used to exceed the maximum date range. [1-12]H format, e.g. 6H
    # 
    # Can not be combined with "originRadius" or "destinationRadius".
    string timeWindow?;
};

public type Error400 record {
    Issue[] errors;
};

# fare filter options
public type ExtendedPricingOptions record {
    # If true, returns the flight-offers with included checked bags only
    boolean includedCheckedBagsOnly?;
    # If true, returns the flight-offers with refundable fares only
    boolean refundableFare?;
    # If true, returns the flight-offers with no restriction fares only
    boolean noRestrictionFare?;
    # If true, returns the flight-offers with no penalty fares only
    boolean noPenaltyFare?;
};

# information related to the aircraft
public type AircraftEquipment record {
    # IATA aircraft code (http://www.flugzeuginfo.net/table_accodes_iata_en.php)
    string code?;
};

public type AdditionalInformation record {
    # If true, returns the price of the first additional bag when the airline is an "Amadeus Ancillary Services" member.
    boolean chargeableCheckedBags?;
    # If true, returns the fare family name for each flight-offer which supports fare family
    boolean brandedFares?;
};

public type Success1 record {
    Issue[] warnings?;
    CollectionMeta meta?;
    FlightOffer[] data;
    Dictionaries dictionaries?;
};

public type CabinRestriction record {
    # quality of service offered in the cabin where the seat is located in this flight. Economy, premium economy, business or first class
    TravelClass cabin?;
    # part of the trip covered by the travel class restriction (ALL_SEGMENTS if ommited)
    Coverage coverage?;
    # The list of originDestination identifiers for which the cabinRestriction applies
    string[] originDestinationIds?;
};

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

# part of the trip covered by the travel class restriction (ALL_SEGMENTS if ommited)
public type Coverage string;

# slice and Dice indicator, such as Local Availability, Sub OnD(Origin and Destination) 1 Availability and Sub OnD 2 Availability
public type SliceDiceIndicator string;

public type SearchCriteria record {
    # This option allows to exclude the isAllotment flag associated to a booking class in the search response when it exist.
    boolean excludeAllotments?;
    # This option allows activate the one-way combinable feature
    boolean addOneWayOffers?;
    # Maximum number of flight offers returned (Max 250)
    decimal maxFlightOffers?;
    # maximum price per traveler. By default, no limit is applied. If specified, the value should be a positive number with no decimals
    int maxPrice?;
    # This option allows to default to a standard fareOption if no offers are found for the selected fareOption.
    boolean allowAlternativeFareOptions?;
    # Requests the system to find at least one flight-offer per day, if possible, when a range of dates is specified. Default is false.
    boolean oneFlightOfferPerDay?;
    AdditionalInformation additionalInformation?;
    # fare filter options
    ExtendedPricingOptions pricingOptions?;
    FlightFilters flightFilters?;
};

# type of fare of the flight-offer
public type PricingOptionsFareType string[];

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

public type OneWayCombinations record {
    string originDestinationId?;
    string[] flightOfferIds?;
};

public type FlightFilters record {
    # Allows to search a location outside the borders when a radius around a location is specified. Default is false.
    boolean crossBorderAllowed?;
    # This flag enables/disables the possibility to have more overnight flights in Low Fare Search
    boolean moreOvernightsAllowed?;
    # This option force to retrieve flight-offer with a departure and a return in the same airport
    boolean returnToDepartureAirport?;
    # This flag enable/disable filtering of rail segment (TGV AIR, RAIL ...)
    boolean railSegmentAllowed?;
    # This flag enable/disable filtering of bus segment
    boolean busSegmentAllowed?;
    # Maximum flight time as a percentage relative to the shortest flight time available for the itinerary
    decimal maxFlightTime?;
    # Restriction towards carriers.
    CarrierRestrictions carrierRestrictions?;
    # Restriction towards cabins.
    CabinRestriction[] cabinRestrictions?;
    # Restriction towards number of connections.
    ConnectionRestriction connectionRestriction?;
};

# additional service type
public type AdditionalServiceType string;

public type CarrierEntry record {
    string 'key?;
};

# option specifying a group of fares, which may be valid under certain conditons
# Can be used to specify special fare discount for a passenger
public type TravelerPricingFareOption string;

public type Traveler record {
    string id;
    # traveler type
    # age restrictions : CHILD < 12y, HELD_INFANT < 2y, SEATED_INFANT < 2y, SENIOR >=60y
    TravelerType travelerType;
    # if type="HELD_INFANT", corresponds to the adult travelers's id who will share the seat
    string associatedAdultId?;
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
