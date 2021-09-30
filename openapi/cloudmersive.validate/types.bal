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

# IANA/Olsen time zone
public type Timezone record {
    # Name of the Time Zone
    string Name?;
    # UTC offset for this time zone
    string BaseUTCOffset?;
    # The current time (Now) in this time zone
    string Now?;
};

# Result of the GetGender operation
public type GetGenderResponse record {
    # True if successful, false otherwise
    boolean Successful?;
    # Gender for this name; possible values are Male, Female, and Neutral (can be applied to Male or Female)
    string Gender?;
};

# Result of performing a Bot check on an IP address
public type BotCheckResponse record {
    # True if the input IP address is a Bot or Robot, false otherwise
    boolean IsBot?;
};

# Result of performing a domain quality score operation
public type DomainQualityResponse record {
    # The quality score of the domain name; possible values are 0.0 to 10.0 with 10.0 being the highest and 0.0 being the lowest quality.
    float DomainQualityScore?;
};

# Result of checking a URL for SSRF threats
public type UrlSsrfResponseFull record {
    # True if the URL is clean, false if it is at risk of containing an SSRF threat or attack
    boolean CleanURL?;
    # Threat level of the URL; possible values are High, Medium, Low and None
    string ThreatLevel?;
};

# Input lead contact; fill in known fields to extend them with matched field values
public type LeadEnrichmentRequest record {
    # The person's business email address for the lead
    string ContactBusinessEmail?;
    # The person's first name for the lead
    string ContactFirstName?;
    # The person's last name for the lead
    string ContactLastName?;
    # Name of the company for the lead
    string CompanyName?;
    # Domain name / website for the lead
    string CompanyDomainName?;
    # House number of the address of the company for the lead
    string CompanyHouseNumber?;
    # Street name of the address of the company for the lead
    string CompanyStreet?;
    # City of the address of the company for the lead
    string CompanyCity?;
    # State or Province of the address of the company for the lead
    string CompanyStateOrProvince?;
    # Postal Code of the address of the company for the lead
    string CompanyPostalCode?;
    # Country of the address of the company for the lead
    string CompanyCountry?;
    # Country Code (2-letter ISO 3166-1) of the address of the company for the lead
    string CompanyCountryCode?;
    # Telephone of the company office for the lead
    string CompanyTelephone?;
    # VAT number of the company for the lead
    string CompanyVATNumber?;
};

# Result of a validation operation
public type CheckResponse record {
    # True if the domain name was valid, false if it is not
    boolean ValidDomain?;
};

# Request to determine if a URL is a safety threat check
public type UrlSafetyCheckRequestFull record {
    # URL to validate
    string URL?;
};

# Request to parse an address formatted as a string/free text into a structured address
public type ParseAddressRequest record {
    # A mailing address or street address formatted as a single text string; this will be parsed into its components
    string AddressString?;
    # Optional; indicates how the parsed output should be capitalized; default is Title Case; possible values are: "Uppercase" will set the capitalization to UPPER CASE; "Lowercase" will set the capitalization to lower case; "Titlecase" will set the capitalization to Title Case; and "Originalcase" will preserve the original casing as much as possible
    string CapitalizationMode?;
};

# Public holiday occurrence
public type PublicHolidayOccurrence record {
    # Name of the holiday in English
    string EnglishName?;
    # Local name of the holiday
    string LocalName?;
    # Date of the holiday (start time)
    string OccurrenceDate?;
    # Type of the holiday; possible values are: Public, Bank, School, Authorities, Optional, Observance
    string HolidayType?;
    # True if the holiday is celebrated in all locales in the country, false otherwise
    boolean Nationwaide?;
};

# Input to a VAT lookup request
public type VatLookupRequest record {
    # VAT code to lookup; example "CZ25123891"
    string VatCode?;
};

# Request to determine if a URL contains HTML-embedded SSRF threats
public type UrlHtmlSsrfRequestFull record {
    # URL to validate
    string URL?;
};

# Request to validate a last name
public type LastNameValidationRequest record {
    # Last name to process
    string LastName?;
};

# Result of enumerating available countries
public type CountryListResult record {
    # True if the operation was successful, false otherwise
    boolean Successful?;
    # List of current ISO 3166-1 countries in the world
    CountryDetails[] Countries?;
};

# Input parameter to a date time parsing request
public type DateTimeStandardizedParseRequest record {
    # Raw string input of a standard-formatted date and time for parsing
    string RawDateTimeInput?;
    # Optional: specify the two-letter country code to optimzie date formatting; default is US
    string CountryCode?;
};

# Input to a batch XSS protection operation
public type XssProtectionBatchRequest record {
    # Multiple items to protect for XSS
    XssProtectionRequestItem[] RequestItems?;
};

# Result of validating a URL with syntax only
public type ValidateUrlResponseSyntaxOnly record {
    # True if the URL is valid, false otherwise
    boolean ValidURL?;
    # Well-formed version of the URL
    string WellFormedURL?;
    # The top-level domain name of the URL, e.g. mydomain.com
    string TopLevelDomainName?;
};

