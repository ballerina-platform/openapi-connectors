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
    # Represents API Key `X-Fungenerators-Api-Secret`
    string xFungeneratorsApiSecret;
|};

# This is a generated connector for [fungenerators BarCode API v1](http://fungenerators.com/api/barcode/) OpenAPI specification.
# The fungenerators.barcode API provides capability to generate Barcode images for a given barcode number. You can decode Barcode images and get the barcodes in a numberic form as well. Many industry standard barcode types are supported. The best and complete Barcode API on the cloud.
@display {label: "Fun Generators Barcode", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [fungenerators account](https://fungenerators.com/) and obtain tokens by following [this guide](https://fungenerators.com/api/barcode/#authentication).
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
    # Get the supported barcode types for encoding / image generation.
    #
    # + return - 200  response 
    remote isolated function getSupportedTypesForEncode() returns json|error {
        string resourcePath = string `/barcode/encode/types`;
        map<any> headerValues = {"X-Fungenerators-Api-Secret": self.apiKeyConfig.xFungeneratorsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
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
        string resourcePath = string `/barcode/encode`;
        map<anydata> queryParam = {"number": number, "barcodeformat": barcodeformat, "outputformat": outputformat, "widthfactor": widthfactor, "totalheight": totalheight};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Fungenerators-Api-Secret": self.apiKeyConfig.xFungeneratorsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the supported barcode types for the decoding process.
    #
    # + return - 200  response 
    remote isolated function getSupportedTypesForDecode() returns json|error {
        string resourcePath = string `/barcode/decode/types`;
        map<any> headerValues = {"X-Fungenerators-Api-Secret": self.apiKeyConfig.xFungeneratorsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Decode a Barcode image and return the cotents if successful
    #
    # + payload - Request body detail 
    # + return - 200  response 
    remote isolated function decode(BarcodeDecodeBody payload) returns json|error {
        string resourcePath = string `/barcode/decode`;
        map<any> headerValues = {"X-Fungenerators-Api-Secret": self.apiKeyConfig.xFungeneratorsApiSecret};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
