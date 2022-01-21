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
    # All requests on the VisibleThread API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be `apiKey`
    string apiKey;
|};

# This is a generated connector for [VisibleThread API v1.0](https://api.visiblethread.com/example/index.html) OpenAPI specification. 
# The VisibleThread API provides services for analyzing or searching documents and web pages.
@display {label: "VisibleThread", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Contact support@visiblethread.com to request an API key.
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.visiblethread.com/api/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Get your list of documents
    #
    # + return - Successful response 
    remote isolated function getDocs() returns DocumentListSummary[]|error {
        string resourcePath = string `/documents`;
        map<any> headerValues = {"apiKey": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DocumentListSummary[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get data from a previously submitted document
    #
    # + docId - Id of document to fetch 
    # + return - document response contained readability details for the document 
    remote isolated function getDocById(int docId) returns DocumentResponseDetailed|error {
        string resourcePath = string `/documents/${docId}`;
        map<any> headerValues = {"apiKey": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DocumentResponseDetailed response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get your list of dictionaries
    #
    # + return - Successful response 
    remote isolated function getDictionaries() returns http:Response|error {
        string resourcePath = string `/dictionaries`;
        map<any> headerValues = {"apiKey": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get your list of searches
    #
    # + return - Successful response 
    remote isolated function getSearchResults() returns http:Response|error {
        string resourcePath = string `/searches`;
        map<any> headerValues = {"apiKey": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Run a search
    #
    # + payload - Run a search on document **docId** using dictionary**dictId** 
    # + return - Successful response 
    remote isolated function runSearch(Search payload) returns string|error {
        string resourcePath = string `/searches`;
        map<any> headerValues = {"apiKey": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Gets search results for a particular document/dictionary
    #
    # + docId - Id of document 
    # + dictionaryId - Id of dictionary 
    # + matchingOnly - Only returning paragraphs containing a match 
    # + return - scan response 
    remote isolated function getSearchResultsById(int docId, int dictionaryId, boolean matchingOnly) returns http:Response|error {
        string resourcePath = string `/searches/${docId}/${dictionaryId}`;
        map<anydata> queryParam = {"matchingOnly": matchingOnly};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"apiKey": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get your list of scans
    #
    # + return - Successful response 
    remote isolated function getScans() returns ScanResponseSummary[]|error {
        string resourcePath = string `/webscans`;
        map<any> headerValues = {"apiKey": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ScanResponseSummary[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Run a new scan
    #
    # + payload - Scan title and webUrls to analyze 
    # + return - Successful response 
    remote isolated function runScan(NewScan payload) returns NewScanResponse|error {
        string resourcePath = string `/webscans`;
        map<any> headerValues = {"apiKey": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NewScanResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get data from a previously run scan
    #
    # + scanId - Id of scan to fetch 
    # + return - scan response 
    remote isolated function getScanById(int scanId) returns ScanResponseDetailed|error {
        string resourcePath = string `/webscans/${scanId}`;
        map<any> headerValues = {"apiKey": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ScanResponseDetailed response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets data for a particular scan/webUrl
    #
    # + scanId - Id of scan 
    # + urlId - Id of url to fetch 
    # + return - scan response 
    remote isolated function getScanUrlById(int scanId, int urlId) returns WebUrlDetail|error {
        string resourcePath = string `/webscans/${scanId}/webUrls/${urlId}`;
        map<any> headerValues = {"apiKey": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        WebUrlDetail response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
