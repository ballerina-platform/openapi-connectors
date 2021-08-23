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

# This is a generated connector for [Apptigent PowerTools Developer API v2021.1.01](https://portal.apptigent.com/node/612) OpenAPI specification.
# 'Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. 
# Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. 
# PowerTools is the ultimate developer toolkit.'
# This connector provides the capability for String manipulation, parsing, conversion and related operations.
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [Apptigent account](https://portal.apptigent.com/user/register) and obtain tokens following [this guide](https://portal.apptigent.com/start).
    #
    # + apiKeyConfig - Provide your API key as `X-IBM-Client-Id`. Eg: `{"X-IBM-Client-Id" : "<API key>"}`
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://connect.apptigent.com/api/utilities") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Text - Compare strings
    #
    # + payload - Input string comparison parameters
    # + return - OK
    remote isolated function compareStrings(InputStringComparison payload) returns OutputString|error {
        string  path = string `/CompareStrings`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Text - Contains string
    #
    # + payload - Input string contains parameters
    # + return - OK
    remote isolated function containsString(InputStringContains payload) returns OutputString|error {
        string  path = string `/ContainsString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Text - Convert case
    #
    # + payload - Input case conversion parameters
    # + return - OK
    remote isolated function convertCase(InputCaseConversion payload) returns OutputString|error {
        string  path = string `/ConvertCase`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Text - Decode string
    #
    # + payload - Input string parameters
    # + return - OK
    remote isolated function decodeString(Body payload) returns OutputString|error {
        string  path = string `/DecodeString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Text - Encode string
    #
    # + payload - Input string parameters
    # + return - OK
    remote isolated function encodeString(InputString payload) returns OutputString|error {
        string  path = string `/EncodeString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Text - Generate GUID
    #
    # + payload - Input general unique ID parameters
    # + return - OK
    remote isolated function generateGuid(InputGenerateUniqueID payload) returns OutputString|error {
        string  path = string `/GenerateGuid`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Text - Generate hash
    #
    # + payload - Input generate hash parameters
    # + return - OK
    remote isolated function generateHash(InputGenerateHash payload) returns OutputString|error {
        string  path = string `/GenerateHash`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Text - Verify hash
    #
    # + payload - Input verfiy hash parameters
    # + return - OK
    remote isolated function verifyHash(InputVerifyHash payload) returns OutputBoolean|error {
        string  path = string `/VerifyHash`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputBoolean response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputBoolean);
        return response;
    }
    # Text - Join strings
    #
    # + payload - Input join strings parameters
    # + return - OK
    remote isolated function joinStrings(InputJoinStrings payload) returns OutputString|error {
        string  path = string `/JoinStrings`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Text - Redact string
    #
    # + payload - Input redact string parameters
    # + return - OK
    remote isolated function redactString(InputRedactString payload) returns OutputString|error {
        string  path = string `/RedactString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Text - Replace string
    #
    # + payload - Input replace string parameters
    # + return - OK
    remote isolated function replaceString(InputReplaceString payload) returns OutputString|error {
        string  path = string `/ReplaceString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Text - Shorten hyperlink
    #
    # + payload - Input shorten link parameters
    # + return - OK
    remote isolated function shortenLink(Body1 payload) returns OutputString|error {
        string  path = string `/ShortenLink`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Text - Split string
    #
    # + payload - Input split string parameters
    # + return - OK
    remote isolated function splitString(InputSplitString payload) returns OutputStringArray|error {
        string  path = string `/SplitString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputStringArray response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputStringArray);
        return response;
    }
    # Text - Speech to Text
    #
    # + payload - Input speech to text parameters
    # + return - OK
    remote isolated function speechToText(Body2 payload) returns OutputString|error {
        string  path = string `/SpeechToText`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Text - Text to Speech
    #
    # + payload - Input text to speech parameters
    # + return - OK
    remote isolated function textToSpeech(InputTextToSpeech payload) returns string|error {
        string  path = string `/TextToSpeech`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
        return response;
    }
    # Text - Translate string
    #
    # + payload - Input translate string parameters
    # + return - OK
    remote isolated function translateString(InputTranslateString payload) returns OutputString|error {
        string  path = string `/TranslateString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Text - Trim string
    #
    # + payload - Input trim string parameters
    # + return - OK
    remote isolated function trimString(InputTrimString payload) returns OutputString|error {
        string  path = string `/TrimString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Text - Decode URL
    #
    # + payload - Input Url decode parameters
    # + return - OK
    remote isolated function urlDecode(Body3 payload) returns OutputString|error {
        string  path = string `/URLDecode`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Text - Encode URL
    #
    # + payload - Input string parameters
    # + return - OK
    remote isolated function urlEncode(InputString payload) returns OutputString|error {
        string  path = string `/URLEncode`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Text - Validate email
    #
    # + payload - Input validate email parameters
    # + return - OK
    remote isolated function validateEmail(Body4 payload) returns OutputString|error {
        string  path = string `/ValidateEmail`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OutputString response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OutputString);
        return response;
    }
    # Text - String to File
    #
    # + payload - Input string to file parameters
    # + return - OK
    remote isolated function stringToFile(InputStringToFile payload) returns string|error {
        string  path = string `/StringToFile`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeys["X-IBM-Client-Id"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
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
