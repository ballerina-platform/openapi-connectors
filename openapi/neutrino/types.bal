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

# Map containing timezone details
public type Timezone record {
    # The time zone ID as per the IANA time zone database (tzdata)
    string? id;
    # The full time zone name
    string? name;
    # The time zone abbreviation
    string? abbr;
    # The current date at the time zone (ISO 8601 format 'YYYY-MM-DD')
    string? date;
    # The current time at the time zone (ISO 8601 format 'hh:mm:ss.sss')
    string? time;
};

public type GeocodeAddressResponse record {
    # The number of possible matching locations found
    int? found;
    # Array of matching location objects
    Location[]? locations;
};

public type IpblocklistBody record {
    # The output case style
    string? 'output\-case;
    # An IPv4 or IPv6 address
    string? ip;
    # Include public VPN provider IP addresses. <br> <b>NOTE</b>: For more advanced VPN detection including the ability to identify private and stealth VPNs use the <a href="https://www.neutrinoapi.com/api/ip-probe/">IP Probe API</a>
    boolean? 'vpn\-lookup = false;
};

public type PhoneplaybackBody record {
    # The output case style
    string? 'output\-case;
    # The phone number to call. Must be in valid international format
    string? number;
    # A URL to a valid audio file. Accepted audio formats are: <ul> <li>MP3</li> <li>WAV</li> <li>OGG</li> </ul>You can use the following MP3 URL for testing: <br>https://www.neutrinoapi.com/test-files/test1.mp3
    string? 'audio\-url;
    # Limit the total number of calls allowed to the supplied phone number, if the limit is reached error code 14 will be returned (0 means no limit)
    int? 'limit = 3;
    # Set the TTL in number of days that the 'limit' option will remember a phone number (the default is 1 day and the maximum is 365 days)
    int? 'limit\-ttl = 1;
};

public type ConvertBody record {
    # The output case style
    string? 'output\-case;
    # The value to convert from (e.g. 10.95)
    string? 'from\-value;
    # The type of the value to convert from (e.g. USD)
    string? 'from\-type;
    # The type to convert to (e.g. EUR)
    string? 'to\-type;
};

public type PhoneValidateResponse record {
    # Is this a valid phone number
    boolean? valid;
    # The international calling code
    int? internationalCallingCode;
    # The phone number country as an ISO 2-letter country code
    string? countryCode;
    # The phone number location. Could be the city, region or country depending on the type of number
    string? location;
    # True if this is a mobile number. If the number type is unknown this value will be false
    boolean? isMobile;
    # The number type based on the number prefix. <br>Possible values are: <br> <ul> <li>mobile</li> <li>fixed-line</li> <li>premium-rate</li> <li>toll-free</li> <li>voip</li> <li>unknown (use HLR lookup)</li> </ul>
    string? 'type;
    # The number represented in full international format (E.164)
    string? internationalNumber;
    # The number represented in local dialing format
    string? localNumber;
    # The phone number country
    string? country;
    # The phone number country as an ISO 3-letter country code
    string? countryCode3;
    # ISO 4217 currency code associated with the country
    string? currencyCode;
    # The network/carrier who owns the prefix (this only works for some countries, use HLR lookup for global network detection)
    string? prefixNetwork;
};

public type PhonePlaybackResponse record {
    # True if the call is being made now
    boolean? calling;
    # True if this a valid phone number
    boolean? numberValid;
};

public type HlrlookupBody record {
    # The output case style
    string? 'output\-case;
    # A phone number
    string? number;
    # ISO 2-letter country code, assume numbers are based in this country. <br>If not set numbers are assumed to be in international format (with or without the leading + sign)
    string? 'country\-code?;
};

public type HtmlcleanBody record {
    # The HTML content. This can be either a URL to load from, a file upload or an HTML content string
    string? content;
    # The level of sanitization, possible values are: <br> <b>plain-text</b>: reduce the content to plain text only (no HTML tags at all) <br> <br> <b>simple-text</b>: allow only very basic text formatting tags like b, em, i, strong, u <br> <br> <b>basic-html</b>: allow advanced text formatting and hyper links <br> <br> <b>basic-html-with-images</b>: same as basic html but also allows image tags <br> <br> <b>advanced-html</b>: same as basic html with images but also allows many more common HTML tags like table, ul, dl, pre <br>
    string? 'output\-type;
};

public type BinlistdownloadBody record {
    # Include ISO 3-letter country codes and ISO 3-letter currency codes in the data. These will be added to columns 10 and 11 respectively
    boolean? 'include\-iso3?;
    # Include 8-digit and higher BIN codes. Use this option if you want to download BINs with more than 6-digits
    boolean? 'include\-8digit?;
};

