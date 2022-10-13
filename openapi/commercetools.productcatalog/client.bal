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
    http:OAuth2ClientCredentialsGrantConfig|http:BearerTokenConfig auth;
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

# OAuth2 Client Credentials Grant Configs
public type OAuth2ClientCredentialsGrantConfig record {|
    *http:OAuth2ClientCredentialsGrantConfig;
    # Token URL
    string tokenUrl = " ";
|};

# This is a generated connector for [Commercetools API v1](https://docs.commercetools.com/api/) OpenAPI specification. 
# The commercetools Platform HTTP API(Product Catalog) offers an interface for programmatic access to the data stored on the platform and associated functionality for product catalogs.
@display {label: "Commercetools Product Catalog", iconPath: "icon.png"}
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
    remote isolated function getCategoryByID(string projectKey, string id, Expansion[]? expand = ()) returns Category|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/categories/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Category response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateCategoryByID(string projectKey, string id, CategoryUpdate payload, Expansion[]? expand = ()) returns Category|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/categories/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Category response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteCategoryByID(string projectKey, string id, decimal 'version, Expansion[]? expand = ()) returns Category|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/categories/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Category response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryCategory(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CategoryPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/categories`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CategoryPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creating a category produces the CategoryCreated message.
    #
    # + return - 201 
    remote isolated function createCategory(string projectKey, CategoryDraft payload, Expansion[]? expand = ()) returns Category|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/categories`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Category response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getCategoryByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns Category|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/categories/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Category response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateCategoryByKey(string projectKey, string 'key, CategoryUpdate payload, Expansion[]? expand = ()) returns Category|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/categories/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Category response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteCategoryByKey(string projectKey, string 'key, decimal 'version, Expansion[]? expand = ()) returns Category|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/categories/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Category response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets the full representation of a product by ID.
    #
    # + return - 200 
    remote isolated function getProductByID(string projectKey, string id, string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns Product|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/products/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Product response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateProductByID(string projectKey, string id, ProductUpdate payload, string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns Product|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/products/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Product response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteProductByID(string projectKey, string id, decimal 'version, string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns Product|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/products/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Product response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Checks if product with given ID exists.
    #
    # + return - The Product exists 
    remote isolated function checkIfProductWithGivenIDExists(string projectKey, string id) returns http:Response|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/products/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp->head(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryProductSelectionsForProductByKey(string projectKey, string 'key, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ProductSelectionPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/products/key=${getEncodedUri('key)}/product-selections`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelectionPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryProductSelectionsForProductByID(string projectKey, string id, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ProductSelectionPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/products/${getEncodedUri(id)}/product-selections`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelectionPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the full representation of a product by Key.
    #
    # + return - 200 
    remote isolated function getProductByKey(string projectKey, string 'key, string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns Product|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/products/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Product response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateProductByKey(string projectKey, string 'key, ProductUpdate payload, string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns Product|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/products/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Product response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteProductByKey(string projectKey, string 'key, decimal 'version, string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns Product|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/products/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Product response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Checks if product with given key exists.
    #
    # + return - The Product exists 
    remote isolated function checkIfProductWithGivenKeyExistsByKey(string projectKey, string 'key) returns http:Response|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/products/key=${getEncodedUri('key)}`;
        http:Response response = check self.clientEp->head(resourcePath);
        return response;
    }
    # You can use the query endpoint to get the full representations of products.
    # REMARK: We suggest to use the performance optimized search endpoint which has a bunch functionalities,
    # the query API lacks like sorting on custom attributes, etc.
    #
    # + return - 200 
    remote isolated function queryProduct(string projectKey, string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ProductPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/products`;
        map<anydata> queryParam = {"priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # To create a new product, send a representation that is going to become the initial staged representation
    # of the new product in the master catalog. If price selection query parameters are provided,
    # the selected prices will be added to the response.
    #
    # + return - 201 
    remote isolated function createNewProduct(string projectKey, ProductDraft payload, string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns Product|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/products`;
        map<anydata> queryParam = {"priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Product response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Checks if products exist.
    #
    # + return - At least one Product matching the query exists 
    remote isolated function checkIfProductsExists(string projectKey) returns http:Response|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/products`;
        http:Response response = check self.clientEp->head(resourcePath);
        return response;
    }
    # Uploads a binary image file to a given product variant. The supported image formats are JPEG, PNG and GIF.
    #
    # + return - 200 
    remote isolated function uploadProductImage(string projectKey, string id, byte[] payload, string? filename = (), decimal? variant = (), string? sku = (), boolean? staged = ()) returns Product|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/products/${getEncodedUri(id)}/images`;
        map<anydata> queryParam = {"filename": filename, "variant": variant, "sku": sku, "staged": staged};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        request.setPayload(payload, "application/octet-stream");
        Product response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getProductSelectionByID(string projectKey, string id, Expansion[]? expand = ()) returns ProductSelection|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-selections/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelection response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateProductSelectionByID(string projectKey, string id, ProductSelectionUpdate payload, Expansion[]? expand = ()) returns ProductSelection|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-selections/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductSelection response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Deletion will only succeed if the Product Selection is not assigned to any [Store](/../api/projects/stores#store).
    #
    # + return - 200 
    remote isolated function deleteProductSelectionByID(string projectKey, string id, decimal 'version, Expansion[]? expand = ()) returns ProductSelection|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-selections/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelection response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getProductSelectionsByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns ProductSelection|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-selections/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelection response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateProductSelectionsByKey(string projectKey, string 'key, ProductSelectionUpdate payload, Expansion[]? expand = ()) returns ProductSelection|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-selections/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductSelection response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Deletion will only succeed if the Product Selection is not assigned to any [Store](/../api/projects/stores#store).
    #
    # + return - 200 
    remote isolated function deleteProductSelectionsByKey(string projectKey, string 'key, decimal 'version, Expansion[]? expand = ()) returns ProductSelection|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-selections/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelection response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryProductsAssignedProductSelectionByKey(string projectKey, string 'key, Expansion[]? expand = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = ()) returns ProductSelectionProductPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-selections/key=${getEncodedUri('key)}/products`;
        map<anydata> queryParam = {"expand": expand, "limit": 'limit, "offset": offset, "withTotal": withTotal};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelectionProductPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryProductsAssignedProductSelectionByID(string projectKey, string id, Expansion[]? expand = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = ()) returns ProductSelectionProductPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-selections/${getEncodedUri(id)}/products`;
        map<anydata> queryParam = {"expand": expand, "limit": 'limit, "offset": offset, "withTotal": withTotal};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelectionProductPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the current or staged representation of a product in a catalog by ID.
    # When used with an API client that has the view_published_products:{projectKey} scope,
    # this endpoint only returns published (current) product projections.
    #
    # + return - 200 
    remote isolated function getProductProjectionByID(string projectKey, string id, boolean? staged = (), string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns ProductProjection|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-projections/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"staged": staged, "priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductProjection response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the current or staged representation of a product by its ID from a specific Store.
    #
    # + return - 200 
    remote isolated function getProductProjectionInStoreByID(string projectKey, string storeKey, string id, Expansion[]? expand = ()) returns ProductProjection|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/product-projections/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductProjection response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the current or staged representation of a product found by Key.
    # When used with an API client that has the view_published_products:{projectKey} scope,
    # this endpoint only returns published (current) product projections.
    #
    # + return - 200 
    remote isolated function getProductProjectionByKey(string projectKey, string 'key, boolean? staged = (), string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns ProductProjection|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-projections/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"staged": staged, "priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductProjection response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the current or staged representation of a product by its ID from a specific Store.
    #
    # + return - 200 
    remote isolated function getProductProjectionInStoreByKey(string projectKey, string storeKey, string 'key, Expansion[]? expand = ()) returns ProductProjection|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/product-projections/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductProjection response = check self.clientEp->get(resourcePath);
        return response;
    }
    # You can use the product projections query endpoint to get the current or staged representations of Products.
    # When used with an API client that has the view_published_products:{projectKey} scope,
    # this endpoint only returns published (current) product projections.
    #
    # + return - 200 
    remote isolated function queryProductProjections(string projectKey, boolean? staged = (), string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ProductProjectionPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-projections`;
        map<anydata> queryParam = {"staged": staged, "priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductProjectionPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Search Product Projection
    #
    # + return - 200 
    remote isolated function searchproductprojectionsGet(string projectKey, boolean? fuzzy = (), decimal? fuzzyLevel = (), boolean? markMatchingVariants = (), boolean? staged = (), string[]? filter = (), string[]? filterFacets = (), string[]? filterQuery = (), string[]? facet = (), string[]? textAZ2AZ2 = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns ProductProjectionPagedSearchResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-projections/search`;
        map<anydata> queryParam = {"fuzzy": fuzzy, "fuzzyLevel": fuzzyLevel, "markMatchingVariants": markMatchingVariants, "staged": staged, "filter": filter, "filter.facets": filterFacets, "filter.query": filterQuery, "facet": facet, "/text.[a-z]{2}(-[A-Z]{2})?/": textAZ2AZ2, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "expand": expand};
        map<Encoding> queryParamEncoding = {"filter": {style: FORM, explode: true}, "filter.facets": {style: FORM, explode: true}, "filter.query": {style: FORM, explode: true}, "facet": {style: FORM, explode: true}, "/text.[a-z]{2}(-[A-Z]{2})?/": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductProjectionPagedSearchResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Search Product Projection
    #
    # + return - 200 
    remote isolated function searchproductprojectionsPost(string projectKey, URLEncodedPayload payload) returns ProductProjectionPagedSearchResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-projections/search`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        ProductProjectionPagedSearchResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function suggestQuery(string projectKey, boolean? fuzzy = (), boolean? staged = (), string[]? searchkeywordsAZ2AZ2 = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = ()) returns json|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-projections/suggest`;
        map<anydata> queryParam = {"fuzzy": fuzzy, "staged": staged, "/searchKeywords.[a-z]{2}(-[A-Z]{2})?/": searchkeywordsAZ2AZ2, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal};
        map<Encoding> queryParamEncoding = {"/searchKeywords.[a-z]{2}(-[A-Z]{2})?/": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getInventoryEntryByID(string projectKey, string id, Expansion[]? expand = ()) returns InventoryEntry|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/inventory/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InventoryEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateInventoryEntryByID(string projectKey, string id, InventoryEntryUpdate payload, Expansion[]? expand = ()) returns InventoryEntry|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/inventory/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InventoryEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteInventoryEntryByID(string projectKey, string id, decimal 'version, Expansion[]? expand = ()) returns InventoryEntry|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/inventory/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InventoryEntry response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryInventory(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns InventoryPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/inventory`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InventoryPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createInventory(string projectKey, InventoryEntryDraft payload, Expansion[]? expand = ()) returns InventoryEntry|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/inventory`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InventoryEntry response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getReviewByID(string projectKey, string id, Expansion[]? expand = ()) returns Review|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/reviews/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Review response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateReviewByID(string projectKey, string id, ReviewUpdate payload, Expansion[]? expand = ()) returns Review|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/reviews/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Review response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteReviewByID(string projectKey, string id, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Review|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/reviews/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Review response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getReviewByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns Review|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/reviews/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Review response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateReviewByKey(string projectKey, string 'key, ReviewUpdate payload, Expansion[]? expand = ()) returns Review|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/reviews/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Review response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteReviewByKey(string projectKey, string 'key, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Review|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/reviews/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Review response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryReviews(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ReviewPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/reviews`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ReviewPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createReviews(string projectKey, ReviewDraft payload, Expansion[]? expand = ()) returns Review|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/reviews`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Review response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
