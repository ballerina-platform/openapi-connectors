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

# This is a generated connector for [Insightly API v3.1](https://api.insightly.com/v3.1/Help?_ga=2.145122291.690415835.1637494899-1873531480.1637320890#!/Overview/Introduction) OpenAPI specification.
# This API enables you to integrate Insightly with external systems and applications. This uses HTTPS to access data within the Insightly web application. 
@display {label: "Insightly Custom", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Insightly Account](https://www.insightly.com/) and obtain tokens by following [this guide](https://support.insight.ly/en-us/Knowledge/article/1101/Finding_your_API_key_or_URL_and_resetting_your_key_).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.insightly.com/v3.1") returns error? {
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
    # Gets a list of records
    #
    # + objectName - The object name 
    # + brief - Optional, true if response should only contain top level properties of the record. 
    # + skip - Optional, number of records to skip. 
    # + top - Optional, maximum number of records to return in the response. 
    # + countTotal - Optional,true if total number of records should be returned in the response headers. 
    # + return - Request succeeded. 
    remote isolated function getEntities(string objectName, boolean brief = false, int? skip = (), int? top = (), boolean countTotal = false) returns CustomObjectsRecords[]|error {
        string resourcePath = string `/${getEncodedUri(objectName)}`;
        map<anydata> queryParam = {"brief": brief, "skip": skip, "top": top, "count_total": countTotal};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CustomObjectsRecords[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a record
    #
    # + objectName - The object name 
    # + payload - The record to update (just include the JSON object as the request body) 
    # + return - Request succeeded. 
    remote isolated function updateEntity(string objectName, Customobjectsrecords1 payload) returns CustomObjectsRecords|error {
        string resourcePath = string `/${getEncodedUri(objectName)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomObjectsRecords response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Adds a record
    #
    # + objectName - The object name 
    # + payload - The record to add (just include the JSON object as the request body) 
    # + return - Request succeeded. 
    remote isolated function addEntity(string objectName, Customobjectsrecords2 payload) returns CustomObjectsRecords|error {
        string resourcePath = string `/${getEncodedUri(objectName)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomObjectsRecords response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a record
    #
    # + objectName - The object name 
    # + id - The record's ID 
    # + return - Request succeeded. 
    remote isolated function getEntity(string objectName, int id) returns CustomObjectsRecords|error {
        string resourcePath = string `/${getEncodedUri(objectName)}/${getEncodedUri(id)}`;
        CustomObjectsRecords response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a Record
    #
    # + objectName - The object name 
    # + id - Entity's ID 
    # + return - Delete succeeded. 
    remote isolated function deleteEntity(string objectName, int id) returns http:Response|error {
        string resourcePath = string `/${getEncodedUri(objectName)}/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets a record's translation in a specific language
    #
    # + objectName - The object name 
    # + id - The record's ID 
    # + language - The requested language 
    # + return - Request succeeded. 
    remote isolated function getTranslation(string objectName, int id, string language) returns CustomObjectsRecords[]|error {
        string resourcePath = string `/${getEncodedUri(objectName)}/${getEncodedUri(id)}/Translations/${getEncodedUri(language)}`;
        CustomObjectsRecords[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a record's translation in a specific language
    #
    # + objectName - The object name 
    # + language - The language of the record's translation to update 
    # + payload - The record to update (just include the JSON object as the request body) 
    # + return - Request succeeded. 
    remote isolated function updateTranslation(string objectName, string language, string id, Customobjectsrecords3 payload) returns CustomObjectsRecords[]|error {
        string resourcePath = string `/${getEncodedUri(objectName)}/${getEncodedUri(id)}/Translations/${getEncodedUri(language)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomObjectsRecords[] response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Adds a Translation for a record in a specific language
    #
    # + objectName - The object name 
    # + language - The language of the translation to add 
    # + payload - The record to add (just include the JSON object as the request body) 
    # + return - Request succeeded. 
    remote isolated function addTranslation(string objectName, string language, string id, CustomObjectsRecords1 payload) returns CustomObjectsRecords[]|error {
        string resourcePath = string `/${getEncodedUri(objectName)}/${getEncodedUri(id)}/Translations/${getEncodedUri(language)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomObjectsRecords[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a filtered list of records
    #
    # + objectName - The object name 
    # + fieldName - Optional, field name for object 
    # + fieldValue - Optional, field value of the record 
    # + updatedAfterUtc - Optional, earliest date when a record was last updated. 
    # + brief - Optional, true if response should only contain top level properties of the record. 
    # + skip - Optional, number of records to skip. 
    # + top - Optional, maximum number of records to return in the response. 
    # + countTotal - Optional, true if total number of records should be returned in the response headers. 
    # + return - Request succeeded. 
    remote isolated function getCustomObjectsRecordsBySearch(string objectName, string? fieldName = (), string? fieldValue = (), string? updatedAfterUtc = (), boolean brief = false, int? skip = (), int? top = (), boolean countTotal = false) returns CustomObjectsRecords[]|error {
        string resourcePath = string `/${getEncodedUri(objectName)}/Search`;
        map<anydata> queryParam = {"field_name": fieldName, "field_value": fieldValue, "updated_after_utc": updatedAfterUtc, "brief": brief, "skip": skip, "top": top, "count_total": countTotal};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CustomObjectsRecords[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of Custom Fields
    #
    # + return - Request succeeded. 
    remote isolated function getCustomFields(string objectName) returns APICustomFieldMetadata[]|error {
        string resourcePath = string `/CustomFields/${getEncodedUri(objectName)}`;
        APICustomFieldMetadata[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a Custom Field by name
    #
    # + objectName - The object name 
    # + fieldName - The custom field name 
    # + return - Request succeeded. 
    remote isolated function getCustomfieldBySearch(string objectName, string fieldName) returns CustomFieldMetadata|error {
        string resourcePath = string `/CustomFields/${getEncodedUri(objectName)}/Search`;
        map<anydata> queryParam = {"fieldName": fieldName};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CustomFieldMetadata response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of custom objects
    #
    # + return - Request succeeded. 
    remote isolated function getCustomObjects() returns APICustomObject[]|error {
        string resourcePath = string `/CustomObjects`;
        APICustomObject[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a custom object by object name
    #
    # + customObjectName - The custom object name 
    # + return - Request succeeded. 
    remote isolated function getCustomObject(string customObjectName) returns CustomObject|error {
        string resourcePath = string `/CustomObjects/${getEncodedUri(customObjectName)}`;
        CustomObject response = check self.clientEp->get(resourcePath);
        return response;
    }
}