public type GeocodeReverseResponse record {
    # The country of the location
    string? country;
    # True if these coordinates map to a real location
    boolean? found;
    # The fully formatted address
    string? address;
    # The city of the location
    string? city;
    # The ISO 2-letter country code of the location
    string? countryCode;
    # The postal code for the location
    string? postalCode;
    # The state of the location
    string? state;
    # The components which make up the address such as road, city, state, etc
    record {} addressComponents;
    # The ISO 3-letter country code of the location
    string? countryCode3;
    # ISO 4217 currency code associated with the country
    string? currencyCode;
    # The detected location type ordered roughly from most to least precise, possible values are: <br> <ul> <li>address - indicates a precise street address</li> <li>street - accurate to the street level but may not point to the exact location of the house/building number</li> <li>city - accurate to the city level, this includes villages, towns, suburbs, etc</li> <li>postal-code - indicates a postal code area (no house or street information present)</li> <li>railway - location is part of a rail network such as a station or railway track</li> <li>natural - indicates a natural feature, for example a mountain peak or a waterway</li> <li>island - location is an island or archipelago</li> <li>administrative - indicates an administrative boundary such as a country, state or province</li> </ul>
    string? locationType;
    # Array of strings containing any location tags associated with the address. Tags are additional pieces of metadata about a specific location, there are thousands of different tags. Some examples of tags: shop, office, cafe, bank, pub
    string[]? locationTags;
    # The location latitude
    decimal? latitude;
    # The location longitude
    decimal? longitude;
    # Map containing timezone details for the location
    record {} timezone;
};

public type EmailValidateResponse record {
    # Is this a valid email
    boolean? valid;
    # True if this address has a syntax error
    boolean? syntaxError;
    # The email domain
    string? domain;
    # True if this address has a domain error (e.g. no valid mail server records)
    boolean? domainError;
    # True if this address is a free-mail address
    boolean? isFreemail;
    # The email address. If you have used the fix-typos option then this will be the fixed address
    string? email;
    # True if this address is a disposable, temporary or darknet related email address
    boolean? isDisposable;
    # True if typos have been fixed
    boolean? typosFixed;
    # True if this address belongs to a person. False if this is a role based address, e.g. admin@, help@, office@, etc.
    boolean? isPersonal;
    # The email service provider domain
    string? provider;
};

public type Blacklist record {
    # True if the host is currently black-listed
    boolean? isListed;
    # The hostname of the DNSBL
    string? listHost;
    # The list rating [1-3] with 1 being the best rating and 3 the lowest rating
    int? listRating;
    # The name of the DNSBL
    string? listName;
    # The TXT record returned for this listing (only set if listed)
    string? txtRecord;
    # The specific return code for this listing (only set if listed)
    string? returnCode;
    # The DNSBL server response time in milliseconds
    int? responseTime;
};

public type HostreputationBody record {
    # The output case style
    string? 'output\-case;
    # An IP address, domain name, FQDN or URL. <br>If you supply a domain/URL it will be checked against the URI DNSBL lists
    string? host;
    # Only check lists with this rating or better
    int? 'list\-rating = 3;
};

public type APIError record {
    # API error code. If set and > 0 then an API error has occurred your request could not be completed
    int? apiError;
    # API error message
    string? apiErrorMsg;
};

public type SmsmessageBody record {
    # The output case style
    string? 'output\-case;
    # The phone number to send a message to
    string? number;
    # The SMS message to send. Messages are truncated to a maximum of 150 characters for ASCII content OR 70 characters for UTF content
    string? message;
    # ISO 2-letter country code, assume numbers are based in this country. <br>If not set numbers are assumed to be in international format (with or without the leading + sign)
    string? 'country\-code?;
    # Limit the total number of SMS allowed to the supplied phone number, if the limit is reached error code 14 will be returned (the default is no limit)
    int? 'limit = 0;
    # Set the TTL in number of days that the 'limit' option will remember a phone number (the default is 1 day and the maximum is 365 days)
    int? 'limit\-ttl = 1;
};

public type UrlinfoBody record {
    # The output case style
    string? 'output\-case;
    # The URL to probe
    string? url;
    # If this URL responds with html, text, json or xml then return the response. This option is useful if you want to perform further processing on the URL content (e.g. with the HTML Extract or HTML Clean APIs)
    boolean? 'fetch\-content = false;
    # Ignore any TLS/SSL certificate errors and load the URL anyway
    boolean? 'ignore\-certificate\-errors = false;
    # Timeout in seconds. Give up if still trying to load the URL after this number of seconds
    int? timeout = 60;
    # If the request fails for any reason try again this many times
    int? 'retry = 0;
};

public type SMSVerifyResponse record {
    # True if this a valid phone number
    boolean? numberValid;
    # The security code generated, you can save this code to perform your own verification or you can use the <a href="https://www.neutrinoapi.com/api/verify-security-code/">Verify Security Code API</a>
    string? securityCode;
    # True if the SMS has been sent
    boolean? sent;
};

