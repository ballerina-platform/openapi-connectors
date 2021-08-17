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

# Accessibility features of the living area.
public type LivingAreaAccessibility record {
    # ADA compliant unit. A guestroom designed to accommodate the physical challenges of a guest with mobility and/or auditory and/or visual issues, as determined by legislative policy. Usually features enlarged doorways, roll-in showers with seats, bathroom grab bars, and communication equipment for the hearing and sight challenged.
    boolean adaCompliantUnit?;
    # ADA compliant unit exception.
    string adaCompliantUnitException?;
    # Hearing-accessible doorbell. A visual indicator(s) of a knock or ring at the door.
    boolean hearingAccessibleDoorbell?;
    # Hearing-accessible doorbell exception.
    string hearingAccessibleDoorbellException?;
    # Hearing-accessible fire alarm. A device that gives warning of a fire through flashing lights.
    boolean hearingAccessibleFireAlarm?;
    # Hearing-accessible fire alarm exception.
    string hearingAccessibleFireAlarmException?;
    # Hearing-accessible unit. A guestroom designed to accommodate the physical challenges of a guest with auditory issues.
    boolean hearingAccessibleUnit?;
    # Hearing-accessible unit exception.
    string hearingAccessibleUnitException?;
    # Mobility-accessible bathtub. A bathtub that accomodates the physically challenged with additional railings or hand grips, a transfer seat or lift, and/or a door to enable walking into the tub.
    boolean mobilityAccessibleBathtub?;
    # Mobility-accessible bathtub exception.
    string mobilityAccessibleBathtubException?;
    # Mobility-accessible shower. A shower with an enlarged door or access point to accommodate a wheelchair or a waterproof seat for the physically challenged.
    boolean mobilityAccessibleShower?;
    # Mobility-accessible shower exception.
    string mobilityAccessibleShowerException?;
    # Mobility-accessible toilet. A toilet with a higher seat, grab bars, and/or a larger area around it to accommodate the physically challenged.
    boolean mobilityAccessibleToilet?;
    # Mobility-accessible toilet exception.
    string mobilityAccessibleToiletException?;
    # Mobility-accessible unit. A guestroom designed to accommodate the physical challenges of a guest with mobility and/or auditory and/or visual issues. Usually features enlarged doorways, roll-in showers with seats, bathroom grab bars, and communication equipment for the hearing and sight challenged.
    boolean mobilityAccessibleUnit?;
    # Mobility-accessible unit exception.
    string mobilityAccessibleUnitException?;
};

# An account is a container for your business's locations. If you are the only user who manages locations for your business, you can use your personal Google Account. To share management of locations with multiple users, [create a business account] (https://support.google.com/business/answer/6085339?ref_topic=6085325).
public type Account record {
    # The name of the account. *Note:* For an account with AccountType `PERSONAL`, this is the first and last name of the user account.
    string accountName?;
    # Account reference number if provisioned.
    string accountNumber?;
    # The resource name, in the format `accounts/{account_id}`.
    string name?;
    # Additional Info stored for an organization.
    OrganizationInfo organizationInfo?;
    # Output only. Specifies the PermissionLevel the caller has for this account.
    string permissionLevel?;
    # Output only. Specifies the AccountRole the caller has for this account.
    string role?;
    # Indicates status of the account, such as whether the account has been verified by Google.
    AccountState state?;
    # Output only. Specifies the AccountType of this account.
    string 'type?;
};

# Response message for AccessControl.ListInvitations.
public type ListInvitationsResponse record {
    # A collection of location invitations that are pending for the account. The number of invitations listed here cannot exceed 1000.
    Invitation[] invitations?;
};

# Property rules that impact guests.
public type Policies record {
    # All inclusive available. The hotel offers a rate option that includes the cost of the room, meals, activities, and other amenities that might otherwise be charged separately.
    boolean allInclusiveAvailable?;
    # All inclusive available exception.
    string allInclusiveAvailableException?;
    # All inclusive only. The only rate option offered by the hotel is a rate that includes the cost of the room, meals, activities and other amenities that might otherwise be charged separately.
    boolean allInclusiveOnly?;
    # All inclusive only exception.
    string allInclusiveOnlyException?;
    # Represents a time of day. The date and time zone are either not significant or are specified elsewhere. An API may choose to allow leap seconds. Related types are google.type.Date and `google.protobuf.Timestamp`.
    TimeOfDay checkinTime?;
    # Check-in time exception.
    string checkinTimeException?;
    # Represents a time of day. The date and time zone are either not significant or are specified elsewhere. An API may choose to allow leap seconds. Related types are google.type.Date and `google.protobuf.Timestamp`.
    TimeOfDay checkoutTime?;
    # Check-out time exception.
    string checkoutTimeException?;
    # Kids stay free. The children of guests are allowed to stay in the room/suite of a parent or adult without an additional fee. The policy may or may not stipulate a limit of the child's age or the overall number of children allowed.
    boolean kidsStayFree?;
    # Kids stay free exception.
    string kidsStayFreeException?;
    # Max child age. The hotel allows children up to a certain age to stay in the room/suite of a parent or adult without an additional fee.
    int maxChildAge?;
    # Max child age exception.
    string maxChildAgeException?;
    # Max kids stay free count. The hotel allows a specific, defined number of children to stay in the room/suite of a parent or adult without an additional fee.
    int maxKidsStayFreeCount?;
    # Max kids stay free count exception.
    string maxKidsStayFreeCountException?;
    # Forms of payment accepted at the property.
    PaymentOptions paymentOptions?;
    # Smoke free property. Smoking is not allowed inside the building, on balconies, or in outside spaces. Hotels that offer a designated area for guests to smoke are not considered smoke-free properties.
    boolean smokeFreeProperty?;
    # Smoke free property exception.
    string smokeFreePropertyException?;
};

# Response message for GoogleLocations.SearchGoogleLocations.
public type SearchGoogleLocationsResponse record {
    # A collection of GoogleLocations that are potential matches to the specified request, listed in order from most to least accuracy.
    GoogleLocation[] googleLocations?;
};

# Input for ADDRESS verification.
public type AddressInput record {
    # Contact name the mail should be sent to.
    string mailerContactName?;
};

# Request message for Verifications.FetchVerificationOptions.
public type FetchVerificationOptionsRequest record {
    # Additional data for service business verification.
    ServiceBusinessContext context?;
    # The BCP 47 language code representing the language that is to be used for the verification process. Available options vary by language.
    string languageCode?;
};

# A single insurance network. Next id: 5
public type InsuranceNetwork record {
    # Required. The id of this insurance network generated by Google.
    string networkId?;
    # Output only. A map of network display names in requested languages where the language is the key and localized display name is the value. The display name in English is set by default.
    record {} networkNames?;
    # Output only. A map of payer display names in requested languages where the language is the key and localized display name is the value. The display name in English is set by default.
    record {} payerNames?;
    # Output only. The state of this insurance network.
    string state?;
};

# Defines an area that's represented by a place ID.
public type PlaceInfo record {
    # The localized name of the place. For example, `Scottsdale, AZ`.
    string name?;
    # The ID of the place. Must correspond to a [region.] (https://developers.google.com/places/web-service/supported_types#table3)
    string placeId?;
};

# Request message for Locations.FindMatchingLocations.
public type FindMatchingLocationsRequest record {
    # The preferred language for the matching location (in BCP-47 format).
    string languageCode?;
    # Deprecated. This field is ignored for all requests.
    string maxCacheDuration?;
    # The number of matches to return. The default value is 3, with a maximum of 10. Note that latency may increase if more are requested. There is no pagination.
    int numResults?;
};

# A single list item. Each variation of an item in the price list should have its own Item with its own price data.
public type Item record {
    # Required. ID for the item. Price list, section, and item IDs cannot be duplicated within this Location.
    string itemId?;
    # Required. Language-tagged labels for the item. We recommend that item names be 140 characters or less, and descriptions 250 characters or less. At least one set of labels is required.
    Label[] labels?;
    # Represents an amount of money with its currency type.
    Money price?;
};

# Response message for Media.ListMediaItems.
public type ListMediaItemsResponse record {
    # The returned list of media items.
    MediaItem[] mediaItems?;
    # If there are more media items than the requested page size, then this field is populated with a token to fetch the next page of media items on a subsequent call to ListMediaItems.
    string nextPageToken?;
    # The total number of media items for this location, irrespective of pagination.
    int totalMediaItemCount?;
};

# Represents a [local post](https://support.google.com/business/answer/7662907) for a location.
public type LocalPost record {
    # The type of alert the post is created for. This field is only applicable for posts of topic_type Alert, and behaves as a sub-type of Alerts.
    string alertType?;
    # An action that is performed when the user clicks through the post
    CallToAction callToAction?;
    # Output only. Time of the creation of the post.
    string createTime?;
    # All the information pertaining to an event featured in a local post.
    LocalPostEvent event?;
    # The language of the local post.
    string languageCode?;
    # The media associated with the post. source_url is the only supported data field for a LocalPost MediaItem.
    MediaItem[] media?;
    # Output only. Google identifier for this local post in the form: `accounts/{account_id}/locations/{location_id}/localPosts/{local_post_id}`
    string name?;
    # Specific fields for offer posts.
    LocalPostOffer offer?;
    # Output only. The link to the local post in Google search. This link can be used to share the post via social media, email, text, etc.
    string searchUrl?;
    # Output only. The state of the post, indicating what part of its lifecycle it is in.
    string state?;
    # Description/body of the local post.
    string summary?;
    # Required. The topic type of the post: standard, event, offer, or alert.
    string topicType?;
    # Output only. Time of the last modification of the post made by the user.
    string updateTime?;
};

# Information of all parent and children locations related to this one.
public type RelationshipData record {
    # The resource name of the Chain that this location is member of. How to find Chain ID
    string parentChain?;
};

# Health and safety measures implemented by the hotel during COVID-19.
public type HealthAndSafety record {
    # Enhanced cleaning measures implemented by the hotel during COVID-19.
    EnhancedCleaning enhancedCleaning?;
    # Increased food safety measures implemented by the hotel during COVID-19.
    IncreasedFoodSafety increasedFoodSafety?;
    # Minimized contact measures implemented by the hotel during COVID-19.
    MinimizedContact minimizedContact?;
    # Personal protection measures implemented by the hotel during COVID-19.
    PersonalProtection personalProtection?;
    # Physical distancing measures implemented by the hotel during COVID-19.
    PhysicalDistancing physicalDistancing?;
};

# Represents a review with location information.
public type LocationReview record {
    # Location resource name.
    string name?;
    # Output only. Represents a review for a location.
    Review review?;
};

# Request message for Reviews.BatchGetReviews.
public type BatchGetReviewsRequest record {
    # Whether to ignore rating-only reviews.
    boolean ignoreRatingOnlyReviews?;
    # A collection of locations to fetch reviews for, specified by their names.
    string[] locationNames?;
    # Optional. Specifies the field to sort reviews by. If unspecified, the order of reviews returned will default to `update_time desc`. Valid orders to sort by are `rating`, `rating desc` and `update_time desc`. `rating` will return reviews in ascending order. `update_time`(i.e. ascending order) is not supported.
    string orderBy?;
    # How many reviews to fetch per page. The default value is 200.
    int pageSize?;
    # If specified, it fetches the next page of reviews.
    string pageToken?;
};

# A message describing a service type that the business offers.
public type ServiceType record {
    # Output only. The human-readable display name for the service type.
    string displayName?;
    # Output only. A stable ID (provided by Google) for this service type.
    string serviceTypeId?;
};

# The verification option represents how to verify the location (indicated by verification method) and where the verification will be sent to (indicated by display data).
public type VerificationOption record {
    # Display data for verifications through postcard.
    AddressVerificationData addressData?;
    # Display data for verifications through email.
    EmailVerificationData emailData?;
    # Display Data for verifications through phone, e.g. phone call, sms.
    PhoneVerificationData phoneData?;
    # Method to verify the location.
    string verificationMethod?;
};

# An object that represents a latitude/longitude pair. This is expressed as a pair of doubles to represent degrees latitude and degrees longitude. Unless specified otherwise, this must conform to the WGS84 standard. Values must be within normalized ranges.
public type LatLng record {
    # The latitude in degrees. It must be in the range [-90.0, +90.0].
    float latitude?;
    # The longitude in degrees. It must be in the range [-180.0, +180.0].
    float longitude?;
};

# Views available from the guest unit itself.
public type ViewsFromUnit record {
    # Beach view. A guestroom that features a window through which guests can see the beach.
    boolean beachView?;
    # Beach view exception.
    string beachViewException?;
    # City view. A guestroom that features a window through which guests can see the buildings, parks and/or streets of the city.
    boolean cityView?;
    # City view exception.
    string cityViewException?;
    # Garden view. A guestroom that features a window through which guests can see a garden.
    boolean gardenView?;
    # Garden view exception.
    string gardenViewException?;
    # Lake view.
    boolean lakeView?;
    # Lake view exception.
    string lakeViewException?;
    # Landmark view. A guestroom that features a window through which guests can see a landmark such as the countryside, a golf course, the forest, a park, a rain forst, a mountain or a slope.
    boolean landmarkView?;
    # Landmark view exception.
    string landmarkViewException?;
    # Ocean view. A guestroom that features a window through which guests can see the ocean.
    boolean oceanView?;
    # Ocean view exception.
    string oceanViewException?;
    # Pool view. A guestroom that features a window through which guests can see the hotel's swimming pool.
    boolean poolView?;
    # Pool view exception.
    string poolViewException?;
    # Valley view. A guestroom that features a window through which guests can see over a valley.
    boolean valleyView?;
    # Valley view exception.
    string valleyViewException?;
};

# Additional Info stored for an organization.
public type OrganizationInfo record {
    # The contact number for the organization.
    string phoneNumber?;
    # Represents a postal address, e.g. for postal delivery or payments addresses. Given a postal address, a postal service can deliver items to a premise, P.O. Box or similar. It is not intended to model geographical locations (roads, towns, mountains). In typical usage an address would be created via user input or from importing existing data, depending on the type of process. Advice on address input / editing: - Use an i18n-ready address widget such as https://github.com/google/libaddressinput) - Users should not be presented with UI elements for input or editing of fields outside countries where that field is used. For more guidance on how to use this schema, please see: https://support.google.com/business/answer/6397478
    PostalAddress postalAddress?;
    # The registered domain for the account.
    string registeredDomain?;
};

# Response message for AccessControl.ListLocationAdmins.
public type ListLocationAdminsResponse record {
    # A collection of Admin instances.
    Admin[] admins?;
};

# A request to return values for one metric and the options for how those values should be returned.
public type MetricRequest record {
    # The requested metric.
    string metric?;
    # How the values should appear when returned.
    string[] options?;
};

# Alternate/surrogate key references for a location.
public type LocationKey record {
    # Output only. A value of true indicates that an unset place ID is deliberate, which is different from no association being made yet.
    boolean explicitNoPlaceId?;
    # If this location has been verified and is connected to/appears on Google Maps, this field is populated with the place ID for the location. This ID can be used in various Places APIs. If this location is unverified, this field may be populated if the location has been associated with a place that appears on Google Maps. This field can be set during Create calls, but not for Update. The additional `explicit_no_place_id` bool qualifies whether an unset place ID is deliberate or not.
    string placeId?;
    # Output only. If this location has a Google+ page associated with it, this is populated with the Google+ page ID for this location.
    string plusPageId?;
    # Output only. The `request_id` used to create this location. May be empty if this location was created outside of the GMB API or Google My Business Locations.
    string requestId?;
};

# Response message for AccessControl.ListAccountAdmins.
public type ListAccountAdminsResponse record {
    # A collection of Admin instances.
    Admin[] admins?;
};

