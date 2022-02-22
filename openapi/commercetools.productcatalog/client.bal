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
# The commercetools Platform HTTP API(Product Catalog) offers an interface for programmatic access to the data stored on the platform and associated functionality for product catalog.
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
    remote isolated function getCategoryByID(string projectKey, string iD, Expansion[]? expand = ()) returns Category|error {
        string resourcePath = string `/${projectKey}/categories/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Category response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateCategoryByID(string projectKey, string iD, CategoryUpdate payload, Expansion[]? expand = ()) returns Category|error {
        string resourcePath = string `/${projectKey}/categories/${iD}`;
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
    remote isolated function byProjectKeyCategoriesByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns Category|error {
        string resourcePath = string `/${projectKey}/categories/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Category response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCategoriesGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CategoryPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/categories`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CategoryPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creating a category produces the CategoryCreated message.
    #
    # + return - 201 
    remote isolated function byProjectKeyCategoriesPost(string projectKey, CategoryDraft payload, Expansion[]? expand = ()) returns Category|error {
        string resourcePath = string `/${projectKey}/categories`;
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
    remote isolated function byProjectKeyCategoriesKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns Category|error {
        string resourcePath = string `/${projectKey}/categories/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Category response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCategoriesKeyByKeyPost(string projectKey, string 'key, CategoryUpdate payload, Expansion[]? expand = ()) returns Category|error {
        string resourcePath = string `/${projectKey}/categories/key=${'key}`;
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
    remote isolated function byProjectKeyCategoriesKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns Category|error {
        string resourcePath = string `/${projectKey}/categories/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Category response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Gets the full representation of a product by ID.
    #
    # + return - 200 
    remote isolated function byProjectKeyProductsByIDGet(string projectKey, string iD, string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns Product|error {
        string resourcePath = string `/${projectKey}/products/${iD}`;
        map<anydata> queryParam = {"priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Product response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductsByIDPost(string projectKey, string iD, ProductUpdate payload, string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns Product|error {
        string resourcePath = string `/${projectKey}/products/${iD}`;
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
    remote isolated function byProjectKeyProductsByIDDelete(string projectKey, string iD, float 'version, string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns Product|error {
        string resourcePath = string `/${projectKey}/products/${iD}`;
        map<anydata> queryParam = {"priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Product response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Checks if product with given ID exists.
    #
    # + return - The Product exists 
    remote isolated function byProjectKeyProductsByIDHead(string projectKey, string iD) returns http:Response|error {
        string resourcePath = string `/${projectKey}/products/${iD}`;
        http:Response response = check self.clientEp->head(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductsKeyByKeyProductSelectionsGet(string projectKey, string 'key, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ProductSelectionPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/products/key=${'key}/product-selections`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelectionPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductsByIDProductSelectionsGet(string projectKey, string iD, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ProductSelectionPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/products/${iD}/product-selections`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelectionPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the full representation of a product by Key.
    #
    # + return - 200 
    remote isolated function byProjectKeyProductsKeyByKeyGet(string projectKey, string 'key, string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns Product|error {
        string resourcePath = string `/${projectKey}/products/key=${'key}`;
        map<anydata> queryParam = {"priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Product response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductsKeyByKeyPost(string projectKey, string 'key, ProductUpdate payload, string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns Product|error {
        string resourcePath = string `/${projectKey}/products/key=${'key}`;
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
    remote isolated function byProjectKeyProductsKeyByKeyDelete(string projectKey, string 'key, float 'version, string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns Product|error {
        string resourcePath = string `/${projectKey}/products/key=${'key}`;
        map<anydata> queryParam = {"priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Product response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Checks if product with given key exists.
    #
    # + return - The Product exists 
    remote isolated function byProjectKeyProductsKeyByKeyHead(string projectKey, string 'key) returns http:Response|error {
        string resourcePath = string `/${projectKey}/products/key=${'key}`;
        http:Response response = check self.clientEp->head(resourcePath);
        return response;
    }
    # You can use the query endpoint to get the full representations of products.
    # REMARK: We suggest to use the performance optimized search endpoint which has a bunch functionalities,
    # the query API lacks like sorting on custom attributes, etc.
    #
    # + return - 200 
    remote isolated function byProjectKeyProductsGet(string projectKey, string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ProductPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/products`;
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
    remote isolated function byProjectKeyProductsPost(string projectKey, ProductDraft payload, string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns Product|error {
        string resourcePath = string `/${projectKey}/products`;
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
    remote isolated function byProjectKeyProductsHead(string projectKey) returns http:Response|error {
        string resourcePath = string `/${projectKey}/products`;
        http:Response response = check self.clientEp->head(resourcePath);
        return response;
    }
    # Uploads a binary image file to a given product variant. The supported image formats are JPEG, PNG and GIF.
    #
    # + return - 200 
    remote isolated function byProjectKeyProductsByIDImagesPost(string projectKey, string iD, byte[] payload, string? filename = (), float? variant = (), string? sku = (), boolean? staged = ()) returns Product|error {
        string resourcePath = string `/${projectKey}/products/${iD}/images`;
        map<anydata> queryParam = {"filename": filename, "variant": variant, "sku": sku, "staged": staged};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        request.setPayload(payload, "application/octet-stream");
        Product response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductSelectionsByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns ProductSelection|error {
        string resourcePath = string `/${projectKey}/product-selections/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelection response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductSelectionsByIDPost(string projectKey, string iD, ProductSelectionUpdate payload, Expansion[]? expand = ()) returns ProductSelection|error {
        string resourcePath = string `/${projectKey}/product-selections/${iD}`;
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
    remote isolated function byProjectKeyProductSelectionsByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns ProductSelection|error {
        string resourcePath = string `/${projectKey}/product-selections/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelection response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductSelectionsKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns ProductSelection|error {
        string resourcePath = string `/${projectKey}/product-selections/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelection response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductSelectionsKeyByKeyPost(string projectKey, string 'key, ProductSelectionUpdate payload, Expansion[]? expand = ()) returns ProductSelection|error {
        string resourcePath = string `/${projectKey}/product-selections/key=${'key}`;
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
    remote isolated function byProjectKeyProductSelectionsKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns ProductSelection|error {
        string resourcePath = string `/${projectKey}/product-selections/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelection response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductSelectionsKeyByKeyProductsGet(string projectKey, string 'key, Expansion[]? expand = (), float? 'limit = (), float? offset = (), boolean? withTotal = ()) returns ProductSelectionProductPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/product-selections/key=${'key}/products`;
        map<anydata> queryParam = {"expand": expand, "limit": 'limit, "offset": offset, "withTotal": withTotal};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelectionProductPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductSelectionsByIDProductsGet(string projectKey, string iD, Expansion[]? expand = (), float? 'limit = (), float? offset = (), boolean? withTotal = ()) returns ProductSelectionProductPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/product-selections/${iD}/products`;
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
    remote isolated function byProjectKeyProductProjectionsByIDGet(string projectKey, string iD, boolean? staged = (), string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns ProductProjection|error {
        string resourcePath = string `/${projectKey}/product-projections/${iD}`;
        map<anydata> queryParam = {"staged": staged, "priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductProjection response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the current or staged representation of a product by its ID from a specific Store.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyProductProjectionsByIDGet(string projectKey, string storeKey, string iD, Expansion[]? expand = ()) returns ProductProjection|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/product-projections/${iD}`;
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
    remote isolated function byProjectKeyProductProjectionsKeyByKeyGet(string projectKey, string 'key, boolean? staged = (), string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns ProductProjection|error {
        string resourcePath = string `/${projectKey}/product-projections/key=${'key}`;
        map<anydata> queryParam = {"staged": staged, "priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductProjection response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the current or staged representation of a product by its ID from a specific Store.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyProductProjectionsKeyByKeyGet(string projectKey, string storeKey, string 'key, Expansion[]? expand = ()) returns ProductProjection|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/product-projections/key=${'key}`;
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
    remote isolated function byProjectKeyProductProjectionsGet(string projectKey, boolean? staged = (), string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ProductProjectionPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/product-projections`;
        map<anydata> queryParam = {"staged": staged, "priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductProjectionPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Search Product Projection
    #
    # + return - 200 
    remote isolated function byProjectKeyProductProjectionsSearchGet(string projectKey, boolean? fuzzy = (), float? fuzzyLevel = (), boolean? markMatchingVariants = (), boolean? staged = (), string[]? filter = (), string[]? filterFacets = (), string[]? filterQuery = (), string[]? facet = (), string[]? textAZ2AZ2 = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = ()) returns ProductProjectionPagedSearchResponse|error {
        string resourcePath = string `/${projectKey}/product-projections/search`;
        map<anydata> queryParam = {"fuzzy": fuzzy, "fuzzyLevel": fuzzyLevel, "markMatchingVariants": markMatchingVariants, "staged": staged, "filter": filter, "filter.facets": filterFacets, "filter.query": filterQuery, "facet": facet, "/text.[a-z]{2}(-[A-Z]{2})?/": textAZ2AZ2, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "expand": expand};
        map<Encoding> queryParamEncoding = {"filter": {style: FORM, explode: true}, "filter.facets": {style: FORM, explode: true}, "filter.query": {style: FORM, explode: true}, "facet": {style: FORM, explode: true}, "/text.[a-z]{2}(-[A-Z]{2})?/": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductProjectionPagedSearchResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Search Product Projection
    #
    # + return - 200 
    remote isolated function byProjectKeyProductProjectionsSearchPost(string projectKey, URLEncodedPayload payload) returns ProductProjectionPagedSearchResponse|error {
        string resourcePath = string `/${projectKey}/product-projections/search`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        ProductProjectionPagedSearchResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductProjectionsSuggestGet(string projectKey, boolean? fuzzy = (), boolean? staged = (), string[]? searchkeywordsAZ2AZ2 = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = ()) returns json|error {
        string resourcePath = string `/${projectKey}/product-projections/suggest`;
        map<anydata> queryParam = {"fuzzy": fuzzy, "staged": staged, "/searchKeywords.[a-z]{2}(-[A-Z]{2})?/": searchkeywordsAZ2AZ2, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal};
        map<Encoding> queryParamEncoding = {"/searchKeywords.[a-z]{2}(-[A-Z]{2})?/": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInventoryByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns InventoryEntry|error {
        string resourcePath = string `/${projectKey}/inventory/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InventoryEntry response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInventoryByIDPost(string projectKey, string iD, InventoryEntryUpdate payload, Expansion[]? expand = ()) returns InventoryEntry|error {
        string resourcePath = string `/${projectKey}/inventory/${iD}`;
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
    remote isolated function byProjectKeyInventoryByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns InventoryEntry|error {
        string resourcePath = string `/${projectKey}/inventory/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InventoryEntry response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInventoryGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns InventoryPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/inventory`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InventoryPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyInventoryPost(string projectKey, InventoryEntryDraft payload, Expansion[]? expand = ()) returns InventoryEntry|error {
        string resourcePath = string `/${projectKey}/inventory`;
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
    remote isolated function byProjectKeyReviewsByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns Review|error {
        string resourcePath = string `/${projectKey}/reviews/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Review response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyReviewsByIDPost(string projectKey, string iD, ReviewUpdate payload, Expansion[]? expand = ()) returns Review|error {
        string resourcePath = string `/${projectKey}/reviews/${iD}`;
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
    remote isolated function byProjectKeyReviewsByIDDelete(string projectKey, string iD, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Review|error {
        string resourcePath = string `/${projectKey}/reviews/${iD}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Review response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyReviewsKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns Review|error {
        string resourcePath = string `/${projectKey}/reviews/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Review response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyReviewsKeyByKeyPost(string projectKey, string 'key, ReviewUpdate payload, Expansion[]? expand = ()) returns Review|error {
        string resourcePath = string `/${projectKey}/reviews/key=${'key}`;
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
    remote isolated function byProjectKeyReviewsKeyByKeyDelete(string projectKey, string 'key, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Review|error {
        string resourcePath = string `/${projectKey}/reviews/key=${'key}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Review response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyReviewsGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ReviewPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/reviews`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ReviewPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyReviewsPost(string projectKey, ReviewDraft payload, Expansion[]? expand = ()) returns Review|error {
        string resourcePath = string `/${projectKey}/reviews`;
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