public type VerifysecuritycodeBody record {
    # The output case style
    string? 'output\-case;
    # The security code to verify
    string? 'security\-code;
    # If set then enable additional brute-force protection by limiting the number of attempts by the supplied value. This can be set to any unique identifier you would like to limit by, for example a hash of the users email, phone number or IP address. Requests to this API will be ignored after approximately 10 failed verification attempts
    string? 'limit\-by?;
};

public type UserAgentInfoResponse record {
    # The estimated mobile device screen width in CSS 'px'
    int? mobileScreenWidth;
    # The mobile device brand
    string? mobileBrand;
    # The mobile device model
    string? mobileModel;
    # The producer or manufacturer of the user agent
    string? producer;
    # The browser software name
    string? browserName;
    # The estimated mobile device screen height in CSS 'px'
    int? mobileScreenHeight;
    # True if this is a mobile user agent
    boolean? isMobile;
    # The user agent type, possible values are: <br> <ul> <li>desktop-browser</li> <li>mobile-browser</li> <li>email-client</li> <li>feed-reader</li> <li>software-library</li> <li>media-player (includes smart TVs)</li> <li>robot</li> <li>unknown</li> </ul>
    string? 'type;
    # The browser software version
    string? 'version;
    # The full operating system name which may include the major version number or code name
    string? operatingSystem;
    # The mobile device browser name (this is usually the same as the browser name)
    string? mobileBrowser;
    # True if this is an Android based mobile user agent
    boolean? isAndroid;
    # True if this is an iOS based mobile user agent
    boolean? isIos;
    # The operating system family name, this is the OS name without any version information
    string? operatingSystemFamily;
    # The operating system version number (if detectable)
    string? operatingSystemVersion;
    # The browser engine name
    string? engine;
    # The browser engine version (if detectable)
    string? engineVersion;
};

public type BrowserbotBody record {
    # The output case style
    string? 'output\-case;
    # The URL to load
    string? url;
    # Timeout in seconds. Give up if still trying to load the page after this number of seconds
    int? timeout = 30;
    # Delay in seconds to wait before capturing any page data, executing selectors or JavaScript
    int? delay = 3;
    # Extract content from the page DOM using this selector. Commonly known as a CSS selector, you can find a good reference <a href="https://www.w3schools.com/cssref/css_selectors.asp">here</a>
    string? selector?;
    # Execute JavaScript on the page, each array element should contain a valid JavaScript statement. If a statement returns any kind of value it will be returned in the 'exec-results' response. You can also use the following special user interaction functions: <br> <br> <div> sleep(seconds); Just wait/sleep for the specified number of seconds. <br>click('selector'); Click on the first element matching the given selector. <br>focus('selector'); Focus on the first element matching the given selector. <br>keys('characters'); Send the specified keyboard characters. Use click() or focus() first to send keys to a specific element. <br>enter(); Send the Enter key. <br>tab(); Send the Tab key. <br> </div>
    string[]? exec = [];
    # Override the browsers default user-agent string with this one
    string? 'user\-agent?;
    # Ignore any TLS/SSL certificate errors and load the page anyway
    boolean? 'ignore\-certificate\-errors = false;
};

public type HostReputationResponse record {
    # Is this host blacklisted
    boolean? isListed;
    # Array of objects for each DNSBL checked
    Blacklist[]? lists;
    # The number of DNSBLs the host is listed on
    int? listCount;
    # The IP address or host name
    string? host;
};

public type BINLookupResponse record {
    # The full country name of the issuer
    string? country;
    # The city of the customers IP (if detectable)
    string? ipCity;
    # True if the customers IP country matches the BIN country
    boolean? ipMatchesBin;
    # The card type, will always be one of: DEBIT, CREDIT, CHARGE CARD
    string? cardType;
    # The card category. There are many different card categories the most common card categories are: CLASSIC, BUSINESS, CORPORATE, PLATINUM, PREPAID
    string? cardCategory;
    # The ISO 2-letter country code of the customers IP
    string? ipCountryCode;
    # The country of the customers IP
    string? ipCountry;
    # The card issuer
    string? issuer;
    # True if the customers IP is listed on one of our blocklists, see the <a href="http://www.neutrinoapi.com/api/ip-blocklist/">IP Blocklist API</a>
    boolean? ipBlocklisted;
    # Is this a valid BIN or IIN number
    boolean? valid;
    # An array of strings indicating which blocklists this IP is listed on
    string[]? ipBlocklists;
    # The card issuers website
    string? issuerWebsite;
    # The ISO 2-letter country code of the issuer
    string? countryCode;
    # The region of the customers IP (if detectable)
    string? ipRegion;
    # The card brand (e.g. Visa or Mastercard)
    string? cardBrand;
    # The card issuers phone number
    string? issuerPhone;
    # The ISO 3-letter country code of the issuer
    string? countryCode3;
    # ISO 4217 currency code associated with the country of the issuer
    string? currencyCode;
    # The ISO 3-letter country code of the customers IP
    string? ipCountryCode3;
    # Is this a commercial/business use card
    boolean? isCommercial;
    # Is this a prepaid or prepaid reloadable card
    boolean? isPrepaid;
};

