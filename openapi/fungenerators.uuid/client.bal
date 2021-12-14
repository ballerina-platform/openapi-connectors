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
    # Represents API Key `X-Fungenerators-Api-Secret`
    string xFungeneratorsApiSecret;
|};

# This is a generated connector from [fungenerators UUID API v1.5](https://fungenerators.com/api/uuid/) OpenAPI Specification.
# A full featured, REST based UUID generator with json/xml/jsonp result support. You can try them out right here. [Click here to subscribe](http://fungenerators.com/api/uuid/)
@display {label: "Fun Generators UUID", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [fungenerators account](https://fungenerators.com/) and obtain tokens by following [this guide](https://fungenerators.com/api/uuid/#authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.fungenerators.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Generate a random UUID (v4).
    #
    # + count - Number of UUID's to generate (defaults to 1) 
    # + return - 200  response 
    remote isolated function generateUUID(int? count = ()) returns json|error {
        string resourcePath = string `/uuid`;
        map<anydata> queryParam = {"count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Fungenerators-Api-Secret": self.apiKeyConfig.xFungeneratorsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Parse a UUID string and return its version and check whether it is valid.
    #
    # + uuidstr - UUID String to parse 
    # + return - 200  response 
    remote isolated function parseUUID(string uuidstr) returns json|error {
        string resourcePath = string `/uuid`;
        map<anydata> queryParam = {"uuidstr": uuidstr};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Fungenerators-Api-Secret": self.apiKeyConfig.xFungeneratorsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Generate a random UUID (v4).
    #
    # + count - Number of UUID's to generate (defaults to 1) 
    # + 'version - Version of the UUID spec to use. (0-5), Use '0' for nil (00000000-0000-0000-0000-000000000000) UUID. 
    # + 'type - For v3 and v5 of UUID Spec you can supply the type (dns/url/oid/x500/nil). 
    # + text - For v3 and v5 of UUID Spec supply the text value for the type specified dns/url/oid/x500/nil. For example specify a dns/domain string if the type is "dns" 
    # + return - 200  response 
    remote isolated function generateUUIDByVersion(int 'version, int? count = (), string? 'type = (), string? text = ()) returns json|error {
        string resourcePath = string `/uuid/version/${'version}`;
        map<anydata> queryParam = {"count": count, "type": 'type, "text": text};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Fungenerators-Api-Secret": self.apiKeyConfig.xFungeneratorsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
