// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

public type Timezone record {
    string sunrise?;
    decimal lng?;
    string countryCode?;
    int gmtOffset?;
    int rawOffset?;
    string sunset?;
    string timezoneId?;
    int dstOffset?;
    string countryName?;
    string time?;
    decimal lat?;
};

public type GeonamesInner record {
    string ing?;
    int geonameid?;
    string countrycode?;
    string name?;
    string fclName?;
    string toponymName?;
    string fcodeName?;
    string wikipedia?;
    string lat?;
    string fcl?;
    int population?;
    string fcode?;
};

public type PostalCodeResponse record {
    Geonames geonames?;
};

public type Earthquake record {
    string datetime?;
    decimal depth?;
    decimal lng?;
    string src?;
    string eqid?;
    decimal magnitude?;
    decimal lat?;
};

public type EarthquakeResponse record {
    Earthquake[] earthquakes?;
};

public type WeatherResponse WeatherObservation[];

public type PostalCodes record {
    PostalCode[] postalcodes?;
};

public type PostalCode record {
    string adminCode1?;
    string adminCode2?;
    string adminCode3?;
    string adminName1?;
    string adminName2?;
    string adminName3?;
    string countryCode?;
    string distance?;
    decimal lat?;
    decimal lng?;
    string placeName?;
    string postalCode?;
};

public type Geonames GeonamesInner[];

public type WeatherObservationResponse record {
    WeatherObservation WeatherObservation?;
};

public type WeatherObservation record {
    string clouds?;
    string cloudsCode?;
    string countrycode?;
    string datetime?;
    string dewPoint?;
    decimal elevation?;
    decimal hectoPascAltimeter?;
    decimal humidity?;
    string ICAO?;
    decimal lat?;
    decimal ing?;
    string observation?;
    decimal seaLevelPressure?;
    string stationName?;
    string temperature?;
    string weatherCondition?;
    string windSpeed?;
    int windDirection?;
};

public type SearchResponse record {
    int totalResultsCount?;
    Geonames geonames?;
};