public type GeocodeaddressBody record {
    # The output case style
    string? 'output\-case;
    # The full address, partial address or name of a place to try and locate. Comma separated address components are preferred.
    string? address?;
    # The house/building number to locate
    string? 'house\-number?;
    # The street/road name to locate
    string? street?;
    # The city/town name to locate
    string? city?;
    # The county/region name to locate
    string? county?;
    # The state name to locate
    string? state?;
    # The postal code to locate
    string? 'postal\-code?;
    # Limit result to this country (the default is no country bias)
    string? 'country\-code?;
    # The language to display results in, available languages are: <ul> <li>de, en, es, fr, it, pt, ru, zh</li> </ul>
    string? 'language\-code = "en";
    # If no matches are found for the given address, start performing a recursive fuzzy search until a geolocation is found. This option is recommended for processing user input or implementing auto-complete. We use a combination of approximate string matching and data cleansing to find possible location matches
    boolean? 'fuzzy\-search = false;
};

public type ConvertResponse record {
    # True if the coversion was successful and produced a valid result
    boolean? valid;
    # The result of the conversion in string format
    string? result;
    # The value being converted from
    string? fromValue;
    # The type being converted to
    string? toType;
    # The type of the value being converted from
    string? fromType;
    # The result of the conversion as a floating-point number
    decimal? resultFloat;
};

public type BinlookupBody record {
    # The output case style
    string? 'output\-case;
    # The BIN or IIN number. This is the first 6, 8 or 10 digits of a card number, use 8 (or more) digits for the highest level of accuracy
    string? 'bin\-number;
    # Pass in the customers IP address and we will return some extra information about them
    string? 'customer\-ip?;
};

public type EmailverifyBody record {
    # The output case style
    string? 'output\-case;
    # An email address
    string? email;
    # Automatically attempt to fix typos in the address
    boolean? 'fix\-typos = false;
};

public type IpinfoBody record {
    # The output case style
    string? 'output\-case;
    # IPv4 or IPv6 address
    string? ip;
    # Do a reverse DNS (PTR) lookup. This option can add extra delay to the request so only use it if you need it
    boolean? 'reverse\-lookup = false;
};

public type PhonevalidateBody record {
    # The output case style
    string? 'output\-case;
    # A phone number. This can be in international format (E.164) or local format. If passing local format you must also set either the 'country-code' OR 'ip' options as well
    string? number;
    # ISO 2-letter country code, assume numbers are based in this country. If not set numbers are assumed to be in international format (with or without the leading + sign)
    string? 'country\-code?;
    # Pass in a users IP address and we will assume numbers are based in the country of the IP address
    string? ip?;
};

public type URLInfoResponse record {
    # The HTTP status message assoicated with the status code
    int? httpStatusMessage;
    # The servers IP geo-location: full region name (if detectable)
    string? serverRegion;
    # A key-value map of the URL query paramaters
    record {} query;
    # The name of the server software hosting this URL
    string? serverName;
    # The URL port
    int? urlPort;
    # The servers IP geo-location: full country name
    string? serverCountry;
    # Is this URL actually serving real content
    boolean? real;
    # The servers IP geo-location: full city name (if detectable)
    string? serverCity;
    # The URL path
    string? urlPath;
    # The fully qualified URL. This may be different to the URL requested if http-redirect is true
    string? url;
    # Is this a valid well-formed URL
    boolean? valid;
    # The servers hostname (PTR record)
    string? serverHostname;
    # The time taken to load the URL content in seconds
    decimal? loadTime;
    # True if this URL responded with an HTTP OK (200) status
    boolean? httpOk;
    # The size of the URL content in bytes
    int? contentSize;
    # The HTTP status code this URL responded with. An HTTP status of 0 indicates a network level issue
    int? httpStatus;
    # The servers IP geo-location: ISO 2-letter country code
    string? serverCountryCode;
    # The encoding format the URL uses
    string? contentEncoding;
    # The IP address of the server hosting this URL
    string? serverIp;
    # The URL protocol, usually http or https
    string? urlProtocol;
    # The content-type this URL serves
    string? contentType;
    # True if this URL responded with an HTTP redirect
    boolean? httpRedirect;
    # The actual content this URL responded with. Only set if the 'fetch-content' option was used
    string? content;
    # True if a timeout occurred while loading the URL. You can set the timeout with the request parameter 'timeout'
    boolean? isTimeout;
    # The document title
    string? title;
    # The ISO 2-letter language code of the page. Extracted from either the HTML document or via HTTP headers
    string? languageCode;
    # True if an error occurred while loading the URL. This includes network errors, TLS errors and timeouts
    boolean? isError;
};

