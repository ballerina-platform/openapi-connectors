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

# This is a generated connector for [Azure Anomaly Detector API v1](https://azure.microsoft.com/en-us/services/cognitive-services/anomaly-detector/) OpenAPI specification.
# "The Anomaly Detection service detects anomalies automatically in time\ \ series data. It supports several functionalities, \r\none is for detecting the\ \ whole series with model trained by the time series, another is detecting the\ \ last point \r\nwith model trained by points before. With this service, business\ \ customers can discover incidents and establish \r\na logic flow for root cause\ \ analysis. We also provide change point detection, which is another common scenario\ \ on \r\ntime series analysis and service monitoring. Change point detection targets\ \ to discover tend changes in the time series.\r\nTo ensure online service quality\ \ is one of the main reasons we developed this service. Our team is dedicated\ \ to \r\ncontinuing to improve the anomaly detection service to provide precise\ \ results."
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Azure Anomaly Detector account](https://azure.microsoft.com/en-us/services/cognitive-services/anomaly-detector/) and  obtain API key following [this guide](https://docs.microsoft.com/en-us/azure/search/search-security-api-keys).
    #
    # + apiKeyConfig - Provide your API keys as Ocp-Apim-Subscription-Key & subscription-key . Eg: {"Ocp-Apim-Subscription-Key" : "<API key>", "subscription-key" : "<API key>"} 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, http:ClientConfiguration clientConfig =  {}) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Detect anomaly status of the latest point in time series.
    #
    # + payload - Time series points and period if needed. Advanced model parameters can also be set in the request. 
    # + return - Successful operation. 
    remote isolated function postTimeseriesLastDetect(Request payload) returns LastResponse|error {
        string  path = string `/timeseries/last/detect`;
        map<anydata> queryParam = {"subscription-key": self.apiKeys["subscription-key"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeys["Ocp-Apim-Subscription-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LastResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=LastResponse);
        return response;
    }
    # Find anomalies for the entire series in batch.
    #
    # + payload - Time series points and period if needed. Advanced model parameters can also be set in the request. 
    # + return - Successful operation. 
    remote isolated function postTimeseriesEntireDetect(Request payload) returns EntireDetectResponse|error {
        string  path = string `/timeseries/entire/detect`;
        map<anydata> queryParam = {"subscription-key": self.apiKeys["subscription-key"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeys["Ocp-Apim-Subscription-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EntireDetectResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=EntireDetectResponse);
        return response;
    }
    # Find trend change point for the entire series in batch.
    #
    # + payload - Time series points, granularity should be set in the request. Advanced model parameters can also be set in the request. 
    # + return - Successful operation. 
    remote isolated function postTimeseriesChangepointDetect(ChangePointDetectRequest payload) returns ChangePointDetectResponse|error {
        string  path = string `/timeseries/changepoint/detect`;
        map<anydata> queryParam = {"subscription-key": self.apiKeys["subscription-key"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Ocp-Apim-Subscription-Key": self.apiKeys["Ocp-Apim-Subscription-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ChangePointDetectResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ChangePointDetectResponse);
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
