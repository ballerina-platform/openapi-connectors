// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector from [PDF Blocks API version 1.5.0](https://www.pdfblocks.com/docs/api/getting-started) OpenAPI Specification.
# PDF Blocks API provides capability to access operations related to work with PDF documents.
@display {label: "PDF Blocks", iconPath: "resources/pdfblocks.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [PDF Blocks account](https://dashboard.pdfblocks.com/users/sign_in) and obtain OAuth tokens following [this guide](https://www.pdfblocks.com/docs/api/getting-started#authentication) or  [get a free API key](https://www.pdfblocks.com/try-free).
    #
    # + apiKeyConfig - Provide your API Key as `X-Api-Key`. Eg: {X-Api-Key : [<API_KEY>]} 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.pdfblocks.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Add a password to a PDF
    #
    # + payload - Document details 
    # + return - The document was processed successfully. 
    remote isolated function addPasswordV1(Body payload) returns string|error {
        string  path = string `/v1/add_password`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
        return response;
    }
    # Add a text watermark to a PDF
    #
    # + payload - Document details 
    # + return - The document was processed successfully. 
    remote isolated function addTextWatermarkV1(Body1 payload) returns string|error {
        string  path = string `/v1/add_watermark/text`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
        return response;
    }
    # Add an image watermark to a PDF
    #
    # + payload - Document details 
    # + return - The document was processed successfully. 
    remote isolated function addImageWatermarkV1(Body2 payload) returns string|error {
        string  path = string `/v1/add_watermark/image`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
        return response;
    }
    # Merge PDF documents
    #
    # + payload - Document details 
    # + return - The document was processed successfully. 
    remote isolated function mergeDocumentsV1(Body3 payload) returns string|error {
        string  path = string `/v1/merge_documents`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
        return response;
    }
    # Extract pages from a PDF
    #
    # + payload - Document Detail 
    # + return - The document was processed successfully. 
    remote isolated function extractPagesV1(Body4 payload) returns string|error {
        string  path = string `/v1/extract_pages`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
        return response;
    }
    # Remove pages from a PDF
    #
    # + payload - Document details 
    # + return - The document was processed successfully. 
    remote isolated function removePagesV1(Body5 payload) returns string|error {
        string  path = string `/v1/remove_pages`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
        return response;
    }
    # Rotate pages in a PDF
    #
    # + payload - Document details 
    # + return - The document was processed successfully. 
    remote isolated function rotatePagesV1(Body6 payload) returns string|error {
        string  path = string `/v1/rotate_pages`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
        return response;
    }
    # Add restrictions to a PDF
    #
    # + payload - Document details 
    # + return - The document was processed successfully. 
    remote isolated function addRestrictionsV1(Body7 payload) returns string|error {
        string  path = string `/v1/add_restrictions`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
        return response;
    }
    # Remove the password from a PDF
    #
    # + payload - Document details 
    # + return - The document was processed successfully. 
    remote isolated function removePasswordV1(Body8 payload) returns string|error {
        string  path = string `/v1/remove_password`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
        return response;
    }
    # Remove the restrictions from a PDF
    #
    # + payload - Document details 
    # + return - The document was processed successfully. 
    remote isolated function removeRestrictionsV1(Body9 payload) returns string|error {
        string  path = string `/v1/remove_restrictions`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
        return response;
    }
    # Remove the signatures from a PDF
    #
    # + payload - Document details 
    # + return - The document was processed successfully. 
    remote isolated function removeSignaturesV1(Body10 payload) returns string|error {
        string  path = string `/v1/remove_signatures`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
        return response;
    }
    # Reverse the pages of a PDF
    #
    # + payload - Document details 
    # + return - The document was processed successfully. 
    remote isolated function reversePagesV1(Body11 payload) returns string|error {
        string  path = string `/v1/reverse_pages`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
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
