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

# OCPI response - `EVSE`
public type OcpiResponseEvse record {
    # OCPI status code
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # The part that controls the power supply to a single EV in a single session
    Evse data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# A list of the roles this party provides.
public type CredentialsRole record {
    # Type of role
    string role;
    # Details of a party
    BusinessDetails business_details;
    # CPO, eMSP (or other role) ID of this party (following the ISO-15118standard)
    string party_id;
    # ISO-3166 alpha-2 country code of the country this party is operating in
    string country_code;
};

# Charging period details
public type ChargingPeriod record {
    # Start timestamp of the charging period. A period ends when the next period starts. The last period ends when the session ends
    string start_date_time;
    # A list of relevant values for this charging period
    CdrDimension[] dimensions;
    # Unique identifier of the Tariff that is relevant for this Charging Period. If not provided, no Tariff is relevant during this period
    string tariff_id?;
};

# Represents a token information
public type Token record {
    # ISO-3166 alpha-2 country code of the MSP that 'owns' this Token
    string country_code;
    # CPO ID of the MSP that 'owns' this Token (following the ISO-15118 standard)
    string party_id;
    # Unique ID by which this Token can be identified. This is the field used by CPO system (RFID reader on the Charge Point) to identify this token.Currently, in most cases- type=RFID, this is the RFID hidden ID as read by theRFID reader, but that is not a requirement.If this is a APP_USER or AD_HOC_USER Token, it will be a uniquely, by the eMSP,generated ID.This field is named uid instead of id to prevent confusion with- contract_id.
    string uid;
    # Type of the token
    string 'type;
    # Uniquely identifies the EV Driver contract token within the eMSP’s platform (and sub operator platforms). Recommended to follow the specification for eMA IDfrom "eMI3 standard version V1.0" (http://emi3group.com/documents-links/)"Part 2- business objects."
    string contract_id;
    # Visual readable number/identification as printed on the Token (RFID card), might be equal to the contract_id.
    string visual_number?;
    # Issuing company, most of the times the name of the company printed on the token (RFID card), not necessarily the eMSP.
    string issuer;
    # This ID groups a couple of tokens. This can be used to make two or more tokens work as one, so that a session can be started with one token andstopped with another, handy when a card and key-fob are given to the EV-driver.Beware that OCPP 1.5/1.6 only support group_ids (it is called parentId in OCPP 1.5/1.6) with a maximum length of 20
    string group_id?;
    # Indicates whether this Token valid is or not.
    boolean valid;
    # Indicates what type of white-listing is allowed
    string whitelist;
    # Language Code ISO 639-1. This optional field indicates the Token owner’s preferred interface language. If the language is not provided or not supported then the CPO is free to choose its own language.
    string language?;
    # The default Charging Preference. When this is provided, and a charging session is started on an Charge Point that support Preference base Smart Charging and support this ProfileType, the Charge Point can start using this ProfileType,without this having to be set via- Set Charging Preferences
    string default_profile_type?;
    # Information about a energy contract that belongs to a Token so a driver could use his/her own energy contract when charging at a Charge Point
    EnergyContract energy_contract?;
    # Timestamp when this Token was last updated (or created)
    string last_updated;
};

# Result of a ChargingProfile request that the EVSE sends via the CPO to the eMSP
public type GenericChargingProfileResult record {
    # charging profile request results
    string result;
    # The charging profile as calculated by the EVSE.
    ActiveChargingProfile profile?;
};

# The CommandResponse object is sent in the HTTP response body
public type CommandResponse record {
    # Response from the CPO on the command request
    string result;
    # Timeout for this command in seconds. When the Result is not received within this timeout, the eMSP can assume that the message might never be sent.
    int timeout;
    # A List of multi-language alternative tariff info texts
    DisplayText message?;
};

# Unit
public type Unit string;

# References an image related to an EVSE in terms of a file name or url.
public type Image record {
    # URL from where the image data can be fetched through a web browser
    string url;
    # URL from where a thumbnail of the image can be fetched through a web browser
    string thumbnail?;
    # Describes what the image is used for
    string category;
    # Image type like- gif, jpeg, png, svg
    string 'type;
    # Width of the full scale image
    int width?;
    # Height of the full scale image
    int height?;
};

# OCPI basic role details
public type BasicRole record {
    # CPO, eMSP (or other role) ID of this party (following the ISO-15118standard)
    string party_id;
    # ISO-3166 alpha-2 country code of the country this party is operating in
    string country_code;
};

# OCPI response - `command response`
public type OcpiResponseCommandResponse record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # The CommandResponse object is sent in the HTTP response body
    CommandResponse data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# This type is used to schedule status periods in the future. The eMSP can provide this information to the EV user for trip planning purposes. A period MAY have no end. Example- "This station will be running as of tomorrow. Today it is still planned and under construction.
public type StatusSchedule record {
    # Begin of the scheduled period
    string period_begin;
    # End of the scheduled period, if known
    string period_end?;
    # Status value during the scheduled period
    string status;
};

# Charge detail record
public type CDR record {
    # ISO-3166 alpha-2 country code of the CPO that 'owns' this CDR
    string country_code;
    # CPO ID of the CPO that 'owns' this CDR (following the ISO-15118standard)
    string party_id;
    # Uniquely identifies the CDR within the CPO’s platform (and sub operator platforms). This field is longer than the usual 36characters to allow for credit CDRs to have something appended to the original ID. Normal (non-credit) CDRs SHALL only have an ID with a maximum length of 36.
    string id;
    # Start timestamp of the charging session, or in-case of a reservation(before the start of a session) the start of the reservation
    string start_date_time;
    # The timestamp when the session was completed/finished, charging might have finished before the session ends, for example- EV is full,but parking cost also has to be paid
    string end_date_time;
    # Unique ID of the Session for which this CDR is sent. Is only allowed to be omitted when the CPO has not implemented the Sessions module or this CDR is the result of a reservation that never became a charging session, thus no OCPI Session
    string session_id?;
    # CDR Token details
    CdrToken cdr_token;
    # Method used for authentication
    string auth_method;
    # Reference to the authorization given by the eMSP. When the eMSP provided an authorization_reference in either- real-time authorization or StartSession, this field shall contain the same value. When different authorization_reference values have been given by the eMSP that are relevant to this Session, the last given value shall be used here.
    string authorization_reference?;
    # CDR location
    CdrLocation cdr_location;
    # Identification of the Meter inside the Charge Point
    string meter_id?;
    # Currency of the CDR in ISO 4217 Code
    string currency;
    # A list of relevant Tariff Elements, see [Tariff](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#mod_tariffs_tariff_object). When relevant, a Free ofCharge tariff should also be in this list, and point to a defined Freeof Charge Tariff.
    Tariff[] tariffs?;
    # A list of Charging Periods that make up this charging session. A session consists of 1 or more periods, where each period has a different relevant Tariff
    ChargingPeriod[] charging_periods;
    # All the information of the signed data. Which encoding method is used, if needed, the public key and a list of signed values.
    SignedData signed_data?;
    # The total cost of the session in the specified currency
    Price total_cost;
    # The total cost of the session in the specified currency
    Price total_fixed_cost?;
    # Total energy charged, in kWh
    float total_energy;
    # The total cost of the session in the specified currency
    Price total_energy_cost?;
    # Total duration of the charging session (including the duration of charging and not charging), in hours
    float total_time;
    # The total cost of the session in the specified currency
    Price total_time_cost?;
    # Total duration of the charging session where the EV was not charging (no energy was transferred between EVSE and EV), in hours
    float total_parking_time?;
    # The total cost of the session in the specified currency
    Price total_parking_cost?;
    # The total cost of the session in the specified currency
    Price total_reservation_cost?;
    # Optional remark, can be used to provide additional human readable information to the CDR, for example- reason why a transaction was stopped
    string remark?;
    # This field can be used to reference an invoice, that will later be sent for this CDR. Making it easier to link a CDR to a given invoice.Maybe even group CDRs that will be on the same invoice
    string invoice_reference_id?;
    # When set to true, this is a Credit CDR, and the field credit_reference_id needs to be set as well
    boolean credit?;
    # Whether it is required to be set for a Credit CDR. This shall contain the id of the CDR for which this is a Credit CDR
    string credit_reference_id?;
    # Timestamp when this CDR was last updated (or created)
    string last_updated;
};

# These restrictions are not for the entire Charging Session. They only describe if and when a TariffElement becomes active or inactive during a Charging Session.
public type TariffRestrictions record {
    # Start time of day in local time, the time zone is defined in the time_zone field of the Location, for example 13:30, valid from this time of the day. Must be in 24h format with leading zeros. Hour/Minute separator:- ":" Regex- ([0-1][0-9]|2[0-3]):[0-5][0-9]
    string start_time?;
    # End time of day in local time, the time zone is defined in the time_zone field of the Location, for example 19:45, valid until this time of the day. Same syntax asstart_time. If end_time < start_time then the period wraps around to the next day. To stop at end of the day use- 00:00
    string end_time?;
    # Start date in local time, the time zone is defined in the time_zone field of theLocation, for example- 2015-12-24, valid from this day (inclusive). Regex-([12][0-9]{3})-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])
    string start_date?;
    # End date in local time, the time zone is defined in the time_zone field of theLocation, for example- 2015-12-27, valid until this day (exclusive). Same syntax as start_date.
    string end_date?;
    # Minimum consumed energy in kWh, for example 20, valid from this amount of energy (inclusive) being used.
    float min_kwh?;
    # Maximum consumed energy in kWh, for example 50, valid until this amount of energy (exclusive) being used
    float max_kwh?;
    # Sum of the minimum current (in Amperes) over all phases, for example 5. When the EV is charging with more than, or equal to, the defined amount of current,this TariffElement is/becomes active. If the charging current is or becomes lower,this TariffElement is not or no longer valid and becomes inactive. This describesNOT the minimum current over the entire Charging Session. This restriction can make a TariffElement become active when the charging current is above the defined value, but the TariffElement MUST no longer be active when the charging current drops below the defined value.
    float min_current?;
    # Sum of the maximum current (in Amperes) over all phases, for example 20.When the EV is charging with less than the defined amount of current, thisTariffElement becomes/is active. If the charging current is or becomes higher,this TariffElement is not or no longer valid and becomes inactive. This describesNOT the maximum current over the entire Charging Session. This restriction can make a TariffElement become active when the charging current is below this value, but the TariffElement MUST no longer be active when the charging current raises above the defined value.
    float max_current?;
    # Minimum power in kW, for example 5. When the EV is charging with more than,or equal to, the defined amount of power, this TariffElement is/becomes active. Ifthe charging power is or becomes lower, this TariffElement is not or no longer valid and becomes inactive. This describes NOT the minimum power over the entire Charging Session. This restriction can make a TariffElement become active when the charging power is above this value, but the TariffElement MUSTno longer be active when the charging power drops below the defined value.
    float min_power?;
    # Maximum power in kW, for example 20. When the EV is charging with less than the defined amount of power, this TariffElement becomes/is active. If the charging power is or becomes higher, this TariffElement is not or no longer valid and becomes inactive. This describes NOT the maximum power over the entireCharging Session. This restriction can make a TariffElement become active when the charging power is below this value, but the TariffElement MUST no longer be active when the charging power raises above the defined value.
    float max_power?;
    # Minimum duration in seconds the Charging Session MUST last (inclusive).When the duration of a Charging Session is longer than the defined value, thisTariffElement is or becomes active. Before that moment, this TariffElement is not yet active.
    int min_duration?;
    # Maximum duration in seconds the Charging Session MUST last (exclusive).When the duration of a Charging Session is shorter than the defined value, thisTariffElement is or becomes active. After that moment, this TariffElement is no longer active.
    int max_duration?;
    # Which day(s) of the week this TariffElement is active
    string[] day_of_week?;
    # When this field is present, the TariffElement describes reservation costs. A reservation starts when the reservation is made, and ends when the driverstarts charging on the reserved EVSE/Location, or when the reservationexpires. A reservation can only have- FLAT and TIME TariffDimensions, whereTIME is for the duration of the reservation.
    string reservation?;
};

# Regular recurring operation or access hours
public type RegularHours record {
    # Number of day in the week, from Monday (1) till Sunday (7)
    int weekday;
    # Begin of the regular period, in local time, given in hours and minutes. Must be in24h format with leading zeros. Examples- "18:15". Hour/Minute separator- ":"Regex- ([0-1][0-9]|2[0-3]):[0-5][0-9].
    string period_begin;
    # End of the regular period, in local time, syntax as for period_begin. Must be later than period_begin.
    string period_end;
};

# Contains the charging preferences of an EV driver
public type ChargingPreferences record {
    # Type of Smart Charging Profile selected by the driver. The ProfileType has to be supported at the Connector and for every supported ProfileType, a Tariff MUSTbe provided. This gives the EV driver the option between different pricing options.
    string profile_type;
    # Expected departure. The driver has given this Date/Time as expected departure moment. It is only an estimation and not necessarily the Date/Time of the actual departure.
    string departure_time?;
    # Requested amount of energy in kWh. The EV driver wants to have this amountof energy charged
    float energy_need?;
    # The driver allows their EV to be discharged when needed, as long as the other preferences are met- EV is charged with the preferred energy (energy_need)until the preferred departure moment (departure_time). Default if omitted:false
    boolean discharge_allowed?;
};

# OCPI response version details
public type OcpiResponseVersionDetail record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # Version details
    VersionDetail data?;
    # The time this message was generated
    string timestamp;
    # OCN Signature
    string ocn_signature?;
};

