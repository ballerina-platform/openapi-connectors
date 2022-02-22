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
# The commercetools Platform - Configuration API offers an interface for programmatic access to retrieve certain information on projects, API-clients, channels, stores and state machines. 
@display {label: "Commercetools Configuration", iconPath: "icon.png"}
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
    remote isolated function getProject(string projectKey) returns Project|error {
        string resourcePath = string `/${projectKey}`;
        Project response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update project
    #
    # + return - 200 
    remote isolated function updateProject(string projectKey, ProjectUpdate payload) returns Project|error {
        string resourcePath = string `/${projectKey}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Project response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getApiClientsByProjectKey(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ApiClientPagedQueryResponse|error {
        string resourcePath = string `/${projectKey}/api-clients`;
        map<anydata> queryParam = {"expand": expand, "sort": sort, "limit": 'limit, "offset": offset, "withTotal": withTotal, "where": 'where, "/^var[.][a-zA-Z0-9]+$/": varAZaZ09};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}, "sort": {style: FORM, explode: true}, "where": {style: FORM, explode: true}, "/^var[.][a-zA-Z0-9]+$/": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ApiClientPagedQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 201 
    remote isolated function updateApiClientsByProjectKey(string projectKey, ApiClientDraft payload, Expansion[]? expand = ()) returns ApiClient|error {
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
    remote isolated function getApiClientsByProjectKeyByID(string projectKey, string iD) returns ApiClient|error {
        string resourcePath = string `/${projectKey}/api-clients/${iD}`;
        ApiClient response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function deleteApiClientsByProjectKeyByID(string projectKey, string iD) returns ApiClient|error {
        string resourcePath = string `/${projectKey}/api-clients/${iD}`;
        ApiClient response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function getKeyChannelsByProjectByID(string projectKey, string iD, Expansion[]? expand = ()) returns Channel|error {
        string resourcePath = string `/${projectKey}/channels/${iD}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Channel response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function updateKeyChannelsByProjectByID(string projectKey, string iD, ChannelUpdate payload, Expansion[]? expand = ()) returns Channel|error {
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
    remote isolated function deleteKeyChannelsByProjectByID(string projectKey, string iD, float 'version, Expansion[]? expand = ()) returns Channel|error {
        string resourcePath = string `/${projectKey}/channels/${iD}`;
        map<anydata> queryParam = {"version": 'version, "expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Channel response = check self.clientEp->delete(resourcePath);
        return response;
    }
    #
    # + return - 200 
    remote isolated function queryC(string projectKey, Expansion[]? expand = (), Sort[]? sort = (), float? 'limit = (), float? offset = (), boolean? withTotal = (), QueryPredicate[]? 'where = (), string[]? varAZaZ09 = ()) returns ChannelPagedQueryResponse|error {
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
}