# Languages spoken by at least one staff member.
public type LanguagesSpoken record {
    # Arabic. At least one staff member speaks Arabic.
    boolean arabicSpoken?;
    # Arabic exception.
    string arabicSpokenException?;
    # Cantonese. At least one staff member speaks Cantonese.
    boolean cantoneseSpoken?;
    # Cantonese exception.
    string cantoneseSpokenException?;
    # Dutch. At least one staff member speaks Dutch.
    boolean dutchSpoken?;
    # Dutch exception.
    string dutchSpokenException?;
    # English. At least one staff member speaks English.
    boolean englishSpoken?;
    # English exception.
    string englishSpokenException?;
    # Filipino. At least one staff member speaks Filipino.
    boolean filipinoSpoken?;
    # Filipino exception.
    string filipinoSpokenException?;
    # French. At least one staff member speaks French.
    boolean frenchSpoken?;
    # French exception.
    string frenchSpokenException?;
    # German. At least one staff member speaks German.
    boolean germanSpoken?;
    # German exception.
    string germanSpokenException?;
    # Hindi. At least one staff member speaks Hindi.
    boolean hindiSpoken?;
    # Hindi exception.
    string hindiSpokenException?;
    # Indonesian. At least one staff member speaks Indonesian.
    boolean indonesianSpoken?;
    # Indonesian exception.
    string indonesianSpokenException?;
    # Italian. At least one staff member speaks Italian.
    boolean italianSpoken?;
    # Italian exception.
    string italianSpokenException?;
    # Japanese. At least one staff member speaks Japanese.
    boolean japaneseSpoken?;
    # Japanese exception.
    string japaneseSpokenException?;
    # Korean. At least one staff member speaks Korean.
    boolean koreanSpoken?;
    # Korean exception.
    string koreanSpokenException?;
    # Mandarin. At least one staff member speaks Mandarin.
    boolean mandarinSpoken?;
    # Mandarin exception.
    string mandarinSpokenException?;
    # Portuguese. At least one staff member speaks Portuguese.
    boolean portugueseSpoken?;
    # Portuguese exception.
    string portugueseSpokenException?;
    # Russian. At least one staff member speaks Russian.
    boolean russianSpoken?;
    # Russian exception.
    string russianSpokenException?;
    # Spanish. At least one staff member speaks Spanish.
    boolean spanishSpoken?;
    # Spanish exception.
    string spanishSpokenException?;
    # Vietnamese. At least one staff member speaks Vietnamese.
    boolean vietnameseSpoken?;
    # Vietnamese exception.
    string vietnameseSpokenException?;
};

# Request message for Media.StartUploadMediaItemData.
public type StartUploadMediaItemDataRequest record {
};

# Represents a span of time that the business is open, starting on the specified open day/time and closing on the specified close day/time. The closing time must occur after the opening time, for example later in the same day, or on a subsequent day.
public type TimePeriod record {
    # Indicates the day of the week this period ends on.
    string closeDay?;
    # Time in 24hr ISO 8601 extended format (hh:mm). Valid values are 00:00-24:00, where 24:00 represents midnight at the end of the specified day field.
    string closeTime?;
    # Indicates the day of the week this period starts on.
    string openDay?;
    # Time in 24hr ISO 8601 extended format (hh:mm). Valid values are 00:00-24:00, where 24:00 represents midnight at the end of the specified day field.
    string openTime?;
};

# Response message for Locations.BatchGetLocations.
public type BatchGetLocationsResponse record {
    # A collection of locations.
    Location[] locations?;
};

# Menus of a business that serve food dishes.
public type FoodMenus record {
    # Optional. A collection of food menus.
    FoodMenu[] menus?;
    # Required. Google identifier for this location in the form: `accounts/{account_id}/locations/{location_id}/foodMenus`
    string name?;
};

# Swimming pool or recreational water facilities available at the hotel.
public type Pools record {
    # Adult pool. A pool restricted for use by adults only. Can be indoors or outdoors.
    boolean adultPool?;
    # Adult pool exception.
    string adultPoolException?;
    # Hot tub. A man-made pool containing bubbling water maintained at a higher temperature and circulated by aerating jets for the purpose of soaking, relaxation and hydrotherapy. Can be indoors or outdoors. Not used for active swimming. Also known as Jacuzzi. Hot tub must be in a common area where all guests can access it. Does not apply to room-specific hot tubs that are only accessible to guest occupying that room.
    boolean hotTub?;
    # Hot tub exception.
    string hotTubException?;
    # Indoor pool. A pool located inside the hotel and available for guests to use for swimming and/or soaking. Use may or may not be restricted to adults and/or children.
    boolean indoorPool?;
    # Indoor pool exception.
    string indoorPoolException?;
    # Indoor pools count. The sum of all indoor pools at the hotel.
    int indoorPoolsCount?;
    # Indoor pools count exception.
    string indoorPoolsCountException?;
    # Lazy river. A man-made pool or several interconnected recreational pools built to mimic the shape and current of a winding river where guests float in the water on inflated rubber tubes. Can be indoors or outdoors.
    boolean lazyRiver?;
    # Lazy river exception.
    string lazyRiverException?;
    # Lifeguard. A trained member of the hotel staff stationed by the hotel's indoor or outdoor swimming area and responsible for the safety of swimming guests.
    boolean lifeguard?;
    # Lifeguard exception.
    string lifeguardException?;
    # Outdoor pool. A pool located outside on the grounds of the hotel and available for guests to use for swimming, soaking or recreation. Use may or may not be restricted to adults and/or children.
    boolean outdoorPool?;
    # Outdoor pool exception.
    string outdoorPoolException?;
    # Outdoor pools count. The sum of all outdoor pools at the hotel.
    int outdoorPoolsCount?;
    # Outdoor pools count exception.
    string outdoorPoolsCountException?;
    # Pool. The presence of a pool, either indoors or outdoors, for guests to use for swimming and/or soaking. Use may or may not be restricted to adults and/or children.
    boolean pool?;
    # Pool exception.
    string poolException?;
    # Pools count. The sum of all pools at the hotel.
    int poolsCount?;
    # Pools count exception.
    string poolsCountException?;
    # Wading pool. A shallow pool designed for small children to play in. Can be indoors or outdoors. Also known as kiddie pool.
    boolean wadingPool?;
    # Wading pool exception.
    string wadingPoolException?;
    # Water park. An aquatic recreation area with a large pool or series of pools that has features such as a water slide or tube, wavepool, fountains, rope swings, and/or obstacle course. Can be indoors or outdoors. Also known as adventure pool.
    boolean waterPark?;
    # Water park exception.
    string waterParkException?;
    # Waterslide. A continuously wetted chute positioned by an indoor or outdoor pool which people slide down into the water.
    boolean waterslide?;
    # Waterslide exception.
    string waterslideException?;
    # Wave pool. A large indoor or outdoor pool with a machine that produces water currents to mimic the ocean's crests.
    boolean wavePool?;
    # Wave pool exception.
    string wavePoolException?;
};

# Reference to the photo binary data of a `MediaItem` uploaded through the My Business API. Create a data ref using StartUploadMediaItemData, and use this ref when uploading bytes to [UpdateMedia] and subsequently calling CreateMediaItem.
public type MediaItemDataRef record {
    # The unique ID for this media item's binary data. Used to upload the photo data with [UpdateMedia] and when creating a new media item from those bytes with CreateMediaItem. Example of uploading bytes: `curl -X POST -T{path_to_file} "http://mybusiness.googleapis.com/upload/v1/media/{resource_name}?upload_type=media"` For CreateMediaItem calls, set this as the `MediaItem` `data_ref`.
    string resourceName?;
};

# Represents a postal address, e.g. for postal delivery or payments addresses. Given a postal address, a postal service can deliver items to a premise, P.O. Box or similar. It is not intended to model geographical locations (roads, towns, mountains). In typical usage an address would be created via user input or from importing existing data, depending on the type of process. Advice on address input / editing: - Use an i18n-ready address widget such as https://github.com/google/libaddressinput) - Users should not be presented with UI elements for input or editing of fields outside countries where that field is used. For more guidance on how to use this schema, please see: https://support.google.com/business/answer/6397478
public type PostalAddress record {
    # Unstructured address lines describing the lower levels of an address. Because values in address_lines do not have type information and may sometimes contain multiple values in a single field (e.g. "Austin, TX"), it is important that the line order is clear. The order of address lines should be "envelope order" for the country/region of the address. In places where this can vary (e.g. Japan), address_language is used to make it explicit (e.g. "ja" for large-to-small ordering and "ja-Latn" or "en" for small-to-large). This way, the most specific line of an address can be selected based on the language. The minimum permitted structural representation of an address consists of a region_code with all remaining information placed in the address_lines. It would be possible to format such an address very approximately without geocoding, but no semantic reasoning could be made about any of the address components until it was at least partially resolved. Creating an address only containing a region_code and address_lines, and then geocoding is the recommended way to handle completely unstructured addresses (as opposed to guessing which parts of the address should be localities or administrative areas).
    string[] addressLines?;
    # Optional. Highest administrative subdivision which is used for postal addresses of a country or region. For example, this can be a state, a province, an oblast, or a prefecture. Specifically, for Spain this is the province and not the autonomous community (e.g. "Barcelona" and not "Catalonia"). Many countries don't use an administrative area in postal addresses. E.g. in Switzerland this should be left unpopulated.
    string administrativeArea?;
    # Optional. BCP-47 language code of the contents of this address (if known). This is often the UI language of the input form or is expected to match one of the languages used in the address' country/region, or their transliterated equivalents. This can affect formatting in certain countries, but is not critical to the correctness of the data and will never affect any validation or other non-formatting related operations. If this value is not known, it should be omitted (rather than specifying a possibly incorrect default). Examples: "zh-Hant", "ja", "ja-Latn", "en".
    string languageCode?;
    # Optional. Generally refers to the city/town portion of the address. Examples: US city, IT comune, UK post town. In regions of the world where localities are not well defined or do not fit into this structure well, leave locality empty and use address_lines.
    string locality?;
    # Optional. The name of the organization at the address.
    string organization?;
    # Optional. Postal code of the address. Not all countries use or require postal codes to be present, but where they are used, they may trigger additional validation with other parts of the address (e.g. state/zip validation in the U.S.A.).
    string postalCode?;
    # Optional. The recipient at the address. This field may, under certain circumstances, contain multiline information. For example, it might contain "care of" information.
    string[] recipients?;
    # Required. CLDR region code of the country/region of the address. This is never inferred and it is up to the user to ensure the value is correct. See http://cldr.unicode.org/ and http://www.unicode.org/cldr/charts/30/supplemental/territory_information.html for details. Example: "CH" for Switzerland.
    string regionCode?;
    # The schema revision of the `PostalAddress`. This must be set to 0, which is the latest revision. All new revisions **must** be backward compatible with old revisions.
    int revision?;
    # Optional. Additional, country-specific, sorting code. This is not used in most regions. Where it is used, the value is either a string like "CEDEX", optionally followed by a number (e.g. "CEDEX 7"), or just a number alone, representing the "sector code" (Jamaica), "delivery area indicator" (Malawi) or "post office indicator" (e.g. Côte d'Ivoire).
    string sortingCode?;
    # Optional. Sublocality of the address. For example, this can be neighborhoods, boroughs, districts.
    string sublocality?;
};

# Section of a menu. It can contain multiple items/dishes.
public type FoodMenuSection record {
    # Required. Items of the section. Each Section must have at least an item.
    FoodMenuItem[] items?;
    # Required. Language tagged labels for this menu section. Display names should be 140 characters or less, with descriptions 1,000 characters or less. At least one set of labels is required.
    MenuLabel[] labels?;
};

# Name to be used when displaying the chain.
public type ChainName record {
    # The display name for this chain.
    string displayName?;
    # The BCP 47 code of language of the name.
    string languageCode?;
};

# Metadata for an attribute. Contains display information for the attribute, including a localized name and a heading for grouping related attributes together.
public type AttributeMetadata record {
    # The ID of the attribute.
    string attributeId?;
    # The localized display name for the attribute, if available; otherwise, the English display name.
    string displayName?;
    # The localized display name of the group that contains this attribute, if available; otherwise, the English group name. Related attributes are collected into a group and should be displayed together under the heading given here.
    string groupDisplayName?;
    # If true, the attribute is deprecated and should no longer be used. If deprecated, updating this attribute will not result in an error, but updates will not be saved. At some point after being deprecated, the attribute will be removed entirely and it will become an error.
    boolean isDeprecated?;
    # If true, the attribute supports multiple values. If false, only a single value should be provided.
    boolean isRepeatable?;
    # For some types of attributes (for example, enums), a list of supported values and corresponding display names for those values is provided.
    AttributeValueMetadata[] valueMetadata?;
    # The value type for the attribute. Values set and retrieved should be expected to be of this type.
    string valueType?;
};

# This message represents nutrition facts for a food dish.
public type NutritionFacts record {
    # This message denotes calories information with an upper bound and lower bound range. Lower amount must be specified. Both lower and upper amounts are non-negative numbers.
    CaloriesFact calories?;
    # This message denotes nutrition information with an upper bound and lower bound range and can be represented by mass unit. Lower amount must be specified. Both lower and upper amounts are non-negative numbers.
    NutritionFact cholesterol?;
    # This message denotes nutrition information with an upper bound and lower bound range and can be represented by mass unit. Lower amount must be specified. Both lower and upper amounts are non-negative numbers.
    NutritionFact protein?;
    # This message denotes nutrition information with an upper bound and lower bound range and can be represented by mass unit. Lower amount must be specified. Both lower and upper amounts are non-negative numbers.
    NutritionFact sodium?;
    # This message denotes nutrition information with an upper bound and lower bound range and can be represented by mass unit. Lower amount must be specified. Both lower and upper amounts are non-negative numbers.
    NutritionFact totalCarbohydrate?;
    # This message denotes nutrition information with an upper bound and lower bound range and can be represented by mass unit. Lower amount must be specified. Both lower and upper amounts are non-negative numbers.
    NutritionFact totalFat?;
};

# Represents a target location for a pending invitation.
public type TargetLocation record {
    # The address of the location to which the user is invited.
    string locationAddress?;
    # The name of the location to which the user is invited.
    string locationName?;
};

# Represents a possible match to a location.
public type MatchedLocation record {
    # Is this an exact match?
    boolean isExactMatch?;
    # A location. See the [help center article] (https://support.google.com/business/answer/3038177) for a detailed description of these fields, or the [category endpoint](/my-business/reference/rest/v4/categories) for a list of valid business categories.
    Location location?;
};

# Represents the author of a question or answer
public type Author record {
    # The display name of the user
    string displayName?;
    # The profile photo URL of the user.
    string profilePhotoUrl?;
    # The type of user the author is.
    string 'type?;
};

# Request message for Verifications.CompleteVerificationAction.
public type CompleteVerificationRequest record {
    # PIN code received by the merchant to complete the verification.
    string pin?;
};

# Information about eating features in the living area.
public type LivingAreaEating record {
    # Coffee maker. An electric appliance that brews coffee by heating and forcing water through ground coffee.
    boolean coffeeMaker?;
    # Coffee maker exception.
    string coffeeMakerException?;
    # Cookware. Kitchen pots, pans and utensils used in connection with the preparation of food.
    boolean cookware?;
    # Cookware exception.
    string cookwareException?;
    # Dishwasher. A counter-height electrical cabinet containing racks for dirty dishware, cookware and cutlery, and a dispenser for soap built into the pull-down door. The cabinet is attached to the plumbing system to facilitate the automatic cleaning of its contents.
    boolean dishwasher?;
    # Dishwasher exception.
    string dishwasherException?;
    # Indoor grill. Metal grates built into an indoor cooktop on which food is cooked over an open flame or electric heat source.
    boolean indoorGrill?;
    # Indoor grill exception.
    string indoorGrillException?;
    # Kettle. A covered container with a handle and a spout used for boiling water.
    boolean kettle?;
    # Kettle exception.
    string kettleException?;
    # Kitchen available. An area of the guestroom designated for the preparation and storage of food via the presence of a refrigerator, cook top, oven and sink, as well as cutlery, dishes and cookware. Usually includes small appliances such a coffee maker and a microwave. May or may not include an automatic dishwasher.
    boolean kitchenAvailable?;
    # Kitchen available exception.
    string kitchenAvailableException?;
    # Microwave. An electric oven that quickly cooks and heats food by microwave energy. Smaller than a standing or wall mounted oven. Usually placed on a kitchen counter, a shelf or tabletop or mounted above a cooktop.
    boolean microwave?;
    # Microwave exception.
    string microwaveException?;
    # Minibar. A small refrigerated cabinet in the guestroom containing bottles/cans of soft drinks, mini bottles of alcohol, and snacks. The items are most commonly available for a fee.
    boolean minibar?;
    # Minibar exception.
    string minibarException?;
    # Outdoor grill. Metal grates on which food is cooked over an open flame or electric heat source. Part of an outdoor apparatus that supports the grates. Also known as barbecue grill or barbecue.
    boolean outdoorGrill?;
    # Outdoor grill exception.
    string outdoorGrillException?;
    # Oven. A temperature controlled, heated metal cabinet powered by gas or electricity in which food is placed for the purpose of cooking or reheating.
    boolean oven?;
    # Oven exception.
    string ovenException?;
    # Refrigerator. A large, climate-controlled electrical cabinet with vertical doors. Built for the purpose of chilling and storing perishable foods.
    boolean refrigerator?;
    # Refrigerator exception.
    string refrigeratorException?;
    # Sink. A basin with a faucet attached to a water source and used for the purpose of washing and rinsing.
    boolean sink?;
    # Sink exception.
    string sinkException?;
    # Snackbar. A small cabinet in the guestroom containing snacks. The items are most commonly available for a fee.
    boolean snackbar?;
    # Snackbar exception.
    string snackbarException?;
    # Stove. A kitchen appliance powered by gas or electricity for the purpose of creating a flame or hot surface on which pots of food can be cooked. Also known as cooktop or hob.
    boolean stove?;
    # Stove exception.
    string stoveException?;
    # Tea station. A small area with the supplies needed to heat water and make tea.
    boolean teaStation?;
    # Tea station exception.
    string teaStationException?;
    # Toaster. A small, temperature controlled electric appliance with rectangular slots at the top that are lined with heated coils for the purpose of browning slices of bread products.
    boolean toaster?;
    # Toaster exception.
    string toasterException?;
};

