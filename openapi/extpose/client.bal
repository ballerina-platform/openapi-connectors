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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `X-API-Key`
    string xApiKey;
|};

# This is a generated connector from [Extpose API v1](https://extpose.com/) OpenAPI Specification. 
# Extpose — in‑store performance analytics and optimization tool for Chrome extensions. [https://extpose.com](https://extpose.com)
@display {label: "ExtPose", iconPath: "resources/extpose.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials
    # Create an [Extpose Account](https://extpose.com/signup) and obtain tokens by following [this guide](https://docs.extpose.com/api-reference)
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://extpose.com/api/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Get User Extensions
    #
    # + return - successful operation 
    remote isolated function getUserExtensions() returns Extension[]|error {
        string  path = string `/user-extensions`;
        map<any> headerValues = {"X-API-Key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Extension[] response = check self.clientEp-> get(path, accHeaders, targetType = ExtensionArr);
        return response;
    }
}
