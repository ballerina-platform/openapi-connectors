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

# Configuration for HubSpot CRM connector
#
# + authConfig - Basic authentication or CredentialsConfig Configuration Tokens
# + secureSocketConfig - Secure Socket Configuration 
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};
# This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification.
# This API provides access to collections of CRM objects, which return a map of property names to values. Each object type has its own set of default properties, which can be found by exploring the [CRM Object Properties API](https://developers.hubspot.com/docs/methods/crm-properties/crm-properties-overview).
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [HubSpot account](https://www.hubspot.com/) and obtain OAuth tokens following [this guide](https://developers.hubspot.com/docs/api/working-with-oauth4).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.hubapi.com") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Get active imports
    #
    # + after - The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results.
    # + before - The paging cursor token from second page onwards will be returned as the `paging.next.before` JSON property of a paged response containing more results.
    # + 'limit - The maximum number of results to display per page.
    # + return - successful operation
    remote isolated function getPage(string? after = (), string? before = (), int? 'limit = ()) returns CollectionResponsePublicImportResponse|error {
        string  path = string `/crm/v3/imports/`;
        map<anydata> queryParam = {"after": after, "before": before, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        CollectionResponsePublicImportResponse response = check self.clientEp-> get(path, targetType = CollectionResponsePublicImportResponse);
        return response;
    }
    # Start a new import
    #
    # + payload - Properties
    # + return - successful operation
    remote isolated function create(Body payload) returns PublicImportResponse|error {
        string  path = string `/crm/v3/imports/`;
        http:Request request = new;
        PublicImportResponse response = check self.clientEp->post(path, request, targetType=PublicImportResponse);
        return response;
    }
    # Get the information on any import
    #
    # + importId - Import ID
    # + return - successful operation
    remote isolated function getById(int importId) returns PublicImportResponse|error {
        string  path = string `/crm/v3/imports/${importId}`;
        PublicImportResponse response = check self.clientEp-> get(path, targetType = PublicImportResponse);
        return response;
    }
    # Cancel an active import
    #
    # + importId - Import ID
    # + return - successful operation
    remote isolated function cancel(int importId) returns ActionResponse|error {
        string  path = string `/crm/v3/imports/${importId}/cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ActionResponse response = check self.clientEp-> post(path, request, targetType = ActionResponse);
        return response;
    }
    #
    # + importId - Import ID
    # + after - The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results.
    # + 'limit - The maximum number of results to display per page.
    # + return - successful operation
    remote isolated function errors(int importId, string? after = (), int? 'limit = ()) returns CollectionResponsePublicImportErrorForwardPaging|error {
        string  path = string `/crm/v3/imports/${importId}/errors`;
        map<anydata> queryParam = {"after": after, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        CollectionResponsePublicImportErrorForwardPaging response = check self.clientEp-> get(path, targetType = CollectionResponsePublicImportErrorForwardPaging);
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
