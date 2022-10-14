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
    string refreshUrl = "https://accounts.zoho.com/oauth/v2/token";
|};

# This is a generated connector for [Zoho People](https://www.zoho.com/people/overview.html) OpenAPI specification.
# Zoho People API provides the capability to integrate HR modules with third-party applications. With Zoho People API, you can extract employees' data and form data in XML or JSON format to develop new applications or integrate with your existing business applications.
@display {label: "Zoho People", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Zoho People account](https://www.zoho.com/people/) and obtain tokens by following [this guide](https://www.zoho.com/people/oauth-steps.html).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://people.zoho.com/people/api") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Add a record to the form.
    #
    # + inputType - Type of inputs(json or xml) 
    # + formLinkName - Form Lable Name 
    # + payload - Input data in stringify JSON format or XML format 
    # + return - Success 
    remote isolated function insertRecord(string inputType, string formLinkName, InputData payload) returns FormRecordResponse|error {
        string resourcePath = string `/forms/${getEncodedUri(inputType)}/${getEncodedUri(formLinkName)}/insertRecord`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        FormRecordResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Modify the field values of the specified record.
    #
    # + inputType - Type of inputs(json or xml) 
    # + formLinkName - Form Lable Name 
    # + recordId - Specifies the record Id of the record being fetched. 
    # + payload - Input data in stringify JSON format or XML format 
    # + return - Success 
    remote isolated function updateRecord(string inputType, string formLinkName, int recordId, InputData payload) returns FormRecordResponse|error {
        string resourcePath = string `/forms/${getEncodedUri(inputType)}/${getEncodedUri(formLinkName)}/updateRecord`;
        map<anydata> queryParam = {"recordId": recordId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        FormRecordResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Add various departments one by one
    #
    # + xmlData - Input data in stringify XML format 
    # + return - Success 
    remote isolated function addDepartment(string xmlData) returns DepartmentResponse|error {
        string resourcePath = string `/department/records`;
        map<anydata> queryParam = {"xmlData": xmlData};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        DepartmentResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Fetch bulk records along with its tabular section details from particular forms. (maximum:200 records per api calls)
    #
    # + formLinkName - Form Lable Name 
    # + sIndex - starting index of the records to fetch (record index starts from 1) 
    # + 'limit - number of records to be fetched in the current request (maximum 200 records) 
    # + searchColumn - Search EMPLOYEEID or EMPLOYEEMAILALIAS 
    # + searchValue - Search Employeeid of the employee or the Employee MailID 
    # + modifiedtime - To fetch records added & modified after the given time . value should be  timestamp in milliseconds 
    # + return - Success 
    remote isolated function getBulkRecords(string formLinkName, int? sIndex = (), int? 'limit = (), string? searchColumn = (), string? searchValue = (), int? modifiedtime = ()) returns Records|error {
        string resourcePath = string `/forms/${getEncodedUri(formLinkName)}/getRecords`;
        map<anydata> queryParam = {"sIndex": sIndex, "limit": 'limit, "SearchColumn": searchColumn, "SearchValue": searchValue, "modifiedtime": modifiedtime};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Records response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Display the record of a specific form indexed using a Record ID
    #
    # + formLinkName - Form Lable Name 
    # + recordId - Specifies the record Id of the record being fetched. The record Id can be identified using the getBulkRecords operation. 
    # + return - Success 
    remote isolated function getSingleRecord(string formLinkName, int recordId) returns Records|error {
        string resourcePath = string `/forms/${getEncodedUri(formLinkName)}/getDataByID`;
        map<anydata> queryParam = {"recordId": recordId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Records response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fetch all the record of a specific form indexed using a Record ID by section-wise
    #
    # + formLinkName - Form Lable Name 
    # + recordId - Specifies the record Id of the record being fetched. The record Id can be identified using the getBulkRecords operation. 
    # + return - Success 
    remote isolated function getRecordByID(string formLinkName, int recordId) returns Records|error {
        string resourcePath = string `/forms/${getEncodedUri(formLinkName)}/getRecordByID`;
        map<anydata> queryParam = {"recordId": recordId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Records response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the list of forms and its details available in your Zoho People account.
    #
    # + return - Success 
    remote isolated function getForms() returns FormDetailResponse|error {
        string resourcePath = string `/forms`;
        FormDetailResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add leave records using Add Leave API
    #
    # + payload - Input data in stringify JSON format 
    # + return - Success 
    remote isolated function addLeave(InputData payload) returns FormRecordResponse|error {
        string resourcePath = string `/forms/json/leave/insertRecord`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        FormRecordResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # To modify an employee's leave balance
    #
    # + dateFormat - Specify the date format (Org date format will be considered if nothing is specified) 
    # + payload - Balance data to insert in Json string format 
    # + return - Success 
    remote isolated function addLeaveBalance(BalanceData payload, string? dateFormat = ()) returns BalanceDataResponse|error {
        string resourcePath = string `/leave/addBalance`;
        map<anydata> queryParam = {"dateFormat": dateFormat};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        BalanceDataResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch the record of leave from indexed using a Record ID
    #
    # + recordId - Specifies the record Id of the leave record being fetched. The record Id can be identified using the fetch Records API. 
    # + return - Success 
    remote isolated function getSingleLeaveRecord(int recordId) returns LeaveDetail|error {
        string resourcePath = string `/forms/leave/getDataByID`;
        map<anydata> queryParam = {"recordId": recordId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        LeaveDetail response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get leave types of a specific employee
    #
    # + userId - Employee Id/Employee MailId/Record Id of the Employee 
    # + return - Success 
    remote isolated function getLeaveTypes(string userId) returns LeaveTypes|error {
        string resourcePath = string `/leave/getLeaveTypeDetails`;
        map<anydata> queryParam = {"userId": userId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        LeaveTypes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fetch specific holidays of any employees using their employee ID, email ID and record ID parameters.
    #
    # + userId - Employee Id/Employee MailId/Record Id of the Employee 
    # + return - Success 
    remote isolated function getHolidays(string userId) returns Holidays|error {
        string resourcePath = string `/leave/getHolidays`;
        map<anydata> queryParam = {"userId": userId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Holidays response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fetch the holidays of a location, shift or for an employee.
    #
    # + location - Location name 
    # + shift - Shift name 
    # + employee - Emp ID or Email ID or Erecno of the employee 
    # + upcoming - To get the holidays for the next 365 days 
    # + 'from - From date 
    # + to - To date 
    # + dateFormat - Date format used to specify From and To as String 
    # + return - Success 
    remote isolated function getAllHolidays(string? location = (), string? shift = (), string? employee = (), boolean? upcoming = (), string? 'from = (), string? to = (), string? dateFormat = ()) returns AllHolidays|error {
        string resourcePath = string `/leave/v2/holidays/get`;
        map<anydata> queryParam = {"location": location, "shift": shift, "employee": employee, "upcoming": upcoming, "from": 'from, "to": to, "dateFormat": dateFormat};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AllHolidays response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get user report for current leave year.
    #
    # + employee - Erecno of the employee 
    # + to - Report till date of the current year 
    # + return - Success 
    remote isolated function getLeaveReportOfUser(int employee, string? to = ()) returns LeaveReport|error {
        string resourcePath = string `/v2/leavetracker/reports/user`;
        map<anydata> queryParam = {"employee": employee, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        LeaveReport response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add case
    #
    # + categoryId - Specify the category ID 
    # + subject - Specify the subject of the case 
    # + description - Specify the description of the case 
    # + return - Success 
    remote isolated function addCase(int categoryId, string subject, string? description = ()) returns CreatedCase|error {
        string resourcePath = string `/hrcases/addcase`;
        map<anydata> queryParam = {"categoryId": categoryId, "subject": subject, "description": description};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        CreatedCase response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # View case details
    #
    # + recordId - Specify the record ID of the case 
    # + return - Success 
    remote isolated function viewCaseDetails(int recordId) returns CaseDetailsResponse|error {
        string resourcePath = string `/hrcases/viewcase`;
        map<anydata> queryParam = {"recordId": recordId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CaseDetailsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List all case details
    #
    # + index - Specify the index of the listing 
    # + status - String of status IDs separated by (,) comma - (Open- "1", In Progress- "2", Awaiting action from Requestor- "3", On Hold- "4", Closed- "5") - empty for all status 
    # + categoryId - Category IDs separated by (,) comma 
    # + query - Specify the query string of the case 
    # + requestorErecno - Employee record IDs separated by (,) comma 
    # + periodOfTime - Send single time limit(Today - 0, Yesterday - 1, Past 7 days - 2, Past 30 days - 3) 
    # + return - Success 
    remote isolated function getAllCases(int index, string? status = (), string? categoryId = (), string? query = (), string? requestorErecno = (), int? periodOfTime = ()) returns CaseList|error {
        string resourcePath = string `/hrcases/getAllCases`;
        map<anydata> queryParam = {"index": index, "status": status, "categoryId": categoryId, "query": query, "requestorErecno": requestorErecno, "periodOfTime": periodOfTime};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CaseList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List categories that a user case raise query to
    #
    # + return - Success 
    remote isolated function viewListOfCategories() returns CaseCategory|error {
        string resourcePath = string `/hrcases/listCategory`;
        CaseCategory response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Trigger onboarding for an existing candidate or employee
    #
    # + onboardingType - Select either one type for onboarding - `Employee` or `Candidate` 
    # + userId - Specify the record ID of the candidate employee 
    # + return - Success​ 
    remote isolated function triggerOnboarding(string onboardingType, int userId) returns OnboardingResponse|error {
        string resourcePath = string `/${getEncodedUri(onboardingType)}/triggerOnboarding`;
        map<anydata> queryParam = {"userId": userId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        OnboardingResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Import bulk check-in and check-out details of the employees
    #
    # + dateFormat - Format for date (Eg- yyyy-MM-dd HH:mm:ss) 
    # + payload - Input data in stringify JSON array format 
    # + return - Success 
    remote isolated function importBulkAttendance(AttendanceImportData payload, string? dateFormat = ()) returns BulkAttendance|error {
        string resourcePath = string `/attendance/bulkImport`;
        map<anydata> queryParam = {"dateFormat": dateFormat};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        BulkAttendance response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Capture the check-in and check-out entries of an individual employee
    #
    # + dateFormat - Specify the correct date format(eg- dd/MM/yyyy HH:mm:ss ) 
    # + checkIn - Specify the check-in time of an employee 
    # + checkOut - Specify the check-out time of an employee 
    # + empId - Specify the employee ID of an employee. Out of the 3 parameters - empId, emailId & mapId, at least one of them must be given as an input to map the entry of an employee. 
    # + emailId - Specify the email ID of an employee. Out of the 3 parameters - empId, emailId & mapId, at least one of them must be given as an input to map the entry of an employee. 
    # + mapId - Specify the mapper ID of an employee. Out of the 3 parameters - empId, emailId & mapId, at least one of them must be given as an input to map the entry of an employee. 
    # + return - Success 
    remote isolated function createAttendance(string dateFormat, string? checkIn = (), string? checkOut = (), string? empId = (), string? emailId = (), string? mapId = ()) returns AttendanceEntry[]|error {
        string resourcePath = string `/attendance`;
        map<anydata> queryParam = {"dateFormat": dateFormat, "checkIn": checkIn, "checkOut": checkOut, "empId": empId, "emailId": emailId, "mapId": mapId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        AttendanceEntry[] response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get the employee attendance entries.
    #
    # + dateFormat - Specify the response date format 
    # + date - Specify the date in organisation date format 
    # + erecno - Specify employee erecno 
    # + empId - Specify employee id. Out of the 3 parameters - empId, emailId & mapId, at least one of them must be given as an input to map the entry of an employee. 
    # + emailId - Specify employee email id. Out of the 3 parameters - empId, emailId & mapId, at least one of them must be given as an input to map the entry of an employee. 
    # + mapId - Specify mapper id. Out of the 3 parameters - empId, emailId & mapId, at least one of them must be given as an input to map the entry of an employee. 
    # + return - Success 
    remote isolated function getAttendanceEntries(string? dateFormat = (), string? date = (), string? erecno = (), string? empId = (), string? emailId = (), string? mapId = ()) returns AttendanceEntries|error {
        string resourcePath = string `/attendance/getAttendanceEntries`;
        map<anydata> queryParam = {"dateFormat": dateFormat, "date": date, "erecno": erecno, "empId": empId, "emailId": emailId, "mapId": mapId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        AttendanceEntries response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get the latest attendance entries with Regularisation entries that has been added/updated within the latest minutes(given in param)
    #
    # + duration - Duration in minutes within which the latest entries should be fetched 
    # + dateTimeFormat - Format of the date and time of Attendance entries in response is returned 
    # + return - Success 
    remote isolated function getLatestAttendance(int duration, string? dateTimeFormat = ()) returns LatestAttendance|error {
        string resourcePath = string `/attendance/fetchLatestAttEntries`;
        map<anydata> queryParam = {"duration": duration, "dateTimeFormat": dateTimeFormat};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        LatestAttendance response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Map employees to respective shifts
    #
    # + empId - Employee ID of an employee 
    # + shiftName - Shift to be mapped 
    # + fdate - From date 
    # + tdate - To date 
    # + dateFormat - Correct date format. Date Format of organisation or specify the format 
    # + return - Success 
    remote isolated function updateUserShift(string empId, string shiftName, string? fdate = (), string? tdate = (), string? dateFormat = ()) returns ShiftUpdate|error {
        string resourcePath = string `/attendance/updateUserShift`;
        map<anydata> queryParam = {"empId": empId, "shiftName": shiftName, "fdate": fdate, "tdate": tdate, "dateFormat": dateFormat};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        ShiftUpdate response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Fetch the shift configuration details of an employee
    #
    # + empId - Employee ID of an employee. Out of the 3 parameters - empId, emailId & mapId, at least one of them must be given as an input to map the entry of an employee. 
    # + emailId - Mail ID of the employee. Out of the 3 parameters - empId, emailId & mapId, at least one of them must be given as an input to map the entry of an employee. 
    # + mapId - Mapper ID of the employee. Out of the 3 parameters - empId, emailId & mapId, at least one of them must be given as an input to map the entry of an employee. 
    # + sdate - Start date 
    # + edate - End date 
    # + return - Success 
    remote isolated function getShiftDetails(string sdate, string edate, string? empId = (), string? emailId = (), string? mapId = ()) returns ShiftDetails|error {
        string resourcePath = string `/attendance/getShiftConfiguration`;
        map<anydata> queryParam = {"empId": empId, "emailId": emailId, "mapId": mapId, "sdate": sdate, "edate": edate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ShiftDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
}
