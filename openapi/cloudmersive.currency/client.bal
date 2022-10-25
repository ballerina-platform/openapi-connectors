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

# This is a generated connector from [Cloudmersive](https://account.cloudmersive.com) OpenAPI specification.
# The Cloudmersive Currency APIs help you retrieve exchange rates and convert prices between currencies.
@display {label: "Cloudmersive Currency", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Cloudmersive account](https://account.cloudmersive.com/login) and obtain tokens following [this guide](https://account.cloudmersive.com/keys).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://testapi.cloudmersive.com/") returns error? {
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
    # Get a list of available currencies and corresponding countries
    #
    # + return - OK 
    remote isolated function currencyExchangeGetAvailableCurrencies() returns AvailableCurrencyResponse|error {
        string resourcePath = string `/currency/exchange-rates/list-available`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        AvailableCurrencyResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Converts a price from the source currency into the destination currency
    #
    # + 'source - Source currency three-digit code (ISO 4217), e.g. USD, EUR, etc. 
    # + destination - Destination currency three-digit code (ISO 4217), e.g. USD, EUR, etc. 
    # + payload - Input price, such as 19.99 in source currency 
    # + return - OK 
    remote isolated function currencyExchangeConvertCurrency(string 'source, string destination, decimal payload) returns ConvertedCurrencyResult|error {
        string resourcePath = string `/currency/exchange-rates/convert/${getEncodedUri('source)}/to/${getEncodedUri(destination)}`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ConvertedCurrencyResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets the exchange rate from the source currency into the destination currency
    #
    # + 'source - Source currency three-digit code (ISO 4217), e.g. USD, EUR, etc. 
    # + destination - Destination currency three-digit code (ISO 4217), e.g. USD, EUR, etc. 
    # + return - OK 
    remote isolated function currencyExchangeGetExchangeRate(string 'source, string destination) returns ExchangeRateResult|error {
        string resourcePath = string `/currency/exchange-rates/get/${getEncodedUri('source)}/to/${getEncodedUri(destination)}`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ExchangeRateResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
