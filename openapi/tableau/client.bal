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

# Versions: <i>Tableau Server 2021.1 / Tableau Online March 2022 and later</i> 
# 
#  This documentation describes the growing number OpenAPI endpoints  being released alongside more than 150 [classic REST endpoints](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_ref.htm)  that are currently in wide usage in the Tableau community. 
# 
#  There are some differences users of the classic endpoints will recognize when viewing these new endpoints. 
# 
#  - Request bodies for these new REST endpoints must  be formatted using JSON. 
# 
#  -  Endpoint URIs may contain a hyphen ('-') instead of an API version number, indicating that the resource is versioned separately from the numbered API release. For more information, see  [REST API and Resource Versions](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm). 
# 
#  > Starting in Tableau Server 2022.1 / Tableau Online March 2022, differences between releases will be noted in this reference.To view the previous version of this reference, see [Tableau REST API OpenAPI Endpoints (v2021.4)](https://help.tableau.com/current/api/rest_api/en-us/REST/TAG/index.html#operation/addAnalyticsExtensionsConnection).
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://tableau.example.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get analytics extension details
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function analyticsextensionsserviceGetanalyticsextensionsconnection(string connectionLuid, string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionitem|error {
        string resourcePath = string `/api/-/settings/site/extensions/analytics/connections/${getEncodedUri(connectionLuid)}`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TableauAnalyticsextensionsV1Connectionitem response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update analytics extension connection of site
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function analyticsextensionsserviceUpdateanalyticsextensionsconnection(string connectionLuid, byte[] payload, string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionitem|error {
        string resourcePath = string `/api/-/settings/site/extensions/analytics/connections/${getEncodedUri(connectionLuid)}`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload, "application/vnd.tableau.analyticsextensions.v1.ConnectionItem+json");
        TableauAnalyticsextensionsV1Connectionitem response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete analytics extension connection from site
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function analyticsextensionsserviceDeleteanalyticsextensionsconnection(string connectionLuid, string? xTableauAuth = ()) returns http:Response|error {
        string resourcePath = string `/api/-/settings/site/extensions/analytics/connections/${getEncodedUri(connectionLuid)}`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get allowed dashboard extension on site
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function dashboardextensionssitesettingsserviceGetdashboardextensionssafelistitem(string safeListItemLuid, string? xTableauAuth = ()) returns TableauExtensionsDashboardV1Safelistitem|error {
        string resourcePath = string `/api/-/settings/site/extensions/dashboard/safeListItems/${getEncodedUri(safeListItemLuid)}`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TableauExtensionsDashboardV1Safelistitem response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update settings for allowed dashboard extension on site
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function dashboardextensionssitesettingsserviceUpdatedashboardextensionssafelistitem(string safeListItemLuid, byte[] payload, string? xTableauAuth = ()) returns TableauExtensionsDashboardV1Safelistitem|error {
        string resourcePath = string `/api/-/settings/site/extensions/dashboard/safeListItems/${getEncodedUri(safeListItemLuid)}`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload, "application/vnd.tableau.extensions.dashboard.v1.SafeListItem+json");
        TableauExtensionsDashboardV1Safelistitem response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Disallow dashboard extension on site
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function dashboardextensionssitesettingsserviceDeletedashboardextensionssafelistitem(string safeListItemLuid, string? xTableauAuth = ()) returns http:Response|error {
        string resourcePath = string `/api/-/settings/site/extensions/dashboard/safeListItems/${getEncodedUri(safeListItemLuid)}`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List analytics extension connections of workbook
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function analyticsextensionsserviceGetconnectionoptionsforworkbook(string workbookLuid, string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/site/extensions/analytics/workbooks/${getEncodedUri(workbookLuid)}/connections`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get current analytics extension for workbook
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function analyticsextensionsserviceGetselectedconnectionforworkbook(string workbookLuid, string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/site/extensions/analytics/workbooks/${getEncodedUri(workbookLuid)}/selected_connection`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update analytics extension for workbook
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function analyticsextensionsserviceUpdateworkbookwithconnection(string workbookLuid, byte[] payload, string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/site/extensions/analytics/workbooks/${getEncodedUri(workbookLuid)}/selected_connection`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload, "application/vnd.tableau.analyticsextensions.v1.ConnectionMapping+json");
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove current analytics extension connection for workbook
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function analyticsextensionsserviceDeleteconnectionfromworkbook(string workbookLuid, string? xTableauAuth = ()) returns http:Response|error {
        string resourcePath = string `/api/-/settings/site/extensions/analytics/workbooks/${getEncodedUri(workbookLuid)}/selected_connection`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get enabled state of analytics extensions on site
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function analyticsextensionsserviceGetanalyticsextensionssitesettings(string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/site/extensions/analytics`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update enabled state of analytics extensions on site
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function analyticsextensionsserviceUpdateanalyticsextensionssitesettings(byte[] payload, string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/site/extensions/analytics`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload, "application/vnd.tableau.analyticsextensions.v1.SiteSettings+json");
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # List dashboard extension settings of site
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function dashboardextensionssitesettingsserviceGetdashboardextensionssitesettings(string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/site/extensions/dashboard`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update dashboard extension settings of site
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Invalid Request. 
    remote isolated function dashboardextensionssitesettingsserviceUpdatedashboardextensionssitesettings(byte[] payload, string? xTableauAuth = ()) returns http:Response|error {
        string resourcePath = string `/api/-/settings/site/extensions/dashboard`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload, "application/vnd.tableau.extensions.dashboard.v1.SiteSettings+json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # List blocked dashboard extensions on server
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function dashboardextensionsserversettingsserviceGetdashboardextensionsblocklistitems(string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/server/extensions/dashboard/blockListItems`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Block dashboard extension on server
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function dashboardextensionsserversettingsserviceCreatedashboardextensionsblocklistitem(byte[] payload, string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/server/extensions/dashboard/blockListItems`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload, "application/vnd.tableau.extensions.dashboard.v1.BlockListItem+json");
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Lists allowed dashboard extensions on site
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function dashboardextensionssitesettingsserviceGetdashboardextensionssafelistitems(string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/site/extensions/dashboard/safeListItems`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Allow dashboard extension on site
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function dashboardextensionssitesettingsserviceCreatedashboardextensionssafelistitem(byte[] payload, string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/site/extensions/dashboard/safeListItems`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload, "application/vnd.tableau.extensions.dashboard.v1.SafeListItem+json");
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # List analytics extension connections on site
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function analyticsextensionsserviceGetanalyticsextensionsconnections(string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/site/extensions/analytics/connections`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add analytics extension connection to site
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function analyticsextensionsserviceAddanalyticsextensionsconnection(byte[] payload, string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/site/extensions/analytics/connections`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload, "application/vnd.tableau.analyticsextensions.v1.ConnectionItem+json");
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get enabled state of analytics extensions on server
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function analyticsextensionsserviceGetanalyticsextensionsserversettings(string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/server/extensions/analytics`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Enable or disable analytics extensions on server
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function analyticsextensionsserviceUpdateanalyticsextensionsserversettings(byte[] payload, string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/server/extensions/analytics`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload, "application/vnd.tableau.analyticsextensions.v1.ServerSettings+json");
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Get blocked dashboard extension on server
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function dashboardextensionsserversettingsserviceGetdashboardextensionsblocklistitem(string blockListItemLuid, string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/server/extensions/dashboard/blockListItems/${getEncodedUri(blockListItemLuid)}`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Unblock dashboard extension on server
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function dashboardextensionsserversettingsserviceDeletedashboardextensionsblocklistitem(string blockListItemLuid, string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/server/extensions/dashboard/blockListItems/${getEncodedUri(blockListItemLuid)}`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List settings for dashboard extensions on server
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function dashboardextensionsserversettingsserviceGetdashboardextensionsserversettings(string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/server/extensions/dashboard`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update dashboard extensions settings of server
    #
    # + xTableauAuth - The Tableau authentication header. The value is a credentials token from a Tableau server's response to an authentication request.   The Content-Type and Accept headers should be the mediatype of the request and response except in cases where you want to  [explicitly allow other versions of the resource](https://help.tableau.com/current/api/rest_api/en-us/REST/rest_api_concepts_versions.htm#per_resource_versioning). 
    # + return - Successful. 
    remote isolated function dashboardextensionsserversettingsserviceUpdatedashboardextensionsserversettings(byte[] payload, string? xTableauAuth = ()) returns TableauAnalyticsextensionsV1Connectionmetadatalist|error {
        string resourcePath = string `/api/-/settings/server/extensions/dashboard`;
        map<any> headerValues = {"X-Tableau-Auth": xTableauAuth};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setPayload(payload, "application/vnd.tableau.extensions.dashboard.v1.ServerSettings+json");
        TableauAnalyticsextensionsV1Connectionmetadatalist response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
}
