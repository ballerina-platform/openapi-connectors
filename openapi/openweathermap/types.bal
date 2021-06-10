// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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
public type WeatherForecast record {
    float lat?;
    float lon?;
    string timezone?;
    float timezone_offset?;
    ForecastCurrent current?;
    Minutely[] minutely?;
    Hourly[] hourly?;
    Daily[] daily?;
    Alerts[] alerts?;
};

public type Alerts record {
    string sender_name?;
    string event?;
    string description?;
    float 'start?;
    float end?;
    string[] tags?;
};

public type Temp record {
    float day?;
    float min?;
    float max?;
    float night?;
    float eve?;
    float morn?;
};

public type FeelsLike record {
    float day?;
    float night?;
    float eve?;
    float morn?;
};

public type Daily record {
    float dt?;
    Temp temp?;
    FeelsLike feels_like?;
    float moonrise?;
    float moonset?;
    float moon_phase?;
    float pressure?;
    float humidity?;
    float dew_point?;
    float uvi?;
    float clouds?;
    float visibility?;
    float wind_deg?;
    float wind_gust?;
    float pop?;
    Weather[] weather?;
    float rain?;
};

public type Hourly record {
    float dt?;
    float temp?;
    float feels_like?;
    float pressure?;
    float humidity?;
    float dew_point?;
    float uvi?;
    float clouds?;
    float visibility?;
    float wind_deg?;
    float wind_gust?;
    float pop?;
    Weather[] weather?;
    Rain rain?;
};

public type Minutely record {
    float dt?;
    float precipitation?;
};

public type ForecastCurrent record {
    float dt?;
    float sunrise?;
    float sunset?;
    float temp?;
    float feels_like?;
    float pressure?;
    float humidity?;
    float dew_point?;
    float uvi?;
    float clouds?;
    float visibility?;
    float wind_speed?;
    float wind_deg?;
    Weather[] weather?;
    Rain rain?;
    Snow snow?;
};

public type CurrentWeatherData record {
    Coord coord?;
    Weather[] weather?;
    string base?;
    Main main?;
    int visibility?;
    Wind wind?;
    Clouds clouds?;
    Rain rain?;
    Snow snow?;
    int dt?;
    Sys sys?;
    int id?;
    string name?;
    int cod?;
};

public type Coord record {
    float lon?;
    float lat?;
};

public type Weather record {
    int id?;
    string main?;
    string description?;
    string icon?;
};

public type Main record {
    float temp?;
    int pressure?;
    int humidity?;
    float temp_min?;
    float temp_max?;
    float sea_level?;
    float grnd_level?;
};

public type Wind record {
    float speed?;
    int deg?;
};

public type Clouds record {
    int 'all?;
};

public type Rain record {
    int '\3h?;
};

public type Snow record {
    float '\3h?;
};

public type Sys record {
    int 'type?;
    int id?;
    float message?;
    string country?;
    int sunrise?;
    int sunset?;
};