# Result of checking a URL for Phishing threats
public type PhishingCheckResponse record {
    # True if the URL is clean, false if it is at risk of containing a Phishing threat or attack
    boolean CleanURL?;
    # Threat type of the Phishing threat; possible values are VerifiedPhishingURL, UnverifiedPhishingURL, or VerifiedPhishingDomain
    string ThreatType?;
};

# Input to a batch SQL Injection detection operation
public type SqlInjectionCheckBatchRequest record {
    # Multiple items to detect for SQL Injection
    SqlInjectionCheckRequestItem[] RequestItems?;
    # Set to Normal to target a high-security SQL Injection detection level with a very low false positive rate; select High to target a very-high security SQL Injection detection level with higher false positives.  Default is Normal (recommended).
    string DetectionLevel?;
};

# Current date and time response
public type DateTimeNowResult record {
    # True if successful, false otherwise
    boolean Successful?;
    # Current date, time, and time zone in standard JSON date format
    string Now?;
    # Current GMT-time-zone date, time, and time zone in standard JSON date format
    string NowGmt?;
};

# Result of performing a batch XSS protection operation
public type SqlInjectionCheckBatchResponse record {
    # Results from performing a batch SQL Injection detection operation; order is preserved from input data
    SqlInjectionDetectionResult[] ResultItems?;
};

# Request to Validate a City and State or Province in a country
public type ValidateCityRequest record {
    # Required: City of the address to validate, such as 'San Francisco' or 'London'
    string City?;
    # Required: State or province of the address to validate, such as 'California' or 'CA'
    string StateOrProvince?;
    # Optional (recommended); Name of the country, such as 'United States'.  If left blank, and CountryCode is also left blank, will default to United States.  Global countries are supported.
    string CountryFullName?;
    # Optional; two-letter country code (Two-letter ISO 3166-1 country code) of the country.  If left blank, and CountryFullName is also left blank, will default to United States.  Global countries are supported.
    string CountryCode?;
};

# Result of validating a state
public type ValidateStateResponse record {
    # True if the address is valid, false otherwise
    boolean ValidState?;
    # If valid; State or province corresponding to the input state name, such as 'CA' or 'California'
    string StateOrProvince?;
    # If the postal code is valid, the degrees latitude of the centroid of the state, null otherwise
    float? Latitude?;
    # If the postal code is valid, the degrees longitude of the centroid of the state, null otherwise
    float? Longitude?;
};

# Individual item to detect for XXE
public type XxeDetectionRequestItem record {
    # Individual input text item to protect from XXE
    string InputText?;
    # Optional: Set to true to allow Internet-based dependency URLs for DTDs and other XML External Entitites, set to false to block.  Default is false.
    boolean AllowInternetUrls?;
    # Optional: Comma separated list of fully-qualified URLs that will automatically be considered safe.
    string[] KnownSafeUrls?;
    # Optional: Comma separated list of fully-qualified URLs that will automatically be considered unsafe.
    string[] KnownUnsafeUrls?;
};

# Result of checking a URL for HTML-embedded SSRF threats
public type UrlHtmlSsrfResponseFull record {
    # True if the URL is clean, false if it is at risk of containing an SSRF threat or attack
    boolean CleanURL?;
    # HTTP response code from the URL
    int HttpResponseCode?;
};

# Result of performing a date time parsing
public type DateTimeStandardizedParseResponse record {
    # True if successful, false otherwise
    boolean Successful?;
    # Result of performing a date time parsing
    string ParsedDateResult?;
    # Year of the parsed date time result
    int Year?;
    # Month of the parsed date time result
    int Month?;
    # Day of the parsed date time result
    int Day?;
    # Hour of the parsed date time result (24-hour)
    int Hour?;
    # Minute of the parsed date time result
    int Minute?;
    # Second of the parsed date time result
    int Second?;
    # Day of week
    string DayOfWeek?;
};

# Request to Validate a Postal Code
public type ValidatePostalCodeRequest record {
    # Required: Zip code or postal code of the address to validate, such as '94597'
    string PostalCode?;
    # Optional (recommended); Name of the country, such as 'United States'.  If left blank, and CountryCode is also left blank, will default to United States.  Global countries are supported.
    string CountryFullName?;
    # Optional; two-letter country code (Two-letter ISO 3166-1 country code) of the country.  If left blank, and CountryFullName is also left blank, will default to United States.  Global countries are supported.
    string CountryCode?;
};

# Result of performing an SQL Injection protection operation
public type SqlInjectionDetectionResult record {
    # True if the operation was successful, false otherwise
    boolean Successful?;
    # True if the input contained SQL Injection attacks, false otherwise
    boolean ContainedSqlInjectionAttack?;
    # Original input string
    string OriginalInput?;
};

# Result of performing a Tor node check on an IP address
public type TorNodeResponse record {
    # True if the input IP address is a Tor exit node, false otherwise
    boolean IsTorNode?;
};

# Request to get time zones for a country
public type GetTimezonesRequest record {
    # Can be the two-letter, three-letter country codes or country name
    string CountryCodeOrName?;
};

