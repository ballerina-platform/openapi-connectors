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

# Relative values used to calculate ticket sales_end. Can only be used for series parent tickets.
public type SalesEndRelative record {
    # Relative to event
    string relative_to_event;
    # The amount of time in seconds that the ticket sales are offset before the event start or end. Nonnegative number.
    decimal offset;
};

# The organizer ticket revenue.
public type BasePrice record {
    # The ISO 4217 3-character code of a currency
    string currency;
    # The integer value of units of the minor unit of the currency (e.g. cents for US dollars)
    decimal value;
    # You can get a value in the currency's major unit - for example, dollars or pound sterling - by taking the integer value provided and shifting the decimal point left by the exponent value for that currency as defined in ISO 4217
    string major_value;
    # Provided for your convenience; its formatting may change depending on the locale you query the API with (for example, commas for decimal separators in European locales).
    string display;
};

# The Discount object represents a discount that an Order owner can use when purchasing tickets to an Event.
public type CreatedDiscount record {
    # Type
    string 'type?;
    # Code used to activate the discount
    string code?;
    # Fixed reduction amount. When creating access codes the default value is Null.
    string amount_off?;
    # Percentage reduction. When creating access codes the default value is Null.
    string percent_off?;
    # ID of the event. Only used for single event discounts
    string event_id?;
    # IDs of the ticket classes to limit discount to
    string[] ticket_class_ids?;
    # Number of times the discount can be used
    decimal quantity_available?;
    # Allow use from this date. A datetime represented as a string in Naive Local ISO8601 date and time format, in the timezone of the event.
    string start_date?;
    # Allow use from this number of seconds before the event starts. Greater than 59 and multiple of 60.
    decimal start_date_relative?;
    # Allow use until this date. A datetime represented as a string in Naive Local ISO8601 date and time format, in the timezone of the event.
    string end_date?;
    # Allow use until this number of seconds before the event starts. Greater than 59 and multiple of 60.
    decimal end_date_relative?;
    # ID of the ticket group
    string ticket_group_id?;
    # List of hold IDs this discount can unlock. Null if this discount does not unlock a hold.
    string[] hold_ids?;
    # Discount ID
    string id?;
    # Number of discounts used during ticket sales
    decimal quantity_sold?;
};

# User email object
public type Email record {
    # Email address
    string email?;
    # Has this email address been verified to belong to the user?
    boolean verified?;
};

# The address of the venue
public type Address record {
    # The street/location address (part 1)
    string address_1?;
    # The street/location address (part 2)
    string address_2?;
    # City
    string city?;
    # ISO 3166-2 2- or 3-character region code for the state, province, region, or district
    string region?;
    # Postal code
    string postal_code?;
    # ISO 3166-1 2-character international code for the country
    string country?;
    # Latitude portion of the address coordinates
    string latitude?;
    # Longitude portion of the address coordinates
    string longitude?;
};

# Start date/time of the event.
public type Start record {
    # The timezone
    string timezone;
    # The time relative to UTC
    string utc;
};

# An object with a property venues which is an array of Venue objects.
public type Venues record {
    # Pagination
    Pagination pagination?;
    # An array of venue objects.
    Venue[] venues?;
};

# The Event object represents an Eventbrite Event. An Event is owned by one Organization.
public type EventRequest record {
    # Event name. Value cannot be empty nor whitespace.
    Name name;
    # Event summary. This is a plaintext field and will have any supplied HTML removed from it. Maximum of 140 characters, mutually exclusive with description.
    string summary?;
    # Event description (contents of the event page). May be long and have significant formatting. Please refer to the event description tutorial to learn about the new way to create an event description.
    Description description?;
    # Start date/time of the event.
    Start 'start;
    # End date/time of the event.
    End end;
    # If true, the event's start date should never be displayed to attendees.
    boolean hide_start_date?;
    # If true, the event's end date should never be displayed to attendees.
    boolean hide_end_date?;
    # The ISO 4217 currency code for this event
    string currency;
    # true = Specifies that the Event is online only (i.e. the Event does not have a Venue).
    boolean online_event?;
    # ID of the event organizer
    string organizer_id?;
    # Image ID of the event logo
    string logo_id?;
    # Event venue ID
    string venue_id?;
    # Event format
    string format_id?;
    # Event category
    string category_id?;
    # Event subcategory
    string subcategory_id?;
    # Is this event publicly searchable on Eventbrite?. Default value is true.
    boolean listed?;
    # Can this event show social sharing buttons?
    boolean shareable?;
    # Can only people with invites see the event page?
    boolean invite_only?;
    # If the remaining number of tickets is publicly visible on the event page
    boolean show_remaining?;
    # Password needed to see the event in unlisted mode
    string password?;
    # Set specific capacity (if omitted, sums ticket capacities)
    decimal capacity?;
    # If the event is reserved seating
    boolean is_reserved_seating?;
    # If the event is part of a series. Specifying this attribute as True during event creation will always designate the event as a series parent, never as a series occurrence. Series occurrences must be created through the schedules API and cannot be created using the events API.
    boolean is_series?;
    # For reserved seating event, if attendees can pick their seats.
    boolean show_pick_a_seat?;
    # For reserved seating event, if venue map thumbnail visible on the event page.
    boolean show_seatmap_thumbnail?;
    # For reserved seating event, if venue map thumbnail should have colors on the event page.
    boolean show_colors_in_seatmap_thumbnail?;
    # Source of the event (defaults to API)
    string 'source?;
    # Indicates event language on Event's listing page. (Default is en_US)
    string locale?;
};

# An object with a property attendees which is an array of Attendee objects.
public type Attendees record {
    # Pagination
    Pagination pagination?;
    # An array of Attendee objects.
    Attendee[] venues?;
};

# The ticket's base or discounted tax amount
public type Tax record {
    # The ISO 4217 3-character code of a currency
    string currency;
    # The integer value of units of the minor unit of the currency (e.g. cents for US dollars)
    decimal value;
    # You can get a value in the currency's major unit - for example, dollars or pound sterling - by taking the integer value provided and shifting the decimal point left by the exponent value for that currency as defined in ISO 4217
    string major_value;
    # Provided for your convenience; its formatting may change depending on the locale you query the API with (for example, commas for decimal separators in European locales).
    string display;
};

# An object with a property discounts which is an array of Discount objects.
public type Discounts record {
    # An array of discount objects.
    Discount[] discounts?;
};

# Creator object
public type Creator record {
    # Team's creator ID
    string id?;
    # Team's creator name (or email if name is null)
    string name?;
    # Team creator email's information
    CreatorEmail[] emails?;
};

# An object with a property orders which is an array of Order objects.
public type OrdersByOrganization record {
    # Pagination
    Pagination pagination?;
    # An array of order objects.
    Order[] orders?;
};

# Event name. Value cannot be empty nor whitespace.
public type Name record {
    # Event name in html format. <p>Some text</p>.
    string html?;
};

