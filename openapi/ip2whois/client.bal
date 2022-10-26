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

# This is a generated connector from [IP2WHOIS API v2](https://www.ip2whois.com/developers-api) OpenAPI Specification. 
# IP2WHOIS is a free tool to allow you to check WHOIS information for a particular domain, such as domain assigned owner contact information, registrar information, registrant information, location and much more.
@display {label: "IP2WHOIS", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials
    # Create a [IP2WHOIS Account](https://www.ip2whois.com/register) and obtain the API token by navigating to the [IP2WHOIS Profile](https://www.ip2whois.com/login)
    # Some operations may require passing the API Key as a parameter.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config =  {}, string serviceUrl = "https://api.ip2whois.com/v1") returns error? {
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
    # Lookup WHOIS information
    #
    # + domain - Domain name for lookup purpose. 
    # + 'key - API key. 
    # + format - Returns the API response in json (default) or xml format. 
    # + return - Get response from IP2WHOIS 
    remote isolated function getDomainInfo(string domain, string 'key, string? format = ()) returns DomainInfo|error {
        string resourcePath = string `/`;
        map<anydata> queryParam = {"domain": domain, "key": 'key, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DomainInfo response = check self.clientEp->get(resourcePath);
        return response;
    }
}