# OCPI response object
public type OcpiResponseObject record {
    # OCPI status code, as listed in Status Codes, indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist off our digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # Contains the actual response data object or list of objects from each request,depending on the cardinality of the response data, this is an array (card. * or +),or a single object (card. 1 or ?)
    record {} data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# OCPI module endpoint details
public type Endpoint record {
    # Endpoint identifier
    string identifier;
    # Interface role this endpoint implements
    string role;
    # URL to the endpoint
    string url;
};

# Response to the ChargingProfile request from the eMSP to the CPO
public type ChargingProfileResponse record {
    # Response types to the ChargingProfile request from the eMSP to the CPO
    string result;
    # timeout value
    int timeout;
};

# A list of supported OCPI versions
public type Version record {
    # The version number
    string 'version;
    # URL to the endpoint containing version specific information
    string url;
};

# OCPI response - Location list
public type OcpiResponseLocationList record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # An array of locations
    Location[] data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# OCN rules list party
public type OcnRulesListParty record {
    # Party ID
    string party_id;
    # Country ID
    string country_code;
    # an array of Modules
    string[] modules;
};

# Key-value pairs (enum + percentage) of energy sources
public type EnergySource record {
    # The type of energy source
    string 'source;
    # Percentage of this source (0-100) in the mix
    float percentage;
};

# A time period in a charging profile, as used in ChargingProfile
public type ChargingProfilePeriod record {
    # Start of the period, in seconds from the start of profile. The value of StartPeriod also defines the stop time of the previous period.
    int start_period;
    # Charging rate limit during the profile period, in the applicable chargingRateUnit,for example in Amperes (A) or Watts (W). Accepts at most one digit fraction.
    float 'limit;
};

# Details of a party
public type BusinessDetails record {
    # Name of the operator
    string name;
    # Link to the operator’s website
    string website?;
    # References an image related to an EVSE in terms of a file name or url.
    Image logo?;
};

# The RESERVE_NOW command, with information needed to reserve a (specific) connector of a Charge Point for a given Token
public type ReserveNow record {
    # URL that the CommandResult POST should be send to. This URL might contain an unique ID to be able to distinguish between ReserveNow requests.
    string response_url;
    # Represents a token information
    Token token;
    # The Date/Time when this reservation ends, in UTC
    string expiry_date;
    # Reservation id, unique for this reservation. If the Receiver (typicallyCPO) Point already has a reservation that matches this reservationId for that Location it will replace the reservation.
    string reservation_id;
    # Location.id of the Location (belonging to the CPO this request is send to) for which to reserve an EVSE
    string location_id;
    # Optional EVSE.uid of the EVSE of this Location if a specific EVSE has to be reserved.
    string evse_uid?;
    # Reference to the authorization given by the eMSP, when given, this reference will be provided in the relevant Session and/or CDR
    string authorization_reference?;
};

# OCPI response - Session List
public type OcpiResponseSessionList record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # An array of sessions
    Session[] data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# Describes the pricing of a tariff
public type PriceComponent record {
    # Type of tariff dimension
    string 'type;
    # Price per unit (excl. VAT) for this tariff dimension
    float price;
    # Applicable VAT percentage for this tariff dimension. If omitted, no VATis applicable. Not providing a VAT is different from 0% VAT, which would be a value of 0.0 here.
    float vat?;
    # Minimum amount to be billed. This unit will be billed in this step_size blocks. Amounts that are less then this step_size are rounded up to the given step_size. For example- if type is TIME and step_size has a value of 300, then time will be billed in blocks of 5 minutes. If 6 minutes were used, 10 minutes (2 blocks of step_size) will be billed.
    int step_size;
};

# OCPI response  - 'Location'
public type OcpiResponseLocation record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # The location and its properties where a group of EVSEs that belong together are installed
    Location data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# Consists of a list of one or more Tariff Elements, which can be used to create complex Tariff structures.
public type Tariff record {
    # ISO-3166 alpha-2 country code of the CPO that owns this Tariff
    string country_code;
    # CPO ID of the CPO that owns this Tariff (following the ISO-15118 standard)
    string party_id;
    # Uniquely identifies the tariff within the CPO’s platform (and sub operator platforms)
    string id;
    # ISO-4217 code of the currency of this tariff
    string currency;
    # Defines the type of the tariff. This allows for distinction in case of given ChargingPreferences. When omitted, this tariff is valid for all sessions.
    string 'type?;
    # A list of multi-language alternative tariff info texts
    DisplayText[] tariff_alt_text?;
    # URL to a web page that contains an explanation of the tariff information inhuman readable form
    string tariff_alt_url?;
    # The total cost of the session in the specified currency
    Price min_price?;
    # The total cost of the session in the specified currency
    Price max_price?;
    # An array of tariff elements
    TariffElement[] elements;
    # The time when this tariff becomes active, in UTC, time_zone field of theLocation can be used to convert to local time. Typically used for a new tariff that is already given with the location, before it becomes active.
    string start_date_time?;
    # The time after which this tariff is no longer valid, in UTC, time_zone field if theLocation can be used to convert to local time. Typically used when this tariff is going to be replaced with a different tariff in the near future.
    string end_date_time?;
    # Details on the energy supplied at this location
    EnergyMix energy_mix?;
    # Timestamp when this Tariff was last updated (or created)
    string last_updated;
};

# Information about a energy contract that belongs to a Token so a driver could use his/her own energy contract when charging at a Charge Point
public type EnergyContract record {
    # Name of the energy supplier for this token
    string supplier_name;
    # Contract ID at the energy supplier, that belongs to the owner of this token
    string contract_id?;
};

# Contains information about the authorization, if the Token is allowed to charge and optionally which EVSEs are allowed to be used.
public type AuthorizationInfo record {
    # Status of the Token, and whether charging is allowed at the optionally given location
    string allowed;
    # Represents a token information
    Token token;
    # References to location details.
    LocationReferences location?;
    # Reference to the authorization given by the eMSP. When the eMSP provided an authorization_reference in either- real-time authorization or StartSession, this field shall contain the same value. When different authorization_reference values havebeen given by the eMSP that are relevant to this Session, the lastgiven value shall be used here.
    string authorization_reference?;
    # A List of multi-language alternative tariff info texts
    DisplayText info?;
};

# OCPI response - `Tariff`
public type OcpiResponseTariff record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # Consists of a list of one or more Tariff Elements, which can be used to create complex Tariff structures.
    Tariff data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# OCPI response - CDR
public type OcpiResponseCDR record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # Charge detail record
    CDR data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# StopSession object, for the STOP_SESSION command, with information needed to stop a sessions.
public type StopSession record {
    # URL that the CommandResult POST should be sent to. This URL might contain an unique ID to be able to distinguish between StopSession requests.
    string response_url;
    # Session.id of the Session that is requested to be stopped
    string session_id;
};

# The total cost of the session in the specified currency
public type Price record {
    # Price/Cost excluding VAT
    float excl_vat;
    # Price/Cost including VAT
    float incl_vat;
};

# OPCI response  - `Tariff list`
public type OcpiResponseTariffList record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # An array of tariffs
    Tariff[] data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# The geo location of the Charge Point. The geodetic system to be used is WGS 84.
public type GeoLocation record {
    # Latitude of the point in decimal degree. Example- 50.770774. Decimal separator- "." Regex- -?[0-9]{1,2}\.[0-9]{5,7}
    string latitude;
    # Longitude of the point in decimal degree. Example- -126.104965. Decimal separator- "." Regex- -?[0-9]{1,3}\.[0-9]{5,7}
    string longitude;
};

# OCPI response  - `OCN Rules`
public type OcpiResponseOcnRules record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # OCN rules
    OcnRules data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# OCPI response  - `Session`
public type OcpiResponseSession record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # Describes one charging session
    Session data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

public type OcpiResponseListVersion record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    Version[] data?;
    # The time this message was generated
    string timestamp;
    string ocn_signature?;
};

