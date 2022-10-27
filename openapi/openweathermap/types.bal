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
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `appid`
    @display {label: "", kind: "password"}
    string appid;
|};

# Hourly forecast weather data API response
public type Hourly record {
    # Time of the forecasted data, Unix, UTC
    decimal dt?;
    # Temperature. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
    decimal temp?;
    # Temperature. This accounts for the human perception of weather.
    decimal feels_like?;
    # Atmospheric pressure on the sea level, hPa
    decimal pressure?;
    # Humidity, %
    decimal humidity?;
    # Atmospheric temperature below which water droplets begin to condense and dew can form.
    decimal dew_point?;
    # UV index
    decimal uvi?;
    # Cloudiness, %
    decimal clouds?;
    # Average visibility, metres
    decimal visibility?;
    # Wind direction, degrees (meteorological)
    decimal wind_deg?;
    # (where available) Wind gust. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour.
    decimal wind_gust?;
    # Probability of precipitatio
    decimal pop?;
    # More info Weather condition codes
    Weather[] weather?;
    # Nature of the rain
    Rain rain?;
};

# Nature of the wind
public type Wind record {
    # Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour.
    decimal speed?;
    # Wind direction, degrees (meteorological)
    int deg?;
};

# Human perception of temperature each time of the day
public type FeelsLike record {
    # Day temperature.
    decimal day?;
    # Night temperature.
    decimal night?;
    # Evening temperature.
    decimal eve?;
    # Morning temperature.
    decimal morn?;
};

# Nature of the clouds
public type Clouds record {
    # Cloudiness, %
    int all?;
};

# Snow volume information
public type Snow record {
    # Snow volume for the last 3 hours
    decimal '3h?;
};

# Minute forecast weather data API response
public type Minutely record {
    # Time of the forecasted data, unix, UTC
    decimal dt?;
    # Precipitation volume, mm
    decimal precipitation?;
};

# System data
public type Sys record {
    # Internal parameter
    int 'type?;
    # Internal parameter
    int id?;
    # Internal parameter
    decimal message?;
    # Country code (GB, JP etc.)
    string country?;
    # Sunrise time, unix, UTC
    int sunrise?;
    # Sunset time, unix, UTC
    int sunset?;
};

# Weather metadata
public type Weather record {
    # Weather condition id
    int id?;
    # Group of weather parameters (Rain, Snow, Extreme etc.)
    string main?;
    # Weather condition within the group
    string description?;
    # Weather icon id
    string icon?;
};

# City geo location
public type Coord record {
    # Longitude
    decimal lon?;
    # Latitude
    decimal lat?;
};

# Weather forecast data
public type WeatherForecast record {
    # Latitude
    decimal lat?;
    # Longtitude
    decimal lon?;
    # Timezone name for the requested location
    string timezone?;
    # Shift in seconds from UTC
    decimal timezone_offset?;
    # Current weather data API response
    ForecastCurrent current?;
    # Minutely weather forecast
    Minutely[] minutely?;
    # Hourly weather forecast
    Hourly[] hourly?;
    # Daily weather forecast
    Daily[] daily?;
    # Government weather alerts
    Alerts[] alerts?;
};

# Daily forecast weather data API response
public type Daily record {
    # Time of the forecasted data, Unix, UTC
    decimal dt?;
    # Temperature data
    Temp temp?;
    # Human perception of temperature each time of the day
    FeelsLike feels_like?;
    # The time of when the moon rises for this day, Unix, UTC
    decimal moonrise?;
    # The time of when the moon sets for this day, Unix, UTC
    decimal moonset?;
    # Moon phase. 0 and 1 are 'new moon', 0.25 is 'first quarter moon', 0.5 is 'full moon' and 0.75 is 'last quarter moon.
    decimal moon_phase?;
    # Atmospheric pressure on the sea level, hPa
    decimal pressure?;
    # Humidity, %
    decimal humidity?;
    # Atmospheric temperature below which water droplets begin to condense and dew can form.
    decimal dew_point?;
    # The maximum value of UV index for the day
    decimal uvi?;
    # Cloudiness, %
    decimal clouds?;
    # Visibility of the atmosphere
    decimal visibility?;
    # Wind direction, degrees (meteorological)
    decimal wind_deg?;
    # (where available) Wind gust. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour.
    decimal wind_gust?;
    # Probability of precipitation
    decimal pop?;
    # More info Weather condition codes
    Weather[] weather?;
    # where available) Precipitation volume, mm
    decimal rain?;
};

# Nature of the rain
public type Rain record {
    # Rain volume for the last 3 hours
    int '3h?;
};

# Temperature data
public type Temp record {
    # Day temperature.
    decimal day?;
    # Min daily temperature.
    decimal min?;
    # Max daily temperature.
    decimal max?;
    # Night temperature.
    decimal night?;
    # Evening temperature.
    decimal eve?;
    # Morning temperature
    decimal morn?;
};

# Current weather data API response
public type ForecastCurrent record {
    # Current time, Unix, UTC
    decimal dt?;
    # Sunrise time, Unix, UTC
    decimal sunrise?;
    # Sunset time, Unix, UTC
    decimal sunset?;
    # Temperature. Units - default: kelvin, metric: Celsius, imperial: Fahrenheit.
    decimal temp?;
    # Temperature. This temperature parameter accounts for the human perception of weather.
    decimal feels_like?;
    # Atmospheric pressure on the sea level, hPa
    decimal pressure?;
    # Humidity, %
    decimal humidity?;
    # Atmospheric temperature below which water droplets begin to condense and dew can form.
    decimal dew_point?;
    # Current UV index
    decimal uvi?;
    # Cloudiness, %
    decimal clouds?;
    # Average visibility, metres
    decimal visibility?;
    # Wind speed. Wind speed. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour.
    decimal wind_speed?;
    # Wind direction, degrees (meteorological)
    decimal wind_deg?;
    # More info Weather condition codes
    Weather[] weather?;
    # Nature of the rain
    Rain rain?;
    # Snow volume information
    Snow snow?;
};

# Government weather alerts
public type Alerts record {
    # Name of the alert source.
    string sender_name?;
    # Alert event name
    string event?;
    # Description of the alert
    string description?;
    # Date and time of the start of the alert, Unix, UTC
    decimal 'start?;
    # Date and time of the end of the alert, Unix, UTC
    decimal end?;
    # Tags related to alerts
    string[] tags?;
};

# Current weather data
public type CurrentWeatherData record {
    # City geo location
    Coord coord?;
    # More info Weather condition codes
    Weather[] weather?;
    # Internal parameter
    string base?;
    # Basic weather data
    Main main?;
    # Visibility, meter
    int visibility?;
    # Nature of the wind
    Wind wind?;
    # Nature of the clouds
    Clouds clouds?;
    # Nature of the rain
    Rain rain?;
    # Snow volume information
    Snow snow?;
    # Time of data calculation, unix, UTC
    int dt?;
    # System data
    Sys sys?;
    # City ID
    int id?;
    # City name
    string name?;
    # Internal parameter
    int cod?;
};

# Basic weather data
public type Main record {
    # Temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
    decimal temp?;
    # Atmospheric pressure (on the sea level, if there is no sea_level or grnd_level data), hPa
    int pressure?;
    # Humidity, %
    int humidity?;
    # Minimum temperature at the moment.
    decimal temp_min?;
    # Maximum temperature at the moment.
    decimal temp_max?;
    # Atmospheric pressure on the sea level, hPa
    decimal sea_level?;
    # Atmospheric pressure on the ground level, hPa
    decimal grnd_level?;
};