# A message that describes a single service item. It is used to describe the type of service that the merchant provides. For example, haircut can be a service.
public type ServiceItem record {
    # Represents a free-form service offered by the merchant. These are services that are not exposed as part of our structure service data. The merchant manually enters the names for of such services via a geomerchant surface.
    FreeFormServiceItem freeFormServiceItem?;
    # Optional. This field decides whether or not the input service is offered by the merchant.
    boolean isOffered?;
    # Represents an amount of money with its currency type.
    Money price?;
    # Represents a structured service offered by the merchant. For eg: toilet_installation.
    StructuredServiceItem structuredServiceItem?;
};

# Request message for reporting a GoogleLocation.
public type ReportGoogleLocationRequest record {
    # Optional. The resource name of the location group that this Google Location is being reported for, in the format `accounts/{account_id}`.
    string locationGroupName?;
    # The reason for which the user is reporting this location when the issue is with the location itself.
    string reportReasonBadLocation?;
    # The reason for which the user is reporting this location when the issue is with the recommendation. This report is useful if the location has been recommended to the GMB account.
    string reportReasonBadRecommendation?;
    # Optional. A text entry for elaborating on the reason for which the user is reporting this location. The maximum length is 512 characters.
    string reportReasonElaboration?;
    # Optional. The BCP 47 code of language used in `report_reason_elaboration`.
    string reportReasonLanguageCode?;
};

# Display data for verifications through email.
public type EmailVerificationData record {
    # Domain name in the email address. e.g. "gmail.com" in foo@gmail.com
    string domainName?;
    # Whether client is allowed to provide a different user name.
    boolean isUserNameEditable?;
    # User name in the email address. e.g. "foo" in foo@gmail.com
    string userName?;
};

# A chain is a brand that your business's locations can be affiliated with.
public type Chain record {
    # Names of the chain.
    ChainName[] chainNames?;
    # Number of locations that are part of this chain.
    int locationCount?;
    # The chain's resource name, in the format `chains/{chain_place_id}`.
    string name?;
    # Websites of the chain.
    ChainUrl[] websites?;
};

# Response message for Locations.ListAttributeMetadata.
public type ListAttributeMetadataResponse record {
    # A collection of attribute metadata for the available attributes.
    AttributeMetadata[] attributes?;
    # If the number of attributes exceeded the requested page size, this field will be populated with a token to fetch the next page of attributes on a subsequent call to `attributes.list`. If there are no more attributes, this field will not be present in the response.
    string nextPageToken?;
};

# A request for driving direction insights.
public type DrivingDirectionMetricsRequest record {
    # The BCP 47 code for the language. If a language code is not provided, it defaults to English.
    string languageCode?;
    # The number of days to aggregate data for. Results returned will be available data over the last number of requested days. Valid values are 7, 30, and 90.
    string numDays?;
};

# A location attribute. Attributes provide additional information about a location. The attributes that can be set on a location may vary based on the properties of that location (for example, category). Available attributes are determined by Google and may be added and removed without API changes.
public type Attribute record {
    # The ID of the attribute. Attribute IDs are provided by Google.
    string attributeId?;
    # Values for an attribute with a `value_type` of REPEATED_ENUM. This consists of two lists of value IDs: those that are set (true) and those that are unset (false). Values absent are considered unknown. At least one value must be specified.
    RepeatedEnumAttributeValue repeatedEnumValue?;
    # When the attribute value type is URL, this field contains the value(s) for this attribute, and the other values fields must be empty.
    UrlAttributeValue[] urlValues?;
    # Output only. The type of value that this attribute contains. This should be used to determine how to interpret the value.
    string valueType?;
    # The values for this attribute. The type of the values supplied must match that expected for that attribute; see [AttributeValueType](/my-business/reference/rest/v4/AttributeValueType). This is a repeated field where multiple attribute values may be provided. Attribute types only support one value.
    anydata[] values?;
};

# Additional non-user-editable information about the location.
public type Metadata record {
    # Information about the location that this location duplicates.
    Duplicate duplicate?;
    # A link to the location on Maps.
    string mapsUrl?;
    # A link to the page on Google Search where a customer can leave a review for the location.
    string newReviewUrl?;
};

# Response message for Media.ListCustomerMediaItems.
public type ListCustomerMediaItemsResponse record {
    # The returned list of media items.
    MediaItem[] mediaItems?;
    # If there are more media items than the requested page size, then this field is populated with a token to fetch the next page of media items on a subsequent call to ListCustomerMediaItems.
    string nextPageToken?;
    # The total number of media items for this location, irrespective of pagination. This number is approximate, particularly when there are multiple pages of results.
    int totalMediaItemCount?;
};

# All information pertaining to the location's profile.
public type Profile record {
    # Description of the location in your own voice, not editable by anyone else.
    string description?;
};

# Response message for ListLocalPosts
public type ListLocalPostsResponse record {
    # The returned list of local posts.
    LocalPost[] localPosts?;
    # If there are more local posts than the requested page size, then this field is populated with a token to fetch the next page of local posts on a subsequent call to `ListLocalPosts`.
    string nextPageToken?;
};

# Response message for Verifications.VerifyLocation.
public type VerifyLocationResponse record {
    # A verification represents a verification attempt on a location.
    Verification verification?;
};

# Response message for Reviews.ListReviews.
public type ListReviewsResponse record {
    # The average star rating of all reviews for this location on a scale of 1 to 5, where 5 is the highest rating.
    float averageRating?;
    # If the number of reviews exceeded the requested page size, this field is populated with a token to fetch the next page of reviews on a subsequent call to ListReviews. If there are no more reviews, this field is not present in the response.
    string nextPageToken?;
    # The reviews.
    Review[] reviews?;
    # The total number of reviews for this location.
    int totalReviewCount?;
};

# A location indexed with the regions that people usually come from. This is captured by counting how many driving-direction requests to this location are from each region.
public type LocationDrivingDirectionMetrics record {
    # The location resource name this metric value belongs to.
    string locationName?;
    # Time zone (IANA timezone IDs, for example, 'Europe/London') of the location.
    string timeZone?;
    # Driving-direction requests by source region. By convention, these are sorted by count with at most 10 results.
    TopDirectionSources[] topDirectionSources?;
};

# Represents a single question and some of its answers.
public type Question record {
    # Represents the author of a question or answer
    Author author?;
    # Output only. The timestamp for when the question was written.
    string createTime?;
    # Output only. The unique name for the question. accounts/*/locations/*/questions/*
    string name?;
    # The text of the question. It should contain at least three words and the total length should be greater than or equal to 10 characters. The maximum length is 4096 characters.
    string text?;
    # Output only. A list of answers to the question, sorted by upvotes. This may not be a complete list of answers depending on the request parameters (answers_per_question)
    Answer[] topAnswers?;
    # Output only. The total number of answers posted for this question.
    int totalAnswerCount?;
    # Output only. The timestamp for when the question was last modified.
    string updateTime?;
    # Output only. The number of upvotes for the question.
    int upvoteCount?;
};

# Values for an attribute with a `value_type` of REPEATED_ENUM. This consists of two lists of value IDs: those that are set (true) and those that are unset (false). Values absent are considered unknown. At least one value must be specified.
public type RepeatedEnumAttributeValue record {
    # Enum values that are set.
    string[] setValues?;
    # Enum values that are unset.
    string[] unsetValues?;
};

# General factual information about the property's physical structure and important dates.
public type Property record {
    # Built year. The year that construction of the property was completed.
    int builtYear?;
    # Built year exception.
    string builtYearException?;
    # Floors count. The number of stories the building has from the ground floor to the top floor that are accessible to guests.
    int floorsCount?;
    # Floors count exception.
    string floorsCountException?;
    # Last renovated year. The year when the most recent renovation of the property was completed. Renovation may include all or any combination of the following: the units, the public spaces, the exterior, or the interior.
    int lastRenovatedYear?;
    # Last renovated year exception.
    string lastRenovatedYearException?;
    # Rooms count. The total number of rooms and suites bookable by guests for an overnight stay. Does not include event space, public spaces, conference rooms, fitness rooms, business centers, spa, salon, restaurants/bars, or shops.
    int roomsCount?;
    # Rooms count exception.
    string roomsCountException?;
};

# Request message for QuestionsAndAnswers.UpsertAnswer
public type UpsertAnswerRequest record {
    # Represents an answer to a question
    Answer answer?;
};

# Represents a free-form service offered by the merchant. These are services that are not exposed as part of our structure service data. The merchant manually enters the names for of such services via a geomerchant surface.
public type FreeFormServiceItem record {
    # Required. The `category_id` and `service_type_id` should match the possible combinations provided in the `Category` message.
    string categoryId?;
    # Label to be used when displaying the price list, section, or item.
    Label label?;
};

# An individual room, such as kitchen, bathroom, bedroom, within a bookable guest unit.
public type LivingArea record {
    # Accessibility features of the living area.
    LivingAreaAccessibility accessibility?;
    # Information about eating features in the living area.
    LivingAreaEating eating?;
    # Features in the living area.
    LivingAreaFeatures features?;
    # Information about the layout of the living area.
    LivingAreaLayout layout?;
    # Information about sleeping features in the living area.
    LivingAreaSleeping sleeping?;
};

# Contains a set of booleans that reflect the [state of a Location.](https://support.google.com/business/answer/3480862)
public type LocationState record {
    # Output only. Indicates whether the location can be deleted using the Google My Business API.
    boolean canDelete?;
    # Output only. Indicates if the listing is eligible for food menu.
    boolean canHaveFoodMenus?;
    # Output only. Indicates if the listing can modify a ServiceList.
    boolean canModifyServiceList?;
    # Output only. Indicates whether the location can operate on Health data.
    boolean canOperateHealthData?;
    # Output only. Indicates whether the location can operate on Lodging data.
    boolean canOperateLodgingData?;
    # Output only. Indicates whether the location can be updated.
    boolean canUpdate?;
    # Output only. Indicates whether any of this Location's properties are in the edit pending state.
    boolean hasPendingEdits?;
    # Output only. Indicates whether the location has pending verification requests.
    boolean hasPendingVerification?;
    # Output only. Indicates whether the location is disabled.
    boolean isDisabled?;
    # Output only. Indicates whether the location is disconnected from a place on Google Maps.
    boolean isDisconnected?;
    # Output only. Indicates whether the location is a duplicate of another location.
    boolean isDuplicate?;
    # Output only. Indicates whether the place ID associated with this location has updates.
    boolean isGoogleUpdated?;
    # Output only. Indicates whether [accounts.locations.localPosts](/my-business/reference/rest/v4/accounts.locations.localPosts) is disabled for this location.
    boolean isLocalPostApiDisabled?;
    # Output only. Indicates whether the review of the location is pending.
    boolean isPendingReview?;
    # Output only. Indicates whether the location is published.
    boolean isPublished?;
    # Output only. Indicates whether the location is suspended. Suspended locations are not visible to end users in Google products. If you believe this was a mistake, see the [help center article] (https://support.google.com/business/answer/4569145).
    boolean isSuspended?;
    # Output only. Indicates whether the location is verified.
    boolean isVerified?;
    # Output only. Indicates whether the location requires reverification.
    boolean needsReverification?;
};

# An action that is performed when the user clicks through the post
public type CallToAction record {
    # The type of action that will be performed.
    string actionType?;
    # The URL the user will be directed to upon clicking. This field should be left unset for Call CTA.
    string url?;
};

# Additional data for service business verification.
public type ServiceBusinessContext record {
    # Represents a postal address, e.g. for postal delivery or payments addresses. Given a postal address, a postal service can deliver items to a premise, P.O. Box or similar. It is not intended to model geographical locations (roads, towns, mountains). In typical usage an address would be created via user input or from importing existing data, depending on the type of process. Advice on address input / editing: - Use an i18n-ready address widget such as https://github.com/google/libaddressinput) - Users should not be presented with UI elements for input or editing of fields outside countries where that field is used. For more guidance on how to use this schema, please see: https://support.google.com/business/answer/6397478
    PostalAddress address?;
};

# Request message for Locations.AssociateLocationRequest.
public type AssociateLocationRequest record {
    # The association to establish. If not set, it indicates no match.
    string placeId?;
};

# Dimensions of the media item.
public type Dimensions record {
    # Height of the media item, in pixels.
    int heightPixels?;
    # Width of the media item, in pixels.
    int widthPixels?;
};

# Enhanced cleaning measures implemented by the hotel during COVID-19.
public type EnhancedCleaning record {
    # Commercial-grade disinfectant used to clean the property.
    boolean commercialGradeDisinfectantCleaning?;
    # Commercial grade disinfectant cleaning exception.
    string commercialGradeDisinfectantCleaningException?;
    # Enhanced cleaning of common areas.
    boolean commonAreasEnhancedCleaning?;
    # Common areas enhanced cleaning exception.
    string commonAreasEnhancedCleaningException?;
    # Employees trained in COVID-19 cleaning procedures.
    boolean employeesTrainedCleaningProcedures?;
    # Employees trained cleaning procedures exception.
    string employeesTrainedCleaningProceduresException?;
    # Employees trained in thorough hand-washing.
    boolean employeesTrainedThoroughHandWashing?;
    # Employees trained thorough hand washing exception.
    string employeesTrainedThoroughHandWashingException?;
    # Employees wear masks, face shields, and/or gloves.
    boolean employeesWearProtectiveEquipment?;
    # Employees wear protective equipment exception.
    string employeesWearProtectiveEquipmentException?;
    # Enhanced cleaning of guest rooms.
    boolean guestRoomsEnhancedCleaning?;
    # Guest rooms enhanced cleaning exception.
    string guestRoomsEnhancedCleaningException?;
};

# Parking options at the property.
public type Parking record {
    # Electric car charging stations. Electric power stations, usually located outdoors, into which guests plug their electric cars to receive a charge.
    boolean electricCarChargingStations?;
    # Electric car charging stations exception.
    string electricCarChargingStationsException?;
    # Free parking. The hotel allows the cars of guests to be parked for free. Parking facility may be an outdoor lot or an indoor garage, but must be onsite. Nearby parking does not apply. Parking may be performed by the guest or by hotel staff. Free parking must be available to all guests (limited conditions does not apply).
    boolean freeParking?;
    # Free parking exception.
    string freeParkingException?;
    # Free self parking. Guests park their own cars for free. Parking facility may be an outdoor lot or an indoor garage, but must be onsite. Nearby parking does not apply.
    boolean freeSelfParking?;
    # Free self parking exception.
    string freeSelfParkingException?;
    # Free valet parking. Hotel staff member parks the cars of guests. Parking with this service is free.
    boolean freeValetParking?;
    # Free valet parking exception.
    string freeValetParkingException?;
    # Parking available. The hotel allows the cars of guests to be parked. Can be free or for a fee. Parking facility may be an outdoor lot or an indoor garage, but must be onsite. Nearby parking does not apply. Parking may be performed by the guest or by hotel staff.
    boolean parkingAvailable?;
    # Parking available exception.
    string parkingAvailableException?;
    # Self parking available. Guests park their own cars. Parking facility may be an outdoor lot or an indoor garage, but must be onsite. Nearby parking does not apply. Can be free or for a fee.
    boolean selfParkingAvailable?;
    # Self parking available exception.
    string selfParkingAvailableException?;
    # Valet parking available. Hotel staff member parks the cars of guests. Parking with this service can be free or for a fee.
    boolean valetParkingAvailable?;
    # Valet parking available exception.
    string valetParkingAvailableException?;
};

