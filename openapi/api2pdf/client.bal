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
    # Represents API Key `Authorization`
    string authorization;
    # Represents API Key `apikey`
    string apikey;
|};

# This is a generated connector from [Api2Pdf](https://www.api2pdf.com/) OpenAPI Specification.
# Api2Pdf is a powerful PDF generation API with no rate limits or file size constraints. 
# Api2Pdf runs on AWS Lambda, a serverless architecture powered by Amazon to scale to millions of requests while being up to 90% cheaper than alternatives. 
# **Supports wkhtmltopdf, Headless Chrome, LibreOffice, and PDF Merge.** You can also generate barcodes with ZXING (Zebra Crossing).
@display {label: "Api2Pdf", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Please create an [Api2Pdf account](https://portal.api2pdf.com/register) and obtain an API key.
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://v2.api2pdf.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Convert raw HTML to PDF
    #
    # + payload - A JSON object as a payload is required within the body of the request. The following attributes of the JSON object are detailed below: 
    # + return - A JSON object containing the url to the PDF and other meta data 
    remote isolated function convertHtmlToPdf(ChromeHtmlToPdfRequest payload) returns ApiResponseSuccess|error {
        string resourcePath = string `/chrome/pdf/html`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiResponseSuccess response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Convert URL to PDF
    #
    # + url - Url of the page to convert to PDF. Must start with http:// or https://. 
    # + output - Specify output=json to receive a JSON output. Defaults to PDF file. 
    # + return - A PDF file or a JSON object depending on the `output` query parameter 
    remote isolated function convertWebUrlToPdfGet(string url, string output = "json") returns ApiResponseSuccess|error {
        string resourcePath = string `/chrome/pdf/url`;
        map<anydata> queryParam = {"url": url, "output": output, "apikey": self.apiKeyConfig.apikey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ApiResponseSuccess response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Convert URL to PDF
    #
    # + payload - A JSON object as a payload is required within the body of the request. The following attributes of the JSON object are detailed below: 
    # + return - A JSON object containing the url to the PDF and other meta data 
    remote isolated function convertWebUrlToPdfPost(ChromeUrlToPdfRequest payload) returns ApiResponseSuccess|error {
        string resourcePath = string `/chrome/pdf/url`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiResponseSuccess response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Convert office document or image to PDF
    #
    # + payload - A JSON object as a payload is required within the body of the request. The following attributes of the JSON object are detailed below: 
    # + return - A JSON object containing the url to the PDF and other meta data 
    remote isolated function convertOfficeDocToPdf(LibreOfficeConvertRequest payload) returns ApiResponseSuccess|error {
        string resourcePath = string `/libreoffice/convert`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiResponseSuccess response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Merge multiple PDFs together
    #
    # + payload - A JSON object as a payload is required within the body of the request. The following attributes of the JSON object are detailed below: 
    # + return - A JSON object containing the url to the PDF and other meta data 
    remote isolated function mergePdfs(MergeRequest payload) returns ApiResponseSuccess|error {
        string resourcePath = string `/merge`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiResponseSuccess response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Convert raw HTML to PDF
    #
    # + payload - A JSON object as a payload is required within the body of the request. The following attributes of the JSON object are detailed below: 
    # + return - A JSON object containing the url to the PDF and other meta data 
    remote isolated function convertHtmlToPdfWithWkhtml(WkHtmlToPdfHtmlToPdfRequest payload) returns ApiResponseSuccess|error {
        string resourcePath = string `/wkhtml/pdf/html`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiResponseSuccess response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Convert URL to PDF
    #
    # + url - Url of the page to convert to PDF. Must start with http:// or https://. 
    # + output - Specify output=json to receive a JSON output. Defaults to PDF file. 
    # + return - A PDF file or a JSON object depending on the `output` query parameter 
    remote isolated function convertWebUrlToPdfWithWkhtmlGet(string url, string output = "json") returns ApiResponseSuccess|error {
        string resourcePath = string `/wkhtml/pdf/url`;
        map<anydata> queryParam = {"url": url, "output": output, "apikey": self.apiKeyConfig.apikey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ApiResponseSuccess response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Convert URL to PDF
    #
    # + payload - A JSON object as a payload is required within the body of the request. The following attributes of the JSON object are detailed below: 
    # + return - A JSON object containing the url to the PDF and other meta data 
    remote isolated function convertWebUrlToPdfWithWkhtmlPost(WkHtmlToPdfUrlToPdfRequest payload) returns ApiResponseSuccess|error {
        string resourcePath = string `/wkhtml/pdf/url`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiResponseSuccess response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
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
    remote isolated function zebra(string format, string value, boolean? showlabel = (), int? height = (), int? width = ()) returns string|error {
        string resourcePath = string `/zebra`;
        map<anydata> queryParam = {"format": format, "value": value, "showlabel": showlabel, "height": height, "width": width, "apikey": self.apiKeyConfig.apikey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
}