# Result of a last name validation operation
public type LastNameValidationResponse record {
    # True if the validation operation was successful, false otherwise
    boolean Successful?;
    # Possible values are: ValidLastName, ValidUnknownLastName, InvalidSpamInput, InvalidCharacters, InvalidEmpty
    string ValidationResult?;
};

# Input parameter to a date time parsing request
public type DateTimeNaturalLanguageParseRequest record {
    # Raw string input of a natural language-formatted date and time for parsing
    string RawDateTimeInput?;
};

# Result of performing a get public holidays request operation
public type PublicHolidaysResponse record {
    # True if successful, false otherwise
    boolean Successful?;
    # Public holidays in the requested country and year
    PublicHolidayOccurrence[] PublicHolidays?;
};

# Result of a partial email address validation
public type AddressGetServersResponse record {
    # True if partial address validation was successufl, false otherwise
    boolean Success?;
    # Email servers for this email address
    string[] Servers?;
};

# Result of performing a Reverse Domain (DNS) lookup on an IP address
public type IPReverseDNSLookupResponse record {
    # True if a domain was found, false otherwise
    boolean Successful?;
    # Host name (fully-qualified) associated with the IP address, if any
    string HostName?;
};

# Request to validate a first name
public type FirstNameValidationRequest record {
    # First name to process
    string FirstName?;
};

# User-Agent parse and validation request
public type UserAgentValidateRequest record {
    # The user agent string you wish to parse and validate
    string UserAgentString?;
};

# Full email addresss validation result
public type FullEmailValidationResponse record {
    # True if the email address is valid overall, false otherwise
    boolean ValidAddress?;
    # Email server connected to for verification
    string MailServerUsedForValidation?;
    # True if the syntax of the email address is valid, false otherwise.  This is one component of ValidAddress, but not the only one.
    boolean Valid_Syntax?;
    # True if the domain name of the email address is valid, false otherwise.  This is one component of ValidAddress, but not the only one.
    boolean Valid_Domain?;
    # True if the email address was verified by the remote server, false otherwise.  This is one component of ValidAddress, but not the only one.
    boolean Valid_SMTP?;
    # True if the domain is a catch-all domain name, false otherwise.  Catch-all domain names, while rare, always accept inbound email to ensure they do not lose any potentially useful emails.  Catch-all domain names can occassionally be configured to first accept and store all inbound email, but then later send a bounce email back to the sender after a delayed period of time.
    boolean IsCatchallDomain?;
    # Domain name of the email address
    string Domain?;
    # True if the email domain name is a free provider (typically a free to sign up web email provider for consumers / personal use), false otherwise.
    boolean IsFreeEmailProvider?;
    # True if the email address is a disposable email address, false otherwise; these disposable providers are not typically used to receive email and so will have a low likelihood of opening mail sent there.
    boolean IsDisposable?;
};

# Result of performing a batch XSS protection operation
public type XssProtectionBatchResponse record {
    # Results from performing a batch XSS protection operation
    XssProtectionResult[] ResultItems?;
};

# Result of performing a country validation operation
public type ValidateCountryResponse record {
    # True if successful, false otherwise
    boolean Successful?;
    # Full name of the country
    string CountryFullName?;
    # Two-letter ISO 3166-1 country code
    string ISOTwoLetterCode?;
    # Two-letter FIPS 10-4 country code
    string FIPSTwoLetterCode?;
    # Three-letter ISO 3166-1 country code
    string ThreeLetterCode?;
    # True if this country is currently a member of the European Union (EU), false otherwise
    boolean IsEuropeanUnionMember?;
    # Time zones (IANA/Olsen) in the country
    Timezone[] Timezones?;
    # ISO 4217 currency three-letter code associated with the country
    string ISOCurrencyCode?;
    # Symbol associated with the currency
    string CurrencySymbol?;
    # Full name of the currency
    string CurrencyEnglishName?;
    # Region (continent) in which the country is located; possible values are None, Europe, Americas, Asia, Africa, Oceania
    string Region?;
    # Subregion in which the country is located; possible values are None, NorthernEurope, WesternEurope, SouthernEurope, EasternEurope, CentralAmerica, NorthernAmerica, SouthAmerica, EasternAfrica, MiddleAfrica, NorthernAfrica , SouthernAfrica , WesternAfrica , CentralAsia , EasternAsia , SouthernAsia , SouthEasternAsia , WesternAsia , Southern , Middle , AustraliaandNewZealand , Melanesia , Polynesia , Micronesia , Caribbean,
    string Subregion?;
};

# Geolocation result of performing an IP address geolocation operation.  This product includes GeoLite2 data created by MaxMind, available from www.maxmind.com.
public type GeolocateResponse record {
    # Two-letter country code of IP address
    string CountryCode?;
    # Country name of IP address
    string CountryName?;
    # City of IP address
    string City?;
    # State/region code of IP address
    string RegionCode?;
    # State/region of IP address
    string RegionName?;
    # Zip or postal code of IP address
    string ZipCode?;
    # Timezone of IP address
    string TimezoneStandardName?;
    # Latitude of IP address
    float Latitude?;
    # Longitude of IP address
    float Longitude?;
};

