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
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://clever.com/oauth/tokens";
|};

public type DistrictAdmin record {
    string district?;
    string email?;
    string id?;
    Name name?;
    string? title?;
};

public type SchoolAdminResponse record {
    SchoolAdmin data?;
};

public type SchoolAdmin record {
    Credentials credentials?;
    string district?;
    string email?;
    string id?;
    Name name?;
    string[] schools?;
    string staff_id?;
    string? title?;
};

public type SchoolResponse record {
    School data?;
};

public type DistrictStatusResponses record {
    DistrictStatusResponse[] data?;
};

public type SectionResponse record {
    Section data?;
};

public type SectionsResponse record {
    SectionResponse[] data?;
};

public type Name record {
    string? first?;
    string? last?;
    string? middle?;
};

public type School record {
    string created?;
    string district?;
    string? high_grade?;
    string id?;
    string last_modified?;
    Location location?;
    string? low_grade?;
    string? mdr_number?;
    string name?;
    string? nces_id?;
    string? phone?;
    Principal principal?;
    string school_number?;
    string sis_id?;
    string? state_id?;
};

public type DistrictStatusResponse record {
    DistrictStatus data?;
};

public type DistrictAdminsResponse record {
    DistrictAdmin[] data?;
};

public type SchoolsResponse record {
    SchoolResponse[] data?;
};

public type TeachersResponse record {
    TeacherResponse[] data?;
};

public type StudentContact record {
    string district?;
    string? email?;
    string id?;
    string name?;
    string? phone?;
    string? phone_type?;
    string? relationship?;
    string? sis_id?;
    string student?;
    string 'type?;
};

public type DistrictsResponse record {
    DistrictResponse[] data?;
};

public type StudentContactsForStudentResponse record {
    StudentContact[] data?;
};

public type TeacherResponse record {
    Teacher data?;
};

public type Teacher record {
    string created?;
    Credentials credentials?;
    string district?;
    string? email?;
    string id?;
    string last_modified?;
    Name name?;
    string school?;
    string[] schools?;
    string sis_id?;
    string? state_id?;
    string? teacher_number?;
    string? title?;
};

public type Term record {
    string? end_date?;
    string? name?;
    string? start_date?;
};

public type Student record {
    string created?;
    Credentials credentials?;
    string district?;
    string? dob?;
    string? ell_status?;
    string? email?;
    string? gender?;
    string? grade?;
    string? graduation_year?;
    string? hispanic_ethnicity?;
    string id?;
    string last_modified?;
    Location location?;
    Name name?;
    string? race?;
    string school?;
    string[] schools?;
    string sis_id?;
    string? state_id?;
    string? student_number?;
};

public type Section record {
    string? course_description?;
    string? course_name?;
    string? course_number?;
    string created?;
    string district?;
    string? grade?;
    string id?;
    string last_modified?;
    string name?;
    string? period?;
    string school?;
    string? section_number?;
    string sis_id?;
    string[] students?;
    string subject?;
    string? teacher?;
    string[] teachers?;
    Term term?;
};

public type StudentsResponse record {
    StudentResponse[] data?;
};

public type DistrictResponse record {
    District data?;
};

public type StudentContactsResponse record {
    StudentContactResponse[] data?;
};

public type BadRequest record {
    string message?;
};

public type DistrictStatus record {
    string 'error?;
    string id?;
    boolean instant_login?;
    string? last_sync?;
    string launch_date?;
    string? pause_end?;
    string? pause_start?;
    string sis_type?;
    string state?;
};

public type GradeLevelsResponse record {
    string[] data?;
};

public type DistrictAdminResponse record {
    DistrictAdmin data?;
};

public type StudentResponse record {
    Student data?;
};

public type InternalError record {
    string message?;
};

public type District record {
    string id?;
    string? mdr_number?;
    string name?;
};

public type SchoolAdminsResponse record {
    SchoolAdminResponse[] data?;
};

public type Credentials record {
    string district_username?;
};

public type Principal record {
    string? email?;
    string? name?;
};

public type Location record {
    string? address?;
    string? city?;
    string? lat?;
    string? lon?;
    string? state?;
    string? zip?;
};

public type NotFound record {
    string message?;
};

public type StudentContactResponse record {
    StudentContact data?;
};
