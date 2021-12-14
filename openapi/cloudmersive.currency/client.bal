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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `Apikey`
    string apikey;
|};

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
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://testapi.cloudmersive.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
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
        AvailableCurrencyResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Converts a price from the source currency into the destination currency
    #
    # + 'source - Source currency three-digit code (ISO 4217), e.g. USD, EUR, etc. 
    # + destination - Destination currency three-digit code (ISO 4217), e.g. USD, EUR, etc. 
    # + payload - Input price, such as 19.99 in source currency 
    # + return - OK 
    remote isolated function currencyExchangeConvertCurrency(string 'source, string destination, decimal payload) returns ConvertedCurrencyResult|error {
        string resourcePath = string `/currency/exchange-rates/convert/${'source}/to/${destination}`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ConvertedCurrencyResult response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Gets the exchange rate from the source currency into the destination currency
    #
    # + 'source - Source currency three-digit code (ISO 4217), e.g. USD, EUR, etc. 
    # + destination - Destination currency three-digit code (ISO 4217), e.g. USD, EUR, etc. 
    # + return - OK 
    remote isolated function currencyExchangeGetExchangeRate(string 'source, string destination) returns ExchangeRateResult|error {
        string resourcePath = string `/currency/exchange-rates/get/${'source}/to/${destination}`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ExchangeRateResult response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
}