# Result of performing an XXE threat detection operation
public type HtmlSsrfDetectionResult record {
    # True if the operation was successful, false otherwise
    boolean Successful?;
    # True if the input contained SSRF threats, false otherwise
    boolean ContainedThreats?;
};

# Request to validate a phone number
public type PhoneNumberValidateRequest record {
    # Raw phone number string to parse as input for validation
    string PhoneNumber?;
    # Optional, default country code.  If left blank, will default to "US".
    string DefaultCountryCode?;
};

# Request to validate a full name string
public type FullNameValidationRequest record {
    # Full name to process as a free-form string; supports many components such as First Name, Middle Name, Last Name, Title, Nickname, Suffix, and Display Name
    string FullNameString?;
};

# Individual item to protect for SQL Injection
public type SqlInjectionCheckRequestItem record {
    # Individual input text item to check for SQL Injection
    string InputText?;
};

# Request to determine if a URL is valid
public type ValidateUrlRequestFull record {
    # URL to validate
    string URL?;
};

# Request to get the gender from a first name
public type GetGenderRequest record {
    # Input first name (given name) to get the gender of
    string FirstName?;
    # Optional; the country for this name, possible values are "US", "LY", "NI", "TT", "MK", "KZ", "BO", "UG", "TZ", "CL", "SI", "MA", "RW", "VN", "AW", "CY", "BH", "SG", "ZA", "MU", "BR", "TN", "KH", "US", "TH", "TW", "UY", "DO", "CO", "UA", "QA", "BY", "SN", "SD", "FJ", "LB", "BE", "ML", "LV", "FR", "TM", "NG", "EC", "NO", "SL", "CR", "PA", "GE", "CH", "KR", "RS", "ZM", "FI", "BF", "MC", "AU", "GA", "LS", "RU", "IN", "SE", "LK", "BZ", "MX", "GH", "AF", "TJ", "BN", "DZ", "CM", "GR", "MD", "HN", "AT", "NZ", "SV", "GW", "NA", "AR", "MZ", "PK", "MN", "IQ", "BW", "VE", "PT", "BS", "AL", "TG", "ID", "ET", "CF", "JP", "BB", "PH", "CU", "BD", "AO", "SM", "LC", "ME", "RO", "DA"  "NI", "LO", "ES", "EE", "IL", "ZW", "MW", "LU", "IR", "SC", "NL", "JO", "AM", "DE", "GL", "OM", "DK", "HR", "LI", "TD", "KM", "BA", "GM", "GD", "CA", "CZ", "MR", "ST", "IS", "LR", "IE", "VC", "AE", "KG", "DJ", "TR", "KE", "NE", "UZ", "CN", "GQ", "SK", "BJ", "MG", "BT", "EG", "PL", "IT", "SA", "MY", "CI", "AG", "AD", "KS", "HU", "CG", "KP", "DM", "GN", "GT", "NP", "JM", "LA", "GB", "BG", "HT", "PE", "AZ", "LT", "SZ", "PY", "MT", "VA", "SY"
    string CountryCode?;
};

# Result of performing a batch XXE detection operation
public type XxeDetectionBatchResponse record {
    # Results from performing a batch XSS protection operation
    XxeDetectionResult[] ResultItems?;
};

# Result of performing an identifier validation operation
public type ValidateIdentifierResponse record {
    # True if the input identifier is valid, false otherwise
    boolean ValidIdentifier?;
    # Resulting error from the identifier validation; possible errors are: "InputIsEmpty", "ContainsWhitespace", "ContainsNumbers", "ContainsHyphen", "ContainsUnderscore", "ContainsPeriod", "TooShort", "TooLong", "ContainsSpecialCharacters"
    string Error?;
};

# Request to determine if a URL is an SSRF threat check
public type UrlSsrfRequestFull record {
    # URL to validate
    string URL?;
    # Top level domains that you do not want to allow access to, e.g. mydomain.com - will block all subdomains as well
    string[] BlockedDomains?;
};

# Result of the lead enrichment process
public type LeadEnrichmentResponse record {
    # True if the operation was successful, false otherwise
    boolean Successful?;
    # The type of the lead; possible types are Junk (a single individual using a disposable/throwaway email address); Individual (a single individual, typically a consumer, not purchasing on behalf of a business); SmallBusiness (a small business, typically with fewer than 100 employees); MediumBusiness (a medium business, larger than 100 employees but fewer than 1000 employees); Enterprise (a large business with greater than 1000 employees); Business (a business customer of unknown size)
    string LeadType?;
    # The person's business email address for the lead
    string ContactBusinessEmail?;
    # The person's first name for the lead
    string ContactFirstName?;
    # The person's last name for the lead
    string ContactLastName?;
    # Gender for contact name; possible values are Male, Female, and Neutral (can be applied to Male or Female).  Requires ContactFirstName.
    string ContactGender?;
    # Name of the company for the lead
    string CompanyName?;
    # Domain name / website for the lead
    string CompanyDomainName?;
    # House number of the address of the company for the lead
    string CompanyHouseNumber?;
    # Street name of the address of the company for the lead
    string CompanyStreet?;
    # City of the address of the company for the lead
    string CompanyCity?;
    # State or Province of the address of the company for the lead
    string CompanyStateOrProvince?;
    # Postal Code of the address of the company for the lead
    string CompanyPostalCode?;
    # Country Name of the address of the company for the lead
    string CompanyCountry?;
    # Country Code (2-letter ISO 3166-1) of the address of the company for the lead
    string CompanyCountryCode?;
    # Telephone of the company office for the lead
    string CompanyTelephone?;
    # VAT number of the company for the lead
    string CompanyVATNumber?;
    # Count of employees at the company (estimated), if available
    int EmployeeCount?;
};