# The fee for this ticket class
public type ActualFee record {
    # The ISO 4217 3-character code of a currency
    string currency;
    # The integer value of units of the minor unit of the currency (e.g. cents for US dollars)
    decimal value;
    # You can get a value in the currency's major unit - for example, dollars or pound sterling - by taking the integer value provided and shifting the decimal point left by the exponent value for that currency as defined in ISO 4217
    string major_value;
    # Provided for your convenience; its formatting may change depending on the locale you query the API with (for example, commas for decimal separators in European locales).
    string display;
};

# The crop mask applied to the original image
public type CropMask record {
    # Coordinate for top-left corner of crop mask
    TopLeft top_left?;
    # Crop mask width
    decimal width?;
    # Crop mask height
    decimal height?;
};

# Pagination
public type Pagination record {
    # The total number of objects across all pages (optional)
    decimal object_count?;
    # The current page number (starts at 1)
    decimal page_number?;
    # The number of objects on each page (roughly)
    decimal page_size?;
    # The total number of pages (starting at 1) (optional)
    decimal page_count?;
    # A token to return to the server to get the next set of results (see “Continuated Responses” below)
    string continuation?;
    # Has more items
    boolean has_more_items?;
};

# List of price costs components that belong to the shipping display group.
public type ShippingComponent record {
    # Indicates whether this is a price component that affects the final item price (if False), or just intermediate metadata (if True).
    boolean intermediate?;
    # Name of the fee.
    string name?;
    # Name of the fee within the group (organizer facing).
    string internal_name?;
    # Display name of the fee group (attendee facing).
    string group_name?;
    # The amount of the component represented in minor units. E.g. 725 means 7.25.
    decimal value?;
    # The total discount to be displayed to a specific cost component and the reason of the discount.
    DiscountObject discount?;
    # Rate rule that applies to this cost component, if any.
    Rule rule?;
    # Name of the base used to calculate the fee.
    string base?;
    # The display group the cost component belongs in.
    string bucket?;
    # Who keeps the amount of the cost component.
    string recipient?;
    # Who is paying the fee, used to determine if the fee is being passed on or absorbed into the item price.
    string payer?;
};

# An object with a single property venue which must be a Venue object.
public type CreateVenueRequest record {
    # The Venue object represents the location of an Event (i.e. where an Event takes place). Venues are grouped together by the Organization object.
    VenueRequest event?;
};

# Coordinate for top-left corner of crop mask
public type TopLeft record {
    # Y coordinate for top-left corner of crop mask
    decimal y?;
    # X coordinate for top-left corner of crop mask
    decimal x?;
};

# A dictionary with some data of the available ticket with the minimums
public type MinimumTicketPrice record {
    # The ISO 4217 3-character code of a currency
    string currency;
    # The integer value of units of the minor unit of the currency (e.g. cents for US dollars)
    string value;
    # You can get a value in the currency's major unit - for example, dollars or pound sterling - by taking the integer value provided and shifting the decimal point left by the exponent value for that currency as defined in ISO 4217
    string major_value;
    # Provided for your convenience; its formatting may change depending on the locale you query the API with (for example, commas for decimal separators in European locales).
    string display;
};

# The earliest start time when a visible ticket is or will be available
public type StartSalesDate record {
    # The timezone
    string timezone;
    # The time relative to UTC
    string utc;
    # The time in the timezone of the event
    string local;
};

# The Order object represents an order made against Eventbrite for one or more Ticket Classes. In other words, a single Order can be made up of multiple tickets. The object contains an Order's financial and transactional information; use the Attendee object to return information on Attendees.
public type Order record {
    # The Id of the order
    string id;
    # When the attendee was created (order placed)
    string created?;
    # When the attendee was last changed
    string changed?;
    # The ticket buyer’s name. Use this in preference to first_name/last_name if possible for forward compatibility with non-Western names.
    string name?;
    # The ticket buyer’s first name
    string first_name?;
    # The ticket buyer’s last name
    string last_name?;
    # The ticket buyer’s email address
    string email?;
    # Cost breakdown for this order
    Costs costs?;
    # The event id this order is against
    string event_id?;
    # The Event object represents an Eventbrite Event. An Event is owned by one Organization.
    EventObject event?;
    # The list of attendees that belong to this order (requires the attendees expansion)
    Attendee[] attendees?;
    # The time remaining to complete this order (in seconds)
    decimal time_remaining?;
    # Is an absolute URL to the API endpoint that will return you the canonical representation of the order.
    string resource_uri?;
    # The status of the order
    string status?;
    # Ticket settings relevant to the purchaser after the order has been processed. Included only when called with the expansion ticket_buyer_settings. Order must be in PLACED or UNPAID state for the ticket_buyer_settings to return any information, otherwise will be an empty object.
    TicketBuyerSettings ticket_buyer_settings?;
    # Marketing communication preferences for the email address associated with this Order.
    ContactListPreferences contact_list_preferences?;
};

# Fees taken by Eventbrite as a service fee.
public type EventbriteFee record {
    # The ISO 4217 3-character code of a currency
    string currency;
    # The integer value of units of the minor unit of the currency (e.g. cents for US dollars)
    decimal value;
    # You can get a value in the currency's major unit - for example, dollars or pound sterling - by taking the integer value provided and shifting the decimal point left by the exponent value for that currency as defined in ISO 4217
    string major_value;
    # Provided for your convenience; its formatting may change depending on the locale you query the API with (for example, commas for decimal separators in European locales).
    string display;
};

# An object with a single property event which must be an Event object.
public type CreateEventRequest record {
    # The Event object represents an Eventbrite Event. An Event is owned by one Organization.
    EventRequest event?;
};

# An object with a property attendees which is an array of Attendee objects.
public type AttendeesByEvent record {
    # Pagination
    Pagination pagination?;
    # An array of attendee objects.
    Attendee[] attendees?;
};

# Long description of the Organizer.
public type OrganizerLongDescription record {
    # Description of the Organizer in text format
    string text;
    # Description of the Organizer in html format
    string html;
};

# Full venue details for venue_id (requires the venue expansion)
public type Venue record {
    # Venue name
    string name;
    # Age restriction of the venue
    string age_restriction?;
    # Venue capacity
    decimal capacity?;
    # The address of the venue
    Address address?;
    # Resource uri
    string resource_uri?;
    # Venue ID
    string id?;
    # Latitude portion of the address coordinates of the venue
    string latitude?;
    # Longitude portion of the address coordinates of the venue
    string longitude?;
};

# An object with a property categories which is an array of Category objects.
public type Categories record {
    # Locale
    string locale?;
    # Pagination
    Pagination pagination?;
    # An array of Category objects.
    Category[] opportunities?;
};

# List of confirmation messages per unique ticket class in the order.
public type TicketClassConfirmationSettings record {
    # ID of the ticket class the confirmation settings apply to.
    string ticket_class_id?;
    # ID of the event this ticket class belongs to.
    string event_id?;
    # Confirmation message for customers who have purchased one or more of this ticket class.
    TicketClassConfirmationSettingsConfirmationMessage confirmation_message?;
};

# Instructions for the ticket buyer.
public type Instructions record {
    # Instructions for the ticket buyer in text format
    string text;
    # Instructions for the ticket buyer in html format
    string html;
};