# The socket or cable and plug available for the EV to use. A single EVSE may provide multiple Connectors but onlyone of them can be in use at the same time. A Connector always belongs to an EVSE object.
public type Connector record {
    # Identifier of the Connector within the EVSE. Two Connectors may have the same id as long as they do not belong to the same EVSE object
    string id;
    # The standard of the installed connector
    string standard;
    # The format (socket/cable) of the installed connector
    string format;
    # Power type
    string power_type;
    # Maximum voltage of the connector (line to neutral for AC_3_PHASE), in volt [V]. For example- DC Chargers might vary the voltage during charging when battery almost full
    int max_voltage;
    # Maximum amperage of the connector, in ampere [A]
    int max_amperage;
    # Maximum electric power that can be delivered by this connector, inWatts (W)
    int max_electric_power?;
    # Identifiers of the currently valid charging tariffs. Multiple tariffs are possible, but only one of each Tariff.type can be active at the same time.Tariffs with the same type are only allowed if they are not active at the same time- start_date_time and end_date_time period not overlapping.When preference-based smart charging is supported, one tariff forevery possible ProfileType should be provided. These tell the user aboutthe options they have at this Connector, and what the tariff is for every option.For a "free of charge" tariff, this field should be set and point to a defined "free of charge" tariff.
    string[] tariff_ids?;
    # URL to the operator’s terms and conditions
    string terms_and_conditions?;
    # Timestamp when this Connector was last updated (or created)
    string last_updated;
};