# Result from validating a phone number
public type PhoneNumberValidationResponse record {
    # True if the phone number is valid, false otherwise
    boolean IsValid?;
    # True if the operation was successful, false if there was an error during validation.  See IsValid for validation result.
    boolean Successful?;
    # Type of phone number; possible values are: FixedLine, Mobile, FixedLineOrMobile, TollFree, PremiumRate, 
    # SharedCost, Voip, PersonalNumber, Pager, Uan, Voicemail, Unknown
    string PhoneNumberType?;
    # E.164 format of the phone number
    string E164Format?;
    # Internaltional format of the phone number
    string InternationalFormat?;
    # National format of the phone number
    string NationalFormat?;
    # Two digit country code of the phone number
    string CountryCode?;
    # User-friendly long name of the country for the phone number
    string CountryName?;
};

# Batch operation to perform SSRF threat checks on multiple URLs
public type UrlSsrfRequestBatch record {
    # Input URLs to check for SSRF threats
    UrlSsrfRequestFull[] InputItems?;
};

# Result of validating a city
public type ValidateCityResponse record {
    # True if the city is valid, false otherwise
    boolean ValidCity?;
    # If valid, City corresponding to the input postal code, such as 'Walnut Creek'
    string City?;
    # If valid; State or province corresponding to the input state name, such as 'CA' or 'California'
    string StateOrProvince?;
    # If the postal code is valid, the degrees latitude of the centroid of the state, null otherwise
    float? Latitude?;
    # If the postal code is valid, the degrees longitude of the centroid of the state, null otherwise
    float? Longitude?;
};

# Geolocation street address result
public type GeolocateStreetAddressResponse record {
    # Two-letter country code of IP address
    string CountryCode?;
    # Country name of IP address
    string CountryName?;
    # Street address of IP address
    string StreetAddress?;
    # City of IP address
    string City?;
    # State/region of IP address
    string RegionName?;
    # Zip or postal code of IP address
    string ZipCode?;
};

# Result of reverse geocoding a street address
public type ReverseGeocodeAddressResponse record {
    # True if the address operation was successful, false otherwise
    boolean Successful?;
    # Street address to validate, such as '2950 Buskirk Ave.'
    string StreetAddress?;
    # City part of the addrerss to validate, such as 'Walnut Creek'
    string City?;
    # State or province of the address to validate, such as 'CA' or 'California'
    string StateOrProvince?;
    # Zip code or postal code of the address to validate, such as '94597'
    string PostalCode?;
    # Name of the country, such as 'United States'.  Global countries are supported.
    string CountryFullName?;
    # Three-letter ISO 3166-1 country code
    string CountryCode?;
};

# Result of parsing an address into its component parts
public type ParseAddressResponse record {
    # True if the parsing operation was successful, false otherwise
    boolean Successful?;
    # The name of the building, house or structure if applicable, such as "Cloudmersive Building 2".  This will often by null.
    string? Building?;
    # The street number or house number of the address.  For example, in the address "1600 Pennsylvania Avenue NW" the street number would be "1600".  This value will typically be populated for most addresses.
    string StreetNumber?;
    # The name of the street or road of the address.  For example, in the address "1600 Pennsylvania Avenue NW" the street number would be "Pennsylvania Avenue NW".
    string Street?;
    # The city of the address.
    string City?;
    # The state or province of the address.
    string StateOrProvince?;
    # The postal code or zip code of the address.
    string PostalCode?;
    # Country of the address, if present in the address.  If not included in the address it will be null.
    string? CountryFullName?;
    # Two-letter ISO 3166-1 country code
    string? ISOTwoLetterCode?;
};

# Result of performing a get time zones operation
public type GetTimezonesResponse record {
    # True if successful, false otherwise
    boolean Successful?;
    # Full name of the country
    string CountryFullName?;
    # Two-letter ISO 3166-1 country code
    string ISOTwoLetterCode?;
    # Two-letter FIPS 10-4 country code
    string FIPSTwoLetterCode?;
    # Three-letter ISO 3166-1 country code
    string ThreeLetterCode?;
    # Time zones (IANA/Olsen) in the country
    Timezone[] Timezones?;
};

