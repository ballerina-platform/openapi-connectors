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

# This is a generated connector for [WorldTimeAPI v0.6.1](http://worldtimeapi.org/) OpenAPI Specification. 
# [WorldTime API](http://worldtimeapi.org/pages/faqs#what-is-it) is a simple "microservice" which returns the local-time 
# for a given timezone in both unixtime and ISO8601 format. The worldTimeAPI connector supports to get the current time 
# based on a request with a timezone and additional information including whether that timezone is currently in Daylight 
# Savings Time, when DST starts and ends, the UTC offset, etc.
@display {label: "World Time API", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials.
    # World Time API data is simple and free to access. Follow [this link](http://worldtimeapi.org/) for more details.
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "http://worldtimeapi.org/api/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # a listing of all timezones.
    #
    # + return - the list of available timezones in JSON format
    remote isolated function listTimezones() returns ListJsonResponse|error {
        string  path = string `/timezone`;
        ListJsonResponse response = check self.clientEp-> get(path, targetType = ListJsonResponse);
        return response;
    }
    # a listing of all timezones.
    #
    # + return - the list of available timezones in plain text
    remote isolated function listTimezonesAsText() returns ListTextResponse|error {
        string  path = string `/timezone.txt`;
        ListTextResponse response = check self.clientEp-> get(path, targetType = ListTextResponse);
        return response;
    }
    # a listing of all timezones available for that area.
    #
    # + area - Area
    # + return - the list of available timezones in JSON format
    remote isolated function getTimezoneByArea(string area) returns ListJsonResponse|error {
        string  path = string `/timezone/${area}`;
        ListJsonResponse response = check self.clientEp-> get(path, targetType = ListJsonResponse);
        return response;
    }
    # a listing of all timezones available for that area.
    #
    # + area - Area
    # + return - the list of available timezones in plain text
    remote isolated function getTimezoneByAreaAsText(string area) returns ListTextResponse|error {
        string  path = string `/timezone/${area}.txt`;
        ListTextResponse response = check self.clientEp-> get(path, targetType = ListTextResponse);
        return response;
    }
    # request the current time for a timezone.
    #
    # + area - Area
    # + location - location
    # + return - the current time for the timezone requested in JSON format
    remote isolated function getCurrentTime(string area, string location) returns DateTimeJsonResponse|error {
        string  path = string `/timezone/${area}/${location}`;
        DateTimeJsonResponse response = check self.clientEp-> get(path, targetType = DateTimeJsonResponse);
        return response;
    }
    # request the current time for a timezone.
    #
    # + area - Area
    # + location - Location
    # + return - the current time for the timezone requested in plain text
    remote isolated function getCurrentTimeAsText(string area, string location) returns DateTimeTextResponse|error {
        string  path = string `/timezone/${area}/${location}.txt`;
        DateTimeTextResponse response = check self.clientEp-> get(path, targetType = DateTimeTextResponse);
        return response;
    }
    # request the current time for a timezone.
    #
    # + area - Area
    # + location - Location
    # + region - Region
    # + return - the current time for the timezone requested in JSON format
    remote isolated function getCurrentTimeByRegion(string area, string location, string region) returns DateTimeJsonResponse|error {
        string  path = string `/timezone/${area}/${location}/${region}`;
        DateTimeJsonResponse response = check self.clientEp-> get(path, targetType = DateTimeJsonResponse);
        return response;
    }
    # request the current time for a timezone.
    #
    # + area - Area
    # + location - Location
    # + region - Region
    # + return - the current time for the timezone requested in plain text
    remote isolated function getCurrentTimeByRegionAsText(string area, string location, string region) returns DateTimeTextResponse|error {
        string  path = string `/timezone/${area}/${location}/${region}.txt`;
        DateTimeTextResponse response = check self.clientEp-> get(path, targetType = DateTimeTextResponse);
        return response;
    }
    # request the current time based on the ip of the request. note: this is a "best guess" obtained from open-source data.
    #
    # + return - the current time for the timezone requested in JSON format
    remote isolated function getCurrentTimeBasedOnIp() returns DateTimeJsonResponse|error {
        string  path = string `/ip`;
        DateTimeJsonResponse response = check self.clientEp-> get(path, targetType = DateTimeJsonResponse);
        return response;
    }
    # request the current time based on the ip of the request. note: this is a "best guess" obtained from open-source data.
    #
    # + return - the current time for the timezone requested in plain text
    remote isolated function getCurrentTimeBasedOnIpAsText() returns DateTimeTextResponse|error {
        string  path = string `/ip.txt`;
        DateTimeTextResponse response = check self.clientEp-> get(path, targetType = DateTimeTextResponse);
        return response;
    }
    # request the current time based on the ip of the request. note: this is a "best guess" obtained from open-source data.
    #
    # + ipv4 - IPv4 address
    # + return - the current time for the timezone requested in JSON format
    remote isolated function getCurrentTimeBasedOnIpv4(string ipv4) returns DateTimeJsonResponse|error {
        string  path = string `/ip/${ipv4}`;
        DateTimeJsonResponse response = check self.clientEp-> get(path, targetType = DateTimeJsonResponse);
        return response;
    }
    # request the current time based on the ip of the request. note: this is a "best guess" obtained from open-source data.
    #
    # + ipv4 - IPv4 address
    # + return - the current time for the timezone requested in plain text
    remote isolated function getCurrentTimeBasedOnIpv4AsText(string ipv4) returns DateTimeTextResponse|error {
        string  path = string `/ip/${ipv4}.txt`;
        DateTimeTextResponse response = check self.clientEp-> get(path, targetType = DateTimeTextResponse);
        return response;
    }
}