# The Venue object represents the location of an Event (i.e. where an Event takes place). Venues are grouped together by the Organization object.
public type CreatedVenue record {
    # The name of the venue
    string name;
    # The age restrictions for the venue
    string age_restriction?;
    # Set specific capacity (if omitted, sums ticket capacities)
    decimal capacity?;
    # The address of the venue
    Address address?;
    # Resource uri
    string resource_uri?;
    # Venue ID
    string id?;
    # Latitude portion of the address coordinates of the venue
    string latitude?;
    # Longitude portion of the address coordinates of the venue
    string longitude?;
};

# The Event object represents an Eventbrite Event. An Event is owned by one Organization.
public type EventObject record {
    # Event ID
    string id?;
    # Event name. Value cannot be empty nor whitespace.
    Name name?;
    # Event summary. This is a plaintext field and will have any supplied HTML removed from it. Maximum of 140 characters, mutually exclusive with description.
    string summary?;
    # Event description (contents of the event page). May be long and have significant formatting. Please refer to the event description tutorial to learn about the new way to create an event description.
    Description description?;
    # Start date/time of the event.
    Start 'start?;
    # End date/time of the event.
    End end?;
    # The URL to the event page for this event on Eventbrite
    string url?;
    # The vanity URL to the event page for this event on Eventbrite
    string vanity_url?;
    # When the event was created
    string created;
    # When the event was last changed
    string changed;
    # When the event was first published
    string published?;
    # Status of the event
    string status?;
    # The ISO 4217 currency code for this event
    string currency?;
    # true = Specifies that the Event is online only (i.e. the Event does not have a Venue).
    boolean online_event?;
    # Organization owning the event
    string organization_id?;
    # ID of the event organizer
    string organizer_id?;
    # Full details of the event organizer (requires the organizer expansion)
    Organizer organizer?;
    # Image ID of the event logo
    string logo_id?;
    # Full image details for organizer logo
    Logo logo?;
    # Event venue ID
    string venue_id?;
    # Full venue details for venue_id (requires the venue expansion)
    Venue venue?;
    # Event format
    string format_id?;
    # Full details of the event format (requires the format expansion)
    Format format?;
    # Event category
    string category_id?;
    # Full details of the event category (requires the category expansion)
    Category category?;
    # Event subcategory (Expansion is subcategory)
    string subcategory_id?;
    # Full details of the event subcategory (requires the subcategory expansion)
    Subcategory subcategory?;
    # This is an object of properties that detail dimensions of music events.
    MusicProperties music_properties?;
    # The bookmark information on the event, requires the bookmark_info expansion
    BookmarkInfo bookmark_info?;
    # Refund policy
    string refund_policy?;
    # Additional data about general tickets information (optional).
    TicketAvailability ticket_availability?;
    # Is this event publicly searchable on Eventbrite?. Default value is true.
    boolean listed?;
    # Can this event show social sharing buttons?
    boolean shareable?;
    # Can only people with invites see the event page?
    boolean invite_only?;
    # If the remaining number of tickets is publicly visible on the event page
    boolean show_remaining?;
    # Password needed to see the event in unlisted mode
    string password?;
    # Set specific capacity (if omitted, sums ticket capacities)
    decimal capacity?;
    # If True, the value of capacity is a custom-set value; if False, it's a calculated value of the total of all ticket capacities.
    boolean capacity_is_custom?;
    # Maximum duration (in seconds) of a transaction
    string tx_time_limit?;
    # If true, the event's start date should never be displayed to attendees.
    boolean hide_start_date?;
    # If true, the event's end date should never be displayed to attendees.
    boolean hide_end_date?;
    # Indicates event language on Event's listing page. (Default is en_US)
    string locale?;
    # Is locked
    boolean is_locked?;
    # Privacy setting
    string privacy_setting?;
    # true, if the Event is externally ticketed
    boolean is_externally_ticketed?;
    # External ticketing
    ExternalTicketing external_ticketing?;
    # If the event is part of a series. Specifying this attribute as True during event creation will always designate the event as a series parent, never as a series occurrence. Series occurrences must be created through the schedules API and cannot be created using the events API.
    boolean is_series?;
    # If the event is part of a series and is the series parent
    boolean is_series_parent?;
    # If the event is part of a series, this is the event id of the series parent. If the event is not part of a series, this field is omitted.
    string series_id?;
    # If the event is reserved seating
    boolean is_reserved_seating?;
    # For reserved seating event, if attendees can pick their seats.
    boolean show_pick_a_seat?;
    # For reserved seating event, if venue map thumbnail visible on the event page.
    boolean show_seatmap_thumbnail?;
    # For reserved seating event, if venue map thumbnail should have colors on the event page.
    boolean show_colors_in_seatmap_thumbnail?;
    # Allows to set a free event
    boolean is_free?;
    # Source of the event (defaults to API)
    string 'source?;
    # Version
    string 'version?;
    # Is an absolute URL to the API endpoint that will return you the canonical representation of the event.
    string resource_uri?;
    # Additional data about the sales status of the event (optional).
    EventSalesStatus event_sales_status?;
    # Additional data about the checkout settings of the Event.
    CheckoutSettings checkout_settings?;
};

# The total discount to be displayed.
public type DiscountAmount record {
    # The ISO 4217 3-character code of a currency
    string currency;
    # The integer value of units of the minor unit of the currency (e.g. cents for US dollars)
    decimal value;
    # You can get a value in the currency's major unit - for example, dollars or pound sterling - by taking the integer value provided and shifting the decimal point left by the exponent value for that currency as defined in ISO 4217
    string major_value;
    # Provided for your convenience; its formatting may change depending on the locale you query the API with (for example, commas for decimal separators in European locales).
    string display;
};

# The bookmark information on the event, requires the bookmark_info expansion
public type BookmarkInfo record {
    # User saved the event or not
    boolean bookmarked?;
};

# External ticketing
public type ExternalTicketing record {
    # The URL clients can follow to purchase tickets.
    string external_url;
    # The name of the ticketing provider.
    string ticketing_provider_name;
    # Whether this is a free event. Mutually exclusive with ticket price range.
    boolean is_free;
    # A dictionary with some data of the available ticket with the minimums
    MinimumTicketPrice minimum_ticket_price;
    # A dictionary with some data of the available ticket with the maximum
    MaximumTicketPrice maximum_ticket_price;
    # When sales start.
    string sales_start?;
    # When sales end.
    string sales_end?;
};

# The tax collected by the organizer.
public type CostsTax record {
    # The ISO 4217 3-character code of a currency
    string currency;
    # The integer value of units of the minor unit of the currency (e.g. cents for US dollars)
    decimal value;
    # You can get a value in the currency's major unit - for example, dollars or pound sterling - by taking the integer value provided and shifting the decimal point left by the exponent value for that currency as defined in ISO 4217
    string major_value;
    # Provided for your convenience; its formatting may change depending on the locale you query the API with (for example, commas for decimal separators in European locales).
    string display;
};

# Fees taken by Eventbrite as a payment processing fee.
public type PaymentFee record {
    # The ISO 4217 3-character code of a currency
    string currency;
    # The integer value of units of the minor unit of the currency (e.g. cents for US dollars)
    decimal value;
    # You can get a value in the currency's major unit - for example, dollars or pound sterling - by taking the integer value provided and shifting the decimal point left by the exponent value for that currency as defined in ISO 4217
    string major_value;
    # Provided for your convenience; its formatting may change depending on the locale you query the API with (for example, commas for decimal separators in European locales).
    string display;
};