# A verification represents a verification attempt on a location.
public type Verification record {
    # The timestamp when the verification is requested.
    string createTime?;
    # The method of the verification.
    string method?;
    # Resource name of the verification.
    string name?;
    # The state of the verification.
    string state?;
};

# Request message for Insights.ReportLocationInsights.
public type ReportLocationInsightsRequest record {
    # A request for basic metric insights.
    BasicMetricsRequest basicRequest?;
    # A request for driving direction insights.
    DrivingDirectionMetricsRequest drivingDirectionsRequest?;
    # A collection of locations to fetch insights for, specified by their names.
    string[] locationNames?;
};

# Represents the author of the review.
public type Reviewer record {
    # The name of the reviewer. Only populated with the reviewer's real name if `is_anonymous` is false.
    string displayName?;
    # Indicates whether the reviewer has opted to remain anonymous.
    boolean isAnonymous?;
    # The profile photo link of the reviewer. Only populated if `is_anonymous` is false.
    string profilePhotoUrl?;
};

# A section of the price list containing one or more items.
public type Section record {
    # Items that are contained within this section of the price list.
    Item[] items?;
    # Required. Language-tagged labels for the section. We recommend that section names and descriptions be 140 characters or less. At least one set of labels is required.
    Label[] labels?;
    # Required. ID for the section. Price list, section, and item IDs cannot be duplicated within this Location.
    string sectionId?;
    # Optional. Type of the current price list section. Default value is FOOD.
    string sectionType?;
};

# Policies regarding guest-owned animals.
public type Pets record {
    # Cats allowed. Domesticated felines are permitted at the property and allowed to stay in the guest room of their owner. May or may not require a fee.
    boolean catsAllowed?;
    # Cats allowed exception.
    string catsAllowedException?;
    # Dogs allowed. Domesticated canines are permitted at the property and allowed to stay in the guest room of their owner. May or may not require a fee.
    boolean dogsAllowed?;
    # Dogs allowed exception.
    string dogsAllowedException?;
    # Pets allowed. Household animals are allowed at the property and in the specific guest room of their owner. May or may not include dogs, cats, reptiles and/or fish. May or may not require a fee. Service animals are not considered to be pets, so not governed by this policy.
    boolean petsAllowed?;
    # Pets allowed exception.
    string petsAllowedException?;
    # Pets allowed free. Household animals are allowed at the property and in the specific guest room of their owner for free. May or may not include dogs, cats, reptiles, and/or fish.
    boolean petsAllowedFree?;
    # Pets allowed free exception.
    string petsAllowedFreeException?;
};

# Conveniences or help provided by the property to facilitate an easier, more comfortable stay.
public type Services record {
    # Baggage storage. A provision for guests to leave their bags at the hotel when they arrive for their stay before the official check-in time. May or may not apply for guests who wish to leave their bags after check-out and before departing the locale. Also known as bag dropoff.
    boolean baggageStorage?;
    # Baggage storage exception.
    string baggageStorageException?;
    # Concierge. Hotel staff member(s) responsible for facilitating an easy, comfortable stay through making reservations for meals, sourcing theater tickets, arranging tours, finding a doctor, making recommendations, and answering questions.
    boolean concierge?;
    # Concierge exception.
    string conciergeException?;
    # Convenience store. A shop at the hotel primarily selling snacks, drinks, non-prescription medicines, health and beauty aids, magazines and newspapers.
    boolean convenienceStore?;
    # Convenience store exception.
    string convenienceStoreException?;
    # Currency exchange. A staff member or automated machine tasked with the transaction of providing the native currency of the hotel's locale in exchange for the foreign currency provided by a guest.
    boolean currencyExchange?;
    # Currency exchange exception.
    string currencyExchangeException?;
    # Elevator. A passenger elevator that transports guests from one story to another. Also known as lift.
    boolean elevator?;
    # Elevator exception.
    string elevatorException?;
    # Front desk. A counter or desk in the lobby or the immediate interior of the hotel where a member of the staff greets guests and processes the information related to their stay (including check-in and check-out). May or may not be manned and open 24/7.
    boolean frontDesk?;
    # Front desk exception.
    string frontDeskException?;
    # Full service laundry. Laundry and dry cleaning facilitated and handled by the hotel on behalf of the guest. Does not include the provision for guests to do their own laundry in on-site machines.
    boolean fullServiceLaundry?;
    # Full service laundry exception.
    string fullServiceLaundryException?;
    # Gift shop. An on-site store primarily selling souvenirs, mementos and other gift items. May or may not also sell sundries, magazines and newspapers, clothing, or snacks.
    boolean giftShop?;
    # Gift shop exception.
    string giftShopException?;
    # Languages spoken by at least one staff member.
    LanguagesSpoken languagesSpoken?;
    # Self service laundry. On-site clothes washers and dryers accessible to guests for the purpose of washing and drying their own clothes. May or may not require payment to use the machines.
    boolean selfServiceLaundry?;
    # Self service laundry exception.
    string selfServiceLaundryException?;
    # Social hour. A reception with complimentary soft drinks, tea, coffee, wine and/or cocktails in the afternoon or evening. Can be hosted by hotel staff or guests may serve themselves. Also known as wine hour. The availability of coffee/tea in the lobby throughout the day does not constitute a social or wine hour.
    boolean socialHour?;
    # Social hour exception.
    string socialHourException?;
    # 24hr front desk. Front desk is staffed 24 hours a day.
    boolean twentyFourHourFrontDesk?;
    # 24hr front desk exception.
    string twentyFourHourFrontDeskException?;
    # Wake up calls. By direction of the guest, a hotel staff member will phone the guest unit at the requested hour. Also known as morning call.
    boolean wakeUpCalls?;
    # Wake up calls exception.
    string wakeUpCallsException?;
};

# Response message for Locations.SearchChains.
public type SearchChainsResponse record {
    # Chains that match the queried chain_display_name in SearchChainsRequest. If there are no matches, this field will be empty. Results are listed in order of relevance.
    Chain[] chains?;
};

# Response message for LodgingService.GetGoogleUpdatedLodging
public type GetGoogleUpdatedLodgingResponse record {
    # Required. The fields in the Lodging that have been updated by Google. Repeated field items are not individually specified.
    string diffMask?;
    # Lodging of a location that provides accomodations.
    Lodging lodging?;
};

# This message denotes an ingredient information of a food dish.
public type Ingredient record {
    # Required. Labels to describe ingredient. Display names should be 140 characters or less, with descriptions 1,000 characters or less. At least one set of labels is required.
    MenuLabel[] labels?;
};

# Request message for Insights.ReportLocalPostInsights
public type ReportLocalPostInsightsRequest record {
    # A request for basic metric insights.
    BasicMetricsRequest basicRequest?;
    # Required. The list of posts for which to fetch insights data. All posts have to belong to the location whose name is specified in the `name` field.
    string[] localPostNames?;
};

# Response message for Insights.ReportLocalPostInsights
public type ReportLocalPostInsightsResponse record {
    # One entry per requested post corresponding to this location.
    LocalPostMetrics[] localPostMetrics?;
    # Name
    string name?;
    # Time zone (IANA timezone IDs, eg, 'Europe/London') of the location.
    string timeZone?;
};

# Specific fields for offer posts.
public type LocalPostOffer record {
    # Optional. Offer code that is usable in store or online.
    string couponCode?;
    # Optional. Online link to redeem offer.
    string redeemOnlineUrl?;
    # Optional. Offer terms and conditions.
    string termsConditions?;
};

# Request message for AccessControl.DeclineInvitation.
public type DeclineInvitationRequest record {
};

# Request message for Locations.TransferLocation.
public type TransferLocationRequest record {
    # Name of the account resource to transfer the location to (for example, "accounts/8675309").
    string toAccount?;
};

# A value for a single metric with a given time dimension.
public type DimensionalMetricValue record {
    # The option that requested this dimensional value.
    string metricOption?;
    # The dimension for which data is divided over.
    TimeDimension timeDimension?;
    # The value. If no value is set, then the requested data is missing.
    string value?;
};

# Insights and statistics for the media item.
public type MediaInsights record {
    # Output only. The number of times the media item has been viewed.
    string viewCount?;
};

# A series of Metrics and BreakdownMetrics associated with a Location over some time range.
public type LocationMetrics record {
    # The location resource name these values belong to.
    string locationName?;
    # A list of values for the requested metrics.
    MetricValue[] metricValues?;
    # IANA timezone for the location.
    string timeZone?;
};

# Option of an Item. It requires an explicit user selection.
public type FoodMenuItemOption record {
    # Attributes of a food item/dish.
    FoodMenuItemAttributes attributes?;
    # Required. Language tagged labels for this menu item option. E.g.: "beef pad thai", "veggie pad thai", "small pizza", "large pizza". Display names should be 140 characters or less, with descriptions 1,000 characters or less. At least one set of labels is required.
    MenuLabel[] labels?;
};

# Menu of a business that serves food dishes.
public type FoodMenu record {
    # Optional. Cuisine information for the food menu. It is highly recommended to provide this field.
    string[] cuisines?;
    # Required. Language-tagged labels for the menu. E.g. "menu", "lunch special". Display names should be 140 characters or less, with descriptions 1,000 characters or less. At least one set of labels is required.
    MenuLabel[] labels?;
    # Required. Sections of the menu.
    FoodMenuSection[] sections?;
    # Optional. Source URL of menu if there is a webpage to go to.
    string sourceUrl?;
};

# Label to be used when displaying the price list, section, or item.
public type Label record {
    # Optional. Description of the price list, section, or item.
    string description?;
    # Required. Display name for the price list, section, or item.
    string displayName?;
    # Optional. The BCP-47 language code that these strings apply for. Only one set of labels may be set per language.
    string languageCode?;
};

# Guest facilities at the property to promote or maintain health, beauty, and fitness.
public type Wellness record {
    # Doctor on call. The hotel has a contract with a medical professional who provides services to hotel guests should they fall ill during their stay. The doctor may or may not have an on-site office or be at the hotel at all times.
    boolean doctorOnCall?;
    # Doctor on call exception.
    string doctorOnCallException?;
    # Elliptical machine. An electric, stationary fitness machine with pedals that simulates climbing, walking or running and provides a user-controlled range of speeds and tensions. May not have arm-controlled levers to work out the upper body as well. Commonly found in a gym, fitness room, health center, or health club.
    boolean ellipticalMachine?;
    # Elliptical machine exception.
    string ellipticalMachineException?;
    # Fitness center. A room or building at the hotel containing equipment to promote physical activity, such as treadmills, elliptical machines, stationary bikes, weight machines, free weights, and/or stretching mats. Use of the fitness center can be free or for a fee. May or may not be staffed. May or may not offer instructor-led classes in various styles of physical conditioning. May or may not be open 24/7. May or may not include locker rooms and showers. Also known as health club, gym, fitness room, health center.
    boolean fitnessCenter?;
    # Fitness center exception.
    string fitnessCenterException?;
    # Free fitness center. Guests may use the fitness center for free.
    boolean freeFitnessCenter?;
    # Free fitness center exception.
    string freeFitnessCenterException?;
    # Free weights. Individual handheld fitness equipment of varied weights used for upper body strength training or bodybuilding. Also known as barbells, dumbbells, or kettlebells. Often stored on a rack with the weights arranged from light to heavy. Commonly found in a gym, fitness room, health center, or health club.
    boolean freeWeights?;
    # Free weights exception.
    string freeWeightsException?;
    # Massage. A service provided by a trained massage therapist involving the physical manipulation of a guest's muscles in order to achieve relaxation or pain relief.
    boolean massage?;
    # Massage exception.
    string massageException?;
    # Salon. A room at the hotel where professionals provide hair styling services such as shampooing, blow drying, hair dos, hair cutting and hair coloring. Also known as hairdresser or beauty salon.
    boolean salon?;
    # Salon exception.
    string salonException?;
    # Sauna. A wood-paneled room heated to a high temperature where guests sit on built-in wood benches for the purpose of perspiring and relaxing their muscles. Can be dry or slightly wet heat. Not a steam room.
    boolean sauna?;
    # Sauna exception.
    string saunaException?;
    # Spa. A designated area, room or building at the hotel offering health and beauty treatment through such means as steam baths, exercise equipment, and massage. May also offer facials, nail care, and hair care. Services are usually available by appointment and for an additional fee. Does not apply if hotel only offers a steam room; must offer other beauty and/or health treatments as well.
    boolean spa?;
    # Spa exception.
    string spaException?;
    # Treadmill. An electric stationary fitness machine that simulates a moving path to promote walking or running within a range of user-controlled speeds and inclines. Also known as running machine. Commonly found in a gym, fitness room, health center, or health club.
    boolean treadmill?;
    # Treadmill exception.
    string treadmillException?;
    # Weight machine. Non-electronic fitness equipment designed for the user to target the exertion of different muscles. Usually incorporates a padded seat, a stack of flat weights and various bars and pulleys. May be designed for toning a specific part of the body or may involve different user-controlled settings, hardware and pulleys so as to provide an overall workout in one machine. Commonly found in a gym, fitness center, fitness room, or health club.
    boolean weightMachine?;
    # Weight machine exception.
    string weightMachineException?;
};

# Response message for Verifications.ListVerifications.
public type ListVerificationsResponse record {
    # If the number of verifications exceeded the requested page size, this field will be populated with a token to fetch the next page of verification on a subsequent call. If there are no more attributes, this field will not be present in the response.
    string nextPageToken?;
    # List of the verifications.
    Verification[] verifications?;
};

# Personal protection measures implemented by the hotel during COVID-19.
public type PersonalProtection record {
    # Hand-sanitizer and/or sanitizing wipes are offered in common areas.
    boolean commonAreasOfferSanitizingItems?;
    # Common areas offer sanitizing items exception.
    string commonAreasOfferSanitizingItemsException?;
    # Masks required on the property.
    boolean faceMaskRequired?;
    # Face mask required exception.
    string faceMaskRequiredException?;
    # In-room hygiene kits with masks, hand sanitizer, and/or antibacterial wipes.
    boolean guestRoomHygieneKitsAvailable?;
    # Guest room hygiene kits available exception.
    string guestRoomHygieneKitsAvailableException?;
    # Masks and/or gloves available for guests.
    boolean protectiveEquipmentAvailable?;
    # Protective equipment available exception.
    string protectiveEquipmentAvailableException?;
};

# Physical distancing measures implemented by the hotel during COVID-19.
public type PhysicalDistancing record {
    # Common areas arranged to maintain physical distancing.
    boolean commonAreasPhysicalDistancingArranged?;
    # Common areas physical distancing arranged exception.
    string commonAreasPhysicalDistancingArrangedException?;
    # Physical distancing required.
    boolean physicalDistancingRequired?;
    # Physical distancing required exception.
    string physicalDistancingRequiredException?;
    # Safety dividers at front desk and other locations.
    boolean safetyDividers?;
    # Safety dividers exception.
    string safetyDividersException?;
    # Guest occupancy limited within shared facilities.
    boolean sharedAreasLimitedOccupancy?;
    # Shared areas limited occupancy exception.
    string sharedAreasLimitedOccupancyException?;
    # Private spaces designated in spa and wellness areas.
    boolean wellnessAreasHavePrivateSpaces?;
    # Wellness areas have private spaces exception.
    string wellnessAreasHavePrivateSpacesException?;
};

# More hours types that a business can offers, in addition to its regular hours.
public type MoreHoursType record {
    # Output only. The human-readable English display name for the hours type.
    string displayName?;
    # Output only. A stable ID provided by Google for this hours type.
    string hoursTypeId?;
    # Output only. The human-readable localized display name for the hours type.
    string localizedDisplayName?;
};

