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
import ballerina/xmldata;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Every user in Litmos has a unique API key. Only Account Owners are able to view user record API keys, and access to operations via API are restricted by access levels.
    string aPIKey;
|};

# This is a generated connector for [SAP SuccessFactors Litmos API v1.0](https://api.sap.com/api/ScreeningHits/resource) OpenAPI specification.
# Litmos is a cloud-based solution that unifies virtual, classroom, mobile, and social learning. Our solutions empower training departments, sales and service leaders, safety and compliance managers, and HR teams to collaborate, author, globally distribute, and track web-based training courses, as well as schedule and track instructor-led courses. It automates formerly burdensome tasks so that teams can focus their energy on aligning training with the company's strategic agenda.
@display {label: "SAP SuccessFactors Litmos", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. Create and configure an API key credentials by following [this guide](https://support.litmos.com/hc/en-us/articles/227734667-Overview-Developer-API).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, http:ClientConfiguration clientConfig =  {}) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Get Achievements
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + sort - Field used to sort the records 
    # + dir - Direction to sort the records 
    # + search - String value used to the filter the records 
    # + since - Date-time 
    # + return - Success. 
    remote isolated function getAchievements(string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? sort = (), string? dir = (), string? search = (), string? since = ()) returns Achievements|error {
        string resourcePath = string `/achievements`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "sort": sort, "dir": dir, "search": search, "since": since};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Achievements response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of recent user import jobs
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'start - Record number where paging starts 
    # + 'limit - Total records to return (max 1000) 
    # + return - Success. 
    remote isolated function getaListofRecentUserImportJobs(string 'source, string? format = (), int? 'start = (), int? 'limit = ()) returns UserBulkImports|error {
        string resourcePath = string `/bulkimports`;
        map<anydata> queryParam = {"source": 'source, "format": format, "start": 'start, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserBulkImports response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Bulk import user records
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + sendmessage - set to "True" to send login emails to new users 
    # + skipfirstlogin - set to "True" to have users skip setting a password after logging in 
    # + return - Success. 
    remote isolated function bulkImportUsers(string 'source, string contentType, UserImports payload, string? format = (), boolean? sendmessage = (), boolean? skipfirstlogin = ()) returns UserBulkImport|error {
        string resourcePath = string `/bulkimports`;
        map<anydata> queryParam = {"source": 'source, "format": format, "sendmessage": sendmessage, "skipfirstlogin": skipfirstlogin};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        UserBulkImport response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the status of a user record import
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function gettheStatusofaUserImportJob(string bulkImportId, string 'source, string? format = ()) returns UserBulkImport|error {
        string resourcePath = string `/bulkimports/${getEncodedUri(bulkImportId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserBulkImport response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the list of user errors for an import
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + isAPI - Set to "false" to fetch import errors for an import performed from the user interface. Do not include the parameter unless the value is set to "false". 
    # + return - Success. 
    remote isolated function gettheUserImportErrors(string bulkImportId, string 'source, string? format = (), int? 'limit = (), int? 'start = (), boolean? isAPI = ()) returns InlineResponse200|error {
        string resourcePath = string `/bulkimports/${getEncodedUri(bulkImportId)}/usererrors`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "IsAPI": isAPI};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Bulk import course records
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function bulkImportCourses(string 'source, string contentType, CourseImports payload, string? format = ()) returns CourseBulkImport|error {
        string resourcePath = string `/bulkimports/courses`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        CourseBulkImport response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a list of collection records
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getaListofCollections(string 'source, string? format = (), int? 'limit = (), int? 'start = ()) returns Collections|error {
        string resourcePath = string `/collections`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Collections response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a Collection
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function createaCollection(string 'source, string contentType, Collection payload, string? format = ()) returns Collections|error {
        string resourcePath = string `/collections`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        Collections response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Create a Collection Listing
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function createaCollectionListing(string 'source, string contentType, Listing payload, string? format = ()) returns Listing|error {
        string resourcePath = string `/collectionlistings`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        Listing response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Collection Listings
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getCollectionListings(string collectionId, string 'source, string? format = (), int? 'limit = (), int? 'start = ()) returns Listings|error {
        string resourcePath = string `/collectionlistings/${getEncodedUri(collectionId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Listings response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get users added to a Listing
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function getUsersAddedtoaListing(string listingId, string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? search = ()) returns ListingUsers|error {
        string resourcePath = string `/collectionlistings/${getEncodedUri(listingId)}/users`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ListingUsers response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add users to a Listing
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function postUserstoaListing(string listingId, string 'source, string contentType, Users payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/collectionlistings/${getEncodedUri(listingId)}/users`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a User from a Listing
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function deleteaUserfromaListing(string listingId, string userId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/collectionlistings/${getEncodedUri(listingId)}/users/${getEncodedUri(userId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get Teams Added to a Listing
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getTeamsAddedtoaListing(string listingId, string 'source, string? format = (), int? 'limit = (), int? 'start = ()) returns Teams|error {
        string resourcePath = string `/collectionlistings/${getEncodedUri(listingId)}/teams`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Teams response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add a Team to a Listing
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function postaTeamtoaListing(string listingId, string teamId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/collectionlistings/${getEncodedUri(listingId)}/team/${getEncodedUri(teamId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove a Team from a Listing
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function removeATeamFromListing(string listingId, string teamId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/collectionlistings/${getEncodedUri(listingId)}/team/${getEncodedUri(teamId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Add Courses to a Collection
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Created. 
    remote isolated function addCoursestoaCollection(string collectionId, string 'source, string contentType, Body payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/collections/${getEncodedUri(collectionId)}/courses`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove a Course from a Collection
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function removeaCoursefromaCollection(string collectionId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/collections/${getEncodedUri(collectionId)}/courses`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Add LearningPaths to a Collection
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Created. 
    remote isolated function addLearningPathstoaCollection(string collectionId, string 'source, string contentType, Body2 payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/collections/${getEncodedUri(collectionId)}/learningpaths`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove a Learning Path from a Collection
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function removeaLearningPathfromaCollection(string collectionId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/collections/${getEncodedUri(collectionId)}/learningpaths`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Delete Collection
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function deleteCollection(string collectionId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/collection/${getEncodedUri(collectionId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Delete a Collection Listing
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function deleteCollectionListing(string collectionId, string listingId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/collectionlistings/${getEncodedUri(collectionId)}/${getEncodedUri(listingId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get a List of Courses
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + search - String value used to the filter the records 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getaListofCourses(string 'source, string? format = (), int? 'limit = (), string? search = (), int? 'start = ()) returns Courses|error {
        string resourcePath = string `/courses`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "search": search, "start": 'start};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Courses response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Course
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function getCourse(string courseId, string 'source, string? format = ()) returns Course|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Course response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Course
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function deleteCourse(string courseId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get Course Details
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function getCourseDetails(string courseId, string 'source, string? format = ()) returns InlineResponse2001|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/details`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List All Users Assigned to a Course
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function listAllUsersAssignedtoaCourse(string courseId, string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? search = ()) returns InlineResponse2002|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/users`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all Modules in a Course
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function listAllModulesInaCourse(string courseId, string 'source, string? format = (), int? 'limit = (), string? search = ()) returns Modules|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Modules response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List All Course Results for All Users Since a Specific Date
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function listAllCourseResultsforAllUsersSinceaSpecificDate(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse2003|error {
        string resourcePath = string `/results/details`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2003 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Custom Fields for a Course
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function getCustomFieldsforaCourse(string courseId, string 'source, string? format = ()) returns InlineResponse2004|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/coursecustomfields`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2004 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Course Custom Fields
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function getCourseCustomFields(string 'source, string? format = ()) returns CourseCustomFields|error {
        string resourcePath = string `/coursecustomfields`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CourseCustomFields response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Value for Custom Field Id Across All Courses
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function getCourseCustomFieldValueonAllCourses(string customFieldId, string 'source, string? format = ()) returns CourseCustomField|error {
        string resourcePath = string `/coursecustomfields/${getEncodedUri(customFieldId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CourseCustomField response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Modules
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getModules(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse2005|error {
        string resourcePath = string `/org/modules`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2005 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Courses
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getCourses(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse2006|error {
        string resourcePath = string `/org/courses`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2006 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Learning Paths
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getLearningPaths(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse2007|error {
        string resourcePath = string `/org/learningpaths`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2007 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Modules Results
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getModulesResults(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse2008|error {
        string resourcePath = string `/org/modules/results`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2008 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Course Results
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getCourseResults(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse2009|error {
        string resourcePath = string `/org/results/details`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2009 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Learning Path Results
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getLearningPathResults(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse20010|error {
        string resourcePath = string `/org/learningpaths/results`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20010 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Achievements
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getAchievements1(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse20011|error {
        string resourcePath = string `/org/achievements`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20011 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Course Modules
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getCourseModules(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse20012|error {
        string resourcePath = string `/org/courses/modules`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20012 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Learning Path Courses
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getLearningPathCourses(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse20013|error {
        string resourcePath = string `/org/learningpaths/courses`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20013 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get User Course Assignments
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getUserCourseAssignments(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse20014|error {
        string resourcePath = string `/org/users/courses`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20014 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get User Learning Path Assignments
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getUserLearningPathAssignments(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse20015|error {
        string resourcePath = string `/org/learningpaths/users`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20015 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Teams
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getTeams(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse20016|error {
        string resourcePath = string `/org/teams`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20016 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get  Team Users
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getTeamUsers(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse20017|error {
        string resourcePath = string `/org/teams/users`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20017 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Team Courses
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getTeamCourses(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse20018|error {
        string resourcePath = string `/org/teams/courses`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20018 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get  Team Learning Paths
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getTeamLearningPaths(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse20019|error {
        string resourcePath = string `/org/teams/learningpaths`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20019 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get User Logins
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getUserLogins(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse20020|error {
        string resourcePath = string `/org/users/logins`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20020 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get User Details
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getUserDetails(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse20020|error {
        string resourcePath = string `/org/users/details`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20020 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a List of Future ILT Sessions within Courses Enabled for Ecommerce
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getaListofFutureILTSessionswithinCoursesEnabledforEcommerce(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns http:Response|error {
        string resourcePath = string `/org/ecommerce/coursesessions`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a List of Courses Enabled for Ecommerce
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getaListofCoursesEnabledforEcommerce(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse20021|error {
        string resourcePath = string `/org/ecommerce/courses`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20021 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a List of Learning Paths Enabled for Ecommerce
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getaListofLearningPathsEnabledforEcommerce(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse20022|error {
        string resourcePath = string `/org/ecommerce/learningpaths`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20022 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Total Badges and Points For User
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function getTotalBadgesandPointsForUser(string userId, string 'source, string? format = ()) returns InlineResponse20023|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/gamificationsummary`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20023 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Total Badges Earned By a User
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getTotalBadgesForUser(string userId, string 'source, string? format = (), int? 'limit = (), int? 'start = ()) returns InlineResponse20024|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/badges`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20024 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Badges and Points Earned By User
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + return - Success. 
    remote isolated function getBadgesandPointsEarnedByUser(string userId, string 'source, string? format = (), int? 'limit = ()) returns http:Response|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/gamificationdetails`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Badges and Points Earned by a Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getBadgesandPointsEarnedbyaTeam(string teamId, string 'source, string? format = (), int? 'limit = (), int? 'start = ()) returns http:Response|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/gamificationdetails`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Reset Badges and Points For  a User
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function resetBadgesandPointsForaUser(string userId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/gamificationreset`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a List of Future Sessions for an ILT Module
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + sort - Field used to sort the records 
    # + dir - Direction to sort the records 
    # + search - String value used to the filter the records 
    # + since - Date-time 
    # + return - Success. 
    remote isolated function getaListofFutureSessionsforanILTModule(string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? sort = (), string? dir = (), string? search = (), string? since = ()) returns http:Response|error {
        string resourcePath = string `/sessions/future`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "sort": sort, "dir": dir, "search": search, "since": since};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a List of Past Sessions for an ILT Module
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + sort - Field used to sort the records 
    # + dir - Direction to sort the records 
    # + search - String value used to the filter the records 
    # + since - Date-time 
    # + return - Success. 
    remote isolated function getaListofPastSessionsforanILTModule(string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? sort = (), string? dir = (), string? search = (), string? since = ()) returns http:Response|error {
        string resourcePath = string `/sessions/past`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "sort": sort, "dir": dir, "search": search, "since": since};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a List of all ILT Modules in a Course
    #
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function getaListofallILTModulesinaCourse(string courseId, string 'source, int? 'limit = (), int? 'start = (), string? format = ()) returns http:Response|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules/ILT`;
        map<anydata> queryParam = {"limit": 'limit, "start": 'start, "source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a List of Sessions in an ILT Module
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getaListofSessionsinanILTModule(string courseId, string moduleId, string 'source, string? format = (), int? 'limit = (), int? 'start = ()) returns http:Response|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules/${getEncodedUri(moduleId)}/sessions`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a New ILT Session for a Module
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Created. 
    remote isolated function createaNewILTSessionforaModule(string courseId, string moduleId, string 'source, string contentType, Session payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules/${getEncodedUri(moduleId)}/sessions`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a Specific Session in an ILT Module
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function getaSpecificSessioninanILTModule(string courseId, string moduleId, string sessionId, string 'source, string? format = ()) returns http:Response|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules/${getEncodedUri(moduleId)}/sessions/${getEncodedUri(sessionId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a Session in an ILT Module
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function updateaSessioninanILTModule(string courseId, string moduleId, string sessionId, string 'source, string contentType, Session payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules/${getEncodedUri(moduleId)}/sessions/${getEncodedUri(sessionId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a Session in an ILT Module.
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    remote isolated function deleteaSessioninanILTModule(string courseId, string moduleId, string sessionId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules/${getEncodedUri(moduleId)}/sessions/${getEncodedUri(sessionId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get a List of All Instructors
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function getaListofAllInstructors(string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? search = ()) returns http:Response|error {
        string resourcePath = string `/instructors`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a List of Sessions for a Specific Instructor
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getaListofSessionsforaSpecificInstructor(string instructorId, string 'source, string? format = (), int? 'limit = (), int? 'start = ()) returns http:Response|error {
        string resourcePath = string `/instructors/${getEncodedUri(instructorId)}/sessions`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Session Roll Call for a Session
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getSessionRollCallforaSession(string courseId, string moduleId, string sessionId, string 'source, string? format = (), int? 'limit = (), int? 'start = ()) returns http:Response|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules/${getEncodedUri(moduleId)}/sessions/${getEncodedUri(sessionId)}/rollcall`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Mark an ILT Session Complete and Add Score
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function markanILTSessionCompleteandAddScore(string courseId, string moduleId, string sessionId, string 'source, string contentType, EventUsers payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules/${getEncodedUri(moduleId)}/sessions/${getEncodedUri(sessionId)}/rollcall`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a list of Users Registered to a Session
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getalistofUsersRegisteredtoaSession(string courseId, string moduleId, string 'source, string? format = (), int? 'limit = (), int? 'start = ()) returns http:Response|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules/${getEncodedUri(moduleId)}/registration`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Register a User to a Session
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function registeraUsertoaSession(string courseId, string moduleId, string sessionId, string userId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules/${getEncodedUri(moduleId)}/sessions/${getEncodedUri(sessionId)}/users/${getEncodedUri(userId)}/register`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Register a List of Users to a Session
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function registeraListofUserstoaSession(string courseId, string moduleId, string sessionId, string 'source, string contentType, Users payload, string? format = ()) returns UserSessionRegistrationStatus|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules/${getEncodedUri(moduleId)}/sessions/${getEncodedUri(sessionId)}/users/register`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        UserSessionRegistrationStatus response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get user Attendance for a Session
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getuserAttendanceforaSession(string courseId, string moduleId, string sessionId, string 'source, string? format = (), int? 'limit = (), int? 'start = ()) returns http:Response|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules/${getEncodedUri(moduleId)}/sessions/${getEncodedUri(sessionId)}/attendance`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Mark Attendance for a User Registered to a Session
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function markAttendanceforUsersRegisteredtoaSession(string courseId, string moduleId, string sessiondayId, string userId, string attended, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules/${getEncodedUri(moduleId)}/sessiondays/${getEncodedUri(sessiondayId)}/users/${getEncodedUri(userId)}/attended/${getEncodedUri(attended)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get All Learning Paths
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function getAllLearningPaths(string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? search = ()) returns LearningPaths|error {
        string resourcePath = string `/learningpaths`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LearningPaths response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a learning path
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function getaSpecificLearningPath(string learningpathId, string 'source, string? format = ()) returns LearningPath|error {
        string resourcePath = string `/learningpaths/${getEncodedUri(learningpathId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LearningPath response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Learning Path
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success 
    remote isolated function deleteLearningPath(string learningpathId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/learningpaths/${getEncodedUri(learningpathId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get a List of Courses in a Learning Path
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function getaListofCoursesinaLearningPath(string learningpathId, string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? search = ()) returns http:Response|error {
        string resourcePath = string `/learningpaths/${getEncodedUri(learningpathId)}/courses`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a List of Users Assigned to a Learning Path
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function getaListofUsersAssignedtoaLearningPath(string learningpathId, string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? search = ()) returns http:Response|error {
        string resourcePath = string `/learningpaths/${getEncodedUri(learningpathId)}/users`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Learning Paths Assigned to a Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function getLearningPathsAssignedtoaTeam(string teamId, string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? search = ()) returns LearningPaths|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/learningpaths`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LearningPaths response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Assign a List of Learning Paths to Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function assignaListofLearningPathstoTeam(string teamId, string 'source, string contentType, Body4 payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/learningpaths`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unassign a List of Learning Paths from Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function unassignaListofLearningPathsfromTeam(string teamId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/learningpaths`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get a Module
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function getaModule(string moduleId, string 'source, string? format = ()) returns Module|error {
        string resourcePath = string `/modules/${getEncodedUri(moduleId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Module response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a SCORM/Tin Can Module
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function updateascormTincanmodule(string moduleId, string 'source, string contentType, Module payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/modules/${getEncodedUri(moduleId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Module
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success 
    remote isolated function deleteModule(string moduleId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/modules/${getEncodedUri(moduleId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Mark a Module Complete
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function markaModuleComplete(string moduleId, string 'source, string contentType, ModuleResult payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/results/modules/${getEncodedUri(moduleId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Create a SCORM/Tin Can Module
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function createascormTincanmodule(string 'source, string contentType, Module payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/modules`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Copy SCORM/Tin Can Module to a Course
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function copyscormTincanmoduletoacourse(string courseId, string 'source, string contentType, Modules payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules/copy`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Link SCORM/Tin Can Module to a Course
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function linkscormTincanmoduletoacourse(string courseId, string 'source, string contentType, Modules payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules/link`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Mirror SCORM/Tin Can Module to a Course
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function mirrorscormTincanmoduletoacourse(string courseId, string 'source, string contentType, Modules payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules/mirror`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove SCORM/Tin Can Module from a Course
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function removescormTincanmodulefromacourse(string courseId, string moduleId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/courses/${getEncodedUri(courseId)}/modules/${getEncodedUri(moduleId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get a Token
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function getaToken(string tokenId, string 'source, string? format = ()) returns Token|error {
        string resourcePath = string `/tokens/${getEncodedUri(tokenId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Token response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get A List of Tokens
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function getAListofTokens(string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? search = ()) returns Tokens|error {
        string resourcePath = string `/tokens`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Tokens response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a Token
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function updateaToken(string 'source, string contentType, Tokens payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/tokens`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Create a Token
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function createaToken(string 'source, string contentType, Tokens payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/tokens`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Actions Activity
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getActionsActivity(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns ActionActivitys|error {
        string resourcePath = string `/org/activities/actions`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ActionActivitys response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Assignments Activity
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getAssignmentsActivity(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns AssignmentActivitys|error {
        string resourcePath = string `/org/activities/assignments`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AssignmentActivitys response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Content Activity
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getContentActivity(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns ContentActivitys|error {
        string resourcePath = string `/org/activities/content`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ContentActivitys response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Login Activity
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getLoginActivity(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns LoginActivitys|error {
        string resourcePath = string `/org/activities/logins`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LoginActivitys response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Settings Activity
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + return - Success. 
    remote isolated function getSettingsActivity(string 'source, string since, string to, string? format = (), int? 'limit = (), int? 'start = ()) returns SettingsActivitys|error {
        string resourcePath = string `/org/activities/settings`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "since": since, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SettingsActivitys response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List of Users
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + sort - Field used to sort the records 
    # + dir - Direction to sort the records 
    # + search - String value used to the filter the records 
    # + showInactive - boolean value used to the filter active/inactive records 
    # + return - Success. 
    remote isolated function listofUsers(string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? sort = (), string? dir = (), string? search = (), boolean? showInactive = ()) returns InlineResponse20025|error {
        string resourcePath = string `/users`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "sort": sort, "dir": dir, "search": search, "showInactive": showInactive};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20025 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create User
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + sendmessage - set to "True" to send login emails to new users 
    # + skipfirstlogin - set to "True" to have users skip setting a password after logging in 
    # + return - Success. 
    remote isolated function createUser(string 'source, User payload, string? format = (), boolean? sendmessage = (), boolean? skipfirstlogin = ()) returns http:Response|error {
        string resourcePath = string `/users`;
        map<anydata> queryParam = {"source": 'source, "format": format, "sendmessage": sendmessage, "skipfirstlogin": skipfirstlogin};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # List of Users With Summary of User Pagination Details
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + sort - Field used to sort the records 
    # + dir - Direction to sort the records 
    # + search - String value used to the filter the records 
    # + showInactive - boolean value used to the filter active/inactive records 
    # + return - Success. 
    remote isolated function listofUsersPaginated(string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? sort = (), string? dir = (), string? search = (), boolean? showInactive = ()) returns UserCollection|error {
        string resourcePath = string `/users/paginated`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "sort": sort, "dir": dir, "search": search, "showInactive": showInactive};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserCollection response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get User by User Id
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function getUserbyUserId(string userId, string 'source, string? format = ()) returns User|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        User response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update User
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function updateUser(string userId, string 'source, string contentType, User payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a User
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function deleteaUser(string userId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get a List of Users with Details
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + sort - Field used to sort the records 
    # + dir - Direction to sort the records 
    # + search - String value used to the filter the records 
    # + since - Date-time 
    # + return - Success. 
    remote isolated function getaListofUserswithDetails(string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? sort = (), string? dir = (), string? search = (), string? since = ()) returns InlineResponse20026|error {
        string resourcePath = string `/users/details`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "sort": sort, "dir": dir, "search": search, "since": since};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20026 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Advanced Custom Fields for User
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function getAdvancedCustomFieldsforUser(string userId, string 'source, string? format = ()) returns InlineResponse20027|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/usercustomfields`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20027 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add Advanced Custom Fields for User
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function addAdvancedCustomFieldsforUser(string userId, string 'source, string contentType, Body5 payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/usercustomfields`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # List All Courses Assigned to a User
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function listAllCoursesAssignedtoaUser(string userId, string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? search = ()) returns InlineResponse20028|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/courses`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20028 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Assign Courses to User
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function assignCoursestoUser(string userId, string 'source, string contentType, Body6 payload, string? format = (), boolean? sendmessage = ()) returns http:Response|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/courses`;
        map<anydata> queryParam = {"source": 'source, "format": format, "sendmessage": sendmessage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reset Course Results
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function resetCourseResults(string userId, string courseId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/courses/${getEncodedUri(courseId)}/reset`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Unassign Course from User
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function unassignCoursefromUser(string userId, string courseId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/courses/${getEncodedUri(courseId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get Courses Assigned For a List of Users
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function getCourseAssignmentsForListOfUsers(string 'source, string contentType, Body7 payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/users/courses`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a List of Learning Paths Assigned to a User
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function getaListofLearningPathsAssignedtoaUser(string userId, string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? search = ()) returns InlineResponse20029|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/learningpaths`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20029 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Assign Learning Paths to User
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function assignLearningPathsToUser(string userId, string 'source, string contentType, Body8 payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/learningpaths`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Un-Assign Users from a Learning Path
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function unAssignusersfromalearningpath(string userId, string learningpathId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/learningpaths/${getEncodedUri(learningpathId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get a list of All Teams a User is Assigned to
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function getalistofAllTeamsaUserisAssignedto(string userId, string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? search = ()) returns Teams|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/teams`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Teams response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Assign a User to a List of Teams
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + sendmessage - set to "True" to send login emails to new users 
    # + return - Success. 
    remote isolated function assignaUsertoaListofTeams(string userId, string 'source, string contentType, Teams payload, string? format = (), boolean? sendmessage = ()) returns http:Response|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/teams`;
        map<anydata> queryParam = {"source": 'source, "format": format, "sendmessage": sendmessage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unassign a User from All Teams
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function unassignaUserfromAllTeams(string userId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/teams`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Add a Statement
    #
    # + return - Ok 
    remote isolated function addaStatement(string contentType, string litmosDomain, string dBinstance, string payload) returns json|error {
        string resourcePath = string `/${getEncodedUri(litmosDomain)}/${getEncodedUri(dBinstance)}/statements`;
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Update a Statement
    #
    # + return - No Content 
    remote isolated function updateaStatement(string contentType, string litmosDomain, string dBinstance, string statementId, string payload) returns http:Response|error {
        string resourcePath = string `/${getEncodedUri(litmosDomain)}/${getEncodedUri(dBinstance)}/statements/statementID=${getEncodedUri(statementId)}`;
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a Statement
    #
    # + return - OK 
    remote isolated function getaStatement(string litmosDomain, string dBinstance, string statementId) returns json|error {
        string resourcePath = string `/${getEncodedUri(litmosDomain)}/${getEncodedUri(dBinstance)}/statementID=${getEncodedUri(statementId)}`;
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a List of all Courses Assigned to Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function getaListofallCoursesAssignedtoTeam(string teamId, string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? search = ()) returns Courses|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/courses`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Courses response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Assign a List of Courses to Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function assignaListofCoursestoTeam(string teamId, string 'source, string contentType, Body9 payload, string? format = (), boolean? includesubteams = ()) returns http:Response|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/courses`;
        map<anydata> queryParam = {"source": 'source, "format": format, "includesubteams": includesubteams};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unassign a List of Courses from Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function unassignaListofCoursesfromTeam(string teamId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/courses`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get Team Administrators for a Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function getTeamAdministratorsforaTeam(string teamId, string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? search = ()) returns InlineResponse20030|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/admins`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20030 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Promote a User to Team Admin for a Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function promoteaUsertoTeamAdminforaTeam(string teamId, string userId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/admins/${getEncodedUri(userId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Demote a Team Administrator on a Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function demoteaTeamAdministratoronaTeam(string teamId, string userId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/admins/${getEncodedUri(userId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get Team Leaders for a Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function getTeamLeadersforaTeam(string teamId, string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? search = ()) returns InlineResponse20031|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/leaders`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20031 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Promote a User to Team Leader for a Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function promoteaUsertoTeamLeaderforaTeam(string teamId, string userId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/leaders/${getEncodedUri(userId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Demote a Team Leader on a Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function demoteaTeamLeaderonaTeam(string teamId, string userId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/leaders/${getEncodedUri(userId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get Users in a Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function getUsersinaTeam(string teamId, string 'source, string? format = (), int? 'limit = (), string? search = ()) returns InlineResponse20030|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/users`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20030 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Assign Users to a Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + sendmessage - set to "True" to send login emails to new users 
    # + return - Created. 
    remote isolated function assignUserstoaTeam(string teamId, string 'source, string contentType, Body10 payload, string? format = (), boolean? sendmessage = ()) returns http:Response|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/users`;
        map<anydata> queryParam = {"source": 'source, "format": format, "sendmessage": sendmessage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unassign Users from a Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function unassignUsersfromaTeam(string teamId, string userId, string 'source, string contentType, string? format = ()) returns http:Response|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/users/${getEncodedUri(userId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get a List of All Teams
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + 'start - Record number where paging starts 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function getaListofAllTeams(string 'source, string? format = (), int? 'limit = (), int? 'start = (), string? search = ()) returns Teams|error {
        string resourcePath = string `/teams`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "start": 'start, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Teams response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Created. 
    remote isolated function createaTeam(string 'source, string contentType, Team payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/teams`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function getaTeam(string teamId, string 'source, string? format = ()) returns Team|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Team response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get SubTeam Id
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + 'limit - Total records to return (max 1000) 
    # + search - String value used to the filter the records 
    # + return - Success. 
    remote isolated function getSubTeamId(string teamId, string 'source, string? format = (), int? 'limit = (), string? search = ()) returns http:Response|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/teams`;
        map<anydata> queryParam = {"source": 'source, "format": format, "limit": 'limit, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a Sub-Team
    #
    # + 'source - Custom identifier used to identify an API user, API program, etc. 
    # + format - set to "json" if the response body is to be formatted in JavaScript Object Notation 
    # + return - Success. 
    remote isolated function createasubTeam(string teamId, string 'source, string contentType, Team payload, string? format = ()) returns http:Response|error {
        string resourcePath = string `/teams/${getEncodedUri(teamId)}/teams`;
        map<anydata> queryParam = {"source": 'source, "format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType, "APIKey": self.apiKeyConfig.aPIKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        xml? xmlBody = check xmldata:fromJson(jsonBody);
        request.setPayload(xmlBody, "application/xml");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
