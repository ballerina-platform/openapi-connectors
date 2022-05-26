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

public type V1paymentsCard record {
    decimal expMonth?;
    decimal expYear?;
    decimal cardNumber?;
    decimal cvc?;
};

public type Address record {
    string? line1;
    string? line2?;
    string city;
    string? region?;
    string country;
    string countryName;
    string postalCode;
};

public type RoomTypes record {
    string roomTypeId;
    string name;
    string description;
    int maxOccupancy;
    RoomRate[] rates?;
    Image[] images;
    Amenity[] amenities;
};

public type RoomrateComponents record {
    string formatted?;
    string 'type?;
    boolean includedInRate?;
};

public type BookedroomsRateRetailrate record {
    Money total?;
    BookedroomsRateRetailrateTaxesandfees taxesAndFees?;
};

public type HotelagreementDealssellable record {
    int remaining?;
    decimal max?;
};

public type Image record {
    string? altText?;
    decimal height;
    decimal width;
    string url;
};

public type RoomrateRetailrateTaxesandfeesPayathotel record {
    string formatted?;
    string category?;
    Money charge?;
};

public type Pagination record {
    int count?;
    int total?;
    string? next?;
    string? prev?;
};

public type DealrequestLengthofstay record {
    string min?;
    string? max?;
};

public type ListOfHotelAgreements record {
    HotelAgreement[] data?;
    Pagination pagination?;
};

public type HotelExternalurls record {
    string name?;
    string url?;
};

public type BookingCancellation record {
    BookingCancellationFee fee?;
};

public type ListOfDealRequets record {
    DealRequest[] data?;
    Pagination pagination?;
};

public type CancellationPolicy record {
    decimal count?;
    string 'type?;
};

public type RatePlanInfo record {
    RateplaninfoData data?;
    Pagination pagination?;
};

public type BookingsbookingidBookingcontact record {
    string firstName?;
    string lastName?;
    string email?;
};

public type Amenity record {
    decimal code;
    string formatted;
};

public type HotelDescription record {
    string short?;
};

public type Adjustment record {
    string adjustmentId?;
    decimal amount;
    string 'type;
    AdjustmentConditions conditions?;
};

public type HotelCheckin record {
    string 'from?;
    string to?;
};

public type ListOfHotels record {
    Hotel[] data;
    Pagination pagination;
};

public type Booking record {
    string bookingId;
    string status;
    string? hotelConfirmationCode?;
    string 'start;
    string end;
    BookingHotel hotel;
    BookedRooms[] bookedRooms;
    Person contact;
    BookingNotes notes;
    string createdAt;
    string updatedAt;
    BookingCancellation? cancellation?;
    string? paymentBearerToken?;
    string? paymentClientSecret?;
};

public type AdjustmentConditions record {
    string 'type?;
    AdjustmentConditionsRules rules?;
};

public type BookingsRooms record {
    decimal rateId?;
    decimal adults?;
    BookingsbookingidwithratedetailsNotes notes?;
};

public type CurrencyDetails record {
    string code?;
};

public type BookedroomsRate record {
    string 'start;
    string end;
    HotelAgreement? hotelAgreement?;
    BookedroomsRateRetailrate retailRate;
    float sellerCommissionPercentage;
    BookedroomsRateComponents[] components;
    BookedroomsRateCancellationpolicies[] cancellationPolicies;
    decimal maxOccupancy?;
};

public type RateplaninfoData record {
    decimal ratePlanId;
    string hotelId;
    string description;
    BookedroomsRateComponents[] components?;
    Condition conditions;
    Restriction restrictions;
    RoomTypes[] roomTypes;
    Adjustment[] adjustments;
};

public type Payment record {
    string paymentId?;
    string status?;
    string authorisationRedirectUrl?;
    string createdAt?;
};

public type DealrequestBookingwindowrestriction record {
    decimal minDaysBeforeCheckIn?;
    decimal maxDaysBeforeCheckIn?;
};

public type BookedRooms record {
    BookedroomsRoomtype roomType;
    int adults?;
    BookedroomsRate rate;
    Money sellerToImpalaPayment?;
    record {string? fromGuest?; string? fromSeller?;} notes;
};

public type PaymentBody record {
    V1paymentsBillingDetails billing_details?;
    V1paymentsCard card?;
    string redirectUri?;
};

public type Person record {
    string firstName;
    string lastName;
    string email;
    string contactId?;
};

public type Hotel record {
    string hotelId;
    string name;
    string currency;
    float starRating;
    HotelDescription description?;
    boolean contractable;
    string[] emails;
    string? websiteUrl;
    HotelExternalurls[] externalUrls;
    string[] phoneNumbers;
    Image[] images;
    Address address?;
    Location location?;
    string timezone?;
    Amenity[] amenities;
    RoomTypes[] roomTypes;
    decimal roomCount;
    string termsAndConditions;
    string createdAt?;
    string updatedAt?;
    HotelCheckin checkIn;
    HotelCheckin checkOut;
};

public type BookedroomsRateCancellationpolicies record {
    string 'start?;
    string end?;
    string formatted?;
    BookedroomsRateFee fee?;
};

public type RoomrateHotelagreementDealssellable record {
    decimal remaining?;
};

public type BookingidBookingcontactBody record {
    Person bookingContact?;
    string updateBookingVersionAtTimestamp?;
};

public type LengthOfStay record {
    int min?;
    int max?;
};

public type UpdateBookingWithRateDetailsPayload record {
    string 'start?;
    string end?;
    string dealId?;
    BookingsbookingidBookingcontact bookingContact?;
    BookingsbookingidwithratedetailsNotes notes?;
    BookingsbookingidwithratedetailsRooms[] rooms?;
    string paymentType?;
    string updateBookingVersionAtTimestamp?;
};

