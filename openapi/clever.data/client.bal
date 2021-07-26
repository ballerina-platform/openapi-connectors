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
import ballerina/url;
import ballerina/lang.'string;

# Configuration record for Clever Data API.
#
# + authConfig - Bearer token or OAuth2 refresh token grant configuration tokens
# + secureSocketConfig - Secure socket configuration
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# This is a generated connector for [Clever Data API v1.2](https://dev.clever.com/v1.2/docs/secure-sync) OpenAPI specification.
# Clever Data API provides the capability to retrieve information from Clever data store.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Clever account](https://clever.com/signup) and obtain tokens by following this [guide](https://dev.clever.com/v1.2/docs/getting-started).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.clever.com/v1.2") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Returns a list of student contacts.
    #
    # + 'limit - Number of contacts
    # + startingAfter - Starting after
    # + endingBefore - Ending before
    # + return - StudentContactsResponse or error
    remote isolated function getContacts(int? 'limit = (), string? startingAfter = (), string? endingBefore = ()) returns StudentContactsResponse|error {
        string  path = string `/contacts`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore};
        path = path + check getPathForQueryParam(queryParam);
        StudentContactsResponse response = check self.clientEp-> get(path, targetType = StudentContactsResponse);
        return response;
    }
    # Returns a specific student contact.
    #
    # + id - Contact ID
    # + return - StudentContactResponse or error
    remote isolated function getContact(string id) returns StudentContactResponse|error {
        string  path = string `/contacts/${id}`;
        StudentContactResponse response = check self.clientEp-> get(path, targetType = StudentContactResponse);
        return response;
    }
    # Returns the district for a student contact.
    #
    # + id - Contact ID
    # + return - DistrictResponse or error
    remote isolated function getDistrictForStudentContact(string id) returns DistrictResponse|error {
        string  path = string `/contacts/${id}/district`;
        DistrictResponse response = check self.clientEp-> get(path, targetType = DistrictResponse);
        return response;
    }
    # Returns the student for a student contact.
    #
    # + id - Contact ID
    # + return - StudentResponse or error
    remote isolated function getStudentForContact(string id) returns StudentResponse|error {
        string  path = string `/contacts/${id}/student`;
        StudentResponse response = check self.clientEp-> get(path, targetType = StudentResponse);
        return response;
    }
    # Returns a list of district admins.
    #
    # + startingAfter - Starting after
    # + endingBefore - Ending before
    # + showLinks - Show links
    # + return - DistrictAdminsResponse or error
    remote isolated function getDistrictAdmins(string? startingAfter = (), string? endingBefore = (), string? showLinks = ()) returns DistrictAdminsResponse|error {
        string  path = string `/district_admins`;
        map<anydata> queryParam = {"starting_after": startingAfter, "ending_before": endingBefore, "show_links": showLinks};
        path = path + check getPathForQueryParam(queryParam);
        DistrictAdminsResponse response = check self.clientEp-> get(path, targetType = DistrictAdminsResponse);
        return response;
    }
    # Returns a specific district admin.
    #
    # + id - District admin ID
    # + return - DistrictAdminResponse or error
    remote isolated function getDistrictAdmin(string id) returns DistrictAdminResponse|error {
        string  path = string `/district_admins/${id}`;
        DistrictAdminResponse response = check self.clientEp-> get(path, targetType = DistrictAdminResponse);
        return response;
    }
    # Returns a list of districts.
    #
    # + return - DistrictsResponse or error
    remote isolated function getDistricts() returns DistrictsResponse|error {
        string  path = string `/districts`;
        DistrictsResponse response = check self.clientEp-> get(path, targetType = DistrictsResponse);
        return response;
    }
    # Returns a specific district.
    #
    # + id - District ID
    # + include - Includes
    # + return - DistrictResponse or error
    remote isolated function getDistrict(string id, string? include = ()) returns DistrictResponse|error {
        string  path = string `/districts/${id}`;
        map<anydata> queryParam = {"include": include};
        path = path + check getPathForQueryParam(queryParam);
        DistrictResponse response = check self.clientEp-> get(path, targetType = DistrictResponse);
        return response;
    }
    # Returns the admins for a district.
    #
    # + id - District ID
    # + return - DistrictAdminsResponse or error
    remote isolated function getAdminsForDistrict(string id) returns DistrictAdminsResponse|error {
        string  path = string `/districts/${id}/admins`;
        DistrictAdminsResponse response = check self.clientEp-> get(path, targetType = DistrictAdminsResponse);
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
        string  path = string `/districts/${id}/schools`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        path = path + check getPathForQueryParam(queryParam);
        SchoolsResponse response = check self.clientEp-> get(path, targetType = SchoolsResponse);
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
        string  path = string `/districts/${id}/sections`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        path = path + check getPathForQueryParam(queryParam);
        SectionsResponse response = check self.clientEp-> get(path, targetType = SectionsResponse);
        return response;
    }
    # Returns the status of the district.
    #
    # + id - District ID
    # + return - DistrictStatusResponses or error
    remote isolated function getDistrictStatus(string id) returns DistrictStatusResponses|error {
        string  path = string `/districts/${id}/status`;
        DistrictStatusResponses response = check self.clientEp-> get(path, targetType = DistrictStatusResponses);
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
        string  path = string `/districts/${id}/students`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        path = path + check getPathForQueryParam(queryParam);
        StudentsResponse response = check self.clientEp-> get(path, targetType = StudentsResponse);
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
        string  path = string `/districts/${id}/teachers`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        path = path + check getPathForQueryParam(queryParam);
        TeachersResponse response = check self.clientEp-> get(path, targetType = TeachersResponse);
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
        string  path = string `/school_admins`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        path = path + check getPathForQueryParam(queryParam);
        SchoolAdminsResponse response = check self.clientEp-> get(path, targetType = SchoolAdminsResponse);
        return response;
    }
    # Returns a specific school admin.
    #
    # + id - School admin ID
    # + include - Include
    # + return - SchoolAdminResponse or error
    remote isolated function getSchoolAdmin(string id, string? include = ()) returns SchoolAdminResponse|error {
        string  path = string `/school_admins/${id}`;
        map<anydata> queryParam = {"include": include};
        path = path + check getPathForQueryParam(queryParam);
        SchoolAdminResponse response = check self.clientEp-> get(path, targetType = SchoolAdminResponse);
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
        string  path = string `/school_admins/${id}/schools`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore};
        path = path + check getPathForQueryParam(queryParam);
        SchoolsResponse response = check self.clientEp-> get(path, targetType = SchoolsResponse);
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
        string  path = string `/schools`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        path = path + check getPathForQueryParam(queryParam);
        SchoolsResponse response = check self.clientEp-> get(path, targetType = SchoolsResponse);
        return response;
    }
    # Returns a specific school.
    #
    # + id - School ID
    # + return - SchoolResponse or error
    remote isolated function getSchool(string id) returns SchoolResponse|error {
        string  path = string `/schools/${id}`;
        SchoolResponse response = check self.clientEp-> get(path, targetType = SchoolResponse);
        return response;
    }
    # Returns the district for a school.
    #
    # + id - School ID
    # + return - DistrictResponse or error
    remote isolated function getDistrictForSchool(string id) returns DistrictResponse|error {
        string  path = string `/schools/${id}/district`;
        DistrictResponse response = check self.clientEp-> get(path, targetType = DistrictResponse);
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
        string  path = string `/schools/${id}/sections`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        path = path + check getPathForQueryParam(queryParam);
        SectionsResponse response = check self.clientEp-> get(path, targetType = SectionsResponse);
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
        string  path = string `/schools/${id}/students`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        path = path + check getPathForQueryParam(queryParam);
        StudentsResponse response = check self.clientEp-> get(path, targetType = StudentsResponse);
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
        string  path = string `/schools/${id}/teachers`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        path = path + check getPathForQueryParam(queryParam);
        TeachersResponse response = check self.clientEp-> get(path, targetType = TeachersResponse);
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
        string  path = string `/sections`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        path = path + check getPathForQueryParam(queryParam);
        SectionsResponse response = check self.clientEp-> get(path, targetType = SectionsResponse);
        return response;
    }
    # Returns a specific section.
    #
    # + id - Section ID
    # + return - SectionResponse or error
    remote isolated function getSection(string id) returns SectionResponse|error {
        string  path = string `/sections/${id}`;
        SectionResponse response = check self.clientEp-> get(path, targetType = SectionResponse);
        return response;
    }
    # Returns the district for a section.
    #
    # + id - Section ID
    # + return - DistrictResponse or error
    remote isolated function getDistrictForSection(string id) returns DistrictResponse|error {
        string  path = string `/sections/${id}/district`;
        DistrictResponse response = check self.clientEp-> get(path, targetType = DistrictResponse);
        return response;
    }
    # Returns the school for a section
    #
    # + id - Section ID
    # + return - SchoolResponse or error
    remote isolated function getSchoolForSection(string id) returns SchoolResponse|error {
        string  path = string `/sections/${id}/school`;
        SchoolResponse response = check self.clientEp-> get(path, targetType = SchoolResponse);
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
        string  path = string `/sections/${id}/students`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore};
        path = path + check getPathForQueryParam(queryParam);
        StudentsResponse response = check self.clientEp-> get(path, targetType = StudentsResponse);
        return response;
    }
    # Returns the primary teacher for a section.
    #
    # + id - Section ID
    # + return - TeacherResponse or error
    remote isolated function getTeacherForSection(string id) returns TeacherResponse|error {
        string  path = string `/sections/${id}/teacher`;
        TeacherResponse response = check self.clientEp-> get(path, targetType = TeacherResponse);
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
        string  path = string `/sections/${id}/teachers`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore};
        path = path + check getPathForQueryParam(queryParam);
        TeachersResponse response = check self.clientEp-> get(path, targetType = TeachersResponse);
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
        string  path = string `/students`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        path = path + check getPathForQueryParam(queryParam);
        StudentsResponse response = check self.clientEp-> get(path, targetType = StudentsResponse);
        return response;
    }
    # Returns a specific student.
    #
    # + id - Student ID
    # + include - Include
    # + return - StudentResponse or error
    remote isolated function getStudent(string id, string? include = ()) returns StudentResponse|error {
        string  path = string `/students/${id}`;
        map<anydata> queryParam = {"include": include};
        path = path + check getPathForQueryParam(queryParam);
        StudentResponse response = check self.clientEp-> get(path, targetType = StudentResponse);
        return response;
    }
    # Returns the contacts for a student.
    #
    # + id - Contact ID
    # + 'limit - Number of contacts
    # + return - StudentContactsForStudentResponse or error
    remote isolated function getContactsForStudent(string id, int? 'limit = ()) returns StudentContactsForStudentResponse|error {
        string  path = string `/students/${id}/contacts`;
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        StudentContactsForStudentResponse response = check self.clientEp-> get(path, targetType = StudentContactsForStudentResponse);
        return response;
    }
    # Returns the district for a student.
    #
    # + id - Student ID
    # + return - DistrictResponse or error
    remote isolated function getDistrictForStudent(string id) returns DistrictResponse|error {
        string  path = string `/students/${id}/district`;
        DistrictResponse response = check self.clientEp-> get(path, targetType = DistrictResponse);
        return response;
    }
    # Returns the primary school for a student.
    #
    # + id - Student ID
    # + return - SchoolResponse or error
    remote isolated function getSchoolForStudent(string id) returns SchoolResponse|error {
        string  path = string `/students/${id}/school`;
        SchoolResponse response = check self.clientEp-> get(path, targetType = SchoolResponse);
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
        string  path = string `/students/${id}/sections`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore};
        path = path + check getPathForQueryParam(queryParam);
        SectionsResponse response = check self.clientEp-> get(path, targetType = SectionsResponse);
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
        string  path = string `/students/${id}/teachers`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore};
        path = path + check getPathForQueryParam(queryParam);
        TeachersResponse response = check self.clientEp-> get(path, targetType = TeachersResponse);
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
        string  path = string `/teachers`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore, "where": 'where};
        path = path + check getPathForQueryParam(queryParam);
        TeachersResponse response = check self.clientEp-> get(path, targetType = TeachersResponse);
        return response;
    }
    # Returns a specific teacher.
    #
    # + id - Teacher ID
    # + include - Include
    # + return - TeacherResponse or error
    remote isolated function getTeacher(string id, string? include = ()) returns TeacherResponse|error {
        string  path = string `/teachers/${id}`;
        map<anydata> queryParam = {"include": include};
        path = path + check getPathForQueryParam(queryParam);
        TeacherResponse response = check self.clientEp-> get(path, targetType = TeacherResponse);
        return response;
    }
    # Returns the district for a teacher.
    #
    # + id - Teacher ID
    # + return - DistrictResponse or error
    remote isolated function getDistrictForTeacher(string id) returns DistrictResponse|error {
        string  path = string `/teachers/${id}/district`;
        DistrictResponse response = check self.clientEp-> get(path, targetType = DistrictResponse);
        return response;
    }
    # Returns the grade levels for sections a teacher teaches.
    #
    # + id - Teacher ID
    # + return - GradeLevelsResponse or error
    remote isolated function getGradeLevelsForTeacher(string id) returns GradeLevelsResponse|error {
        string  path = string `/teachers/${id}/grade_levels`;
        GradeLevelsResponse response = check self.clientEp-> get(path, targetType = GradeLevelsResponse);
        return response;
    }
    # Retrieves school info for a teacher.
    #
    # + id - Teacher ID
    # + return - SchoolResponse or error
    remote isolated function getSchoolForTeacher(string id) returns SchoolResponse|error {
        string  path = string `/teachers/${id}/school`;
        SchoolResponse response = check self.clientEp-> get(path, targetType = SchoolResponse);
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
        string  path = string `/teachers/${id}/sections`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore};
        path = path + check getPathForQueryParam(queryParam);
        SectionsResponse response = check self.clientEp-> get(path, targetType = SectionsResponse);
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
        string  path = string `/teachers/${id}/students`;
        map<anydata> queryParam = {"limit": 'limit, "starting_after": startingAfter, "ending_before": endingBefore};
        path = path + check getPathForQueryParam(queryParam);
        StudentsResponse response = check self.clientEp-> get(path, targetType = StudentsResponse);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