# The part that controls the power supply to a single EV in a single session
public type Evse record {
    # Uniquely identifies the EVSE within the CPO's platform (and sub operator platforms)
    string uid;
    # Compliant with the following specification for EVSE ID from "eMI3 standard version V1.0" (http://emi3group.com/documents-links/) "Part 2:business objects." Optional because- if an evse_id is to be re-used in the real world, the evse_id can be removed from an EVSE object if the status is set to REMOVED.
    string evse_id?;
    # Indicates the current status of the EVSE
    string status;
    # Indicates a planned status update of the EVSE
    StatusSchedule[] status_schedule?;
    # List of functionalities that the EVSE is capable of
    string[] capabilities?;
    # List of available connectors on the EVSE
    Connector[] connectors;
    # Level on which the Charge Point is located (in garage buildings) in the locally displayed numbering scheme.
    string floor_level?;
    # The geo location of the Charge Point. The geodetic system to be used is WGS 84.
    GeoLocation coordinates?;
    # A number/string printed on the outside of the EVSE for visual identification.
    string physical_reference?;
    # Multi-language human-readable directions when more detailed information on how to reach the EVSE from the Location is required.
    DisplayText[] directions?;
    # The restrictions that apply to the parking spot.
    string[] parking_restrictions?;
    # Links to images related to the EVSE such as photos or logos
    Image[] images?;
    # Timestamp when this EVSE or one of its Connectors was last updated(or created)
    string last_updated;
};