# An object with a property events which is an array of Event objects.
public type EventsByVenue record {
    # Pagination
    Pagination pagination?;
    # An array of Event objects.
    Event[] events?;
};

# End date/time of the event.
public type End record {
    # The timezone
    string timezone;
    # The time relative to UTC
    string utc;
};

# An object with a property attendees which is an array of Attendee objects.
public type AttendeesByOrganization record {
    # Pagination
    Pagination pagination?;
    # An array of attendee objects.
    Attendee[] attendees?;
};

# The total amount the buyer was charged.
public type Gross record {
    # The ISO 4217 3-character code of a currency
    string currency;
    # The integer value of units of the minor unit of the currency (e.g. cents for US dollars)
    decimal value;
    # You can get a value in the currency's major unit - for example, dollars or pound sterling - by taking the integer value provided and shifting the decimal point left by the exponent value for that currency as defined in ISO 4217
    string major_value;
    # Provided for your convenience; its formatting may change depending on the locale you query the API with (for example, commas for decimal separators in European locales).
    string display;
};

# Rate rule that applies to this cost component, if any.
public type Rule record {
    # Fee Rule ID of a specific cost component.
    string id?;
};

# This is an object of properties that detail dimensions of music events.
public type MusicProperties record {
    # Minimum age requirement of event attendees.
    string age_restriction?;
    # Main music event sponsor.
    string presented_by?;
    # Time relative to UTC that the doors are opened to allow people in the day of the event. When not set the event won't have any door time set.
    string door_time?;
};

# Marketing communication preferences for the email address associated with this Order.
public type ContactListPreferences record {
    # order_contact_list_preferences
    string _type?;
    # Email address is in at least one contact list for Organization that owns this Event.
    boolean has_contact_list?;
    # Email address is opt-in to receive marketing communication from the Organization that owns this Event.
    boolean has_opted_in?;
};

# Cost breakdown for this order
public type Costs record {
    # The organizer ticket revenue.
    BasePrice base_price?;
    # The item price with discounts applied.
    DisplayPrice display_price?;
    # The total amount of fees and taxes to be displayed.
    DisplayFee display_fee?;
    # The total amount the buyer was charged.
    Gross gross?;
    # Fees taken by Eventbrite as a service fee.
    EventbriteFee eventbrite_fee?;
    # Fees taken by Eventbrite as a payment processing fee.
    PaymentFee payment_fee?;
    # The tax collected by the organizer.
    CostsTax tax?;
    # The total amount of taxes to be displayed.
    DisplayTax display_tax?;
    # The item price before a discount code is applied. If no discount is applied it's the display_price.
    PriceBeforeDiscount price_before_discount?;
    # The total discount to be displayed.
    DiscountAmount discount_amount?;
    # Type of discount applied.
    string discount_type?;
    # List of price costs components that belong to the fee display group.
    FeeComponent[] fee_components?;
    # List of price costs components that belong to the tax display group.
    TaxComponent[] tax_components?;
    # List
    ShippingComponent[] shipping_components?;
    # Indicates if any of the tax_components is a gts tax.
    boolean has_gts_tax?;
    # The name of the Organizer-to-Attendee tax that applies, if any.
    string tax_name?;
};

# Event description (contents of the event page). May be long and have significant formatting. Please refer to the event description tutorial to learn about the new way to create an event description.
public type Description record {
    # Event description in html format. <p>Some text</p>.
    string html?;
};

# Full details of the event category (requires the category expansion)
public type Category record {
    # Category ID
    string id?;
    # Resource URI
    string resource_uri?;
    # Category name
    string name?;
    # Translated category name
    string name_localized?;
    # Shorter category name for display in sidebars and other small spaces
    string short_name?;
    # Translated short category name
    string short_name_localized?;
    # List of subcategories (only shown on some endpoints)
    Subcategory[] subcategories?;
};

# Full details of the organization
public type Organization record {
    # The organization name
    string name?;
    # The organization vertical
    string vertical?;
    # The organization image id
    string image_id?;
    # The organization id
    string id?;
};

# The Discount object represents a discount that an Order owner can use when purchasing tickets to an Event.
public type Discount record {
    # Type
    string 'type?;
    # Code used to activate the discount
    string code?;
    # Fixed reduction amount. When creating access codes the default value is Null.
    string amount_off?;
    # Percentage reduction. When creating access codes the default value is Null.
    string percent_off?;
    # ID of the event. Only used for single event discounts
    string event_id?;
    # IDs of the ticket classes to limit discount to
    string[] ticket_class_ids?;
    # Number of times the discount can be used
    decimal quantity_available?;
    # Allow use from this date. A datetime represented as a string in Naive Local ISO8601 date and time format, in the timezone of the event.
    string start_date?;
    # Allow use from this number of seconds before the event starts. Greater than 59 and multiple of 60.
    decimal start_date_relative?;
    # Allow use until this date. A datetime represented as a string in Naive Local ISO8601 date and time format, in the timezone of the event.
    string end_date?;
    # Allow use until this number of seconds before the event starts. Greater than 59 and multiple of 60.
    decimal end_date_relative?;
    # ID of the ticket group
    string ticket_group_id?;
    # List of hold IDs this discount can unlock. Null if this discount does not unlock a hold.
    string[] hold_ids?;
    # Discount ID
    string id?;
    # Number of discounts used during ticket sales
    decimal quantity_sold?;
};

# User is an object representing an Eventbrite account. Users are Members of an Organization.
public type User record {
    # Full name. Use this in preference to first_name/last_name if possible for forward compatibility with non-Western names.
    string name?;
    # First name
    string first_name?;
    # Last name
    string last_name?;
    # Is this user's profile public?
    boolean is_public?;
    # The organization image id
    string image_id?;
    # List of User Email objects
    Email[] emails?;
};

# Full details of the event organizer (requires the organizer expansion)
public type Organizer record {
    # Organizer name.
    string name?;
    # Description of the Organizer (may be very long and contain significant formatting).
    OrganizerDescription description?;
    # Long description of the Organizer.
    OrganizerLongDescription long_description?;
    # Image ID of the organizer logo
    string logo_id?;
    # Full image details for organizer logo
    Logo logo?;
    # Is an absolute URL to the API endpoint that will return you the organizer.
    string resource_uri?;
    # Id of the organizer
    string id?;
    # URL to the organizer's page on Eventbrite
    string url?;
    # Number of past events the organizer has
    decimal num_past_events?;
    # Number of upcoming events the organizer has
    decimal num_future_events?;
    # Organizer's twitter handle
    string twitter?;
    # Organizer's facebook page
    string facebook?;
};

# Additional data about general tickets information (optional).
public type TicketAvailability record {
    # Whether this event has tickets available to purchase
    boolean has_available_tickets?;
    # A dictionary with some data of the available ticket with the minimums
    MinimumTicketPrice minimum_ticket_price?;
    # A dictionary with some data of the available ticket with the maximum
    MaximumTicketPrice maximum_ticket_price?;
    # Whether there is at least one ticket with availability
    boolean is_sold_out?;
    # The earliest start time when a visible ticket is or will be available
    StartSalesDate start_sales_date?;
    # Waitlist available
    boolean waitlist_available?;
};

