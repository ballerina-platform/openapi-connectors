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
import ballerina/mime;

# This is a generated connector for [Readme API v2.0](https://docs.readme.com/reference) OpenAPI specification.  
# The Readme API provides the capability to create product and API documentation programmatically.
@display {label: "Readme", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Readme account](https://dash.readme.com/signup) and obtain tokens by following [this guide](https://docs.readme.com/reference/authentication).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://dash.readme.io/api/v1") returns error? {
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
    # Get metadata about the current project
    #
    # + return - Project data 
    remote isolated function getProject() returns http:Response|error {
        string resourcePath = string `/`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get API specification metadata
    #
    # + perPage - Number of items to include in pagination (up to 100, defaults to 10) 
    # + page - Used to specify further pages (starts at 1) 
    # + xReadmeVersion - Version number of your docs project, for example, v3.0. To see all valid versions for your docs project call https://docs.readme.com/developers/reference/version#getversions. 
    # + return - Successfully retrieved API specification metadata. 
    remote isolated function getAPISpecification(string xReadmeVersion, int perPage = 10, int page = 1) returns http:Response|error {
        string resourcePath = string `/api-specification`;
        map<anydata> queryParam = {"perPage": perPage, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-readme-version": xReadmeVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Upload an API specification to ReadMe. Or, to use a newer solution see https://docs.readme.com/guides/docs/automatically-sync-api-specification-with-github
    #
    # + xReadmeVersion - Version number of your docs project, for example, v3.0. To see all valid versions for your docs project call https://docs.readme.com/developers/reference/version#getversions. 
    # + payload - File 
    # + return - The API specification successfully imported 
    remote isolated function uploadAPISpecification(string xReadmeVersion, File payload) returns http:Response|error {
        string resourcePath = string `/api-specification`;
        map<any> headerValues = {"x-readme-version": xReadmeVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Update an API specification in ReadMe
    #
    # + id - ID of the API specification. The unique ID for each API can be found by navigating to your **API Definitions** page. 
    # + payload - File 
    # + return - The API specification was updated 
    remote isolated function updateAPISpecification(string id, File payload) returns http:Response|error {
        string resourcePath = string `/api-specification/${getEncodedUri(id)}`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an API specification in ReadMe
    #
    # + id - ID of the API specification. The unique ID for each API can be found by navigating to your **API Definitions** page. 
    # + return - The API specification was deleted 
    remote isolated function deleteAPISpecification(string id) returns http:Response|error {
        string resourcePath = string `/api-specification/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get category
    #
    # + slug - Slug of category. Slugs must be all lowercase, and replace spaces with hyphens. For example, for the the category "Getting Started", enter the slug "getting-started" 
    # + xReadmeVersion - Version number of your docs project, for example, v3.0. To see all valid versions for your docs project call https://docs.readme.com/developers/reference/version#getversions. 
    # + return - The category exists and has been returned 
    remote isolated function getCategory(string slug, string xReadmeVersion) returns http:Response|error {
        string resourcePath = string `/categories/${getEncodedUri(slug)}`;
        map<any> headerValues = {"x-readme-version": xReadmeVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get docs for category
    #
    # + slug - Slug of category. Slugs must be all lowercase, and replace spaces with hyphens. For example, for the the category "Getting Started", enter the slug "getting-started" 
    # + xReadmeVersion - Version number of your docs project, for example, v3.0. To see all valid versions for your docs project call https://docs.readme.com/developers/reference/version#getversions. 
    # + return - The category exists and all of the docs have been returned 
    remote isolated function getCategoryDocs(string slug, string xReadmeVersion) returns http:Response|error {
        string resourcePath = string `/categories/${getEncodedUri(slug)}/docs`;
        map<any> headerValues = {"x-readme-version": xReadmeVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get changelogs
    #
    # + perPage - Number of items to include in pagination (up to 100, defaults to 10) 
    # + page - Used to specify further pages (starts at 1) 
    # + return - OK 
    remote isolated function getChangelogs(int perPage = 10, int page = 1) returns http:Response|error {
        string resourcePath = string `/changelogs`;
        map<anydata> queryParam = {"perPage": perPage, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create changelog
    #
    # + payload - Changelog object 
    # + return - The changelog has successfully been created 
    remote isolated function createChangelog(Changelog payload) returns http:Response|error {
        string resourcePath = string `/changelogs`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get changelog
    #
    # + slug - Slug of changelog 
    # + return - The changelog exists and has been returned 
    remote isolated function getChangelog(string slug) returns http:Response|error {
        string resourcePath = string `/changelogs/${getEncodedUri(slug)}`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update changelog
    #
    # + slug - Slug of changelog 
    # + payload - Changelog object 
    # + return - The changelog has successfully been updated 
    remote isolated function updateChangelog(string slug, Changelog payload) returns http:Response|error {
        string resourcePath = string `/changelogs/${getEncodedUri(slug)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete changelog
    #
    # + slug - Slug of changelog 
    # + return - The changelog has successfully been updated 
    remote isolated function deleteChangelog(string slug) returns http:Response|error {
        string resourcePath = string `/changelogs/${getEncodedUri(slug)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get custom pages
    #
    # + perPage - Number of items to include in pagination (up to 100, defaults to 10) 
    # + page - Used to specify further pages (starts at 1) 
    # + return - OK 
    remote isolated function getCustomPages(int perPage = 10, int page = 1) returns http:Response|error {
        string resourcePath = string `/custompages`;
        map<anydata> queryParam = {"perPage": perPage, "page": page};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create custom page
    #
    # + payload - CustomPage object 
    # + return - The custom page has successfully been created 
    remote isolated function createCustomPage(CustomPage payload) returns http:Response|error {
        string resourcePath = string `/custompages`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get custom page
    #
    # + slug - Slug of custom page 
    # + return - The custom page exists and has been returned 
    remote isolated function getCustomPage(string slug) returns http:Response|error {
        string resourcePath = string `/custompages/${getEncodedUri(slug)}`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update custom page
    #
    # + slug - Slug of custom page 
    # + payload - CustomPage object 
    # + return - The custom page has successfully been updated 
    remote isolated function updateCustomPage(string slug, CustomPage payload) returns http:Response|error {
        string resourcePath = string `/custompages/${getEncodedUri(slug)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete custom page
    #
    # + slug - Slug of custom page 
    # + return - The custom page has successfully been updated 
    remote isolated function deleteCustomPage(string slug) returns http:Response|error {
        string resourcePath = string `/custompages/${getEncodedUri(slug)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Create doc
    #
    # + xReadmeVersion - Version number of your docs project, for example, v3.0. To see all valid versions for your docs project call https://docs.readme.com/developers/reference/version#getversions. 
    # + payload - Doc object 
    # + return - The doc has successfully been created 
    remote isolated function createDoc(string xReadmeVersion, Doc payload) returns http:Response|error {
        string resourcePath = string `/docs`;
        map<any> headerValues = {"x-readme-version": xReadmeVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Search docs
    #
    # + search - Search string to look for 
    # + xReadmeVersion - Version number of your docs project, for example, v3.0. To see all valid versions for your docs project call https://docs.readme.com/developers/reference/version#getversions. 
    # + return - The search was successful and results were returned 
    remote isolated function searchDocs(string search, string xReadmeVersion) returns http:Response|error {
        string resourcePath = string `/docs/search`;
        map<anydata> queryParam = {"search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-readme-version": xReadmeVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get doc
    #
    # + slug - Slug of doc. must be lowercase, and replace spaces with hyphens. For example, for the page titled "New Features", enter the slug "new-features" 
    # + xReadmeVersion - Version number of your docs project, for example, v3.0. To see all valid versions for your docs project call https://docs.readme.com/developers/reference/version#getversions. 
    # + return - The doc exists and has been returned 
    remote isolated function getDoc(string slug, string xReadmeVersion) returns http:Response|error {
        string resourcePath = string `/docs/${getEncodedUri(slug)}`;
        map<any> headerValues = {"x-readme-version": xReadmeVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update doc
    #
    # + slug - Slug of doc. must be lowercase, and replace spaces with hyphens. For example, for the page titled "New Features", enter the slug "new-features" 
    # + xReadmeVersion - Version number of your docs project, for example, v3.0. To see all valid versions for your docs project call https://docs.readme.com/developers/reference/version#getversions. 
    # + payload - Doc object 
    # + return - The doc has successfully been updated 
    remote isolated function updateDoc(string slug, string xReadmeVersion, Doc payload) returns http:Response|error {
        string resourcePath = string `/docs/${getEncodedUri(slug)}`;
        map<any> headerValues = {"x-readme-version": xReadmeVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete doc
    #
    # + slug - Slug of doc. must be lowercase, and replace spaces with hyphens. For example, for the page titled "New Features", enter the slug "new-features" 
    # + xReadmeVersion - Version number of your docs project, for example, v3.0. To see all valid versions for your docs project call https://docs.readme.com/developers/reference/version#getversions. 
    # + return - The doc has successfully been updated 
    remote isolated function deleteDoc(string slug, string xReadmeVersion) returns http:Response|error {
        string resourcePath = string `/docs/${getEncodedUri(slug)}`;
        map<any> headerValues = {"x-readme-version": xReadmeVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get errors
    #
    # + return - An array of the errors 
    remote isolated function getErrors() returns http:Response|error {
        string resourcePath = string `/errors`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # DEPRECATED. Instead, use https://docs.readme.com/developers/reference/api-specification#deleteapispecification to delete a Swagger file in ReadMe
    #
    # + id - ID of swagger the file 
    # + return - The Swagger file was successfully deleted 
    # 
    # # Deprecated
    @deprecated
    remote isolated function deleteSwagger(string id) returns http:Response|error {
        string resourcePath = string `/swagger/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get versions
    #
    # + return - JSON list of versions 
    remote isolated function getVersions() returns http:Response|error {
        string resourcePath = string `/version`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create version
    #
    # + payload - Version object 
    # + return - The model was successfully created and associated with the target project 
    remote isolated function createVersion(Version payload) returns http:Response|error {
        string resourcePath = string `/version`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get version
    #
    # + versionId - Semver version indentifier 
    # + return - JSON version model 
    remote isolated function getVersion(string versionId) returns http:Response|error {
        string resourcePath = string `/version/${getEncodedUri(versionId)}`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update version
    #
    # + versionId - Semver version indentifier 
    # + payload - Version object 
    # + return - The target version was successfully updated 
    remote isolated function updateVersion(string versionId, Version payload) returns http:Response|error {
        string resourcePath = string `/version/${getEncodedUri(versionId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete version
    #
    # + versionId - Semver version indentifier 
    # + return - The target version was successfully deleted 
    remote isolated function deleteVersion(string versionId) returns http:Response|error {
        string resourcePath = string `/version/${getEncodedUri(versionId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