public type IpprobeBody record {
    # The output case style
    string? 'output\-case;
    # IPv4 or IPv6 address
    string? ip;
};

public type IPInfoResponse record {
    # True if this is a valid IPv4 or IPv6 address
    boolean? valid;
    # Full country name
    string? country;
    # The IPs full hostname (only set if reverse-lookup has been used)
    string? hostname;
    # Name of the city (if detectable)
    string? city;
    # ISO 2-letter country code
    string? 'country\-code;
    # Location latitude
    decimal? latitude;
    # Name of the region (if detectable)
    string? region;
    # Location longitude
    decimal? longitude;
    # ISO 2-letter continent code
    string? 'continent\-code;
    # The IP address
    string? ip;
    # ISO 3-letter country code
    string? 'country\-code3;
    # ISO 4217 currency code associated with the country
    string? 'currency\-code;
    # The IPs host domain (only set if reverse-lookup has been used)
    string? 'host\-domain;
    # Map containing timezone details for the location
    record {} timezone;
    # True if this is a IPv6 address. False if IPv4
    boolean? 'is\-v6;
    # True if this is a <a href="https://en.wikipedia.org/wiki/IPv6#IPv4-mapped_IPv6_addresses">IPv4 mapped IPv6 address</a>
    boolean? 'is\-v4\-mapped;
    # True if this is a bogon IP address such as a private network, local network or reserved address
    boolean? 'is\-bogon;
};

public type BrowserBotResponse record {
    # The page URL
    string? url;
    # The complete raw, decompressed and decoded page content. Usually will be either HTML, JSON or XML
    string? content;
    # The document MIME type
    string? mimeType;
    # The document title
    string? title;
    # True if an error has occurred loading the page. Check the 'error-message' field for details
    boolean? isError;
    # True if a timeout occurred while loading the page. You can set the timeout with the request parameter 'timeout'
    boolean? isTimeout;
    # Contains the error message if an error has occurred ('is-error' will be true)
    string? errorMessage;
    # The HTTP status code the URL returned
    int? httpStatusCode;
    # The HTTP status message the URL returned
    string? httpStatusMessage;
    # True if the HTTP status is OK (200)
    boolean? isHttpOk;
    # True if the URL responded with an HTTP redirect
    boolean? isHttpRedirect;
    # The redirected URL if the URL responded with an HTTP redirect
    string? httpRedirectUrl;
    # The HTTP servers IP address
    string? serverIp;
    # The number of seconds taken to load the page (from initial request until DOM ready)
    decimal? loadTime;
    # Map containing all the HTTP response headers the URL responded with
    record {} responseHeaders;
    # True if the page is secured using TLS/SSL
    boolean? isSecure;
    # Map containing details of the TLS/SSL setup
    record {} securityDetails;
    # Array containing all the elements matching the supplied selector. <br>Each element object will contain the text content, HTML content and all current element attributes
    string[]? elements;
    # If you executed any JavaScript this array holds the results as objects
    string[]? execResults;
    # The ISO 2-letter language code of the page. Extracted from either the HTML document or via HTTP headers
    string? languageCode;
};

public type VerifySecurityCodeResponse record {
    # True if the code is valid
    boolean? verified;
};

public type UseragentinfoBody record {
    # The output case style
    string? 'output\-case;
    # A user agent string
    string? 'user\-agent;
};

public type IPBlocklistResponse record {
    # The IP address
    string? ip;
    # IP is hosting a malicious bot or is part of a botnet. Includes brute-force crackers
    boolean? isBot;
    # IP is hosting an exploit finding bot or is running exploit scanning software
    boolean? isExploitBot;
    # IP is involved in distributing or is running malware
    boolean? isMalware;
    # IP is running a hostile web spider / web crawler
    boolean? isSpider;
    # IP has been flagged as an attack source on DShield (dshield.org)
    boolean? isDshield;
    # The number of blocklists the IP is listed on
    int? listCount;
    # IP has been detected as an anonymous web proxy or anonymous HTTP proxy
    boolean? isProxy;
    # IP is part of a hijacked netblock or a netblock controlled by a criminal organization
    boolean? isHijacked;
    # IP is a Tor node or running a Tor related service
    boolean? isTor;
    # IP is involved in distributing or is running spyware
    boolean? isSpyware;
    # IP address is hosting a spam bot, comment spamming or any other spamming type software
    boolean? isSpamBot;
    # Is this IP on a blocklist
    boolean? isListed;
    # IP belongs to a public VPN provider (only set if the 'vpn-lookup' option is enabled)
    boolean? isVpn;
    # The last time this IP was seen on a blocklist (in Unix time or 0 if not listed recently)
    int? lastSeen;
    # An array of strings indicating which blocklists this IP is listed on (empty if not listed)
    string[]? blocklists;
    # An array of objects containing details on which sensors were used to detect this IP
    string[]? sensors;
};

