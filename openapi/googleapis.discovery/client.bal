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

# This is a generated connector for [Google Discovery REST API v1](https://developers.google.com/discovery/v1/reference) OpenAPI specification.
# Provides information about other Google APIs, such as what APIs are available, the resource, and method details for each API.
@display {label: "Googleapis Discovery", iconPath: "resources/googleapis.discovery.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://www.googleapis.com/discovery/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Retrieve the list of APIs supported at this endpoint.
    #
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + name - Only include APIs with the given name. 
    # + preferred - Return only the preferred version of an API. 
    # + return - Successful response 
    remote isolated function listAPIList(string? alt = (), string? fields = (), string? quotaUser = (), string? userIp = (), string? name = (), boolean? preferred = ()) returns DirectoryList|error {
        string  path = string `/apis`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "quotaUser": quotaUser, "userIp": userIp, "name": name, "preferred": preferred};
        path = path + check getPathForQueryParam(queryParam);
        DirectoryList response = check self.clientEp-> get(path, targetType = DirectoryList);
        return response;
    }
    # Retrieve the description of a particular version of an api.
    #
    # + api - The name of the API. 
    # + 'version - The version of the API. 
    # + alt - Data format for the response. 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - An opaque string that represents a user for quota purposes. Must not exceed 40 characters. 
    # + userIp - Deprecated. Please use quotaUser instead. 
    # + return - Successful response 
    remote isolated function getAPIDescription(string api, string 'version, string? alt = (), string? fields = (), string? quotaUser = (), string? userIp = ()) returns RestDescription|error {
        string  path = string `/apis/${api}/${'version}/rest`;
        map<anydata> queryParam = {"alt": alt, "fields": fields, "quotaUser": quotaUser, "userIp": userIp};
        path = path + check getPathForQueryParam(queryParam);
        RestDescription response = check self.clientEp-> get(path, targetType = RestDescription);
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