# OCN Rules List
public type OcnRulesList record {
    # Indicates the activations
    boolean active;
    # An array of OCN rules list parties
    OcnRulesListParty[] list;
};

# OCPI Tariff element
public type TariffElement record {
    # List of price components that describe the pricing of a tariff
    PriceComponent[] price_components;
    # These restrictions are not for the entire Charging Session. They only describe if and when a TariffElement becomes active or inactive during a Charging Session.
    TariffRestrictions restrictions?;
};

# Opening and access hours of the location
public type Hours record {
    # True to represent 24 hours a day and 7 days a week, except the givenexceptions.
    boolean twentyfourseven;
    # Regular recurring operation or access hours
    RegularHours regular_hours?;
    # Specifies one exceptional period for opening or access hour
    ExceptionalPeriod exceptional_openings?;
    # Specifies one exceptional period for opening or access hour
    ExceptionalPeriod exceptional_closings?;
};

# CDR location
public type CdrLocation record {
    # Uniquely identifies the location within the CPO’s platform (and sub operator platforms). This field can never be changed, modified or renamed
    string id;
    # Display name of the location
    string name?;
    # Street/block name and house number if available
    string address;
    # City or town
    string city;
    # Postal code of the location
    string postal_code;
    # ISO 3166-1 alpha-3 code for the country of this location
    string country;
    # The geo location of the Charge Point. The geodetic system to be used is WGS 84.
    GeoLocation coordinates;
    # Uniquely identifies the EVSE within the CPO’s platform (and sub operator platforms). For example a database unique ID or the actual EVSE ID. This field can never be changed, modified or renamed. This is the technical identification of the EVSE, not to be used as human readable identification, use the field:evse_id for that
    string evse_uid;
    # Compliant with the following specification for EVSE ID from "eMI3 standard version V1.0" (http://emi3group.com/documents-links/) "Part 2- business objects"
    string evse_id;
    # Identifier of the connector within the EVSE
    string connector_id;
    # The standard of the installed connector
    string connector_standard;
    # The format (socket/cable) of the installed connector
    string connector_format;
    # The power type of the connector
    string connector_power_type;
};

