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

# This is a generated connector from [Logoraisr API v1](https://docs.logoraisr.com/) OpenAPI Specification.
# Logoraisr API provides capability to access operations related to your graphic design tasks automatically using best-in-class algorithms and artificial intelligence.
@display {label: "Logoraisr", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Logoraisr account](https://logoraisr.com/) and obtain OAuth tokens following [this guide](https://docs.logoraisr.com/#section/Authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.logoraisr.com/rest-v1") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
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
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Gets preview image of uploaded file
    #
    # + fileId - Id of the file for which the preview_img_url is generated. 
    # + return - Returns preview response or an error 
    remote isolated function readPreviews(string fileId) returns PreviewResponse|error {
        string resourcePath = string `/previews/${getEncodedUri(fileId)}/`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PreviewResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets process list.
    #
    # + return - Returns process detail or an error 
    remote isolated function listProcesses() returns Process|error {
        string resourcePath = string `/processes/`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Process response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets user project list.
    #
    # + return - Returns user project list or an error 
    remote isolated function listProjects() returns Project|error {
        string resourcePath = string `/projects/`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Project response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates a new project.
    #
    # + payload - Project details 
    # + return - Returns project response or an error 
    remote isolated function createProject(ProjectRequest payload) returns ProjectResponse|error {
        string resourcePath = string `/projects/`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProjectResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets project details.
    #
    # + projectNumber - Number of the project. 
    # + return - Returns project details or an error 
    remote isolated function readProjects(string projectNumber) returns Project|error {
        string resourcePath = string `/projects/${getEncodedUri(projectNumber)}/`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Project response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets user report list.
    #
    # + return - Returns user report list or an error 
    remote isolated function getReports() returns Report|error {
        string resourcePath = string `/reports/`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Report response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates a new report.
    #
    # + payload - Report request details 
    # + return - Returns report response or an error 
    remote isolated function createReport(ReportRequest payload) returns ReportResponse|error {
        string resourcePath = string `/reports/`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ReportResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets report details.
    #
    # + reportNumber - Report number 
    # + return - Returns report detail or an error 
    remote isolated function readReports(string reportNumber) returns Report|error {
        string resourcePath = string `/reports/${getEncodedUri(reportNumber)}/`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Report response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets the result from image processing
    #
    # + resultFileId - Id of the result_file for which the result_file_url is generated. 
    # + return - Returns result from image processing or an error 
    remote isolated function readResults(string resultFileId) returns ResultResponse|error {
        string resourcePath = string `/results/${getEncodedUri(resultFileId)}/`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ResultResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
