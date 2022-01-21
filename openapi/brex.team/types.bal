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

public type CreateLocationRequest record {
    # Name of the location
    string name;
    # Description of the location
    string? description?;
};

# Parameters for terminating a card.
public type TerminateCardRequest record {
    # Description for terminating a card
    string? description?;
    # Reason for card termination.
    ChangeCardReason reason;
};

# Company business address (must be in the US; no PO box or virtual/forwarding addresses allowed).
public type Address record {
    # Address line 1, no PO Box.
    string? line1?;
    # Address line 2 (e.g., apartment, suite, unit, or building).
    string? line2?;
    # City, district, suburb, town, or village.
    string? city?;
    # For US-addressed the 2-letter State abbreviation. For international-addresses the County, Providence, or Region.
    string? state?;
    # Two-letter country code (ISO 3166-1 alpha-2).
    string? country?;
    # ZIP or postal code.
    string? postal_code?;
    # Phone number.
    string? phone_number?;
};

# Reason for card termination.
public type ChangeCardReason string;

# Parameters for locking a card.
public type LockCardRequest record {
    # Description for locking a card
    string? description?;
    # Reason for card termination.
    ChangeCardReason reason;
};

# Card status
public type CardStatus string;

# Status of the user
public type UserStatus string;

public type LocationResponse record {
    string id;
    # Name of the location
    string name;
    # Description of the location
    string? description?;
};

public type DepartmentResponse record {
    string id;
    # Name of the department
    string name;
    # Description of the department
    string? description?;
};

# Money fields can be signed or unsigned. Fields are signed (an unsigned value will be interpreted as positive).
public type Money record {
    # The amount of money, in the smallest denomination of the currency indicated by currency. For example, when currency is USD, amount is in cents.
    int amount?;
    # The type of currency, in ISO 4217 format. Default to USD if not specified
    string? currency?;
};

# Owner type
public type OwnerType string;

# Spend control data
public type SpendControl record {
    # Money fields can be signed or unsigned. Fields are signed (an unsigned value will be interpreted as positive).
    Money spend_limit;
    # Money fields can be signed or unsigned. Fields are signed (an unsigned value will be interpreted as positive).
    Money spend_available;
    # Spend limit refresh frequency - MONTHLY: The spend limit refreshes every month - QUARTERLY: The spend limit refreshes every quarter - YEARLY: The spend limit refreshes every year - ONE_TIME: The limit does not refresh
    SpendDuration spend_duration?;
    # Reason for spend control
    string? reason?;
    # Date to lock the spend
    string? lock_after_date?;
};

public type PageCard record {
    # Cursor for next page
    string? next_cursor?;
    # Array of Card ojects
    Card[] items;
};

public type PageUserresponse record {
    # Cursor for next page
    string? next_cursor?;
    # Array of User response objects
    UserResponse[] items;
};

# Card owner information.
public type CardOwner record {
    # Owner type
    OwnerType 'type?;
    # User ID
    string user_id?;
};

# Card type
public type CardType string;

# If `card_type` = `CARD` then the card is a vendor card and it doesn't rely on the user limit. A vendor has to be a virtual card. If `card_type` = `USER` then the card is a corporate card. Check out [this article](https://support.brex.com/what-are-the-different-types-of-cards-i-can-get/) about different card types.
public type LimitType string;

# Spend control request
public type SpendControlRequest record {
    # Money fields can be signed or unsigned. Fields are signed (an unsigned value will be interpreted as positive).
    Money spend_limit;
    # Spend limit refresh frequency - MONTHLY: The spend limit refreshes every month - QUARTERLY: The spend limit refreshes every quarter - YEARLY: The spend limit refreshes every year - ONE_TIME: The limit does not refresh
    SpendDuration spend_duration;
    # Reason for the spend control
    string? reason?;
    # Date for locking the spend control
    string? lock_after_date?;
};

# Spend limit refresh frequency - MONTHLY: The spend limit refreshes every month - QUARTERLY: The spend limit refreshes every quarter - YEARLY: The spend limit refreshes every year - ONE_TIME: The limit does not refresh
public type SpendDuration string;

# Card number, CVV and expiration date of a card
public type CardNumberResponse record {
    # Card number id
    string id;
    # Card number
    string number;
    # CVV
    string cvv;
    # Month and year of expiration
    CardExpiration expiration_date;
};