# Version details
public type VersionDetail record {
    # The version number
    string 'version;
    # An array of supported endpoints for this version
    Endpoint[] endpoints;
};

# OCPI response
public type OcpiResponse record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # Response data
    record {} data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# OCPI response - Unit
public type OcpiResponseUnit record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # Unit
    Unit data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# Object set to a CPO to set a Charging Profile
public type SetChargingProfile record {
    # A list of charging periods
    ChargingProfile charging_profile;
    # URL that the ChargingProfileResult POST should be send to. ThisURL might contain an unique ID to be able to distinguish between GET ActiveChargingProfile requests.
    string response_url;
};

# UnlockConnector object, for the UNLOCK_CONNECTOR command, with information needed to unlock a connector of a Charge Point.
public type UnlockConnector record {
    # URL that the CommandResult POST should be sent to. This URL might contain an unique ID to be able to distinguish between UnlockConnector requests.
    string response_url;
    # Location.id of the Location (belonging to the CPO this request is send to) of which it is requested to unlock the connector
    string location_id;
    # EVSE.uid of the EVSE of this Location of which it is requested to unlock the connector
    string evse_uid;
    # Connector.id of the Connector of this Location of which it is requested to unlock
    string connector_id;
};

# OCPI response charging profile response
public type OcpiResponseChargingProfileResponse record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # Response to the ChargingProfile request from the eMSP to the CPO
    ChargingProfileResponse data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# CDR Token details
public type CdrToken record {
    # Unique ID by which this Token can be identified.This is the field used by the CPO’s system (RFID reader on the Charge Point) to identify this token.Currently, in most cases- type=RFID, this is the RFID hidden ID as read by the RFID reader, but that is not a requirement. If this is a type=APP_USER Token, it will be a unique, by the eMSP, generatedID.
    string uid;
    # Type of the token
    string 'type;
    # Uniquely identifies the EV driver contract token within the eMSP’s platform (and sub operator platforms). Recommended to follow the specification for eMA ID from "eMI3 standard version V1.0" (http://emi3group.com/documents-links/)"Part 2- business objects."
    string contract_id;
};

# Amount of waste produced/emitted per kWh.
public type EnvironmentalImpact record {
    # The environmental impact category of this value
    string category;
    # Amount of this portion in g/kWh
    float amount;
};

# References to location details.
public type LocationReferences record {
    # Unique identifier for the location
    string location_id;
    # Unique identifiers for EVSEs within the CPO’s platform for the EVSE within the given location
    string[] evse_uids?;
    # Connector IDs
    string[] connector_ids?;
};

# OCPI response credentials detail
public type OcpiResponseCredentials record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # Credentials detail
    Credentials data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# OCPI response - `Charging preference reponse`
public type OcpiResponseChargingPreferencesResponse record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # Charging preference response data
    string data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# An additional geo location that is relevant for the Charge Point. The geodetic system to be used is WGS 84.
public type AdditionalGeoLocation record {
    # Latitude of the point in decimal degree. Example- 50.770774. Decimal separator- "." Regex- -?[0-9]{1,2}\.[0-9]{5,7}
    string latitude;
    # Longitude of the point in decimal degree. Example- -126.104965. Decimal separator- "." Regex- -?[0-9]{1,3}\.[0-9]{5,7}
    string longitude;
    # A List of multi-language alternative tariff info texts
    DisplayText name?;
};

# Details on the energy supplied at this location
public type EnergyMix record {
    # True if 100% from regenerative sources. (CO2 and nuclear waste is zero)
    boolean is_green_energy;
    # Key-value pairs (enum + percentage) of energy sources of this location’s tariff
    EnergySource[] energy_sources?;
    # Key-value pairs (enum + percentage) of nuclear waste and CO2exhaust of this location’s tariff
    EnvironmentalImpact[] environ_impact?;
    # Name of the energy supplier, delivering the energy for this location or tariff.*
    string supplier_name?;
    # Name of the energy suppliers product/tariff plan used at this location.*
    string energy_product_name?;
};

# OCPI response  - `Connector`
public type OcpiResponseConnector record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # The socket or cable and plug available for the EV to use. A single EVSE may provide multiple Connectors but onlyone of them can be in use at the same time. A Connector always belongs to an EVSE object.
    Connector data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# CDR dimension
