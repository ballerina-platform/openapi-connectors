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

import ballerina/http;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
#
# + keepAlive - Specifies whether to reuse a connection for multiple requests
# + chunking - The chunking behaviour of the request
# + proxy - Proxy server related options
public type ClientHttp1Settings record {|
    KeepAlive keepAlive = KEEPALIVE_AUTO;
    Chunking chunking = CHUNKING_AUTO;
    ProxyConfig proxy?;
|};

# Defines the possible values for the keep-alive configuration in service and client endpoints.
public type KeepAlive KEEPALIVE_AUTO|KEEPALIVE_ALWAYS|KEEPALIVE_NEVER;

# Defines the possible values for the chunking configuration in HTTP services and clients.
#
# `AUTO`: If the payload is less than 8KB, content-length header is set in the outbound request/response,
# otherwise chunking header is set in the outbound request/response
# `ALWAYS`: Always set chunking header in the response
# `NEVER`: Never set the chunking header even if the payload is larger than 8KB in the outbound request/response
public type Chunking CHUNKING_AUTO|CHUNKING_ALWAYS|CHUNKING_NEVER;

# Proxy server configurations to be used with the HTTP client endpoint.
#
# + host - Host name of the proxy server
# + port - Proxy server port
# + userName - Proxy server username
# + password - Proxy server password
public type ProxyConfig record {|
    string host = "";
    int port = 0;
    string userName = "";
    @display {
        label: "",
        kind: "password"
    }
    string password = "";
|};

# Decides to keep the connection alive or not based on the `connection` header of the client request }
public const KEEPALIVE_AUTO = "AUTO";
# Keeps the connection alive irrespective of the `connection` header value }
public const KEEPALIVE_ALWAYS = "ALWAYS";
# Closes the connection irrespective of the `connection` header value }
public const KEEPALIVE_NEVER = "NEVER";

# If the payload is less than 8KB, content-length header is set in the outbound request/response,
# otherwise chunking header is set in the outbound request/response.}
public const CHUNKING_AUTO = "AUTO";
# Always set chunking header in the response.
public const CHUNKING_ALWAYS = "ALWAYS";
# Never set the chunking header even if the payload is larger than 8KB in the outbound request/response.
public const CHUNKING_NEVER = "NEVER";


public type CovidState record {
    string state;
    decimal updated;
    decimal cases;
    decimal todayCases;
    decimal deaths;
    decimal todayDeaths;
    decimal active;
    decimal casesPerOneMillion?;
    decimal deathsPerOneMillion?;
    decimal tests?;
    decimal testsPerOneMillion?;
    decimal population;
};

public type CovidCountry record {
    decimal updated?;
    string country;
    CovidcountryCountryinfo countryInfo?;
    decimal cases;
    decimal todayCases;
    decimal deaths;
    decimal todayDeaths;
    decimal recovered;
    decimal todayRecovered?;
    decimal active;
    decimal critical?;
    decimal casesPerOneMillion?;
    decimal deathsPerOneMillion?;
    decimal tests?;
    decimal testsPerOneMillion?;
    decimal population;
    string continent;
    decimal oneCasePerPeople?;
    decimal oneDeathPerPeople?;
    decimal oneTestPerPeople?;
    decimal activePerOneMillion?;
    decimal recoveredPerOneMillion?;
    decimal criticalPerOneMillion?;
};

public type InfluenzaILINet record {
    decimal updated?;
    string 'source?;
    ILINet[] data?;
};

public type Vaccines record {
    string 'source?;
    string totalCandidates?;
    Phases[] phases?;
    Vaccine[] data?;
};

public type TimelineDeaths record {
    decimal date?;
};

public type CovidContinent record {
    decimal updated;
    decimal cases;
    decimal todayCases;
    decimal deaths;
    decimal todayDeaths;
    decimal recovered?;
    decimal todayRecovered?;
    decimal active;
    decimal critical;
    decimal casesPerOneMillion?;
    decimal deathsPerOneMillion?;
    decimal tests?;
    decimal testsPerOneMillion?;
    decimal population?;
    string continent?;
    decimal activePerOneMillion?;
    decimal recoveredPerOneMillion?;
    decimal criticalPerOneMillion?;
    CovidcontinentContinentinfo continentInfo?;
    string[] countries?;
};

public type CovidAppleSubregions record {
    string country?;
    string[] subregions?;
};

public type Phases record {
    string phase?;
    string candidates?;
};

public type CovidHistoricalUSCounty CovidhistoricaluscountyInner[];

public type FullvaccinetimelineInner record {
    decimal total?;
    decimal daily?;
    decimal totalPerHundred?;
    decimal dailyPerMillion?;
    string date?;
};

public type USCL record {
    string week?;
    decimal totalA?;
    decimal totalB?;
    decimal percentPositiveA?;
    decimal percentPositiveB?;
    decimal totalTests?;
    decimal percentPositive?;
};

public type USPHL record {
    string week?;
    decimal 'A\(H3N2v\)?;
    decimal 'A\(H1N1\)?;
    decimal 'A\(H3\)?;
    decimal 'A\(unable\ to\ sub\-type\)\+?;
    decimal 'A\(Subtyping\ not\ performed\)?;
    decimal B?;
    decimal BVIC?;
    decimal totalTests?;
};

public type InfluenzaUSCL record {
    decimal updated?;
    string 'source?;
    USCL[] data?;
};

