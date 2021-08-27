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

# This is a generated connector from [fungenerators UUID API v1.5](https://fungenerators.com/api/uuid/) OpenAPI Specification.
# A full featured, REST based UUID generator with json/xml/jsonp result support. You can try them out right here. [Click here to subscribe](http://fungenerators.com/api/uuid/)
@display {label: "fungenerators.UUID", iconPath: "resources/fungeneratorsUuid.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [fungenerators account](https://fungenerators.com/) and obtain tokens by following [this guide](https://fungenerators.com/api/uuid/#authentication).
    #
    # + apiKeyConfig - Provide your API Key as `X-Fungenerators-Api-Secret`. Eg: {X-Fungenerators-Api-Secret : <Your API_Key>} 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.fungenerators.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Generate a random UUID (v4).
    #
    # + count - Number of UUID's to generate (defaults to 1) 
    # + return - 200  response 
    remote isolated function generateUUID(int? count = ()) returns json|error {
        string  path = string `/uuid`;
        map<anydata> queryParam = {"count": count};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Fungenerators-Api-Secret": self.apiKeys["X-Fungenerators-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Parse a UUID string and return its version and check whether it is valid.
    #
    # + uuidstr - UUID String to parse 
    # + return - 200  response 
    remote isolated function parseUUID(string uuidstr) returns json|error {
        string  path = string `/uuid`;
        map<anydata> queryParam = {"uuidstr": uuidstr};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Fungenerators-Api-Secret": self.apiKeys["X-Fungenerators-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Generate a random UUID (v4).
    #
    # + 'version - Version of the UUID spec to use. (0-5), Use '0' for nil (00000000-0000-0000-0000-000000000000) UUID. 
    # + count - Number of UUID's to generate (defaults to 1) 
    # + 'type - For v3 and v5 of UUID Spec you can supply the type (dns/url/oid/x500/nil). 
    # + text - For v3 and v5 of UUID Spec supply the text value for the type specified dns/url/oid/x500/nil. For example specify a dns/domain string if the type is "dns" 
    # + return - 200  response 
    remote isolated function generateUUIDByVersion(int 'version, int? count = (), string? 'type = (), string? text = ()) returns json|error {
        string  path = string `/uuid/'version/${'version}`;
        map<anydata> queryParam = {"count": count, "type": 'type, "text": text};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Fungenerators-Api-Secret": self.apiKeys["X-Fungenerators-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
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
