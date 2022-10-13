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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key 'Authorization'
    string authorization;
|};

# This is a generated connector for [GoDaddy Agreements API v1](https://developer.godaddy.com/doc/endpoint/agreements) OpenAPI specification.
# The GoDaddy Agreements API provides capability to access GoDaddy operations related to agreements.
@display {label: "GoDaddy Agreements", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [GoDaddy](https://sg.godaddy.com/) and obtain tokens by following [this guide](https://developer.godaddy.com/getstarted).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.ote-godaddy.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Retrieve Legal Agreements for provided agreements keys
    #
    # + xPrivateLabelId - PrivateLabelId to operate as, if different from JWT 
    # + xMarketId - Unique identifier of the Market used to retrieve/translate Legal Agreements 
    # + keys - Keys for Agreements whose details are to be retrieved 
    # + return - Request was successful 
    remote isolated function getLegalAgreements(string[] keys, int? xPrivateLabelId = (), string xMarketId = "en-US") returns LegalAgreement[]|error {
        string resourcePath = string `/v1/agreements`;
        map<anydata> queryParam = {"keys": keys};
        map<Encoding> queryParamEncoding = {"keys": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"X-Private-Label-Id": xPrivateLabelId, "X-Market-Id": xMarketId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LegalAgreement[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