public type CdrDimension record {
    # Type of CDR dimension
    string 'type;
    # Volume of the dimension consumed, measured according to the dimension type
    float volume;
};

# All the information of the signed data. Which encoding method is used, if needed, the public key and a list of signed values.
public type SignedData record {
    # The name of the encoding used in the SignedData field. This is the name given to the encoding by a company or group of companies.
    string encoding_method;
    # Version of the EncodingMethod (when applicable)
    int encoding_method_version?;
    # Public key used to sign the data, base64 encoded
    string public_key?;
    # One or more signed values
    SignedValue[] signed_values;
    # URL that can be shown to an EV driver. This URL gives the EV driver the possibility to check the signed data from a charging session
    string url;
};

# Specifies one exceptional period for opening or access hour
public type ExceptionalPeriod record {
    # Begin of the exception. In UTC, time_zone field can be used to convert to local time.
    string period_begin;
    # End of the exception. In UTC, time_zone field can be used to convert to local time.
    string period_end;
};

# This class contains the signed and the plain/unsigned data. By decoding the data, the receiver can check if the content has not been altered.
public type SignedValue record {
    # Nature of the value, in other words, the event this value belongs to.Possible values at moment of writing:- Start (value at the start of the Session)- End (signed value at the end of the Session)- Intermediate (signed values take during the Session, after Start, before End)Others might be added later.
    string nature;
    # The unencoded string of data. The format of the content depends on theEncodingMethod field.
    string plain_data;
    # Blob of signed data, base64 encoded. The format of the content depends on theEncodingMethod field.
    string signed_data;
};

# OCN rules
public type OcnRules record {
    # Signatures
    boolean signatures;
    # OCN Rules List
    OcnRulesList whitelist;
    # OCN Rules List
    OcnRulesList blacklist;
};

# A list of charging periods
public type ChargingProfile record {
    # Starting point of an absolute profile. If absent the profile will be relative to start of charging.
    string start_date_time?;
    # Duration of the charging profile in seconds. If the duration is left empty, the last period will continue in definitely or until end of the transaction in case startProfile is absent.
    int duration?;
    # The unit of measure
    string charging_rate_unit;
    # Minimum charging rate supported by the EV. The unit of measure is defined by the chargingRateUnit. This parameter is intended to be used by a local smart charging algorithm to optimize the power allocation for in the case a charging process is inefficient at lower charging rates. Accepts at most one digit fraction.
    float min_charging_rate?;
    # A list of ChargingProfilePeriod elements defining maximum power or current usage over time
    ChargingProfilePeriod[] charging_profile_period?;
};

# StartSession object, for the START_SESSION command, with information needed to start a sessions
public type StartSession record {
    # URL that the CommandResult POST should be sent to. This URL might contain an unique ID to be able to distinguish between StartSession requests.
    string response_url;
    # Represents a token information
    Token token;
    # Location.id of the Location (belonging to the CPO this request is send to) on which a session is to be started
    string location_id;
    # Optional EVSE.uid of the EVSE of this Location on which a session is to be started.
    string evse_uid?;
    # Reference to the authorization given by the eMSP, when given, this reference will be provided in the relevant Session and/or CDR.
    string authorization_reference?;
};

# Result of the command request, from the Charge Point
public type CommandResult record {
    # Result of the command request as sent by the Charge Point to the CPO.
    string result;
    # A List of multi-language alternative tariff info texts
    DisplayText message?;
};

# OCPI response  - `Authorization Information`
public type OcpiResponseAuthorizationInfo record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # Contains information about the authorization, if the Token is allowed to charge and optionally which EVSEs are allowed to be used.
    AuthorizationInfo data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# The charging profile as calculated by the EVSE.
public type ActiveChargingProfile record {
    # Date and time at which the Charge Point has calculated this ActiveChargingProfile. All time measurements within the profile are relative to this timestamp.
    string start_date_time;
    # A list of charging periods
    ChargingProfile charging_profile;
};

# OCPI response - `Token`
public type OcpiResponseToken record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # Represents a token information
    Token data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# A List of multi-language alternative tariff info texts
public type DisplayText record {
    # A language Code ISO 639-1
    string language;
    # Text to be displayed to a end user. No markup, html etc. allowed
    string text;
};

# OCPI response - `Token List`
public type OcpiResponseTokenList record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # An array of tokens
    Token[] data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# The cancel of an existing Reservation
public type CancelReservation record {
    # URL that the CommandResult POST should be send to. This URL might contain an unique ID to be able to distinguish between CancelReservation requests.
    string response_url;
    # Reservation id, unique for this reservation. If the Charge Point already has a reservation that matches this reservationId the Charge Point will replace the reservation.
    string reservation_id;
};

# OCPI response CDR List
public type OcpiResponseCDRList record {
    # OCPI status code, as listed in [Status Codes](https://evroaming.org/app/uploads/2020/06/OCPI-2.2-d2.pdf#status_codes_status_codes), indicates how the request was handled. To avoid confusion with HTTP codes, OCPI status codes consist of four digits.
    int status_code;
    # An optional status message which may help when debugging
    string status_message?;
    # An array of CDRs
    CDR[] data?;
    # The time this message was generated
    string timestamp;
    # OCN signature
    string ocn_signature?;
};

