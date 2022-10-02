// Copyright (c) 2022, WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

# Use the students API to retrieve details about students recorded in Colleague.
@display {label: "Ellucian Student", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Please create a [Ellucian Account](https://xedocs.ellucian.com/) and obtain tokens by following [this guide](https://xedocs.ellucian.com/xe-colleague-api/rest-api/index.html).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://integrate.elluciancloud.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Returns resources from STUDENTS
    #
    # + accept - The version of the resource requested. Prefer to use only the whole MAJOR version.  See the semantic versioning topic in the API Standards from more information. ``` application/vnd.hedtech.integration.v16+json ``` 
    # + 'limit - The maximum number of resources requesting for this result set. Default page limit is 100 and upper limit is 100. 
    # + offset - The 0 based index for a collection of resources for the page requested. 
    # + criteria - ### Person   The person who has, or is eligible to, register/enroll at the institution as a student. ``` /students?criteria={"person":{"id":"639ed28f-01e9-4102-874b-d87c80934fc1"}} ``` ### Type   The type of student. ``` /students?criteria={"types":[{"type":{"id":"df777d34-c621-43dc-8fbf-4d0b6b9f4ea4"}}]} ``` ### Residency   The residency type associated with the student. ``` /students?criteria={"residencies":[{"residency":{"id":"f0e05a63-4709-4de1-bed1-9769e6c871e3"}}]} ``` 
    # + personFilter - ### Person Filter   Retrieve information for a specified population. ``` /students?personFilter={"personFilter":{"id":"eb0b8c6e-284f-40b4-979b-173c939cdf4e"}} ``` 
    # + return - Success 
    remote isolated function getStudents(string accept = "application/vnd.hedtech.integration.v16+json", int? 'limit = (), int? offset = (), record {}? criteria = (), record {}? personFilter = ()) returns Student|error {
        string resourcePath = string `/api/students`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "criteria": criteria, "personFilter": personFilter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Student response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Return the requested resource from STUDENTS
    #
    # + id - A global identifier of the resource for use in all external references 
    # + accept - The version of the resource requested. Please refer to the API source documentation for detailed support information. Prefer to use only the whole MAJOR version.  ``` application/vnd.hedtech.integration.v16+json ``` 
    # + return - Success 
    remote isolated function getStudent(string id, string accept = "application/vnd.hedtech.integration.v16+json") returns Student|error {
        string resourcePath = string `/api/students/${getEncodedUri(id)}`;
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Student response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