public type UpdateCardRequest record {
    # Spend control request data
    SpendControlUpdateRequest spend_controls?;
};

# Spend control request data
public type SpendControlUpdateRequest record {
    # Money fields can be signed or unsigned. Fields are signed (an unsigned value will be interpreted as positive).
    Money spend_limit?;
    # Spend limit refresh frequency - MONTHLY: The spend limit refreshes every month - QUARTERLY: The spend limit refreshes every quarter - YEARLY: The spend limit refreshes every year - ONE_TIME: The limit does not refresh
    SpendDuration spend_duration?;
    # Date to lock the spend
    string? lock_after_date?;
};

public type UserLimitResponse record {
    # Money fields can be signed or unsigned. Fields are signed (an unsigned value will be interpreted as positive).
    Money monthly_limit?;
};

# Only cards with limit_type = CARD have spend_controls
public type Card record {
    # Card ID
    string id;
    # Card owner information.
    CardOwner owner;
    # Card status
    CardStatus status?;
    # Last four digits of card number
    string last_four;
    # Card name
    string card_name;
    # Card type
    CardType card_type?;
    # If `card_type` = `CARD` then the card is a vendor card and it doesn't rely on the user limit. A vendor has to be a virtual card. If `card_type` = `USER` then the card is a corporate card. Check out [this article](https://support.brex.com/what-are-the-different-types-of-cards-i-can-get/) about different card types.
    LimitType limit_type;
    # Spend control data
    SpendControl spend_controls?;
    # Company business address (must be in the US; no PO box or virtual/forwarding addresses allowed).
    Address billing_address;
    # Company business address (must be in the US; no PO box or virtual/forwarding addresses allowed).
    Address mailing_address?;
};

# Request that sets the monthly user limit.
public type SetUserLimitRequest record {
    # Money fields can be signed or unsigned. Fields are signed (an unsigned value will be interpreted as positive).
    Money monthly_limit?;
};

public type UserResponse record {
    # User ID
    string id;
    # First name of the user
    string first_name;
    # Last name of the user
    string last_name;
    # Email address of the user
    string email;
    # Status of the user
    UserStatus status?;
    # The user id of the manager of this user
    string? manager_id?;
    # Department ID
    string? department_id?;
    # Loaction ID
    string? location_id?;
};

public type PageLocationresponse record {
    # Cursor for next page
    string? next_cursor?;
    # Array of Location response objects
    LocationResponse[] items;
};

public type CreateDepartmentRequest record {
    # Name of the department
    string name;
    # Description of the department
    string? description?;
};

public type PageDepartmentresponse record {
    # Cursor for next page
    string? next_cursor?;
    # Array of Department ojects
    DepartmentResponse[] items;
};

# Month and year of expiration
public type CardExpiration record {
    # Month of expiration
    int month?;
    # Year of expiration
    int year?;
};

# Acceptable user status for update. To suspend a user, set status to 'disabled'. To unsuspend a user, set status to 'active'.
public type UpdateUserStatus string;

public type CreateUserRequest record {
    # First name
    string first_name;
    # Last name
    string last_name;
    # Email address
    string email;
    # The ID of the manager
    string? manager_id?;
    # Department ID
    string? department_id?;
    # Location ID
    string? location_id?;
};

# The `spend_controls` field is required when `limit_type` = `CARD`. The `shipping_address` field is required for physical cards, and the first two lines of the address must be under 60 characters long.
public type CreateCardRequest record {
    # Card owner information.
    CardOwner owner;
    # Card name.
    string card_name;
    # Card type
    CardType card_type;
    # If `card_type` = `CARD` then the card is a vendor card and it doesn't rely on the user limit. A vendor has to be a virtual card. If `card_type` = `USER` then the card is a corporate card. Check out [this article](https://support.brex.com/what-are-the-different-types-of-cards-i-can-get/) about different card types.
    LimitType limit_type;
    # Spend control request
    SpendControlRequest spend_controls?;
    # Company business address (must be in the US; no PO box or virtual/forwarding addresses allowed).
    Address mailing_address?;
};

public type UpdateUserRequest record {
    # Acceptable user status for update. To suspend a user, set status to 'disabled'. To unsuspend a user, set status to 'active'.
    UpdateUserStatus status?;
    # The user ID of the manager of this user
    string? manager_id?;
    # Department ID
    string? department_id?;
    # Location ID
    string? location_id?;
};
