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
    # DateTime - Get date and time information
    #
    # + payload - Input date time info parameters
    # + return - OK
    remote isolated function dateTimeInfo(InputDateTimeInfo payload) returns OutputDateInfo|error {
        string  path = string `/DateTimeInfo`;
        map<string|string[]> accHeaders = {'X\-IBM\-Client\-Id: self.apiKeys.get("X-IBM-Client-Id")};
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputDateInfo response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputDateInfo);
        return response;
    }
    # DateTime - DateTime difference
    #
    # + payload - Input date time difference parameters
    # + return - OK
    remote isolated function dateTimeDifference(InputDateTimeDifference payload) returns OutputDateDifference|error {
        string  path = string `/DateTimeDifference`;
        map<string|string[]> accHeaders = {'X\-IBM\-Client\-Id: self.apiKeys.get("X-IBM-Client-Id")};
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputDateDifference response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputDateDifference);
        return response;
    }
    # DateTime - Format date and time
    #
    # + payload - Input date time format parameters
    # + return - OK
    remote isolated function formatDateTime(InputDateTimeFormat payload) returns OutputString|error {
        string  path = string `/FormatDateTime`;
        map<string|string[]> accHeaders = {'X\-IBM\-Client\-Id: self.apiKeys.get("X-IBM-Client-Id")};
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # DateTime - Get world time
    #
    # + payload - Input date time conversion parameters
    # + return - OK
    remote isolated function worldTime(InputDateTimeConversion payload) returns OutputString|error {
        string  path = string `/WorldTime`;
        map<string|string[]> accHeaders = {'X\-IBM\-Client\-Id: self.apiKeys.get("X-IBM-Client-Id")};
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
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