public type EmailVerifyResponse record {
    # Is this a valid email address (syntax and domain is valid)
    boolean? valid;
    # True if this address has passed SMTP verification. Check the smtp-status and smtp-response fields for specific verification details
    boolean? verified;
    # The email address. If you have used the fix-typos option then this will be the fixed address
    string? email;
    # True if typos have been fixed
    boolean? typosFixed;
    # True if this address has a syntax error
    boolean? syntaxError;
    # True if this address has a domain error (e.g. no valid mail server records)
    boolean? domainError;
    # The email domain
    string? domain;
    # The email service provider domain
    string? provider;
    # True if this address is a free-mail address
    boolean? isFreemail;
    # True if this address is a disposable, temporary or darknet related email address
    boolean? isDisposable;
    # True if this address is for a person. False if this is a role based address, e.g. admin@, help@, office@, etc.
    boolean? isPersonal;
    # The SMTP verification status for the address: <br> <ul> <li>ok - SMTP verification was successful, this is a real address that can receive mail</li> <li>invalid - this is not a valid email address (has either a domain or syntax error)</li> <li>absent - this address is not registered with the email service provider</li> <li>unresponsive - the mail server(s) for this address timed-out or refused to open an SMTP connection</li> <li>unknown - sorry, we could not reliably determine the real status of this address (this address may or may not exist)</li> </ul>
    string? smtpStatus;
    # The raw SMTP response message received during verification
    string? smtpResponse;
    # True if this email domain has a catch-all policy (it will accept mail for any username)
    boolean? isCatchAll;
    # True if the mail server responded with a temporary failure (either a 4xx response code or unresponsive server). You can retry this address later, we recommend waiting at least 15 minutes before retrying
    boolean? isDeferred;
};

public type EmailvalidateBody record {
    # The output case style
    string? 'output\-case;
    # An email address
    string? email;
    # Automatically attempt to fix typos in the address
    boolean? 'fix\-typos = false;
};

public type PhoneverifyBody record {
    # The output case style
    string? 'output\-case;
    # The phone number to send the verification code to
    string? number;
    # The number of digits to use in the security code (between 4 and 12)
    int? 'code\-length = 6;
    # Pass in your own security code. This is useful if you have implemented TOTP or similar 2FA methods. If not set then we will generate a secure random code
    int? 'security\-code?;
    # The delay in milliseconds between the playback of each security code
    int? 'playback\-delay = 800;
    # ISO 2-letter country code, assume numbers are based in this country. <br>If not set numbers are assumed to be in international format (with or without the leading + sign)
    string? 'country\-code?;
    # The language to playback the verification code in, available languages are: <ul> <li>de - German</li> <li>en - English</li> <li>es - Spanish</li> <li>fr - French</li> <li>it - Italian</li> <li>pt - Portuguese</li> <li>ru - Russian</li> </ul>
    string? 'language\-code = "en";
    # Limit the total number of calls allowed to the supplied phone number, if the limit is reached error code 14 will be returned (0 means no limit)
    int? 'limit = 3;
    # Set the TTL in number of days that the 'limit' option will remember a phone number (the default is 1 day and the maximum is 365 days)
    int? 'limit\-ttl = 1;
};

public type BadWordFilterResponse record {
    # An array of the bad words found
    string[]? badWordsList;
    # Total number of bad words detected
    int? badWordsTotal;
    # The censored content (only set if censor-character has been set)
    string? censoredContent;
    # Does the text contain bad words
    boolean? isBad;
};

