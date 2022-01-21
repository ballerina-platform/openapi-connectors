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
    # Represents API Key `Apikey`
    string apikey;
|};

# This is a generated connector from [Cloudmersive](https://account.cloudmersive.com) OpenAPI specification.
# The Cloudmersive Barcode APIs let you generate barcode images, and recognize values from images of barcodes.
@display {label: "Cloudmersive Barcode", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Cloudmersive account](https://account.cloudmersive.com/login) and obtain tokens following [this guide](https://account.cloudmersive.com/keys).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://testapi.cloudmersive.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Lookup EAN barcode value, return product data
    #
    # + payload - Barcode value 
    # + return - OK 
    remote isolated function barcodeEanLookup(string payload) returns BarcodeLookupResponse|error {
        string resourcePath = string `/barcode/lookup/ean`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BarcodeLookupResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Generate a QR code barcode as PNG file
    #
    # + payload - QR code text to convert into the QR code barcode 
    # + return - OK 
    remote isolated function generateBarcodeQrcode(string payload) returns string|error {
        string resourcePath = string `/barcode/generate/qrcode`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Generate a UPC-A code barcode as PNG file
    #
    # + payload - UPC-A barcode value to generate from 
    # + return - OK 
    remote isolated function generateBarcodeUpca(string payload) returns string|error {
        string resourcePath = string `/barcode/generate/upc-a`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Generate a UPC-E code barcode as PNG file
    #
    # + payload - UPC-E barcode value to generate from 
    # + return - OK 
    remote isolated function generateBarcodeUpce(string payload) returns string|error {
        string resourcePath = string `/barcode/generate/upc-e`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Generate a EAN-13 code barcode as PNG file
    #
    # + payload - Barcode value to generate from 
    # + return - OK 
    remote isolated function generateBarcodeEan13(string payload) returns string|error {
        string resourcePath = string `/barcode/generate/ean-13`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Generate a EAN-8 code barcode as PNG file
    #
    # + payload - Barcode value to generate from 
    # + return - OK 
    remote isolated function generateBarcodeEan8(string payload) returns string|error {
        string resourcePath = string `/barcode/generate/ean-8`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
}
