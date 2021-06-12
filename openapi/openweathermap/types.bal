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
    # Current weather data
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
    # (more info Weather condition codes)
    Weather[] weather?;
    # where available) Precipitation volume, mm
    decimal rain?;
};

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
    # (more info Weather condition codes)
    Weather[] weather?;
    # Where available) Precipitation volume, mm
    Rain rain?;
};

# Minute forecast weather data API response
public type Minutely record {
    # Time of the forecasted data, unix, UTC
    decimal dt?;
    # Precipitation volume, mm
    decimal precipitation?;
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
    # (more info Weather condition codes)
    Weather[] weather?;
    # where available) Precipitation volume, mm
    Rain rain?;
    # Nature of the Snow
    Snow snow?;
};

# Current weather data
public type CurrentWeatherData record {
    # City geo location
    Coord coord?;
    # (more info Weather condition codes)
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
    # Nature of the snow
    Snow snow?;
    # Time of data calculation, unix, UTC
    int dt?;
    # Internal data
    Sys sys?;
    # City ID
    int id?;
    # City name
    string name?;
    # Internal parameter
    int cod?;
};

# City geo location
public type Coord record {
    # Longitude
    decimal lon?;
    # Latitude
    decimal lat?;
};

# Weather
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

# Nature of the wind
public type Wind record {
    # Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour.
    decimal speed?;
    # Wind direction, degrees (meteorological)
    int deg?;
};

# Nature of the clounds
public type Clouds record {
    # Cloudiness, %
    int 'all?;
};

# Nature of the rain
public type Rain record {
    # Rain volume for the last 3 hours
    int '\3h?;
};

# Snow
public type Snow record {
    # Snow volume for the last 3 hours
    decimal '\3h?;
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
