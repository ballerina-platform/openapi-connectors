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
# The commercetools Platform HTTP API(Customize Behavior) offers an interface for programmatic access to the data stored on the platform and associated functionality for customize behavior.
@display {label: "Commercetools Customize Behavior", iconPath: "icon.png"}
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
    # Retrieves the representation of an extension by its key.
    #
    # + return - 200 
    remote isolated function getExtensionByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns Extension|error {
        string resourcePath = string `/${projectKey}/extensions/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Extension response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateExtensionByKey(string projectKey, string 'key, ExtensionUpdate payload, Expansion[]? expand = ()) returns Extension|error {
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
    remote isolated function deleteExtensionByKey(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns Extension|error {
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
    remote isolated function getExtensionByID(string projectKey, string id, Expansion[]? expand = ()) returns Extension|error {
        string resourcePath = string `/${projectKey}/extensions/${id}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Extension response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateExtensionByID(string projectKey, string id, ExtensionUpdate payload, Expansion[]? expand = ()) returns Extension|error {
        string resourcePath = string `/${projectKey}/extensions/${id}`;
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
    remote isolated function deleteExtensionByID(string projectKey, string id, float 'version, Expansion[]? expand = ()) returns Extension|error {
        string resourcePath = string `/${projectKey}/extensions/${id}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Extension response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryExtensions(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ExtensionPagedQueryResponse|error {
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
    remote isolated function createExtensions(string projectKey, ExtensionDraft payload, Expansion[]? expand = ()) returns Extension|error {
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
    #
    # + return - 200 
    remote isolated function querySubscriptions(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns SubscriptionPagedQueryResponse|error {
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
    remote isolated function createSubscriptions(string projectKey, SubscriptionDraft payload, Expansion[]? expand = ()) returns Subscription|error {
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
    remote isolated function getSubscriptionByKey(string projectKey, string 'key, Expansion[]? expand = ()) returns Subscription|error {
        string resourcePath = string `/${projectKey}/subscriptions/key=${'key}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Subscription response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateSubscriptionByKey(string projectKey, string 'key, SubscriptionUpdate payload, Expansion[]? expand = ()) returns Subscription|error {
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
    remote isolated function deleteSubscriptionByKey(string projectKey, string 'key, float 'version, Expansion[]? expand = ()) returns Subscription|error {
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
    remote isolated function getSubscriptionByID(string projectKey, string id, Expansion[]? expand = ()) returns Subscription|error {
        string resourcePath = string `/${projectKey}/subscriptions/${id}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Subscription response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateSubscriptionByID(string projectKey, string id, SubscriptionUpdate payload, Expansion[]? expand = ()) returns Subscription|error {
        string resourcePath = string `/${projectKey}/subscriptions/${id}`;
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
    remote isolated function deleteSubscriptionByID(string projectKey, string id, float 'version, Expansion[]? expand = ()) returns Subscription|error {
        string resourcePath = string `/${projectKey}/subscriptions/${id}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Subscription response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getMessageByID(string projectKey, string id, Expansion[]? expand = ()) returns Message|error {
        string resourcePath = string `/${projectKey}/messages/${id}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Message response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryMessages(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns MessagePagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/messages`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MessagePagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