# The Ticket Class object represents a possible ticket class (i.e. ticket type) for an Event.
public type TicketClass record {
    # Description of the ticket
    string description?;
    # Is this a donation? (user-supplied cost)
    boolean donation?;
    # Is this a free ticket?
    boolean free?;
    # Minimum number per order
    decimal minimum_quantity?;
    # Maximum number per order
    decimal maximum_quantity?;
    # A list of the available delivery methods for this ticket class
    string delivery_methods?;
    # Cost of the ticket (currently currency must match event currency) e.g. $45 would be "USD,4500"
    string cost?;
    # Is an absolute URL to the API endpoint that will return you ticket class.
    string resource_uri?;
    # Image ID for this ticket class. null if no image is set.
    string image_id?;
    # Name of this ticket type
    string name?;
    # Pretty long name of this ticket class. For tiered inventory tickets, this includes the tier name.
    string display_name?;
    # Unsigned integer in the order ticket classes are sorted by.
    decimal sorting?;
    # Total available number of this ticket, required for non-donation and non-tiered ticket classes. For normal ticket, null or 0 is not allowed. For donation ticket, null or 0 means unlimited. For tiered inventory ticket, null or 0 means capacity is only limited by tier capacity and/or event capacity.
    decimal capacity?;
    # Deprecated, use capacity instead.
    decimal quantity_total?;
    # The number of sold tickets.
    decimal quantity_sold?;
    # When the ticket is available for sale (leave empty for ‘when event published’)
    string sales_start?;
    # When the ticket stops being on sale (leave empty for 'one hour before event start'). Cannot be set on series parent tickets.
    string sales_end?;
    # Hide this ticket
    boolean hidden?;
    # Absorb the fee into the displayed cost
    boolean include_fee?;
    # Absorb the payment fee, but show the eventbrite fee
    boolean split_fee?;
    # Hide the ticket description on the event page
    boolean hide_description?;
    # Hide the sale dates on event landing and ticket selection page
    boolean hide_sale_dates?;
    # Hide this ticket when it is not on sale
    boolean auto_hide?;
    # Override reveal date for auto-hide
    string auto_hide_before?;
    # Override re-hide date for auto-hide
    string auto_hide_after?;
    # The ID of another ticket class - when it sells out, this class will go on sale.
    string sales_start_after?;
    # Order message per ticket type
    string order_confirmation_message?;
    # A list of all supported sales channels
    string[] sales_channels?;
    # Optional ID of Inventory Tier with which to associate the ticket class
    string inventory_tier_id?;
    # Has secondary barcode assignment enabled (for ex/ RFID)
    boolean secondary_assignment_enabled?;
    # Relative values used to calculate ticket sales_end. Can only be used for series parent tickets.
    SalesEndRelative sales_end_relative?;
    # Whether to include pdf ticket or not
    boolean has_pdf_ticket?;
};

# Description of the Organizer (may be very long and contain significant formatting).
public type OrganizerDescription record {
    # Description of the Organizer in text format
    string text;
    # Description of the Organizer in html format
    string html;
};

# Additional data about the sales status of the event (optional).
public type EventSalesStatus record {
    # Current sales status of the event.
    string sales_status?;
    # The earliest start time when a visible ticket is or will be available
    StartSalesDate start_sales_date?;
    # Custom message associated with the current event sales status.
    string message?;
    # Message type
    string message_type?;
    # Message code
    string message_code?;
};

# An object with a property events which is an array of Event objects.
public type EventsByOrganization record {
    # Pagination
    Pagination pagination?;
    # An array of Event objects.
    Event[] events?;
};

# The total amount of fees and taxes to be displayed.
public type DisplayFee record {
    # The ISO 4217 3-character code of a currency
    string currency;
    # The integer value of units of the minor unit of the currency (e.g. cents for US dollars)
    decimal value;
    # You can get a value in the currency's major unit - for example, dollars or pound sterling - by taking the integer value provided and shifting the decimal point left by the exponent value for that currency as defined in ISO 4217
    string major_value;
    # Provided for your convenience; its formatting may change depending on the locale you query the API with (for example, commas for decimal separators in European locales).
    string display;
};

# An object with a single property discount which must be an Discount object.
public type CreateDiscountRequest record {
    # The Discount object represents a discount that an Order owner can use when purchasing tickets to an Event.
    DiscountRequest event?;
};

# Cost of the ticket (currently currency must match event currency) e.g. $45 would be "USD,4500"
public type Cost record {
    # The total cost for this ticket class less the fee
    ActualCost actual_cost?;
    # The fee for this ticket class
    ActualFee actual_fee?;
    # The display cost for the ticket
    TicketCost cost?;
    # The fee that should be included in the price (0 if include_fee is false).
    Fee fee?;
    # The ticket's base or discounted tax amount
    Tax tax?;
};

# A dictionary with some data of the available ticket with the maximum
public type MaximumTicketPrice record {
    # The ISO 4217 3-character code of a currency
    string currency;
    # The integer value of units of the minor unit of the currency (e.g. cents for US dollars)
    string value;
    # You can get a value in the currency's major unit - for example, dollars or pound sterling - by taking the integer value provided and shifting the decimal point left by the exponent value for that currency as defined in ISO 4217
    string major_value;
    # Provided for your convenience; its formatting may change depending on the locale you query the API with (for example, commas for decimal separators in European locales).
    string display;
};

# The display cost for the ticket
public type TicketCost record {
    # The ISO 4217 3-character code of a currency
    string currency;
    # The integer value of units of the minor unit of the currency (e.g. cents for US dollars)
    decimal value;
    # You can get a value in the currency's major unit - for example, dollars or pound sterling - by taking the integer value provided and shifting the decimal point left by the exponent value for that currency as defined in ISO 4217
    string major_value;
    # Provided for your convenience; its formatting may change depending on the locale you query the API with (for example, commas for decimal separators in European locales).
    string display;
};

# Team creator email's information
public type CreatorEmail record {
    # If the email is verified
    boolean verified?;
    # If the email is the primary one
    boolean primary?;
    # The creator's email address
    string email?;
};

# Price costs component that belong to the tax display group.
public type TaxComponent record {
    # Indicates whether this is a price component that affects the final item price (if False), or just intermediate metadata (if True).
    boolean intermediate?;
    # Name of the fee.
    string name?;
    # Name of the fee within the group (organizer facing).
    string internal_name?;
    # Display name of the fee group (attendee facing).
    string group_name?;
    # The amount of the component represented in minor units. E.g. 725 means 7.25.
    decimal value?;
    # The total discount to be displayed to a specific cost component and the reason of the discount.
    DiscountObject discount?;
    # Rate rule that applies to this cost component, if any.
    Rule rule?;
    # Name of the base used to calculate the fee.
    string base?;
    # The display group the cost component belongs in.
    string bucket?;
    # Who keeps the amount of the cost component.
    string recipient?;
    # Who is paying the fee, used to determine if the fee is being passed on or absorbed into the item price.
    string payer?;
};

