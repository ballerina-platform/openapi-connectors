// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

# This is a generated connector for [ADP Workers API v2](https://developers.adp.com/articles/api/workers-v2-api) OpenAPI specification.
# The Workers API provides the capability to obtain a list of all workers in an organization and to get information about work assignments.
# A worker is a person who performs duties and responsibilities for an organization. In that capacity, a worker fills one or more positions via a work assignment. 
# For a given work assignment, a worker is related to the organization as an employee or contractor.
@display {label: "ADP Workers", iconPath: "resources/adp.workers.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [ADP account](https://www.adp.com/) and obtain tokens by following [this guide](https://developers.adp.com/articles/guide/auth-process-data-conn-request-access-token).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Request the list of all available workers that the requester is authorized to view
    #
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + filter - The OData $filter parameter MUST be used to specify the filter criteria. The usage sample is below. Various criteria could be combined using and/or operands and () to set the operand precedence. Please refer """"RESTful Web API Design Standard"""" for more details $filter=/mobileUserAccounts/associateOID eq 'G4O73G9Z62SL2NFM' $filter=/mobileUserAccounts/organizationOID eq 'ABCDEFGH' $filter=/mobileUserAccounts/accountStatusCode eq 'STATCODE' $filter=/mobileUserAccounts/personName/givenName eq 'John' $filter=/mobileUserAccounts/personName/familyName1 eq 'Smith' $filter=/mobileUserAccounts/birthDate eq '01-01-1970' 
    # + prefer - Used to indicate that particular server behaviors are preferred by the client.Required in Asynchronous call. 
    # + accept - “Accept” “: ” ( “*/*” | (type“/” “*”) | (type“/”subtype)) [“; ” “q” “=”qvalue]. Describes media type(s) and subtype(s) that are acceptable for the response. The optional qvalue represents an acceptable quality level for acceptable types. 
    # + 'select - The OData $select parameter MUST be used to specify the selection criterion.  Please refer RESTful Web API Design Standard document for this query parameter specification details.  Example: /core/v1/mobile-user-accounts?$select=/mobileUserAccounts/associateOID,/mobileUserAccounts/governmentID 
    # + skip - The OData $skip parameter MUST be used to specify the start sequence criterion.  Please refer RESTful Web API Design Standard document for this query parameter specification details.  Example: /core/v1/dashboards?$top =10&amp;$skip=20 
    # + top - The OData $top parameter MUST be used to specify the maximum number criterion.  Please refer RESTful Web API Design Standard document for this query parameter specification details.  Example: /core/v1dashboards?$top =10&amp;$skip=20 
    # + count - The OData $count parameter MUST be used to specify the total number criterion.  Please refer RESTful Web API Design Standard document for this query parameter specification details.  Example: /core/v1/dashboards?$count=true 
    # + return - Workers 
    remote isolated function listWorkers(string roleCode, string? filter = (), string? prefer = (), string? accept = (), string? 'select = (), string? skip = (), string? top = (), boolean? count = ()) returns Workers|error {
        string  path = string `/hr/v2/workers`;
        map<anydata> queryParam = {"$filter": filter, "$select": 'select, "$skip": skip, "$top": top, "$count": count};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"roleCode": roleCode, "Prefer": prefer, "Accept": accept};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Workers response = check self.clientEp-> get(path, accHeaders, targetType = Workers);
        return response;
    }
    # Returns a worker
    #
    # + aoid - Associate OID 
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + filter - The OData $filter parameter MUST be used to specify the filter criteria. The usage sample is below. Various criteria could be combined using and/or operands and () to set the operand precedence. Please refer """"RESTful Web API Design Standard"""" for more details $filter=/mobileUserAccounts/associateOID eq 'G4O73G9Z62SL2NFM' $filter=/mobileUserAccounts/organizationOID eq 'ABCDEFGH' $filter=/mobileUserAccounts/accountStatusCode eq 'STATCODE' $filter=/mobileUserAccounts/personName/givenName eq 'John' $filter=/mobileUserAccounts/personName/familyName1 eq 'Smith' $filter=/mobileUserAccounts/birthDate eq '01-01-1970' 
    # + 'select - The OData $select parameter MUST be used to specify the selection criterion.  Please refer RESTful Web API Design Standard document for this query parameter specification details.  Example: /core/v1/mobile-user-accounts?$select=/mobileUserAccounts/associateOID,/mobileUserAccounts/governmentID 
    # + return - Worker 
    remote isolated function getWorker(string aoid, string roleCode, string? filter = (), string? 'select = ()) returns json|error {
        string  path = string `/hr/v2/workers/${aoid}`;
        map<anydata> queryParam = {"$filter": filter, "$select": 'select};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Returns a meta
    #
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + return - Meta data 
    remote isolated function getMeta(string roleCode) returns MetaData|error {
        string  path = string `/hr/v2/workers/meta`;
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MetaData response = check self.clientEp-> get(path, accHeaders, targetType = MetaData);
        return response;
    }
    # Returns a worker specific meta
    #
    # + aoid - Associate OID 
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + return - Worker meta data 
    remote isolated function getSpecificMeta(string aoid, string roleCode) returns json|error {
        string  path = string `/hr/v2/workers/${aoid}/meta`;
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Returns a worker data image
    #
    # + aoid - Associate OID 
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + return - Worker data image 
    remote isolated function getDataImage(string aoid, string roleCode) returns json|error {
        string  path = string `/hr/v2/workers/${aoid}/worker-data-image`;
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Request a photo
    #
    # + sorId - System of Record ID 
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + aoid - Associate OID 
    # + photoId - Associate Photo ID 
    # + adpActingSessionid - ADP Acting Session ID 
    # + ifNoneMatch - Used with a method to make it conditional; the method is performed only if the client entity (via the given entity tag, ETag header) does not match the server entity. 
    # + return - Photo 
    remote isolated function getPhoto(string sorId, string roleCode, string aoid, string photoId, string adpActingSessionid, string? ifNoneMatch = ()) returns json|error {
        string  path = string `/static-content/${sorId}/hr/associates/${aoid}/photos/${photoId}`;
        map<anydata> queryParam = {"ADP-Acting-SessionID": adpActingSessionid};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"roleCode": roleCode, "If-None-Match": ifNoneMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
}
