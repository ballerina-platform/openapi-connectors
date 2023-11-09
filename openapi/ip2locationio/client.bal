// Copyright [2023] IP2Location

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import ballerina/http;

# IP2Location.io IP Geolocation API provides RESTful API to obtain visitors geolocation information such as country, region, city, latitude & longitude, ZIP code, time zone, ASN, ISP, domain, net speed, IDD code, area code, weather station data, MNC, MCC, mobile brand, elevation, usage type, address type, advertisement category and proxy data with an IP address.
@display {label: "IP2Location.io", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config =  {}, string serviceUrl = "https://api.ip2location.io") returns error? {
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
    # Geolocate user's location information via IP address
    #
    # + 'key - API key.
    # + ip - IP address (IPv4 or IPv6) for reverse IP location lookup purposes. If not present, the server IP address will be used for the location lookup.
    # + format - Format of the response message.
    # + lang - Translation information. The translation only applicable for continent, country, region and city name. This parameter is only available for Plus and Security plan only.
    # + return - Get response from IP lookup 
    remote isolated function getGeolocationInfo(string 'key, string ip, "json"|"xml"? format = (), "ar"|"cs"|"da"|"de"|"en"|"es"|"et"|"fi"|"fr"|"ga"|"it"|"ja"|"ko"|"ms"|"nl"|"pt"|"ru"|"sv"|"tr"|"vi"|"zh-cn"|"zh-tw"? lang = ()) returns json|error {
        string resourcePath = string `/`;
        map<anydata> queryParam = {"key": 'key, "ip": ip, "format": format, "lang": lang};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
}
