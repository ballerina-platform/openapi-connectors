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

# a list of available timezones
public type ListJsonResponse string[];

# time zone details, as per the DateTimeJsonResponse response, in the format `key: value`, one item per line
public type DateTimeTextResponse string;

public type DateTimeJsonResponse record {
    # the abbreviated name of the timezone
    string abbreviation;
    # the IP of the client making the request
    string client_ip;
    # an ISO8601-valid string representing the current, local date/time
    string datetime;
    # current day number of the week, where sunday is 0
    int day_of_week;
    # ordinal date of the current year
    int day_of_year;
    # flag indicating whether the local time is in daylight savings
    boolean dst;
    # an ISO8601-valid string representing the datetime when daylight savings started for this timezone
    string dst_from?;
    # the difference in seconds between the current local time and daylight saving time for the location
    int dst_offset;
    # an ISO8601-valid string representing the datetime when daylight savings will end for this timezone
    string dst_until?;
    # the difference in seconds between the current local time and the time in UTC, excluding any daylight saving difference (see dst_offset)
    int raw_offset?;
    # timezone in `Area/Location` or `Area/Location/Region` format
    string timezone;
    # number of seconds since the Epoch
    int unixtime;
    # an ISO8601-valid string representing the current date/time in UTC
    string utc_datetime;
    # an ISO8601-valid string representing the offset from UTC
    string utc_offset;
    # the current week number
    int week_number;
};

public type ErrorJsonResponse record {
    # details about the error encountered
    string _error;
};

# details about the error encountered in plain text
public type ErrorTextResponse string;

# a list of available timezones, one per line
public type ListTextResponse string;