# Information about sleeping features in the living area.
public type LivingAreaSleeping record {
    # Beds count. The number of permanent beds present in a guestroom. Does not include rollaway beds, cribs or sofabeds.
    int bedsCount?;
    # Beds count exception.
    string bedsCountException?;
    # Bunk beds count. The number of furniture pieces in which one framed mattress is fixed directly above another by means of a physical frame. This allows one person(s) to sleep in the bottom bunk and one person(s) to sleep in the top bunk. Also known as double decker bed.
    int bunkBedsCount?;
    # Bunk beds count exception.
    string bunkBedsCountException?;
    # Cribs count. The number of small beds for an infant or toddler that the guestroom can obtain. The bed is surrounded by a high railing to prevent the child from falling or climbing out of the bed
    int cribsCount?;
    # Cribs count exception.
    string cribsCountException?;
    # Double beds count. The number of medium beds measuring 53"W x 75"L (135cm x 191cm). Also known as full size bed.
    int doubleBedsCount?;
    # Double beds count exception.
    string doubleBedsCountException?;
    # Feather pillows. The option for guests to obtain bed pillows that are stuffed with the feathers and down of ducks or geese.
    boolean featherPillows?;
    # Feather pillows exception.
    string featherPillowsException?;
    # Hypoallergenic bedding. Bedding such as linens, pillows, mattress covers and/or mattresses that are made of materials known to be resistant to allergens such as mold, dust and dander.
    boolean hypoallergenicBedding?;
    # Hypoallergenic bedding exception.
    string hypoallergenicBeddingException?;
    # King beds count. The number of large beds measuring 76"W x 80"L (193cm x 102cm). Most often meant to accompany two people. Includes California king and super king.
    int kingBedsCount?;
    # King beds count exception.
    string kingBedsCountException?;
    # Memory foam pillows. The option for guests to obtain bed pillows that are stuffed with a man-made foam that responds to body heat by conforming to the body closely, and then recovers its shape when the pillow cools down.
    boolean memoryFoamPillows?;
    # Memory foam pillows exception.
    string memoryFoamPillowsException?;
    # Other beds count. The number of beds that are not standard mattress and boxspring setups such as Japanese tatami mats, trundle beds, air mattresses and cots.
    int otherBedsCount?;
    # Other beds count exception.
    string otherBedsCountException?;
    # Queen beds count. The number of medium-large beds measuring 60"W x 80"L (152cm x 102cm).
    int queenBedsCount?;
    # Queen beds count exception.
    string queenBedsCountException?;
    # Roll away beds count. The number of mattresses on wheeled frames that can be folded in half and rolled away for easy storage that the guestroom can obtain upon request.
    int rollAwayBedsCount?;
    # Roll away beds count exception.
    string rollAwayBedsCountException?;
    # Single or twin count beds. The number of smaller beds measuring 38"W x 75"L (97cm x 191cm) that can accommodate one adult.
    int singleOrTwinBedsCount?;
    # Single or twin beds count exception.
    string singleOrTwinBedsCountException?;
    # Sofa beds count. The number of specially designed sofas that can be made to serve as a bed by lowering its hinged upholstered back to horizontal position or by pulling out a concealed mattress.
    int sofaBedsCount?;
    # Sofa beds count exception.
    string sofaBedsCountException?;
    # Synthetic pillows. The option for guests to obtain bed pillows stuffed with polyester material crafted to reproduce the feel of a pillow stuffed with down and feathers.
    boolean syntheticPillows?;
    # Synthetic pillows exception.
    string syntheticPillowsException?;
};

# This message denotes nutrition information with an upper bound and lower bound range and can be represented by mass unit. Lower amount must be specified. Both lower and upper amounts are non-negative numbers.
public type NutritionFact record {
    # Required. Lower amount of nutrition
    float lowerAmount?;
    # Required. Unit of the given nutrition information.
    string unit?;
    # Optional. Upper amount of nutrition
    float upperAmount?;
};

# Item of a Section. It can be the dish itself, or can contain multiple FoodMenuItemOption.
public type FoodMenuItem record {
    # Attributes of a food item/dish.
    FoodMenuItemAttributes attributes?;
    # Required. Language tagged labels for this menu item. Display names should be 140 characters or less, with descriptions 1,000 characters or less. At least one set of labels is required.
    MenuLabel[] labels?;
    # Optional. This is for an item that comes in multiple different options, and users are required to make choices. E.g. "regular" vs. "large" pizza. When options are specified, labels and attributes at item level will automatically become the first option's labels and attributes. Clients only need to specify other additional food options in this field.
    FoodMenuItemOption[] options?;
};

# Display data for verifications through postcard.
public type AddressVerificationData record {
    # Represents a postal address, e.g. for postal delivery or payments addresses. Given a postal address, a postal service can deliver items to a premise, P.O. Box or similar. It is not intended to model geographical locations (roads, towns, mountains). In typical usage an address would be created via user input or from importing existing data, depending on the type of process. Advice on address input / editing: - Use an i18n-ready address widget such as https://github.com/google/libaddressinput) - Users should not be presented with UI elements for input or editing of fields outside countries where that field is used. For more guidance on how to use this schema, please see: https://support.google.com/business/answer/6397478
    PostalAddress address?;
    # Merchant's business name.
    string businessName?;
};

# The dimension for which data is divided over.
public type TimeDimension record {
    # The day of the week ("MONDAY" to "SUNDAY") this value corresponds to. Set for BREAKDOWN_DAY_OF_WEEK option.
    string dayOfWeek?;
    # Represents a time of day. The date and time zone are either not significant or are specified elsewhere. An API may choose to allow leap seconds. Related types are google.type.Date and `google.protobuf.Timestamp`.
    TimeOfDay timeOfDay?;
    # A range of time. Data will be pulled over the range as a half-open inverval (that is, [start_time, end_time)).
    TimeRange timeRange?;
};

# Input for EMAIL verification.
public type EmailInput record {
    # Email address where the PIN should be sent to. An email address is accepted only if it is one of the addresses provided by FetchVerificationOptions. If the EmailVerificationData has is_user_name_editable set to true, the client may specify a different user name (local-part) but must match the domain name.
    string emailAddress?;
};

# A specific type of unit primarily defined by its features.
public type GuestUnitType record {
    # Required. Unit or room code identifiers for a single GuestUnitType. Each code must be unique within a Lodging instance.
    string[] codes?;
    # Features and available amenities in the guest unit.
    GuestUnitFeatures features?;
    # Required. Short, English label or name of the GuestUnitType. Target <50 chars.
    string label?;
};

# Meals, snacks, and beverages available at the property.
public type FoodAndDrink record {
    # Bar. A designated room, lounge or area of an on-site restaurant with seating at a counter behind which a hotel staffer takes the guest's order and provides the requested alcoholic drink. Can be indoors or outdoors. Also known as Pub.
    boolean bar?;
    # Bar exception.
    string barException?;
    # Breakfast available. The morning meal is offered to all guests. Can be free or for a fee.
    boolean breakfastAvailable?;
    # Breakfast available exception.
    string breakfastAvailableException?;
    # Breakfast buffet. Breakfast meal service where guests serve themselves from a variety of dishes/foods that are put out on a table.
    boolean breakfastBuffet?;
    # Breakfast buffet exception.
    string breakfastBuffetException?;
    # Buffet. A type of meal where guests serve themselves from a variety of dishes/foods that are put out on a table. Includes lunch and/or dinner meals. A breakfast-only buffet is not sufficient.
    boolean buffet?;
    # Buffet exception.
    string buffetException?;
    # Dinner buffet. Dinner meal service where guests serve themselves from a variety of dishes/foods that are put out on a table.
    boolean dinnerBuffet?;
    # Dinner buffet exception.
    string dinnerBuffetException?;
    # Free breakfast. Breakfast is offered for free to all guests. Does not apply if limited to certain room packages.
    boolean freeBreakfast?;
    # Free breakfast exception.
    string freeBreakfastException?;
    # Restaurant. A business onsite at the hotel that is open to the public as well as guests, and offers meals and beverages to consume at tables or counters. May or may not include table service. Also known as cafe, buffet, eatery. A "breakfast room" where the hotel serves breakfast only to guests (not the general public) does not count as a restaurant.
    boolean restaurant?;
    # Restaurant exception.
    string restaurantException?;
    # Restaurants count. The number of restaurants at the hotel.
    int restaurantsCount?;
    # Restaurants count exception.
    string restaurantsCountException?;
    # Room service. A hotel staffer delivers meals prepared onsite to a guest's room as per their request. May or may not be available during specific hours. Services should be available to all guests (not based on rate/room booked/reward program, etc).
    boolean roomService?;
    # Room service exception.
    string roomServiceException?;
    # Table service. A restaurant in which a staff member is assigned to a guest's table to take their order, deliver and clear away food, and deliver the bill, if applicable. Also known as sit-down restaurant.
    boolean tableService?;
    # Table service exception.
    string tableServiceException?;
    # 24hr room service. Room service is available 24 hours a day.
    boolean twentyFourHourRoomService?;
    # 24hr room service exception.
    string twentyFourHourRoomServiceException?;
    # Vending machine. A glass-fronted mechanized cabinet displaying and dispensing snacks and beverages for purchase by coins, paper money and/or credit cards.
    boolean vendingMachine?;
    # Vending machine exception.
    string vendingMachineException?;
};

# Features of the property of specific interest to the business traveler.
public type Business record {
    # Business center. A designated room at the hotel with one or more desks and equipped with guest-use computers, printers, fax machines and/or photocopiers. May or may not be open 24/7. May or may not require a key to access. Not a meeting room or conference room.
    boolean businessCenter?;
    # Business center exception.
    string businessCenterException?;
    # Meeting rooms. Rooms at the hotel designated for business-related gatherings. Rooms are usually equipped with tables or desks, office chairs and audio/visual facilities to allow for presentations and conference calls. Also known as conference rooms.
    boolean meetingRooms?;
    # Meeting rooms count. The number of meeting rooms at the property.
    int meetingRoomsCount?;
    # Meeting rooms count exception.
    string meetingRoomsCountException?;
    # Meeting rooms exception.
    string meetingRoomsException?;
};

# Conveniences provided in guest units to facilitate an easier, more comfortable stay.
public type Housekeeping record {
    # Daily housekeeping. Guest units are cleaned by hotel staff daily during guest's stay.
    boolean dailyHousekeeping?;
    # Daily housekeeping exception.
    string dailyHousekeepingException?;
    # Housekeeping available. Guest units are cleaned by hotel staff during guest's stay. Schedule may vary from daily, weekly, or specific days of the week.
    boolean housekeepingAvailable?;
    # Housekeeping available exception.
    string housekeepingAvailableException?;
    # Turndown service. Hotel staff enters guest units to prepare the bed for sleep use. May or may not include some light housekeeping. May or may not include an evening snack or candy. Also known as evening service.
    boolean turndownService?;
    # Turndown service exception.
    string turndownServiceException?;
};

# A service list containing one or more service items.
public type ServiceList record {
    # Required. Google identifier for this location in the form: `accounts/{account_id}/locations/{location_id}/serviceList`
    string name?;
    # Service items that are contained within this service list. Duplicated service items will be removed automatically.
    ServiceItem[] serviceItems?;
};

# Values for an attribute with a `value_type` of URL.
public type UrlAttributeValue record {
    # The URL.
    string url?;
};

# Follower metadata for a location.
public type FollowersMetadata record {
    # Total number of followers for the location.
    string count?;
    # The resource name for this. accounts/{account_id}/locations/{location_id}/followers/metadata
    string name?;
};

# Output only. Represents a pending invitation.
public type Invitation record {
    # The resource name for the invitation.
    string name?;
    # The invited role on the account.
    string role?;
    # An account is a container for your business's locations. If you are the only user who manages locations for your business, you can use your personal Google Account. To share management of locations with multiple users, [create a business account] (https://support.google.com/business/answer/6085339?ref_topic=6085325).
    Account targetAccount?;
    # Represents a target location for a pending invitation.
    TargetLocation targetLocation?;
};

# All the information pertaining to an event featured in a local post.
public type LocalPostEvent record {
    # An interval of time, inclusive. It must contain all fields to be valid.
    TimeInterval schedule?;
    # Name of the event.
    string title?;
};

# Indicates status of the account, such as whether the account has been verified by Google.
public type AccountState record {
    # If verified, future locations that are created are automatically connected to Google Maps, and have Google+ pages created, without requiring moderation.
    string status?;
};

# Attributes of a food item/dish.
public type FoodMenuItemAttributes record {
    # Optional. Allergens associated with the food dish. It is highly recommended to provide this field.
    string[] allergen?;
    # Optional. Dietary information of the food dish. It is highly recommended to provide this field.
    string[] dietaryRestriction?;
    # Optional. Ingredients of the food dish option.
    Ingredient[] ingredients?;
    # Optional. The media keys of the media associated with the dish. Only photo media is supported. When there are multiple photos associated, the first photo is considered as the preferred photo.
    string[] mediaKeys?;
    # This message represents nutrition facts for a food dish.
    NutritionFacts nutritionFacts?;
    # Serving portion size of a food dish.
    PortionSize portionSize?;
    # Optional. Methods on how the food dish option is prepared.
    string[] preparationMethods?;
    # Represents an amount of money with its currency type.
    Money price?;
    # Optional. Number of people can be served by this food dish option.
    int servesNumPeople?;
    # Optional. Spiciness level of the food dish.
    string spiciness?;
};

# Represents a Location that is present on Google. This can be a location that has been claimed by the user, someone else, or could be unclaimed.
public type GoogleLocation record {
    # A location. See the [help center article] (https://support.google.com/business/answer/3038177) for a detailed description of these fields, or the [category endpoint](/my-business/reference/rest/v4/categories) for a list of valid business categories.
    Location location?;
    # Resource name of this GoogleLocation, in the format `googleLocations/{googleLocationId}`.
    string name?;
    # A URL that will redirect the user to the request admin rights UI. This field is only present if the location has already been claimed by any user, including the current user.
    string requestAdminRightsUrl?;
};

# All the metrics requested for a Local Post.
public type LocalPostMetrics record {
    # Local post name
    string localPostName?;
    # A list of values for the requested metrics.
    MetricValue[] metricValues?;
};

# Forms of payment accepted at the property.
public type PaymentOptions record {
    # Cash. The hotel accepts payment by paper/coin currency.
    boolean cash?;
    # Cash exception.
    string cashException?;
    # Cheque. The hotel accepts a printed document issued by the guest's bank in the guest's name as a form of payment.
    boolean cheque?;
    # Cheque exception.
    string chequeException?;
    # Credit card. The hotel accepts payment by a card issued by a bank or credit card company. Also known as charge card, debit card, bank card, or charge plate.
    boolean creditCard?;
    # Credit card exception.
    string creditCardException?;
    # Debit card. The hotel accepts a bank-issued card that immediately deducts the charged funds from the guest's bank account upon processing.
    boolean debitCard?;
    # Debit card exception.
    string debitCardException?;
    # Mobile nfc. The hotel has the compatible computer hardware terminal that reads and charges a payment app on the guest's smartphone without requiring the two devices to make physical contact. Also known as Apple Pay, Google Pay, Samsung Pay.
    boolean mobileNfc?;
    # Mobile nfc exception.
    string mobileNfcException?;
};

# Attribution information for customer media items, such as the contributor's name and profile picture.
public type Attribution record {
    # The user name to attribute the media item to.
    string profileName?;
    # URL of the attributed user's profile photo thumbnail.
    string profilePhotoUrl?;
    # The URL of the attributed user's Google Maps profile page.
    string profileUrl?;
    # The URL of the takedown page, where the media item can be reported if it is inappropriate.
    string takedownUrl?;
};

# Response message for BusinessCategories.BatchGetBusinessCategories.
public type BatchGetBusinessCategoriesResponse record {
    # Categories that match the GConcept ids provided in the request. They will not come in the same order as category ids in the request.
    Category[] categories?;
};

# A range of time. Data will be pulled over the range as a half-open inverval (that is, [start_time, end_time)).
public type TimeRange record {
    # Epoch timestamp for the end of the range (exclusive).
    string endTime?;
    # Epoch timestamp for the start of the range (inclusive).
    string startTime?;
};

# Response message for Locations.FindMatchingLocations.
public type FindMatchingLocationsResponse record {
    # When the matching algorithm was last executed for this location.
    string matchTime?;
    # A collection of locations that are potential matches to the specified location, listed in order from best to least match. If there is an exact match, it will be in the first position.
    MatchedLocation[] matchedLocations?;
};

# Request message for Accounts.GenerateAccountNumber.
public type GenerateAccountNumberRequest record {
};

# Represents a location that was modified by Google.
public type GoogleUpdatedLocation record {
    # The fields that Google updated.
    string diffMask?;
    # A location. See the [help center article] (https://support.google.com/business/answer/3038177) for a detailed description of these fields, or the [category endpoint](/my-business/reference/rest/v4/categories) for a list of valid business categories.
    Location location?;
};

# Request message for GoogleLocations.SearchGoogleLocations.
public type SearchGoogleLocationsRequest record {
    # A location. See the [help center article] (https://support.google.com/business/answer/3038177) for a detailed description of these fields, or the [category endpoint](/my-business/reference/rest/v4/categories) for a list of valid business categories.
    Location location?;
    # Text query to search for. The search results from a query string will be less accurate than if providing an exact location, but can provide more inexact matches.
    string query?;
    # The number of matches to return. The default value is 3, with a maximum of 10. Note that latency may increase if more are requested. There is no pagination.
    int resultCount?;
};

