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

# Use the students Charges API to retrieve details about students charges recorded in Colleague.
@display {label: "Ellucian Student Charges", iconPath: "icon.png"}
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
    # Returns resources from AR.INV.ITEMS.INTG
    #
    # + accept - The version of the resource requested. Prefer to use only the whole MAJOR version.  See the semantic versioning topic in the API Standards from more information. ``` application/vnd.hedtech.integration.v16+json ``` 
    # + 'limit - The maximum number of resources requesting for this result set. Default page limit is 100 and upper limit is 100. 
    # + offset - The 0 based index for a collection of resources for the page requested. 
    # + criteria - ### Student   The person (student) who incurred the charge. ``` /student-charges?criteria={"student":{"id":"e8f67fc1-37b9-4304-84c2-67e0e5c88e68"}} ``` ### Funding Source   The accounting code of the funding source associated with the student charge. ``` /student-charges?criteria={"fundingSource":{"id":"0f12b05d-34e9-4817-b68a-80baf4736d3e"}} ``` ### Funding Destination   The accounting code of the funding destination associated with the student charge. ``` /student-charges?criteria={"fundingDestination":{"id":"44223c6f-0218-4505-99ec-b913c57e3df3"}} ``` ### Academic Period   The term in which charges were incurred. ``` /student-charges?criteria={"academicPeriod":{"id":"fdd87b6d-1d66-469c-8b66-e5f22e4992c1"}} ``` ### Usage   The usage associated with the charge (i.e. tax reporting only). ``` /student-charges?criteria={"reportingDetail":{"usage":"taxReportingOnly"}} ``` 
    # + return - Success 
    remote isolated function getStudentCharges(string accept = "application/vnd.hedtech.integration.v16+json", int? 'limit = (), int? offset = (), record {}? criteria = ()) returns StudentCharges|error {
        string resourcePath = string `/api/student-charges`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "criteria": criteria};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StudentCharges response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new resource in AR.INV.ITEMS.INTG
    #
    # + accept - The version of the resource requested. Please refer to the API source documentation for detailed support information. Prefer to use only the whole MAJOR version.  ``` application/vnd.hedtech.integration.v16+json ``` 
    # + contentType - The version of the resource supplied in the request. Please refer to the API source documentation for detailed support information. Prefer to use only the whole MAJOR version.  ``` application/vnd.hedtech.integration.v16+json ``` 
    # + payload - Student object as Payload 
    # + return - Success 
    remote isolated function createStudent(byte[] payload, string accept = "application/vnd.hedtech.integration.v16+json", string contentType = "application/vnd.hedtech.integration.v16+json") returns StudentCharges|error {
        string resourcePath = string `/api/student-charges`;
        map<any> headerValues = {"accept": accept, "content type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload, "application/vnd.hedtech.integration.v16+json");
        StudentCharges response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Return the requested resource from AR.INV.ITEMS.INTG
    #
    # + id - A global identifier of the resource for use in all external references 
    # + accept - The version of the resource requested. Please refer to the API source documentation for detailed support information. Prefer to use only the whole MAJOR version.  ``` application/vnd.hedtech.integration.v16+json ``` 
    # + return - Success 
    remote isolated function getStudentChargesById(string id, string accept = "application/vnd.hedtech.integration.v16+json") returns StudentCharges|error {
        string resourcePath = string `/api/student-charges/${getEncodedUri(id)}`;
        map<any> headerValues = {"accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StudentCharges response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
