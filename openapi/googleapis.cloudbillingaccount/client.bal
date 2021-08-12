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

# Provides a set of configurations for communicating with a remote HTTP endpoint.
#
# + authConfig - Configurations related to client authentication
# + secureSocketConfig - SSL/TLS-related configurations  
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# This is a generated connector for [Google Cloud Billing Account API v1](https://cloud.google.com/billing/v1/getting-started) OpenAPI specification.
# The Google Cloud Billing Account API allows developers to manage billing for their Google Cloud Platform projects programmatically.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://cloudbilling.googleapis.com/") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Lists the billing accounts that the current authenticated user has permission to [view](https://cloud.google.com/billing/docs/how-to/billing-access).
    #
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + filter - Options for how to filter the returned billing accounts. Currently this only supports filtering for [subaccounts](https://cloud.google.com/billing/docs/concepts) under a single provided reseller billing account. (e.g. "master_billing_account=billingAccounts/012345-678901-ABCDEF"). Boolean algebra and other fields are not currently supported.
    # + pageSize - Requested page size. The maximum page size is 100; this is also the default.
    # + pageToken - A token identifying a page of results to return. This should be a `next_page_token` value returned from a previous `ListBillingAccounts` call. If unspecified, the first page of results is returned.
    # + return - Successful response
    remote isolated function listBillingAccounts(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? filter = (), int? pageSize = (), string? pageToken = ()) returns ListBillingAccountsResponse|error {
        string  path = string `/v1/billingAccounts`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "filter": filter, "pageSize": pageSize, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListBillingAccountsResponse response = check self.clientEp-> get(path, targetType = ListBillingAccountsResponse);
        return response;
    }
    # This method creates [billing subaccounts](https://cloud.google.com/billing/docs/concepts#subaccounts). Google Cloud resellers should use the Channel Services APIs, [accounts.customers.create](https://cloud.google.com/channel/docs/reference/rest/v1/accounts.customers/create) and [accounts.customers.entitlements.create](https://cloud.google.com/channel/docs/reference/rest/v1/accounts.customers.entitlements/create). When creating a subaccount, the current authenticated user must have the `billing.accounts.update` IAM permission on the parent account, which is typically given to billing account [administrators](https://cloud.google.com/billing/docs/how-to/billing-access). This method will return an error if the parent account has not been provisioned as a reseller account.
    #
    # + payload - A record of type `BillingAccount` which contains the necessary data to create a billing account
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function createBillingAccounts(BillingAccount payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns BillingAccount|error {
        string  path = string `/v1/billingAccounts`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BillingAccount response = check self.clientEp->post(path, request, targetType=BillingAccount);
        return response;
    }
    # Lists all public cloud services.
    #
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + pageSize - Requested page size. Defaults to 5000.
    # + pageToken - A token identifying a page of results to return. This should be a `next_page_token` value returned from a previous `ListServices` call. If unspecified, the first page of results is returned.
    # + return - Successful response
    remote isolated function listServices(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns ListServicesResponse|error {
        string  path = string `/v1/services`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListServicesResponse response = check self.clientEp-> get(path, targetType = ListServicesResponse);
        return response;
    }
    # Gets information about a billing account. The current authenticated user must be a [viewer of the billing account](https://cloud.google.com/billing/docs/how-to/billing-access).
    #
    # + name - Required. The resource name of the billing account to retrieve. For example, `billingAccounts/012345-567890-ABCDEF`.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function getBillingAccounts(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns BillingAccount|error {
        string  path = string `/v1/${name}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        BillingAccount response = check self.clientEp-> get(path, targetType = BillingAccount);
        return response;
    }
    # Updates a billing account's fields. Currently the only field that can be edited is `display_name`. The current authenticated user must have the `billing.accounts.update` IAM permission, which is typically given to the [administrator](https://cloud.google.com/billing/docs/how-to/billing-access) of the billing account.
    #
    # + name - Required. The name of the billing account resource to be updated.
    # + payload - A record of type `BillingAccount` which contains the necessary data to update a billing account
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + updateMask - The update mask applied to the resource. Only "display_name" is currently supported.
    # + return - Successful response
    remote isolated function patchBillingAccounts(string name, BillingAccount payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? updateMask = ()) returns BillingAccount|error {
        string  path = string `/v1/${name}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "updateMask": updateMask};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BillingAccount response = check self.clientEp->patch(path, request, targetType=BillingAccount);
        return response;
    }
    # Gets the billing information for a project. The current authenticated user must have [permission to view the project](https://cloud.google.com/docs/permissions-overview#h.bgs0oxofvnoo ).
    #
    # + name - Required. The resource name of the project for which billing information is retrieved. For example, `projects/tokyo-rain-123`.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function getProjectsBillingInfo(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns ProjectBillingInfo|error {
        string  path = string `/v1/${name}/billingInfo`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        ProjectBillingInfo response = check self.clientEp-> get(path, targetType = ProjectBillingInfo);
        return response;
    }
    # Sets or updates the billing account associated with a project. You specify the new billing account by setting the `billing_account_name` in the `ProjectBillingInfo` resource to the resource name of a billing account. Associating a project with an open billing account enables billing on the project and allows charges for resource usage. If the project already had a billing account, this method changes the billing account used for resource usage charges. *Note:* Incurred charges that have not yet been reported in the transaction history of the Google Cloud Console might be billed to the new billing account, even if the charge occurred before the new billing account was assigned to the project. The current authenticated user must have ownership privileges for both the [project](https://cloud.google.com/docs/permissions-overview#h.bgs0oxofvnoo ) and the [billing account](https://cloud.google.com/billing/docs/how-to/billing-access). You can disable billing on the project by setting the `billing_account_name` field to empty. This action disassociates the current billing account from the project. Any billable activity of your in-use services will stop, and your application could stop functioning as expected. Any unbilled charges to date will be billed to the previously associated account. The current authenticated user must be either an owner of the project or an owner of the billing account for the project. Note that associating a project with a *closed* billing account will have much the same effect as disabling billing on the project: any paid resources used by the project will be shut down. Thus, unless you wish to disable billing, you should always call this method with the name of an *open* billing account.
    #
    # + name - Required. The resource name of the project associated with the billing information that you want to update. For example, `projects/tokyo-rain-123`.
    # + payload - A record of type `ProjectBillingInfo` which contains the necessary data to update a project billing information
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function updateProjectsBillingInfo(string name, ProjectBillingInfo payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns ProjectBillingInfo|error {
        string  path = string `/v1/${name}/billingInfo`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProjectBillingInfo response = check self.clientEp->put(path, request, targetType=ProjectBillingInfo);
        return response;
    }
    # Lists the projects associated with a billing account. The current authenticated user must have the `billing.resourceAssociations.list` IAM permission, which is often given to billing account [viewers](https://cloud.google.com/billing/docs/how-to/billing-access).
    #
    # + name - Required. The resource name of the billing account associated with the projects that you want to list. For example, `billingAccounts/012345-567890-ABCDEF`.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + pageSize - Requested page size. The maximum page size is 100; this is also the default.
    # + pageToken - A token identifying a page of results to be returned. This should be a `next_page_token` value returned from a previous `ListProjectBillingInfo` call. If unspecified, the first page of results is returned.
    # + return - Successful response
    remote isolated function listProjectsBillingAccounts(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns ListProjectBillingInfoResponse|error {
        string  path = string `/v1/${name}/projects`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListProjectBillingInfoResponse response = check self.clientEp-> get(path, targetType = ListProjectBillingInfoResponse);
        return response;
    }
    # Lists all publicly available SKUs for a given cloud service.
    #
    # + parent - Required. The name of the service. Example: "services/DA34-426B-A397"
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + currencyCode - The ISO 4217 currency code for the pricing info in the response proto. Will use the conversion rate as of start_time. Optional. If not specified USD will be used.
    # + endTime - Optional exclusive end time of the time range for which the pricing versions will be returned. Timestamps in the future are not allowed. The time range has to be within a single calendar month in America/Los_Angeles timezone. Time range as a whole is optional. If not specified, the latest pricing will be returned (up to 12 hours old at most).
    # + pageSize - Requested page size. Defaults to 5000.
    # + pageToken - A token identifying a page of results to return. This should be a `next_page_token` value returned from a previous `ListSkus` call. If unspecified, the first page of results is returned.
    # + startTime - Optional inclusive start time of the time range for which the pricing versions will be returned. Timestamps in the future are not allowed. The time range has to be within a single calendar month in America/Los_Angeles timezone. Time range as a whole is optional. If not specified, the latest pricing will be returned (up to 12 hours old at most).
    # + return - Successful response
    remote isolated function listServicesSkus(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? currencyCode = (), string? endTime = (), int? pageSize = (), string? pageToken = (), string? startTime = ()) returns ListSkusResponse|error {
        string  path = string `/v1/${parent}/skus`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "currencyCode": currencyCode, "endTime": endTime, "pageSize": pageSize, "pageToken": pageToken, "startTime": startTime};
        path = path + check getPathForQueryParam(queryParam);
        ListSkusResponse response = check self.clientEp-> get(path, targetType = ListSkusResponse);
        return response;
    }
    # Gets the access control policy for a billing account. The caller must have the `billing.accounts.getIamPolicy` permission on the account, which is often given to billing account [viewers](https://cloud.google.com/billing/docs/how-to/billing-access).
    #
    # + 'resource - REQUIRED: The resource for which the policy is being requested. See the operation documentation for the appropriate value for this field.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + optionsRequestedpolicyversion - Optional. The policy format version to be returned. Valid values are 0, 1, and 3. Requests specifying an invalid value will be rejected. Requests for policies with any conditional bindings must specify version 3. Policies without any conditional bindings may specify any valid value or leave the field unset. To learn which resources support conditions in their IAM policies, see the [IAM documentation](https://cloud.google.com/iam/help/conditions/resource-policies).
    # + return - Successful response
    remote isolated function getBillingAccountsIamPolicy(string 'resource, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? optionsRequestedpolicyversion = ()) returns Policy|error {
        string  path = string `/v1/${'resource}:getIamPolicy`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "options.requestedPolicyVersion": optionsRequestedpolicyversion};
        path = path + check getPathForQueryParam(queryParam);
        Policy response = check self.clientEp-> get(path, targetType = Policy);
        return response;
    }
    # Sets the access control policy for a billing account. Replaces any existing policy. The caller must have the `billing.accounts.setIamPolicy` permission on the account, which is often given to billing account [administrators](https://cloud.google.com/billing/docs/how-to/billing-access).
    #
    # + 'resource - REQUIRED: The resource for which the policy is being specified. See the operation documentation for the appropriate value for this field.
    # + payload - A record of type `SetIamPolicyRequest` which contains the necessary data to set access control policy
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function setBillingAccountsIamPolicy(string 'resource, SetIamPolicyRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Policy|error {
        string  path = string `/v1/${'resource}:setIamPolicy`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Policy response = check self.clientEp->post(path, request, targetType=Policy);
        return response;
    }
    # Tests the access control policy for a billing account. This method takes the resource and a set of permissions as input and returns the subset of the input permissions that the caller is allowed for that resource.
    #
    # + 'resource - REQUIRED: The resource for which the policy detail is being requested. See the operation documentation for the appropriate value for this field.
    # + payload - A record of type `TestIamPermissionsRequest` which contains the necessary data to test access control policy
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function testBillingAccountsIamPermissions(string 'resource, TestIamPermissionsRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns TestIamPermissionsResponse|error {
        string  path = string `/v1/${'resource}:testIamPermissions`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TestIamPermissionsResponse response = check self.clientEp->post(path, request, targetType=TestIamPermissionsResponse);
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