# Full details of the event format (requires the format expansion)
public type Format record {
    # Format ID
    string id?;
    # Format name
    string name?;
    # Localized format name
    string name_localized?;
    # Short name for a format
    string short_name?;
    # Localized short name for a format
    string short_name_localized?;
    # Is an absolute URL to the API endpoint that will return you the canonical representation of the format.
    string resource_uri?;
};

# Order confirmation message from event settings.
public type ConfirmationMessage record {
    # Description of the confirmation message in text format
    string text;
    # Description of the confirmation message in html format
    string html;
};

# An object with a single property ticket_class which must be a Ticket Class object.
public type CreateTicketClassRequest record {
    # The Ticket Class object represents a possible ticket class (i.e. ticket type) for an Event.
    TicketClass ticket_class?;
};

# An object with a property teams which is an array of Team objects.
public type Teams record {
    # Pagination
    Pagination pagination?;
    # An array of Team objects.
    Team[] venues?;
};

# An object with a property orders which is an array of Order objects.
public type OrdersByUser record {
    # Pagination
    Pagination pagination?;
    # An array of order objects.
    Order[] orders?;
};

# Work with the team information of an event
public type Team record {
    # Team ID
    string id?;
    # Team name
    string name?;
    # Creator object
    Creator creator?;
    # Date when the team information was last changed
    string changed?;
    # Date when the team was created
    string created?;
    # How many attendees the team have
    decimal attendee_count?;
    # Token
    string token?;
    # The ID of the event this team is part of
    string event_id?;
    # When the attendee joined the team
    string date_joined?;
};

# The Venue object represents the location of an Event (i.e. where an Event takes place). Venues are grouped together by the Organization object.
public type VenueRequest record {
    # The name of the venue
    string name;
    # The age restrictions for the venue
    string age_restriction?;
    # Set specific capacity (if omitted, sums ticket capacities)
    decimal capacity?;
    # The google place id for the venue
    string google_place_id?;
    # The organizer this venue belongs to (optional - leave this off to use the default organizer)
    string organizer_id?;
    # The address of the venue
    Address address?;
};

# The Ticket Class object represents a possible ticket class (i.e. ticket type) for an Event.
public type CreatedTicketClass record {
    # Description of the ticket
    string description?;
    # Is this a donation? (user-supplied cost)
    boolean donation?;
    # Is this a free ticket?
    boolean free?;
    # Minimum number per order
    decimal minimum_quantity?;
    # Maximum number per order
    decimal maximum_quantity?;
    # A list of the available delivery methods for this ticket class
    string[] delivery_methods?;
    # Cost of the ticket (currently currency must match event currency) e.g. $45 would be "USD,4500"
    Cost cost?;
    # Is an absolute URL to the API endpoint that will return you ticket class.
    string resource_uri?;
    # Image ID for this ticket class. null if no image is set.
    string image_id?;
    # Name of this ticket type
    string name?;
    # Pretty long name of this ticket class. For tiered inventory tickets, this includes the tier name.
    string display_name?;
    # Unsigned integer in the order ticket classes are sorted by.
    decimal sorting?;
    # Total available number of this ticket, required for non-donation and non-tiered ticket classes. For normal ticket, null or 0 is not allowed. For donation ticket, null or 0 means unlimited. For tiered inventory ticket, null or 0 means capacity is only limited by tier capacity and/or event capacity.
    decimal capacity?;
    # Deprecated, use capacity instead.
    decimal quantity_total?;
    # The number of sold tickets.
    decimal quantity_sold?;
    # When the ticket is available for sale (leave empty for ‘when event published’)
    string sales_start?;
    # When the ticket stops being on sale (leave empty for 'one hour before event start'). Cannot be set on series parent tickets.
    string sales_end?;
    # Hide this ticket
    boolean hidden?;
    # Absorb the fee into the displayed cost
    boolean include_fee?;
    # Absorb the payment fee, but show the eventbrite fee
    boolean split_fee?;
    # Hide the ticket description on the event page
    boolean hide_description?;
    # Hide the sale dates on event landing and ticket selection page
    boolean hide_sale_dates?;
    # Hide this ticket when it is not on sale
    boolean auto_hide?;
    # Override reveal date for auto-hide
    string auto_hide_before?;
    # Override re-hide date for auto-hide
    string auto_hide_after?;
    # The ID of another ticket class - when it sells out, this class will go on sale.
    string sales_start_after?;
    # Order message per ticket type
    string order_confirmation_message?;
    # A list of all supported sales channels
    string[] sales_channels?;
    # Optional ID of Inventory Tier with which to associate the ticket class
    string inventory_tier_id?;
    # Has secondary barcode assignment enabled (for ex/ RFID)
    boolean secondary_assignment_enabled?;
    # Ticket class category to which a ticket class belongs.
    string category?;
};

# The total amount of taxes to be displayed.
public type DisplayTax record {
    # The ISO 4217 3-character code of a currency
    string currency;
    # The integer value of units of the minor unit of the currency (e.g. cents for US dollars)
    decimal value;
    # You can get a value in the currency's major unit - for example, dollars or pound sterling - by taking the integer value provided and shifting the decimal point left by the exponent value for that currency as defined in ISO 4217
    string major_value;
    # Provided for your convenience; its formatting may change depending on the locale you query the API with (for example, commas for decimal separators in European locales).
    string display;
};

# The fee that should be included in the price (0 if include_fee is false).
public type Fee record {
    # The ISO 4217 3-character code of a currency
    string currency;
    # The integer value of units of the minor unit of the currency (e.g. cents for US dollars)
    decimal value;
    # You can get a value in the currency's major unit - for example, dollars or pound sterling - by taking the integer value provided and shifting the decimal point left by the exponent value for that currency as defined in ISO 4217
    string major_value;
    # Provided for your convenience; its formatting may change depending on the locale you query the API with (for example, commas for decimal separators in European locales).
    string display;
};

# An object with a single property user which must be a User object.
public type UserObject record {
    # User is an object representing an Eventbrite account. Users are Members of an Organization.
    User user?;
};

# The item price before a discount code is applied. If no discount is applied it's the display_price.
public type PriceBeforeDiscount record {
    # The ISO 4217 3-character code of a currency
    string currency;
    # The integer value of units of the minor unit of the currency (e.g. cents for US dollars)
    decimal value;
    # You can get a value in the currency's major unit - for example, dollars or pound sterling - by taking the integer value provided and shifting the decimal point left by the exponent value for that currency as defined in ISO 4217
    string major_value;
    # Provided for your convenience; its formatting may change depending on the locale you query the API with (for example, commas for decimal separators in European locales).
    string display;
};

# The total cost for this ticket class less the fee
public type ActualCost record {
    # The ISO 4217 3-character code of a currency
    string currency;
    # The integer value of units of the minor unit of the currency (e.g. cents for US dollars)
    decimal value;
    # You can get a value in the currency's major unit - for example, dollars or pound sterling - by taking the integer value provided and shifting the decimal point left by the exponent value for that currency as defined in ISO 4217
    string major_value;
    # Provided for your convenience; its formatting may change depending on the locale you query the API with (for example, commas for decimal separators in European locales).
    string display;
};

