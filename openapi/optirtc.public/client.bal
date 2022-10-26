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

# This is a generated connector for [Optirtc Public API v1.0](https://docs.optirtc.com/api/opti-publicapi-v1.html) OpenAPI specification.
# The Opti Public API provides a simple, read-only interface to access metadata and the last 3 days of real-time data points of all metrics in an Opti Platform Account:
# * **Web developers** can use the Public API to display real-time metrics from Opti facilities on their own websites - no backend database required.
# * **Systems integrators** can use the Public API to pull data into their own GIS or ETL systems, for example, to connect real-time stormwater conditions to their existing asset management software.
# * **Analysts** can use the Public API to pull data into their analysis scripts for repeated analysis.
# To learn about how Opti's data-driven products are enhancing community resilience to heavy rainfall across North America, see the [Opti Home Page](https://www.optirtc.com).
# OptiRTC provides simple examples of using open-source technologies to interact with the OptiRTC Public API. Find out more on our [Github page.](https://github.com/OptiRTC/OptiRTC-API-examples)
@display {label: "Optirtc Public", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Optirtc account](https://www.optirtc.com) and obtain tokens by following [this guide](https://docs.optirtc.com/api/opti-publicapi-v1.html#section/Authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://public.optirtc.com/api") returns error? {
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
    # Datastream
    #
    # + at - ISO-8601 Date String in UTC. (yyyy-mm-dd or yyyy-mm-ddThh:mm:ssZ); if omitted, server will interpret as “now”. 
    # + top - Limit results to the first top ordered by Id. 
    # + skiptoken - Paging parameter to return the page after this number of results. 
    # + return - Lists the DataStreams available with the provided API key. 
    remote isolated function datastream(string? at = (), int? top = (), int? skiptoken = ()) returns DataStreamPageResult|error {
        string resourcePath = string `/Datastream`;
        map<anydata> queryParam = {"at": at, "top": top, "skiptoken": skiptoken, "key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DataStreamPageResult response = check self.clientEp->get(resourcePath);
        return response;
    }
    # DataPoint-Get-Range
    #
    # + dataStreamId - Id property of the DataStream to get DataPoints of. See the [Datastream endpoint](#operation/datastream) for the DataStreams this API key can access. 
    # + historicalId - Id property of the historical DataPoint, inclusive. This should have a bigger value than the modernId. Specifying 1 less than the id of the most-modern DataPoint you have received as the historicalId will return all DataPoints that have been created since you last requested DataPoints of this DataStream. 
    # + modernId - Id property of the modern DataPoint, inclusive. This should have a smaller value than the historicalId. 
    # + utcHistorical - Historical time boundary of datapoints to return. ISO-8601. 
    # + utcModern - Modern time boundary of datapoints to return. ISO-8601. 
    # + skiptoken - Paging parameter. Skip this many of the most-recent values, given other query string parameters. 
    # + top - Paging parameter. Return this many of the most-recent values, given other query string parameters. 
    # + verbosity - Scope of data request. Either `identity` (default) or `display`. See [/api/datapointverbosity/](#operation/get-datapoint-verbosities) for additional information. 
    # + unit - Abbreviation of the unit in which to return data. May be null, in which case the stored unit of the datastream will be used. 
    # + return - A page of data points matching your query, including a link to follow for the next page if there are more data points in the full response to the client's request. 
    remote isolated function datapointGetRange(int dataStreamId, string? historicalId = (), string? modernId = (), string? utcHistorical = (), string? utcModern = (), string? skiptoken = (), int? top = (), string? verbosity = (), string? unit = ()) returns DataPointPage|error {
        string resourcePath = string `/DataPoint`;
        map<anydata> queryParam = {"dataStreamId": dataStreamId, "historicalId": historicalId, "modernId": modernId, "utcHistorical": utcHistorical, "utcModern": utcModern, "skiptoken": skiptoken, "top": top, "verbosity": verbosity, "unit": unit, "key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DataPointPage response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get-DataPoint-Verbosities
    #
    # + return - Lists the options available in for use with the Public API. 
    remote isolated function getDatapointVerbosities() returns DataPointVerbosityList|error {
        string resourcePath = string `/DataPointVerbosity`;
        map<anydata> queryParam = {"key": self.apiKeyConfig.'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DataPointVerbosityList response = check self.clientEp->get(resourcePath);
        return response;
    }
}