# The Health provider attributes linked with this location.
public type HealthProviderAttributes record {
    # Optional. A list of insurance networks accpected by this location.
    InsuranceNetwork[] insuranceNetworks?;
    # Required. Google identifier for this location in the form: `accounts/{account_id}/locations/{location_id}/healthProviderAttributes`
    string name?;
};

# Serving portion size of a food dish.
public type PortionSize record {
    # Required. Number of the portion.
    int quantity?;
    # Required. The repeated name_info field is for the unit in multiple languages.
    MenuLabel[] unit?;
};

# The ways in which the property provides guests with the ability to access the internet.
public type Connectivity record {
    # Free wifi. The hotel offers guests wifi for free.
    boolean freeWifi?;
    # Free wifi exception.
    string freeWifiException?;
    # Public area wifi available. Guests have the ability to wirelessly connect to the internet in the areas of the hotel accessible to anyone. Can be free or for a fee.
    boolean publicAreaWifiAvailable?;
    # Public area wifi available exception.
    string publicAreaWifiAvailableException?;
    # Public internet terminal. An area of the hotel supplied with computers and designated for the purpose of providing guests with the ability to access the internet.
    boolean publicInternetTerminal?;
    # Public internet terminal exception.
    string publicInternetTerminalException?;
    # Wifi available. The hotel provides the ability for guests to wirelessly connect to the internet. Can be in the public areas of the hotel and/or in the guest rooms. Can be free or for a fee.
    boolean wifiAvailable?;
    # Wifi available exception.
    string wifiAvailableException?;
};

# Response message for GoogleLocations.ListRecommendedGoogleLocations. It also contains some locations that have been claimed by other GMB users since the last time they were recommended to this GMB account.
public type ListRecommendedGoogleLocationsResponse record {
    # The locations recommended to a GMB account. Each of these represents a GoogleLocation that is present on Maps. The locations are sorted in decreasing order of relevance to the GMB account.
    GoogleLocation[] googleLocations?;
    # During pagination, if there are more locations available to be fetched in the next page, this field is populated with a token to fetch the next page of locations in a subsequent call. If there are no more locations to be fetched, this field is not present in the response.
    string nextPageToken?;
    # The total number of recommended locations for this GMB account, irrespective of pagination.
    int totalSize?;
};

# Response message for QuestionsAndAnswers.ListAnswers
public type ListAnswersResponse record {
    # The requested answers.
    Answer[] answers?;
    # If the number of answers exceeds the requested max page size, this field is populated with a token to fetch the next page of answers on a subsequent call. If there are no more answers, this field is not present in the response.
    string nextPageToken?;
    # The total number of answers posted for this question across all pages.
    int totalSize?;
};

# A Google Cloud Pub/Sub topic where notifications can be published when a location is updated or has a new review. There will be only one notification settings resource per-account.
public type Notifications record {
    # Output only. The notifications resource name.
    string name?;
    # The types of notifications that will be sent to the Cloud Pub/Sub topic. At least one must be specified. To stop receiving notifications entirely, use DeleteNotifications.
    string[] notificationTypes?;
    # The Google Cloud Pub/Sub topic that will receive notifications when locations managed by this account are updated. If unset, no notifications will be posted. The account mybusiness-api-pubsub@system.gserviceaccount.com must have at least Publish permissions on the Cloud Pub/Sub topic.
    string topicName?;
};

# Response message for Verifications.FetchVerificationOptions.
public type FetchVerificationOptionsResponse record {
    # The available verification options.
    VerificationOption[] options?;
};

# Request message for Locations.BatchGetLocations.
public type BatchGetLocationsRequest record {
    # A collection of locations to fetch, specified by their names.
    string[] locationNames?;
};

# A category describing what this business is (not what it does). For a list of valid category IDs, and the mappings to their human-readable names, see [categories.list](https://developers.google.com/my-business/reference/rest/v4/categories/list).
public type Category record {
    # @OutputOnly. A stable ID (provided by Google) for this category. The `category_id` must be specified when modifying the category (when creating or updating a location).
    string categoryId?;
    # @OutputOnly. The human-readable name of the category. This is set when reading the location. When modifying the location, `category_id` must be set.
    string displayName?;
    # Output only. More hours types that are available for this business category.
    MoreHoursType[] moreHoursTypes?;
    # @OutputOnly. A list of all the service types that are available for this business category.
    ServiceType[] serviceTypes?;
};

# Physical adaptations made to the property in consideration of varying levels of human physical ability.
public type Accessibility record {
    # Mobility accessible. Throughout the property there are physical adaptations to ease the stay of a person in a wheelchair, such as auto-opening doors, wide elevators, wide bathrooms or ramps.
    boolean mobilityAccessible?;
    # Mobility accessible elevator. A lift that transports people from one level to another and is built to accommodate a wheelchair-using passenger owing to the width of its doors and placement of call buttons.
    boolean mobilityAccessibleElevator?;
    # Mobility accessible elevator exception.
    string mobilityAccessibleElevatorException?;
    # Mobility accessible exception.
    string mobilityAccessibleException?;
    # Mobility accessible parking. The presence of a marked, designated area of prescribed size in which only registered, labeled vehicles transporting a person with physical challenges may park.
    boolean mobilityAccessibleParking?;
    # Mobility accessible parking exception.
    string mobilityAccessibleParkingException?;
    # Mobility accessible pool. A swimming pool equipped with a mechanical chair that can be lowered and raised for the purpose of moving physically challenged guests into and out of the pool. May be powered by electricity or water. Also known as pool lift.
    boolean mobilityAccessiblePool?;
    # Mobility accessible pool exception.
    string mobilityAccessiblePoolException?;
};

# Request message for Locations.ClearLocationAssociationRequest.
public type ClearLocationAssociationRequest record {
};

# Vehicles or vehicular services facilitated or owned by the property.
public type Transportation record {
    # Airport shuttle. The hotel provides guests with a chauffeured van or bus to and from the airport. Can be free or for a fee. Guests may share the vehicle with other guests unknown to them. Applies if the hotel has a third-party shuttle service (office/desk etc.) within the hotel. As long as hotel provides this service, it doesn't matter if it's directly with them or a third party they work with. Does not apply if guest has to coordinate with an entity outside/other than the hotel.
    boolean airportShuttle?;
    # Airport shuttle exception.
    string airportShuttleException?;
    # Car rental on property. A branch of a rental car company with a processing desk in the hotel. Available cars for rent may be awaiting at the hotel or in a nearby lot.
    boolean carRentalOnProperty?;
    # Car rental on property exception.
    string carRentalOnPropertyException?;
    # Free airport shuttle. Airport shuttle is free to guests. Must be free to all guests without any conditions.
    boolean freeAirportShuttle?;
    # Free airport shuttle exception.
    string freeAirportShuttleException?;
    # Free private car service. Private chauffeured car service is free to guests.
    boolean freePrivateCarService?;
    # Free private car service exception.
    string freePrivateCarServiceException?;
    # Local shuttle. A car, van or bus provided by the hotel to transport guests to destinations within a specified range of distance around the hotel. Usually shopping and/or convention centers, downtown districts, or beaches. Can be free or for a fee.
    boolean localShuttle?;
    # Local shuttle exception.
    string localShuttleException?;
    # Private car service. Hotel provides a private chauffeured car to transport guests to destinations. Passengers in the car are either alone or are known to one another and have requested the car together. Service can be free or for a fee and travel distance is usually limited to a specific range. Not a taxi.
    boolean privateCarService?;
    # Private car service exception.
    string privateCarServiceException?;
    # Transfer. Hotel provides a shuttle service or car service to take guests to and from the nearest airport or train station. Can be free or for a fee. Guests may share the vehicle with other guests unknown to them.
    boolean transfer?;
    # Transfer exception.
    string transferException?;
};

# Features in the living area.
public type LivingAreaFeatures record {
    # Air conditioning. An electrical machine used to cool the temperature of the guestroom.
    boolean airConditioning?;
    # Air conditioning exception.
    string airConditioningException?;
    # Bathtub. A fixed plumbing feature set on the floor and consisting of a large container that accommodates the body of an adult for the purpose of seated bathing. Includes knobs or fixtures to control the temperature of the water, a faucet through which the water flows, and a drain that can be closed for filling and opened for draining.
    boolean bathtub?;
    # Bathtub exception.
    string bathtubException?;
    # Bidet. A plumbing fixture attached to a toilet or a low, fixed sink designed for the purpose of washing after toilet use.
    boolean bidet?;
    # Bidet exception.
    string bidetException?;
    # Dryer. An electrical machine designed to dry clothing.
    boolean dryer?;
    # Dryer exception.
    string dryerException?;
    # Electronic room key. A card coded by the check-in computer that is read by the lock on the hotel guestroom door to allow for entry.
    boolean electronicRoomKey?;
    # Electronic room key exception.
    string electronicRoomKeyException?;
    # Fireplace. A framed opening (aka hearth) at the base of a chimney in which logs or an electrical fire feature are burned to provide a relaxing ambiance or to heat the room. Often made of bricks or stone.
    boolean fireplace?;
    # Fireplace exception.
    string fireplaceException?;
    # Hairdryer. A handheld electric appliance that blows temperature-controlled air for the purpose of drying wet hair. Can be mounted to a bathroom wall or a freestanding device stored in the guestroom's bathroom or closet.
    boolean hairdryer?;
    # Hairdryer exception.
    string hairdryerException?;
    # Heating. An electrical machine used to warm the temperature of the guestroom.
    boolean heating?;
    # Heating exception.
    string heatingException?;
    # In-unit safe. A strong fireproof cabinet with a programmable lock, used for the protected storage of valuables in a guestroom. Often built into a closet.
    boolean inunitSafe?;
    # In-unit safe exception.
    string inunitSafeException?;
    # In-unit Wifi available. Guests can wirelessly connect to the Internet in the guestroom. Can be free or for a fee.
    boolean inunitWifiAvailable?;
    # In-unit Wifi available exception.
    string inunitWifiAvailableException?;
    # Ironing equipment. A device, usually with a flat metal base, that is heated to smooth, finish, or press clothes and a flat, padded, cloth-covered surface on which the clothes are worked.
    boolean ironingEquipment?;
    # Ironing equipment exception.
    string ironingEquipmentException?;
    # Pay per view movies. Televisions with channels that offer films that can be viewed for a fee, and have an interface to allow the viewer to accept the terms and approve payment.
    boolean payPerViewMovies?;
    # Pay per view movies exception.
    string payPerViewMoviesException?;
    # Private bathroom. A bathroom designated for the express use of the guests staying in a specific guestroom.
    boolean privateBathroom?;
    # Private bathroom exception.
    string privateBathroomException?;
    # Shower. A fixed plumbing fixture for standing bathing that features a tall spray spout or faucet through which water flows, a knob or knobs that control the water's temperature, and a drain in the floor.
    boolean shower?;
    # Shower exception.
    string showerException?;
    # Toilet. A fixed bathroom feature connected to a sewer or septic system and consisting of a water-flushed bowl with a seat, as well as a device that elicites the water-flushing action. Used for the process and disposal of human waste.
    boolean toilet?;
    # Toilet exception.
    string toiletException?;
    # TV. A television is available in the guestroom.
    boolean tv?;
    # TV casting. A television equipped with a device through which the video entertainment accessed on a personal computer, phone or tablet can be wirelessly delivered to and viewed on the guestroom's television.
    boolean tvCasting?;
    # TV exception.
    string tvCastingException?;
    # TV exception.
    string tvException?;
    # TV streaming. Televisions that embed a range of web-based apps to allow for watching media from those apps.
    boolean tvStreaming?;
    # TV streaming exception.
    string tvStreamingException?;
    # Universal power adapters. A power supply for electronic devices which plugs into a wall for the purpose of converting AC to a single DC voltage. Also know as AC adapter or charger.
    boolean universalPowerAdapters?;
    # Universal power adapters exception.
    string universalPowerAdaptersException?;
    # Washer. An electrical machine connected to a running water source designed to launder clothing.
    boolean washer?;
    # Washer exception.
    string washerException?;
};

# A request for basic metric insights.
public type BasicMetricsRequest record {
    # A collection of metrics to return values for including the options for how the data should be returned.
    MetricRequest[] metricRequests?;
    # A range of time. Data will be pulled over the range as a half-open inverval (that is, [start_time, end_time)).
    TimeRange timeRange?;
};

# Lodging of a location that provides accomodations.
public type Lodging record {
    # Physical adaptations made to the property in consideration of varying levels of human physical ability.
    Accessibility accessibility?;
    # Amenities and features related to leisure and play.
    Activities activities?;
    # Features and available amenities in the guest unit.
    GuestUnitFeatures allUnits?;
    # Features of the property of specific interest to the business traveler.
    Business business?;
    # An individual room, such as kitchen, bathroom, bedroom, within a bookable guest unit.
    LivingArea commonLivingArea?;
    # The ways in which the property provides guests with the ability to access the internet.
    Connectivity connectivity?;
    # Services and amenities for families and young guests.
    Families families?;
    # Meals, snacks, and beverages available at the property.
    FoodAndDrink foodAndDrink?;
    # Individual GuestUnitTypes that are available in this Lodging.
    GuestUnitType[] guestUnits?;
    # Health and safety measures implemented by the hotel during COVID-19.
    HealthAndSafety healthAndSafety?;
    # Conveniences provided in guest units to facilitate an easier, more comfortable stay.
    Housekeeping housekeeping?;
    # Metadata for the Lodging.
    LodgingMetadata metadata?;
    # Required. Google identifier for this location in the form: `accounts/{account_id}/locations/{location_id}/lodging`
    string name?;
    # Parking options at the property.
    Parking parking?;
    # Policies regarding guest-owned animals.
    Pets pets?;
    # Property rules that impact guests.
    Policies policies?;
    # Swimming pool or recreational water facilities available at the hotel.
    Pools pools?;
    # General factual information about the property's physical structure and important dates.
    Property property?;
    # Conveniences or help provided by the property to facilitate an easier, more comfortable stay.
    Services services?;
    # Features and available amenities in the guest unit.
    GuestUnitFeatures someUnits?;
    # Vehicles or vehicular services facilitated or owned by the property.
    Transportation transportation?;
    # Guest facilities at the property to promote or maintain health, beauty, and fitness.
    Wellness wellness?;
};

# A radius around a particular point (latitude/longitude).
public type PointRadius record {
    # An object that represents a latitude/longitude pair. This is expressed as a pair of doubles to represent degrees latitude and degrees longitude. Unless specified otherwise, this must conform to the WGS84 standard. Values must be within normalized ranges.
    LatLng latlng?;
    # The distance in kilometers of the area around the point.
    float radiusKm?;
};

# Output only. Represents a review for a location.
public type Review record {
    # The body of the review as plain text with markups.
    string comment?;
    # The timestamp for when the review was written.
    string createTime?;
    # The resource name. For Review it is of the form `accounts/{account_id}/locations/{location_id}/reviews/{review_id}`
    string name?;
    # The encrypted unique identifier.
    string reviewId?;
    # Represents the location owner/manager's reply to a review.
    ReviewReply reviewReply?;
    # Represents the author of the review.
    Reviewer reviewer?;
    # The star rating of the review.
    string starRating?;
    # The timestamp for when the review was last modified.
    string updateTime?;
};

# Top regions where driving-direction requests originated from.
public type TopDirectionSources record {
    # The number of days data is aggregated over.
    int dayCount?;
    # Regions sorted in descending order by count.
    RegionCount[] regionCounts?;
};

# Response message for InsuranceNetworkService.ListInsuranceNetworks
public type ListInsuranceNetworksResponse record {
    # A list of insurance networks that are supported by Google.
    InsuranceNetwork[] networks?;
    # If there are more insurance networks than the requested page size, then this field is populated with a token to fetch the next page of insurance networks on a subsequent call to ListInsuranceNetworks.
    string nextPageToken?;
};

# Defines the union of areas represented by a set of places.
public type Places record {
    # The areas represented by place IDs. Limited to a maximum of 20 places.
    PlaceInfo[] placeInfos?;
};

