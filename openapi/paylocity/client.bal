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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:OAuth2ClientCredentialsGrantConfig auth;
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

# This is a generated connector for [Paylocity API v2](https://www.paylocity.com/our-products/integrations/api-library/) OpenAPI Specification.
# Paylocity Web Services API is an externally facing RESTful Internet protocol. The Paylocity API uses HTTP verbs and a RESTful endpoint structure.
# OAuth 2.0 is used as the API Authorization framework. Request and response payloads are formatted as JSON.
# Paylocity supports v1 and v2 versions of its API endpoints. v1, while supported, won't be enhanced with additional functionality.
# For direct link to v1 documentation, please click [here](https://docs.paylocity.com/weblink/guides/Paylocity_Web_Services_API/v1/Paylocity_Web_Services_API.htm).
# For additional resources regarding v1/v2 differences and conversion path, please contact webservices@paylocity.com.
# Paylocity will provide the secure client credentials and set up the scope (type of requests and allowed company numbers).
# You will receive the unique client id, secret, and Paylocity public key for the data encryption. The secret will expire in 365 days.
#   - Paylocity will send you an e-mail 10 days prior to the expiration date for the current secret.
#     If not renewed, the second e-mail notification will be sent 5 days prior to secret's expiration. Each email will contain the code necessary to renew the client secret.
#   - You can obtain the new secret by calling API endpoint using your current not yet expired credentials and the code that was sent with the notification email.
#     For details on API endpoint, please see Client Credentials section.
#   - Both the current secret value and the new secret value will be recognized during the transition period. After the current secret expires, you must use the new secret. 
#   - If you were unable to renew the secret via API endpoint, you can still contact Service and they will email you new secret via secure email.
@display {label: "Paylocity", iconPath: "resources/paylocity.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create [Paylocity account](https://access.paylocity.com/Register) and obtain tokens by following [this guide](https://www.paylocity.com/our-products/integrations/api-library/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.paylocity.com/api") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Get All Company Codes
    #
    # + companyId - Company Id
    # + codeResource - Type of Company Code. Common values costcenter1, costcenter2, costcenter3, deductions, earnings, taxes, paygrade, positions.
    # + return - Successfully retrieved
    remote isolated function getAllCompanyCodesAndDescriptionsByResource(string companyId, string codeResource) returns CompanyCodes[]|error {
        string  path = string `/v2/companies/${companyId}/codes/${codeResource}`;
        CompanyCodes[] response = check self.clientEp-> get(path, targetType = CompanyCodesArr);
        return response;
    }
    # Get All Custom Fields
    #
    # + companyId - Company Id
    # + category - Custom Fields Category
    # + return - Successfully retrieved
    remote isolated function getAllCustomFieldsByCategory(string companyId, string category) returns CustomFieldDefinition[]|error {
        string  path = string `/v2/companies/${companyId}/customfields/${category}`;
        CustomFieldDefinition[] response = check self.clientEp-> get(path, targetType = CustomFieldDefinitionArr);
        return response;
    }
    # Add new employee
    #
    # + companyId - Company Id
    # + payload - Employee Model
    # + return - Successfully added
    remote isolated function addEmployee(string companyId, Employee payload) returns EmployeeIdResponse[]|error {
        string  path = string `/v2/companies/${companyId}/employees`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EmployeeIdResponse[] response = check self.clientEp->post(path, request, targetType=EmployeeIdResponseArr);
        return response;
    }
    # Get all employees
    #
    # + companyId - Company Id
    # + pagesize - Number of records per page. Default value is 25.
    # + pagenumber - Page number to retrieve; page numbers are 0-based (so to get the first page of results, pass pagenumber=0). Default value is 0.
    # + includetotalcount - Whether to include the total record count in the header's X-Pcty-Total-Count property. Default value is true.
    # + return - Successfully Retrieved
    remote isolated function getAllEmployees(string companyId, int? pagesize = (), int? pagenumber = (), boolean? includetotalcount = ()) returns EmployeeInfo[]|error {
        string  path = string `/v2/companies/${companyId}/employees/`;
        map<anydata> queryParam = {"pagesize": pagesize, "pagenumber": pagenumber, "includetotalcount": includetotalcount};
        path = path + check getPathForQueryParam(queryParam);
        EmployeeInfo[] response = check self.clientEp-> get(path, targetType = EmployeeInfoArr);
        return response;
    }
    # Get employee
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + return - Successfully Retrieved
    remote isolated function getEmployee(string companyId, string employeeId) returns Employee[]|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}`;
        Employee[] response = check self.clientEp-> get(path, targetType = EmployeeArr);
        return response;
    }
    # Update employee
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + payload - Employee Model
    # + return - Successfully Updated
    remote isolated function updateEmployee(string companyId, string employeeId, Employee payload) returns http:Response|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType=http:Response);
        return response;
    }
    # Add/update additional rates
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + payload - Additional Rate Model
    # + return - Successfully added or updated
    remote isolated function addOrUpdateAdditionalRates(string companyId, string employeeId, AdditionalRate payload) returns http:Response|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/additionalRates`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Add/update employee's benefit setup
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + payload - BenefitSetup Model
    # + return - Successfully added or updated
    remote isolated function updateOrAddEmployeeBenefitSetup(string companyId, string employeeId, BenefitSetup payload) returns http:Response|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/benefitSetup`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get All Direct Deposit
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + return - Successfully Retrieved
    remote isolated function getAllDirectDeposit(string companyId, string employeeId) returns DirectDeposit[]|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/directDeposit`;
        DirectDeposit[] response = check self.clientEp-> get(path, targetType = DirectDepositArr);
        return response;
    }
    # Get All Earnings
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + return - Successfully retrieved
    remote isolated function getAllEarnings(string companyId, string employeeId) returns Earning[]|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/earnings`;
        Earning[] response = check self.clientEp-> get(path, targetType = EarningArr);
        return response;
    }
    # Add/Update Earning
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + payload - Earning Model
    # + return - Successfully added or updated
    remote isolated function addOrUpdateAnEmployeeEarning(string companyId, string employeeId, Earning payload) returns http:Response|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/earnings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get Earnings by Earning Code
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + earningCode - Earning Code
    # + return - Successfully retrieved
    remote isolated function getEarningsByEarningCode(string companyId, string employeeId, string earningCode) returns Earning[]|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/earnings/${earningCode}`;
        Earning[] response = check self.clientEp-> get(path, targetType = EarningArr);
        return response;
    }
    # Get Earning by Earning Code and Start Date
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + earningCode - Earning Code
    # + startDate - Start Date
    # + return - Successfully retrieved
    remote isolated function getEarningByEarningCodeAndStartDate(string companyId, string employeeId, string earningCode, string startDate) returns Earning|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/earnings/${earningCode}/${startDate}`;
        Earning response = check self.clientEp-> get(path, targetType = Earning);
        return response;
    }
    # Delete Earning by Earning Code and Start Date
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + earningCode - Earning Code
    # + startDate - Start Date
    # + return - Successfully deleted
    remote isolated function deleteEarningByEarningCodeAndStartDate(string companyId, string employeeId, string earningCode, string startDate) returns http:Response|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/earnings/${earningCode}/${startDate}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Add/update emergency contacts
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + payload - Emergency Contact Model
    # + return - Successfully added or updated
    remote isolated function addOrUpdateEmergencyContacts(string companyId, string employeeId, EmergencyContact payload) returns http:Response|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/emergencyContacts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get all local taxes
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + return - Successfully retrieved
    remote isolated function getAllLocalTaxes(string companyId, string employeeId) returns LocalTax[]|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/localTaxes`;
        LocalTax[] response = check self.clientEp-> get(path, targetType = LocalTaxArr);
        return response;
    }
    # Add new local tax
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + payload - LocalTax Model
    # + return - Successfully added
    remote isolated function addLocalTax(string companyId, string employeeId, LocalTax payload) returns http:Response|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/localTaxes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Get local taxes by tax code
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + taxCode - Tax Code
    # + return - Successfully retrieved
    remote isolated function getLocalTaxByTaxCode(string companyId, string employeeId, string taxCode) returns LocalTax[]|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/localTaxes/${taxCode}`;
        LocalTax[] response = check self.clientEp-> get(path, targetType = LocalTaxArr);
        return response;
    }
    # Delete local tax by tax code
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + taxCode - Tax Code
    # + return - Successfully deleted
    remote isolated function deleteLocalTaxByTaxCode(string companyId, string employeeId, string taxCode) returns http:Response|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/localTaxes/${taxCode}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Add/update non-primary state tax
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + payload - Non-Primary State Tax Model
    # + return - Successfully added or updated
    remote isolated function addOrUpdateNonPrimaryStateTax(string companyId, string employeeId, NonPrimaryStateTax payload) returns http:Response|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/nonprimaryStateTax`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get employee pay statement details data for the specified year.
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + year - The year for which to retrieve pay statement data
    # + pagesize - Number of records per page. Default value is 25.
    # + pagenumber - Page number to retrieve; page numbers are 0-based (so to get the first page of results, pass pagenumber=0). Default value is 0.
    # + includetotalcount - Whether to include the total record count in the header's X-Pcty-Total-Count property. Default value is true.
    # + dettypes - Retrieve pay statement details related to specific deduction, earning or tax types. Common values include 401k, Memo, Reg, OT, Cash Tips, FED and SITW.
    # + return - Successfully Retrieved
    remote isolated function getsEmployeePayStatementDetailDataBasedOnTheSpecifiedYear(string companyId, string employeeId, string year, int? pagesize = (), int? pagenumber = (), boolean? includetotalcount = (), string? dettypes = ()) returns PayStatementDetails[]|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/paystatement/details/${year}`;
        map<anydata> queryParam = {"pagesize": pagesize, "pagenumber": pagenumber, "includetotalcount": includetotalcount, "dettypes": dettypes};
        path = path + check getPathForQueryParam(queryParam);
        PayStatementDetails[] response = check self.clientEp-> get(path, targetType = PayStatementDetailsArr);
        return response;
    }
    # Get employee pay statement details data for the specified year and check date.
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + year - The year for which to retrieve pay statement data
    # + checkDate - The check date for which to retrieve pay statement data
    # + pagesize - Number of records per page. Default value is 25.
    # + pagenumber - Page number to retrieve; page numbers are 0-based (so to get the first page of results, pass pagenumber=0). Default value is 0.
    # + includetotalcount - Whether to include the total record count in the header's X-Pcty-Total-Count property. Default value is true.
    # + dettypes - Retrieve pay statement details related to specific deduction, earning or tax types. Common values include 401k, Memo, Reg, OT, Cash Tips, FED and SITW.
    # + return - Successfully Retrieved
    remote isolated function getsEmployeePayStatementDetailDataBasedOnTheSpecifiedYearAndCheckDate(string companyId, string employeeId, string year, string checkDate, int? pagesize = (), int? pagenumber = (), boolean? includetotalcount = (), string? dettypes = ()) returns PayStatementDetails[]|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/paystatement/details/${year}/${checkDate}`;
        map<anydata> queryParam = {"pagesize": pagesize, "pagenumber": pagenumber, "includetotalcount": includetotalcount, "dettypes": dettypes};
        path = path + check getPathForQueryParam(queryParam);
        PayStatementDetails[] response = check self.clientEp-> get(path, targetType = PayStatementDetailsArr);
        return response;
    }
    # Get employee pay statement summary data for the specified year.
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + year - The year for which to retrieve pay statement data
    # + pagesize - Number of records per page. Default value is 25.
    # + pagenumber - Page number to retrieve; page numbers are 0-based (so to get the first page of results, pass pagenumber=0). Default value is 0.
    # + includetotalcount - Whether to include the total record count in the header's X-Pcty-Total-Count property. Default value is true.
    # + dettypes - Retrieve pay statement details related to specific deduction, earning or tax types. Common values include 401k, Memo, Reg, OT, Cash Tips, FED and SITW.
    # + return - Successfully Retrieved
    remote isolated function getsEmployeePayStatementSummaryDataBasedOnTheSpecifiedYear(string companyId, string employeeId, string year, int? pagesize = (), int? pagenumber = (), boolean? includetotalcount = (), string? dettypes = ()) returns PayStatementSummary[]|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/paystatement/summary/${year}`;
        map<anydata> queryParam = {"pagesize": pagesize, "pagenumber": pagenumber, "includetotalcount": includetotalcount, "dettypes": dettypes};
        path = path + check getPathForQueryParam(queryParam);
        PayStatementSummary[] response = check self.clientEp-> get(path, targetType = PayStatementSummaryArr);
        return response;
    }
    # Get employee pay statement summary data for the specified year and check date.
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + year - The year for which to retrieve pay statement data
    # + checkDate - The check date for which to retrieve pay statement data
    # + pagesize - Number of records per page. Default value is 25.
    # + pagenumber - Page number to retrieve; page numbers are 0-based (so to get the first page of results, pass pagenumber=0). Default value is 0.
    # + includetotalcount - Whether to include the total record count in the header's X-Pcty-Total-Count property. Default value is true.
    # + dettypes - Retrieve pay statement details related to specific deduction, earning or tax types. Common values include 401k, Memo, Reg, OT, Cash Tips, FED and SITW.
    # + return - Successfully Retrieved
    remote isolated function getsEmployeePayStatementSummaryDataBasedOnTheSpecifiedYearAndCheckDate(string companyId, string employeeId, string year, string checkDate, int? pagesize = (), int? pagenumber = (), boolean? includetotalcount = (), string? dettypes = ()) returns PayStatementSummary[]|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/paystatement/summary/${year}/${checkDate}`;
        map<anydata> queryParam = {"pagesize": pagesize, "pagenumber": pagenumber, "includetotalcount": includetotalcount, "dettypes": dettypes};
        path = path + check getPathForQueryParam(queryParam);
        PayStatementSummary[] response = check self.clientEp-> get(path, targetType = PayStatementSummaryArr);
        return response;
    }
    # Add/update primary state tax
    #
    # + companyId - Company Id
    # + employeeId - Employee Id
    # + payload - Primary State Tax Model
    # + return - Successfully added or updated
    remote isolated function addOrUpdatePrimaryStateTax(string companyId, string employeeId, StateTax payload) returns http:Response|error {
        string  path = string `/v2/companies/${companyId}/employees/${employeeId}/primaryStateTax`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get Company-Specific Open API Documentation
    #
    # + authorization - Bearer + JWT
    # + companyId - Company Id
    # + return - Successfully retrieved
    remote isolated function getCompanySpecificOpenApiDocumentation(string authorization, string companyId) returns http:Response|error {
        string  path = string `/v2/companies/${companyId}/openapi`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Obtain new client secret.
    #
    # + payload - Add Client Secret Model
    # + return - Successfully added
    remote isolated function addClientSecret(AddClientSecret payload) returns ClientCredentialsResponse[]|error {
        string  path = string `/v2/credentials/secrets`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ClientCredentialsResponse[] response = check self.clientEp->post(path, request, targetType=ClientCredentialsResponseArr);
        return response;
    }
    # Add new employee to Web Link
    #
    # + companyId - Company Id
    # + payload - StagedEmployee Model
    # + return - Successfully Added
    remote isolated function addNewEmployeeToWebLink(string companyId, StagedEmployee payload) returns TrackingNumberResponse[]|error {
        string  path = string `/v2/weblinkstaging/companies/${companyId}/employees/newemployees`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TrackingNumberResponse[] response = check self.clientEp->post(path, request, targetType=TrackingNumberResponseArr);
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

# Generate header map for given header values.
#
# + headerParam - Headers  map
# + return - Returns generated map or error at failure of client initialization
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
