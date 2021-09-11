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
import ballerina/url;
import ballerina/lang.'string;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [VisibleThread API v1.0](https://api.visiblethread.com/example/index.html) OpenAPI specification. 
# The VisibleThread API provides services for analyzing or searching documents and web pages.
@display {label: "VisibleThread", iconPath: "resources/visiblethread.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Contact support@visiblethread.com to request an API key.
    #
    # + apiKeyConfig - Provide your API key as `apiKey`. Eg: `{"apiKey" : "<your API key >"}` 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.visiblethread.com/api/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Get your list of documents
    #
    # + return - Successful response 
    remote isolated function getDocs() returns DocumentListSummary[]|error {
        string  path = string `/documents`;
        map<any> headerValues = {"apiKey": self.apiKeys["apiKey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DocumentListSummary[] response = check self.clientEp-> get(path, accHeaders, targetType = DocumentListSummaryArr);
        return response;
    }
    # Upload a document
    #
    # + payload - Request payload to upload document 
    # + return - Successful response 
    remote isolated function uploadDoc(Body payload) returns NewDocumentResponse|error {
        string  path = string `/documents`;
        map<any> headerValues = {"apiKey": self.apiKeys["apiKey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        NewDocumentResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=NewDocumentResponse);
        return response;
    }
    # Get data from a previously submitted document
    #
    # + docId - Id of document to fetch 
    # + return - document response contained readability details for the document 
    remote isolated function getDocById(int docId) returns DocumentResponseDetailed|error {
        string  path = string `/documents/${docId}`;
        map<any> headerValues = {"apiKey": self.apiKeys["apiKey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DocumentResponseDetailed response = check self.clientEp-> get(path, accHeaders, targetType = DocumentResponseDetailed);
        return response;
    }
    # Get your list of dictionaries
    #
    # + return - Successful response 
    remote isolated function getDictionaries() returns http:Response|error {
        string  path = string `/dictionaries`;
        map<any> headerValues = {"apiKey": self.apiKeys["apiKey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Upload a dictionary (CSV)
    #
    # + payload - Request payload to upload dictionary 
    # + return - Successful response 
    remote isolated function uploadDictionary(Body1 payload) returns http:Response|error {
        string  path = string `/dictionaries`;
        map<any> headerValues = {"apiKey": self.apiKeys["apiKey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Get your list of searches
    #
    # + return - Successful response 
    remote isolated function getSearchResults() returns http:Response|error {
        string  path = string `/searches`;
        map<any> headerValues = {"apiKey": self.apiKeys["apiKey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Run a search
    #
    # + payload - Run a search on document **docId** using dictionary**dictId** 
    # + return - Successful response 
    remote isolated function runSearch(Search payload) returns string|error {
        string  path = string `/searches`;
        map<any> headerValues = {"apiKey": self.apiKeys["apiKey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
        return response;
    }
    # Gets search results for a particular document/dictionary
    #
    # + docId - Id of document 
    # + dictionaryId - Id of dictionary 
    # + matchingOnly - Only returning paragraphs containing a match 
    # + return - scan response 
    remote isolated function getSearchResultsById(int docId, int dictionaryId, boolean matchingOnly) returns http:Response|error {
        string  path = string `/searches/${docId}/${dictionaryId}`;
        map<anydata> queryParam = {"matchingOnly": matchingOnly};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"apiKey": self.apiKeys["apiKey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Get your list of scans
    #
    # + return - Successful response 
    remote isolated function getScans() returns ScanResponseSummary[]|error {
        string  path = string `/webscans`;
        map<any> headerValues = {"apiKey": self.apiKeys["apiKey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ScanResponseSummary[] response = check self.clientEp-> get(path, accHeaders, targetType = ScanResponseSummaryArr);
        return response;
    }
    # Run a new scan
    #
    # + payload - Scan title and webUrls to analyze 
    # + return - Successful response 
    remote isolated function runScan(NewScan payload) returns NewScanResponse|error {
        string  path = string `/webscans`;
        map<any> headerValues = {"apiKey": self.apiKeys["apiKey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        NewScanResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=NewScanResponse);
        return response;
    }
    # Get data from a previously run scan
    #
    # + scanId - Id of scan to fetch 
    # + return - scan response 
    remote isolated function getScanById(int scanId) returns ScanResponseDetailed|error {
        string  path = string `/webscans/${scanId}`;
        map<any> headerValues = {"apiKey": self.apiKeys["apiKey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ScanResponseDetailed response = check self.clientEp-> get(path, accHeaders, targetType = ScanResponseDetailed);
        return response;
    }
    # Gets data for a particular scan/webUrl
    #
    # + scanId - Id of scan 
    # + urlId - Id of url to fetch 
    # + return - scan response 
    remote isolated function getScanUrlById(int scanId, int urlId) returns WebUrlDetail|error {
        string  path = string `/webscans/${scanId}/webUrls/${urlId}`;
        map<any> headerValues = {"apiKey": self.apiKeys["apiKey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        WebUrlDetail response = check self.clientEp-> get(path, accHeaders, targetType = WebUrlDetail);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map 
# + return - Returns generated Path or error at failure of client initialization 
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
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
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
