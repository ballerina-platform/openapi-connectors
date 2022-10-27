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

# This is a generated connector for [WebScraping.AI API v2.0.4](https://webscraping.ai/docs) OpenAPI specification.
# It provides a web scaping automation API with Chrome JS rendering, rotating proxies and builtin HTML parsing.
# More information about the WebScraping.AI API can be found at https://webscraping.ai.
@display {label: "WebScraping.AI", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [WebScraping.AI account](https://webscraping.ai) and obtain tokens from the [dashboard](https://webscraping.ai/dashboard).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.webscraping.ai") returns error? {
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
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Page HTML by URL
    #
    # + url - URL of the target page 
    # + headers - HTTP headers to pass to the target page. Can be specified either via a nested query parameter (...&headers[One]=value1&headers=[Another]=value2) or as a JSON encoded object (...&headers={"One": "value1", "Another": "value2"}) 
    # + timeout - Maximum processing time in ms. Increase it in case of timeout errors (5000 by default, maximum is 30000) 
    # + js - Execute on-page JavaScript using a headless browser (true by default) 
    # + proxy - Type of proxy, use residential proxies if your site restricts traffic from datacenters (datacenter by default). Note that residential proxy requests are more expensive than datacenter, see the pricing page for details. 
    # + return - Success 
    remote isolated function getHTML(string url, record {}? headers = (), int timeout = 5000, boolean js = true, string proxy = "datacenter") returns string|error {
        string resourcePath = string `/html`;
        map<anydata> queryParam = {"url": url, "headers": headers, "timeout": timeout, "js": js, "proxy": proxy, "api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # HTML of a selected page area by URL and CSS selector
    #
    # + selector - CSS selector (null by default, returns whole page HTML) 
    # + url - URL of the target page 
    # + headers - HTTP headers to pass to the target page. Can be specified either via a nested query parameter (...&headers[One]=value1&headers=[Another]=value2) or as a JSON encoded object (...&headers={"One": "value1", "Another": "value2"}) 
    # + timeout - Maximum processing time in ms. Increase it in case of timeout errors (5000 by default, maximum is 30000) 
    # + js - Execute on-page JavaScript using a headless browser (true by default) 
    # + proxy - Type of proxy, use residential proxies if your site restricts traffic from datacenters (datacenter by default). Note that residential proxy requests are more expensive than datacenter, see the pricing page for details. 
    # + return - Success 
    remote isolated function getSelected(string url, string? selector = (), record {}? headers = (), int timeout = 5000, boolean js = true, string proxy = "datacenter") returns string|error {
        string resourcePath = string `/selected`;
        map<anydata> queryParam = {"selector": selector, "url": url, "headers": headers, "timeout": timeout, "js": js, "proxy": proxy, "api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # HTML of multiple page areas by URL and CSS selectors
    #
    # + selectors - Multiple CSS selectors (null by default, returns whole page HTML) 
    # + url - URL of the target page 
    # + headers - HTTP headers to pass to the target page. Can be specified either via a nested query parameter (...&headers[One]=value1&headers=[Another]=value2) or as a JSON encoded object (...&headers={"One": "value1", "Another": "value2"}) 
    # + timeout - Maximum processing time in ms. Increase it in case of timeout errors (5000 by default, maximum is 30000) 
    # + js - Execute on-page JavaScript using a headless browser (true by default) 
    # + proxy - Type of proxy, use residential proxies if your site restricts traffic from datacenters (datacenter by default). Note that residential proxy requests are more expensive than datacenter, see the pricing page for details. 
    # + return - Success 
    remote isolated function getSelectedMultiple(string url, string[]? selectors = (), record {}? headers = (), int timeout = 5000, boolean js = true, string proxy = "datacenter") returns SelectedAreas|error {
        string resourcePath = string `/selected-multiple`;
        map<anydata> queryParam = {"selectors": selectors, "url": url, "headers": headers, "timeout": timeout, "js": js, "proxy": proxy, "api_key": self.apiKeyConfig.apiKey};
        map<Encoding> queryParamEncoding = {"selectors": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SelectedAreas response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Information about your account calls quota
    #
    # + return - Success 
    remote isolated function account() returns Account|error {
        string resourcePath = string `/account`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Account response = check self.clientEp->get(resourcePath);
        return response;
    }
}