# An object with a property orders which is an array of Order objects.
public type OrdersByEvent record {
    # Pagination
    Pagination pagination?;
    # An array of order objects.
    Order[] orders?;
};

# Published event status.
public type PublishedEvent record {
    # Published status
    boolean published?;
};

# The Discount object represents a discount that an Order owner can use when purchasing tickets to an Event.
public type DiscountRequest record {
    # Type
    string 'type?;
    # Code used to activate the discount
    string code?;
    # Fixed reduction amount. When creating access codes the default value is Null.
    string amount_off?;
    # Percentage reduction. When creating access codes the default value is Null.
    string percent_off?;
    # ID of the event. Only used for single event discounts
    string event_id?;
    # IDs of the ticket classes to limit discount to
    string[] ticket_class_ids?;
    # Number of times the discount can be used
    decimal quantity_available?;
    # Allow use from this date. A datetime represented as a string in Naive Local ISO8601 date and time format, in the timezone of the event.
    string start_date?;
    # Allow use from this number of seconds before the event starts. Greater than 59 and multiple of 60.
    decimal start_date_relative?;
    # Allow use until this date. A datetime represented as a string in Naive Local ISO8601 date and time format, in the timezone of the event.
    string end_date?;
    # Allow use until this number of seconds before the event starts. Greater than 59 and multiple of 60.
    decimal end_date_relative?;
    # ID of the ticket group
    string ticket_group_id?;
    # List of hold IDs this discount can unlock. Null if this discount does not unlock a hold.
    string[] hold_ids?;
};

# An object which is an Attendee object.
public type Attendee record {
    # Attendee ID
    string id?;
    # When the attendee was created (order placed)
    string created?;
    # When the attendee was last changed
    string changed?;
    # The ticket_class that the attendee registered with
    string ticket_class_id?;
    # The name of the ticket_class at the time of registration
    string ticket_class_name?;
    # The attendee's affiliate code
    string affiliate?;
    # If the attendee is checked in
    boolean checked_in?;
    # If the attendee is cancelled
    boolean cancelled?;
    # If the attendee is refunded
    boolean refunded?;
    # The status of the attendee (scheduled to be deprecated)
    string status?;
    # The event id that this attendee is attending
    string event_id?;
    # The order id this attendee is part of
    string order_id?;
    # The guestlist id for this attendee. If this is null it means that this is not a guest.
    string guestlist_id?;
    # The name of the person that invited the attendee. If this is null it means that this is not a guest.
    string invited_by?;
    # The resource URI
    string resource_uri?;
};

# Full image details for organizer logo
public type Logo record {
    # The image’s ID
    string id;
    # The URL of the image
    string url;
    # The crop mask applied to the original image
    CropMask crop_mask?;
    # The original image
    Original original?;
    # The aspect ratio of the cropped image
    string aspect_ratio?;
    # The edge color of the image in hexadecimal representation
    string edge_color?;
    # True if the edge color has been set
    boolean edge_color_set?;
};

# The Event object represents an Eventbrite Event. An Event is owned by one Organization.
public type CreatedEvent record {
    # Event ID
    string id?;
    # Event name. Value cannot be empty nor whitespace.
    Name name?;
    # Event summary. This is a plaintext field and will have any supplied HTML removed from it. Maximum of 140 characters, mutually exclusive with description.
    string summary?;
    # Event description (contents of the event page). May be long and have significant formatting. Please refer to the event description tutorial to learn about the new way to create an event description.
    Description description?;
    # Start date/time of the event.
    Start 'start?;
    # End date/time of the event.
    End end?;
    # The URL to the event page for this event on Eventbrite
    string url?;
    # The vanity URL to the event page for this event on Eventbrite
    string vanity_url?;
    # When the event was created
    string created;
    # When the event was last changed
    string changed;
    # When the event was first published
    string published?;
    # Status of the event
    string status?;
    # The ISO 4217 currency code for this event
    string currency?;
    # true = Specifies that the Event is online only (i.e. the Event does not have a Venue).
    boolean online_event?;
    # Organization owning the event
    string organization_id?;
    # ID of the event organizer
    string organizer_id?;
    # Full details of the event organizer (requires the organizer expansion)
    Organizer organizer?;
    # Image ID of the event logo
    string logo_id?;
    # Full image details for organizer logo
    Logo logo?;
    # Event venue ID
    string venue_id?;
    # Full venue details for venue_id (requires the venue expansion)
    Venue venue?;
    # Event format
    string format_id?;
    # Full details of the event format (requires the format expansion)
    Format format?;
    # Event category
    string category_id?;
    # Full details of the event category (requires the category expansion)
    Category category?;
    # Event subcategory (Expansion is subcategory)
    string subcategory_id?;
    # Full details of the event subcategory (requires the subcategory expansion)
    Subcategory subcategory?;
    # This is an object of properties that detail dimensions of music events.
    MusicProperties music_properties?;
    # The bookmark information on the event, requires the bookmark_info expansion
    BookmarkInfo bookmark_info?;
    # Refund policy
    string refund_policy?;
    # Additional data about general tickets information (optional).
    TicketAvailability ticket_availability?;
    # Is this event publicly searchable on Eventbrite?. Default value is true.
    boolean listed?;
    # Can this event show social sharing buttons?
    boolean shareable?;
    # Can only people with invites see the event page?
    boolean invite_only?;
    # If the remaining number of tickets is publicly visible on the event page
    boolean show_remaining?;
    # Password needed to see the event in unlisted mode
    string password?;
    # Set specific capacity (if omitted, sums ticket capacities)
    decimal capacity?;
    # If True, the value of capacity is a custom-set value; if False, it's a calculated value of the total of all ticket capacities.
    boolean capacity_is_custom?;
    # Maximum duration (in seconds) of a transaction
    string tx_time_limit?;
    # If true, the event's start date should never be displayed to attendees.
    boolean hide_start_date?;
    # If true, the event's end date should never be displayed to attendees.
    boolean hide_end_date?;
    # Indicates event language on Event's listing page. (Default is en_US)
    string locale?;
    # Is locked
    boolean is_locked?;
    # Privacy setting
    string privacy_setting?;
    # true, if the Event is externally ticketed
    boolean is_externally_ticketed?;
    # External ticketing
    ExternalTicketing external_ticketing?;
    # If the event is part of a series. Specifying this attribute as True during event creation will always designate the event as a series parent, never as a series occurrence. Series occurrences must be created through the schedules API and cannot be created using the events API.
    boolean is_series?;
    # If the event is part of a series and is the series parent
    boolean is_series_parent?;
    # If the event is part of a series, this is the event id of the series parent. If the event is not part of a series, this field is omitted.
    string series_id?;
    # If the event is reserved seating
    boolean is_reserved_seating?;
    # For reserved seating event, if attendees can pick their seats.
    boolean show_pick_a_seat?;
    # For reserved seating event, if venue map thumbnail visible on the event page.
    boolean show_seatmap_thumbnail?;
    # For reserved seating event, if venue map thumbnail should have colors on the event page.
    boolean show_colors_in_seatmap_thumbnail?;
    # Allows to set a free event
    boolean is_free?;
    # Source of the event (defaults to API)
    string 'source?;
    # Version
    string 'version?;
    # Is an absolute URL to the API endpoint that will return you the canonical representation of the event.
    string resource_uri?;
    # Additional data about the sales status of the event (optional).
    EventSalesStatus event_sales_status?;
    # Additional data about the checkout settings of the Event.
    CheckoutSettings checkout_settings?;
};

