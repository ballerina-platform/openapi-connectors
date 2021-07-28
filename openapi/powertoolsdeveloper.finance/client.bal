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

import  ballerina/http;

public type ApiKeysConfig record {
    map<string> apiKeys;
};

# Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. PowerTools is the ultimate developer toolkit.
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    map<string> apiKeys;
    # Client initialization.
    #
    # + apiKeyConfig - API key configuration detail
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Error at failure of client initialization
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://connect.apptigent.com/api/utilities") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys;
    }
    # Currency - Convert currency
    #
    # + payload - Currency conversion parameters
    # + return - OK
    remote isolated function convertCurrency(InputCurrencyConversion payload) returns OutputNumber|error {
        string  path = string `/ConvertCurrency`;
        map<string|string[]> accHeaders = {'X\-IBM\-Client\-Id: self.apiKeys.get("X-IBM-Client-Id")};
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputNumber response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputNumber);
        return response;
    }
    # Currency - Format currency
    #
    # + payload - Currency format parameters
    # + return - OK
    remote isolated function formatCurrency(InputCurrencyFormat payload) returns OutputString|error {
        string  path = string `/FormatCurrency`;
        map<string|string[]> accHeaders = {'X\-IBM\-Client\-Id: self.apiKeys.get("X-IBM-Client-Id")};
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Finance - Stock prices
    #
    # + payload - Input stock prices parameters
    # + return - OK
    remote isolated function stockPrices(InputStockPrices payload) returns OutputStockPrice|error {
        string  path = string `/StockPrices`;
        map<string|string[]> accHeaders = {'X\-IBM\-Client\-Id: self.apiKeys.get("X-IBM-Client-Id")};
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputStockPrice response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputStockPrice);
        return response;
    }
    # Finance - Market index
    #
    # + payload - Input market index parameters
    # + return - OK
    remote isolated function marketIndex(InputMarketIndex payload) returns OutputMarketIndex|error {
        string  path = string `/MarketIndex`;
        map<string|string[]> accHeaders = {'X\-IBM\-Client\-Id: self.apiKeys.get("X-IBM-Client-Id")};
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputMarketIndex response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputMarketIndex);
        return response;
    }
}

# Generate header map for given header values.
#
# + headerParam - Headers  map
# + return - Returns generated map or error at failure of client initialization
isolated function  getMapForHeaders(map<any>   headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