public type VatLookupResponse record {
    # Two-letter country code
    string CountryCode?;
    # VAT number
    string VatNumber?;
    # True if the VAT code is valid, false otherwise
    boolean IsValid?;
    # Name of the business
    string BusinessName?;
    # Business address as a single string
    string BusinessAddress?;
    # For the business address, the name of the building, house or structure if applicable, such as "Cloudmersive Building 2".  This will often by null.
    string? BusinessBuilding?;
    # For the business address, the street number or house number of the address.  For example, in the address "1600 Pennsylvania Avenue NW" the street number would be "1600".  This value will typically be populated for most addresses.
    string BusinessStreetNumber?;
    # For the business address, the name of the street or road of the address.  For example, in the address "1600 Pennsylvania Avenue NW" the street number would be "Pennsylvania Avenue NW".
    string BusinessStreet?;
    # For the business address, the city of the address.
    string BusinessCity?;
    # For the business address, the state or province of the address.
    string BusinessStateOrProvince?;
    # For the business address, the postal code or zip code of the address.
    string BusinessPostalCode?;
    # For the business address, country of the address, if present in the address.  If not included in the address it will be null.
    string? BusinessCountry?;
};

# Input parameter to a country validation request
public type GetPublicHolidaysRequest record {
    # Two-letter code (FIPS 10-4 or ISO 3166-1) of the country; if not specified, defaults to United States
    string RawCountryInput?;
    # Optional - the year in which to retrieve the holidays; if left blank (0) it will default to the current year
    int Year?;
};

# IP address intelligence result
public type IPIntelligenceResponse record {
    # True if the IP address is a known bot, otherwise false
    boolean IsBot?;
    # True if the IP address is a known Tor exit node, otherwise false
    boolean IsTorNode?;
    # True if the IP address is a known threat IP, otherwise false
    boolean IsThreat?;
    # True if the IP address is in the European Union, otherwise false
    boolean IsEU?;
    # Geolocation result of performing an IP address geolocation operation.  This product includes GeoLite2 data created by MaxMind, available from www.maxmind.com.
    GeolocateResponse Location?;
    # ISO 4217 currency code for the IP address location
    string CurrencyCode?;
    # Name of the currency in English
    string CurrencyName?;
    # Region (continent) in which the country is located; possible values are None, Europe, Americas, Asia, Africa, Oceania
    string RegionArea?;
    # Subregion in which the country is located; possible values are None, NorthernEurope, WesternEurope, SouthernEurope, EasternEurope, CentralAmerica, NorthernAmerica, SouthAmerica, EasternAfrica, MiddleAfrica, NorthernAfrica , SouthernAfrica , WesternAfrica , CentralAsia , EasternAsia , SouthernAsia , SouthEasternAsia , WesternAsia , Southern , Middle , AustraliaandNewZealand , Melanesia , Polynesia , Micronesia , Caribbean,
    string SubregionArea?;
};

# Result of performing an XXE threat detection operation
public type XxeDetectionResult record {
    # True if the operation was successful, false otherwise
    boolean Successful?;
    # True if the input contained XXE threats, false otherwise
    boolean ContainedXxe?;
};

# Result of a full name validation operation
public type FullNameValidationResponse record {
    # True if the validation operation was successful, false otherwise
    boolean Successful?;
    # Possible values are: ValidFirstName, ValidUnknownFirstName, InvalidSpamInput, InvalidCharacters, InvalidEmpty
    string ValidationResult_FirstName?;
    # Possible values are: ValidLastName, ValidUnknownLastName, InvalidSpamInput, InvalidCharacters, InvalidEmpty
    string ValidationResult_LastName?;
    # The person's title (if supplied), e.g. "Mr." or "Ms."
    string Title?;
    # The first name (given name)
    string FirstName?;
    # The middle name(s); if there are multiple names they will be separated by spaces
    string MiddleName?;
    # The last name (surname)
    string LastName?;
    # Nickname (if supplied)
    string NickName?;
    # Suffix to the name, e.g. "Jr." or "Sr."
    string Suffix?;
    # The full display name of the name
    string DisplayName?;
};

# Result of a WHOIS operation
public type WhoisResponse record {
    # True if the domain is valid, false if it is not
    boolean ValidDomain?;
    # Name of the domain registrant
    string RegistrantName?;
    # Organization name of the domain registrant
    string RegistrantOrganization?;
    # Email address of the domain registrant
    string RegistrantEmail?;
    # Street number of the address of the domain registrant, if available
    string RegistrantStreetNumber?;
    # Street name of the address of the domain registrant, if available
    string RegistrantStreet?;
    # City of the domain registrant, if available
    string RegistrantCity?;
    # State or Province of the address of the domain registrant, if available
    string RegistrantStateOrProvince?;
    # Postal code of the address of the domain registrant, if available
    string RegistrantPostalCode?;
    # Country of the address of the domain registrant, if available
    string RegistrantCountry?;
    # Raw address string of the domain registrant, if available
    string RegistrantRawAddress?;
    # Telephone number of the address of the domain registrant
    string RegistrantTelephone?;
    # Server used to lookup WHOIS information (may change based on lookup).
    string WhoisServer?;
    # WHOIS raw text record
    string RawTextRecord?;
    # Creation date for the record
    string CreatedDt?;
};

# Result of validating a URL with full validation
public type ValidateUrlResponseFull record {
    # True if the URL has valid syntax, a valid domain, a valid endpoint, and passes virus scan checks; false otherwise
    boolean ValidURL?;
    # True if the URL has valid syntax, false otherwise
    boolean Valid_Syntax?;
    # True if the domain name is valid and exists, false otherwise
    boolean Valid_Domain?;
    # True if the endpoint is up and responsive and passes a virus scan check, false otherwise
    boolean Valid_Endpoint?;
    # Well-formed version of the URL
    string WellFormedURL?;
};

