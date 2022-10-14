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
    OAuth2ClientCredentialsGrantConfig auth;
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

# OAuth2 Client Credentials Grant Configs
public type OAuth2ClientCredentialsGrantConfig record {|
    *http:OAuth2ClientCredentialsGrantConfig;
    # Token URL
    string tokenUrl = "https://api.paylocity.com/IdentityServer/connect/token";
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
@display {label: "Paylocity", iconPath: "icon.png"}
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
        return;
    }
    # Get All Company Codes
    #
    # + companyId - Company Id 
    # + codeResource - Type of Company Code. Common values costcenter1, costcenter2, costcenter3, deductions, earnings, taxes, paygrade, positions. 
    # + return - Successfully retrieved 
    remote isolated function getAllCompanyCodesAndDescriptionsByResource(string companyId, string codeResource) returns CompanyCodes[]|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/codes/${getEncodedUri(codeResource)}`;
        CompanyCodes[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get All Custom Fields
    #
    # + companyId - Company Id 
    # + category - Custom Fields Category 
    # + return - Successfully retrieved 
    remote isolated function getAllCustomFieldsByCategory(string companyId, string category) returns CustomFieldDefinition[]|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/customfields/${getEncodedUri(category)}`;
        CustomFieldDefinition[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add new employee
    #
    # + companyId - Company Id 
    # + payload - Employee Model 
    # + return - Successfully added 
    remote isolated function addEmployee(string companyId, Employee payload) returns EmployeeIdResponse[]|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmployeeIdResponse[] response = check self.clientEp->post(resourcePath, request);
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
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/`;
        map<anydata> queryParam = {"pagesize": pagesize, "pagenumber": pagenumber, "includetotalcount": includetotalcount};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EmployeeInfo[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get employee
    #
    # + companyId - Company Id 
    # + employeeId - Employee Id 
    # + return - Successfully Retrieved 
    remote isolated function getEmployee(string companyId, string employeeId) returns Employee[]|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}`;
        Employee[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update employee
    #
    # + companyId - Company Id 
    # + employeeId - Employee Id 
    # + payload - Employee Model 
    # + return - Successfully Updated 
    remote isolated function updateEmployee(string companyId, string employeeId, Employee payload) returns http:Response|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Add/update additional rates
    #
    # + companyId - Company Id 
    # + employeeId - Employee Id 
    # + payload - Additional Rate Model 
    # + return - Successfully added or updated 
    remote isolated function addOrUpdateAdditionalRates(string companyId, string employeeId, AdditionalRate payload) returns http:Response|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/additionalRates`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Add/update employee's benefit setup
    #
    # + companyId - Company Id 
    # + employeeId - Employee Id 
    # + payload - BenefitSetup Model 
    # + return - Successfully added or updated 
    remote isolated function updateOrAddEmployeeBenefitSetup(string companyId, string employeeId, BenefitSetup payload) returns http:Response|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/benefitSetup`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get All Direct Deposit
    #
    # + companyId - Company Id 
    # + employeeId - Employee Id 
    # + return - Successfully Retrieved 
    remote isolated function getAllDirectDeposit(string companyId, string employeeId) returns DirectDeposit[]|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/directDeposit`;
        DirectDeposit[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get All Earnings
    #
    # + companyId - Company Id 
    # + employeeId - Employee Id 
    # + return - Successfully retrieved 
    remote isolated function getAllEarnings(string companyId, string employeeId) returns Earning[]|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/earnings`;
        Earning[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add/Update Earning
    #
    # + companyId - Company Id 
    # + employeeId - Employee Id 
    # + payload - Earning Model 
    # + return - Successfully added or updated 
    remote isolated function addOrUpdateAnEmployeeEarning(string companyId, string employeeId, Earning payload) returns http:Response|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/earnings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get Earnings by Earning Code
    #
    # + companyId - Company Id 
    # + employeeId - Employee Id 
    # + earningCode - Earning Code 
    # + return - Successfully retrieved 
    remote isolated function getEarningsByEarningCode(string companyId, string employeeId, string earningCode) returns Earning[]|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/earnings/${getEncodedUri(earningCode)}`;
        Earning[] response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/earnings/${getEncodedUri(earningCode)}/${getEncodedUri(startDate)}`;
        Earning response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/earnings/${getEncodedUri(earningCode)}/${getEncodedUri(startDate)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Add/update emergency contacts
    #
    # + companyId - Company Id 
    # + employeeId - Employee Id 
    # + payload - Emergency Contact Model 
    # + return - Successfully added or updated 
    remote isolated function addOrUpdateEmergencyContacts(string companyId, string employeeId, EmergencyContact payload) returns http:Response|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/emergencyContacts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get all local taxes
    #
    # + companyId - Company Id 
    # + employeeId - Employee Id 
    # + return - Successfully retrieved 
    remote isolated function getAllLocalTaxes(string companyId, string employeeId) returns LocalTax[]|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/localTaxes`;
        LocalTax[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add new local tax
    #
    # + companyId - Company Id 
    # + employeeId - Employee Id 
    # + payload - LocalTax Model 
    # + return - Successfully added 
    remote isolated function addLocalTax(string companyId, string employeeId, LocalTax payload) returns http:Response|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/localTaxes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get local taxes by tax code
    #
    # + companyId - Company Id 
    # + employeeId - Employee Id 
    # + taxCode - Tax Code 
    # + return - Successfully retrieved 
    remote isolated function getLocalTaxByTaxCode(string companyId, string employeeId, string taxCode) returns LocalTax[]|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/localTaxes/${getEncodedUri(taxCode)}`;
        LocalTax[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete local tax by tax code
    #
    # + companyId - Company Id 
    # + employeeId - Employee Id 
    # + taxCode - Tax Code 
    # + return - Successfully deleted 
    remote isolated function deleteLocalTaxByTaxCode(string companyId, string employeeId, string taxCode) returns http:Response|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/localTaxes/${getEncodedUri(taxCode)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Add/update non-primary state tax
    #
    # + companyId - Company Id 
    # + employeeId - Employee Id 
    # + payload - Non-Primary State Tax Model 
    # + return - Successfully added or updated 
    remote isolated function addOrUpdateNonPrimaryStateTax(string companyId, string employeeId, NonPrimaryStateTax payload) returns http:Response|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/nonprimaryStateTax`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
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
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/paystatement/details/${getEncodedUri(year)}`;
        map<anydata> queryParam = {"pagesize": pagesize, "pagenumber": pagenumber, "includetotalcount": includetotalcount, "dettypes": dettypes};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PayStatementDetails[] response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/paystatement/details/${getEncodedUri(year)}/${getEncodedUri(checkDate)}`;
        map<anydata> queryParam = {"pagesize": pagesize, "pagenumber": pagenumber, "includetotalcount": includetotalcount, "dettypes": dettypes};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PayStatementDetails[] response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/paystatement/summary/${getEncodedUri(year)}`;
        map<anydata> queryParam = {"pagesize": pagesize, "pagenumber": pagenumber, "includetotalcount": includetotalcount, "dettypes": dettypes};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PayStatementSummary[] response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/paystatement/summary/${getEncodedUri(year)}/${getEncodedUri(checkDate)}`;
        map<anydata> queryParam = {"pagesize": pagesize, "pagenumber": pagenumber, "includetotalcount": includetotalcount, "dettypes": dettypes};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PayStatementSummary[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add/update primary state tax
    #
    # + companyId - Company Id 
    # + employeeId - Employee Id 
    # + payload - Primary State Tax Model 
    # + return - Successfully added or updated 
    remote isolated function addOrUpdatePrimaryStateTax(string companyId, string employeeId, StateTax payload) returns http:Response|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/employees/${getEncodedUri(employeeId)}/primaryStateTax`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get Company-Specific Open API Documentation
    #
    # + authorization - Bearer + JWT 
    # + companyId - Company Id 
    # + return - Successfully retrieved 
    remote isolated function getCompanySpecificOpenApiDocumentation(string authorization, string companyId) returns http:Response|error {
        string resourcePath = string `/v2/companies/${getEncodedUri(companyId)}/openapi`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Obtain new client secret.
    #
    # + payload - Add Client Secret Model 
    # + return - Successfully added 
    remote isolated function addClientSecret(AddClientSecret payload) returns ClientCredentialsResponse[]|error {
        string resourcePath = string `/v2/credentials/secrets`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ClientCredentialsResponse[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Add new employee to Web Link
    #
    # + companyId - Company Id 
    # + payload - StagedEmployee Model 
    # + return - Successfully Added 
    remote isolated function addNewEmployeeToWebLink(string companyId, StagedEmployee payload) returns TrackingNumberResponse[]|error {
        string resourcePath = string `/v2/weblinkstaging/companies/${getEncodedUri(companyId)}/employees/newemployees`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TrackingNumberResponse[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