public type IPProbeResponse record {
    # True if this is a valid IPv4 or IPv6 address
    boolean? valid;
    # Full country name
    string? country;
    # The detected provider type, possible values are: <br> <ul> <li>isp - IP belongs to an internet service provider. This includes both mobile, home and business internet providers</li> <li>hosting - IP belongs to a hosting company. This includes website hosting, cloud computing platforms and colocation facilities</li> <li>vpn - IP belongs to a VPN provider</li> <li>proxy - IP belongs to a proxy service. This includes HTTP/SOCKS proxies and browser based proxies</li> <li>university - IP belongs to a university/college/campus</li> <li>government - IP belongs to a government department. This includes military facilities</li> <li>commercial - IP belongs to a commercial entity such as a corporate headquarters or company office</li> <li>unknown - could not identify the provider type</li> </ul>
    string? providerType;
    # ISO 2-letter country code
    string? countryCode;
    # The IPs full hostname (PTR)
    string? hostname;
    # The domain name of the provider
    string? providerDomain;
    # Full city name (if detectable)
    string? city;
    # The website URL for the provider
    string? providerWebsite;
    # The IP address
    string? ip;
    # Full region name (if detectable)
    string? region;
    # A description of the provider (usually extracted from the providers website)
    string? providerDescription;
    # ISO 2-letter continent code
    string? continentCode;
    # True if this IP belongs to a hosting company. Note that this can still be true even if the provider type is VPN/proxy, this occurs in the case that the IP is detected as both types
    boolean? isHosting;
    # True if this IP belongs to an internet service provider. Note that this can still be true even if the provider type is VPN/proxy, this occurs in the case that the IP is detected as both types
    boolean? isIsp;
    # ISO 3-letter country code
    string? countryCode3;
    # ISO 4217 currency code associated with the country
    string? currencyCode;
    # True if this IP ia a VPN
    boolean? isVpn;
    # True if this IP ia a proxy
    boolean? isProxy;
    # The autonomous system (AS) number
    string? asn;
    # The autonomous system (AS) CIDR range
    string? asCidr;
    # The autonomous system (AS) ISO 2-letter country code
    string? asCountryCode;
    # The autonomous system (AS) ISO 3-letter country code
    string? asCountryCode3;
    # Array of all the domains associated with the autonomous system (AS)
    string[]? asDomains;
    # The autonomous system (AS) description / company name
    string? asDescription;
    # The age of the autonomous system (AS) in number of years since registration
    int? asAge;
    # The IPs host domain
    string? hostDomain;
    # The domain of the VPN provider (may be empty if the VPN domain is not detectable)
    string? vpnDomain;
    # True if this is a IPv6 address. False if IPv4
    boolean? isV6;
    # True if this is a <a href="https://en.wikipedia.org/wiki/IPv6#IPv4-mapped_IPv6_addresses">IPv4 mapped IPv6 address</a>
    boolean? isV4Mapped;
    # True if this is a bogon IP address such as a private network, local network or reserved address
    boolean? isBogon;
};

public type BadwordfilterBody record {
    # The output case style
    string? 'output\-case;
    # The content to scan. This can be either a URL to load from, a file upload or an HTML content string
    string? content;
    # The character to use to censor out the bad words found
    string? 'censor\-character?;
    # Which catalog of bad words to use, we currently maintain two bad word catalogs: <br> <ul> <li>strict - the largest database of bad words which includes profanity, obscenity, sexual, rude, cuss, dirty, swear and objectionable words and phrases. This catalog is suitable for environments of all ages including educational or children's content</li> <li>obscene - like the strict catalog but does not include any mild profanities, idiomatic phrases or words which are considered formal terminology. This catalog is suitable for adult environments where certain types of bad words are considered OK</li> </ul>
    string? catalog = "strict";
};

public type GeocodereverseBody record {
    # The output case style
    string? 'output\-case;
    # The location latitude in decimal degrees format
    string? latitude;
    # The location longitude in decimal degrees format
    string? longitude;
    # The language to display results in, available languages are: <ul> <li>de, en, es, fr, it, pt, ru</li> </ul>
    string? 'language\-code = "en";
    # The zoom level to respond with: <br> <ul> <li>address - the most precise address available</li> <li>street - the street level</li> <li>city - the city level</li> <li>state - the state level</li> <li>country - the country level</li> </ul>
    string? zoom = "address";
};

public type IpblocklistdownloadBody record {
    # The data format. Can be either CSV or TXT
    string? format?;
    # Include public VPN provider IP addresses, this option is only available for Tier 3 or higher accounts. <br> <b>WARNING</b>: This option will add at least an additional 8 million IP addresses to the download
    boolean? 'include\-vpn?;
};

public type SMSMessageResponse record {
    # True if this a valid phone number
    boolean? numberValid;
    # True if the SMS has been sent
    boolean? sent;
};

public type SmsverifyBody record {
    # The output case style
    string? 'output\-case;
    # The phone number to send a verification code to
    string? number;
    # The number of digits to use in the security code (must be between 4 and 12)
    int? 'code\-length = 5;
    # Pass in your own security code. This is useful if you have implemented TOTP or similar 2FA methods. If not set then we will generate a secure random code
    int? 'security\-code?;
    # ISO 2-letter country code, assume numbers are based in this country. <br>If not set numbers are assumed to be in international format (with or without the leading + sign)
    string? 'country\-code?;
    # The language to send the verification code in, available languages are: <ul> <li>de - German</li> <li>en - English</li> <li>es - Spanish</li> <li>fr - French</li> <li>it - Italian</li> <li>pt - Portuguese</li> <li>ru - Russian</li> </ul>
    string? 'language\-code = "en";
    # Limit the total number of SMS allowed to the supplied phone number, if the limit is reached error code 14 will be returned (the default is no limit)
    int? 'limit = 0;
    # Set the TTL in number of days that the 'limit' option will remember a phone number (the default is 1 day and the maximum is 365 days)
    int? 'limit\-ttl = 1;
};