public type CovidcontinentContinentinfo record {
    decimal lat?;
    decimal long?;
};

public type CovidHistoricalProvinces CovidHistoricalProvince[];

public type CovidNYTUSA CovidnytusaInner[];

public type InfluenzaUSPHL record {
    decimal updated?;
    string 'source?;
    USPHL[] data?;
};

public type CovidHistoricalAll record {
    TimelineDeaths cases;
    TimelineDeaths deaths;
    TimelineDeaths recovered;
};

public type CovidjhucountryCoordinates record {
    string latitude?;
    string longitude?;
};

public type CovidContinents CovidContinent[];

public type CovidHistoricalCountry record {
    string country?;
    string[] province?;
    Timeline timeline?;
};

public type Therapeutics record {
    string 'source?;
    string totalCandidates?;
    Phases[] phases?;
    Therapeutic[] data?;
};

public type CovidJHUCountry record {
    string country;
    string? county?;
    string updatedAt?;
    CovidjhucountryStats stats;
    CovidjhucountryCoordinates coordinates?;
    string? province?;
};

public type CovidcountryCountryinfo record {
    decimal? _id?;
    string? iso2?;
    string? iso3?;
    decimal lat?;
    decimal long?;
    string flag?;
};

public type CovidhistoricaluscountyInner record {
    string province?;
    string county?;
    Timeline timeline?;
};

public type CovidNYTCounty CovidnytcountyInner[];

public type CovidJHUCountries CovidJHUCountry[];

public type VaccineStatesCoverage VaccineStateCoverage[];

public type VaccineCoverage SimpleVaccineTimeline|FullVaccineTimeline;

public type CovidHistoricalUSCounties string[];

public type CovidAll record {
    decimal updated;
    decimal cases;
    decimal todayCases;
    decimal deaths;
    decimal todayDeaths;
    decimal recovered;
    decimal todayRecovered;
    decimal active;
    decimal critical;
    decimal casesPerOneMillion?;
    decimal deathsPerOneMillion?;
    decimal tests?;
    decimal testsPerOneMillion?;
    decimal population;
    decimal oneCasePerPeople?;
    decimal oneDeathPerPeople?;
    decimal oneTestPerPeople?;
    decimal activePerOneMillion?;
    decimal recoveredPerOneMillion?;
    decimal criticalPerOneMillion?;
    decimal affectedCountries?;
};

public type CovidnytusaInner record {
    string date?;
    decimal cases?;
    decimal deaths?;
};

public type CovidAppleData record {
    string country?;
    string subregion?;
    CovidappledataData[] data?;
};

public type CovidAppleCountries string[];

public type VaccineCountryCoverage record {
    string country?;
    SimpleVaccineTimeline|FullVaccineTimeline timeline?;
};

public type ILINet record {
    string week?;
    decimal 'age\ 5\-24?;
    decimal 'age\ 25\-49?;
    decimal 'age\ 50\-64?;
    decimal 'age\ 64\+?;
    decimal totalILI?;
    decimal totalPatients?;
    decimal percentUnweightedILI?;
    decimal percentWeightedILI?;
};

public type VaccineCountriesCoverage VaccineCountryCoverage[];

public type CovidStates CovidState[];

public type CovidGov string[];

public type CovidhistoricalInner record {
    string country;
    string? province?;
    Timeline timeline;
};

public type CovidappledataData record {
    string 'sub\-region?;
    string subregion_and_city?;
    string geo_type?;
    string date?;
    decimal driving?;
    decimal transit?;
    decimal walking?;
};

public type CovidCountries CovidCountry[];

public type FullVaccineTimeline FullvaccinetimelineInner[];

public type CovidjhucountryStats record {
    decimal confirmed;
    decimal deaths;
    decimal? recovered?;
};

public type CovidnytstateInner record {
    string date;
    string state;
    string fips;
    decimal cases;
    decimal deaths;
};

public type Therapeutic record {
    string medicationClass?;
    string[] tradeName?;
    string details?;
    string[] developerResearcher?;
    string[] sponsors?;
    string trialPhase?;
    string lastUpdate?;
};

public type Vaccine record {
    string candidate?;
    string mechanism?;
    string[] sponsors?;
    string details?;
    string trialPhase?;
    string[] institutions?;
};

public type CovidHistorical CovidhistoricalInner[];

public type CovidJHUCounty record {
    string country;
    string province;
    string county;
    string updatedAt?;
    CovidjhucountryStats stats?;
    CovidjhucountryCoordinates coordinates?;
};

public type CovidJHUCounties CovidJHUCounty[];

public type CovidHistoricalProvince record {
    string country?;
    string province?;
    Timeline timeline?;
};

public type Timeline record {
    Cases cases;
    TimelineDeaths deaths;
    TimelineDeaths recovered;
};

public type CovidHistoricalCountries CovidHistoricalCountry[];

public type VaccineStateCoverage record {
    string state?;
    SimpleVaccineTimeline|FullVaccineTimeline timeline?;
};

public type CovidNYTState CovidnytstateInner[];

public type CovidnytcountyInner record {
    string date?;
    string county?;
    string state?;
    string fips?;
    decimal cases?;
    decimal deaths?;
};

public type SimpleVaccineTimeline record {
    decimal date?;
};

public type Cases record {
    decimal date?;
};