# Confirmation message for customers who have purchased one or more of this ticket class.
public type TicketClassConfirmationSettingsConfirmationMessage record {
    # Description of the confirmation message for customers who have purchased one or more of this ticket class in text format
    string text;
    # Description of the confirmation message for customers who have purchased one or more of this ticket class in html format
    string html;
};

# Full details of the event subcategory (requires the subcategory expansion)
public type Subcategory record {
    # Subcategory ID
    string id?;
    # Resource URI
    string resource_uri?;
    # Subcategory name
    string name?;
    # Full details of the event category (requires the category expansion)
    Category parent_category?;
};

# A container for representing additional offline payment method checkout settings.
public type OfflineSettings record {
    # Set of possible values are [CASH, CHECK, INVOICE]
    string payment_method?;
    # Instructions
    string instructions?;
};

# An object with a property organizations which is an array of Organization objects.
public type Organizations record {
    # Pagination
    Pagination pagination?;
    # An array of Organization objects.
    Organization[] organizations?;
};

# The Event object represents an Eventbrite Event. An Event is owned by one Organization.
public type Event record {
    # Event ID
    string id?;
    # Event name. Value cannot be empty nor whitespace.
    Name name;
    # Event summary. This is a plaintext field and will have any supplied HTML removed from it. Maximum of 140 characters, mutually exclusive with description.
    string summary?;
    # Event description (contents of the event page). May be long and have significant formatting. Please refer to the event description tutorial to learn about the new way to create an event description.
    Description description?;
    # Start date/time of the event.
    Start 'start;
    # End date/time of the event.
    End end;
    # If true, the event's start date should never be displayed to attendees.
    boolean hide_start_date?;
    # If true, the event's end date should never be displayed to attendees.
    boolean hide_end_date?;
    # The ISO 4217 currency code for this event
    string currency;
    # true = Specifies that the Event is online only (i.e. the Event does not have a Venue).
    boolean online_event?;
    # ID of the event organizer
    string organizer_id?;
    # Image ID of the event logo
    string logo_id?;
    # Event venue ID
    string venue_id?;
    # Event format
    string format_id?;
    # Event category
    string category_id?;
    # Event subcategory
    string subcategory_id?;
    # Is this event publicly searchable on Eventbrite?. Default value is true.
    boolean listed?;
    # Can this event show social sharing buttons?
    boolean shareable?;
    # Can only people with invites see the event page?
    boolean invite_only?;
    # If the remaining number of tickets is publicly visible on the event page
    boolean show_remaining?;
    # Password needed to see the event in unlisted mode
    string password?;
    # Set specific capacity (if omitted, sums ticket capacities)
    decimal capacity?;
    # If the event is reserved seating
    boolean is_reserved_seating?;
    # If the event is part of a series. Specifying this attribute as True during event creation will always designate the event as a series parent, never as a series occurrence. Series occurrences must be created through the schedules API and cannot be created using the events API.
    boolean is_series?;
    # For reserved seating event, if attendees can pick their seats.
    boolean show_pick_a_seat?;
    # For reserved seating event, if venue map thumbnail visible on the event page.
    boolean show_seatmap_thumbnail?;
    # For reserved seating event, if venue map thumbnail should have colors on the event page.
    boolean show_colors_in_seatmap_thumbnail?;
    # Source of the event (defaults to API)
    string 'source?;
    # Indicates event language on Event's listing page. (Default is en_US)
    string locale?;
};

# The item price with discounts applied.
public type DisplayPrice record {
    # The ISO 4217 3-character code of a currency
    string currency;
    # The integer value of units of the minor unit of the currency (e.g. cents for US dollars)
    decimal value;
    # You can get a value in the currency's major unit - for example, dollars or pound sterling - by taking the integer value provided and shifting the decimal point left by the exponent value for that currency as defined in ISO 4217
    string major_value;
    # Provided for your convenience; its formatting may change depending on the locale you query the API with (for example, commas for decimal separators in European locales).
    string display;
};

# The original image
public type Original record {
    # The URL of the image
    string url?;
    # The width of the image in pixels
    decimal width?;
    # The height of the image in pixels
    decimal height?;
};

# Ticket settings relevant to the purchaser after the order has been processed. Included only when called with the expansion ticket_buyer_settings. Order must be in PLACED or UNPAID state for the ticket_buyer_settings to return any information, otherwise will be an empty object.
public type TicketBuyerSettings record {
    # Order confirmation message from event settings.
    ConfirmationMessage confirmation_message?;
    # Instructions for the ticket buyer.
    Instructions instructions?;
    # Public id of the event these ticket buyer settings come from.
    string event_id?;
    # Are refund requests enabled for this event.
    boolean refund_request_enabled?;
    # URL to redirect the ticket buyer to for further purchase information.
    string redirect_url?;
    # List of confirmation messages per unique ticket class in the order.
    TicketClassConfirmationSettings[] ticket_class_confirmation_settings?;
};

# The total discount to be displayed to a specific cost component and the reason of the discount.
public type DiscountObject record {
    # The total discount to be displayed.
    DiscountAmount amount?;
    # The reason why a discount is applied to a specific cost component.
    string reason?;
};

# Additional data about the checkout settings of the Event.
public type CheckoutSettings record {
    # When the checkout settings object was created
    string created?;
    # When the checkout settings object was last changed
    string changed?;
    # The ISO 3166 alpha-2 code of the country within which these checkout settings can apply.
    string country_code?;
    # The ISO 4217 3-character code of the currency for which these checkout settings can apply.
    string currency_codes?;
    # Checkout method
    string checkout_method?;
    # A container for representing additional offline payment method checkout settings.
    OfflineSettings[] offline_settings?;
    # The merchant account user instrument ID for the checkout method. Only specify this value for PayPal and Authorize.net checkout settings.
    string user_instrument_vault_id?;
};

# Price costs component that belong to the fee display group.
public type FeeComponent record {
    # Indicates whether this is a price component that affects the final item price (if False), or just intermediate metadata (if True).
    boolean intermediate?;
    # Name of the fee.
    string name?;
    # Name of the fee within the group (organizer facing).
    string internal_name?;
    # Display name of the fee group (attendee facing).
    string group_name?;
    # The amount of the component represented in minor units. E.g. 725 means 7.25.
    decimal value?;
    # The total discount to be displayed to a specific cost component and the reason of the discount.
    DiscountObject discount?;
    # Rate rule that applies to this cost component, if any.
    Rule rule?;
    # Name of the base used to calculate the fee.
    string base?;
    # The display group the cost component belongs in.
    string bucket?;
    # Who keeps the amount of the cost component.
    string recipient?;
    # Who is paying the fee, used to determine if the fee is being passed on or absorbed into the item price.
    string payer?;
};
