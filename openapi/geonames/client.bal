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
    # Represents API Key `username`
    string username;
|};

# This is a generated connector for [Geonames API](https://www.geonames.org/export/JSON-webservices.html) OpenAPI specification.
# Geonames is a geographical database where users can retrieve geo location information.
@display {label: "Geonames", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Geonames account](https://www.geonames.org/login) and obtain tokens by following [this guide](https://www.geonames.org/export/web-services.html). 
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "http://api.geonames.org/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Retrieves the names found for the search term as a XML or JSON document.
    #
    # + q - The query to search over all attributes of a place. 
    # + name - The place name. 
    # + nameEquals - The exact place name. 
    # + nameStartswith - The place name starts with given characters. 
    # + maxRows - The maximal number of rows in the document returned by the service. 
    # + startRow - The starting row for the result. 
    # + country - The country codes to filter the results. 
    # + countryBias - The two letter country code to filter the results. 
    # + continentCode - The continent code to filter the results. 
    # + cities - The city population category. 
    # + operator - The the operator 'AND' searches for all terms in the placename parameter, the operator 'OR' searches for any term, default = AND. 
    # + charset - The encoding used for the document returned. 
    # + searchlang - The search will only consider names in the specified language 
    # + east - The bounding box, only features within the box are returned. 
    # + west - The bounding box, only features within the box are returned. 
    # + north - The bounding box, only features within the box are returned. 
    # + south - The bounding box, only features within the box are returned. 
    # + return - The names found for the searchterm 
    remote isolated function search(string? q = (), string? name = (), string? nameEquals = (), string? nameStartswith = (), int? maxRows = (), int? startRow = (), string? country = (), string? countryBias = (), string? continentCode = (), int? cities = (), string? operator = (), string? charset = (), string? searchlang = (), decimal? east = (), decimal? west = (), decimal? north = (), decimal? south = ()) returns SearchResponse|error {
        string resourcePath = string `/searchJSON`;
        map<anydata> queryParam = {"q": q, "name": name, "name_equals": nameEquals, "name_startsWith": nameStartswith, "maxRows": maxRows, "startRow": startRow, "country": country, "countryBias": countryBias, "continentCode": continentCode, "cities": cities, "operator": operator, "charset": charset, "searchlang": searchlang, "east": east, "west": west, "north": north, "south": south, "username": self.apiKeyConfig.username};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SearchResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a list of postal codes and places for the place name/postal code query.
    #
    # + postalcode - The query to search over all attributes of a place. Either postal code or place name must be given. 
    # + placeName - Place name. Either postal code or place name must be given. 
    # + postalcodeStartswith - Postal code starts with 
    # + placenameStartswith - Place name starts with 
    # + country - Default is all countries. The country parameter may occur more than once,country=FR,country=GP. 
    # + countryBias - Records from the countryBias are listed first. 
    # + maxRows - The maximal number of rows in the document returned by the service. 
    # + style - Style 
    # + operator - Operator 
    # + charset - Charset 
    # + isReduced - Is reduced 
    # + east - The east value for bounding box. 
    # + west - The west value for bounding box. 
    # + north - The north value for bounding box. 
    # + south - The south value for bounding box. 
    # + return - List of postalcodes and places. 
    remote isolated function searchPostalCode(string? postalcode = (), string? placeName = (), string? postalcodeStartswith = (), string? placenameStartswith = (), string? country = (), string? countryBias = (), int? maxRows = (), string? style = (), string? operator = (), string? charset = (), string? isReduced = (), decimal? east = (), decimal? west = (), decimal? north = (), decimal? south = ()) returns PostalCodeResponse|error {
        string resourcePath = string `/postalCodeSearchJSON`;
        map<anydata> queryParam = {"postalcode": postalcode, "placeName": placeName, "postalcode_startsWith": postalcodeStartswith, "placename_startsWith": placenameStartswith, "country": country, "countryBias": countryBias, "maxRows": maxRows, "style": style, "operator": operator, "charset": charset, "isReduced": isReduced, "east": east, "west": west, "north": north, "south": south, "username": self.apiKeyConfig.username};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PostalCodeResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Timezone
    #
    # + lat - The latitude to retrieve nearby postal codes. 
    # + lng - The longitude to retrieve nearby postal codes. 
    # + lang - The language which place name and country name will be returned. 
    # + return - The timezone at the lat/lng 
    remote isolated function getTimezone(decimal lat, decimal lng, string? lang = ()) returns Timezone|error {
        string resourcePath = string `/timezoneJSON`;
        map<anydata> queryParam = {"lat": lat, "lng": lng, "lang": lang, "username": self.apiKeyConfig.username};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Timezone response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a list of places for the given postal code.
    #
    # + postalcode - Postal code 
    # + country - Country 
    # + maxRows - The maximal number of rows in the document returned by the service. 
    # + return - The timezone at the lat/lng 
    remote isolated function postalCodeLookup(int? postalcode = (), string? country = (), int? maxRows = ()) returns PostalCodes|error {
        string resourcePath = string `/postalCodeLookupJSON`;
        map<anydata> queryParam = {"postalcode": postalcode, "country": country, "maxRows": maxRows, "username": self.apiKeyConfig.username};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PostalCodes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieving a list of postal codes and places for the latitude/longitude query.
    #
    # + postalcode - Postal code 
    # + country - Country 
    # + radius - Radius 
    # + maxRows - The maximal number of rows in the document returned by the service. 
    # + return - The timezone at the lat/lng 
    remote isolated function findNearbyPostalCodes(int postalcode, string country, int? radius = (), int? maxRows = ()) returns PostalCodes|error {
        string resourcePath = string `/findNearbyPostalCodesJSON`;
        map<anydata> queryParam = {"postalcode": postalcode, "country": country, "radius": radius, "maxRows": maxRows, "username": self.apiKeyConfig.username};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PostalCodes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a weather station with the most recent weather observation.
    #
    # + lat - The latitude to retrieve nearby postal codes. 
    # + lng - The longitude to retrieve nearby postal codes. 
    # + radius - Radius 
    # + return - The timezone at the lat/lng 
    remote isolated function findNearByWeather(decimal lat, decimal lng, int? radius = ()) returns WeatherObservationResponse|error {
        string resourcePath = string `/findNearByWeatherJSON`;
        map<anydata> queryParam = {"lat": lat, "lng": lng, "radius": radius, "username": self.apiKeyConfig.username};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WeatherObservationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a list of weather stations with the most recent weather observation.
    #
    # + north - The north value for bounding box. 
    # + south - The south value for bounding box. 
    # + east - The east value for bounding box. 
    # + west - The west value for bounding box. 
    # + maxRows - The maximal number of rows in the document returned by the service. 
    # + return - Returns a list of weather stations with the most recent weather observation 
    remote isolated function listWeatherStations(decimal north, decimal south, decimal east, decimal west, int? maxRows = ()) returns WeatherResponse|error {
        string resourcePath = string `/weatherJSON`;
        map<anydata> queryParam = {"north": north, "south": south, "east": east, "west": west, "maxRows": maxRows, "username": self.apiKeyConfig.username};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WeatherResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a list of weather stations with the most recent weather observation.
    #
    # + north - The north value for bounding box 
    # + south - The south value for bounding box 
    # + east - The east value for bounding box. 
    # + west - The west value for bounding box 
    # + maxRows - The maximal number of rows in the document returned by the service. 
    # + minMagnitude - Minimum magnitude 
    # + date - Date 
    # + return - Returns a list of earthquakes, ordered by magnitude 
    remote isolated function listEarthquakes(decimal north, decimal south, decimal east, decimal west, int? maxRows = (), decimal? minMagnitude = (), string? date = ()) returns EarthquakeResponse|error {
        string resourcePath = string `/earthquakesJSON`;
        map<anydata> queryParam = {"north": north, "south": south, "east": east, "west": west, "maxRows": maxRows, "minMagnitude": minMagnitude, "date": date, "username": self.apiKeyConfig.username};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EarthquakeResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