# Information about the layout of the living area.
public type LivingAreaLayout record {
    # Balcony. An outdoor platform attached to a building and surrounded by a short wall, fence or other safety railing. The balcony is accessed through a door in a guestroom or suite and is for use by the guest staying in that room. May or may not include seating or outdoor furniture. Is not located on the ground floor. Also lanai.
    boolean balcony?;
    # Balcony exception.
    string balconyException?;
    # Living area sq meters. The measurement in meters of the area of a guestroom's living space.
    float livingAreaSqMeters?;
    # Living area sq meters exception.
    string livingAreaSqMetersException?;
    # Loft. A three-walled upper area accessed by stairs or a ladder that overlooks the lower area of a room.
    boolean loft?;
    # Loft exception.
    string loftException?;
    # Non smoking. A guestroom in which the smoking of cigarettes, cigars and pipes is prohibited.
    boolean nonSmoking?;
    # Non smoking exception.
    string nonSmokingException?;
    # Patio. A paved, outdoor area with seating attached to and accessed through a ground-floor guestroom for use by the occupants of the guestroom.
    boolean patio?;
    # Patio exception.
    string patioException?;
    # Stairs. There are steps leading from one level or story to another in the unit.
    boolean stairs?;
    # Stairs exception.
    string stairsException?;
};

# Represents an amount of money with its currency type.
public type Money record {
    # The three-letter currency code defined in ISO 4217.
    string currencyCode?;
    # Number of nano (10^-9) units of the amount. The value must be between -999,999,999 and +999,999,999 inclusive. If `units` is positive, `nanos` must be positive or zero. If `units` is zero, `nanos` can be positive, zero, or negative. If `units` is negative, `nanos` must be negative or zero. For example $-1.75 is represented as `units`=-1 and `nanos`=-750,000,000.
    int nanos?;
    # The whole units of the amount. For example if `currencyCode` is `"USD"`, then 1 unit is one US dollar.
    string units?;
};

# Request message for Verifications.VerifyLocation.
public type VerifyLocationRequest record {
    # Input for ADDRESS verification.
    AddressInput addressInput?;
    # Additional data for service business verification.
    ServiceBusinessContext context?;
    # Input for EMAIL verification.
    EmailInput emailInput?;
    # The BCP 47 language code representing the language that is to be used for the verification process.
    string languageCode?;
    # Verification method.
    string method?;
    # Input for PHONE_CALL/SMS verification.
    PhoneInput phoneInput?;
};

# A generic empty message that you can re-use to avoid defining duplicated empty messages in your APIs. A typical example is to use it as the request or the response type of an API method. For instance: service Foo { rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty); } The JSON representation for `Empty` is empty JSON object `{}`.
public type Empty record {
};

# A value for a single Metric from a starting time.
public type MetricValue record {
    # Dimensional values for this metric.
    DimensionalMetricValue[] dimensionalValues?;
    # The metric for which the value applies.
    string metric?;
    # A value for a single metric with a given time dimension.
    DimensionalMetricValue totalValue?;
};

# Represents a set of time periods when a location's operational hours differ from its normal business hours.
public type SpecialHours record {
    # A list of exceptions to the business's regular hours.
    SpecialHourPeriod[] specialHourPeriods?;
};

# Response message for Accounts.ListAccounts.
public type ListAccountsResponse record {
    # A collection of accounts to which the user has access. The personal account of the user doing the query will always be the first item of the result, unless it is filtered out.
    Account[] accounts?;
    # If the number of accounts exceeds the requested page size, this field is populated with a token to fetch the next page of accounts on a subsequent call to `accounts.list`. If there are no more accounts, this field is not present in the response.
    string nextPageToken?;
};

# A region with its associated request count.
public type RegionCount record {
    # Number of driving-direction requests from this region.
    string count?;
    # Human-readable label for the region.
    string label?;
    # An object that represents a latitude/longitude pair. This is expressed as a pair of doubles to represent degrees latitude and degrees longitude. Unless specified otherwise, this must conform to the WGS84 standard. Values must be within normalized ranges.
    LatLng latlng?;
};

# The time periods during which a location is open for certain types of business.
public type MoreHours record {
    # Required. Type of hours. Clients should call {#link businessCategories:BatchGet} to get supported hours types for categories of their locations.
    string hoursTypeId?;
    # Required. A collection of times that this location is open. Each period represents a range of hours when the location is open during the week.
    TimePeriod[] periods?;
};

# Service area businesses provide their service at the customer's location (for example, a locksmith or plumber).
public type ServiceAreaBusiness record {
    # Indicates the type of the service area business.
    string businessType?;
    # Defines the union of areas represented by a set of places.
    Places places?;
    # A radius around a particular point (latitude/longitude).
    PointRadius radius?;
};

# Response message for Reviews.BatchGetReviews.
public type BatchGetReviewsResponse record {
    # Reviews with location information.
    LocationReview[] locationReviews?;
    # If the number of reviews exceeded the requested page size, this field is populated with a token to fetch the next page of reviews on a subsequent calls. If there are no more reviews, this field will not be present in the response.
    string nextPageToken?;
};

# Response message for QuestionsAndAnswers.ListQuestions
public type ListQuestionsResponse record {
    # If the number of questions exceeds the requested max page size, this field is populated with a token to fetch the next page of questions on a subsequent call. If there are no more questions, this field is not present in the response.
    string nextPageToken?;
    # The requested questions,
    Question[] questions?;
    # The total number of questions posted for this location across all pages.
    int totalSize?;
};

# A list of item price information. Price lists are structured as one or more price lists, each containing one or more sections with one or more items. For example, food price lists may represent breakfast/lunch/dinner menus, with sections for burgers/steak/seafood.
public type PriceList record {
    # Required. Language-tagged labels for the price list.
    Label[] labels?;
    # Required. ID for the price list. Price list, section, and item IDs cannot be duplicated within this Location.
    string priceListId?;
    # Required. Sections for this price list. Each price list must contain at least one section.
    Section[] sections?;
    # Optional source URL of where the price list was retrieved from. For example, this could be the URL of the page that was automatically scraped to populate the menu information.
    string sourceUrl?;
};

# Amenities and features related to leisure and play.
public type Activities record {
    # Beach access. The hotel property is in close proximity to a beach and offers a way to get to that beach. This can include a route to the beach such as stairs down if hotel is on a bluff, or a short trail. Not the same as beachfront (with beach access, the hotel's proximity is close to but not right on the beach).
    boolean beachAccess?;
    # Beach access exception.
    string beachAccessException?;
    # Breach front. The hotel property is physically located on the beach alongside an ocean, sea, gulf, or bay. It is not on a lake, river, stream, or pond. The hotel is not separated from the beach by a public road allowing vehicular, pedestrian, or bicycle traffic.
    boolean beachFront?;
    # Beach front exception.
    string beachFrontException?;
    # Bicycle rental. The hotel owns bicycles that it permits guests to borrow and use. Can be free or for a fee.
    boolean bicycleRental?;
    # Bicycle rental exception.
    string bicycleRentalException?;
    # Boutique stores. There are stores selling clothing, jewelry, art and decor either on hotel premises or very close by. Does not refer to the hotel gift shop or convenience store.
    boolean boutiqueStores?;
    # Boutique stores exception.
    string boutiqueStoresException?;
    # Casino. A space designated for gambling and gaming featuring croupier-run table and card games, as well as electronic slot machines. May be on hotel premises or located nearby.
    boolean casino?;
    # Casino exception.
    string casinoException?;
    # Free bicycle rental. The hotel owns bicycles that it permits guests to borrow and use for free.
    boolean freeBicycleRental?;
    # Free bicycle rental exception.
    string freeBicycleRentalException?;
    # Free watercraft rental. The hotel owns watercraft that it permits guests to borrow and use for free.
    boolean freeWatercraftRental?;
    # Free Watercraft rental exception.
    string freeWatercraftRentalException?;
    # Game room. There is a room at the hotel containing electronic machines for play such as pinball, prize machines, driving simulators, and other items commonly found at a family fun center or arcade. May also include non-electronic games like pool, foosball, darts, and more. May or may not be designed for children. Also known as arcade, fun room, or family fun center.
    boolean gameRoom?;
    # Game room exception.
    string gameRoomException?;
    # Golf. There is a golf course on hotel grounds or there is a nearby, independently run golf course that allows use by hotel guests. Can be free or for a fee.
    boolean golf?;
    # Golf exception.
    string golfException?;
    # Horseback riding. The hotel has a horse barn onsite or an affiliation with a nearby barn to allow for guests to sit astride a horse and direct it to walk, trot, cantor, gallop and/or jump. Can be in a riding ring, on designated paths, or in the wilderness. May or may not involve instruction.
    boolean horsebackRiding?;
    # Horseback riding exception.
    string horsebackRidingException?;
    # Nightclub. There is a room at the hotel with a bar, a dance floor, and seating where designated staffers play dance music. There may also be a designated area for the performance of live music, singing and comedy acts.
    boolean nightclub?;
    # Nightclub exception.
    string nightclubException?;
    # Private beach. The beach which is in close proximity to the hotel is open only to guests.
    boolean privateBeach?;
    # Private beach exception.
    string privateBeachException?;
    # Scuba. The provision for guests to dive under naturally occurring water fitted with a self-contained underwater breathing apparatus (SCUBA) for the purpose of exploring underwater life. Apparatus consists of a tank providing oxygen to the diver through a mask. Requires certification of the diver and supervision. The hotel may have the activity at its own waterfront or have an affiliation with a nearby facility. Required equipment is most often supplied to guests. Can be free or for a fee. Not snorkeling. Not done in a swimming pool.
    boolean scuba?;
    # Scuba exception.
    string scubaException?;
    # Snorkeling. The provision for guests to participate in a recreational water activity in which swimmers wear a diving mask, a simple, shaped breathing tube and flippers/swim fins for the purpose of exploring below the surface of an ocean, gulf or lake. Does not usually require user certification or professional supervision. Equipment may or may not be available for rent or purchase. Not scuba diving.
    boolean snorkeling?;
    # Snorkeling exception.
    string snorkelingException?;
    # Tennis. The hotel has the requisite court(s) on site or has an affiliation with a nearby facility for the purpose of providing guests with the opportunity to play a two-sided court-based game in which players use a stringed racquet to hit a ball across a net to the side of the opposing player. The court can be indoors or outdoors. Instructors, racquets and balls may or may not be provided.
    boolean tennis?;
    # Tennis exception.
    string tennisException?;
    # Water skiing. The provision of giving guests the opportunity to be pulled across naturally occurring water while standing on skis and holding a tow rope attached to a motorboat. Can occur on hotel premises or at a nearby waterfront. Most often performed in a lake or ocean.
    boolean waterSkiing?;
    # Water skiing exception.
    string waterSkiingException?;
    # Watercraft rental. The hotel owns water vessels that it permits guests to borrow and use. Can be free or for a fee. Watercraft may include boats, pedal boats, rowboats, sailboats, powerboats, canoes, kayaks, or personal watercraft (such as a Jet Ski).
    boolean watercraftRental?;
    # Watercraft rental exception.
    string watercraftRentalException?;
};

# Represents a structured service offered by the merchant. For eg: toilet_installation.
public type StructuredServiceItem record {
    # Optional. Description of structured service item. The character limit is 300.
    string description?;
    # Required. The `service_type_id` field is a Google provided unique ID that can be found in `ServiceTypeMetadata`. This information is provided by BatchGetBusinessCategories rpc service.
    string serviceTypeId?;
};

# Represents a time of day. The date and time zone are either not significant or are specified elsewhere. An API may choose to allow leap seconds. Related types are google.type.Date and `google.protobuf.Timestamp`.
public type TimeOfDay record {
    # Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time.
    int hours?;
    # Minutes of hour of day. Must be from 0 to 59.
    int minutes?;
    # Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999.
    int nanos?;
    # Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds.
    int seconds?;
};

# This message denotes calories information with an upper bound and lower bound range. Lower amount must be specified. Both lower and upper amounts are non-negative numbers.
public type CaloriesFact record {
    # Required. Lower amount of calories
    int lowerAmount?;
    # Required. Unit of the given calories information.
    string unit?;
    # Optional. Upper amount of calories
    int upperAmount?;
};

# Response message for Locations.ListLocations.
public type ListLocationsResponse record {
    # The locations.
    Location[] locations?;
    # If the number of locations exceeded the requested page size, this field is populated with a token to fetch the next page of locations on a subsequent call to `ListLocations`. If there are no more locations, this field is not present in the response.
    string nextPageToken?;
    # The approximate number of Locations in the list irrespective of pagination.
    int totalSize?;
};

# Minimized contact measures implemented by the hotel during COVID-19.
public type MinimizedContact record {
    # No-contact check-in and check-out.
    boolean contactlessCheckinCheckout?;
    # Contactless check-in check-out exception.
    string contactlessCheckinCheckoutException?;
    # Keyless mobile entry to guest rooms.
    boolean digitalGuestRoomKeys?;
    # Digital guest room keys exception.
    string digitalGuestRoomKeysException?;
    # Housekeeping scheduled by request only.
    boolean housekeepingScheduledRequestOnly?;
    # Housekeeping scheduled request only exception.
    string housekeepingScheduledRequestOnlyException?;
    # High-touch items, such as magazines, removed from common areas.
    boolean noHighTouchItemsCommonAreas?;
    # No high touch items common areas exception.
    string noHighTouchItemsCommonAreasException?;
    # High-touch items, such as decorative pillows, removed from guest rooms.
    boolean noHighTouchItemsGuestRooms?;
    # No high touch items guest rooms exception.
    string noHighTouchItemsGuestRoomsException?;
    # Plastic key cards are disinfected or discarded.
    boolean plasticKeycardsDisinfected?;
    # Plastic keycards disinfected exception.
    string plasticKeycardsDisinfectedException?;
    # Buffer maintained between room bookings.
    boolean roomBookingsBuffer?;
    # Room bookings buffer exception.
    string roomBookingsBufferException?;
};

# An interval of time, inclusive. It must contain all fields to be valid.
public type TimeInterval record {
    # Represents a whole or partial calendar date, such as a birthday. The time of day and time zone are either specified elsewhere or are insignificant. The date is relative to the Gregorian Calendar. This can represent one of the following: * A full date, with non-zero year, month, and day values * A month and day value, with a zero year, such as an anniversary * A year on its own, with zero month and day values * A year and month value, with a zero day, such as a credit card expiration date Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
    Date endDate?;
    # Represents a time of day. The date and time zone are either not significant or are specified elsewhere. An API may choose to allow leap seconds. Related types are google.type.Date and `google.protobuf.Timestamp`.
    TimeOfDay endTime?;
    # Represents a whole or partial calendar date, such as a birthday. The time of day and time zone are either specified elsewhere or are insignificant. The date is relative to the Gregorian Calendar. This can represent one of the following: * A full date, with non-zero year, month, and day values * A month and day value, with a zero year, such as an anniversary * A year on its own, with zero month and day values * A year and month value, with a zero day, such as a credit card expiration date Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
    Date startDate?;
    # Represents a time of day. The date and time zone are either not significant or are specified elsewhere. An API may choose to allow leap seconds. Related types are google.type.Date and `google.protobuf.Timestamp`.
    TimeOfDay startTime?;
};

# Represents the time periods that this location is open for business. Holds a collection of TimePeriod instances.
public type BusinessHours record {
    # A collection of times that this location is open for business. Each period represents a range of hours when the location is open during the week.
    TimePeriod[] periods?;
};

# Label to be used when displaying the menu and its various sub-components.
public type MenuLabel record {
    # Optional. Supplementary information of the component.
    string description?;
    # Required. Display name of the component.
    string displayName?;
    # Optional. The BCP 47 code of language. If the language is not available, it will default to English.
    string languageCode?;
};

# Represents the location owner/manager's reply to a review.
public type ReviewReply record {
    # The body of the reply as plain text with markups. The maximum length is 4096 bytes.
    string comment?;
    # Output only. The timestamp for when the reply was last modified.
    string updateTime?;
};

# Metadata for the Lodging.
public type LodgingMetadata record {
    # Required. The latest time at which the Lodging data is asserted to be true in the real world. This is not necessarily the time at which the request is made.
    string updateTime?;
};

# Services and amenities for families and young guests.
public type Families record {
    # Babysitting. Child care that is offered by hotel staffers or coordinated by hotel staffers with local child care professionals. Can be free or for a fee.
    boolean babysitting?;
    # Babysitting exception.
    string babysittingException?;
    # Kids activities. Recreational options such as sports, films, crafts and games designed for the enjoyment of children and offered at the hotel. May or may not be supervised. May or may not be at a designated time or place. Cab be free or for a fee.
    boolean kidsActivities?;
    # Kids activities exception.
    string kidsActivitiesException?;
    # Kids club. An organized program of group activities held at the hotel and designed for the enjoyment of children. Facilitated by hotel staff (or staff procured by the hotel) in an area(s) designated for the purpose of entertaining children without their parents. May include games, outings, water sports, team sports, arts and crafts, and films. Usually has set hours. Can be free or for a fee. Also known as Kids Camp or Kids program.
    boolean kidsClub?;
    # Kids club exception.
    string kidsClubException?;
};