public type PhoneVerifyResponse record {
    # True if this a valid phone number
    boolean? numberValid;
    # True if the call is being made now
    boolean? calling;
    # The security code generated, you can save this code to perform your own verification or you can use the <a href="https://www.neutrinoapi.com/api/verify-security-code/">Verify Security Code API</a>
    string? securityCode;
};

public type HLRLookupResponse record {
    # True if this a valid phone number
    boolean? numberValid;
    # The numbers international calling code
    int? internationalCallingCode;
    # The mobile MNC number (Mobile Network Code)
    string? mnc;
    # The number type, possible values are: <br> <ul> <li>mobile</li> <li>fixed-line</li> <li>premium-rate</li> <li>toll-free</li> <li>voip</li> <li>unknown</li> </ul>
    string? numberType;
    # Was the HLR lookup successful. If true then this is a working and registered cell-phone or mobile device (SMS and phone calls will be delivered)
    boolean? hlrValid;
    # The HLR lookup status, possible values are: <br> <ul> <li>ok - the HLR lookup was successful and the device is connected</li> <li>absent - the number was once registered but the device has been switched off or out of network range for some time</li> <li>unknown - the number is not known by the mobile network</li> <li>invalid - the number is not a valid mobile MSISDN number</li> <li>fixed-line - the number is a registered fixed-line not mobile</li> <li>voip - the number has been detected as a VOIP line</li> <li>failed - the HLR lookup has failed, we could not determine the real status of this number</li> </ul>
    string? hlrStatus;
    # The ported to network/carrier name (only set if the number has been ported)
    string? portedNetwork;
    # The mobile IMSI number (International Mobile Subscriber Identity)
    string? imsi;
    # The mobile MCC number (Mobile Country Code)
    string? mcc;
    # The number represented in full international format
    string? internationalNumber;
    # The number represented in local dialing format
    string? localNumber;
    # The number location as an ISO 2-letter country code
    string? countryCode;
    # Has this number been ported to another network
    boolean? isPorted;
    # The mobile MSIN number (Mobile Subscription Identification Number)
    string? msin;
    # The number location. Could be a city, region or country depending on the type of number
    string? location;
    # The origin network/carrier name
    string? originNetwork;
    # True if this is a mobile number (only true with 100% certainty, if the number type is unknown this value will be false)
    boolean? isMobile;
    # Is this number currently roaming from its origin country
    boolean? isRoaming;
    # The phone number country
    string? country;
    # The number location as an ISO 3-letter country code
    string? countryCode3;
    # ISO 4217 currency code associated with the country
    string? currencyCode;
    # If the number is currently roaming, the ISO 2-letter country code of the roaming in country
    string? roamingCountryCode;
    # The mobile MSC number (Mobile Switching Center)
    string? msc;
    # The currently used network/carrier name
    string? currentNetwork;
};

public type Location record {
    # The country of the location
    string? country;
    # The fully formatted address
    string? address;
    # The city of the location
    string? city;
    # The ISO 2-letter country code of the location
    string? countryCode;
    # The ISO 3-letter country code of the location
    string? countryCode3;
    # The location latitude
    decimal? latitude;
    # The postal code for the location
    string? postalCode;
    # The location longitude
    decimal? longitude;
    # The state of the location
    string? state;
    # The components which make up the address such as road, city, state, etc
    record {} addressComponents;
    # ISO 4217 currency code associated with the country
    string? currencyCode;
    # The detected location type ordered roughly from most to least precise, possible values are: <br> <ul> <li>address - indicates a precise street address</li> <li>street - accurate to the street level but may not point to the exact location of the house/building number</li> <li>city - accurate to the city level, this includes villages, towns, suburbs, etc</li> <li>postal-code - indicates a postal code area (no house or street information present)</li> <li>railway - location is part of a rail network such as a station or railway track</li> <li>natural - indicates a natural feature, for example a mountain peak or a waterway</li> <li>island - location is an island or archipelago</li> <li>administrative - indicates an administrative boundary such as a country, state or province</li> </ul>
    string? locationType;
    # Array of strings containing any location tags associated with the address. Tags are additional pieces of metadata about a specific location, there are thousands of different tags. Some examples of tags: shop, office, cafe, bank, pub
    string[]? locationTags;
    # Map containing timezone details for the location
    record {} timezone;
};
