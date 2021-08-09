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

public type GeolocationSecurity record {
    boolean is_vpn?;
};

public type Geolocation record {
    string? continent?;
    string? country?;
    GeolocationFlag flag?;
    int? country_geoname_id?;
    string? city?;
    int? city_geoname_id?;
    boolean country_is_eu?;
    GeolocationTimezone timezone?;
    decimal? latitude?;
    string? continent_code?;
    string? ip_address?;
    int? region_geoname_id?;
    string? region_iso_code?;
    string? country_code?;
    GeolocationSecurity security?;
    GeolocationCurrency currency?;
    GeolocationConnection connection?;
    string? region?;
    string? postal_code?;
    int? continent_geoname_id?;
    decimal? longitude?;
};

public type GeolocationCurrency record {
    string currency_name?;
    string currency_code?;
};

public type GeolocationConnection record {
    string? isp_name?;
    string? connection_type?;
    string? organization_name?;
    string? autonomous_system_organization?;
    int? autonomous_system_number?;
};

public type GeolocationFlag record {
    string? emoji?;
    string? svg?;
    string? png?;
    string? unicode?;
};

public type GeolocationTimezone record {
    string? name?;
    int? gmt_offset?;
    string? abbreviation?;
    string? current_time?;
    boolean is_dst?;
};
