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
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector from [Logoraisr API v1](https://docs.logoraisr.com/) OpenAPI Specification.
# Logoraisr API provides capability to access operations related to your graphic design tasks automatically using best-in-class algorithms and artificial intelligence.
@display {label: "Logoraisr", iconPath: "resources/logoraisr.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Logoraisr account](https://logoraisr.com/) and obtain OAuth tokens following [this guide](https://docs.logoraisr.com/#section/Authentication).
    #
    # + apiKeyConfig - Provide your API Key as `Authorization`. Eg: {Authorization:Token [<API_KEY>]} 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.logoraisr.com/rest-v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Gets preview image of uploaded file
    #
    # + fileId - Id of the file for which the preview_img_url is generated. 
    # + return - Returns preview response or an error 
    remote isolated function readPreviews(string fileId) returns PreviewResponse|error {
        string  path = string `/previews/${fileId}/`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PreviewResponse response = check self.clientEp-> get(path, accHeaders, targetType = PreviewResponse);
        return response;
    }
    # Gets process list.
    #
    # + return - Returns process detail or an error 
    remote isolated function listProcesses() returns Process|error {
        string  path = string `/processes/`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Process response = check self.clientEp-> get(path, accHeaders, targetType = Process);
        return response;
    }
    # Gets user project list.
    #
    # + return - Returns user project list or an error 
    remote isolated function listProjects() returns Project|error {
        string  path = string `/projects/`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Project response = check self.clientEp-> get(path, accHeaders, targetType = Project);
        return response;
    }
    # Creates a new project.
    #
    # + payload - Project details 
    # + return - Returns project response or an error 
    remote isolated function createProject(ProjectRequest payload) returns ProjectResponse|error {
        string  path = string `/projects/`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProjectResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ProjectResponse);
        return response;
    }
    # Gets project details.
    #
    # + projectNumber - Number of the project. 
    # + return - Returns project details or an error 
    remote isolated function readProjects(string projectNumber) returns Project|error {
        string  path = string `/projects/${projectNumber}/`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Project response = check self.clientEp-> get(path, accHeaders, targetType = Project);
        return response;
    }
    # Gets user report list.
    #
    # + return - Returns user report list or an error 
    remote isolated function getReports() returns Report|error {
        string  path = string `/reports/`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Report response = check self.clientEp-> get(path, accHeaders, targetType = Report);
        return response;
    }
    # Creates a new report.
    #
    # + payload - Report request details 
    # + return - Returns report response or an error 
    remote isolated function createReport(ReportRequest payload) returns ReportResponse|error {
        string  path = string `/reports/`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ReportResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ReportResponse);
        return response;
    }
    # Gets report details.
    #
    # + reportNumber - Report number 
    # + return - Returns report detail or an error 
    remote isolated function readReports(string reportNumber) returns Report|error {
        string  path = string `/reports/${reportNumber}/`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Report response = check self.clientEp-> get(path, accHeaders, targetType = Report);
        return response;
    }
    # Gets the result from image processing
    #
    # + resultFileId - Id of the result_file for which the result_file_url is generated. 
    # + return - Returns result from image processing or an error 
    remote isolated function readResults(string resultFileId) returns ResultResponse|error {
        string  path = string `/results/${resultFileId}/`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ResultResponse response = check self.clientEp-> get(path, accHeaders, targetType = ResultResponse);
        return response;
    }
    # Uploads a new image
    #
    # + payload - Image details 
    # + return - Returns file response or an error 
    remote isolated function createUploads(Body payload) returns FileResponse|error {
        string  path = string `/uploads/`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        FileResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FileResponse);
        return response;
    }
}

# Generates header map for given header values.
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
