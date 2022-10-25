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

# This is a generated connector from [Cloudmersive](https://account.cloudmersive.com) OpenAPI specification.
# The Cloudmersive Validation APIs help you validate data. Check if an E-mail address is real. Check if a domain is real. Check up on an IP address, and even where it is located. All this and much more is available in the validation API.
@display {label: "Cloudmersive Validate", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Cloudmersive account](https://account.cloudmersive.com/login) and obtain tokens following [this guide](https://account.cloudmersive.com/keys).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://testapi.cloudmersive.com/") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Parse an unstructured input text string into an international, formatted address
    #
    # + payload - Input parse request 
    # + return - OK 
    remote isolated function addressParseString(ParseAddressRequest payload) returns ParseAddressResponse|error {
        string resourcePath = string `/validate/address/parse`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ParseAddressResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Validate a street address
    #
    # + payload - Input parse request 
    # + return - OK 
    remote isolated function addressValidateAddress(ValidateAddressRequest payload) returns ValidateAddressResponse|error {
        string resourcePath = string `/validate/address/street-address`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ValidateAddressResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Normalize a street address
    #
    # + payload - Input parse request 
    # + return - OK 
    remote isolated function addressNormalizeAddress(ValidateAddressRequest payload) returns NormalizeAddressResponse|error {
        string resourcePath = string `/validate/address/street-address/normalize`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NormalizeAddressResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Validate a City and State/Province combination, get location information about it
    #
    # + payload - Input parse request 
    # + return - OK 
    remote isolated function addressValidateCity(ValidateCityRequest payload) returns ValidateCityResponse|error {
        string resourcePath = string `/validate/address/city`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ValidateCityResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Validate a state or province, name or abbreviation, get location information about it
    #
    # + payload - Input parse request 
    # + return - OK 
    remote isolated function addressValidateState(ValidateStateRequest payload) returns ValidateStateResponse|error {
        string resourcePath = string `/validate/address/state`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ValidateStateResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Validate a postal code, get location information about it
    #
    # + payload - Input parse request 
    # + return - OK 
    remote isolated function addressValidatePostalCode(ValidatePostalCodeRequest payload) returns ValidatePostalCodeResponse|error {
        string resourcePath = string `/validate/address/postal-code`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ValidatePostalCodeResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Validate and normalize country information, return ISO 3166-1 country codes and country name
    #
    # + payload - Input request 
    # + return - OK 
    remote isolated function addressCountry(ValidateCountryRequest payload) returns ValidateCountryResponse|error {
        string resourcePath = string `/validate/address/country`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ValidateCountryResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a list of ISO 3166-1 countries
    #
    # + return - OK 
    remote isolated function addressCountryList() returns CountryListResult|error {
        string resourcePath = string `/validate/address/country/list`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        CountryListResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check if a country is a member of the European Union (EU)
    #
    # + payload - Input request 
    # + return - OK 
    remote isolated function addressCheckEumembership(ValidateCountryRequest payload) returns ValidateCountryResponse|error {
        string resourcePath = string `/validate/address/country/check-eu-membership`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ValidateCountryResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the currency of the input country
    #
    # + payload - Input request 
    # + return - OK 
    remote isolated function addressGetCountryCurrency(ValidateCountryRequest payload) returns ValidateCountryResponse|error {
        string resourcePath = string `/validate/address/country/get-currency`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ValidateCountryResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the region, subregion and continent of the country
    #
    # + payload - Input request 
    # + return - OK 
    remote isolated function addressGetCountryRegion(ValidateCountryRequest payload) returns ValidateCountryResponse|error {
        string resourcePath = string `/validate/address/country/get-region`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ValidateCountryResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets IANA/Olsen time zones for a country
    #
    # + payload - Input request 
    # + return - OK 
    remote isolated function addressGetTimezone(GetTimezonesRequest payload) returns GetTimezonesResponse|error {
        string resourcePath = string `/validate/address/country/get-timezones`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetTimezonesResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Geocode a street address into latitude and longitude
    #
    # + payload - Input parse request 
    # + return - OK 
    remote isolated function addressGeocode(ValidateAddressRequest payload) returns ValidateAddressResponse|error {
        string resourcePath = string `/validate/address/geocode`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ValidateAddressResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reverse geocode a lattitude and longitude into an address
    #
    # + payload - Input reverse geocoding request 
    # + return - OK 
    remote isolated function addressReverseGeocodeAddress(ReverseGeocodeAddressRequest payload) returns ReverseGeocodeAddressResponse|error {
        string resourcePath = string `/validate/address/geocode/reverse`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ReverseGeocodeAddressResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get current date and time as of now
    #
    # + return - OK 
    remote isolated function dateTimeGetNowSimple() returns DateTimeNowResult|error {
        string resourcePath = string `/validate/date-time/get/now`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DateTimeNowResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get public holidays in the specified country and year
    #
    # + payload - Input request 
    # + return - OK 
    remote isolated function dateTimeGetPublicHolidays(GetPublicHolidaysRequest payload) returns PublicHolidaysResponse|error {
        string resourcePath = string `/validate/date-time/get/holidays`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PublicHolidaysResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Parses a standardized date and time string into a date and time
    #
    # + payload - Input request 
    # + return - OK 
    remote isolated function dateTimeParseStandardDateTime(DateTimeStandardizedParseRequest payload) returns DateTimeStandardizedParseResponse|error {
        string resourcePath = string `/validate/date-time/parse/date-time/structured`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DateTimeStandardizedParseResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Parses a free-form natural language date and time string into a date and time
    #
    # + payload - Input request 
    # + return - OK 
    remote isolated function dateTimeParseNaturalLanguageDateTime(DateTimeNaturalLanguageParseRequest payload) returns DateTimeStandardizedParseResponse|error {
        string resourcePath = string `/validate/date-time/parse/date-time/natural-language`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DateTimeStandardizedParseResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Validate a domain name
    #
    # + payload - Domain name to check, for example "cloudmersive.com".  The input is a string so be sure to enclose it in double-quotes. 
    # + return - OK 
    remote isolated function domainCheck(string payload) returns CheckResponse|error {
        string resourcePath = string `/validate/domain/check`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CheckResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Validate a domain name's quality score
    #
    # + payload - Domain name to check, for example "cloudmersive.com". 
    # + return - OK 
    remote isolated function domainQualityScore(string payload) returns DomainQualityResponse|error {
        string resourcePath = string `/validate/domain/quality-score`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DomainQualityResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get WHOIS information for a domain
    #
    # + payload - Domain name to check, for example "cloudmersive.com".   The input is a string so be sure to enclose it in double-quotes. 
    # + return - OK 
    remote isolated function domainPost(string payload) returns WhoisResponse|error {
        string resourcePath = string `/validate/domain/whois`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WhoisResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Validate a URL syntactically
    #
    # + payload - Input URL information 
    # + return - OK 
    remote isolated function domainUrlSyntaxOnly(ValidateUrlRequestSyntaxOnly payload) returns ValidateUrlResponseSyntaxOnly|error {
        string resourcePath = string `/validate/domain/url/syntax-only`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ValidateUrlResponseSyntaxOnly response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Validate a URL fully
    #
    # + payload - Input URL request 
    # + return - OK 
    remote isolated function domainUrlFull(ValidateUrlRequestFull payload) returns ValidateUrlResponseFull|error {
        string resourcePath = string `/validate/domain/url/full`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ValidateUrlResponseFull response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get top-level domain name from URL
    #
    # + payload - Input URL information 
    # + return - OK 
    remote isolated function domainGetTopLevelDomainFromUrl(ValidateUrlRequestSyntaxOnly payload) returns ValidateUrlResponseSyntaxOnly|error {
        string resourcePath = string `/validate/domain/url/get-top-level-domain`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ValidateUrlResponseSyntaxOnly response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check a URL for Phishing threats
    #
    # + payload - Input URL request 
    # + return - OK 
    remote isolated function domainPhishingCheck(PhishingCheckRequest payload) returns PhishingCheckResponse|error {
        string resourcePath = string `/validate/domain/url/phishing-threat-check`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PhishingCheckResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check if path is a high-risk or vulnerable server administration path
    #
    # + payload - URL or relative path to check, e.g. "/admin/login".  The input is a string so be sure to enclose it in double-quotes. 
    # + return - OK 
    remote isolated function domainIsAdminPath(string payload) returns IsAdminPathResponse|error {
        string resourcePath = string `/validate/domain/url/is-admin-path`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IsAdminPathResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check a URL for safety threats
    #
    # + payload - Input URL request 
    # + return - OK 
    remote isolated function domainSafetyCheck(UrlSafetyCheckRequestFull payload) returns UrlSafetyCheckResponseFull|error {
        string resourcePath = string `/validate/domain/url/safety-threat-check`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UrlSafetyCheckResponseFull response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check a URL for SSRF threats
    #
    # + payload - Input URL request 
    # + return - OK 
    remote isolated function domainSsrfCheck(UrlSsrfRequestFull payload) returns UrlSsrfResponseFull|error {
        string resourcePath = string `/validate/domain/url/ssrf-threat-check`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UrlSsrfResponseFull response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check a URL for SSRF threats in batches
    #
    # + payload - Input URL request as a batch of multiple URLs 
    # + return - OK 
    remote isolated function domainSsrfCheckBatch(UrlSsrfRequestBatch payload) returns UrlSsrfResponseBatch|error {
        string resourcePath = string `/validate/domain/url/ssrf-threat-check/batch`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UrlSsrfResponseBatch response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check a URL for HTML embedded SSRF threats
    #
    # + payload - Input URL request 
    # + return - OK 
    remote isolated function domainUrlHtmlSsrfCheck(UrlHtmlSsrfRequestFull payload) returns UrlHtmlSsrfResponseFull|error {
        string resourcePath = string `/validate/domain/url/ssrf-threat-check/html-embedded`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UrlHtmlSsrfResponseFull response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Validate email adddress for syntactic correctness only
    #
    # + payload - Email address to validate, e.g. "support@cloudmersive.com".    The input is a string so be sure to enclose it in double-quotes. 
    # + return - OK 
    remote isolated function emailPost(string payload) returns AddressVerifySyntaxOnlyResponse|error {
        string resourcePath = string `/validate/email/address/syntaxOnly`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AddressVerifySyntaxOnlyResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Partially check whether an email address is valid
    #
    # + payload - Email address to validate, e.g. "support@cloudmersive.com".    The input is a string so be sure to enclose it in double-quotes. 
    # + return - OK 
    remote isolated function emailAddressGetServers(string payload) returns AddressGetServersResponse|error {
        string resourcePath = string `/validate/email/address/servers`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AddressGetServersResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Fully validate an email address
    #
    # + payload - Email address to validate, e.g. "support@cloudmersive.com".    The input is a string so be sure to enclose it in double-quotes. 
    # + return - OK 
    remote isolated function emailFullValidation(string payload) returns FullEmailValidationResponse|error {
        string resourcePath = string `/validate/email/address/full`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FullEmailValidationResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get intelligence on an IP address
    #
    # + payload - IP address to process, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes. 
    # + return - OK 
    remote isolated function ipaddressIpIntelligence(string payload) returns IPIntelligenceResponse|error {
        string resourcePath = string `/validate/ip/intelligence`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IPIntelligenceResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Geolocate an IP address
    #
    # + payload - IP address to geolocate, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes. 
    # + return - OK 
    remote isolated function ipaddressPost(string payload) returns GeolocateResponse|error {
        string resourcePath = string `/validate/ip/geolocate`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GeolocateResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Geolocate an IP address to a street address
    #
    # + payload - IP address to geolocate, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes. 
    # + return - OK 
    remote isolated function ipaddressGeolocateStreetAddress(string payload) returns GeolocateStreetAddressResponse|error {
        string resourcePath = string `/validate/ip/geolocate/street-address`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GeolocateStreetAddressResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check if IP address is a known threat
    #
    # + payload - IP address to check, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes. 
    # + return - OK 
    remote isolated function ipaddressIsThreat(string payload) returns IPThreatResponse|error {
        string resourcePath = string `/validate/ip/is-threat`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IPThreatResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check if IP address is a Tor node server
    #
    # + payload - IP address to check, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes. 
    # + return - OK 
    remote isolated function ipaddressIsTorNode(string payload) returns TorNodeResponse|error {
        string resourcePath = string `/validate/ip/is-tor-node`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TorNodeResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check if IP address is a Bot client
    #
    # + payload - IP address to check, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes. 
    # + return - OK 
    remote isolated function ipaddressIsBot(string payload) returns BotCheckResponse|error {
        string resourcePath = string `/validate/ip/is-bot`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BotCheckResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Perform a reverse domain name (DNS) lookup on an IP address
    #
    # + payload - IP address to check, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes. 
    # + return - OK 
    remote isolated function ipaddressReverseDomainLookup(string payload) returns IPReverseDNSLookupResponse|error {
        string resourcePath = string `/validate/ip/reverse-domain-lookup`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IPReverseDNSLookupResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Enrich an input lead with additional fields of data
    #
    # + payload - Input lead with known fields set, and unknown fields left blank (null) 
    # + return - OK 
    remote isolated function leadEnrichmentEnrichLead(LeadEnrichmentRequest payload) returns LeadEnrichmentResponse|error {
        string resourcePath = string `/validate/lead-enrichment/lead/enrich`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LeadEnrichmentResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Parse and validate a full name
    #
    # + payload - Validation request information 
    # + return - OK 
    remote isolated function nameValidateFullName(FullNameValidationRequest payload) returns FullNameValidationResponse|error {
        string resourcePath = string `/validate/name/full-name`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FullNameValidationResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Validate a first name
    #
    # + payload - Validation request information 
    # + return - OK 
    remote isolated function nameValidateFirstName(FirstNameValidationRequest payload) returns FirstNameValidationResponse|error {
        string resourcePath = string `/validate/name/first`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FirstNameValidationResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Validate a last name
    #
    # + payload - Validation request information 
    # + return - OK 
    remote isolated function nameValidateLastName(LastNameValidationRequest payload) returns LastNameValidationResponse|error {
        string resourcePath = string `/validate/name/last`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LastNameValidationResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the gender of a first name
    #
    # + payload - Gender request information 
    # + return - OK 
    remote isolated function nameGetGender(GetGenderRequest payload) returns GetGenderResponse|error {
        string resourcePath = string `/validate/name/get-gender`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetGenderResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Validate a code identifier
    #
    # + payload - Identifier validation request information 
    # + return - OK 
    remote isolated function nameIdentifier(ValidateIdentifierRequest payload) returns ValidateIdentifierResponse|error {
        string resourcePath = string `/validate/name/identifier`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ValidateIdentifierResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Validate phone number (basic)
    #
    # + payload - Phone number to validate in a PhoneNumberValidateRequest object.  Try a phone number such as "1.800.463.3339", and either leave DefaultCountryCode blank or use "US". 
    # + return - OK 
    remote isolated function phoneNumberSyntaxOnly(PhoneNumberValidateRequest payload) returns PhoneNumberValidationResponse|error {
        string resourcePath = string `/validate/phonenumber/basic`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PhoneNumberValidationResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check text input for SQL Injection (SQLI) attacks
    #
    # + detectionLevel - Set to Normal to target a high-security SQL Injection detection level with a very low false positive rate; select High to target a very-high security SQL Injection detection level with higher false positives.  Default is Normal (recommended). 
    # + payload - User-facing text input. 
    # + return - OK 
    remote isolated function textInputCheckSqlInjection(string payload, string? detectionLevel = ()) returns SqlInjectionDetectionResult|error {
        string resourcePath = string `/validate/text-input/check/sql-injection`;
        map<any> headerValues = {"detectionLevel": detectionLevel, "Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SqlInjectionDetectionResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check and protect multiple text inputs for SQL Injection (SQLI) attacks in batch
    #
    # + payload - User-facing text input. 
    # + return - OK 
    remote isolated function textInputCheckSqlInjectionBatch(SqlInjectionCheckBatchRequest payload) returns SqlInjectionCheckBatchResponse|error {
        string resourcePath = string `/validate/text-input/check/sql-injection/batch`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SqlInjectionCheckBatchResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check text input for Cross-Site-Scripting (XSS) attacks
    #
    # + payload - User-facing text input. 
    # + return - OK 
    remote isolated function textInputCheckXss(string payload) returns XssProtectionResult|error {
        string resourcePath = string `/validate/text-input/check/xss`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        XssProtectionResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Protect text input from Cross-Site-Scripting (XSS) attacks through normalization
    #
    # + payload - User-facing text input. 
    # + return - OK 
    remote isolated function textInputProtectXss(string payload) returns XssProtectionResult|error {
        string resourcePath = string `/validate/text-input/protect/xss`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        XssProtectionResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check and protect multiple text inputs for Cross-Site-Scripting (XSS) attacks in batch
    #
    # + payload - User-facing text input. 
    # + return - OK 
    remote isolated function textInputCheckXssBatch(XssProtectionBatchRequest payload) returns XssProtectionBatchResponse|error {
        string resourcePath = string `/validate/text-input/check-and-protect/xss/batch`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        XssProtectionBatchResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Protect html input from Server-side Request Forgery (SSRF) attacks
    #
    # + payload - User-facing HTML input. 
    # + return - OK 
    remote isolated function textInputCheckHtmlSsrf(string payload) returns HtmlSsrfDetectionResult|error {
        string resourcePath = string `/validate/text-input/html/check/ssrf`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        HtmlSsrfDetectionResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Protect text input from XML External Entity (XXE) attacks
    #
    # + allowInternetUrls - Optional: Set to true to allow Internet-based dependency URLs for DTDs and other XML External Entitites, set to false to block.  Default is false. 
    # + knownSafeUrls - Optional: Comma separated list of fully-qualified URLs that will automatically be considered safe. 
    # + knownUnsafeUrls - Optional: Comma separated list of fully-qualified URLs that will automatically be considered unsafe. 
    # + payload - User-facing text input. 
    # + return - OK 
    remote isolated function textInputCheckXxe(string payload, boolean? allowInternetUrls = (), string? knownSafeUrls = (), string? knownUnsafeUrls = ()) returns XxeDetectionResult|error {
        string resourcePath = string `/validate/text-input/check/xxe`;
        map<any> headerValues = {"allowInternetUrls": allowInternetUrls, "knownSafeUrls": knownSafeUrls, "knownUnsafeUrls": knownUnsafeUrls, "Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        XxeDetectionResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Protect text input from XML External Entity (XXE) attacks
    #
    # + return - OK 
    remote isolated function textInputCheckXxeBatch(XxeDetectionBatchRequest payload) returns XxeDetectionBatchResponse|error {
        string resourcePath = string `/validate/text-input/check/xxe/batch`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        XxeDetectionBatchResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Parse an HTTP User-Agent string, identify robots
    #
    # + payload - Input parse request 
    # + return - OK 
    remote isolated function userAgentParse(UserAgentValidateRequest payload) returns UserAgentValidateResponse|error {
        string resourcePath = string `/validate/useragent/parse`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserAgentValidateResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Validate a VAT number
    #
    # + payload - Input VAT code 
    # + return - OK 
    remote isolated function vatVatLookup(VatLookupRequest payload) returns VatLookupResponse|error {
        string resourcePath = string `/validate/vat/lookup`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        VatLookupResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
