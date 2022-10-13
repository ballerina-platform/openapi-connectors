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
# The commercetools Platform HTTP API(Pricing & Discounts) offers an interface for programmatic access to information on tax catergories, product discount and discount code.
@display {label: "Commercetools Pricing & Discounts", iconPath: "icon.png"}
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
    remote isolated function getTaxCategoriesByID(string projectKey, string id, Expansion[]? expand = ()) returns TaxCategory|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/tax-categories/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TaxCategory response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateTaxCategoriesByID(string projectKey, string id, TaxCategoryUpdate payload, Expansion[]? expand = ()) returns TaxCategory|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/tax-categories/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TaxCategory response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteTaxCategoriesByID(string projectKey, string id, decimal 'version, Expansion[]? expand = ()) returns TaxCategory|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/tax-categories/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TaxCategory response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getTaxCategoryByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns TaxCategory|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/tax-categories/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TaxCategory response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateTaxCategoryByKey(string projectKey, string 'key, TaxCategoryUpdate payload, Expansion[]? expand = ()) returns TaxCategory|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/tax-categories/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TaxCategory response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteTaxCategoryByKey(string projectKey, string 'key, decimal 'version, Expansion[]? expand = ()) returns TaxCategory|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/tax-categories/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TaxCategory response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryTaxCategory(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns TaxCategoryPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/tax-categories`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TaxCategoryPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createTaxCategory(string projectKey, TaxCategoryDraft payload, Expansion[]? expand = ()) returns TaxCategory|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/tax-categories`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TaxCategory response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryProductDiscount(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ProductDiscountPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-discounts`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductDiscountPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createProductDiscounts(string projectKey, ProductDiscountDraft payload, Expansion[]? expand = ()) returns ProductDiscount|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-discounts`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductDiscount response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getProductDiscountbyKey(string projectKey, string 'key, Expansion[]? expand = ()) returns ProductDiscount|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-discounts/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductDiscount response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateProductDiscountByKey(string projectKey, string 'key, ProductDiscountUpdate payload, Expansion[]? expand = ()) returns ProductDiscount|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-discounts/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductDiscount response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteProductDiscountByKey(string projectKey, string 'key, decimal 'version, Expansion[]? expand = ()) returns ProductDiscount|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-discounts/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductDiscount response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getMatchingProductDiscount(string projectKey, ProductDiscountMatchQuery payload) returns ProductDiscount|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-discounts/matching`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductDiscount response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getProductDiscountByID(string projectKey, string id, Expansion[]? expand = ()) returns ProductDiscount|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-discounts/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductDiscount response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateProductDiscountByID(string projectKey, string id, ProductDiscountUpdate payload, Expansion[]? expand = ()) returns ProductDiscount|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-discounts/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductDiscount response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteProductDiscountByID(string projectKey, string id, decimal 'version, Expansion[]? expand = ()) returns ProductDiscount|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/product-discounts/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductDiscount response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryCartDiscounts(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CartDiscountPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/cart-discounts`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CartDiscountPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createCartDiscount(string projectKey, CartDiscountDraft payload, Expansion[]? expand = ()) returns CartDiscount|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/cart-discounts`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CartDiscount response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getCartDiscountByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns CartDiscount|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/cart-discounts/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CartDiscount response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateCartDiscountByKey(string projectKey, string 'key, CartDiscountUpdate payload, Expansion[]? expand = ()) returns CartDiscount|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/cart-discounts/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CartDiscount response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteCartDiscountByKey(string projectKey, string 'key, decimal 'version, Expansion[]? expand = ()) returns CartDiscount|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/cart-discounts/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CartDiscount response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getCartDiscountByID(string projectKey, string id, Expansion[]? expand = ()) returns CartDiscount|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/cart-discounts/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CartDiscount response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateCartDiscountByID(string projectKey, string id, CartDiscountUpdate payload, Expansion[]? expand = ()) returns CartDiscount|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/cart-discounts/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CartDiscount response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteCartDiscountByID(string projectKey, string id, decimal 'version, Expansion[]? expand = ()) returns CartDiscount|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/cart-discounts/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CartDiscount response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getDiscountCodeByID(string projectKey, string id, Expansion[]? expand = ()) returns DiscountCode|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/discount-codes/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DiscountCode response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateDiscountCodeByID(string projectKey, string id, DiscountCodeUpdate payload, Expansion[]? expand = ()) returns DiscountCode|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/discount-codes/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DiscountCode response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteDiscountCodeByID(string projectKey, string id, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns DiscountCode|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/discount-codes/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DiscountCode response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryDiscountCodes(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns DiscountCodePagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/discount-codes`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DiscountCodePagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createDiscountCode(string projectKey, DiscountCodeDraft payload, Expansion[]? expand = ()) returns DiscountCode|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/discount-codes`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DiscountCode response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
