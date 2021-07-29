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

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

public type ApiKeysConfig record {
    map<string> apiKeys;
};

# Client for Api2Pdf connector
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    map<string> apiKeys;
    # Client initialization.
    #
    # + apiKeyConfig - API key configuration detail
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://v2018.api2pdf.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys;
    }
    # Convert raw HTML to PDF
    #
    # + payload - A JSON object as a payload is required within the body of the request. The following attributes of the JSON object are detailed below:
    # + return - A JSON object containing the url to the PDF and other meta data
    remote isolated function chromeFromHtmlPost(ChromeHtmlToPdfRequest payload) returns ApiResponseSuccess|error {
        string  path = string `/chrome/html`;
        map<anydata> queryParam = {apikey: self.apiKeys["apikey"]};
        path = path + check getPathForQueryParam(queryParam);
        map<string|string[]> accHeaders = {Authorization: self.apiKeys.get("Authorization")};
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApiResponseSuccess response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ApiResponseSuccess);
        return response;
    }
    # Convert URL to PDF
    #
    # + url - Url of the page to convert to PDF. Must start with http:// or https://.
    # + output - Specify output=json to receive a JSON output. Defaults to PDF file.
    # + return - A PDF file or a JSON object depending on the `output` query parameter
    remote isolated function chromeFromUrlGET(string url, string output = "json") returns ApiResponseSuccess|error {
        string  path = string `/chrome/url`;
        map<anydata> queryParam = {"url": url, "output": output, apikey: self.apiKeys["apikey"]};
        path = path + check getPathForQueryParam(queryParam);
        ApiResponseSuccess response = check self.clientEp-> get(path, targetType = ApiResponseSuccess);
        return response;
    }
    # Convert URL to PDF
    #
    # + payload - A JSON object as a payload is required within the body of the request. The following attributes of the JSON object are detailed below:
    # + return - A JSON object containing the url to the PDF and other meta data
    remote isolated function chromeFromUrlPost(ChromeUrlToPdfRequest payload) returns ApiResponseSuccess|error {
        string  path = string `/chrome/url`;
        map<anydata> queryParam = {apikey: self.apiKeys["apikey"]};
        path = path + check getPathForQueryParam(queryParam);
        map<string|string[]> accHeaders = {Authorization: self.apiKeys.get("Authorization")};
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApiResponseSuccess response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ApiResponseSuccess);
        return response;
    }
    # Convert office document or image to PDF
    #
    # + payload - A JSON object as a payload is required within the body of the request. The following attributes of the JSON object are detailed below:
    # + return - A JSON object containing the url to the PDF and other meta data
    remote isolated function libreConvertPost(LibreOfficeConvertRequest payload) returns ApiResponseSuccess|error {
        string  path = string `/libreoffice/convert`;
        map<anydata> queryParam = {apikey: self.apiKeys["apikey"]};
        path = path + check getPathForQueryParam(queryParam);
        map<string|string[]> accHeaders = {Authorization: self.apiKeys.get("Authorization")};
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApiResponseSuccess response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ApiResponseSuccess);
        return response;
    }
    # Merge multiple PDFs together
    #
    # + payload - A JSON object as a payload is required within the body of the request. The following attributes of the JSON object are detailed below:
    # + return - A JSON object containing the url to the PDF and other meta data
    remote isolated function mergePost(MergeRequest payload) returns ApiResponseSuccess|error {
        string  path = string `/merge`;
        map<anydata> queryParam = {apikey: self.apiKeys["apikey"]};
        path = path + check getPathForQueryParam(queryParam);
        map<string|string[]> accHeaders = {Authorization: self.apiKeys.get("Authorization")};
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApiResponseSuccess response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ApiResponseSuccess);
        return response;
    }
    # Convert raw HTML to PDF
    #
    # + payload - A JSON object as a payload is required within the body of the request. The following attributes of the JSON object are detailed below:
    # + return - A JSON object containing the url to the PDF and other meta data
    remote isolated function wkhtmltopdfFromHtmlPost(WkHtmlToPdfHtmlToPdfRequest payload) returns ApiResponseSuccess|error {
        string  path = string `/wkhtmltopdf/html`;
        map<anydata> queryParam = {apikey: self.apiKeys["apikey"]};
        path = path + check getPathForQueryParam(queryParam);
        map<string|string[]> accHeaders = {Authorization: self.apiKeys.get("Authorization")};
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApiResponseSuccess response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ApiResponseSuccess);
        return response;
    }
    # Convert URL to PDF
    #
    # + url - Url of the page to convert to PDF. Must start with http:// or https://.
    # + output - Specify output=json to receive a JSON output. Defaults to PDF file.
    # + return - A PDF file or a JSON object depending on the `output` query parameter
    remote isolated function wkhtmltopdfFromUrlGET(string url, string output = "json") returns ApiResponseSuccess|error {
        string  path = string `/wkhtmltopdf/url`;
        map<anydata> queryParam = {"url": url, "output": output, apikey: self.apiKeys["apikey"]};
        path = path + check getPathForQueryParam(queryParam);
        ApiResponseSuccess response = check self.clientEp-> get(path, targetType = ApiResponseSuccess);
        return response;
    }
    # Convert URL to PDF
    #
    # + payload - A JSON object as a payload is required within the body of the request. The following attributes of the JSON object are detailed below:
    # + return - A JSON object containing the url to the PDF and other meta data
    remote isolated function wkhtmltopdfFromUrlPost(WkHtmlToPdfUrlToPdfRequest payload) returns ApiResponseSuccess|error {
        string  path = string `/wkhtmltopdf/url`;
        map<anydata> queryParam = {apikey: self.apiKeys["apikey"]};
        path = path + check getPathForQueryParam(queryParam);
        map<string|string[]> accHeaders = {Authorization: self.apiKeys.get("Authorization")};
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApiResponseSuccess response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ApiResponseSuccess);
        return response;
    }
    # Generate bar codes and QR codes with ZXING.
    #
    # + format - Most common is CODE_39 or QR_CODE
    # + value - Specify the text value you want to convert
    # + showlabel - Show label of text below barcode
    # + height - Height of the barcode generated image
    # + width - Width of the barcode generated image
    # + return - An image of the generated barcode or QR code
    remote isolated function zebraGET(string format, string value, boolean? showlabel = (), int? height = (), int? width = ()) returns string|error {
        string  path = string `/zebra`;
        map<anydata> queryParam = {"format": format, "value": value, "showlabel": showlabel, "height": height, "width": width, apikey: self.apiKeys["apikey"]};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
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
isolated function  getMapForHeaders(map<any>   headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