public type DealRequest record {
    string dealRequestId?;
    string dealRequestStatus?;
    HotelagreementStaydateranges[] stayDateRanges?;
    HotelagreementStaydateranges[] sellableInDateRanges?;
    record {} commission?;
    record {} discount?;
    string? specialInstructions?;
    DealrequestLengthofstay lengthOfStay?;
    record {} cancellationPolicy?;
    string createdAt?;
    string updatedAt?;
    DealrequestBookingwindowrestriction? bookingWindowRestriction?;
    string dealType?;
};

public type BookedroomsRateRetailrateTaxesandfees record {
    RoomrateRetailrateTaxesandfeesPayathotel[] payAtHotel?;
    RoomrateRetailrateTaxesandfeesPayathotel[] includedInRate?;
};

public type RoomrateRetailrate record {
    Money total?;
    RoomrateRetailrateTaxesandfees? taxesAndFees?;
};

public type Money record {
    int amount;
    MoneyCurrency currency;
};

public type HotelagreementStaydateranges record {
    string 'start?;
    string end?;
};

public type BookingCancellationFee record {
    string 'type?;
    string count?;
    Money price?;
};

public type HotelAgreement record {
    string hotelAgreementId;
    string hotelId?;
    string hotelAgreementStatus?;
    HotelagreementStaydateranges stayDateRanges?;
    HotelagreementStaydateranges sellableInDateRanges?;
    record {decimal count?; string 'type?;} commission?;
    string dealId;
    string[] conditions;
    HotelagreementDiscount discount?;
    string? specialInstructions;
    HotelagreementDealssellable dealsSellable?;
    string href?;
    LengthOfStay lengthOfStay?;
    CancellationPolicy? cancellationPolicy?;
    string createdAt?;
    string updatedAt?;
};

public type V1paymentsBillingDetailsAddress record {
    string? line1?;
    string? line2?;
    string city?;
    string country?;
    string postalCode?;
    string state?;
};

public type HotelagreementDiscount record {
    int count?;
    string 'type?;
};

public type ListOfBookings record {
    Booking[] data?;
    Pagination pagination?;
};

public type BookedroomsRateComponents record {
    string formatted?;
    string 'type?;
    boolean includedInRate?;
};

public type Condition record {
    string? cancellationPolicy;
    string cancellationDeadline;
};

public type BookingHotel record {
    string hotelId;
    string name;
    string currency?;
    float starRating;
    string[] emails?;
    string[] phoneNumbers?;
    Image[] images;
    Address address;
    Location location;
    string timezone?;
};

public type BookedroomsRoomtype record {
    string roomTypeId;
    string name;
};

# Payload on updating a booking.
public type UpdateBookingPayload record {
    string 'start?;
    string end?;
    BookingsbookingidBookingcontact bookingContact?;
    BookingsbookingidRooms rooms?;
};

public type AdjustmentConditionsRules record {
    HotelagreementStaydateranges bookableDataRange?;
    AdjustmentConditionsRulesNightsrange nightsRange?;
};

public type V1paymentsBillingDetails record {
    V1paymentsBillingDetailsAddress address?;
};

# payload on booking creation
public type CreateBookingPayload record {
    string 'start?;
    string end?;
    string dealId?;
    Person bookingContact?;
    BookingsbookingidwithratedetailsNotes notes?;
    BookingsRooms[] rooms?;
    string paymentType?;
};

public type BookingsbookingidwithratedetailsRooms record {
    RatePlanSum price?;
    decimal ratePlanId?;
    decimal roomTypeId?;
    decimal adults?;
    BookingsbookingidwithratedetailsNotes notes?;
};

public type RoomrateHotelagreementDiscount record {
    decimal count?;
    string 'type?;
};

public type Restriction record {
    AdjustmentConditionsRulesNightsrange lengthOfStay?;
};

# payload on creating a booking with rate details
public type CreateBookingWithRateDetailsPayload record {
    string 'start?;
    string end?;
    string dealId?;
    BookingsbookingidBookingcontact bookingContact?;
    BookingsbookingidwithratedetailsNotes notes?;
    BookingsbookingidwithratedetailsRooms[] rooms?;
    string paymentType?;
    string updateBookingVersionAtTimestamp?;
};

public type AdjustmentConditionsRulesNightsrange record {
    decimal min?;
    decimal max?;
};

public type BookingsbookingidwithratedetailsNotes record {
    string fromGuest?;
    string fromSeller?;
};

public type BookedroomsRateFee record {
    string 'type?;
    decimal count?;
    Money price?;
};

public type RatePlanSum record {
    int amount?;
    CurrencyDetails currency?;
};

public type BookingNotes record {
    string? fromGuest?;
    string? fromSeller?;
};

public type BookingsbookingidRooms record {
    string rateId?;
    decimal adults?;
};

public type RoomrateHotelagreement record {
    string hotelAgreementId;
    string dealId;
    string[] conditions?;
    RoomrateHotelagreementDiscount discount?;
    string specialInstructions;
    RoomrateHotelagreementDealssellable dealsSellable?;
    string href?;
};

public type MoneyCurrency record {
    string code;
};

public type RoomrateRetailrateTaxesandfees record {
    RoomrateRetailrateTaxesandfeesPayathotel[] payAtHotel?;
    RoomrateRetailrateTaxesandfeesPayathotel[] includedInRate?;
};

public type Location record {
    int latitude;
    int longitude;
};

public type RoomRate record {
    string rateId;
    string 'start;
    string end;
    int maxOccupancy;
    RoomrateRetailrate retailRate;
    Money sellerToImpalaPayment?;
    decimal sellerCommissionPercentage;
    RoomrateComponents[] components;
    RoomrateHotelagreement? hotelAgreement;
};