# Credentials detail
public type Credentials record {
    # Case Sensitive, ASCII only. The credentials token for the other party to authenticate in your system. Not encoded in Base64 or any other encoding.
    string token;
    # The URL to your API versions endpoint
    string url;
    # List of the roles this party provides
    CredentialsRole[] roles;
};

# The location and its properties where a group of EVSEs that belong together are installed
public type Location record {
    # ISO-3166 alpha-2 country code of the CPO that 'owns' thisLocation.
    string country_code;
    # CPO ID of the CPO that 'owns' this Location (following the ISO-15118 standard)
    string party_id;
    # Uniquely identifies the location within the CPO's platform (and sub operator platforms). This field can never be changed,modified or renamed
    string id;
    # Defines if a Location may be published on an website or app etc
    boolean publish;
    # This field may only be used when the publish field is set to false Only owners of Tokens that match all the set fields of one Publish Token in the list are allowed to be shown this location
    PublishTokenType[] publish_allowed_to?;
    # Display name of the location
    string name?;
    # Street/block name and house number if available
    string address;
    # City or town
    string city;
    # Postal code of the location, may only be omitted when the location has no postal code- in some countries charging locations at highways don’t have postal codes
    string postal_code?;
    # State or province of the location, only to be used when relevant
    string state?;
    # ISO 3166-1 alpha-3 code for the country of this location
    string country;
    # The geo location of the Charge Point. The geodetic system to be used is WGS 84.
    GeoLocation coordinates;
    # Geographical location of related points relevant to the user
    AdditionalGeoLocation[] related_locations?;
    # The general type of parking at the charge point location
    string parking_type?;
    # List of EVSEs that belong to this Location
    Evse[] evses?;
    # Human-readable directions on how to reach the location
    DisplayText[] directions?;
    # Details of a party
    BusinessDetails operator?;
    # Details of a party
    BusinessDetails suboperator?;
    # Details of a party
    BusinessDetails owner?;
    # Optional list of facilities this charging location directly belongsto.
    string[] facilities?;
    # One of IANA tzdata’s TZ-values representing the time zone of the location. Examples- "Europe/Oslo", "Europe/Zurich".(http://www.iana.org/time-zones)
    string time_zone?;
    # Opening and access hours of the location
    Hours opening_times?;
    # Indicates if the EVSEs are still charging outside the opening hours of the location. E.g. when the parking garage closes its barriers over night, is it allowed to charge till the next morning? Default- true
    string charging_when_closed?;
    # Links to images related to the location such as photos or logos
    Image[] images?;
    # Details on the energy supplied at this location
    EnergyMix energy_mix?;
    # Timestamp when this Location or one of its EVSEs orConnectors were last updated (or created)
    string last_updated;
};

# Defines the set of values that identify a token to which a Location might be published
public type PublishTokenType record {
    # Unique ID by which this Token can be identified
    string uid?;
    # Type of the token
    string 'type?;
    # Visual readable number/identification as printed on the Token (RFID card)
    string visual_number?;
    # Issuing company, most of the times the name of the company printed on the token (RFID card), not necessarily the eMSP
    string issuer?;
    # This ID groups a couple of tokens. This can be used to make two or more tokens work as one.
    string group_id?;
};

# Describes one charging session
public type Session record {
    # ISO-3166 alpha-2 country code of the CPO that 'owns' thisSession
    string country_code;
    # CPO ID of the CPO that 'owns' this Session (following the ISO-15118 standard)
    string party_id;
    # The unique id that identifies the charging session in the CPO platform
    string id;
    # The timestamp when the session became ACTIVE in the ChargePoint.When the session is still PENDING, this field shall be set to the time the Session was created at the Charge Point. When a Session goes from PENDING to ACTIVE, this field SHALL be update to the moment the Session went to ACTIVE in the Charge Point.
    string start_date_time;
    # The timestamp when the session was completed/finished, charging might have finished before the session ends, for example- EV is full,but parking cost also has to be paid.
    string end_date_time?;
    # How many kWh were charged
    float kwh;
    # CDR Token details
    CdrToken cdr_token;
    # Method used for authentication
    string auth_method;
    # Reference to the authorization given by the eMSP. When the eMSP provided an authorization_reference in either- real-time authorization or StartSession, this field SHALL contain the samevalue. When different authorization_reference values have been given by the eMSP that are relevant to this Session, the last given value SHALL be used here.
    string authorization_reference?;
    # Location.id of the Location object of this CPO, on which the charging session is/was happening.
    string location_id;
    # Location.id of the Location object of this CPO, on which the charging session is/was happening.
    string evse_uid;
    # Connector.id of the Connector of this Location the charging session is/was happening.
    string connector_id;
    # Optional identification of the kWh meter.
    string meter_id?;
    # ISO 4217 code of the currency used for this session
    string currency;
    # An optional list of Charging Periods that can be used to calculateand verify the total cost.
    ChargingPeriod[] charging_periods?;
    # The total cost of the session in the specified currency
    Price total_cost?;
    # The status of the session
    string status;
    # Timestamp when this Session was last updated (or created)
    string last_updated;
};
