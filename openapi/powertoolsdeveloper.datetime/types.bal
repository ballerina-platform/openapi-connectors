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

public type OutputString record {
    # Result
    string result?;
};

public type OutputDateInfo record {
    # DayOfYear
    decimal DayOfYear?;
    # DayOfWeek
    decimal DayOfWeek?;
    # WeekOfYear
    decimal WeekOfYear?;
    # SecondsInDay
    decimal SecondsInDay?;
    # MinutesInDay
    decimal MinutesInDay?;
    # Ticks
    decimal Ticks?;
};

public type InputDateTimeFormat record {
    # Source date and time
    string input;
    # Language culture
    string culture;
    # Output format
    string format;
};

public type InputDateTimeConversion record {
    # Source date and time
    string input;
    string 'source;
    string target;
    # Display format (defaults to 'yyyy-MM-dd HH:mm:ss')
    string format?;
};

public type InputDateTimeDifference record {
    # First date/time value
    string dateTime1;
    # Second date/time value
    string dateTime2;
};

public type InputDateTimeInfo record {
    # Source date and time
    string input;
    # Language culture
    string culture;
};

public type OutputDateDifference record {
    # Years
    decimal years?;
    # Months
    decimal months?;
    # Days
    decimal days?;
    # Hours
    decimal hours?;
    # Minutes
    decimal minutes?;
    # Milliseconds
    decimal milliseconds?;
    # Total Years
    float totalYears?;
    # Total Months
    float totalMonths?;
    # Total Days
    float totalDays?;
    # Total Hours
    float totalHours?;
    # Total Minutes
    float totalMinutes?;
    # Total Seconds
    float totalSeconds?;
    # Total Milliseconds
    float totalMilliseconds?;
    # Ticks
    decimal ticks?;
};
