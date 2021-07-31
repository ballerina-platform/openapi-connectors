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

# Connection Configuration
#
# + apiKeys - API keys  
public type ApiKeysConfig record {
    map<string> apiKeys;
};

# A free & open API for FIGI discovery.
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
    # + return - Returns error at failure of client initialization
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.openfigi.com/v3") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys;
    }
    #
    # + payload - A list of third-party identifiers and extra filters.
    # + return - A list of FIGIs and their metadata.
    remote isolated function mapIdentifiers(BulkMappingJob payload) returns BulkMappingJobResult|error {
        string  path = string `/mapping`;
        map<any> headerValues = {'X\-OPENFIGI\-APIKEY: self.apiKeys["X-OPENFIGI-APIKEY"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BulkMappingJobResult response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BulkMappingJobResult);
        return response;
    }
    #
    # + 'key - Key of MappingJob for which to get possible values.
    # + return - The list of values.
    remote isolated function getValues(string 'key) returns Values|error {
        string  path = string `/mapping/values/${'key}`;
        map<any> headerValues = {'X\-OPENFIGI\-APIKEY: self.apiKeys["X-OPENFIGI-APIKEY"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Values response = check self.clientEp-> get(path, accHeaders, targetType = Values);
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
