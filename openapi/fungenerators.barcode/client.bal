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

# This is a generated connector for [fungenerators BarCode API v1](http://fungenerators.com/api/barcode/) OpenAPI specification.
# The fungenerators.barcode API provides capability to generate Barcode images for a given barcode number. You can decode Barcode images and get the barcodes in a numberic form as well. Many industry standard barcode types are supported. The best and complete Barcode API on the cloud.
@display {label: "Fun Generators Barcode", iconPath: "resources/fungenerators.barcode.svg"} 
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [fungenerators account](https://fungenerators.com/) and obtain tokens by following [this guide](https://fungenerators.com/api/barcode/#authentication).
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
    # Get the supported barcode types for encoding / image generation.
    #
    # + return - 200  response 
    remote isolated function getSupportedTypesForEncode() returns json|error {
        string  path = string `/barcode/encode/types`;
        map<any> headerValues = {"X-Fungenerators-Api-Secret": self.apiKeys["X-Fungenerators-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Get a Bar Code image for the given barcode number
    #
    # + number - Barcode number 
    # + barcodeformat - Barcode format default C39. Valid values are the keys to those returned from /barcode/encode/types. 
    # + outputformat - Output image format. Must be one of png/html/jpg/svg 
    # + widthfactor - Width factor of the image 
    # + totalheight - Total height of the image 
    # + return - 200  response 
    remote isolated function encode(string number, string? barcodeformat = (), string? outputformat = (), int? widthfactor = (), int? totalheight = ()) returns json|error {
        string  path = string `/barcode/encode`;
        map<anydata> queryParam = {"number": number, "barcodeformat": barcodeformat, "outputformat": outputformat, "widthfactor": widthfactor, "totalheight": totalheight};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Fungenerators-Api-Secret": self.apiKeys["X-Fungenerators-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Get the supported barcode types for the decoding process.
    #
    # + return - 200  response 
    remote isolated function getSupportedTypesForDecode() returns json|error {
        string  path = string `/barcode/decode/types`;
        map<any> headerValues = {"X-Fungenerators-Api-Secret": self.apiKeys["X-Fungenerators-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Decode a Barcode image and return the cotents if successful
    #
    # + payload - Request body detail 
    # + return - 200  response 
    remote isolated function decode(Body payload) returns json|error {
        string  path = string `/barcode/decode`;
        map<any> headerValues = {"X-Fungenerators-Api-Secret": self.apiKeys["X-Fungenerators-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType=json);
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
