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
# The commercetools Platform HTTP API offers an interface for programmatic access to operations related to carts, orders and shopping lists.
@display {label: "Commercetools Carts Orders Shopping Lists", iconPath: "icon.png"}
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
    # Gets a shopping list by ID.
    #
    # + return - 200 
    remote isolated function getShoppingListByID(string projectKey, string id, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/shopping-lists/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateShoppingListByID(string projectKey, string id, ShoppingListUpdate payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/shopping-lists/${getEncodedUri(id)}`;
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
    remote isolated function deleteShoppingListByID(string projectKey, string id, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/shopping-lists/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets a shopping list by Key.
    #
    # + return - 200 
    remote isolated function getShoppingListByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/shopping-lists/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a shopping list found by its Key.
    #
    # + return - 200 
    remote isolated function updateShoppingListByKey(string projectKey, string 'key, ShoppingListUpdate payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/shopping-lists/key=${getEncodedUri('key)}`;
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
    remote isolated function deleteShoppingListByKey(string projectKey, string 'key, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/shopping-lists/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets a shopping list by ID.
    #
    # + return - 200 
    remote isolated function getShoppingListInStoreByID(string projectKey, string storeKey, string id, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/shopping-lists/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateShoppingListInStoreByID(string projectKey, string storeKey, string id, ShoppingListUpdate payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/shopping-lists/${getEncodedUri(id)}`;
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
    remote isolated function deleteShoppingListInStoreByID(string projectKey, string storeKey, string id, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/shopping-lists/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets a shopping list by Key.
    #
    # + return - 200 
    remote isolated function getShoppingListInStoreByKey(string projectKey, string storeKey, string 'key, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/shopping-lists/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a shopping list found by its Key.
    #
    # + return - 200 
    remote isolated function updateShoppingListInStoreByKey(string projectKey, string storeKey, string 'key, ShoppingListUpdate payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/shopping-lists/key=${getEncodedUri('key)}`;
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
    remote isolated function deleteShoppingListInStoreByKey(string projectKey, string storeKey, string 'key, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/shopping-lists/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryShoppingListInStore(string projectKey, string storeKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ShoppingListPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/shopping-lists`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingListPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createShoppingListInStore(string projectKey, string storeKey, ShoppingListDraft payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/shopping-lists`;
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
    remote isolated function getMyShoppingListByID(string projectKey, string id, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/shopping-lists/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateMyShoppingListByID(string projectKey, string id, MyShoppingListUpdate payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/shopping-lists/${getEncodedUri(id)}`;
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
    remote isolated function deleteMyShoppingListByID(string projectKey, string id, decimal 'version, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/shopping-lists/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets a shopping list by ID.
    #
    # + return - 200 
    remote isolated function getMyShoppingListInStoreByID(string projectKey, string storeKey, string id, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/me/shopping-lists/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateMyShoppingListInStoreByID(string projectKey, string storeKey, string id, MyShoppingListUpdate payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/me/shopping-lists/${getEncodedUri(id)}`;
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
    remote isolated function deleteMyShoppingListInStoreByID(string projectKey, string storeKey, string id, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/me/shopping-lists/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getMyShoppingListByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/shopping-lists/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateMyShoppingListByKey(string projectKey, string 'key, MyShoppingListUpdate payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/shopping-lists/key=${getEncodedUri('key)}`;
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
    remote isolated function deleteMyShoppingListByKey(string projectKey, string 'key, decimal 'version, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/shopping-lists/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets a shopping list by Key.
    #
    # + return - 200 
    remote isolated function getMyShoppingListInStoreByKey(string projectKey, string storeKey, string 'key, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/me/shopping-lists/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a shopping list found by its Key.
    #
    # + return - 200 
    remote isolated function updateMyShoppingListInStoreByKey(string projectKey, string storeKey, string 'key, MyShoppingListUpdate payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/me/shopping-lists/key=${getEncodedUri('key)}`;
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
    remote isolated function deleteMyShoppingListInStoreByKey(string projectKey, string storeKey, string 'key, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/me/shopping-lists/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingList response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryShoppingListsInStore(string projectKey, string storeKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ShoppingListPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/me/shopping-lists`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingListPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createShoppingListsInStore(string projectKey, string storeKey, MyShoppingListDraft payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/me/shopping-lists`;
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
    remote isolated function queryShoppingLists(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ShoppingListPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/shopping-lists`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShoppingListPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createShoppingLists(string projectKey, MyShoppingListDraft payload, Expansion[]? expand = ()) returns ShoppingList|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/shopping-lists`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShoppingList response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # The cart may not contain up-to-date prices, discounts etc.
    # If you want to ensure they're up-to-date, send an Update request with the Recalculate update action instead.
    #
    # + return - 200 
    remote isolated function getCartByID(string projectKey, string id, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/carts/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateCartByID(string projectKey, string id, CartUpdate payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/carts/${getEncodedUri(id)}`;
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
    remote isolated function deleteCartByID(string projectKey, string id, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/carts/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # The cart may not contain up-to-date prices, discounts etc.
    # If you want to ensure they're up-to-date, send an Update request with the Recalculate update action instead.
    #
    # + return - 200 
    remote isolated function getCartByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/carts/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateCartByKey(string projectKey, string 'key, CartUpdate payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/carts/key=${getEncodedUri('key)}`;
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
    remote isolated function deleteCartByKey(string projectKey, string 'key, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/carts/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns a cart by its ID from a specific Store.
    # If the cart exists in the commercetools project but does not have the store field,
    # or the store field references a different store, this method returns a ResourceNotFound error.
    # The cart may not contain up-to-date prices, discounts etc.
    # If you want to ensure they're up-to-date, send an Update request with the Recalculate update action instead.
    #
    # + return - 200 
    remote isolated function getCartInStoreByID(string projectKey, string storeKey, string id, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/carts/${getEncodedUri(id)}`;
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
    remote isolated function updateCartInStoreByID(string projectKey, string storeKey, string id, CartUpdate payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/carts/${getEncodedUri(id)}`;
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
    remote isolated function deleteCartInStoreByID(string projectKey, string storeKey, string id, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/carts/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns a cart by its key from a specific Store.
    # If the cart exists in the commercetools project but does not have the store field,
    # or the store field references a different store, this method returns a ResourceNotFound error.
    # The cart may not contain up-to-date prices, discounts etc.
    # If you want to ensure they're up-to-date, send an Update request with the Recalculate update action instead.
    #
    # + return - 200 
    remote isolated function getCartInStoreByKey(string projectKey, string storeKey, string 'key, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/carts/key=${getEncodedUri('key)}`;
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
    remote isolated function updateCartInStoreByKey(string projectKey, string storeKey, string 'key, CartUpdate payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/carts/key=${getEncodedUri('key)}`;
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
    remote isolated function deleteCartInStoreByKey(string projectKey, string storeKey, string 'key, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/carts/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieves the active cart of the customer that has been modified most recently.
    # It does not consider carts with CartOrigin Merchant. If no active cart exists, a 404 Not Found error is returned.
    # 
    # The cart may not contain up-to-date prices, discounts etc. If you want to ensure they're up-to-date,
    # send an Update request with the Recalculate update action instead.
    #
    # + return - 200 
    remote isolated function getCartByCustomerID(string projectKey, string customerId, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/carts/customer-id=${getEncodedUri(customerId)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->get(resourcePath);
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
    remote isolated function getCartInStoreByCustomerID(string projectKey, string storeKey, string customerId, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/carts/customer-id=${getEncodedUri(customerId)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryCarts(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CartPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/carts`;
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
    remote isolated function createCart(string projectKey, CartDraft payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/carts`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Cart response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Queries carts in a specific Store.
    #
    # + return - 200 
    remote isolated function queryCartsInStore(string projectKey, string storeKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CartPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/carts`;
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
    remote isolated function createCartInStore(string projectKey, string storeKey, CartDraft payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/carts`;
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
    # + return - 201 
    remote isolated function replicateCart(string projectKey, ReplicaCartDraft payload) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/carts/replicate`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Cart response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 201 
    remote isolated function replicateCartInStore(string projectKey, string storeKey, ReplicaCartDraft payload) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/carts/replicate`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Cart response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getMyCartByID(string projectKey, string id, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/carts/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateMyCartByID(string projectKey, string id, MyCartUpdate payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/carts/${getEncodedUri(id)}`;
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
    remote isolated function deleteMyCartByID(string projectKey, string id, decimal 'version, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/carts/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getMyCartInStoreByID(string projectKey, string storeKey, string id, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/me/carts/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateMyCartInStoreByID(string projectKey, string storeKey, string id, MyCartUpdate payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/me/carts/${getEncodedUri(id)}`;
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
    remote isolated function deleteMyCartInStoreByID(string projectKey, string storeKey, string id, decimal 'version, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/me/carts/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Cart response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getMyActiveCart(string projectKey) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/active-cart`;
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getMyActiveCartInStoreByID(string projectKey, string storeKey) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/me/active-cart`;
        Cart response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryMyCart(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CartPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/carts`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CartPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createMyCart(string projectKey, MyCartDraft payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/carts`;
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
    remote isolated function queryMyCartInStore(string projectKey, string storeKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CartPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/me/carts`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CartPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createMyCartInStore(string projectKey, string storeKey, MyCartDraft payload, Expansion[]? expand = ()) returns Cart|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/me/carts`;
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
    remote isolated function getShippingMethodByID(string projectKey, string id, Expansion[]? expand = ()) returns ShippingMethod|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/shipping-methods/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingMethod response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateShippingMethodByID(string projectKey, string id, ShippingMethodUpdate payload, Expansion[]? expand = ()) returns ShippingMethod|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/shipping-methods/${getEncodedUri(id)}`;
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
    remote isolated function deleteShippingMethodByID(string projectKey, string id, decimal 'version, Expansion[]? expand = ()) returns ShippingMethod|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/shipping-methods/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingMethod response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getShippingMethodByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns ShippingMethod|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/shipping-methods/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingMethod response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateShippingMethodByKey(string projectKey, string 'key, ShippingMethodUpdate payload, Expansion[]? expand = ()) returns ShippingMethod|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/shipping-methods/key=${getEncodedUri('key)}`;
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
    remote isolated function deleteShippingMethodByKey(string projectKey, string 'key, decimal 'version, Expansion[]? expand = ()) returns ShippingMethod|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/shipping-methods/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingMethod response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryShippingMethods(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ShippingMethodPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/shipping-methods`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingMethodPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createShippingMethods(string projectKey, ShippingMethodDraft payload, Expansion[]? expand = ()) returns ShippingMethod|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/shipping-methods`;
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
    remote isolated function getShippingMethodsForCart(string projectKey, string cartId, Expansion[]? expand = ()) returns ShippingMethodPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/shipping-methods/matching-cart`;
        map<anydata> queryParam = {"cartId": cartId, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingMethodPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getShippingMethodsForCartInStoreByID(string projectKey, string storeKey, string cartId, Expansion[]? expand = ()) returns ShippingMethodPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/shipping-methods/matching-cart`;
        map<anydata> queryParam = {"cartId": cartId, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingMethodPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getShippingMethodsForLocation(string projectKey, string country, string? state = (), string? currency = (), Expansion[]? expand = ()) returns ShippingMethodPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/shipping-methods/matching-location`;
        map<anydata> queryParam = {"country": country, "state": state, "currency": currency, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ShippingMethodPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getShippingMethodsForOrderEdit(string projectKey, string orderEditId, string country, string? state = ()) returns ShippingMethodPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/shipping-methods/matching-orderedit`;
        map<anydata> queryParam = {"orderEditId": orderEditId, "country": country, "state": state};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ShippingMethodPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getZoneByID(string projectKey, string id, Expansion[]? expand = ()) returns Zone|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/zones/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Zone response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateZoneByID(string projectKey, string id, ZoneUpdate payload, Expansion[]? expand = ()) returns Zone|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/zones/${getEncodedUri(id)}`;
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
    remote isolated function deleteZoneByID(string projectKey, string id, decimal 'version, Expansion[]? expand = ()) returns Zone|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/zones/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Zone response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getZoneByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns Zone|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/zones/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Zone response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateZoneByKey(string projectKey, string 'key, ZoneUpdate payload, Expansion[]? expand = ()) returns Zone|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/zones/key=${getEncodedUri('key)}`;
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
    remote isolated function deleteZoneByKey(string projectKey, string 'key, decimal 'version, Expansion[]? expand = ()) returns Zone|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/zones/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Zone response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryZones(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ZonePagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/zones`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ZonePagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createZones(string projectKey, ZoneDraft payload, Expansion[]? expand = ()) returns Zone|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/zones`;
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
    remote isolated function getPaymentByID(string projectKey, string id, Expansion[]? expand = ()) returns Payment|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/payments/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Payment response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updatePaymentByID(string projectKey, string id, PaymentUpdate payload, Expansion[]? expand = ()) returns Payment|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/payments/${getEncodedUri(id)}`;
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
    remote isolated function deletePaymentByID(string projectKey, string id, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Payment|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/payments/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Payment response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getPaymentByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns Payment|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/payments/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Payment response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updatePaymentByKey(string projectKey, string 'key, PaymentUpdate payload, Expansion[]? expand = ()) returns Payment|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/payments/key=${getEncodedUri('key)}`;
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
    remote isolated function deletePaymentByKey(string projectKey, string 'key, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Payment|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/payments/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Payment response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryPayment(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns PaymentPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/payments`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PaymentPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # To create a payment object a payment draft object has to be given with the request.
    #
    # + return - 201 
    remote isolated function createPayment(string projectKey, PaymentDraft payload, Expansion[]? expand = ()) returns Payment|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/payments`;
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
    remote isolated function getMyPaymentByID(string projectKey, string id, Expansion[]? expand = ()) returns MyPayment|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/payments/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MyPayment response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateMyPaymentByID(string projectKey, string id, MyPaymentUpdate payload, Expansion[]? expand = ()) returns MyPayment|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/payments/${getEncodedUri(id)}`;
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
    remote isolated function deleteMyPaymentByID(string projectKey, string id, decimal 'version, Expansion[]? expand = ()) returns MyPayment|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/payments/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MyPayment response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryMyPayment(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns MyPaymentPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/payments`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MyPaymentPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createMyPayment(string projectKey, MyPaymentDraft payload, Expansion[]? expand = ()) returns MyPayment|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/payments`;
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
    remote isolated function getOrderByID(string projectKey, string id, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateOrderByID(string projectKey, string id, OrderUpdate payload, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/${getEncodedUri(id)}`;
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
    remote isolated function deleteOrderByID(string projectKey, string id, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns an order by its ID from a specific Store.
    # If the order exists in the commercetools project but does not have the store field,
    # or the store field references a different store, this method returns a ResourceNotFound error.
    #
    # + return - 200 
    remote isolated function getOrderInStoreByID(string projectKey, string storeKey, string id, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/orders/${getEncodedUri(id)}`;
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
    remote isolated function updateOrderInStoreByID(string projectKey, string storeKey, string id, OrderUpdate payload, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/orders/${getEncodedUri(id)}`;
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
    remote isolated function deleteOrderInStoreByID(string projectKey, string storeKey, string id, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/orders/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # In case the orderNumber does not match the regular expression [a-zA-Z0-9_-]+,
    # it should be provided in URL-encoded format.
    #
    # + return - 200 
    remote isolated function getOrderByOrderNumber(string projectKey, string orderNumber, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/order-number=${getEncodedUri(orderNumber)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateOrderByOrderNumber(string projectKey, string orderNumber, OrderUpdate payload, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/order-number=${getEncodedUri(orderNumber)}`;
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
    remote isolated function deleteOrderByOrderNumber(string projectKey, string orderNumber, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/order-number=${getEncodedUri(orderNumber)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryOrder(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns OrderPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders`;
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
    remote isolated function createOrderFromCart(string projectKey, OrderFromCartDraft payload, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Order response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Queries orders in a specific Store.
    #
    # + return - 200 
    remote isolated function queryOrdersInStore(string projectKey, string storeKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns OrderPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/orders`;
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
    remote isolated function createOrdersInStore(string projectKey, string storeKey, OrderFromCartDraft payload, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/orders`;
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
    remote isolated function getOrderInStoreByOrderNumber(string projectKey, string storeKey, string orderNumber, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/orders/order-number=${getEncodedUri(orderNumber)}`;
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
    remote isolated function updateOrderInStoreByOrderNumber(string projectKey, string storeKey, string orderNumber, OrderUpdate payload, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/orders/order-number=${getEncodedUri(orderNumber)}`;
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
    remote isolated function deleteOrderInStoreByOrderNumber(string projectKey, string storeKey, string orderNumber, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/orders/order-number=${getEncodedUri(orderNumber)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getMyOrderByID(string projectKey, string id, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/orders/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getMyOrderInStoreByID(string projectKey, string storeKey, string id, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/me/orders/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Order response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryMyOrders(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns OrderPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/orders`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OrderPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createMyOrders(string projectKey, MyOrderFromCartDraft payload, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/orders`;
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
    remote isolated function queryOrderInStoreFromCart(string projectKey, string storeKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns OrderPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/me/orders`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OrderPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createOrderInStoreFromCart(string projectKey, string storeKey, MyOrderFromCartDraft payload, Expansion[]? expand = ()) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/me/orders`;
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
    remote isolated function getOrderEditByID(string projectKey, string id, Expansion[]? expand = ()) returns OrderEdit|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/edits/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OrderEdit response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateOrderEditByID(string projectKey, string id, OrderEditUpdate payload, Expansion[]? expand = ()) returns OrderEdit|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/edits/${getEncodedUri(id)}`;
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
    remote isolated function deleteOrderEditByID(string projectKey, string id, decimal 'version, Expansion[]? expand = ()) returns OrderEdit|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/edits/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OrderEdit response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getOrderEditByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns OrderEdit|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/edits/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OrderEdit response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateOrderEditByKey(string projectKey, string 'key, OrderEditUpdate payload, Expansion[]? expand = ()) returns OrderEdit|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/edits/key=${getEncodedUri('key)}`;
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
    remote isolated function deleteOrderEditByKey(string projectKey, string 'key, decimal 'version, Expansion[]? expand = ()) returns OrderEdit|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/edits/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OrderEdit response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryOrderEdits(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns OrderEditPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/edits`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OrderEditPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createOrderEdits(string projectKey, OrderEditDraft payload, Expansion[]? expand = ()) returns OrderEdit|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/edits`;
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
    # + return - ## Bad Request A 400 is the most commonly expected error response and indicates that a request failed due to providing bad input. Bad input can be a malformed request body, missing required parameters, wrongly typed or malformed parameters or a parameter that references another resource that does not exist. Clients need to resolve the problems mentioned in the response before re-sending the request. The following general error codes can appear in responses with the HTTP status code `400`: * `InvalidInput`   Invalid input has been sent to the service.   The client application should validate the input according to the constraints described in the error message   before sending the request. * `InvalidOperation`   The resource(s) involved in the request are not in a valid state for the operation. The client application   should validate the constraints described in the error message before sending the request. * `InvalidField`   A field has an invalid value.   Extra fields:   * `field` - String     The name of the field.   * `invalidValue` - *     The invalid value.   * `allowedValues` - Array of * - Optional     A fixed set of allowed values for the field, if any. * `RequiredField`   A required field is missing a value.   Extra fields:   * `field` - String     The name of the field. * `DuplicateField`   A value for a field conflicts with an existing duplicate value.   Extra fields:   * `field` - String     The name of the field.   * `duplicateValue` - *     The offending duplicate value. 
    remote isolated function applyOrderEdit(string projectKey, string id, OrderEditApply payload) returns http:Response|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/edits/${getEncodedUri(id)}/apply`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create an Order by Import
    #
    # + return - 201 
    remote isolated function createOrderByImport(string projectKey, OrderImportDraft payload) returns Order|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/import`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Order response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function searchOrders(string projectKey, OrderSearchRequest payload) returns OrderPagedSearchResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrderPagedSearchResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Checks whether a search index for the Project's Orders exists.
    #
    # + return - The index exists and the Search Orders endpoint can be used. 
    remote isolated function checkSearchIndex(string projectKey) returns http:Response|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/orders/search`;
        http:Response response = check self.clientEp->head(resourcePath);
        return response;
    }
}
