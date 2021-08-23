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

public type ApiKeysConfig record {
    map<string> apiKeys;
};

# This is a generated connector for [OpenFIGI API v3](https://www.openfigi.com/api) OpenAPI Specification.
# OpenFIGI API provides capability to access multiple tools for identifying, mapping and requesting a free and open symbology dataset.  
# This user friendly platform provides the ultimate understanding for how a unique identifier combined with accurate,  
# associated metadata can eliminate redundant mapping processes, streamline the trade workflow and reduce operational risk.
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [OpenFIGI account](https://www.openfigi.com/)  and obtain tokens following [this guide](https://www.openfigi.com/api#api-key).
    #
    # + apiKeyConfig - Provide your API Key as `X-OPENFIGI-APIKEY`. Eg: {X-OPENFIGI-APIKEY : <Your API Key>}
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.openfigi.com/v3") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    #
    # + payload - A list of third-party identifiers and extra filters.
    # + return - A list of FIGIs and their metadata.
    remote isolated function mapIdentifiers(BulkMappingJob payload) returns BulkMappingJobResult|error {
        string  path = string `/mapping`;
        map<any> headerValues = {"X-OPENFIGI-APIKEY": self.apiKeys["X-OPENFIGI-APIKEY"]};
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
        map<any> headerValues = {"X-OPENFIGI-APIKEY": self.apiKeys["X-OPENFIGI-APIKEY"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Values response = check self.clientEp-> get(path, accHeaders, targetType = Values);
        return response;
    }
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
