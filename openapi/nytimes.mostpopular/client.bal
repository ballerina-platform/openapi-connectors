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
import  ballerina/url;
import  ballerina/lang.'string;

public type ApiKeysConfig record {
    map<string> apiKeys;
};

# Get lists of NYT Articles based on shares, emails, and views.
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
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "http://api.nytimes.com/svc/mostpopular/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys;
    }
    # Most Emailed by Section & Time Period
    #
    # + section - Limits the results by one or more sections. You can use
    # + timePeriod - Number of days `1 | 7 | 30 ` corresponds to a day, a week, or a month of content.
    # + return - An array of Articles
    remote isolated function getMostemailed(string section, string timePeriod) returns InlineResponse200|error {
        string  path = string `/mostemailed/${section}/${timePeriod}.json`;
        map<anydata> queryParam = {'api\-key: self.apiKeys["api-key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
    # Most Shared by Section & Time Period
    #
    # + section - Limits the results by one or more sections. You can use
    # + timePeriod - Number of days `1 | 7 | 30 ` corresponds to a day, a week, or a month of content.
    # + return - An array of Articles
    remote isolated function getMostshared(string section, string timePeriod) returns InlineResponse2001|error {
        string  path = string `/mostshared/${section}/${timePeriod}.json`;
        map<anydata> queryParam = {'api\-key: self.apiKeys["api-key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp-> get(path, targetType = InlineResponse2001);
        return response;
    }
    # Most Viewed by Section & Time Period
    #
    # + section - Limits the results by one or more sections. You can use
    # + timePeriod - Number of days `1 | 7 | 30 ` corresponds to a day, a week, or a month of content.
    # + return - An array of Articles
    remote isolated function getMostviewed(string section, string timePeriod) returns InlineResponse2001|error {
        string  path = string `/mostviewed/${section}/${timePeriod}.json`;
        map<anydata> queryParam = {'api\-key: self.apiKeys["api-key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp-> get(path, targetType = InlineResponse2001);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
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
