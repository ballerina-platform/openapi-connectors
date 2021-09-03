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

public type OutputactivityforecastResult record {
    # Name
    string name?;
    # Date
    string date?;
    # Quality of weather for specified activity
    string quality?;
    # General quality rating
    decimal rating?;
    # Description
    string description?;
};

public type OutputdailyforecastResult record {
    # Date
    string date?;
    # Low temperature
    string low?;
    # High temperature
    string high?;
    # Hours of Sunlight
    decimal sunlight?;
    # Relative air quality
    string airQuality?;
    # Description
    string description?;
    # Observable precipitation
    boolean precipitation?;
    # Chance of precipitiation
    decimal precipitationProbability?;
    # Type of precipitation
    string precipitationType?;
    # Hours of precipitation
    decimal hoursPrecipitation?;
    # Probability of rain
    decimal rainProbability?;
    # Probability of snow
    decimal snowProbability?;
    # Probability of ice
    decimal iceProbability?;
    # Probability of thunderstorms
    decimal thunderstormProbability?;
    # Wind direction
    string windDirection?;
    # Wind speed
    string windSpeed?;
    # Wind gust
    string windGust?;
    # Total rain
    string totalRain?;
    # Total snow
    string totalSnow?;
    # Total ice
    string totalIce?;
    # Cloud cover
    decimal cloudCover?;
};

public type OutputDailyForecast record {
    # Daily weather forecast
    OutputdailyforecastResult[] result?;
};

public type OutputWeatherConditions record {
    # Description
    string description?;
    # Precipitation
    boolean precipitation?;
    # Accumulated precipitation (24 hours)
    string accumulatedPrecipitation?;
    # Temperature
    decimal temperature?;
    # Wind Chill
    decimal windChill?;
    # Relative humidity
    decimal humidity?;
    # Dew point
    decimal dewPoint?;
    # Wind direction
    string windDirection?;
    # Daylight savings time start date
    string dstStart?;
    # Wind speed
    string windSpeed?;
    # Wind gusts (max)
    string windGust?;
    # UV Index
    decimal uvIndex?;
    # UV Level
    string uvDescription?;
    # Visbility
    string visibility?;
    # Cloud cover
    decimal cloudCover?;
    # Ceiling
    string ceiling?;
    # Barometric pressure
    string pressure?;
    # Barometric pressure trend
    string pressureTendency?;
};

public type InputWeatherConditions record {
    # Full or partial address
    string 'source;
    # Units
    string units;
};

public type OutputhourlyforecastResult record {
    # Date
    string date?;
    # Description
    string description?;
    # Temperature
    string temperature?;
    # Dew point
    string dewPoint?;
    # Relative humidity
    decimal relativeHumidity?;
    # Visibility
    string visibility?;
    # UV Index
    string uvIndex?;
    # Observable precipitation
    boolean precipitation?;
    # Chance of precipitiation
    decimal precipitationProbability?;
    # Probability of rain
    decimal rainProbability?;
    # Probability of snow
    decimal snowProbability?;
    # Probability of ice
    decimal iceProbability?;
    # Wind direction
    string windDirection?;
    # Wind speed
    string windSpeed?;
    # Wind gust
    string windGust?;
    # Total rain
    string totalRain?;
    # Total snow
    string totalSnow?;
    # Total ice
    string totalIce?;
    # Ceiling
    string ceiling?;
    # Cloud cover
    decimal cloudCover?;
};

public type OutputHourlyForecast record {
    # Daily weather forecast
    OutputhourlyforecastResult[] result?;
};

public type InputWeatherActivityForecast record {
    # Full or partial address
    string 'source;
    # Weather-related activity
    string activity;
};

public type OutputActivityForecast record {
    # Current weather-related activity forecast
    OutputactivityforecastResult[] result?;
};

public type InputWeatherHourlyForecast record {
    # Full or partial address
    string 'source;
    # Units
    string units;
    # Duration
    decimal duration;
};

public type InputWeatherDailyForecast record {
    # Full or partial address
    string 'source;
    # Units
    string units;
    # Duration
    decimal duration;
};
