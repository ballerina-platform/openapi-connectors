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
    http:BearerTokenConfig auth;
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

# This is a generated connector for [DocuSign Monitor API](https://developers.docusign.com/docs/monitor-api/monitor101/) OpenAPI specification. DocuSign Monitor helps organizations protect their agreements with round-the-clock activity tracking.  The Monitor API delivers this activity tracking information directly to existing security stacks or data visualization  tools—enabling teams to detect unauthorized activity, investigate incidents, and quickly respond to verified threats.  It also provides the flexibility security teams need to customize dashboards and alerts to meet specific business needs.
@display {label: "DocuSign Monitor", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [DocuSign account](https://www.docusign.com/) and obtain tokens by following [this guide](https://developers.docusign.com/docs/monitor-api/monitor101/auth/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "//lens.docusign.net/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Gets customer event data for an organization.
    #
    # + dataSetName - The data product to which the endpoints are executed against. 
    # + 'version - Must be `2`. 
    # + cursor - A location in the DataSet that continues querying data. 
    # + 'limit - The maximum number of records to return. 
    # + return - Success 
    remote isolated function getDatasetsByDataSetName(string dataSetName, string 'version, string? cursor = (), int 'limit = 1000) returns CursoredResult|error {
        string resourcePath = string `/api/v${getEncodedUri('version)}/datasets/${getEncodedUri(dataSetName)}/stream`;
        map<anydata> queryParam = {"cursor": cursor, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CursoredResult response = check self.clientEp->get(resourcePath);
        return response;
    }
}
