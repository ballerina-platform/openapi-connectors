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
import ballerina/url;
import ballerina/lang.'string;

public type ApiKeysConfig record {
    map<string> apiKeys;
};

# This is a generated connector for [WebScraping.AI API v2.0.4](https://webscraping.ai/docs) OpenAPI specification.
# It provides a web scaping automation API with Chrome JS rendering, rotating proxies and builtin HTML parsing.
# More information about the WebScraping.AI API can be found at https://webscraping.ai.
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [WebScraping.AI account](https://webscraping.ai) and obtain tokens from the [dashboard](https://webscraping.ai/dashboard).
    #
    # + apiKeyConfig - Provide your API key as `api_key`. Eg: `{"api_key" : "<API key>"}`
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.webscraping.ai") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Page HTML by URL
    #
    # + url - URL of the target page
    # + headers - HTTP headers to pass to the target page. Can be specified either via a nested query parameter (...&headers[One]=value1&headers=[Another]=value2) or as a JSON encoded object (...&headers={"One": "value1", "Another": "value2"})
    # + timeout - Maximum processing time in ms. Increase it in case of timeout errors (5000 by default, maximum is 30000)
    # + js - Execute on-page JavaScript using a headless browser (true by default)
    # + proxy - Type of proxy, use residential proxies if your site restricts traffic from datacenters (datacenter by default). Note that residential proxy requests are more expensive than datacenter, see the pricing page for details.
    # + return - Parameters validation error
    remote isolated function getHTML(string url, record {}? headers = (), int timeout = 5000, boolean js = true, string proxy = "datacenter") returns string|error {
        string  path = string `/html`;
        map<anydata> queryParam = {"url": url, "headers": headers, "timeout": timeout, "js": js, "proxy": proxy, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # HTML of a selected page area by URL and CSS selector
    #
    # + url - URL of the target page
    # + selector - CSS selector (null by default, returns whole page HTML)
    # + headers - HTTP headers to pass to the target page. Can be specified either via a nested query parameter (...&headers[One]=value1&headers=[Another]=value2) or as a JSON encoded object (...&headers={"One": "value1", "Another": "value2"})
    # + timeout - Maximum processing time in ms. Increase it in case of timeout errors (5000 by default, maximum is 30000)
    # + js - Execute on-page JavaScript using a headless browser (true by default)
    # + proxy - Type of proxy, use residential proxies if your site restricts traffic from datacenters (datacenter by default). Note that residential proxy requests are more expensive than datacenter, see the pricing page for details.
    # + return - Parameters validation error
    remote isolated function getSelected(string url, string? selector = (), record {}? headers = (), int timeout = 5000, boolean js = true, string proxy = "datacenter") returns string|error {
        string  path = string `/selected`;
        map<anydata> queryParam = {"selector": selector, "url": url, "headers": headers, "timeout": timeout, "js": js, "proxy": proxy, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # HTML of multiple page areas by URL and CSS selectors
    #
    # + url - URL of the target page
    # + selectors - Multiple CSS selectors (null by default, returns whole page HTML)
    # + headers - HTTP headers to pass to the target page. Can be specified either via a nested query parameter (...&headers[One]=value1&headers=[Another]=value2) or as a JSON encoded object (...&headers={"One": "value1", "Another": "value2"})
    # + timeout - Maximum processing time in ms. Increase it in case of timeout errors (5000 by default, maximum is 30000)
    # + js - Execute on-page JavaScript using a headless browser (true by default)
    # + proxy - Type of proxy, use residential proxies if your site restricts traffic from datacenters (datacenter by default). Note that residential proxy requests are more expensive than datacenter, see the pricing page for details.
    # + return - Parameters validation error
    remote isolated function getSelectedMultiple(string url, string[]? selectors = (), record {}? headers = (), int timeout = 5000, boolean js = true, string proxy = "datacenter") returns string|error {
        string  path = string `/selected-multiple`;
        map<anydata> queryParam = {"selectors": selectors, "url": url, "headers": headers, "timeout": timeout, "js": js, "proxy": proxy, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Information about your account calls quota
    #
    # + return - Wrong API key
    remote isolated function account() returns Account|error {
        string  path = string `/account`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        Account response = check self.clientEp-> get(path, targetType = Account);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
