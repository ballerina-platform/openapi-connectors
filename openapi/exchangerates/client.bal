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

# This is a generated connector from [ExchangeRates-API](https://exchangeratesapi.io/documentation/) OpenAPI Specification.
# This is the public REST API for ExchangeRate-API. Fetch the latest currency exchange rates via API.
@display {label: "Exchange Rates", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Please create an [ExchangeRate-API account](https://app.exchangerate-api.com/sign-up) and obtain api-key.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://v6.exchangerate-api.com/v6/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Returns latest exchange rates in parameter-supplied base currency.
    #
    # + apikey - **API Key**. Please create an [ExchangeRate-API account](https://app.exchangerate-api.com/sign-up) and obtain api-key. 
    # + baseCurrency - **Base Currency**. *Example: USD*. You an use any of the ISO 4217 currency codes we support. See https://www.exchangerate-api.com/docs/supported-currencies 
    # + return - Successful response 
    remote isolated function getExchangeRateFor(string apikey, string baseCurrency) returns CurrencyExchangeInfomation|error {
        string resourcePath = string `/${getEncodedUri(apikey)}/latest/${getEncodedUri(baseCurrency)}`;
        CurrencyExchangeInfomation response = check self.clientEp->get(resourcePath);
        return response;
    }
}
