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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    OAuth2ClientCredentialsGrantConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_1_1;
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
    # Proxy server related options
    http:ProxyConfig? proxy = ();
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# OAuth2 Client Credentials Grant Configs
public type OAuth2ClientCredentialsGrantConfig record {|
    *http:OAuth2ClientCredentialsGrantConfig;
    # Token URL
    string tokenUrl = "https://test.api.amadeus.com/v1/security/oauth2/token";
|};

# This is a generated connector for [Amadeus Flight Offers Search API](https://developers.amadeus.com/self-service/category/air/api-doc/flight-offers-search) OpenAPI specification. 
# This [Amadeus Flight Offers Search API](https://developers.amadeus.com/) provides the capability to search for the cheapest flight for a given itinerary.
@display {label: "Amadeus Flight Offers Search", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires clientId and clientSecret. 
    # Please create [Amadeus](https://developers.amadeus.com/register) account and Obtain clientId and clientSecret following [this guide](https://developers.amadeus.com/get-started/get-started-with-self-service-apis-335)
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://test.api.amadeus.com/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Return list of Flight Offers based on searching criteria.
    #
    # + originLocationCode - city/airport [IATA code](http://www.iata.org/publications/Pages/code-search.aspx) from which the traveler will depart, e.g. BOS for Boston 
    # + destinationLocationCode - city/airport [IATA code](http://www.iata.org/publications/Pages/code-search.aspx) to which the traveler is going, e.g. PAR for Paris 
    # + departureDate - the date on which the traveler will depart from the origin to go to the destination. Dates are specified in the [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) YYYY-MM-DD format, e.g. 2017-12-25 
    # + returnDate - the date on which the traveler will depart from the destination to return to the origin. If this parameter is not specified, only one-way itineraries are found. If this parameter is specified, only round-trip itineraries are found. Dates are specified in the [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) YYYY-MM-DD format, e.g. 2018-02-28 
    # + adults - the number of adult travelers (age 12 or older on date of departure). 
    # + children - the number of child travelers (older than age 2 and younger than age 12 on date of departure) who will each have their own separate seat. If specified, this number should be greater than or equal to 0 
    # + infants - the number of infant travelers (whose age is less or equal to 2 on date of departure). Infants travel on the lap of an adult traveler, and thus the number of infants must not exceed the number of adults. If specified, this number should be greater than or equal to 0 
    # + travelClass - most of the flight time should be spent in a cabin of this quality or higher. The accepted travel class is economy, premium economy, business or first class. If no travel class is specified, the search considers any travel class 
    # + includedAirlineCodes - This option ensures that the system will only consider these airlines. This can not be cumulated with parameter excludedAirlineCodes. Airlines are specified as [IATA airline codes](http://www.iata.org/publications/Pages/code-search.aspx) and are comma-separated, e.g. 6X,7X,8X 
    # + excludedAirlineCodes - This option ensures that the system will ignore these airlines. This can not be cumulated with parameter includedAirlineCodes. Airlines are specified as [IATA airline codes](http://www.iata.org/publications/Pages/code-search.aspx) and are comma-separated, e.g. 6X,7X,8X 
    # + nonStop - if set to true, the search will find only flights going from the origin to the destination with no stop in between 
    # + currencyCode - the preferred currency for the flight offers. Currency is specified in the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) format, e.g. EUR for Euro 
    # + maxPrice - maximum price per traveler. By default, no limit is applied. If specified, the value should be a positive number with no decimals 
    # + max - maximum number of flight offers to return. If specified, the value should be greater than or equal to 1 
    # + return - Successful Operation 
    remote isolated function getFlightOffers(string originLocationCode, string destinationLocationCode, string departureDate, int adults, string? returnDate = (), int? children = (), int? infants = (), string? travelClass = (), string? includedAirlineCodes = (), string? excludedAirlineCodes = (), boolean nonStop = false, string? currencyCode = (), int? maxPrice = (), int max = 250) returns Success|error {
        string resourcePath = string `/shopping/flight-offers`;
        map<anydata> queryParam = {"originLocationCode": originLocationCode, "destinationLocationCode": destinationLocationCode, "departureDate": departureDate, "returnDate": returnDate, "adults": adults, "children": children, "infants": infants, "travelClass": travelClass, "includedAirlineCodes": includedAirlineCodes, "excludedAirlineCodes": excludedAirlineCodes, "nonStop": nonStop, "currencyCode": currencyCode, "maxPrice": maxPrice, "max": max};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Success response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Return list of Flight Offers based on posted searching criteria.
    #
    # + xHttpMethodOverride - the HTTP method to apply 
    # + payload - list of criteria to retrieve a list of flight offers 
    # + return - Successful Operation 
    remote isolated function searchFlightOffers(string xHttpMethodOverride, byte[] payload) returns Success1|error {
        string resourcePath = string `/shopping/flight-offers`;
        map<any> headerValues = {"X-HTTP-Method-Override": xHttpMethodOverride};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload, "application/vnd.amadeus+json");
        Success1 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
