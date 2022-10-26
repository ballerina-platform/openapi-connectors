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

# This is a generated connector for [SAP Fieldglass Approval API API v1.0.0](https://api.sap.com/api/approvals/resource) OpenAPI specification. 
# The SAP Fieldglass Approval API allows clients to approve or reject SAP Fieldglass work items. Clients retrieve the work items pending an approval action from the authenticated user and return the workflow action to be performed (either approve or reject). The list and details provided by the SAP Fieldglass API give clients the ability to present work items for approval to their users with the level of detail needed to make an informed approval decision and the mechanism to return the approval or rejection decision.
@display {label: "SAP Fieldglass Approval", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create and configure an OAuth2 client credentials by following [this guide](https://help.sap.com/viewer/b865ed651e414196b39f8922db2122c7/LATEST/en-US/7aefa21a65f94b25b7e639c3931b6f83.html).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl) returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get a list of items that require approval
    #
    # + authorization - Only required for production access when using SAP Fieldglass. 
    # + xApplicationkey - The company-specific key provided by SAP Fieldglass for API access. Required for production access. 
    # + return - Successful operation. 
    remote isolated function getItemListForApproval(string? authorization = (), string? xApplicationkey = ()) returns Approvals|error {
        string resourcePath = string `/approvals`;
        map<any> headerValues = {"Authorization": authorization, "X-ApplicationKey": xApplicationkey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Approvals response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get items that require approval for a module
    #
    # + authorization - Only required for production access when using SAP Fieldglass. 
    # + xApplicationkey - The company-specific key provided by SAP Fieldglass for API access. Required for production access. 
    # + moduleId - The ID for the module (for example, 40 for Job Posting or 270 for Work Order). A full list can be found in the supporting documentation. 
    # + return - Successful operation. 
    remote isolated function getItemListFroApprovalByModule(string moduleId, string? authorization = (), string? xApplicationkey = ()) returns Approvals|error {
        string resourcePath = string `/approvals/module_${getEncodedUri(moduleId)}`;
        map<any> headerValues = {"Authorization": authorization, "X-ApplicationKey": xApplicationkey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Approvals response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Approve or reject an item
    #
    # + authorization - Only required for production access when using SAP Fieldglass. 
    # + xApplicationkey - The company-specific key provided by SAP Fieldglass for API access. Required for production access. 
    # + moduleId - The ID for the module (for example, 40 for Job Posting or 270 for Work Order). A full list can be found in the supporting documentation. 
    # + workItemId - The ID of the work item. You can get this from the response received when getting the list of items that require approval. 
    # + action - The action to take on the work item. This can be either ''approve'' or ''reject''. If it is reject, the reasonId is required. 
    # + comments - Any comments about the action. 
    # + reasonId - The reasonId for the rejection. This is required when the action is 'reject'. You can get a list of rejection reasons available for the module from the response when getting rejection reasons. 
    # + return - Successful operation. 
    remote isolated function approveOrRejectItem(string moduleId, string workItemId, string action, string? authorization = (), string? xApplicationkey = (), string? comments = (), string? reasonId = ()) returns Approvals|error {
        string resourcePath = string `/approvals/module_${getEncodedUri(moduleId)}/${getEncodedUri(workItemId)}/action/${getEncodedUri(action)}`;
        map<anydata> queryParam = {"comments": comments, "reasonId": reasonId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": authorization, "X-ApplicationKey": xApplicationkey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        Approvals response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get details for work item
    #
    # + authorization - Only required for production access when using SAP Fieldglass. 
    # + xApplicationkey - The company-specific key provided by SAP Fieldglass for API access. Required for production access. 
    # + moduleId - The ID for the module (for example, 40 for Job Posting or 270 for Work Order). A full list can be found in the supporting documentation. 
    # + workItemId - The ID of the work item. 
    # + return - Successful operation. 
    remote isolated function getWorkItemDetail(string moduleId, string workItemId, string? authorization = (), string? xApplicationkey = ()) returns Approvals|error {
        string resourcePath = string `/approvals/module_${getEncodedUri(moduleId)}/${getEncodedUri(workItemId)}`;
        map<any> headerValues = {"Authorization": authorization, "X-ApplicationKey": xApplicationkey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Approvals response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get rejection reasons
    #
    # + authorization - Only required for production access when using SAP Fieldglass. 
    # + xApplicationkey - The company-specific key provided by SAP Fieldglass for API access. Required for production access. 
    # + moduleId - The ID for the module (for example, 40 for Job Posting or 270 for Work Order). A full list can be found in the supporting documentation. 
    # + return - Successful operation. 
    remote isolated function getRejectionReasons(string moduleId, string? authorization = (), string? xApplicationkey = ()) returns Approvals|error {
        string resourcePath = string `/approvals/reject_reasons/module_${getEncodedUri(moduleId)}`;
        map<any> headerValues = {"Authorization": authorization, "X-ApplicationKey": xApplicationkey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Approvals response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
