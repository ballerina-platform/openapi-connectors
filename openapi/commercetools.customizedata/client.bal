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

# This is a generated connector for [Commercetools API v1](https://docs.commercetools.com/api/) OpenAPI specification. 
# The commercetools Platform HTTP API(Customize Data) offers an interface for programmatic access to operations related to product types,types, custom fields and custom objects.
@display {label: "Commercetools Customize Data", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. Create and configure an OAuth2 client credentials by following [this guide](https://docs.commercetools.com/api/authorization).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl) returns error? {
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
    #
    # + return - 200 
    remote isolated function getProductTypeByID(string projectKey, string id, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-types/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductType response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateProductTypeByID(string projectKey, string id, ProductTypeUpdate payload, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-types/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductType response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteProductTypeByID(string projectKey, string id, decimal 'version, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-types/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductType response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getProductTypeByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-types/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductType response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateProductTypeByKey(string projectKey, string 'key, ProductTypeUpdate payload, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-types/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductType response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteProductTypeByKey(string projectKey, string 'key, decimal 'version, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-types/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductType response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryProductTypes(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ProductTypePagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-types`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductTypePagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createProductTypes(string projectKey, ProductTypeDraft payload, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-types`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductType response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getTypeByID(string projectKey, string id, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/types/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Type response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateTypeByID(string projectKey, string id, TypeUpdate payload, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/types/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Type response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteTypeByID(string projectKey, string id, decimal 'version, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/types/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Type response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getTypeByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/types/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Type response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function createTypeByKey(string projectKey, string 'key, TypeUpdate payload, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/types/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Type response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteTypeByKey(string projectKey, string 'key, decimal 'version, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/types/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Type response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryTypes(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns TypePagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/types`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TypePagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createType(string projectKey, TypeDraft payload, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/types`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Type response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get CustomObject by container and key
    #
    # + return - 200 
    remote isolated function getCustomObjectByContainerAndKey(string projectKey, string container, string 'key, Expansion[]? expand = ()) returns CustomObject|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/custom-objects/${getEncodedUri(container)}/${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomObject response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete CustomObject by container and key
    #
    # + return - 200 
    remote isolated function deleteCustomObjectByContainerAndKey(string projectKey, string container, string 'key, decimal? 'version = (), boolean? dataErasure = (), Expansion[]? expand = ()) returns CustomObject|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/custom-objects/${getEncodedUri(container)}/${getEncodedUri('key)}`;
        map<anydata> queryParam = {"version": 'version, "dataErasure": dataErasure, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomObject response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # The query endpoint allows to retrieve custom objects in a specific container or all custom objects.
    # For performance reasons, it is highly advisable to query only for custom objects in a container by using
    # the container field in the where predicate.
    #
    # + return - 200 
    remote isolated function queryCustomObject(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CustomObjectPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/custom-objects`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomObjectPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new custom object or updates an existing custom object.
    # If an object with the given container/key exists,
    # the object will be replaced with the new value and the version is incremented.
    # If the request contains a version and an object with the given container/key exists then the version
    # must match the version of the existing object. Concurrent updates for the same custom object still can result
    # in a Conflict (409) even if the version is not provided.
    # Fields with null values will not be saved.
    #
    # + return - 200 
    remote isolated function createOrUpdateCustomObject(string projectKey, CustomObjectDraft payload, Expansion[]? expand = ()) returns CustomObject|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/custom-objects`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomObject response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryCustomObjectsByContainer(string projectKey, string container, QueryPredicate[]? 'where = (), string[]? varAZaZ09 = (), Expansion[]? expand = ()) returns CustomObjectPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/custom-objects/${getEncodedUri(container)}`;
        map<anydata> queryParam = {"where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09, "expand": expand};
        map<Encoding> queryParamEncoding = {"where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}, "expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomObjectPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
