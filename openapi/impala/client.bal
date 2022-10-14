// Copyright (c) 2022 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

import ballerina/http;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Provide your API Key as Api-Token. Eg: {x-api-key : <Your API Key>} Your API key can be found in your account
    string xApiKey;
|};

# This is a generated connector for [Impala API v1.0.0](https://docs.impala.travel/docs/booking-api/branches/v1.003/YXBpOjQwMDYwNDY-impala-hotel-booking-api) OpenAPI specification.  
# The Impala API provides the capability to search, book or sell hotels rooms.
# 
# Add room selling to your app with ease, or expand your existing hotel
# portfolio. Access all the marketing material you need to sell a room, from
# hotel amenities to images. Constantly updated, ever expanding and always
# correct. Impala allows you to start selling hotel rooms and earn a
# commission with every booking in hours.
@display {label: "Impala", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Impala](https://impala.travel/signup/) account and obtain tokens using [this guide](https://docs.impala.travel/docs/booking-api/ZG9jOjEwMjE0Mg-book-a-hotel-through-the-api-in-just-5-minutes).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://sandbox.impala.travel/v1/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Retrieve a hotel
    #
    # + 'start - The arrival day of the desired stay range in ISO 8601 format (`YYYY-MM-DD`). 
    # + end - The departure day of the desired stay range in ISO 8601 format (`YYYY-MM-DD`). 
    # + hotelId - (Required) The unique identifier of this hotel on the Impala platform. 
    # + return - OK 
    remote isolated function getHotel(string hotelId, string? 'start = (), string? end = ()) returns Hotel|error {
        string resourcePath = string `/hotels/${getEncodedUri(hotelId)}`;
        map<anydata> queryParam = {"start": 'start, "end": end};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Hotel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all rate plans (rate calendar) for a hotel (Beta endpoint)
    #
    # + updatedatLt - Returns rate plans changed after the supplied date. 
    # + updatedatLte - Returns rate plans changed after the supplied date. 
    # + updatedatEq - Returns rate plans changed after the supplied date. 
    # + updatedatGt - Returns rate plans changed after the supplied date. 
    # + updatedatGte - Returns rate plans changed after the supplied date. 
    # + size - Number of hotels returned on a given page (pagination). 
    # + offset - Offset from the first hotel in the result (for pagination). 
    # + hotelId - (Required) The uuid of hotel for which rate plans are being fetched. 
    # + return - OK 
    remote isolated function listRatePlans(string hotelId, decimal? updatedatLt = (), decimal? updatedatLte = (), decimal? updatedatEq = (), decimal? updatedatGt = (), decimal? updatedatGte = (), int? size = (), int? offset = ()) returns RatePlanInfo|error {
        string resourcePath = string `/hotels/${getEncodedUri(hotelId)}/rate-plans`;
        map<anydata> queryParam = {"updatedAt[lt]": updatedatLt, "updatedAt[lte]": updatedatLte, "updatedAt[eq]": updatedatEq, "updatedAt[gt]": updatedatGt, "updatedAt[gte]": updatedatGte, "size": size, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RatePlanInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all hotels
    #
    # + nameEq - Allows for filtering based on the property name. Available modifiers include equal to (`eq`) or case insensitive search (`like`). Usage example: `?name[like]=palace` 
    # + nameLike - Allows for filtering based on the property name. Available modifiers include equal to (`eq`) or case insensitive search (`like`). Usage example: `?name[like]=palace` 
    # + starratingLt - Allows for filtering based on the starRating of a property. Available modifiers include less than (`lt`), greater than (`gt`), less than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?starRating[gt]=3&starRating[lt]=5` 
    # + starratingLte - Allows for filtering based on the starRating of a property. Available modifiers include less than (`lt`), greater than (`gt`), less than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?starRating[gt]=3&starRating[lt]=5` 
    # + starratingEq - Allows for filtering based on the starRating of a property. Available modifiers include less than (`lt`), greater than (`gt`), less than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?starRating[gt]=3&starRating[lt]=5` 
    # + starratingGt - Allows for filtering based on the starRating of a property. Available modifiers include less than (`lt`), greater than (`gt`), less than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?starRating[gt]=3&starRating[lt]=5` 
    # + starratingGte - Allows for filtering based on the starRating of a property. Available modifiers include less than (`lt`), greater than (`gt`), less than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?starRating[gt]=3&starRating[lt]=5` 
    # + countryEq - Allows for filtering based on the country of a property. The only available modifier for this parameter is equal to (`eq`). Usage example: `?country[eq]=GBR` 
    # + 'start - The arrival day of the desired stay range in ISO 8601 format (`YYYY-MM-DD`). 
    # + end - The departure day of the desired stay range in ISO 8601 format (`YYYY-MM-DD`). 
    # + latitude - The WGS 84 latitude of the location to search around (e.g. `58.386186`). 
    # + longitude - The WGS 84 longitude of the location to search around (e.g. `-9.952549`). 
    # + radius - The distance (in meters) to search around the specified location (e.g. `10000` for 10 km). 
    # + hotelIds - A comma-separated list of hotel ids you wish to filter by (e.g. `60a06628-2c71-44bf-9685-efbd2df4179e,60a06628-2c71-44bf-9685-efbd2df4179e`). 
    # + createdLt - Allows for filtering based on the date and time when this hotel was first added to the Impala platform, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?created[lte]=2020-11-04T19:37:37Z&created[gte]=2020-11-04T15:56:37.000Z` 
    # + createdLte - Allows for filtering based on the date and time when this hotel was first added to the Impala platform, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?created[lte]=2020-11-04T19:37:37Z&created[gte]=2020-11-04T15:56:37.000Z` 
    # + createdEq - Allows for filtering based on the date and time when this hotel was first added to the Impala platform, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?created[lte]=2020-11-04T19:37:37Z&created[gte]=2020-11-04T15:56:37.000Z` 
    # + createdGt - Allows for filtering based on the date and time when this hotel was first added to the Impala platform, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?created[lte]=2020-11-04T19:37:37Z&created[gte]=2020-11-04T15:56:37.000Z` 
    # + createdGte - Allows for filtering based on the date and time when this hotel was first added to the Impala platform, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?created[lte]=2020-11-04T19:37:37Z&created[gte]=2020-11-04T15:56:37.000Z` 
    # + updatedLt - Allows for filtering based on the date and time the content of this hotel was last updated, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?updated[lte]=2020-11-04T19:37:37Z&updated[gte]=2020-11-04T15:56:37.000Z` 
    # + updatedLte - Allows for filtering based on the date and time the content of this hotel was last updated, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?updated[lte]=2020-11-04T19:37:37Z&updated[gte]=2020-11-04T15:56:37.000Z` 
    # + updatedEq - Allows for filtering based on the date and time the content of this hotel was last updated, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?updated[lte]=2020-11-04T19:37:37Z&updated[gte]=2020-11-04T15:56:37.000Z` 
    # + updatedGt - Allows for filtering based on the date and time the content of this hotel was last updated, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?updated[lte]=2020-11-04T19:37:37Z&updated[gte]=2020-11-04T15:56:37.000Z` 
    # + updatedGte - Allows for filtering based on the date and time the content of this hotel was last updated, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?updated[lte]=2020-11-04T19:37:37Z&updated[gte]=2020-11-04T15:56:37.000Z` 
    # + size - Number of hotels returned on a given page (pagination). 
    # + offset - Offset from the first hotel in the result (for pagination). 
    # + sortBy - Order in which the results should be sorted. Currently allows you to sort by `name` (alphabetical), star `rating`, and `distance_m` in meters from the specified latitude/longitude. Allows for a comma-separated list of of arguments with modifiers for `:asc` (ascending) and `:desc` (descending) ordering. 
    # + return - OK 
    remote isolated function listHotels(string? nameEq = (), string? nameLike = (), int? starratingLt = (), int? starratingLte = (), int? starratingEq = (), int? starratingGt = (), int? starratingGte = (), string? countryEq = (), string? 'start = (), string? end = (), decimal? latitude = (), decimal? longitude = (), int? radius = (), string? hotelIds = (), decimal? createdLt = (), decimal? createdLte = (), decimal? createdEq = (), decimal? createdGt = (), decimal? createdGte = (), decimal? updatedLt = (), decimal? updatedLte = (), decimal? updatedEq = (), decimal? updatedGt = (), decimal? updatedGte = (), int? size = (), int? offset = (), string? sortBy = ()) returns ListOfHotels|error {
        string resourcePath = string `/hotels`;
        map<anydata> queryParam = {"name[eq]": nameEq, "name[like]": nameLike, "starRating[lt]": starratingLt, "starRating[lte]": starratingLte, "starRating[eq]": starratingEq, "starRating[gt]": starratingGt, "starRating[gte]": starratingGte, "country[eq]": countryEq, "start": 'start, "end": end, "latitude": latitude, "longitude": longitude, "radius": radius, "hotelIds": hotelIds, "created[lt]": createdLt, "created[lte]": createdLte, "created[eq]": createdEq, "created[gt]": createdGt, "created[gte]": createdGte, "updated[lt]": updatedLt, "updated[lte]": updatedLte, "updated[eq]": updatedEq, "updated[gt]": updatedGt, "updated[gte]": updatedGte, "size": size, "offset": offset, "sortBy": sortBy};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ListOfHotels response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve a booking
    #
    # + bookingId - (Required) The unique identifier of the booking you would like to retrieve. 
    # + return - OK 
    remote isolated function getBooking(string bookingId) returns Booking|error {
        string resourcePath = string `/bookings/${getEncodedUri(bookingId)}`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Booking response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Change a booking
    #
    # + contentType - (optional) content-type header 
    # + bookingId - (Required) The unique identifier of the booking you would like to update. 
    # + payload - Payload on updating a booking  
    # + return - OK 
    remote isolated function updateBooking(string bookingId, UpdateBookingPayload payload, string? contentType = ()) returns Booking|error {
        string resourcePath = string `/bookings/${getEncodedUri(bookingId)}`;
        map<any> headerValues = {"Content-Type": contentType, "x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Booking response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Cancel a booking
    #
    # + bookingId - (Required) The unique identifier of the booking you would like to update. 
    # + return - OK 
    remote isolated function cancelBooking(string bookingId) returns Booking|error {
        string resourcePath = string `/bookings/${getEncodedUri(bookingId)}`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Booking response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Change a booking with rate details
    #
    # + contentType - (optional) content-type header 
    # + bookingId - (Required) The unique identifier of the booking you would like to update. 
    # + payload - Payload on updating a booking with rate details 
    # + return - OK 
    remote isolated function updateBookingWithRateDetails(string bookingId, UpdateBookingWithRateDetailsPayload payload, string? contentType = ()) returns Booking|error {
        string resourcePath = string `/bookings/${getEncodedUri(bookingId)}/with-rate-details`;
        map<any> headerValues = {"Content-Type": contentType, "x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Booking response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Change a booking contact
    #
    # + contentType - (optional) content-type header  
    # + bookingId - (Required) The unique identifier of the booking you would like to update. 
    # + payload - Payload on updating a booking with booking contact 
    # + return - OK 
    remote isolated function updateBookingContact(string bookingId, BookingidBookingcontactBody payload, string? contentType = ()) returns Booking|error {
        string resourcePath = string `/bookings/${getEncodedUri(bookingId)}/booking-contact`;
        map<any> headerValues = {"Content-Type": contentType, "x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Booking response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # List all bookings
    #
    # + startLt - Allows for filtering based on arrival date of the booking in ISO 8601 format (e.g. `2021-12-01`). Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?start[lte]=2021-12-20&start[gte]=2021-12-10` 
    # + startLte - Allows for filtering based on arrival date of the booking in ISO 8601 format (e.g. `2021-12-01`). Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?start[lte]=2021-12-20&start[gte]=2021-12-10` 
    # + startEq - Allows for filtering based on arrival date of the booking in ISO 8601 format (e.g. `2021-12-01`). Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?start[lte]=2021-12-20&start[gte]=2021-12-10` 
    # + startGt - Allows for filtering based on arrival date of the booking in ISO 8601 format (e.g. `2021-12-01`). Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?start[lte]=2021-12-20&start[gte]=2021-12-10` 
    # + startGte - Allows for filtering based on arrival date of the booking in ISO 8601 format (e.g. `2021-12-01`). Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?start[lte]=2021-12-20&start[gte]=2021-12-10` 
    # + endLt - Allows for filtering based on departure date of the booking in ISO 8601 format (e.g. `2021-12-01`). Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?end[lte]=2021-12-25&end[gte]=2021-12-15` 
    # + endLte - Allows for filtering based on departure date of the booking in ISO 8601 format (e.g. `2021-12-01`). Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?end[lte]=2021-12-25&end[gte]=2021-12-15` 
    # + endEq - Allows for filtering based on departure date of the booking in ISO 8601 format (e.g. `2021-12-01`). Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?end[lte]=2021-12-25&end[gte]=2021-12-15` 
    # + endGt - Allows for filtering based on departure date of the booking in ISO 8601 format (e.g. `2021-12-01`). Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?end[lte]=2021-12-25&end[gte]=2021-12-15` 
    # + endGte - Allows for filtering based on departure date of the booking in ISO 8601 format (e.g. `2021-12-01`). Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?end[lte]=2021-12-25&end[gte]=2021-12-15` 
    # + createdLt - Allows for filtering based on creation date and time of the booking in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?created[lte]=2020-11-04T19:37:37Z&created[gte]=2020-11-04T15:56:37.000Z` 
    # + createdLte - Allows for filtering based on creation date and time of the booking in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?created[lte]=2020-11-04T19:37:37Z&created[gte]=2020-11-04T15:56:37.000Z` 
    # + createdEq - Allows for filtering based on creation date and time of the booking in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?created[lte]=2020-11-04T19:37:37Z&created[gte]=2020-11-04T15:56:37.000Z` 
    # + createdGt - Allows for filtering based on creation date and time of the booking in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?created[lte]=2020-11-04T19:37:37Z&created[gte]=2020-11-04T15:56:37.000Z` 
    # + createdGte - Allows for filtering based on creation date and time of the booking in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?created[lte]=2020-11-04T19:37:37Z&created[gte]=2020-11-04T15:56:37.000Z` 
    # + updatedLt - Allows for filtering based on the date and time the booking was last updated, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?updated[lte]=2020-11-04T19:37:37Z&updated[gte]=2020-11-04T15:56:37.000Z` 
    # + updatedLte - Allows for filtering based on the date and time the booking was last updated, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?updated[lte]=2020-11-04T19:37:37Z&updated[gte]=2020-11-04T15:56:37.000Z` 
    # + updatedEq - Allows for filtering based on the date and time the booking was last updated, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?updated[lte]=2020-11-04T19:37:37Z&updated[gte]=2020-11-04T15:56:37.000Z` 
    # + updatedGt - Allows for filtering based on the date and time the booking was last updated, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?updated[lte]=2020-11-04T19:37:37Z&updated[gte]=2020-11-04T15:56:37.000Z` 
    # + updatedGte - Allows for filtering based on the date and time the booking was last updated, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?updated[lte]=2020-11-04T19:37:37Z&updated[gte]=2020-11-04T15:56:37.000Z` 
    # + size - Pagination size. Defaults to 100 if omitted. 
    # + offset - Pagination offset. Defaults to 0 if omitted. 
    # + return - OK 
    remote isolated function listBookings(string? startLt = (), string? startLte = (), string? startEq = (), string? startGt = (), string? startGte = (), string? endLt = (), string? endLte = (), string? endEq = (), string? endGt = (), string? endGte = (), decimal? createdLt = (), decimal? createdLte = (), decimal? createdEq = (), decimal? createdGt = (), decimal? createdGte = (), decimal? updatedLt = (), decimal? updatedLte = (), decimal? updatedEq = (), decimal? updatedGt = (), decimal? updatedGte = (), int? size = (), int? offset = ()) returns ListOfBookings|error {
        string resourcePath = string `/bookings`;
        map<anydata> queryParam = {"start[lt]": startLt, "start[lte]": startLte, "start[eq]": startEq, "start[gt]": startGt, "start[gte]": startGte, "end[lt]": endLt, "end[lte]": endLte, "end[eq]": endEq, "end[gt]": endGt, "end[gte]": endGte, "created[lt]": createdLt, "created[lte]": createdLte, "created[eq]": createdEq, "created[gt]": createdGt, "created[gte]": createdGte, "updated[lt]": updatedLt, "updated[lte]": updatedLte, "updated[eq]": updatedEq, "updated[gt]": updatedGt, "updated[gte]": updatedGte, "size": size, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ListOfBookings response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a booking
    #
    # + contentType - (optional) content-type header 
    # + payload - payload on create booking 
    # + return - Accepted 
    remote isolated function createBooking(CreateBookingPayload payload, string? contentType = ()) returns Booking|error {
        string resourcePath = string `/bookings`;
        map<any> headerValues = {"Content-Type": contentType, "x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Booking response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Create a booking with rate details
    #
    # + contentType - (optional) content-type header 
    # + payload - Payload on creating a booking with rate details 
    # + return - Accepted 
    remote isolated function createBookingWithRateDetails(CreateBookingWithRateDetailsPayload payload, string? contentType = ()) returns Booking|error {
        string resourcePath = string `/bookings/with-rate-details`;
        map<any> headerValues = {"Content-Type": contentType, "x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Booking response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # List all hotel agreements for a deal request
    #
    # + dealRequestId - (Required) The unique identifier for this deal request 
    # + return - OK 
    remote isolated function listHotelAgreements(string dealRequestId) returns ListOfHotelAgreements|error {
        string resourcePath = string `/deal-requests/${getEncodedUri(dealRequestId)}/agreements`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ListOfHotelAgreements response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve a hotel agreement
    #
    # + dealRequestId - (Required) The unique identifier for this deal request 
    # + agreementId - (Required) The unique identifier for this hotel agreement 
    # + return - OK 
    remote isolated function getHotelAgreement(string dealRequestId, string agreementId) returns HotelAgreement|error {
        string resourcePath = string `/deal-requests/${getEncodedUri(dealRequestId)}/agreements/${getEncodedUri(agreementId)}`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        HotelAgreement response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve a deal request
    #
    # + dealRequestId - (Required) The unique identifier for this deal request 
    # + return - OK 
    remote isolated function getDealRequest(string dealRequestId) returns DealRequest|error {
        string resourcePath = string `/deal-requests/${getEncodedUri(dealRequestId)}`;
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DealRequest response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all deal requests
    #
    # + hotelIds - A comma-separated list of hotel ids you wish to filter by (e.g. `60a06628-2c71-44bf-9685-efbd2df4179e,60a06628-2c71-44bf-9685-efbd2df4179e`). Returns deals that have been requested from *any* of the `hotelIds` specified are returned. 
    # + createdLt - Allows for filtering based on the date and time when this deal request was first created, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?created[lte]=2020-11-04T19:37:37Z&created[gte]=2020-11-04T15:56:37.000Z` 
    # + createdLte - Allows for filtering based on the date and time when this deal request was first created, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?created[lte]=2020-11-04T19:37:37Z&created[gte]=2020-11-04T15:56:37.000Z` 
    # + createdEq - Allows for filtering based on the date and time when this deal request was first created, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?created[lte]=2020-11-04T19:37:37Z&created[gte]=2020-11-04T15:56:37.000Z` 
    # + createdGt - Allows for filtering based on the date and time when this deal request was first created, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?created[lte]=2020-11-04T19:37:37Z&created[gte]=2020-11-04T15:56:37.000Z` 
    # + createdGte - Allows for filtering based on the date and time when this deal request was first created, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?created[lte]=2020-11-04T19:37:37Z&created[gte]=2020-11-04T15:56:37.000Z` 
    # + hasHotelAgreementsWithStatus - A comma-separated list of hotel agreement status (`PENDING`, `ACCEPTED` and/or `REJECTED`) to filter by. Deals with one or more connected hotel agreements of the defined status are returned. This allows you to e.g. limit to return only deal requests where at least one hotel has agreed to the terms. 
    # + updatedLt - Allows for filtering based on the date and time the content (e.g. conditions of the detail) of this deal request was last updated, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?updated[lte]=2020-11-04T19:37:37Z&updated[gte]=2020-11-04T15:56:37.000Z` 
    # + updatedLte - Allows for filtering based on the date and time the content (e.g. conditions of the detail) of this deal request was last updated, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?updated[lte]=2020-11-04T19:37:37Z&updated[gte]=2020-11-04T15:56:37.000Z` 
    # + updatedEq - Allows for filtering based on the date and time the content (e.g. conditions of the detail) of this deal request was last updated, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?updated[lte]=2020-11-04T19:37:37Z&updated[gte]=2020-11-04T15:56:37.000Z` 
    # + updatedGt - Allows for filtering based on the date and time the content (e.g. conditions of the detail) of this deal request was last updated, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?updated[lte]=2020-11-04T19:37:37Z&updated[gte]=2020-11-04T15:56:37.000Z` 
    # + updatedGte - Allows for filtering based on the date and time the content (e.g. conditions of the detail) of this deal request was last updated, in ISO 8601 format (e.g. `2020-11-04T17:37:37Z`) and UTC timezone. Available modifiers include less than (`lt`), greater than (`gt`), lower than or equal to (`lte`), greater than or equal to (`gte`) and equal to (`eq`). Usage example: `?updated[lte]=2020-11-04T19:37:37Z&updated[gte]=2020-11-04T15:56:37.000Z` 
    # + size - Number of deal requests returned on a given page (pagination). 
    # + offset - Offset from the first deal request in the result (for pagination). 
    # + sortBy - Order in which the results should be sorted. Currently allows you to sort by `createdAt` and `updatedAt`. 
    # + return - OK 
    remote isolated function listDealRequests(string? hotelIds = (), decimal? createdLt = (), decimal? createdLte = (), decimal? createdEq = (), decimal? createdGt = (), decimal? createdGte = (), string? hasHotelAgreementsWithStatus = (), decimal? updatedLt = (), decimal? updatedLte = (), decimal? updatedEq = (), decimal? updatedGt = (), decimal? updatedGte = (), int? size = (), int? offset = (), string? sortBy = ()) returns ListOfDealRequets|error {
        string resourcePath = string `/deal-requests`;
        map<anydata> queryParam = {"hotelIds": hotelIds, "created[lt]": createdLt, "created[lte]": createdLte, "created[eq]": createdEq, "created[gt]": createdGt, "created[gte]": createdGte, "hasHotelAgreementsWithStatus": hasHotelAgreementsWithStatus, "updated[lt]": updatedLt, "updated[lte]": updatedLte, "updated[eq]": updatedEq, "updated[gt]": updatedGt, "updated[gte]": updatedGte, "size": size, "offset": offset, "sortBy": sortBy};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ListOfDealRequets response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Make a Payment
    #
    # + contentType - (optional) content-type header 
    # + payload - Payload on payment booking 
    # + return - OK 
    remote isolated function makePayment(PaymentBody payload, string? contentType = ()) returns Payment|error {
        string resourcePath = string `/v1/payments`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Payment response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
