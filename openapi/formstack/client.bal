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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_1_1;
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
    # Proxy server related options
    http:ProxyConfig? proxy = ();
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "/oauth/token";
|};

# This is a generated connector for [Formstack REST API v2.0](https://formstack.readme.io/docs/api-overview) OpenAPI specification.
# The [Formstack REST API](https://formstack.readme.io/docs/api-overview) provides a way that helps organizations streamline digital work through no-code online forms, documents, and signatures.
@display {label: "Formstack", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [Formstack account](https://admin.formstack.com/signup/sign-starter) and obtain tokens following [this guide](https://help.formstack.com/s/article/How-to-create-a-V2-API-Application-Key).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://www.formstack.com/api/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get all forms in your account
    #
    # + folders - Flag to return forms in lists separated by folder 
    # + page - Page to use when paginating through forms. Starts at 1 
    # + perPage - Number of forms to return per page. Minimum page limit is 10 
    # + return - Successful response 
    remote isolated function getAllForms(boolean? folders = (), int? page = (), int? perPage = ()) returns Forms|error {
        string resourcePath = string `/form.json`;
        map<anydata> queryParam = {"folders": folders, "page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Forms response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get the details of the specified form
    #
    # + id - Form ID 
    # + return - Successful response 
    remote isolated function getFormById(int id) returns Form|error {
        string resourcePath = string `/form/${getEncodedUri(id)}.json`;
        Form response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update the details of the specified form
    #
    # + id - Form ID 
    # + payload - Form Request 
    # + return - Successful response 
    remote isolated function updateFormById(int id, FormRequest payload) returns SuccessOperation|error {
        string resourcePath = string `/form/${getEncodedUri(id)}.json`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SuccessOperation response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete the specified form
    #
    # + id - Form ID 
    # + return - Successful response 
    remote isolated function deleteFormById(int id) returns SuccessOperation|error {
        string resourcePath = string `/form/${getEncodedUri(id)}.json`;
        SuccessOperation response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Create a copy of the specified form
    #
    # + id - Form ID 
    # + return - Successful response 
    remote isolated function copyFormById(int id) returns Operation|error {
        string resourcePath = string `/form/${getEncodedUri(id)}/copy.json`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Operation response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get the basic details of the specified form
    #
    # + id - Form ID 
    # + return - Successful response 
    remote isolated function getBasicFormById(int id) returns Form|error {
        string resourcePath = string `/form/${getEncodedUri(id)}/basic.json`;
        Form response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get the html of the specified form
    #
    # + id - Form ID 
    # + return - Successful response 
    remote isolated function getHtmlFormById(int id) returns HtmlForm|error {
        string resourcePath = string `/form/${getEncodedUri(id)}/html.json`;
        HtmlForm response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all folders on your account and their subfolders
    #
    # + page - Page to use when paginating through forms. Starts at 1 
    # + perPage - Number of forms to return per page. Minimum page limit is 10 
    # + return - Successful response 
    remote isolated function getAllFolders(int? page = (), int? perPage = ()) returns Folders|error {
        string resourcePath = string `/folder.json`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Folders response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get details for the specified folder or subfolder
    #
    # + id - Folder ID 
    # + return - Successful response 
    remote isolated function getFolderById(int id) returns Folder|error {
        string resourcePath = string `/folder/${getEncodedUri(id)}.json`;
        Folder response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update the specified folder
    #
    # + id - Folder ID 
    # + payload - Folder Request 
    # + return - Successful response 
    remote isolated function updateFolderById(int id, FolderRequest payload) returns SuccessOperation|error {
        string resourcePath = string `/folder/${getEncodedUri(id)}.json`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SuccessOperation response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete the specified folder
    #
    # + id - Folder ID 
    # + return - Successful response 
    remote isolated function deleteFolderById(int id) returns SuccessOperation|error {
        string resourcePath = string `/folder/${getEncodedUri(id)}.json`;
        SuccessOperation response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get all fields for the specified form
    #
    # + id - Form ID 
    # + return - Successful response 
    remote isolated function getAllFields(int id) returns Fields|error {
        string resourcePath = string `/form/${getEncodedUri(id)}/field.json`;
        Fields response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get the details of the specified field
    #
    # + id - Field ID 
    # + return - Successful response 
    remote isolated function getFieldById(int id) returns Field|error {
        string resourcePath = string `/field/${getEncodedUri(id)}.json`;
        Field response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update the specified field
    #
    # + id - Field ID 
    # + payload - Field Request 
    # + return - Successful response 
    remote isolated function updateFieldById(int id, FieldRequest payload) returns SuccessOperation|error {
        string resourcePath = string `/field/${getEncodedUri(id)}.json`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SuccessOperation response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete the specified field
    #
    # + id - Field ID 
    # + return - Successful response 
    remote isolated function deleteFieldById(int id) returns SuccessOperation|error {
        string resourcePath = string `/field/${getEncodedUri(id)}.json`;
        SuccessOperation response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
