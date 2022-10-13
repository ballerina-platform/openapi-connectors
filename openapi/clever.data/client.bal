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
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://clever.com/oauth/tokens";
|};

# This is a generated connector for [Clever Data API v1.2](https://dev.clever.com/v1.2/docs/secure-sync) OpenAPI specification.
# Clever Data API provides the capability to retrieve information from Clever data store.
@display {label: "Clever Data", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Clever account](https://clever.com/signup) and obtain tokens by following this [guide](https://dev.clever.com/v1.2/docs/getting-started).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.clever.com/v1.2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Returns a list of student contacts.
    #
    # + 'limit - Number of contacts 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + return - StudentContactsResponse or error 
    remote isolated function getContacts(int? 'limit = (), string? startingAfter = (), string? endingBefore = ()) returns StudentContactsResponse|error {
        string resourcePath = string `/contacts`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        StudentContactsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a specific student contact.
    #
    # + id - Contact ID 
    # + return - StudentContactResponse or error 
    remote isolated function getContact(string id) returns StudentContactResponse|error {
        string resourcePath = string `/contacts/${getEncodedUri(id)}`;
        StudentContactResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the district for a student contact.
    #
    # + id - Contact ID 
    # + return - DistrictResponse or error 
    remote isolated function getDistrictForStudentContact(string id) returns DistrictResponse|error {
        string resourcePath = string `/contacts/${getEncodedUri(id)}/district`;
        DistrictResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the student for a student contact.
    #
    # + id - Contact ID 
    # + return - StudentResponse or error 
    remote isolated function getStudentForContact(string id) returns StudentResponse|error {
        string resourcePath = string `/contacts/${getEncodedUri(id)}/student`;
        StudentResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of district admins.
    #
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + showLinks - Show links 
    # + return - DistrictAdminsResponse or error 
    remote isolated function getDistrictAdmins(string? startingAfter = (), string? endingBefore = (), string? showLinks = ()) returns DistrictAdminsResponse|error {
        string resourcePath = string `/district_admins`;
        map<anydata> queryParam = {"starting_after": startingAfter, "ending_before": endingBefore, "show_links": showLinks};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DistrictAdminsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a specific district admin.
    #
    # + id - District admin ID 
    # + return - DistrictAdminResponse or error 
    remote isolated function getDistrictAdmin(string id) returns DistrictAdminResponse|error {
        string resourcePath = string `/district_admins/${getEncodedUri(id)}`;
        DistrictAdminResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of districts.
    #
    # + return - DistrictsResponse or error 
    remote isolated function getDistricts() returns DistrictsResponse|error {
        string resourcePath = string `/districts`;
        DistrictsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a specific district.
    #
    # + id - District ID 
    # + include - Includes 
    # + return - DistrictResponse or error 
    remote isolated function getDistrict(string id, string? include = ()) returns DistrictResponse|error {
        string resourcePath = string `/districts/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DistrictResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the admins for a district.
    #
    # + id - District ID 
    # + return - DistrictAdminsResponse or error 
    remote isolated function getAdminsForDistrict(string id) returns DistrictAdminsResponse|error {
        string resourcePath = string `/districts/${getEncodedUri(id)}/admins`;
        DistrictAdminsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the schools for a district.
    #
    # + id - District ID 
    # + 'limit - Number of schools 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + 'where - Location 
    # + return - SchoolsResponse or error 
    remote isolated function getSchoolsForDistrict(string id, int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? 'where = ()) returns SchoolsResponse|error {
        string resourcePath = string `/districts/${getEncodedUri(id)}/schools`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SchoolsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the sections for a district.
    #
    # + id - District ID 
    # + 'limit - Number of sections 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + 'where - Location 
    # + return - SectionsResponse or error 
    remote isolated function getSectionsForDistrict(string id, int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? 'where = ()) returns SectionsResponse|error {
        string resourcePath = string `/districts/${getEncodedUri(id)}/sections`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SectionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the status of the district.
    #
    # + id - District ID 
    # + return - DistrictStatusResponses or error 
    remote isolated function getDistrictStatus(string id) returns DistrictStatusResponses|error {
        string resourcePath = string `/districts/${getEncodedUri(id)}/status`;
        DistrictStatusResponses response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the students for a district.
    #
    # + id - District ID 
    # + 'limit - Number of students 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + 'where - Location 
    # + return - StudentsResponse or error 
    remote isolated function getStudentsForDistrict(string id, int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? 'where = ()) returns StudentsResponse|error {
        string resourcePath = string `/districts/${getEncodedUri(id)}/students`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        StudentsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the teachers for a district.
    #
    # + id - District ID 
    # + 'limit - Number of teachers 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + 'where - Location 
    # + return - TeachersResponse or error 
    remote isolated function getTeachersForDistrict(string id, int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? 'where = ()) returns TeachersResponse|error {
        string resourcePath = string `/districts/${getEncodedUri(id)}/teachers`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TeachersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of school admins.
    #
    # + 'limit - Number of admins 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + 'where - Location 
    # + return - SchoolAdminsResponse or error 
    remote isolated function getSchoolAdmins(int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? 'where = ()) returns SchoolAdminsResponse|error {
        string resourcePath = string `/school_admins`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SchoolAdminsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a specific school admin.
    #
    # + id - School admin ID 
    # + include - Include 
    # + return - SchoolAdminResponse or error 
    remote isolated function getSchoolAdmin(string id, string? include = ()) returns SchoolAdminResponse|error {
        string resourcePath = string `/school_admins/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SchoolAdminResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the schools for a school admin.
    #
    # + id - School admin ID 
    # + 'limit - Number of schools 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + return - SchoolsResponse or error 
    remote isolated function getSchoolsForSchoolAdmin(string id, int? 'limit = (), string? startingAfter = (), string? endingBefore = ()) returns SchoolsResponse|error {
        string resourcePath = string `/school_admins/${getEncodedUri(id)}/schools`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SchoolsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of schools.
    #
    # + 'limit - Number of schools 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + 'where - Location 
    # + return - SchoolsResponse or error 
    remote isolated function getSchools(int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? 'where = ()) returns SchoolsResponse|error {
        string resourcePath = string `/schools`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SchoolsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a specific school.
    #
    # + id - School ID 
    # + return - SchoolResponse or error 
    remote isolated function getSchool(string id) returns SchoolResponse|error {
        string resourcePath = string `/schools/${getEncodedUri(id)}`;
        SchoolResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the district for a school.
    #
    # + id - School ID 
    # + return - DistrictResponse or error 
    remote isolated function getDistrictForSchool(string id) returns DistrictResponse|error {
        string resourcePath = string `/schools/${getEncodedUri(id)}/district`;
        DistrictResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the sections for a school.
    #
    # + id - School ID 
    # + 'limit - Number of sections 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + 'where - Location 
    # + return - SectionsResponse or error 
    remote isolated function getSectionsForSchool(string id, int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? 'where = ()) returns SectionsResponse|error {
        string resourcePath = string `/schools/${getEncodedUri(id)}/sections`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SectionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the students for a school.
    #
    # + id - School ID 
    # + 'limit - Number of students 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + 'where - Location 
    # + return - StudentsResponse or error 
    remote isolated function getStudentsForSchool(string id, int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? 'where = ()) returns StudentsResponse|error {
        string resourcePath = string `/schools/${getEncodedUri(id)}/students`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        StudentsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the teachers for a school.
    #
    # + id - School ID 
    # + 'limit - Number of schools 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + 'where - Location 
    # + return - TeachersResponse or error 
    remote isolated function getTeachersForSchool(string id, int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? 'where = ()) returns TeachersResponse|error {
        string resourcePath = string `/schools/${getEncodedUri(id)}/teachers`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TeachersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of sections.
    #
    # + 'limit - Number of sections 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + 'where - Location 
    # + return - SectionsResponse or error 
    remote isolated function getSections(int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? 'where = ()) returns SectionsResponse|error {
        string resourcePath = string `/sections`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SectionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a specific section.
    #
    # + id - Section ID 
    # + return - SectionResponse or error 
    remote isolated function getSection(string id) returns SectionResponse|error {
        string resourcePath = string `/sections/${getEncodedUri(id)}`;
        SectionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the district for a section.
    #
    # + id - Section ID 
    # + return - DistrictResponse or error 
    remote isolated function getDistrictForSection(string id) returns DistrictResponse|error {
        string resourcePath = string `/sections/${getEncodedUri(id)}/district`;
        DistrictResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the school for a section
    #
    # + id - Section ID 
    # + return - SchoolResponse or error 
    remote isolated function getSchoolForSection(string id) returns SchoolResponse|error {
        string resourcePath = string `/sections/${getEncodedUri(id)}/school`;
        SchoolResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the students for a section.
    #
    # + id - Section ID 
    # + 'limit - Number of students 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + return - StudentsResponse or error 
    remote isolated function getStudentsForSection(string id, int? 'limit = (), string? startingAfter = (), string? endingBefore = ()) returns StudentsResponse|error {
        string resourcePath = string `/sections/${getEncodedUri(id)}/students`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        StudentsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the primary teacher for a section.
    #
    # + id - Section ID 
    # + return - TeacherResponse or error 
    remote isolated function getTeacherForSection(string id) returns TeacherResponse|error {
        string resourcePath = string `/sections/${getEncodedUri(id)}/teacher`;
        TeacherResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the teachers for a section.
    #
    # + id - Section ID 
    # + 'limit - Number of teachers 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + return - TeachersResponse or error 
    remote isolated function getTeachersForSection(string id, int? 'limit = (), string? startingAfter = (), string? endingBefore = ()) returns TeachersResponse|error {
        string resourcePath = string `/sections/${getEncodedUri(id)}/teachers`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TeachersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of students.
    #
    # + 'limit - Number of students 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + 'where - Location 
    # + return - StudentsResponse or error 
    remote isolated function getStudents(int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? 'where = ()) returns StudentsResponse|error {
        string resourcePath = string `/students`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        StudentsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a specific student.
    #
    # + id - Student ID 
    # + include - Include 
    # + return - StudentResponse or error 
    remote isolated function getStudent(string id, string? include = ()) returns StudentResponse|error {
        string resourcePath = string `/students/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        StudentResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the contacts for a student.
    #
    # + id - Contact ID 
    # + 'limit - Number of contacts 
    # + return - StudentContactsForStudentResponse or error 
    remote isolated function getContactsForStudent(string id, int? 'limit = ()) returns StudentContactsForStudentResponse|error {
        string resourcePath = string `/students/${getEncodedUri(id)}/contacts`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        StudentContactsForStudentResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the district for a student.
    #
    # + id - Student ID 
    # + return - DistrictResponse or error 
    remote isolated function getDistrictForStudent(string id) returns DistrictResponse|error {
        string resourcePath = string `/students/${getEncodedUri(id)}/district`;
        DistrictResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the primary school for a student.
    #
    # + id - Student ID 
    # + return - SchoolResponse or error 
    remote isolated function getSchoolForStudent(string id) returns SchoolResponse|error {
        string resourcePath = string `/students/${getEncodedUri(id)}/school`;
        SchoolResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the sections for a student.
    #
    # + id - Student ID 
    # + 'limit - Number of students 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + return - SectionsResponse or error 
    remote isolated function getSectionsForStudent(string id, int? 'limit = (), string? startingAfter = (), string? endingBefore = ()) returns SectionsResponse|error {
        string resourcePath = string `/students/${getEncodedUri(id)}/sections`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SectionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the teachers for a student.
    #
    # + id - Student ID 
    # + 'limit - Number of teachers 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + return - TeachersResponse or error 
    remote isolated function getTeachersForStudent(string id, int? 'limit = (), string? startingAfter = (), string? endingBefore = ()) returns TeachersResponse|error {
        string resourcePath = string `/students/${getEncodedUri(id)}/teachers`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TeachersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of teachers.
    #
    # + 'limit - Number of teachers 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + 'where - Location 
    # + return - TeachersResponse or error 
    remote isolated function getTeachers(int? 'limit = (), string? startingAfter = (), string? endingBefore = (), string? 'where = ()) returns TeachersResponse|error {
        string resourcePath = string `/teachers`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TeachersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a specific teacher.
    #
    # + id - Teacher ID 
    # + include - Include 
    # + return - TeacherResponse or error 
    remote isolated function getTeacher(string id, string? include = ()) returns TeacherResponse|error {
        string resourcePath = string `/teachers/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TeacherResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the district for a teacher.
    #
    # + id - Teacher ID 
    # + return - DistrictResponse or error 
    remote isolated function getDistrictForTeacher(string id) returns DistrictResponse|error {
        string resourcePath = string `/teachers/${getEncodedUri(id)}/district`;
        DistrictResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the grade levels for sections a teacher teaches.
    #
    # + id - Teacher ID 
    # + return - GradeLevelsResponse or error 
    remote isolated function getGradeLevelsForTeacher(string id) returns GradeLevelsResponse|error {
        string resourcePath = string `/teachers/${getEncodedUri(id)}/grade_levels`;
        GradeLevelsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves school info for a teacher.
    #
    # + id - Teacher ID 
    # + return - SchoolResponse or error 
    remote isolated function getSchoolForTeacher(string id) returns SchoolResponse|error {
        string resourcePath = string `/teachers/${getEncodedUri(id)}/school`;
        SchoolResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the sections for a teacher.
    #
    # + id - Teacher ID 
    # + 'limit - Number of sections 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + return - SectionsResponse or error 
    remote isolated function getSectionsForTeacher(string id, int? 'limit = (), string? startingAfter = (), string? endingBefore = ()) returns SectionsResponse|error {
        string resourcePath = string `/teachers/${getEncodedUri(id)}/sections`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SectionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the students for a teacher.
    #
    # + id - Teacher ID 
    # + 'limit - Number of students 
    # + startingAfter - Starting after 
    # + endingBefore - Ending before 
    # + return - StudentsResponse or error 
    remote isolated function getStudentsForTeacher(string id, int? 'limit = (), string? startingAfter = (), string? endingBefore = ()) returns StudentsResponse|error {
        string resourcePath = string `/teachers/${getEncodedUri(id)}/students`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        StudentsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
