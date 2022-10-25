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

# This is a generated connector for [Azure Anomaly Detector API v1](https://azure.microsoft.com/en-us/services/cognitive-services/anomaly-detector/) OpenAPI specification.
# "The Anomaly Detection service detects anomalies automatically in time\ \ series data. It supports several functionalities, \r\none is for detecting the\ \ whole series with model trained by the time series, another is detecting the\ \ last point \r\nwith model trained by points before. With this service, business\ \ customers can discover incidents and establish \r\na logic flow for root cause\ \ analysis. We also provide change point detection, which is another common scenario\ \ on \r\ntime series analysis and service monitoring. Change point detection targets\ \ to discover tend changes in the time series.\r\nTo ensure online service quality\ \ is one of the main reasons we developed this service. Our team is dedicated\ \ to \r\ncontinuing to improve the anomaly detection service to provide precise\ \ results."
@display {label: "Azure Anomaly Detector", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Azure Anomaly Detector account](https://azure.microsoft.com/en-us/services/cognitive-services/anomaly-detector/) and  obtain API key following [this guide](https://docs.microsoft.com/en-us/azure/search/search-security-api-keys).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, ConnectionConfig config =  {}) returns error? {
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
    # Detect anomaly status of the latest point in time series.
    #
    # + payload - Time series points and period if needed. Advanced model parameters can also be set in the request. 
    # + return - Successful operation. 
    remote isolated function postTimeseriesLastDetect(Request payload) returns LastResponse|error {
        string resourcePath = string `/timeseries/last/detect`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LastResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Find anomalies for the entire series in batch.
    #
    # + payload - Time series points and period if needed. Advanced model parameters can also be set in the request. 
    # + return - Successful operation. 
    remote isolated function postTimeseriesEntireDetect(Request payload) returns EntireDetectResponse|error {
        string resourcePath = string `/timeseries/entire/detect`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EntireDetectResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Find trend change point for the entire series in batch.
    #
    # + payload - Time series points, granularity should be set in the request. Advanced model parameters can also be set in the request. 
    # + return - Successful operation. 
    remote isolated function postTimeseriesChangepointDetect(ChangePointDetectRequest payload) returns ChangePointDetectResponse|error {
        string resourcePath = string `/timeseries/changepoint/detect`;
        map<anydata> queryParam = {"subscription-key": self.apiKeyConfig.subscriptionKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeyConfig.ocpApimSubscriptionKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ChangePointDetectResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
