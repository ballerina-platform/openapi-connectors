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

import  ballerina/http;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector from [Cloudmersive](https://account.cloudmersive.com) OpenAPI specification.
# The Cloudmersive Validation APIs help you validate data. Check if an E-mail address is real. Check if a domain is real. Check up on an IP address, and even where it is located. All this and much more is available in the validation API.
@display {label: "Cloudmersive Validate", iconPath: "resources/cloudmersive.validate.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.  
    # Create a [Cloudmersive account](https://account.cloudmersive.com/login) and obtain tokens following [this guide](https://account.cloudmersive.com/keys).
    #
    # + apiKeyConfig - Provide your API Key as `Apikey`. Eg: `{"Apikey" : "<API Key>}`"
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://testapi.cloudmersive.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Parse an unstructured input text string into an international, formatted address
    #
    # + payload - Input parse request
    # + return - OK
    remote isolated function addressParseString(ParseAddressRequest payload) returns ParseAddressResponse|error {
        string  path = string `/validate/address/parse`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ParseAddressResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ParseAddressResponse);
        return response;
    }
    # Validate a street address
    #
    # + payload - Input parse request
    # + return - OK
    remote isolated function addressValidateAddress(ValidateAddressRequest payload) returns ValidateAddressResponse|error {
        string  path = string `/validate/address/street-address`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ValidateAddressResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ValidateAddressResponse);
        return response;
    }
    # Normalize a street address
    #
    # + payload - Input parse request
    # + return - OK
    remote isolated function addressNormalizeAddress(ValidateAddressRequest payload) returns NormalizeAddressResponse|error {
        string  path = string `/validate/address/street-address/normalize`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        NormalizeAddressResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=NormalizeAddressResponse);
        return response;
    }
    # Validate a City and State/Province combination, get location information about it
    #
    # + payload - Input parse request
    # + return - OK
    remote isolated function addressValidateCity(ValidateCityRequest payload) returns ValidateCityResponse|error {
        string  path = string `/validate/address/city`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ValidateCityResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ValidateCityResponse);
        return response;
    }
    # Validate a state or province, name or abbreviation, get location information about it
    #
    # + payload - Input parse request
    # + return - OK
    remote isolated function addressValidateState(ValidateStateRequest payload) returns ValidateStateResponse|error {
        string  path = string `/validate/address/state`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ValidateStateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ValidateStateResponse);
        return response;
    }
    # Validate a postal code, get location information about it
    #
    # + payload - Input parse request
    # + return - OK
    remote isolated function addressValidatePostalCode(ValidatePostalCodeRequest payload) returns ValidatePostalCodeResponse|error {
        string  path = string `/validate/address/postal-code`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ValidatePostalCodeResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ValidatePostalCodeResponse);
        return response;
    }
    # Validate and normalize country information, return ISO 3166-1 country codes and country name
    #
    # + payload - Input request
    # + return - OK
    remote isolated function addressCountry(ValidateCountryRequest payload) returns ValidateCountryResponse|error {
        string  path = string `/validate/address/country`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ValidateCountryResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ValidateCountryResponse);
        return response;
    }
    # Get a list of ISO 3166-1 countries
    #
    # + return - OK
    remote isolated function addressCountryList() returns CountryListResult|error {
        string  path = string `/validate/address/country/list`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        CountryListResult response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = CountryListResult);
        return response;
    }
    # Check if a country is a member of the European Union (EU)
    #
    # + payload - Input request
    # + return - OK
    remote isolated function addressCheckEumembership(ValidateCountryRequest payload) returns ValidateCountryResponse|error {
        string  path = string `/validate/address/country/check-eu-membership`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ValidateCountryResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ValidateCountryResponse);
        return response;
    }
    # Get the currency of the input country
    #
    # + payload - Input request
    # + return - OK
    remote isolated function addressGetCountryCurrency(ValidateCountryRequest payload) returns ValidateCountryResponse|error {
        string  path = string `/validate/address/country/get-currency`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ValidateCountryResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ValidateCountryResponse);
        return response;
    }
    # Get the region, subregion and continent of the country
    #
    # + payload - Input request
    # + return - OK
    remote isolated function addressGetCountryRegion(ValidateCountryRequest payload) returns ValidateCountryResponse|error {
        string  path = string `/validate/address/country/get-region`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ValidateCountryResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ValidateCountryResponse);
        return response;
    }
    # Gets IANA/Olsen time zones for a country
    #
    # + payload - Input request
    # + return - OK
    remote isolated function addressGetTimezone(GetTimezonesRequest payload) returns GetTimezonesResponse|error {
        string  path = string `/validate/address/country/get-timezones`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetTimezonesResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GetTimezonesResponse);
        return response;
    }
    # Geocode a street address into latitude and longitude
    #
    # + payload - Input parse request
    # + return - OK
    remote isolated function addressGeocode(ValidateAddressRequest payload) returns ValidateAddressResponse|error {
        string  path = string `/validate/address/geocode`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ValidateAddressResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ValidateAddressResponse);
        return response;
    }
    # Reverse geocode a lattitude and longitude into an address
    #
    # + payload - Input reverse geocoding request
    # + return - OK
    remote isolated function addressReverseGeocodeAddress(ReverseGeocodeAddressRequest payload) returns ReverseGeocodeAddressResponse|error {
        string  path = string `/validate/address/geocode/reverse`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ReverseGeocodeAddressResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ReverseGeocodeAddressResponse);
        return response;
    }
    # Get current date and time as of now
    #
    # + return - OK
    remote isolated function dateTimeGetNowSimple() returns DateTimeNowResult|error {
        string  path = string `/validate/date-time/get/now`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DateTimeNowResult response = check self.clientEp-> get(path, accHeaders, targetType = DateTimeNowResult);
        return response;
    }
    # Get public holidays in the specified country and year
    #
    # + payload - Input request
    # + return - OK
    remote isolated function dateTimeGetPublicHolidays(GetPublicHolidaysRequest payload) returns PublicHolidaysResponse|error {
        string  path = string `/validate/date-time/get/holidays`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PublicHolidaysResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PublicHolidaysResponse);
        return response;
    }
    # Parses a standardized date and time string into a date and time
    #
    # + payload - Input request
    # + return - OK
    remote isolated function dateTimeParseStandardDateTime(DateTimeStandardizedParseRequest payload) returns DateTimeStandardizedParseResponse|error {
        string  path = string `/validate/date-time/parse/date-time/structured`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DateTimeStandardizedParseResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DateTimeStandardizedParseResponse);
        return response;
    }
    # Parses a free-form natural language date and time string into a date and time
    #
    # + payload - Input request
    # + return - OK
    remote isolated function dateTimeParseNaturalLanguageDateTime(DateTimeNaturalLanguageParseRequest payload) returns DateTimeStandardizedParseResponse|error {
        string  path = string `/validate/date-time/parse/date-time/natural-language`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DateTimeStandardizedParseResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DateTimeStandardizedParseResponse);
        return response;
    }
    # Validate a domain name
    #
    # + payload - Domain name to check, for example "cloudmersive.com".  The input is a string so be sure to enclose it in double-quotes.
    # + return - OK
    remote isolated function domainCheck(string payload) returns CheckResponse|error {
        string  path = string `/validate/domain/check`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CheckResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CheckResponse);
        return response;
    }
    # Validate a domain name's quality score
    #
    # + payload - Domain name to check, for example "cloudmersive.com".
    # + return - OK
    remote isolated function domainQualityScore(string payload) returns DomainQualityResponse|error {
        string  path = string `/validate/domain/quality-score`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DomainQualityResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DomainQualityResponse);
        return response;
    }
    # Get WHOIS information for a domain
    #
    # + payload - Domain name to check, for example "cloudmersive.com".   The input is a string so be sure to enclose it in double-quotes.
    # + return - OK
    remote isolated function domainPost(string payload) returns WhoisResponse|error {
        string  path = string `/validate/domain/whois`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WhoisResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=WhoisResponse);
        return response;
    }
    # Validate a URL syntactically
    #
    # + payload - Input URL information
    # + return - OK
    remote isolated function domainUrlSyntaxOnly(ValidateUrlRequestSyntaxOnly payload) returns ValidateUrlResponseSyntaxOnly|error {
        string  path = string `/validate/domain/url/syntax-only`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ValidateUrlResponseSyntaxOnly response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ValidateUrlResponseSyntaxOnly);
        return response;
    }
    # Validate a URL fully
    #
    # + payload - Input URL request
    # + return - OK
    remote isolated function domainUrlFull(ValidateUrlRequestFull payload) returns ValidateUrlResponseFull|error {
        string  path = string `/validate/domain/url/full`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ValidateUrlResponseFull response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ValidateUrlResponseFull);
        return response;
    }
    # Get top-level domain name from URL
    #
    # + payload - Input URL information
    # + return - OK
    remote isolated function domainGetTopLevelDomainFromUrl(ValidateUrlRequestSyntaxOnly payload) returns ValidateUrlResponseSyntaxOnly|error {
        string  path = string `/validate/domain/url/get-top-level-domain`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ValidateUrlResponseSyntaxOnly response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ValidateUrlResponseSyntaxOnly);
        return response;
    }
    # Check a URL for Phishing threats
    #
    # + payload - Input URL request
    # + return - OK
    remote isolated function domainPhishingCheck(PhishingCheckRequest payload) returns PhishingCheckResponse|error {
        string  path = string `/validate/domain/url/phishing-threat-check`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PhishingCheckResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PhishingCheckResponse);
        return response;
    }
    # Check if path is a high-risk or vulnerable server administration path
    #
    # + payload - URL or relative path to check, e.g. "/admin/login".  The input is a string so be sure to enclose it in double-quotes.
    # + return - OK
    remote isolated function domainIsAdminPath(string payload) returns IsAdminPathResponse|error {
        string  path = string `/validate/domain/url/is-admin-path`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IsAdminPathResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=IsAdminPathResponse);
        return response;
    }
    # Check a URL for safety threats
    #
    # + payload - Input URL request
    # + return - OK
    remote isolated function domainSafetyCheck(UrlSafetyCheckRequestFull payload) returns UrlSafetyCheckResponseFull|error {
        string  path = string `/validate/domain/url/safety-threat-check`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UrlSafetyCheckResponseFull response = check self.clientEp->post(path, request, headers = accHeaders, targetType=UrlSafetyCheckResponseFull);
        return response;
    }
    # Check a URL for SSRF threats
    #
    # + payload - Input URL request
    # + return - OK
    remote isolated function domainSsrfCheck(UrlSsrfRequestFull payload) returns UrlSsrfResponseFull|error {
        string  path = string `/validate/domain/url/ssrf-threat-check`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UrlSsrfResponseFull response = check self.clientEp->post(path, request, headers = accHeaders, targetType=UrlSsrfResponseFull);
        return response;
    }
    # Check a URL for SSRF threats in batches
    #
    # + payload - Input URL request as a batch of multiple URLs
    # + return - OK
    remote isolated function domainSsrfCheckBatch(UrlSsrfRequestBatch payload) returns UrlSsrfResponseBatch|error {
        string  path = string `/validate/domain/url/ssrf-threat-check/batch`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UrlSsrfResponseBatch response = check self.clientEp->post(path, request, headers = accHeaders, targetType=UrlSsrfResponseBatch);
        return response;
    }
    # Check a URL for HTML embedded SSRF threats
    #
    # + payload - Input URL request
    # + return - OK
    remote isolated function domainUrlHtmlSsrfCheck(UrlHtmlSsrfRequestFull payload) returns UrlHtmlSsrfResponseFull|error {
        string  path = string `/validate/domain/url/ssrf-threat-check/html-embedded`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UrlHtmlSsrfResponseFull response = check self.clientEp->post(path, request, headers = accHeaders, targetType=UrlHtmlSsrfResponseFull);
        return response;
    }
    # Validate email adddress for syntactic correctness only
    #
    # + payload - Email address to validate, e.g. "support@cloudmersive.com".    The input is a string so be sure to enclose it in double-quotes.
    # + return - OK
    remote isolated function emailPost(string payload) returns AddressVerifySyntaxOnlyResponse|error {
        string  path = string `/validate/email/address/syntaxOnly`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AddressVerifySyntaxOnlyResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=AddressVerifySyntaxOnlyResponse);
        return response;
    }
    # Partially check whether an email address is valid
    #
    # + payload - Email address to validate, e.g. "support@cloudmersive.com".    The input is a string so be sure to enclose it in double-quotes.
    # + return - OK
    remote isolated function emailAddressGetServers(string payload) returns AddressGetServersResponse|error {
        string  path = string `/validate/email/address/servers`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AddressGetServersResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=AddressGetServersResponse);
        return response;
    }
    # Fully validate an email address
    #
    # + payload - Email address to validate, e.g. "support@cloudmersive.com".    The input is a string so be sure to enclose it in double-quotes.
    # + return - OK
    remote isolated function emailFullValidation(string payload) returns FullEmailValidationResponse|error {
        string  path = string `/validate/email/address/full`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FullEmailValidationResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FullEmailValidationResponse);
        return response;
    }
    # Get intelligence on an IP address
    #
    # + payload - IP address to process, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes.
    # + return - OK
    remote isolated function ipaddressIpIntelligence(string payload) returns IPIntelligenceResponse|error {
        string  path = string `/validate/ip/intelligence`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IPIntelligenceResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=IPIntelligenceResponse);
        return response;
    }
    # Geolocate an IP address
    #
    # + payload - IP address to geolocate, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes.
    # + return - OK
    remote isolated function ipaddressPost(string payload) returns GeolocateResponse|error {
        string  path = string `/validate/ip/geolocate`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GeolocateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GeolocateResponse);
        return response;
    }
    # Geolocate an IP address to a street address
    #
    # + payload - IP address to geolocate, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes.
    # + return - OK
    remote isolated function ipaddressGeolocateStreetAddress(string payload) returns GeolocateStreetAddressResponse|error {
        string  path = string `/validate/ip/geolocate/street-address`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GeolocateStreetAddressResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GeolocateStreetAddressResponse);
        return response;
    }
    # Check if IP address is a known threat
    #
    # + payload - IP address to check, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes.
    # + return - OK
    remote isolated function ipaddressIsThreat(string payload) returns IPThreatResponse|error {
        string  path = string `/validate/ip/is-threat`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IPThreatResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=IPThreatResponse);
        return response;
    }
    # Check if IP address is a Tor node server
    #
    # + payload - IP address to check, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes.
    # + return - OK
    remote isolated function ipaddressIsTorNode(string payload) returns TorNodeResponse|error {
        string  path = string `/validate/ip/is-tor-node`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TorNodeResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TorNodeResponse);
        return response;
    }
    # Check if IP address is a Bot client
    #
    # + payload - IP address to check, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes.
    # + return - OK
    remote isolated function ipaddressIsBot(string payload) returns BotCheckResponse|error {
        string  path = string `/validate/ip/is-bot`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BotCheckResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BotCheckResponse);
        return response;
    }
    # Perform a reverse domain name (DNS) lookup on an IP address
    #
    # + payload - IP address to check, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes.
    # + return - OK
    remote isolated function ipaddressReverseDomainLookup(string payload) returns IPReverseDNSLookupResponse|error {
        string  path = string `/validate/ip/reverse-domain-lookup`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IPReverseDNSLookupResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=IPReverseDNSLookupResponse);
        return response;
    }
    # Enrich an input lead with additional fields of data
    #
    # + payload - Input lead with known fields set, and unknown fields left blank (null)
    # + return - OK
    remote isolated function leadEnrichmentEnrichLead(LeadEnrichmentRequest payload) returns LeadEnrichmentResponse|error {
        string  path = string `/validate/lead-enrichment/lead/enrich`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LeadEnrichmentResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=LeadEnrichmentResponse);
        return response;
    }
    # Parse and validate a full name
    #
    # + payload - Validation request information
    # + return - OK
    remote isolated function nameValidateFullName(FullNameValidationRequest payload) returns FullNameValidationResponse|error {
        string  path = string `/validate/name/full-name`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FullNameValidationResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FullNameValidationResponse);
        return response;
    }
    # Validate a first name
    #
    # + payload - Validation request information
    # + return - OK
    remote isolated function nameValidateFirstName(FirstNameValidationRequest payload) returns FirstNameValidationResponse|error {
        string  path = string `/validate/name/first`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FirstNameValidationResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FirstNameValidationResponse);
        return response;
    }
    # Validate a last name
    #
    # + payload - Validation request information
    # + return - OK
    remote isolated function nameValidateLastName(LastNameValidationRequest payload) returns LastNameValidationResponse|error {
        string  path = string `/validate/name/last`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LastNameValidationResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=LastNameValidationResponse);
        return response;
    }
    # Get the gender of a first name
    #
    # + payload - Gender request information
    # + return - OK
    remote isolated function nameGetGender(GetGenderRequest payload) returns GetGenderResponse|error {
        string  path = string `/validate/name/get-gender`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetGenderResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GetGenderResponse);
        return response;
    }
    # Validate a code identifier
    #
    # + payload - Identifier validation request information
    # + return - OK
    remote isolated function nameIdentifier(ValidateIdentifierRequest payload) returns ValidateIdentifierResponse|error {
        string  path = string `/validate/name/identifier`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ValidateIdentifierResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ValidateIdentifierResponse);
        return response;
    }
    # Validate phone number (basic)
    #
    # + payload - Phone number to validate in a PhoneNumberValidateRequest object.  Try a phone number such as "1.800.463.3339", and either leave DefaultCountryCode blank or use "US".
    # + return - OK
    remote isolated function phoneNumberSyntaxOnly(PhoneNumberValidateRequest payload) returns PhoneNumberValidationResponse|error {
        string  path = string `/validate/phonenumber/basic`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PhoneNumberValidationResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PhoneNumberValidationResponse);
        return response;
    }
    # Check text input for SQL Injection (SQLI) attacks
    #
    # + payload - User-facing text input.
    # + detectionLevel - Set to Normal to target a high-security SQL Injection detection level with a very low false positive rate; select High to target a very-high security SQL Injection detection level with higher false positives.  Default is Normal (recommended).
    # + return - OK
    remote isolated function textInputCheckSqlInjection(string payload, string? detectionLevel = ()) returns SqlInjectionDetectionResult|error {
        string  path = string `/validate/text-input/check/sql-injection`;
        map<any> headerValues = {"detectionLevel": detectionLevel, Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SqlInjectionDetectionResult response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SqlInjectionDetectionResult);
        return response;
    }
    # Check and protect multiple text inputs for SQL Injection (SQLI) attacks in batch
    #
    # + payload - User-facing text input.
    # + return - OK
    remote isolated function textInputCheckSqlInjectionBatch(SqlInjectionCheckBatchRequest payload) returns SqlInjectionCheckBatchResponse|error {
        string  path = string `/validate/text-input/check/sql-injection/batch`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SqlInjectionCheckBatchResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SqlInjectionCheckBatchResponse);
        return response;
    }
    # Check text input for Cross-Site-Scripting (XSS) attacks
    #
    # + payload - User-facing text input.
    # + return - OK
    remote isolated function textInputCheckXss(string payload) returns XssProtectionResult|error {
        string  path = string `/validate/text-input/check/xss`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        XssProtectionResult response = check self.clientEp->post(path, request, headers = accHeaders, targetType=XssProtectionResult);
        return response;
    }
    # Protect text input from Cross-Site-Scripting (XSS) attacks through normalization
    #
    # + payload - User-facing text input.
    # + return - OK
    remote isolated function textInputProtectXss(string payload) returns XssProtectionResult|error {
        string  path = string `/validate/text-input/protect/xss`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        XssProtectionResult response = check self.clientEp->post(path, request, headers = accHeaders, targetType=XssProtectionResult);
        return response;
    }
    # Check and protect multiple text inputs for Cross-Site-Scripting (XSS) attacks in batch
    #
    # + payload - User-facing text input.
    # + return - OK
    remote isolated function textInputCheckXssBatch(XssProtectionBatchRequest payload) returns XssProtectionBatchResponse|error {
        string  path = string `/validate/text-input/check-and-protect/xss/batch`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        XssProtectionBatchResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=XssProtectionBatchResponse);
        return response;
    }
    # Protect html input from Server-side Request Forgery (SSRF) attacks
    #
    # + payload - User-facing HTML input.
    # + return - OK
    remote isolated function textInputCheckHtmlSsrf(string payload) returns HtmlSsrfDetectionResult|error {
        string  path = string `/validate/text-input/html/check/ssrf`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HtmlSsrfDetectionResult response = check self.clientEp->post(path, request, headers = accHeaders, targetType=HtmlSsrfDetectionResult);
        return response;
    }
    # Protect text input from XML External Entity (XXE) attacks
    #
    # + payload - User-facing text input.
    # + allowInternetUrls - Optional: Set to true to allow Internet-based dependency URLs for DTDs and other XML External Entitites, set to false to block.  Default is false.
    # + knownSafeUrls - Optional: Comma separated list of fully-qualified URLs that will automatically be considered safe.
    # + knownUnsafeUrls - Optional: Comma separated list of fully-qualified URLs that will automatically be considered unsafe.
    # + return - OK
    remote isolated function textInputCheckXxe(string payload, boolean? allowInternetUrls = (), string? knownSafeUrls = (), string? knownUnsafeUrls = ()) returns XxeDetectionResult|error {
        string  path = string `/validate/text-input/check/xxe`;
        map<any> headerValues = {"allowInternetUrls": allowInternetUrls, "knownSafeUrls": knownSafeUrls, "knownUnsafeUrls": knownUnsafeUrls, Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        XxeDetectionResult response = check self.clientEp->post(path, request, headers = accHeaders, targetType=XxeDetectionResult);
        return response;
    }
    # Protect text input from XML External Entity (XXE) attacks
    # + payload - Input to a batch XXE detection operation
    # + return - OK
    remote isolated function textInputCheckXxeBatch(XxeDetectionBatchRequest payload) returns XxeDetectionBatchResponse|error {
        string  path = string `/validate/text-input/check/xxe/batch`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        XxeDetectionBatchResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=XxeDetectionBatchResponse);
        return response;
    }
    # Parse an HTTP User-Agent string, identify robots
    #
    # + payload - Input parse request
    # + return - OK
    remote isolated function userAgentParse(UserAgentValidateRequest payload) returns UserAgentValidateResponse|error {
        string  path = string `/validate/useragent/parse`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserAgentValidateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=UserAgentValidateResponse);
        return response;
    }
    # Validate a VAT number
    #
    # + payload - Input VAT code
    # + return - OK
    remote isolated function vatVatLookup(VatLookupRequest payload) returns VatLookupResponse|error {
        string  path = string `/validate/vat/lookup`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        VatLookupResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=VatLookupResponse);
        return response;
    }
}

# Generate header map for given header values.
#
# + headerParam - Headers  map
# + return - Returns generated map or error at failure of client initialization
isolated function  getMapForHeaders(map<any>   headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
