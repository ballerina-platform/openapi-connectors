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

# This is a generated connector from [BINTable API v1](https://bintable.com/get-api) OpenAPI Specification. 
# 
# BIN lookup API, the free api service from bintable.com to lookup card information using it's BIN. 
# 
# The service maintains updated database based on the comunity and other third party services to make sure all BINs in the database are accurate and up to date.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials.
    # Create a [BINTable Account](https://bintable.com/get-api) and obtain the API key.
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.bintable.com/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Check Balance
    #
    # + apiKey - The API key, which you can get from bintable.com website.
    # + return - Balance reponse
    remote isolated function balanceLookup(string apiKey) returns ResponseItem|error {
        string  path = string `/balance`;
        map<anydata> queryParam = {"api_key": apiKey};
        path = path + check getPathForQueryParam(queryParam);
        ResponseItem response = check self.clientEp-> get(path, targetType = ResponseItem);
        return response;
    }
    # Lookup for bin
    #
    # + bin - pass the required BIN(Bank Identification Number) code
    # + apiKey - The API key, which you can get from bintable.com website.
    # + return - BIN data response
    remote isolated function binLookup(string bin, string apiKey) returns ResponseItem|error {
        string  path = string `/${bin}`;
        map<anydata> queryParam = {"api_key": apiKey};
        path = path + check getPathForQueryParam(queryParam);
        ResponseItem response = check self.clientEp-> get(path, targetType = ResponseItem);
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
