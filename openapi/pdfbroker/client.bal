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

# This is a generated connector from [PdfBroker.io API v1](https://www.pdfbroker.io/docs) OpenAPI Specification.
# PdfBroker.io is an api for creating pdf files from Xsl-Fo or Html and other useful pdf utilities.
@display {label: "PdfBroker", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [PdfBroker account](https://www.pdfbroker.io/) and obtain tokens following  [this guide](https://www.pdfbroker.io/docs/authentication).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl) returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Basic method to verify api is up and running
    #
    # + return - If any error occurs parsing input 
    remote isolated function verfiyAPIStatus() returns http:Response|error {
        string resourcePath = string `/api/pdf`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create pdf-file from complete XSL-FO document.
    #
    # + payload - XSL-FO Request, the basic XSL-FO request. Post your XSL-FO document and digital resources, either as 'multipart/form-data' or 'application/json' 
    # + return - Returns the newly created pdf file. Either the file directly or serialized as Json if Accept-header is set to application/json 
    remote isolated function createPDfFromXSLFO(FoRequestDto payload) returns PdfResponseDto|error {
        string resourcePath = string `/api/pdf/xslfo`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PdfResponseDto response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create pdf-file from transforming xml document with Xsl-Fo transform document.
    #
    # + payload - XSL-FO Transform Request. The XSL-FO is transformed on the supplied xml data document. Post your XSL-FO transform document and xml data document aloing with your digital resources, either as 'multipart/form-data' or 'application/json' 
    # + return - Returns the newly created pdf file. Either the file directly or serialized as Json if Accept-header is set to application/json 
    remote isolated function createPDFfromXML(FoTransformRequestDto payload) returns PdfResponseDto|error {
        string resourcePath = string `/api/pdf/xslfowithtransform`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PdfResponseDto response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Generate an image of to provided pdf file
    #
    # + payload - PdfToImage Request. Create an image of a page in an existing pdf document. 
    # + return - Generate an image of the provided pdf file. Either the image file directly or serialized as Json if Accept-header is set to application/json 
    remote isolated function createPDFfromImage(PdfToImageRequestDto payload) returns ImageResponseDto|error {
        string resourcePath = string `/api/pdf/pdftoimage`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ImageResponseDto response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Concatenate multiple pdf files into single pdf file..
    #
    # + payload - PdfConcat Request. Add two or more pdf files and concatenate pages into single pdf document. 
    # + return - Returns the newly created pdf file. Either the file directly or serialized as Json if Accept-header is set to application/json 
    remote isolated function concatenatePDFs(PdfConcatenationRequestDto payload) returns PdfResponseDto|error {
        string resourcePath = string `/api/pdf/pdfconcat`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PdfResponseDto response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Write text on a page in a pdf document.
    #
    # + payload - PdfWriteString Request. Write string on page in pdf document 
    # + return - Returns the newly created pdf file. Either the file directly or serialized as Json if Accept-header is set to application/json 
    remote isolated function addTextonPDFPage(PdfWriteStringRequestDto payload) returns PdfResponseDto|error {
        string resourcePath = string `/api/pdf/pdfwritestring`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PdfResponseDto response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Generate pdf file from url using the excellent tool wkhtmltopdf.
    #
    # + payload - WkHtmlToPdf Request. Generate pdf from html, either from url or base64 encoded html string 
    # + return - Returns the newly created pdf file. Either the file directly or serialized as Json if Accept-header is set to application/json 
    remote isolated function generatePDFfromURL(WkHtmlToPdfRequestDto payload) returns PdfResponseDto|error {
        string resourcePath = string `/api/pdf/wkhtmltopdf`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PdfResponseDto response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
