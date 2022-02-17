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
# The commercetools Platform HTTP API offers an interface for programmatic access to the data stored on the platform and associated functionality.
@display {label: "Commercetools", iconPath: "icon.png"}
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
    # The Endpoint is responding a limited set of information about settings and configuration of the project.
    #
    # + return - 200 
    remote isolated function byProjectKeyGet(string projectKey) returns Project|error {
        string resourcePath = string `/${projectKey}`;
        Project response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update project
    #
    # + return - 200 
    remote isolated function byProjectKeyPost(string projectKey, ProjectUpdate payload) returns Project|error {
        string resourcePath = string `/${projectKey}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Project response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyApiClientsGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ApiClientPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/api-clients`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ApiClientPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyApiClientsPost(string projectKey, ApiClientDraft payload, Expansion[]? expand = ()) returns ApiClient|error {
        string resourcePath = string `/${projectKey}/api-clients`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiClient response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyApiClientsByIDGet(string projectKey, string iD) returns ApiClient|error {
        string resourcePath = string `/${projectKey}/api-clients/${iD}`;
        ApiClient response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyApiClientsByIDDelete(string projectKey, string iD) returns ApiClient|error {
        string resourcePath = string `/${projectKey}/api-clients/${iD}`;
        ApiClient response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCartDiscountsGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CartDiscountPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/cart-discounts`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CartDiscountPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyCartDiscountsPost(string projectKey, CartDiscountDraft payload, Expansion[]? expand = ()) returns CartDiscount|error {
        string resourcePath = string `/${projectKey}/cart-discounts`;
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
    remote isolated function byProjectKeyCartDiscountsKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns CartDiscount|error {
        string resourcePath = string `/${projectKey}/cart-discounts/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CartDiscount response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCartDiscountsKeyByKeyPost(string projectKey, string 'key, CartDiscountUpdate payload, Expansion[]? expand = ()) returns CartDiscount|error {
        string resourcePath = string `/${projectKey}/cart-discounts/key=${'key}`;
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
    remote isolated function byProjectKeyCartDiscountsKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns CartDiscount|error {
        string resourcePath = string `/${projectKey}/cart-discounts/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CartDiscount response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCartDiscountsByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns CartDiscount|error {
        string resourcePath = string `/${projectKey}/cart-discounts/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CartDiscount response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCartDiscountsByIDPost(string projectKey, string iD, CartDiscountUpdate payload, Expansion[]? expand = ()) returns CartDiscount|error {
        string resourcePath = string `/${projectKey}/cart-discounts/${iD}`;
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
    remote isolated function byProjectKeyCartDiscountsByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns CartDiscount|error {
        string resourcePath = string `/${projectKey}/cart-discounts/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CartDiscount response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCartsGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CartPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/carts`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CartPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creating a cart can fail with an InvalidOperation if the referenced shipping method in the
    # CartDraft has a predicate which does not match the cart.
    #
    # + return - 201 
    remote isolated function byProjectKeyCartsPost(string projectKey, CartDraft payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/carts`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Cart response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves the active cart of the customer that has been modified most recently.
    # It does not consider carts with CartOrigin Merchant. If no active cart exists, a 404 Not Found error is returned.
    # 
    # The cart may not contain up-to-date prices, discounts etc. If you want to ensure they're up-to-date,
    # send an Update request with the Recalculate update action instead.
    #
    # + return - 200 
    remote isolated function byProjectKeyCartsCustomerIdByCustomerIdGet(string projectKey, string customerId, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/carts/customer-id=${customerId}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    # The cart may not contain up-to-date prices, discounts etc.
    # If you want to ensure they're up-to-date, send an Update request with the Recalculate update action instead.
    #
    # + return - 200 
    remote isolated function byProjectKeyCartsKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/carts/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCartsKeyByKeyPost(string projectKey, string 'key, CartUpdate payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/carts/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Cart response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCartsKeyByKeyDelete(string projectKey, string 'key, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/carts/key=${'key}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyCartsReplicatePost(string projectKey, ReplicaCartDraft payload) returns Cart|error {
        string resourcePath = string `/${projectKey}/carts/replicate`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Cart response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # The cart may not contain up-to-date prices, discounts etc.
    # If you want to ensure they're up-to-date, send an Update request with the Recalculate update action instead.
    #
    # + return - 200 
    remote isolated function byProjectKeyCartsByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/carts/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCartsByIDPost(string projectKey, string iD, CartUpdate payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/carts/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Cart response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCartsByIDDelete(string projectKey, string iD, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/carts/${iD}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->delete(resourcePath);
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
    #
    # + return - 200 
    remote isolated function byProjectKeyCategoriesByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns Category|error {
        string resourcePath = string `/${projectKey}/categories/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Category response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCategoriesByIDPost(string projectKey, string iD, CategoryUpdate payload, Expansion[]? expand = ()) returns Category|error {
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
    remote isolated function byProjectKeyChannelsGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ChannelPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/channels`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ChannelPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyChannelsPost(string projectKey, ChannelDraft payload, Expansion[]? expand = ()) returns Channel|error {
        string resourcePath = string `/${projectKey}/channels`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Channel response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyChannelsByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns Channel|error {
        string resourcePath = string `/${projectKey}/channels/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Channel response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyChannelsByIDPost(string projectKey, string iD, ChannelUpdate payload, Expansion[]? expand = ()) returns Channel|error {
        string resourcePath = string `/${projectKey}/channels/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Channel response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyChannelsByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns Channel|error {
        string resourcePath = string `/${projectKey}/channels/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Channel response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # The query endpoint allows to retrieve custom objects in a specific container or all custom objects.
    # For performance reasons, it is highly advisable to query only for custom objects in a container by using
    # the container field in the where predicate.
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomObjectsGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CustomObjectPagedQueryResponse|error {
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
    remote isolated function byProjectKeyCustomObjectsPost(string projectKey, CustomObjectDraft payload, Expansion[]? expand = ()) returns CustomObject|error {
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
    remote isolated function byProjectKeyCustomObjectsByContainerGet(string projectKey, string container, QueryPredicate[]? 'where = (), string[]? varAZaZ09 = (), Expansion[]? expand = ()) returns CustomObjectPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/custom-objects/${container}`;
        map<anydata> queryParam = {"where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09, "expand": expand};
        map<Encoding> queryParamEncoding = {"where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}, "expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomObjectPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get CustomObject by container and key
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomObjectsByContainerByKeyGet(string projectKey, string container, string 'key, Expansion[]? expand = ()) returns CustomObject|error {
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
    remote isolated function byProjectKeyCustomObjectsByContainerByKeyDelete(string projectKey, string container, string 'key, float? 'version = (), boolean? dataErasure = (), Expansion[]? expand = ()) returns CustomObject|error {
        string resourcePath = string `/${projectKey}/custom-objects/${container}/${'key}`;
        map<anydata> queryParam = {"version": 'version, "dataErasure": dataErasure, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomObject response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomerGroupsGet(string projectKey, QueryPredicate[]? 'where = (), Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), string[]? varAZaZ09 = ()) returns CustomerGroupPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/customer-groups`;
        map<anydata> queryParam = {"where": 'where, "expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"where": {style: FORM, explode: true}, "expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerGroupPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyCustomerGroupsPost(string projectKey, CustomerGroupDraft payload, Expansion[]? expand = ()) returns CustomerGroup|error {
        string resourcePath = string `/${projectKey}/customer-groups`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerGroup response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomerGroupsKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns CustomerGroup|error {
        string resourcePath = string `/${projectKey}/customer-groups/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerGroup response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomerGroupsKeyByKeyPost(string projectKey, string 'key, CustomerGroupUpdate payload, Expansion[]? expand = ()) returns CustomerGroup|error {
        string resourcePath = string `/${projectKey}/customer-groups/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerGroup response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomerGroupsKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns CustomerGroup|error {
        string resourcePath = string `/${projectKey}/customer-groups/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerGroup response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomerGroupsByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns CustomerGroup|error {
        string resourcePath = string `/${projectKey}/customer-groups/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerGroup response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomerGroupsByIDPost(string projectKey, string iD, CustomerGroupUpdate payload, Expansion[]? expand = ()) returns CustomerGroup|error {
        string resourcePath = string `/${projectKey}/customer-groups/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerGroup response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomerGroupsByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns CustomerGroup|error {
        string resourcePath = string `/${projectKey}/customer-groups/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerGroup response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomersGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CustomerPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/customers`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a customer. If an anonymous cart is passed in,
    # then the cart is assigned to the created customer and the version number of the Cart will increase.
    # If the ID of an anonymous session is given, all carts and orders will be assigned to the created customer.
    #
    # + return - 201 
    remote isolated function byProjectKeyCustomersPost(string projectKey, CustomerDraft payload, Expansion[]? expand = ()) returns CustomerSignInResult|error {
        string resourcePath = string `/${projectKey}/customers`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerSignInResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a Token for verifying the Customer's Email
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomersEmailTokenPost(string projectKey, CustomerCreateEmailToken payload) returns CustomerToken|error {
        string resourcePath = string `/${projectKey}/customers/email-token`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerToken response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomersEmailTokenByEmailTokenGet(string projectKey, string emailToken, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${projectKey}/customers/email-token=${emailToken}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Verifies customer's email using a token.
    #
    # + return - The email was verified. 
    remote isolated function byProjectKeyCustomersEmailConfirmPost(string projectKey, CustomerEmailVerify payload) returns Customer|error {
        string resourcePath = string `/${projectKey}/customers/email/confirm`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomersKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${projectKey}/customers/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomersKeyByKeyPost(string projectKey, string 'key, CustomerUpdate payload, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${projectKey}/customers/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomersKeyByKeyDelete(string projectKey, string 'key, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${projectKey}/customers/key=${'key}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Change a customers password
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomersPasswordPost(string projectKey, CustomerChangePassword payload) returns Customer|error {
        string resourcePath = string `/${projectKey}/customers/password`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # The token value is used to reset the password of the customer with the given email. The token is
    # valid only for 10 minutes.
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomersPasswordTokenPost(string projectKey, CustomerCreatePasswordResetToken payload) returns CustomerToken|error {
        string resourcePath = string `/${projectKey}/customers/password-token`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerToken response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomersPasswordTokenByPasswordTokenGet(string projectKey, string passwordToken, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${projectKey}/customers/password-token=${passwordToken}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set a new password using a token.
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomersPasswordResetPost(string projectKey, CustomerResetPassword payload) returns Customer|error {
        string resourcePath = string `/${projectKey}/customers/password/reset`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomersByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${projectKey}/customers/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomersByIDPost(string projectKey, string iD, CustomerUpdate payload, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${projectKey}/customers/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyCustomersByIDDelete(string projectKey, string iD, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${projectKey}/customers/${iD}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyDiscountCodesGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns DiscountCodePagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/discount-codes`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DiscountCodePagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyDiscountCodesPost(string projectKey, DiscountCodeDraft payload, Expansion[]? expand = ()) returns DiscountCode|error {
        string resourcePath = string `/${projectKey}/discount-codes`;
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
    remote isolated function byProjectKeyDiscountCodesByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns DiscountCode|error {
        string resourcePath = string `/${projectKey}/discount-codes/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DiscountCode response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyDiscountCodesByIDPost(string projectKey, string iD, DiscountCodeUpdate payload, Expansion[]? expand = ()) returns DiscountCode|error {
        string resourcePath = string `/${projectKey}/discount-codes/${iD}`;
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
    remote isolated function byProjectKeyDiscountCodesByIDDelete(string projectKey, string iD, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns DiscountCode|error {
        string resourcePath = string `/${projectKey}/discount-codes/${iD}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DiscountCode response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyExtensionsGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ExtensionPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/extensions`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ExtensionPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Currently, a maximum of 25 extensions can be created per project.
    #
    # + return - 201 
    remote isolated function byProjectKeyExtensionsPost(string projectKey, ExtensionDraft payload, Expansion[]? expand = ()) returns Extension|error {
        string resourcePath = string `/${projectKey}/extensions`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Extension response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves the representation of an extension by its key.
    #
    # + return - 200 
    remote isolated function byProjectKeyExtensionsKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns Extension|error {
        string resourcePath = string `/${projectKey}/extensions/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Extension response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyExtensionsKeyByKeyPost(string projectKey, string 'key, ExtensionUpdate payload, Expansion[]? expand = ()) returns Extension|error {
        string resourcePath = string `/${projectKey}/extensions/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Extension response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyExtensionsKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns Extension|error {
        string resourcePath = string `/${projectKey}/extensions/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Extension response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Retrieves the representation of an extension by its id.
    #
    # + return - 200 
    remote isolated function byProjectKeyExtensionsByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns Extension|error {
        string resourcePath = string `/${projectKey}/extensions/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Extension response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyExtensionsByIDPost(string projectKey, string iD, ExtensionUpdate payload, Expansion[]? expand = ()) returns Extension|error {
        string resourcePath = string `/${projectKey}/extensions/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Extension response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyExtensionsByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns Extension|error {
        string resourcePath = string `/${projectKey}/extensions/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Extension response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Queries carts in a specific Store.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCartsGet(string projectKey, string storeKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CartPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/carts`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CartPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a cart in the store specified by {storeKey}.
    # When using this endpoint the cart's store field is always set to the store specified in the path parameter.
    # Creating a cart can fail with an InvalidOperation if the referenced shipping method
    # in the CartDraft has a predicate which does not match the cart.
    #
    # + return - 201 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCartsPost(string projectKey, string storeKey, CartDraft payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/carts`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Cart response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves the active cart of the customer that has been modified most recently in a specific Store.
    # 
    # If the cart exists in the commercetools project but does not have the store field, or the store field
    # references a different store, this method returns a ResourceNotFound error.
    # 
    # The cart may not contain up-to-date prices, discounts etc. If you want to ensure they're up-to-date,
    # send an Update request with the Recalculate update action instead.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCartsCustomerIdByCustomerIdGet(string projectKey, string storeKey, string customerId, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/carts/customer-id=${customerId}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a cart by its key from a specific Store.
    # If the cart exists in the commercetools project but does not have the store field,
    # or the store field references a different store, this method returns a ResourceNotFound error.
    # The cart may not contain up-to-date prices, discounts etc.
    # If you want to ensure they're up-to-date, send an Update request with the Recalculate update action instead.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCartsKeyByKeyGet(string projectKey, string storeKey, string 'key, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/carts/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a cart in the store specified by {storeKey}.
    # If the cart exists in the commercetools project but does not have the store field,
    # or the store field references a different store, this method returns a ResourceNotFound error.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCartsKeyByKeyPost(string projectKey, string storeKey, string 'key, CartUpdate payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/carts/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Cart response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCartsKeyByKeyDelete(string projectKey, string storeKey, string 'key, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/carts/key=${'key}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCartsReplicatePost(string projectKey, string storeKey, ReplicaCartDraft payload) returns Cart|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/carts/replicate`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Cart response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a cart by its ID from a specific Store.
    # If the cart exists in the commercetools project but does not have the store field,
    # or the store field references a different store, this method returns a ResourceNotFound error.
    # The cart may not contain up-to-date prices, discounts etc.
    # If you want to ensure they're up-to-date, send an Update request with the Recalculate update action instead.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCartsByIDGet(string projectKey, string storeKey, string iD, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/carts/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a cart in the store specified by {storeKey}.
    # If the cart exists in the commercetools project but does not have the store field,
    # or the store field references a different store, this method returns a ResourceNotFound error.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCartsByIDPost(string projectKey, string storeKey, string iD, CartUpdate payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/carts/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Cart response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCartsByIDDelete(string projectKey, string storeKey, string iD, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/carts/${iD}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCustomersGet(string projectKey, string storeKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CustomerPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/customers`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a customer in a specific Store.
    # When using this endpoint, if omitted,
    # the customer's stores field is set to the store specified in the path parameter.
    # If an anonymous cart is passed in as when using this method,
    # then the cart is assigned to the created customer and the version number of the Cart increases.
    # If the ID of an anonymous session is given, all carts and orders will be assigned to the created customer and
    # the store specified. If you pass in a cart with a store field specified,
    # the store field must reference the same store specified in the {storeKey} path parameter.
    #
    # + return - 201 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCustomersPost(string projectKey, string storeKey, CustomerDraft payload, Expansion[]? expand = ()) returns CustomerSignInResult|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/customers`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerSignInResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a Token for verifying the Customer's Email in store
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCustomersEmailTokenPost(string projectKey, string storeKey, CustomerCreateEmailToken payload) returns CustomerToken|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/customers/email-token`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerToken response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCustomersEmailTokenByEmailTokenGet(string projectKey, string storeKey, string emailToken, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/customers/email-token=${emailToken}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Verifies customer's email using a token.
    #
    # + return - The email was verified. 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCustomersEmailConfirmPost(string projectKey, string storeKey, CustomerEmailVerify payload) returns Customer|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/customers/email/confirm`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a customer by its Key from a specific Store.
    # It also considers customers that do not have the stores field.
    # If the customer exists in the commercetools project but the stores field references different stores,
    # this method returns a ResourceNotFound error.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCustomersKeyByKeyGet(string projectKey, string storeKey, string 'key, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/customers/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # If the customer exists in the commercetools project but the stores field references a different store,
    # this method returns a ResourceNotFound error.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCustomersKeyByKeyPost(string projectKey, string storeKey, string 'key, CustomerUpdate payload, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/customers/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCustomersKeyByKeyDelete(string projectKey, string storeKey, string 'key, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/customers/key=${'key}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Change a customers password
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCustomersPasswordPost(string projectKey, string storeKey, CustomerChangePassword payload) returns Customer|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/customers/password`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # The token value is used to reset the password of the customer with the given email. The token is
    # valid only for 10 minutes.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCustomersPasswordTokenPost(string projectKey, string storeKey, CustomerCreatePasswordResetToken payload) returns CustomerToken|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/customers/password-token`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerToken response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCustomersPasswordTokenByPasswordTokenGet(string projectKey, string storeKey, string passwordToken, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/customers/password-token=${passwordToken}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set a new password using a token.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCustomersPasswordResetPost(string projectKey, string storeKey, CustomerResetPassword payload) returns Customer|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/customers/password/reset`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a customer by its ID from a specific Store.
    # It also considers customers that do not have the stores field.
    # If the customer exists in the commercetools project but the stores field references different stores,
    # this method returns a ResourceNotFound error.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCustomersByIDGet(string projectKey, string storeKey, string iD, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/customers/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a customer in the store specified by {storeKey}.
    # If the customer exists in the commercetools project but the stores field references a different store,
    # this method returns a ResourceNotFound error.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCustomersByIDPost(string projectKey, string storeKey, string iD, CustomerUpdate payload, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/customers/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyCustomersByIDDelete(string projectKey, string storeKey, string iD, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/customers/${iD}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Authenticate Customer (Sign In) in store
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyLoginPost(string projectKey, string storeKey, CustomerSignin payload) returns CustomerSignInResult|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/login`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerSignInResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyMeActiveCartGet(string projectKey, string storeKey) returns Cart|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/me/active-cart`;
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyMeCartsGet(string projectKey, string storeKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CartPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/me/carts`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CartPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyMeCartsPost(string projectKey, string storeKey, MyCartDraft payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/me/carts`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Cart response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyMeCartsByIDGet(string projectKey, string storeKey, string iD, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/me/carts/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyMeCartsByIDPost(string projectKey, string storeKey, string iD, MyCartUpdate payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/me/carts/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Cart response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyMeCartsByIDDelete(string projectKey, string storeKey, string iD, float 'version, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/me/carts/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyMeOrdersGet(string projectKey, string storeKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns OrderPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/me/orders`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OrderPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyMeOrdersPost(string projectKey, string storeKey, MyOrderFromCartDraft payload, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/me/orders`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Order response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyMeOrdersByIDGet(string projectKey, string storeKey, string iD, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/me/orders/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyMeShoppingListsGet(string projectKey, string storeKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ShoppingListPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/me/shopping-lists`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingListPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyMeShoppingListsPost(string projectKey, string storeKey, MyShoppingListDraft payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/me/shopping-lists`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShoppingList response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a shopping list by Key.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyMeShoppingListsKeyByKeyGet(string projectKey, string storeKey, string 'key, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/me/shopping-lists/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a shopping list found by its Key.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyMeShoppingListsKeyByKeyPost(string projectKey, string storeKey, string 'key, MyShoppingListUpdate payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/me/shopping-lists/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShoppingList response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyMeShoppingListsKeyByKeyDelete(string projectKey, string storeKey, string 'key, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/me/shopping-lists/key=${'key}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Gets a shopping list by ID.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyMeShoppingListsByIDGet(string projectKey, string storeKey, string iD, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/me/shopping-lists/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyMeShoppingListsByIDPost(string projectKey, string storeKey, string iD, MyShoppingListUpdate payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/me/shopping-lists/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShoppingList response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyMeShoppingListsByIDDelete(string projectKey, string storeKey, string iD, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/me/shopping-lists/${iD}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Queries orders in a specific Store.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyOrdersGet(string projectKey, string storeKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns OrderPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/orders`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OrderPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an order from a Cart from a specific Store.
    # When using this endpoint the orders's store field is always set to the store specified in the path parameter.
    # The cart must have a shipping address set before creating an order. When using the Platform TaxMode,
    # the shipping address is used for tax calculation.
    #
    # + return - 201 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyOrdersPost(string projectKey, string storeKey, OrderFromCartDraft payload, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/orders`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Order response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns an order by its order number from a specific Store.
    # 
    # If the order exists in the commercetools project but does not have the store field,
    # or the store field references a different store, this method returns a ResourceNotFound error.
    # In case the orderNumber does not match the regular expression [a-zA-Z0-9_-]+,
    # it should be provided in URL-encoded format.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyOrdersOrderNumberByOrderNumberGet(string projectKey, string storeKey, string orderNumber, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/orders/order-number=${orderNumber}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an order in the store specified by {storeKey}.
    # If the order exists in the commercetools project but does not have the store field,
    # or the store field references a different store, this method returns a ResourceNotFound error.
    # In case the orderNumber does not match the regular expression [a-zA-Z0-9_-]+,
    # it should be provided in URL-encoded format.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyOrdersOrderNumberByOrderNumberPost(string projectKey, string storeKey, string orderNumber, OrderUpdate payload, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/orders/order-number=${orderNumber}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Order response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyOrdersOrderNumberByOrderNumberDelete(string projectKey, string storeKey, string orderNumber, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/orders/order-number=${orderNumber}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Returns an order by its ID from a specific Store.
    # If the order exists in the commercetools project but does not have the store field,
    # or the store field references a different store, this method returns a ResourceNotFound error.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyOrdersByIDGet(string projectKey, string storeKey, string iD, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/orders/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an order in the store specified by {storeKey}.
    # If the order exists in the commercetools project but does not have the store field,
    # or the store field references a different store, this method returns a ResourceNotFound error.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyOrdersByIDPost(string projectKey, string storeKey, string iD, OrderUpdate payload, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/orders/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Order response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyOrdersByIDDelete(string projectKey, string storeKey, string iD, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/orders/${iD}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # You can use the product projections query endpoint to get the current or staged representations of Products.
    # When used with an API client that has the view_published_products:{projectKey} scope,
    # this endpoint only returns published (current) product projections.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyProductProjectionsGet(string projectKey, string storeKey, boolean? staged = (), string? priceCurrency = (), string? priceCountry = (), string? priceCustomerGroup = (), string? priceChannel = (), string? localeProjection = (), string? storeProjection = (), Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ProductProjectionPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/product-projections`;
        map<anydata> queryParam = {"staged": staged, "priceCurrency": priceCurrency, "priceCountry": priceCountry, "priceCustomerGroup": priceCustomerGroup, "priceChannel": priceChannel, "localeProjection": localeProjection, "storeProjection": storeProjection, "expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductProjectionPagedQueryResponse response = check self.clientEp->get(resourcePath);
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
    # Queries Product Selection assignments in a specific Store.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyProductSelectionAssignmentsGet(string projectKey, string storeKey) returns ProductsInStorePagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/product-selection-assignments`;
        ProductsInStorePagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyShippingMethodsMatchingCartGet(string projectKey, string storeKey, string cartId, Expansion[]? expand = ()) returns ShippingMethodPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/shipping-methods/matching-cart`;
        map<anydata> queryParam = {"cartId": cartId, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingMethodPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyShoppingListsGet(string projectKey, string storeKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ShoppingListPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/shopping-lists`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingListPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyShoppingListsPost(string projectKey, string storeKey, ShoppingListDraft payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/shopping-lists`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShoppingList response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a shopping list by Key.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyShoppingListsKeyByKeyGet(string projectKey, string storeKey, string 'key, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/shopping-lists/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a shopping list found by its Key.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyShoppingListsKeyByKeyPost(string projectKey, string storeKey, string 'key, ShoppingListUpdate payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/shopping-lists/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShoppingList response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyShoppingListsKeyByKeyDelete(string projectKey, string storeKey, string 'key, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/shopping-lists/key=${'key}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Gets a shopping list by ID.
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyShoppingListsByIDGet(string projectKey, string storeKey, string iD, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/shopping-lists/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyShoppingListsByIDPost(string projectKey, string storeKey, string iD, ShoppingListUpdate payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/shopping-lists/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShoppingList response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyInStoreKeyByStoreKeyShoppingListsByIDDelete(string projectKey, string storeKey, string iD, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/in-store/key=${storeKey}/shopping-lists/${iD}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->delete(resourcePath);
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
    # Authenticate Customer (Sign In). Retrieves the authenticated
    # customer (a customer that matches the given email/password pair).
    # If used with an access token for Anonymous Sessions,
    # all orders and carts belonging to the anonymousId will be assigned to the newly created customer.
    # If a cart is is returned as part of the CustomerSignInResult,
    # it has been recalculated (It will have up-to-date prices, taxes and discounts,
    # and invalid line items have been removed.).
    #
    # + return - 200 
    remote isolated function byProjectKeyLoginPost(string projectKey, CustomerSignin payload) returns CustomerSignInResult|error {
        string resourcePath = string `/${projectKey}/login`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerSignInResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeGet(string projectKey, Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), Expansion[]? expand = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns Customer|error {
        string resourcePath = string `/${projectKey}/me`;
        map<anydata> queryParam = {"sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "expand": expand, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"sort": {style: FORM, explode: true}, "expand": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update my customer
    #
    # + return - 200 
    remote isolated function byProjectKeyMePost(string projectKey, MyCustomerUpdate payload) returns Customer|error {
        string resourcePath = string `/${projectKey}/me`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete my Customer
    #
    # + return - 200 
    remote isolated function byProjectKeyMeDelete(string projectKey, float 'version) returns Customer|error {
        string resourcePath = string `/${projectKey}/me`;
        map<anydata> queryParam = {"version": 'version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Customer response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeActiveCartGet(string projectKey) returns Cart|error {
        string resourcePath = string `/${projectKey}/me/active-cart`;
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeCartsGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CartPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/me/carts`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CartPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyMeCartsPost(string projectKey, MyCartDraft payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/me/carts`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Cart response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeCartsKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/me/carts/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeCartsKeyByKeyPost(string projectKey, string 'key, MyCartUpdate payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/me/carts/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Cart response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeCartsKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/me/carts/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeCartsByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/me/carts/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeCartsByIDPost(string projectKey, string iD, MyCartUpdate payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/me/carts/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Cart response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeCartsByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${projectKey}/me/carts/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - ## Bad Request A 400 is the most commonly expected error response and indicates that a request failed due to providing bad input. Bad input can be a malformed request body, missing required parameters, wrongly typed or malformed parameters or a parameter that references another resource that does not exist. Clients need to resolve the problems mentioned in the response before re-sending the request. The following general error codes can appear in responses with the HTTP status code `400`: * `InvalidInput`   Invalid input has been sent to the service.   The client application should validate the input according to the constraints described in the error message   before sending the request. * `InvalidOperation`   The resource(s) involved in the request are not in a valid state for the operation. The client application   should validate the constraints described in the error message before sending the request. * `InvalidField`   A field has an invalid value.   Extra fields:   * `field` - String     The name of the field.   * `invalidValue` - *     The invalid value.   * `allowedValues` - Array of * - Optional     A fixed set of allowed values for the field, if any. * `RequiredField`   A required field is missing a value.   Extra fields:   * `field` - String     The name of the field. * `DuplicateField`   A value for a field conflicts with an existing duplicate value.   Extra fields:   * `field` - String     The name of the field.   * `duplicateValue` - *     The offending duplicate value. 
    remote isolated function byProjectKeyMeEmailConfirmPost(string projectKey) returns http:Response|error {
        string resourcePath = string `/${projectKey}/me/email/confirm`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeLoginPost(string projectKey, CustomerSignin payload) returns CustomerSignInResult|error {
        string resourcePath = string `/${projectKey}/me/login`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerSignInResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeOrdersGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns OrderPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/me/orders`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OrderPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyMeOrdersPost(string projectKey, MyOrderFromCartDraft payload, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/me/orders`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Order response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeOrdersByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/me/orders/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMePasswordPost(string projectKey, MyCustomerChangePassword payload) returns Customer|error {
        string resourcePath = string `/${projectKey}/me/password`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMePasswordResetPost(string projectKey) returns Customer|error {
        string resourcePath = string `/${projectKey}/me/password/reset`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Customer response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMePaymentsGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns MyPaymentPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/me/payments`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MyPaymentPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyMePaymentsPost(string projectKey, MyPaymentDraft payload, Expansion[]? expand = ()) returns MyPayment|error {
        string resourcePath = string `/${projectKey}/me/payments`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MyPayment response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMePaymentsKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns MyPayment|error {
        string resourcePath = string `/${projectKey}/me/payments/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MyPayment response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMePaymentsKeyByKeyPost(string projectKey, string 'key, MyPaymentUpdate payload, Expansion[]? expand = ()) returns MyPayment|error {
        string resourcePath = string `/${projectKey}/me/payments/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MyPayment response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMePaymentsKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns MyPayment|error {
        string resourcePath = string `/${projectKey}/me/payments/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MyPayment response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMePaymentsByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns MyPayment|error {
        string resourcePath = string `/${projectKey}/me/payments/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MyPayment response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMePaymentsByIDPost(string projectKey, string iD, MyPaymentUpdate payload, Expansion[]? expand = ()) returns MyPayment|error {
        string resourcePath = string `/${projectKey}/me/payments/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MyPayment response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMePaymentsByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns MyPayment|error {
        string resourcePath = string `/${projectKey}/me/payments/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MyPayment response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeShoppingListsGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ShoppingListPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/me/shopping-lists`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingListPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyMeShoppingListsPost(string projectKey, MyShoppingListDraft payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/me/shopping-lists`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShoppingList response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeShoppingListsKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/me/shopping-lists/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeShoppingListsKeyByKeyPost(string projectKey, string 'key, MyShoppingListUpdate payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/me/shopping-lists/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShoppingList response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeShoppingListsKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/me/shopping-lists/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeShoppingListsByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/me/shopping-lists/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeShoppingListsByIDPost(string projectKey, string iD, MyShoppingListUpdate payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/me/shopping-lists/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShoppingList response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMeShoppingListsByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/me/shopping-lists/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyMeSignupPost(string projectKey, MyCustomerDraft payload) returns CustomerSignInResult|error {
        string resourcePath = string `/${projectKey}/me/signup`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerSignInResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMessagesGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns MessagePagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/messages`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MessagePagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyMessagesByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns Message|error {
        string resourcePath = string `/${projectKey}/messages/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Message response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyOrdersGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns OrderPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/orders`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OrderPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an order from a Cart.
    # The cart must have a shipping address set before creating an order.
    # When using the Platform TaxMode, the shipping address is used for tax calculation.
    #
    # + return - 201 
    remote isolated function byProjectKeyOrdersPost(string projectKey, OrderFromCartDraft payload, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/orders`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Order response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyOrdersEditsGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns OrderEditPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/orders/edits`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OrderEditPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyOrdersEditsPost(string projectKey, OrderEditDraft payload, Expansion[]? expand = ()) returns OrderEdit|error {
        string resourcePath = string `/${projectKey}/orders/edits`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrderEdit response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyOrdersEditsKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns OrderEdit|error {
        string resourcePath = string `/${projectKey}/orders/edits/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OrderEdit response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyOrdersEditsKeyByKeyPost(string projectKey, string 'key, OrderEditUpdate payload, Expansion[]? expand = ()) returns OrderEdit|error {
        string resourcePath = string `/${projectKey}/orders/edits/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrderEdit response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyOrdersEditsKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns OrderEdit|error {
        string resourcePath = string `/${projectKey}/orders/edits/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OrderEdit response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyOrdersEditsByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns OrderEdit|error {
        string resourcePath = string `/${projectKey}/orders/edits/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OrderEdit response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyOrdersEditsByIDPost(string projectKey, string iD, OrderEditUpdate payload, Expansion[]? expand = ()) returns OrderEdit|error {
        string resourcePath = string `/${projectKey}/orders/edits/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrderEdit response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyOrdersEditsByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns OrderEdit|error {
        string resourcePath = string `/${projectKey}/orders/edits/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OrderEdit response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - ## Bad Request A 400 is the most commonly expected error response and indicates that a request failed due to providing bad input. Bad input can be a malformed request body, missing required parameters, wrongly typed or malformed parameters or a parameter that references another resource that does not exist. Clients need to resolve the problems mentioned in the response before re-sending the request. The following general error codes can appear in responses with the HTTP status code `400`: * `InvalidInput`   Invalid input has been sent to the service.   The client application should validate the input according to the constraints described in the error message   before sending the request. * `InvalidOperation`   The resource(s) involved in the request are not in a valid state for the operation. The client application   should validate the constraints described in the error message before sending the request. * `InvalidField`   A field has an invalid value.   Extra fields:   * `field` - String     The name of the field.   * `invalidValue` - *     The invalid value.   * `allowedValues` - Array of * - Optional     A fixed set of allowed values for the field, if any. * `RequiredField`   A required field is missing a value.   Extra fields:   * `field` - String     The name of the field. * `DuplicateField`   A value for a field conflicts with an existing duplicate value.   Extra fields:   * `field` - String     The name of the field.   * `duplicateValue` - *     The offending duplicate value. 
    remote isolated function byProjectKeyOrdersEditsByIDApplyPost(string projectKey, string iD, OrderEditApply payload) returns http:Response|error {
        string resourcePath = string `/${projectKey}/orders/edits/${iD}/apply`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create an Order by Import
    #
    # + return - 201 
    remote isolated function byProjectKeyOrdersImportPost(string projectKey, OrderImportDraft payload) returns Order|error {
        string resourcePath = string `/${projectKey}/orders/import`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Order response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # In case the orderNumber does not match the regular expression [a-zA-Z0-9_-]+,
    # it should be provided in URL-encoded format.
    #
    # + return - 200 
    remote isolated function byProjectKeyOrdersOrderNumberByOrderNumberGet(string projectKey, string orderNumber, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/orders/order-number=${orderNumber}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyOrdersOrderNumberByOrderNumberPost(string projectKey, string orderNumber, OrderUpdate payload, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/orders/order-number=${orderNumber}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Order response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyOrdersOrderNumberByOrderNumberDelete(string projectKey, string orderNumber, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/orders/order-number=${orderNumber}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyOrdersSearchPost(string projectKey, OrderSearchRequest payload) returns OrderPagedSearchResponse|error {
        string resourcePath = string `/${projectKey}/orders/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrderPagedSearchResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Checks whether a search index for the Project's Orders exists.
    #
    # + return - The index exists and the Search Orders endpoint can be used. 
    remote isolated function byProjectKeyOrdersSearchHead(string projectKey) returns http:Response|error {
        string resourcePath = string `/${projectKey}/orders/search`;
        http:Response response = check self.clientEp->head(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyOrdersByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/orders/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyOrdersByIDPost(string projectKey, string iD, OrderUpdate payload, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/orders/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Order response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyOrdersByIDDelete(string projectKey, string iD, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${projectKey}/orders/${iD}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyPaymentsGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns PaymentPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/payments`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PaymentPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # To create a payment object a payment draft object has to be given with the request.
    #
    # + return - 201 
    remote isolated function byProjectKeyPaymentsPost(string projectKey, PaymentDraft payload, Expansion[]? expand = ()) returns Payment|error {
        string resourcePath = string `/${projectKey}/payments`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Payment response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyPaymentsKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns Payment|error {
        string resourcePath = string `/${projectKey}/payments/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Payment response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyPaymentsKeyByKeyPost(string projectKey, string 'key, PaymentUpdate payload, Expansion[]? expand = ()) returns Payment|error {
        string resourcePath = string `/${projectKey}/payments/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Payment response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyPaymentsKeyByKeyDelete(string projectKey, string 'key, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Payment|error {
        string resourcePath = string `/${projectKey}/payments/key=${'key}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Payment response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyPaymentsByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns Payment|error {
        string resourcePath = string `/${projectKey}/payments/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Payment response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyPaymentsByIDPost(string projectKey, string iD, PaymentUpdate payload, Expansion[]? expand = ()) returns Payment|error {
        string resourcePath = string `/${projectKey}/payments/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Payment response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyPaymentsByIDDelete(string projectKey, string iD, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Payment|error {
        string resourcePath = string `/${projectKey}/payments/${iD}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Payment response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductDiscountsGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ProductDiscountPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/product-discounts`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductDiscountPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyProductDiscountsPost(string projectKey, ProductDiscountDraft payload, Expansion[]? expand = ()) returns ProductDiscount|error {
        string resourcePath = string `/${projectKey}/product-discounts`;
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
    remote isolated function byProjectKeyProductDiscountsKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns ProductDiscount|error {
        string resourcePath = string `/${projectKey}/product-discounts/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductDiscount response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductDiscountsKeyByKeyPost(string projectKey, string 'key, ProductDiscountUpdate payload, Expansion[]? expand = ()) returns ProductDiscount|error {
        string resourcePath = string `/${projectKey}/product-discounts/key=${'key}`;
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
    remote isolated function byProjectKeyProductDiscountsKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns ProductDiscount|error {
        string resourcePath = string `/${projectKey}/product-discounts/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductDiscount response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductDiscountsMatchingPost(string projectKey, ProductDiscountMatchQuery payload) returns ProductDiscount|error {
        string resourcePath = string `/${projectKey}/product-discounts/matching`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductDiscount response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductDiscountsByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns ProductDiscount|error {
        string resourcePath = string `/${projectKey}/product-discounts/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductDiscount response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductDiscountsByIDPost(string projectKey, string iD, ProductDiscountUpdate payload, Expansion[]? expand = ()) returns ProductDiscount|error {
        string resourcePath = string `/${projectKey}/product-discounts/${iD}`;
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
    remote isolated function byProjectKeyProductDiscountsByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns ProductDiscount|error {
        string resourcePath = string `/${projectKey}/product-discounts/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductDiscount response = check self.clientEp->delete(resourcePath);
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
    #
    # + return - 200 
    remote isolated function byProjectKeyProductSelectionsGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ProductSelectionPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/product-selections`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelectionPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyProductSelectionsPost(string projectKey, ProductSelectionDraft payload, Expansion[]? expand = ()) returns ProductSelection|error {
        string resourcePath = string `/${projectKey}/product-selections`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductSelection response = check self.clientEp->post(resourcePath, request);
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
    remote isolated function byProjectKeyProductSelectionsByIDProductsGet(string projectKey, string iD, Expansion[]? expand = (), float? 'limit = (), float? offset = (), boolean? withTotal = ()) returns ProductSelectionProductPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/product-selections/${iD}/products`;
        map<anydata> queryParam = {"expand": expand, "limit": 'limit, "offset": offset, "withTotal": withTotal};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelectionProductPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductTypesGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ProductTypePagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/product-types`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductTypePagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyProductTypesPost(string projectKey, ProductTypeDraft payload, Expansion[]? expand = ()) returns ProductType|error {
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
    remote isolated function byProjectKeyProductTypesKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${projectKey}/product-types/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductType response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductTypesKeyByKeyPost(string projectKey, string 'key, ProductTypeUpdate payload, Expansion[]? expand = ()) returns ProductType|error {
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
    remote isolated function byProjectKeyProductTypesKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${projectKey}/product-types/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductType response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductTypesByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${projectKey}/product-types/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductType response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyProductTypesByIDPost(string projectKey, string iD, ProductTypeUpdate payload, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${projectKey}/product-types/${iD}`;
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
    remote isolated function byProjectKeyProductTypesByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns ProductType|error {
        string resourcePath = string `/${projectKey}/product-types/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductType response = check self.clientEp->delete(resourcePath);
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
    remote isolated function byProjectKeyProductsByIDProductSelectionsGet(string projectKey, string iD, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ProductSelectionPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/products/${iD}/product-selections`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProductSelectionPagedQueryResponse response = check self.clientEp->get(resourcePath);
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
    remote isolated function byProjectKeyShippingMethodsGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ShippingMethodPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/shipping-methods`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingMethodPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyShippingMethodsPost(string projectKey, ShippingMethodDraft payload, Expansion[]? expand = ()) returns ShippingMethod|error {
        string resourcePath = string `/${projectKey}/shipping-methods`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShippingMethod response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyShippingMethodsKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns ShippingMethod|error {
        string resourcePath = string `/${projectKey}/shipping-methods/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingMethod response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyShippingMethodsKeyByKeyPost(string projectKey, string 'key, ShippingMethodUpdate payload, Expansion[]? expand = ()) returns ShippingMethod|error {
        string resourcePath = string `/${projectKey}/shipping-methods/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShippingMethod response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyShippingMethodsKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns ShippingMethod|error {
        string resourcePath = string `/${projectKey}/shipping-methods/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingMethod response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyShippingMethodsMatchingCartGet(string projectKey, string cartId, Expansion[]? expand = ()) returns ShippingMethodPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/shipping-methods/matching-cart`;
        map<anydata> queryParam = {"cartId": cartId, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingMethodPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyShippingMethodsMatchingLocationGet(string projectKey, string country, string? state = (), string? currency = (), Expansion[]? expand = ()) returns ShippingMethodPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/shipping-methods/matching-location`;
        map<anydata> queryParam = {"country": country, "state": state, "currency": currency, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingMethodPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyShippingMethodsMatchingOrdereditGet(string projectKey, string orderEditId, string country, string? state = ()) returns ShippingMethodPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/shipping-methods/matching-orderedit`;
        map<anydata> queryParam = {"orderEditId": orderEditId, "country": country, "state": state};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ShippingMethodPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyShippingMethodsByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns ShippingMethod|error {
        string resourcePath = string `/${projectKey}/shipping-methods/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingMethod response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyShippingMethodsByIDPost(string projectKey, string iD, ShippingMethodUpdate payload, Expansion[]? expand = ()) returns ShippingMethod|error {
        string resourcePath = string `/${projectKey}/shipping-methods/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShippingMethod response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyShippingMethodsByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns ShippingMethod|error {
        string resourcePath = string `/${projectKey}/shipping-methods/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingMethod response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyShoppingListsGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ShoppingListPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/shopping-lists`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingListPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyShoppingListsPost(string projectKey, ShoppingListDraft payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/shopping-lists`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShoppingList response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a shopping list by Key.
    #
    # + return - 200 
    remote isolated function byProjectKeyShoppingListsKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/shopping-lists/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a shopping list found by its Key.
    #
    # + return - 200 
    remote isolated function byProjectKeyShoppingListsKeyByKeyPost(string projectKey, string 'key, ShoppingListUpdate payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/shopping-lists/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShoppingList response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyShoppingListsKeyByKeyDelete(string projectKey, string 'key, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/shopping-lists/key=${'key}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Gets a shopping list by ID.
    #
    # + return - 200 
    remote isolated function byProjectKeyShoppingListsByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/shopping-lists/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyShoppingListsByIDPost(string projectKey, string iD, ShoppingListUpdate payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/shopping-lists/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShoppingList response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyShoppingListsByIDDelete(string projectKey, string iD, float 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${projectKey}/shopping-lists/${iD}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyStatesGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns StatePagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/states`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        StatePagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyStatesPost(string projectKey, StateDraft payload, Expansion[]? expand = ()) returns State|error {
        string resourcePath = string `/${projectKey}/states`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        State response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyStatesKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns State|error {
        string resourcePath = string `/${projectKey}/states/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        State response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyStatesKeyByKeyPost(string projectKey, string 'key, StateUpdate payload, Expansion[]? expand = ()) returns State|error {
        string resourcePath = string `/${projectKey}/states/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        State response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyStatesKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns State|error {
        string resourcePath = string `/${projectKey}/states/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        State response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyStatesByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns State|error {
        string resourcePath = string `/${projectKey}/states/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        State response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyStatesByIDPost(string projectKey, string iD, StateUpdate payload, Expansion[]? expand = ()) returns State|error {
        string resourcePath = string `/${projectKey}/states/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        State response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyStatesByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns State|error {
        string resourcePath = string `/${projectKey}/states/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        State response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyStoresGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns StorePagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/stores`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        StorePagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyStoresPost(string projectKey, StoreDraft payload, Expansion[]? expand = ()) returns Store|error {
        string resourcePath = string `/${projectKey}/stores`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Store response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyStoresKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns Store|error {
        string resourcePath = string `/${projectKey}/stores/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Store response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyStoresKeyByKeyPost(string projectKey, string 'key, StoreUpdate payload, Expansion[]? expand = ()) returns Store|error {
        string resourcePath = string `/${projectKey}/stores/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Store response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyStoresKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns Store|error {
        string resourcePath = string `/${projectKey}/stores/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Store response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyStoresByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns Store|error {
        string resourcePath = string `/${projectKey}/stores/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Store response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyStoresByIDPost(string projectKey, string iD, StoreUpdate payload, Expansion[]? expand = ()) returns Store|error {
        string resourcePath = string `/${projectKey}/stores/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Store response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyStoresByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns Store|error {
        string resourcePath = string `/${projectKey}/stores/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Store response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeySubscriptionsGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns SubscriptionPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/subscriptions`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SubscriptionPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # The creation of a Subscription is eventually consistent, it may take up to a minute before it becomes fully active.
    # In order to test that the destination is correctly configured, a test message will be put into the queue.
    # If the message could not be delivered, the subscription will not be created.
    # The payload of the test message is a notification of type ResourceCreated for the resourceTypeId subscription.
    # Currently, a maximum of 25 subscriptions can be created per project.
    #
    # + return - 201 
    remote isolated function byProjectKeySubscriptionsPost(string projectKey, SubscriptionDraft payload, Expansion[]? expand = ()) returns Subscription|error {
        string resourcePath = string `/${projectKey}/subscriptions`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Subscription response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves the representation of a subscription by its key.
    #
    # + return - 200 
    remote isolated function byProjectKeySubscriptionsKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns Subscription|error {
        string resourcePath = string `/${projectKey}/subscriptions/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Subscription response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeySubscriptionsKeyByKeyPost(string projectKey, string 'key, SubscriptionUpdate payload, Expansion[]? expand = ()) returns Subscription|error {
        string resourcePath = string `/${projectKey}/subscriptions/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Subscription response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeySubscriptionsKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns Subscription|error {
        string resourcePath = string `/${projectKey}/subscriptions/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Subscription response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Retrieves the representation of a subscription by its id.
    #
    # + return - 200 
    remote isolated function byProjectKeySubscriptionsByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns Subscription|error {
        string resourcePath = string `/${projectKey}/subscriptions/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Subscription response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeySubscriptionsByIDPost(string projectKey, string iD, SubscriptionUpdate payload, Expansion[]? expand = ()) returns Subscription|error {
        string resourcePath = string `/${projectKey}/subscriptions/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Subscription response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeySubscriptionsByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns Subscription|error {
        string resourcePath = string `/${projectKey}/subscriptions/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Subscription response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyTaxCategoriesGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns TaxCategoryPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/tax-categories`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TaxCategoryPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyTaxCategoriesPost(string projectKey, TaxCategoryDraft payload, Expansion[]? expand = ()) returns TaxCategory|error {
        string resourcePath = string `/${projectKey}/tax-categories`;
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
    remote isolated function byProjectKeyTaxCategoriesKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns TaxCategory|error {
        string resourcePath = string `/${projectKey}/tax-categories/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TaxCategory response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyTaxCategoriesKeyByKeyPost(string projectKey, string 'key, TaxCategoryUpdate payload, Expansion[]? expand = ()) returns TaxCategory|error {
        string resourcePath = string `/${projectKey}/tax-categories/key=${'key}`;
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
    remote isolated function byProjectKeyTaxCategoriesKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns TaxCategory|error {
        string resourcePath = string `/${projectKey}/tax-categories/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TaxCategory response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyTaxCategoriesByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns TaxCategory|error {
        string resourcePath = string `/${projectKey}/tax-categories/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TaxCategory response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyTaxCategoriesByIDPost(string projectKey, string iD, TaxCategoryUpdate payload, Expansion[]? expand = ()) returns TaxCategory|error {
        string resourcePath = string `/${projectKey}/tax-categories/${iD}`;
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
    remote isolated function byProjectKeyTaxCategoriesByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns TaxCategory|error {
        string resourcePath = string `/${projectKey}/tax-categories/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TaxCategory response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyTypesGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns TypePagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/types`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TypePagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyTypesPost(string projectKey, TypeDraft payload, Expansion[]? expand = ()) returns Type|error {
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
    #
    # + return - 200 
    remote isolated function byProjectKeyTypesKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${projectKey}/types/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Type response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyTypesKeyByKeyPost(string projectKey, string 'key, TypeUpdate payload, Expansion[]? expand = ()) returns Type|error {
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
    remote isolated function byProjectKeyTypesKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${projectKey}/types/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Type response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyTypesByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${projectKey}/types/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Type response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyTypesByIDPost(string projectKey, string iD, TypeUpdate payload, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${projectKey}/types/${iD}`;
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
    remote isolated function byProjectKeyTypesByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns Type|error {
        string resourcePath = string `/${projectKey}/types/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Type response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyZonesGet(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ZonePagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/zones`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ZonePagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function byProjectKeyZonesPost(string projectKey, ZoneDraft payload, Expansion[]? expand = ()) returns Zone|error {
        string resourcePath = string `/${projectKey}/zones`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Zone response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyZonesKeyByKeyGet(string projectKey, string 'key, Expansion[]? expand = ()) returns Zone|error {
        string resourcePath = string `/${projectKey}/zones/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Zone response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyZonesKeyByKeyPost(string projectKey, string 'key, ZoneUpdate payload, Expansion[]? expand = ()) returns Zone|error {
        string resourcePath = string `/${projectKey}/zones/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Zone response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyZonesKeyByKeyDelete(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns Zone|error {
        string resourcePath = string `/${projectKey}/zones/key=${'key}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Zone response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyZonesByIDGet(string projectKey, string iD, Expansion[]? expand = ()) returns Zone|error {
        string resourcePath = string `/${projectKey}/zones/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Zone response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyZonesByIDPost(string projectKey, string iD, ZoneUpdate payload, Expansion[]? expand = ()) returns Zone|error {
        string resourcePath = string `/${projectKey}/zones/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Zone response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function byProjectKeyZonesByIDDelete(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns Zone|error {
        string resourcePath = string `/${projectKey}/zones/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Zone response = check self.clientEp->delete(resourcePath);
        return response;
    }
}
