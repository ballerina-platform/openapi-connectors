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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:OAuth2ClientCredentialsGrantConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
|};

# This is a generated connector from [PdfBroker.io API v1](https://www.pdfbroker.io/docs) OpenAPI Specification.
# PdfBroker.io is an api for creating pdf files from Xsl-Fo or Html and other useful pdf utilities.
@display {label: "PdfBroker", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [PdfBroker account](https://www.pdfbroker.io/) and obtain tokens following [this guide](https://www.pdfbroker.io/docs/authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Basic method to verify api is up and running
    #
    # + return - If any error occurs parsing input 
    remote isolated function verfiyAPIStatus() returns ErrorResponseDto|error {
        string  path = string `/api/pdf`;
        ErrorResponseDto response = check self.clientEp-> get(path, targetType = ErrorResponseDto);
        return response;
    }
    # Create pdf-file from complete XSL-FO document.
    #
    # + payload - XSL-FO Request, the basic XSL-FO request. Post your XSL-FO document and digital resources, either as 'multipart/form-data' or 'application/json' 
    # + return - Returns the newly created pdf file. Either the file directly or serialized as Json if Accept-header is set to application/json 
    remote isolated function createPDfFromXSLFO(FoRequestDto payload) returns PdfResponseDto|error {
        string  path = string `/api/pdf/xslfo`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PdfResponseDto response = check self.clientEp->post(path, request, targetType=PdfResponseDto);
        return response;
    }
    # Create pdf-file from transforming xml document with Xsl-Fo transform document.
    #
    # + payload - XSL-FO Transform Request. The XSL-FO is transformed on the supplied xml data document. Post your XSL-FO transform document and xml data document aloing with your digital resources, either as 'multipart/form-data' or 'application/json' 
    # + return - Returns the newly created pdf file. Either the file directly or serialized as Json if Accept-header is set to application/json 
    remote isolated function createPDFfromXML(FoTransformRequestDto payload) returns PdfResponseDto|error {
        string  path = string `/api/pdf/xslfowithtransform`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PdfResponseDto response = check self.clientEp->post(path, request, targetType=PdfResponseDto);
        return response;
    }
    # Generate an image of to provided pdf file
    #
    # + payload - PdfToImage Request. Create an image of a page in an existing pdf document. 
    # + return - Generate an image of the provided pdf file. Either the image file directly or serialized as Json if Accept-header is set to application/json 
    remote isolated function createPDFfromImage(PdfToImageRequestDto payload) returns ImageResponseDto|error {
        string  path = string `/api/pdf/pdftoimage`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ImageResponseDto response = check self.clientEp->post(path, request, targetType=ImageResponseDto);
        return response;
    }
    # Concatenate multiple pdf files into single pdf file..
    #
    # + payload - PdfConcat Request. Add two or more pdf files and concatenate pages into single pdf document. 
    # + return - Returns the newly created pdf file. Either the file directly or serialized as Json if Accept-header is set to application/json 
    remote isolated function concatenatePDFs(PdfConcatenationRequestDto payload) returns PdfResponseDto|error {
        string  path = string `/api/pdf/pdfconcat`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PdfResponseDto response = check self.clientEp->post(path, request, targetType=PdfResponseDto);
        return response;
    }
    # Write text on a page in a pdf document.
    #
    # + payload - PdfWriteString Request. Write string on page in pdf document 
    # + return - Returns the newly created pdf file. Either the file directly or serialized as Json if Accept-header is set to application/json 
    remote isolated function addTextonPDFPage(PdfWriteStringRequestDto payload) returns PdfResponseDto|error {
        string  path = string `/api/pdf/pdfwritestring`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PdfResponseDto response = check self.clientEp->post(path, request, targetType=PdfResponseDto);
        return response;
    }
    # Generate pdf file from url using the excellent tool wkhtmltopdf.
    #
    # + payload - WkHtmlToPdf Request. Generate pdf from html, either from url or base64 encoded html string 
    # + return - Returns the newly created pdf file. Either the file directly or serialized as Json if Accept-header is set to application/json 
    remote isolated function generatePDFfromURL(WkHtmlToPdfRequestDto payload) returns PdfResponseDto|error {
        string  path = string `/api/pdf/wkhtmltopdf`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PdfResponseDto response = check self.clientEp->post(path, request, targetType=PdfResponseDto);
        return response;
    }
}
