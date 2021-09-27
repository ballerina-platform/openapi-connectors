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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector from [NOWPayments API v1](https://nowpayments.io/) OpenAPI Specification. 
# NOWPayments is a non-custodial cryptocurrency payment processing platform. 
# Accept payments in a wide range of cryptos and get them instantly converted into a coin of your choice and sent to your wallet. Keeping it simple – no excess.
@display {label: "Nowpayments", iconPath: "resources/nowpayments.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials
    # Create an [NOWPayments Account](https://account.nowpayments.io/create-account) and obtain tokens by following [this guide](https://documenter.getpostman.com/view/7907941/S1a32n38?version=latest)
    #
    # + apiKeyConfig - Provide your API Key as x-api-key. Eg: {"x-api-key" : "<Your API Key>"}
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.nowpayments.io") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # 3. Get estimated price
    #
    # + return - 3. Get estimated price
    remote isolated function getEstimatedPrice(string? amount = (), string? currencyFrom = (), string? currencyTo = ()) returns ApproximatePrice|error {
        string  path = string `/v1/estimate`;
        map<anydata> queryParam = {"amount": amount, "currency_from": currencyFrom, "currency_to": currencyTo};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeys["x-api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ApproximatePrice response = check self.clientEp-> get(path, accHeaders, targetType = ApproximatePrice);
        return response;
    }
    # 6. Get the minimum payment amount
    #
    # + return - 6. Get the minimum payment amount
    remote isolated function getTheMinimumPaymentAmount(string? currencyFrom = (), string? currencyTo = ()) returns MinimumPayment|error {
        string  path = string `/v1/min-amount`;
        map<anydata> queryParam = {"currency_from": currencyFrom, "currency_to": currencyTo};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeys["x-api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MinimumPayment response = check self.clientEp-> get(path, accHeaders, targetType = MinimumPayment);
        return response;
    }
    # 7. Get list of payments
    #
    # + return - 7.Get list of payments
    remote isolated function getListOfPayments(string? 'limit = (), string? page = (), string? sortBy = (), string? orderBy = (), string? dateFrom = (), string? dateTo = ()) returns PaymentListResponse|error {
        string  path = string `/v1/payment/`;
        map<anydata> queryParam = {"limit": 'limit, "page": page, "sortBy": sortBy, "orderBy": orderBy, "dateFrom": dateFrom, "dateTo": dateTo};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeys["x-api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PaymentListResponse response = check self.clientEp-> get(path, accHeaders, targetType = PaymentListResponse);
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

# Generate header map for given header values.
#
# + headerParam - Headers  map
# + return - Returns generated map or error at failure of client initialization
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