# Input to a batch XXE detection operation
public type XxeDetectionBatchRequest record {
    # Multiple items to protect for XXE
    XxeDetectionRequestItem[] RequestItems?;
};

# Result of performing a IP threat check on an IP address
public type IPThreatResponse record {
    # True if the input IP address is a threat, false otherwise
    boolean IsThreat?;
    # Specifies the type of IP threat; possible values include Blocklist, Botnet, WebBot
    string ThreatType?;
};

# Result of a first name validation operation
public type FirstNameValidationResponse record {
    # True if the validation operation was successful, false otherwise
    boolean Successful?;
    # Possible values are: ValidFirstName, ValidUnknownFirstName, InvalidSpamInput, InvalidCharacters, InvalidEmpty
    string ValidationResult?;
};

# Identifier validation request, including the input identifier as well as various identifier rules
public type ValidateIdentifierRequest record {
    # Text string identifier input
    string Input?;
    # True if whitespace is allowed in the identifier, false otherwise
    boolean AllowWhitespace?;
    # True if hyphens are allowd in the identifier, false otherwise
    boolean AllowHyphens?;
    # True if underscores are allowed in the identifier, false otherwise
    boolean AllowUnderscore?;
    # True if numbers are allowed in the identifier, false otherwise
    boolean AllowNumbers?;
    # True if periods are allowed in the identifier, false otherwise
    boolean AllowPeriods?;
    # Optional; maximum length, if any, of the identifier
    int MaxLength?;
    # Optional; minimum length, if any, of the identifier
    int MinLength?;
};

# Syntactic validity of email address
public type AddressVerifySyntaxOnlyResponse record {
    # True if the email address is syntactically valid, false if it is not
    boolean ValidAddress?;
    # Domain name of the email address
    string Domain?;
    # True if the email domain name is a free provider (typically a free to sign up web email provider for consumers / personal use), false otherwise.
    boolean IsFreeEmailProvider?;
    # True if the email address is a disposable email address, false otherwise; these disposable providers are not typically used to receive email and so will have a low likelihood of opening mail sent there.
    boolean IsDisposable?;
};

# Result of performing an XSS protection operation
public type XssProtectionResult record {
    # True if the operation was successful, false otherwise
    boolean Successful?;
    # True if the input contained XSS scripting, false otherwise
    boolean ContainedXss?;
    # Original input string
    string OriginalInput?;
    # Normalized string result, with XSS removed
    string NormalizedResult?;
};

# Result of checking a URL for safety threats
public type UrlSafetyCheckResponseFull record {
    # True if the URL is clean, false if it is at risk of containing a safety threat or attack
    boolean CleanURL?;
    # Threat type identified, if any; possible values are "ForcedDownload", "VirusesAndMalware", "Phishing"
    string ThreatType?;
};

# Request to determine if a URL is a Phishing threat
public type PhishingCheckRequest record {
    # URL to validate
    string URL?;
};

# Result of validating a street address
public type NormalizeAddressResponse record {
    # True if the address is valid, false otherwise
    boolean ValidAddress?;
    # The name of the building, house or structure if applicable, such as "Cloudmersive Building 2".  This will often by null.
    string? Building?;
    # The street number or house number of the address.  For example, in the address "1600 Pennsylvania Avenue NW" the street number would be "1600".  This value will typically be populated for most addresses.
    string StreetNumber?;
    # The name of the street or road of the address.  For example, in the address "1600 Pennsylvania Avenue NW" the street number would be "Pennsylvania Avenue NW".
    string Street?;
    # The city of the address.
    string City?;
    # The state or province of the address.
    string StateOrProvince?;
    # The postal code or zip code of the address.
    string PostalCode?;
    # Country of the address, if present in the address.  If not included in the address it will be null.
    string? CountryFullName?;
    # Two-letter ISO 3166-1 country code
    string ISOTwoLetterCode?;
    # If the address is valid, the degrees latitude of the validated address, null otherwise
    float? Latitude?;
    # If the address is valid, the degrees longitude of the validated address, null otherwise
    float? Longitude?;
};

# Request to Validate a State or Province in a country
public type ValidateStateRequest record {
    # Required: State or province of the address to validate, such as 'California' or 'CA'
    string StateOrProvince?;
    # Optional (recommended); Name of the country, such as 'United States'.  If left blank, and CountryCode is also left blank, will default to United States.  Global countries are supported.
    string CountryFullName?;
    # Optional; two-letter country code (Two-letter ISO 3166-1 country code) of the country.  If left blank, and CountryFullName is also left blank, will default to United States.  Global countries are supported.
    string CountryCode?;
};

# Result of performing SSRF threat checks on multiple URLs
public type UrlSsrfResponseBatch record {
    # Results of the operation, with indexes matched to input values
    UrlSsrfResponseFull[] OutputItems?;
};

# Individual item to protect for XSS
public type XssProtectionRequestItem record {
    # Individual input text item to protect from XSS
    string InputText?;
};