# How the media item is associated with its location.
public type LocationAssociation record {
    # The category that this location photo belongs to.
    string category?;
    # The ID of a price list item that this location photo is associated with.
    string priceListItemId?;
};

# An administrator of an Account or a Location.
public type Admin record {
    # The name of the admin. When making the initial invitation, this is the invitee's email address. On `GET` calls, the user's email address is returned if the invitation is still pending. Otherwise, it contains the user's first and last names.
    string adminName?;
    # The resource name. For account admins, this is in the form: `accounts/{account_id}/admins/{admin_id}` For location admins, this is in the form: `accounts/{account_id}/locations/{location_id}/admins/{admin_id}`
    string name?;
    # Output only. Indicates whether this admin has a pending invitation for the specified resource.
    boolean pendingInvitation?;
    # Specifies the AdminRole that this admin uses with the specified Account or Location resource.
    string role?;
};

# Response message for `Insights.ReportLocationInsights`.
public type ReportLocationInsightsResponse record {
    # A collection of values for driving direction-related metrics.
    LocationDrivingDirectionMetrics[] locationDrivingDirectionMetrics?;
    # A collection of metric values by location.
    LocationMetrics[] locationMetrics?;
};

# Represents a whole or partial calendar date, such as a birthday. The time of day and time zone are either specified elsewhere or are insignificant. The date is relative to the Gregorian Calendar. This can represent one of the following: * A full date, with non-zero year, month, and day values * A month and day value, with a zero year, such as an anniversary * A year on its own, with zero month and day values * A year and month value, with a zero day, such as a credit card expiration date Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
public type Date record {
    # Day of a month. Must be from 1 to 31 and valid for the year and month, or 0 to specify a year by itself or a year and month where the day isn't significant.
    int day?;
    # Month of a year. Must be from 1 to 12, or 0 to specify a year without a month and day.
    int month?;
    # Year of the date. Must be from 1 to 9999, or 0 to specify a date without a year.
    int year?;
};

# Represents a single time period when a location's operational hours differ from its normal business hours. A special hour period must represent a range of less than 24 hours. The `open_time` and `start_date` must predate the `close_time` and `end_date`. The `close_time` and `end_date` can extend to 11:59 a.m. on the day after the specified `start_date`. For example, the following inputs are valid: start_date=2015-11-23, open_time=08:00, close_time=18:00 start_date=2015-11-23, end_date=2015-11-23, open_time=08:00, close_time=18:00 start_date=2015-11-23, end_date=2015-11-24, open_time=13:00, close_time=11:59 The following inputs are not valid: start_date=2015-11-23, open_time=13:00, close_time=11:59 start_date=2015-11-23, end_date=2015-11-24, open_time=13:00, close_time=12:00 start_date=2015-11-23, end_date=2015-11-25, open_time=08:00, close_time=18:00
public type SpecialHourPeriod record {
    # The wall time on `end_date` when a location closes, expressed in 24hr ISO 8601 extended format. (hh:mm) Valid values are 00:00-24:00, where 24:00 represents midnight at the end of the specified day field. Must be specified if `is_closed` is false.
    string closeTime?;
    # Represents a whole or partial calendar date, such as a birthday. The time of day and time zone are either specified elsewhere or are insignificant. The date is relative to the Gregorian Calendar. This can represent one of the following: * A full date, with non-zero year, month, and day values * A month and day value, with a zero year, such as an anniversary * A year on its own, with zero month and day values * A year and month value, with a zero day, such as a credit card expiration date Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
    Date endDate?;
    # If true, `end_date`, `open_time`, and `close_time` are ignored, and the date specified in `start_date` is treated as the location being closed for the entire day.
    boolean isClosed?;
    # The wall time on `start_date` when a location opens, expressed in 24hr ISO 8601 extended format. (hh:mm) Valid values are 00:00-24:00, where 24:00 represents midnight at the end of the specified day field. Must be specified if `is_closed` is false.
    string openTime?;
    # Represents a whole or partial calendar date, such as a birthday. The time of day and time zone are either specified elsewhere or are insignificant. The date is relative to the Gregorian Calendar. This can represent one of the following: * A full date, with non-zero year, month, and day values * A month and day value, with a zero year, such as an anniversary * A year on its own, with zero month and day values * A year and month value, with a zero day, such as a credit card expiration date Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
    Date startDate?;
};

# Represents an answer to a question
public type Answer record {
    # Represents the author of a question or answer
    Author author?;
    # Output only. The timestamp for when the answer was written.
    string createTime?;
    # Output only. The unique name for the answer accounts/*/locations/*/questions/*/answers/*
    string name?;
    # The text of the answer. It should contain at least one non-whitespace character. The maximum length is 4096 characters.
    string text?;
    # Output only. The timestamp for when the answer was last modified.
    string updateTime?;
    # Output only. The number of upvotes for the answer.
    int upvoteCount?;
};

public type ListBusinessCategoriesResponse record {
    # The categories. Categories are BASIC view. They don't contain any ServiceType information.
    Category[] categories?;
    # If the number of categories exceeded the requested page size, this field will be populated with a token to fetch the next page of categories on a subsequent call to `ListBusinessCategories`.
    string nextPageToken?;
    # The total number of categories for the request parameters.
    int totalCategoryCount?;
};

# A single media item.
public type MediaItem record {
    # Attribution information for customer media items, such as the contributor's name and profile picture.
    Attribution attribution?;
    # Output only. Creation time of this media item.
    string createTime?;
    # Reference to the photo binary data of a `MediaItem` uploaded through the My Business API. Create a data ref using StartUploadMediaItemData, and use this ref when uploading bytes to [UpdateMedia] and subsequently calling CreateMediaItem.
    MediaItemDataRef dataRef?;
    # Description for this media item. Descriptions cannot be modified through the My Business API, but can be set when creating a new media item that is not a cover photo.
    string description?;
    # Dimensions of the media item.
    Dimensions dimensions?;
    # Output only. Google-hosted URL for this media item. This URL is not static since it may change over time. For video this will be a preview image with an overlaid play icon.
    string googleUrl?;
    # Insights and statistics for the media item.
    MediaInsights insights?;
    # How the media item is associated with its location.
    LocationAssociation locationAssociation?;
    # The format of this media item. Must be set when the media item is created, and is read-only on all other requests. Cannot be updated.
    string mediaFormat?;
    # The resource name for this media item. `accounts/{account_id}/locations/{location_id}/media/{media_key}`
    string name?;
    # A publicly accessible URL where the media item can be retrieved from. When creating one of this or data_ref must be set to specify the source of the media item. If `source_url` was used when creating a media item, it will be populated with that source URL when the media item is retrieved. This field cannot be updated.
    string sourceUrl?;
    # Output only. Where provided, the URL of a thumbnail image for this media item.
    string thumbnailUrl?;
};

# Additional information that is surfaced in AdWords.
public type AdWordsLocationExtensions record {
    # An alternate phone number to display on AdWords location extensions instead of the location's primary phone number.
    string adPhone?;
};

# Metadata for supported attribute values.
public type AttributeValueMetadata record {
    # The display name for this value, localized where available; otherwise, in English. The value display name is intended to be used in context with the attribute display name. For example, for a "WiFi" enum attribute, this could contain "Paid" to represent paid Wi-Fi.
    string displayName?;
    # The attribute value.
    anydata value?;
};

# Display Data for verifications through phone, e.g. phone call, sms.
public type PhoneVerificationData record {
    # Phone number that the PIN will be sent to.
    string phoneNumber?;
};

# Url to be used when displaying the chain.
public type ChainUrl record {
    # The url for this chain.
    string url?;
};

# Information about the location that this location duplicates.
public type Duplicate record {
    # Indicates whether the user has access to the location it duplicates.
    string access?;
    # The resource name of the location that this duplicates. Only populated if the authenticated user has access rights to that location and that location is not deleted.
    string locationName?;
    # The place ID of the location that this duplicates.
    string placeId?;
};

# Information related to the opening state of the business.
public type OpenInfo record {
    # Output only. Indicates whether this business is eligible for re-open.
    boolean canReopen?;
    # Represents a whole or partial calendar date, such as a birthday. The time of day and time zone are either specified elsewhere or are insignificant. The date is relative to the Gregorian Calendar. This can represent one of the following: * A full date, with non-zero year, month, and day values * A month and day value, with a zero year, such as an anniversary * A year on its own, with zero month and day values * A year and month value, with a zero day, such as a credit card expiration date Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
    Date openingDate?;
    # Indicates whether or not the Location is currently open for business. All locations are open by default, unless updated to be closed.
    string status?;
};

# Increased food safety measures implemented by the hotel during COVID-19.
public type IncreasedFoodSafety record {
    # Additional sanitation in dining areas.
    boolean diningAreasAdditionalSanitation?;
    # Dining areas additional sanitation exception.
    string diningAreasAdditionalSanitationException?;
    # Disposable flatware.
    boolean disposableFlatware?;
    # Disposable flatware exception.
    string disposableFlatwareException?;
    # Additional safety measures during food prep and serving.
    boolean foodPreparationAndServingAdditionalSafety?;
    # Food preparation and serving additional safety exception.
    string foodPreparationAndServingAdditionalSafetyException?;
    # Individually-packaged meals.
    boolean individualPackagedMeals?;
    # Individual packaged meals exception.
    string individualPackagedMealsException?;
    # Single-use menus.
    boolean singleUseFoodMenus?;
    # Single use food menus exception.
    string singleUseFoodMenusException?;
};

# Response message for Verifications.CompleteVerificationAction.
public type CompleteVerificationResponse record {
    # A verification represents a verification attempt on a location.
    Verification verification?;
};

# Features and available amenities in the guest unit.
public type GuestUnitFeatures record {
    # Bungalow or villa. An independent structure that is part of a hotel or resort that is rented to one party for a vacation stay. The hotel or resort may be completely comprised of bungalows or villas, or they may be one of several guestroom options. Guests in the bungalows or villas most often have the same, if not more, amenities and services offered to guests in other guestroom types.
    boolean bungalowOrVilla?;
    # Bungalow or villa exception.
    string bungalowOrVillaException?;
    # Connecting unit available. A guestroom type that features access to an adjacent guestroom for the purpose of booking both rooms. Most often used by families who need more than one room to accommodate the number of people in their group.
    boolean connectingUnitAvailable?;
    # Connecting unit available exception.
    string connectingUnitAvailableException?;
    # Executive floor. A floor of the hotel where the guestrooms are only bookable by members of the hotel's frequent guest membership program. Benefits of this room class include access to a designated lounge which may or may not feature free breakfast, cocktails or other perks specific to members of the program.
    boolean executiveFloor?;
    # Executive floor exception.
    string executiveFloorException?;
    # Max adult occupants count. The total number of adult guests allowed to stay overnight in the guestroom.
    int maxAdultOccupantsCount?;
    # Max adult occupants count exception.
    string maxAdultOccupantsCountException?;
    # Max child occupants count. The total number of children allowed to stay overnight in the room.
    int maxChildOccupantsCount?;
    # Max child occupants count exception.
    string maxChildOccupantsCountException?;
    # Max occupants count. The total number of guests allowed to stay overnight in the guestroom.
    int maxOccupantsCount?;
    # Max occupants count exception.
    string maxOccupantsCountException?;
    # Private home. A privately owned home (house, townhouse, apartment, cabin, bungalow etc) that may or not serve as the owner's residence, but is rented out in its entirety or by the room(s) to paying guest(s) for vacation stays. Not for lease-based, long-term residency.
    boolean privateHome?;
    # Private home exception.
    string privateHomeException?;
    # Suite. A guestroom category that implies both a bedroom area and a separate living area. There may or may not be full walls and doors separating the two areas, but regardless, they are very distinct. Does not mean a couch or chair in a bedroom.
    boolean suite?;
    # Suite exception.
    string suiteException?;
    # Tier. Classification of the unit based on available features/amenities. A non-standard tier is only permitted if at least one other unit type falls under the standard tier.
    string tier?;
    # Tier exception.
    string tierException?;
    # An individual room, such as kitchen, bathroom, bedroom, within a bookable guest unit.
    LivingArea totalLivingAreas?;
    # Views available from the guest unit itself.
    ViewsFromUnit views?;
};

# Input for PHONE_CALL/SMS verification.
public type PhoneInput record {
    # The phone number that should be called or be sent SMS to. It must be one of the phone numbers in the eligible options.
    string phoneNumber?;
};

# Request message for AccessControl.AcceptInvitation.
public type AcceptInvitationRequest record {
};

# A location. See the [help center article] (https://support.google.com/business/answer/3038177) for a detailed description of these fields, or the [category endpoint](/my-business/reference/rest/v4/categories) for a list of valid business categories.
public type Location record {
    # Additional information that is surfaced in AdWords.
    AdWordsLocationExtensions adWordsLocationExtensions?;
    # Additional categories to describe your business. Categories help your customers find accurate, specific results for services they're interested in. To keep your business information accurate and live, make sure that you use as few categories as possible to describe your overall core business. Choose categories that are as specific as possible, but representative of your main business.
    Category[] additionalCategories?;
    # Up to two phone numbers (mobile or landline, no fax) at which your business can be called, in addition to your primary phone number.
    string[] additionalPhones?;
    # Represents a postal address, e.g. for postal delivery or payments addresses. Given a postal address, a postal service can deliver items to a premise, P.O. Box or similar. It is not intended to model geographical locations (roads, towns, mountains). In typical usage an address would be created via user input or from importing existing data, depending on the type of process. Advice on address input / editing: - Use an i18n-ready address widget such as https://github.com/google/libaddressinput) - Users should not be presented with UI elements for input or editing of fields outside countries where that field is used. For more guidance on how to use this schema, please see: https://support.google.com/business/answer/6397478
    PostalAddress address?;
    # Attributes for this location.
    Attribute[] attributes?;
    # A collection of free-form strings to allow you to tag your business. These labels are NOT user facing; only you can see them. Limited to 255 characters (per label).
    string[] labels?;
    # The language of the location. Set during creation and not updateable.
    string languageCode?;
    # An object that represents a latitude/longitude pair. This is expressed as a pair of doubles to represent degrees latitude and degrees longitude. Unless specified otherwise, this must conform to the WGS84 standard. Values must be within normalized ranges.
    LatLng latlng?;
    # Alternate/surrogate key references for a location.
    LocationKey locationKey?;
    # Location name should reflect your business's real-world name, as used consistently on your storefront, website, and stationery, and as known to customers. Any additional information, when relevant, can be included in other fields of the resource (for example, `Address`, `Categories`). Don't add unnecessary information to your name (for example, prefer "Google" over "Google Inc. - Mountain View Corporate Headquarters"). Don't include marketing taglines, store codes, special characters, hours or closed/open status, phone numbers, website URLs, service/product information, location/address or directions, or containment information (for example, "Chase ATM in Duane Reade").
    string locationName?;
    # Contains a set of booleans that reflect the [state of a Location.](https://support.google.com/business/answer/3480862)
    LocationState locationState?;
    # Additional non-user-editable information about the location.
    Metadata metadata?;
    # More hours for a business's different departments or specific customers.
    MoreHours[] moreHours?;
    # Google identifier for this location in the form: `accounts/{account_id}/locations/{location_id}` In the context of matches, this field will not be populated.
    string name?;
    # Information related to the opening state of the business.
    OpenInfo openInfo?;
    # Price list information for this location.
    PriceList[] priceLists?;
    # A category describing what this business is (not what it does). For a list of valid category IDs, and the mappings to their human-readable names, see [categories.list](https://developers.google.com/my-business/reference/rest/v4/categories/list).
    Category primaryCategory?;
    # A phone number that connects to your individual business location as directly as possible. Use a local phone number instead of a central, call center helpline number whenever possible.
    string primaryPhone?;
    # All information pertaining to the location's profile.
    Profile profile?;
    # Represents the time periods that this location is open for business. Holds a collection of TimePeriod instances.
    BusinessHours regularHours?;
    # Information of all parent and children locations related to this one.
    RelationshipData relationshipData?;
    # Service area businesses provide their service at the customer's location (for example, a locksmith or plumber).
    ServiceAreaBusiness serviceArea?;
    # Represents a set of time periods when a location's operational hours differ from its normal business hours.
    SpecialHours specialHours?;
    # External identifier for this location, which must be unique inside a given account. This is a means of associating the location with your own records.
    string storeCode?;
    # A URL for this business. If possible, use a URL that represents this individual business location instead of a generic website/URL that represents all locations, or the brand.
    string websiteUrl?;
};
