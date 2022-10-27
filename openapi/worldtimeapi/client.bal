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

# This is a generated connector for [WorldTimeAPI v0.6.1](http://worldtimeapi.org/) OpenAPI Specification.
# [WorldTime API](http://worldtimeapi.org/pages/faqs#what-is-it) is a simple "microservice" which returns the local-time for a given timezone in both unixtime and ISO8601 format. The worldTimeAPI connector supports to get the current time based on a request with a timezone and additional information including whether that timezone is currently in Daylight Savings Time, when DST starts and ends, the UTC offset, etc.
@display {label: "World Time API", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials.
    # World Time API data is simple and free to access. Follow [this link](http://worldtimeapi.org/) for more details.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config =  {}, string serviceUrl = "http://worldtimeapi.org/api/") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # a listing of all timezones.
    #
    # + return - the list of available timezones in JSON format 
    remote isolated function listTimezones() returns ListJsonResponse|error {
        string resourcePath = string `/timezone`;
        ListJsonResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # a listing of all timezones.
    #
    # + return - the list of available timezones in plain text 
    remote isolated function listTimezonesAsText() returns ListTextResponse|error {
        string resourcePath = string `/timezone.txt`;
        ListTextResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # a listing of all timezones available for that area.
    #
    # + area - Area 
    # + return - the list of available timezones in JSON format 
    remote isolated function getTimezoneByArea(string area) returns ListJsonResponse|error {
        string resourcePath = string `/timezone/${getEncodedUri(area)}`;
        ListJsonResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # a listing of all timezones available for that area.
    #
    # + area - Area 
    # + return - the list of available timezones in plain text 
    remote isolated function getTimezoneByAreaAsText(string area) returns ListTextResponse|error {
        string resourcePath = string `/timezone/${getEncodedUri(area)}.txt`;
        ListTextResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # request the current time for a timezone.
    #
    # + area - Area 
    # + location - location 
    # + return - the current time for the timezone requested in JSON format 
    remote isolated function getCurrentTime(string area, string location) returns DateTimeJsonResponse|error {
        string resourcePath = string `/timezone/${getEncodedUri(area)}/${getEncodedUri(location)}`;
        DateTimeJsonResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # request the current time for a timezone.
    #
    # + area - Area 
    # + location - Location 
    # + return - the current time for the timezone requested in plain text 
    remote isolated function getCurrentTimeAsText(string area, string location) returns DateTimeTextResponse|error {
        string resourcePath = string `/timezone/${getEncodedUri(area)}/${getEncodedUri(location)}.txt`;
        DateTimeTextResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # request the current time for a timezone.
    #
    # + area - Area 
    # + location - Location 
    # + region - Region 
    # + return - the current time for the timezone requested in JSON format 
    remote isolated function getCurrentTimeByRegion(string area, string location, string region) returns DateTimeJsonResponse|error {
        string resourcePath = string `/timezone/${getEncodedUri(area)}/${getEncodedUri(location)}/${getEncodedUri(region)}`;
        DateTimeJsonResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # request the current time for a timezone.
    #
    # + area - Area 
    # + location - Location 
    # + region - Region 
    # + return - the current time for the timezone requested in plain text 
    remote isolated function getCurrentTimeByRegionAsText(string area, string location, string region) returns DateTimeTextResponse|error {
        string resourcePath = string `/timezone/${getEncodedUri(area)}/${getEncodedUri(location)}/${getEncodedUri(region)}.txt`;
        DateTimeTextResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # request the current time based on the ip of the request. note: this is a "best guess" obtained from open-source data.
    #
    # + return - the current time for the timezone requested in JSON format 
    remote isolated function getCurrentTimeBasedOnIp() returns DateTimeJsonResponse|error {
        string resourcePath = string `/ip`;
        DateTimeJsonResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # request the current time based on the ip of the request. note: this is a "best guess" obtained from open-source data.
    #
    # + return - the current time for the timezone requested in plain text 
    remote isolated function getCurrentTimeBasedOnIpAsText() returns DateTimeTextResponse|error {
        string resourcePath = string `/ip.txt`;
        DateTimeTextResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # request the current time based on the ip of the request. note: this is a "best guess" obtained from open-source data.
    #
    # + ipv4 - IPv4 address 
    # + return - the current time for the timezone requested in JSON format 
    remote isolated function getCurrentTimeBasedOnIpv4(string ipv4) returns DateTimeJsonResponse|error {
        string resourcePath = string `/ip/${getEncodedUri(ipv4)}`;
        DateTimeJsonResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # request the current time based on the ip of the request. note: this is a "best guess" obtained from open-source data.
    #
    # + ipv4 - IPv4 address 
    # + return - the current time for the timezone requested in plain text 
    remote isolated function getCurrentTimeBasedOnIpv4AsText(string ipv4) returns DateTimeTextResponse|error {
        string resourcePath = string `/ip/${getEncodedUri(ipv4)}.txt`;
        DateTimeTextResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