# Result of validating a postal code
public type ValidatePostalCodeResponse record {
    # True if the Postal Code is valid, false otherwise
    boolean ValidPostalCode?;
    # If valid, City corresponding to the input postal code, such as 'Walnut Creek'
    string City?;
    # If valid; State or province corresponding to the input postal code, such as 'CA' or 'California'
    string StateOrProvince?;
    # If the postal code is valid, the degrees latitude of the centroid of the postal code, null otherwise
    float? Latitude?;
    # If the postal code is valid, the degrees longitude of the centroid of the postal code, null otherwise
    float? Longitude?;
};

# Result of performing an Admin Path operation
public type IsAdminPathResponse record {
    # True if the input IP address is an Admin Path, and false otherwise
    boolean IsAdminPathNode?;
    # True if the operation was successful, false otherwise
    boolean Successful?;
};

# The result of a User-Agent validation request
public type UserAgentValidateResponse record {
    # True if the operation was successful, false otherwise
    boolean Successful?;
    # True if the request is a known robot, false otherwise
    boolean IsBot?;
    # Optional; name of the robot if the request was from a known robot, otherwise null
    string? BotName?;
    # Optional; if available, the URL to the robot
    string BotURL?;
    # Operating System of the User-Agent (e.g. Windows)
    string OperatingSystem?;
    # The CPU platform of the User-Agent (e.g. x64)
    string OperatingSystemCPUPlatform?;
    # The version of the operating system of the User-Agent (e.g. "10" for Windows 10)
    string OperatingSystemVersion?;
    # Device type of the User-Agent; possible values are "DESKTOP", "SMARTPHONE", "TABLET"
    string DeviceType?;
    # Brand name of the User-Agent
    string DeviceBrandName?;
    # Model name or number of the User-Agent
    string DeviceModel?;
    # Name of the Browser
    string BrowserName?;
    # Version of the Browser
    string BrowserVersion?;
    # Name of the Browser Engine
    string BrowserEngineName?;
    # Version of the Browser Engine
    string BrowserEngineVersion?;
};

# Request to determine if a URL is valid
public type ValidateUrlRequestSyntaxOnly record {
    # URL to validate
    string URL?;
};

# Input parameter to a country validation request
public type ValidateCountryRequest record {
    # Raw country input - can be a two-letter code (FIPS 10-4 or ISO 3166-1), three-letter code (ISO 3166-1) or country name
    string RawCountryInput?;
};

# Request to reverse geocode a Street Address
public type ReverseGeocodeAddressRequest record {
    # Latitude coordinate in WGS84 format
    float Latitude?;
    # Longitude coordinate in WGS84 format
    float Longitude?;
};

# Result of validating a street address
public type ValidateAddressResponse record {
    # True if the address is valid, false otherwise
    boolean ValidAddress?;
    # If the address is valid, the degrees latitude of the validated address, null otherwise
    float? Latitude?;
    # If the address is valid, the degrees longitude of the validated address, null otherwise
    float? Longitude?;
};

# Details of one country
public type CountryDetails record {
    # Name of the country
    string CountryName?;
    # Three-letter ISO 3166-1 country code
    string ThreeLetterCode?;
    # Two-letter ISO 3166-1 country code
    string ISOTwoLetterCode?;
    # True if this country is currently a member of the European Union (EU), false otherwise
    boolean IsEuropeanUnionMember?;
    # ISO 4217 currency three-letter code associated with the country
    string ISOCurrencyCode?;
    # Symbol associated with the currency
    string CurrencySymbol?;
    # Full name of the currency
    string CurrencyEnglishName?;
    # Region (continent) in which the country is located; possible values are None, Europe, Americas, Asia, Africa, Oceania
    string Region?;
    # Subregion in which the country is located; possible values are None, NorthernEurope, WesternEurope, SouthernEurope, EasternEurope, CentralAmerica, NorthernAmerica, SouthAmerica, EasternAfrica, MiddleAfrica, NorthernAfrica , SouthernAfrica , WesternAfrica , CentralAsia , EasternAsia , SouthernAsia , SouthEasternAsia , WesternAsia , Southern , Middle , AustraliaandNewZealand , Melanesia , Polynesia , Micronesia , Caribbean,
    string Subregion?;
};

# Request to Validate a Street Address
public type ValidateAddressRequest record {
    # Required; Street address to validate, such as '2950 Buskirk Ave.'
    string StreetAddress?;
    # Required; City part of the addrerss to validate, such as 'Walnut Creek'
    string City?;
    # Required; State or province of the address to validate, such as 'CA' or 'California'
    string StateOrProvince?;
    # Optional (recommended); Zip code or postal code of the address to validate, such as '94597'
    string PostalCode?;
    # Optional (recommended); Name of the country, such as 'United States'.  If left blank, and CountryCode is also left blank, will default to United States.  Global countries are supported.
    string CountryFullName?;
    # Optional; two-letter country code (Two-letter ISO 3166-1 country code) of the country.  If left blank, and CountryFullName is also left blank, will default to United States.  Global countries are supported.
    string CountryCode?;
};
