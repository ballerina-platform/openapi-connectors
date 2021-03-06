// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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
    http:OAuth2ClientCredentialsGrantConfig|http:BearerTokenConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
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
|};

# This is a generated connector for [Commercetools API v1](https://docs.commercetools.com/api/) OpenAPI specification. 
# The commercetools Platform HTTP API(Customize Data) offers an interface for programmatic access to operations related to product types,types, custom fields and custom objects.
@display {label: "Commercetools Customize Data", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. Create and configure an OAuth2 client credentials by following [this guide](https://docs.commercetools.com/api/authorization).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    #
    # + return - 200 
    remote isolated function getProductTypeByID(string projectKey, string id, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${projectKey}/product-types/${id}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductType response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateProductTypeByID(string projectKey, string id, ProductTypeUpdate payload, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${projectKey}/product-types/${id}`;
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
    remote isolated function deleteProductTypeByID(string projectKey, string id, float 'version, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${projectKey}/product-types/${id}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductType response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getProductTypeByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${projectKey}/product-types/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductType response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateProductTypeByKey(string projectKey, string 'key, ProductTypeUpdate payload, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${projectKey}/product-types/key=${'key}`;
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
    remote isolated function deleteProductTypeByKey(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${projectKey}/product-types/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductType response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryProductTypes(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ProductTypePagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/product-types`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductTypePagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createProductTypes(string projectKey, ProductTypeDraft payload, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${projectKey}/product-types`;
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
        string resourcePath = string `/${projectKey}/types/${id}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Type response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateTypeByID(string projectKey, string id, TypeUpdate payload, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${projectKey}/types/${id}`;
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
    remote isolated function deleteTypeByID(string projectKey, string id, float 'version, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${projectKey}/types/${id}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Type response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getTypeByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${projectKey}/types/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Type response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function createTypeByKey(string projectKey, string 'key, TypeUpdate payload, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${projectKey}/types/key=${'key}`;
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
    remote isolated function deleteTypeByKey(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${projectKey}/types/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Type response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryTypes(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns TypePagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/types`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TypePagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createType(string projectKey, TypeDraft payload, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${projectKey}/types`;
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
        string resourcePath = string `/${projectKey}/custom-objects/${container}/${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomObject response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete CustomObject by container and key
    #
    # + return - 200 
    remote isolated function deleteCustomObjectByContainerAndKey(string projectKey, string container, string 'key, float? 'version = (), boolean? dataErasure = (), Expansion[]? expand = ()) returns CustomObject|error {
        string resourcePath = string `/${projectKey}/custom-objects/${container}/${'key}`;
        map<anydata> queryParam = {"version": 'version, "dataErasure": dataErasure, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomObject response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # The query endpoint allows to retrieve custom objects in a specific container or all custom objects.
    # For performance reasons, it is highly advisable to query only for custom objects in a container by using
    # the container field in the where predicate.
    #
    # + return - 200 
    remote isolated function queryCustomObject(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CustomObjectPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/custom-objects`;
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
        string resourcePath = string `/${projectKey}/custom-objects`;
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
        string resourcePath = string `/${projectKey}/custom-objects/${container}`;
        map<anydata> queryParam = {"where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09, "expand": expand};
        map<Encoding> queryParamEncoding = {"where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}, "expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomObjectPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
