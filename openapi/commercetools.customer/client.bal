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
# The commercetools Platform HTTP API(Customer) offers an interface for programmatic access to retrieve certain information on customer related operations.
@display {label: "Commercetools Customer", iconPath: "icon.png"}
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
    remote isolated function getCustomersByProjectKeyByID(string projectKey, string id, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customers/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateCustomersByProjectKeyByID(string projectKey, string id, CustomerUpdate payload, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customers/${getEncodedUri(id)}`;
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
    remote isolated function deleteCustomerByProjectKeyByID(string projectKey, string id, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customers/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns a customer by its ID from a specific Store.
    # It also considers customers that do not have the stores field.
    # If the customer exists in the commercetools project but the stores field references different stores,
    # this method returns a ResourceNotFound error.
    #
    # + return - 200 
    remote isolated function getCustomerInStoreByID(string projectKey, string storeKey, string id, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/customers/${getEncodedUri(id)}`;
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
    remote isolated function updateCustomerInStoreByID(string projectKey, string storeKey, string id, CustomerUpdate payload, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/customers/${getEncodedUri(id)}`;
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
    remote isolated function deleteCustomerInStoreByID(string projectKey, string storeKey, string id, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/customers/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getCustomerByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customers/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateCustomerByKey(string projectKey, string 'key, CustomerUpdate payload, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customers/key=${getEncodedUri('key)}`;
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
    remote isolated function deleteCustomerByKey(string projectKey, string 'key, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customers/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns a customer by its Key from a specific Store.
    # It also considers customers that do not have the stores field.
    # If the customer exists in the commercetools project but the stores field references different stores,
    # this method returns a ResourceNotFound error.
    #
    # + return - 200 
    remote isolated function getCustomerInStoreByKey(string projectKey, string storeKey, string 'key, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/customers/key=${getEncodedUri('key)}`;
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
    remote isolated function updateCustomerInStorebyKey(string projectKey, string storeKey, string 'key, CustomerUpdate payload, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/customers/key=${getEncodedUri('key)}`;
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
    remote isolated function deleteCustomerInStorebyKey(string projectKey, string storeKey, string 'key, decimal 'version, boolean? dataErasure = (), Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/customers/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"dataErasure": dataErasure, "version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryCustomers(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CustomerPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customers`;
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
    remote isolated function createcustomerSignup(string projectKey, CustomerDraft payload, Expansion[]? expand = ()) returns CustomerSignInResult|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customers`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerSignInResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryCustomersInStore(string projectKey, string storeKey, Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns CustomerPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/customers`;
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
    remote isolated function createcustomersinstoreSignup(string projectKey, string storeKey, CustomerDraft payload, Expansion[]? expand = ()) returns CustomerSignInResult|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/customers`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerSignInResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Set a new password using a token.
    #
    # + return - 200 
    remote isolated function resetCustomerPassword(string projectKey, CustomerResetPassword payload) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customers/password/reset`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Change a customers password
    #
    # + return - 200 
    remote isolated function changeCustomerPasswordInStore(string projectKey, string storeKey, CustomerChangePassword payload) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/customers/password`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
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
    remote isolated function authenticateglobalcustomerSignin(string projectKey, CustomerSignin payload) returns CustomerSignInResult|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/login`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerSignInResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Authenticate Customer (Sign In) in store
    #
    # + return - 200 
    remote isolated function authenticatecustomerSigninInstore(string projectKey, string storeKey, CustomerSignin payload) returns CustomerSignInResult|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/login`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerSignInResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # The token value is used to reset the password of the customer with the given email. The token is
    # valid only for 10 minutes.
    #
    # + return - 200 
    remote isolated function createTokenForVerifyingCustomerEmailByPasswordToken(string projectKey, CustomerCreatePasswordResetToken payload) returns CustomerToken|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customers/password-token`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerToken response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getCustomerByPasswordToken(string projectKey, string passwordToken, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customers/password-token=${getEncodedUri(passwordToken)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # The token value is used to reset the password of the customer with the given email. The token is
    # valid only for 10 minutes.
    #
    # + return - 200 
    remote isolated function createTokenForResetCustomerPasswordInStore(string projectKey, string storeKey, CustomerCreatePasswordResetToken payload) returns CustomerToken|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/customers/password-token`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerToken response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getCustomerByPasswordTokenInStore(string projectKey, string storeKey, string passwordToken, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/customers/password-token=${getEncodedUri(passwordToken)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set a new password using a token.
    #
    # + return - 200 
    remote isolated function resetCustomerPasswordInStore(string projectKey, string storeKey, CustomerResetPassword payload) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/customers/password/reset`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a Token for verifying the Customer's Email
    #
    # + return - 200 
    remote isolated function createTokenForVerifyingCustomerEmailByEmailToken(string projectKey, CustomerCreateEmailToken payload) returns CustomerToken|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customers/email-token`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerToken response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getCustomerByEmailToken(string projectKey, string emailToken, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customers/email-token=${getEncodedUri(emailToken)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Verifies customer's email using a token.
    #
    # + return - The email was verified. 
    remote isolated function verifyCustomerEmail(string projectKey, CustomerEmailVerify payload) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customers/email/confirm`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a Token for verifying the Customer's Email in store
    #
    # + return - 200 
    remote isolated function verifyCustomerEmailInStore(string projectKey, string storeKey, CustomerCreateEmailToken payload) returns CustomerToken|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/customers/email-token`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerToken response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getCustomerByEmailTokenInStore(string projectKey, string storeKey, string emailToken, Expansion[]? expand = ()) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/customers/email-token=${getEncodedUri(emailToken)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Verifies customer's email using a token.
    #
    # + return - The email was verified. 
    remote isolated function verifyCustomerEmailUsingToken(string projectKey, string storeKey, CustomerEmailVerify payload) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/in-store/key=${getEncodedUri(storeKey)}/customers/email/confirm`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getCustomerByProjectKey(string projectKey, Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), Expansion[]? expand = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me`;
        map<anydata> queryParam = {"sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "expand": expand, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"sort": {style: FORM, explode: true}, "expand": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update my customer
    #
    # + return - 200 
    remote isolated function updateCustomerByProjectKey(string projectKey, MyCustomerUpdate payload) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete my Customer
    #
    # + return - 200 
    remote isolated function deleteCustomerByProjectKey(string projectKey, decimal 'version) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me`;
        map<anydata> queryParam = {"version": 'version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Customer response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createCustomerSignUpByProjectKey(string projectKey, MyCustomerDraft payload) returns CustomerSignInResult|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/signup`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerSignInResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function authenticatecustomerSignin(string projectKey, CustomerSignin payload) returns CustomerSignInResult|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/login`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerSignInResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function changeCustomerPasswordByProjectKey(string projectKey, MyCustomerChangePassword payload) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/password`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function resetCustomerPasswordByProject(string projectKey) returns Customer|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/password/reset`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Customer response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    #
    # + return - ## Bad Request A 400 is the most commonly expected error response and indicates that a request failed due to providing bad input. Bad input can be a malformed request body, missing required parameters, wrongly typed or malformed parameters or a parameter that references another resource that does not exist. Clients need to resolve the problems mentioned in the response before re-sending the request. The following general error codes can appear in responses with the HTTP status code `400`: * `InvalidInput`   Invalid input has been sent to the service.   The client application should validate the input according to the constraints described in the error message   before sending the request. * `InvalidOperation`   The resource(s) involved in the request are not in a valid state for the operation. The client application   should validate the constraints described in the error message before sending the request. * `InvalidField`   A field has an invalid value.   Extra fields:   * `field` - String     The name of the field.   * `invalidValue` - *     The invalid value.   * `allowedValues` - Array of * - Optional     A fixed set of allowed values for the field, if any. * `RequiredField`   A required field is missing a value.   Extra fields:   * `field` - String     The name of the field. * `DuplicateField`   A value for a field conflicts with an existing duplicate value.   Extra fields:   * `field` - String     The name of the field.   * `duplicateValue` - *     The offending duplicate value. 
    remote isolated function verifyCustomerEmailByProject(string projectKey) returns http:Response|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/me/email/confirm`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getCustomerGroupsByID(string projectKey, string id, Expansion[]? expand = ()) returns CustomerGroup|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customer-groups/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerGroup response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateCustomerGroupsByID(string projectKey, string id, CustomerGroupUpdate payload, Expansion[]? expand = ()) returns CustomerGroup|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customer-groups/${getEncodedUri(id)}`;
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
    remote isolated function deleteCustomerGroupsByID(string projectKey, string id, decimal 'version, Expansion[]? expand = ()) returns CustomerGroup|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customer-groups/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerGroup response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getCustomerGroupbyKey(string projectKey, string 'key, Expansion[]? expand = ()) returns CustomerGroup|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customer-groups/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerGroup response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateCustomerGroupbyKey(string projectKey, string 'key, CustomerGroupUpdate payload, Expansion[]? expand = ()) returns CustomerGroup|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customer-groups/key=${getEncodedUri('key)}`;
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
    remote isolated function deleteCustomerGroupbyKey(string projectKey, string 'key, decimal 'version, Expansion[]? expand = ()) returns CustomerGroup|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customer-groups/key=${getEncodedUri('key)}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerGroup response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryCustomerGroups(string projectKey, QueryPredicate[]? 'where = (), Expansion[]? expand = (), Sort[]? sort = (), decimal? 'limit = (), decimal? offset = (), boolean? withTotal = (), string[]? varAZaZ09 = ()) returns CustomerGroupPagedQueryResponse|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customer-groups`;
        map<anydata> queryParam = {"where": 'where, "expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"where": {style: FORM, explode: true}, "expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerGroupPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function createCustomerGroup(string projectKey, CustomerGroupDraft payload, Expansion[]? expand = ()) returns CustomerGroup|error {
        string resourcePath = string `/${getEncodedUri(projectKey)}/customer-groups`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerGroup response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
