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
    http:BearerTokenConfig auth;
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

# This is a generated connector for [Power BI API v1.0](https://powerbi.microsoft.com/en-us/) OpenAPI specification.
# Power BI REST API provides service endpoints for embedding, administration, and user resources.
@display {label: "Power BI", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Azure account](https://azure.microsoft.com/en-us/) and obtain tokens by following [this guide](https://docs.microsoft.com/en-us/power-bi/developer/embedded/register-app?tabs=manual%2CAzure).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.powerbi.com/v1.0/myorg/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Returns a list of datasets from **"My Workspace"**.
    #
    # + return - OK 
    remote isolated function datasetsGetdatasets() returns Datasets|error {
        string resourcePath = string `/datasets`;
        Datasets response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new dataset on **"My Workspace"**.
    #
    # + defaultRetentionPolicy - The default retention policy 
    # + payload - Dataset definition to create 
    # + return - Created 
    remote isolated function datasetsPostdataset(CreateDatasetRequest payload, string? defaultRetentionPolicy = ()) returns Dataset|error {
        string resourcePath = string `/datasets`;
        map<anydata> queryParam = {"defaultRetentionPolicy": defaultRetentionPolicy};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Dataset response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetdataset(string datasetId) returns Dataset|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}`;
        Dataset response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsDeletedataset(string datasetId) returns http:Response|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns a list of tables tables within the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGettables(string datasetId) returns Tables|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/tables`;
        Tables response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the metadata and schema for the specified table within the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + tableName - The table name 
    # + payload - Table name and columns to update existing table 
    # + return - OK 
    remote isolated function datasetsPuttable(string datasetId, string tableName, Table payload) returns Table|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/tables/${getEncodedUri(tableName)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Table response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Adds new data rows to the specified table within the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + tableName - The table name 
    # + payload - The request message 
    # + return - OK 
    remote isolated function datasetsPostrows(string datasetId, string tableName, PostRowsRequest payload) returns http:Response|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/tables/${getEncodedUri(tableName)}/rows`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Deletes all rows from the specified table within the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + tableName - The table name 
    # + return - OK 
    remote isolated function datasetsDeleterows(string datasetId, string tableName) returns http:Response|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/tables/${getEncodedUri(tableName)}/rows`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns the refresh history of the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + top - The requested number of entries in the refresh history. If not provided, the default is all available entries. 
    # + return - OK 
    remote isolated function datasetsGetrefreshhistory(string datasetId, int? top = ()) returns Refreshes|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/refreshes`;
        map<anydata> queryParam = {"$top": top};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Refreshes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Triggers a refresh for the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + payload - Refresh request 
    # + return - Accepted 
    remote isolated function datasetsRefreshdataset(string datasetId, RefreshRequest payload) returns http:Response|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/refreshes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the refresh schedule of the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetrefreshschedule(string datasetId) returns RefreshSchedule|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/refreshSchedule`;
        RefreshSchedule response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the refresh schedule for the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + payload - Update Refresh Schedule parameters, by specifying all or some of the parameters 
    # + return - OK 
    remote isolated function datasetsUpdaterefreshschedule(string datasetId, RefreshScheduleRequest payload) returns http:Response|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/refreshSchedule`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Returns the refresh schedule of a specified DirectQuery or LiveConnection dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetdirectqueryrefreshschedule(string datasetId) returns DirectQueryRefreshSchedule|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/directQueryRefreshSchedule`;
        DirectQueryRefreshSchedule response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the refresh schedule for the specified DirectQuery or LiveConnection dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + payload - Patch DirectQuery or LiveConnection Refresh Schedule parameters, by specifying all or some of the parameters 
    # + return - OK 
    remote isolated function datasetsUpdatedirectqueryrefreshschedule(string datasetId, DirectQueryRefreshScheduleRequest payload) returns http:Response|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/directQueryRefreshSchedule`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Returns a list of parameters for the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetparameters(string datasetId) returns MashupParameters|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/parameters`;
        MashupParameters response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the parameters values for the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + payload - Update mashup parameter request 
    # + return - OK 
    remote isolated function datasetsUpdateparameters(string datasetId, UpdateMashupParametersRequest payload) returns http:Response|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/Default.UpdateParameters`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of datasources for the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetdatasources(string datasetId) returns Datasources|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/datasources`;
        Datasources response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the datasources of the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + payload - Update datasource request 
    # + return - OK 
    remote isolated function datasetsUpdatedatasources(string datasetId, UpdateDatasourcesRequest payload) returns http:Response|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/Default.UpdateDatasources`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Updates all connections for the specified dataset from **"My Workspace"**. This API only supports SQL DirectQuery datasets.<h3>Note: This API is deprecated and no longer supported</h3>
    #
    # + datasetId - The dataset id 
    # + payload - The body 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function datasetsSetalldatasetconnections(string datasetId, ConnectionDetails payload) returns http:Response|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/Default.SetAllConnections`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Binds the specified dataset from **"My Workspace"** to the specified gateway with (optional) given set of datasource Ids. This only supports the On-Premises Data Gateway.
    #
    # + datasetId - The dataset id 
    # + payload - The bind to gateway request 
    # + return - OK 
    remote isolated function datasetsBindtogateway(string datasetId, BindToGatewayRequest payload) returns http:Response|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/Default.BindToGateway`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of gateway datasources for the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetgatewaydatasources(string datasetId) returns GatewayDatasources|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/Default.GetBoundGatewayDatasources`;
        GatewayDatasources response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of gateways which the specified dataset from **"My Workspace"** can be bound to.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsDiscovergateways(string datasetId) returns Gateways|error {
        string resourcePath = string `/datasets/${getEncodedUri(datasetId)}/Default.DiscoverGateways`;
        Gateways response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Refreshes user permissions in Power BI.
    #
    # + return - OK 
    remote isolated function usersRefreshuserpermissions() returns http:Response|error {
        string resourcePath = string `/RefreshUserPermissions`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Returns a list of imports from **"My Workspace"**.
    #
    # + return - OK 
    remote isolated function importsGetimports() returns Imports|error {
        string resourcePath = string `/imports`;
        Imports response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates new content on **"My Workspace"** from PBIX (Power BI Desktop), JSON, XLSX (Excel), RDL or file path in OneDrive for Business.
    #
    # + datasetDisplayName - The display name of the dataset, should include file extension. Not supported when importing from OneDrive for Business. 
    # + nameConflict - Determines what to do if a dataset with the same name already exists. Default value is 'Ignore'.<br/>Only Abort and Overwrite are supported with Rdl files. 
    # + skipReport - Determines whether to skip report import, if specified value must be 'true'. Only supported for PBIX files. 
    # + payload - The import to post 
    # + return - OK 
    remote isolated function importsPostimport(string datasetDisplayName, ImportInfo payload, string? nameConflict = (), boolean? skipReport = ()) returns Import|error {
        string resourcePath = string `/imports`;
        map<anydata> queryParam = {"datasetDisplayName": datasetDisplayName, "nameConflict": nameConflict, "skipReport": skipReport};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Import response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the specified import from **"My Workspace"**.
    #
    # + importId - The import id 
    # + return - OK 
    remote isolated function importsGetimport(string importId) returns Import|error {
        string resourcePath = string `/imports/${getEncodedUri(importId)}`;
        Import response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a temporary blob storage to be used to import large .pbix files larger than 1 GB and up to 10 GB.
    #
    # + return - OK 
    remote isolated function importsCreatetemporaryuploadlocation() returns TemporaryUploadLocation|error {
        string resourcePath = string `/imports/createTemporaryUploadLocation`;
        http:Request request = new;
        //TODO: Update the request as needed;
        TemporaryUploadLocation response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Returns a list of reports from **"My Workspace"**.
    #
    # + return - OK 
    remote isolated function reportsGetreports() returns Reports|error {
        string resourcePath = string `/reports`;
        Reports response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the specified report from **"My Workspace"**.
    #
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsGetreport(string reportId) returns Report|error {
        string resourcePath = string `/reports/${getEncodedUri(reportId)}`;
        Report response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes the specified report from **"My Workspace"**.
    #
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsDeletereport(string reportId) returns http:Response|error {
        string resourcePath = string `/reports/${getEncodedUri(reportId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Clones the specified report from **"My Workspace"**.
    #
    # + reportId - The report id 
    # + payload - Clone report parameters 
    # + return - OK 
    remote isolated function reportsClonereport(string reportId, CloneReportRequest payload) returns Report|error {
        string resourcePath = string `/reports/${getEncodedUri(reportId)}/Clone`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Report response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Exports the specified report from **"My Workspace"** to a .pbix file.
    #
    # + reportId - The report id 
    # + return - Exported File 
    remote isolated function reportsExportreport(string reportId) returns string|error {
        string resourcePath = string `/reports/${getEncodedUri(reportId)}/Export`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the specified report from **"My Workspace"** to have the same content as the report in the request body.
    #
    # + reportId - The report id 
    # + payload - UpdateReportContent parameters 
    # + return - OK 
    remote isolated function reportsUpdatereportcontent(string reportId, UpdateReportContentRequest payload) returns Report|error {
        string resourcePath = string `/reports/${getEncodedUri(reportId)}/UpdateReportContent`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Report response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Rebinds the specified report from **"My Workspace"** to the requested dataset.
    #
    # + reportId - The report id 
    # + payload - Rebind report parameters 
    # + return - OK 
    remote isolated function reportsRebindreport(string reportId, RebindReportRequest payload) returns http:Response|error {
        string resourcePath = string `/reports/${getEncodedUri(reportId)}/Rebind`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of pages within the specified report from **"My Workspace"**.
    #
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsGetpages(string reportId) returns Pages|error {
        string resourcePath = string `/reports/${getEncodedUri(reportId)}/pages`;
        Pages response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the specified page within the specified report from **"My Workspace"**.
    #
    # + reportId - The report id 
    # + pageName - The page name 
    # + return - OK 
    remote isolated function reportsGetpage(string reportId, string pageName) returns Page|error {
        string resourcePath = string `/reports/${getEncodedUri(reportId)}/pages/${getEncodedUri(pageName)}`;
        Page response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of datasources for the specified RDL report from **"My Workspace"**.
    #
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsGetdatasources(string reportId) returns Datasources|error {
        string resourcePath = string `/reports/${getEncodedUri(reportId)}/datasources`;
        Datasources response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the datasources of the specified paginated report from **"My Workspace"**. (Preview)
    #
    # + reportId - The report id 
    # + payload - Update RDL datasources request 
    # + return - OK 
    remote isolated function reportsUpdatedatasources(string reportId, UpdateRdlDatasourcesRequest payload) returns http:Response|error {
        string resourcePath = string `/reports/${getEncodedUri(reportId)}/Default.UpdateDatasources`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Exports the specified report from **"My Workspace"** to the requested format.
    #
    # + reportId - The report id 
    # + payload - Export to file request parameters 
    # + return - Accepted 
    remote isolated function reportsExporttofile(string reportId, ExportReportRequest payload) returns Export|error {
        string resourcePath = string `/reports/${getEncodedUri(reportId)}/ExportTo`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Export response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the status of the Export to file job from **"My Workspace"**.
    #
    # + reportId - The report id 
    # + exportId - The export id 
    # + return - OK 
    remote isolated function reportsGetexporttofilestatus(string reportId, string exportId) returns Export|error {
        string resourcePath = string `/reports/${getEncodedUri(reportId)}/exports/${getEncodedUri(exportId)}`;
        Export response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the file of the Export to file job of the specified report from **"My Workspace"**.
    #
    # + reportId - The report id 
    # + exportId - The export id 
    # + return - The exported file 
    remote isolated function reportsGetfileofexporttofile(string reportId, string exportId) returns string|error {
        string resourcePath = string `/reports/${getEncodedUri(reportId)}/exports/${getEncodedUri(exportId)}/file`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of dashboards from **"My Workspace"**.
    #
    # + return - OK 
    remote isolated function dashboardsGetdashboards() returns Dashboards|error {
        string resourcePath = string `/dashboards`;
        Dashboards response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new empty dashboard on **"My Workspace"**.
    #
    # + payload - Add dashboard parameters 
    # + return - OK 
    remote isolated function dashboardsAdddashboard(AddDashboardRequest payload) returns Dashboard|error {
        string resourcePath = string `/dashboards`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Dashboard response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the specified dashboard from **"My Workspace"**.
    #
    # + dashboardId - The dashboard id 
    # + return - OK 
    remote isolated function dashboardsGetdashboard(string dashboardId) returns Dashboard|error {
        string resourcePath = string `/dashboards/${getEncodedUri(dashboardId)}`;
        Dashboard response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of tiles within the specified dashboard from **"My Workspace"**.
    #
    # + dashboardId - The dashboard id 
    # + return - OK 
    remote isolated function dashboardsGettiles(string dashboardId) returns Tiles|error {
        string resourcePath = string `/dashboards/${getEncodedUri(dashboardId)}/tiles`;
        Tiles response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the specified tile within the specified dashboard from **"My Workspace"**.
    #
    # + dashboardId - The dashboard id 
    # + tileId - The tile id 
    # + return - OK 
    remote isolated function dashboardsGettile(string dashboardId, string tileId) returns Tile|error {
        string resourcePath = string `/dashboards/${getEncodedUri(dashboardId)}/tiles/${getEncodedUri(tileId)}`;
        Tile response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Clones the specified tile from **"My Workspace"**.
    #
    # + dashboardId - The dashboard id 
    # + tileId - The tile id 
    # + payload - Clone tile parameters 
    # + return - OK 
    remote isolated function dashboardsClonetile(string dashboardId, string tileId, CloneTileRequest payload) returns Tile|error {
        string resourcePath = string `/dashboards/${getEncodedUri(dashboardId)}/tiles/${getEncodedUri(tileId)}/Clone`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Tile response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of datasets from the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function datasetsGetdatasetsingroup(string groupId) returns Datasets|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets`;
        Datasets response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new dataset in the specified workspace.
    #
    # + groupId - The workspace id 
    # + defaultRetentionPolicy - The default retention policy 
    # + payload - Create dataset parameters 
    # + return - Created 
    remote isolated function datasetsPostdatasetingroup(string groupId, CreateDatasetRequest payload, string? defaultRetentionPolicy = ()) returns Dataset|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets`;
        map<anydata> queryParam = {"defaultRetentionPolicy": defaultRetentionPolicy};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Dataset response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of upstream dataflows for datasets from the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function datasetsGetdatasettodataflowslinksingroup(string groupId) returns DatasetToDataflowLinksResponse|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/upstreamDataflows`;
        DatasetToDataflowLinksResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetdatasetingroup(string groupId, string datasetId) returns Dataset|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}`;
        Dataset response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsDeletedatasetingroup(string groupId, string datasetId) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns a list of tables within the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGettablesingroup(string groupId, string datasetId) returns Tables|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/tables`;
        Tables response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the metadata and schema for the specified table, within the specified dataset, from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + tableName - The table name 
    # + payload - The request message 
    # + return - OK 
    remote isolated function datasetsPuttableingroup(string groupId, string datasetId, string tableName, Table payload) returns Table|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/tables/${getEncodedUri(tableName)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Table response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Adds new data rows to the specified table, within the specified dataset, from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + tableName - The table name 
    # + payload - The request message 
    # + return - OK 
    remote isolated function datasetsPostrowsingroup(string groupId, string datasetId, string tableName, PostRowsRequest payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/tables/${getEncodedUri(tableName)}/rows`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Deletes all rows from the specified table, within the specified dataset, from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + tableName - The table name 
    # + return - OK 
    remote isolated function datasetsDeleterowsingroup(string groupId, string datasetId, string tableName) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/tables/${getEncodedUri(tableName)}/rows`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns the refresh history of the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + top - The requested number of entries in the refresh history. If not provided, the default is all available entries. 
    # + return - OK 
    remote isolated function datasetsGetrefreshhistoryingroup(string groupId, string datasetId, int? top = ()) returns Refreshes|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/refreshes`;
        map<anydata> queryParam = {"$top": top};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Refreshes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Triggers a refresh for the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + payload - Refresh request 
    # + return - Accepted 
    remote isolated function datasetsRefreshdatasetingroup(string groupId, string datasetId, RefreshRequest payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/refreshes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the refresh schedule of the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetrefreshscheduleingroup(string groupId, string datasetId) returns RefreshSchedule|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/refreshSchedule`;
        RefreshSchedule response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the refresh schedule for the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + payload - Update Refresh Schedule parameters, by specifying all or some of the parameters 
    # + return - OK 
    remote isolated function datasetsUpdaterefreshscheduleingroup(string groupId, string datasetId, RefreshScheduleRequest payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/refreshSchedule`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Returns the refresh schedule of a specified DirectQuery or LiveConnection dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetdirectqueryrefreshscheduleingroup(string groupId, string datasetId) returns DirectQueryRefreshSchedule|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/directQueryRefreshSchedule`;
        DirectQueryRefreshSchedule response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the refresh schedule for the specified DirectQuery or LiveConnection dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + payload - Patch DirectQuery or LiveConnection Refresh Schedule parameters, by specifying all or some of the parameters 
    # + return - OK 
    remote isolated function datasetsUpdatedirectqueryrefreshscheduleingroup(string groupId, string datasetId, DirectQueryRefreshScheduleRequest payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/directQueryRefreshSchedule`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Returns a list of parameters for the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetparametersingroup(string groupId, string datasetId) returns MashupParameters|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/parameters`;
        MashupParameters response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the parameters values for the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + payload - Update mashup parameter request 
    # + return - OK 
    remote isolated function datasetsUpdateparametersingroup(string groupId, string datasetId, UpdateMashupParametersRequest payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/Default.UpdateParameters`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of datasources for the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetdatasourcesingroup(string groupId, string datasetId) returns Datasources|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/datasources`;
        Datasources response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the datasources of the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + payload - Update datasource request 
    # + return - OK 
    remote isolated function datasetsUpdatedatasourcesingroup(string groupId, string datasetId, UpdateDatasourcesRequest payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/Default.UpdateDatasources`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Updates all connections for the specified dataset from the specified workspace. This API only supports SQL DirectQuery datasets.<h3>Note: This API is deprecated and no longer supported</h3>
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + payload - The body 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function datasetsSetalldatasetconnectionsingroup(string groupId, string datasetId, ConnectionDetails payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/Default.SetAllConnections`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Binds the specified dataset from the specified workspace to the specified gateway with (optional) given set of datasource Ids. This only supports the On-Premises Data Gateway.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + payload - The bind to gateway request 
    # + return - OK 
    remote isolated function datasetsBindtogatewayingroup(string groupId, string datasetId, BindToGatewayRequest payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/Default.BindToGateway`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of gateway datasources for the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetgatewaydatasourcesingroup(string groupId, string datasetId) returns GatewayDatasources|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/Default.GetBoundGatewayDatasources`;
        GatewayDatasources response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of gateways that the specified dataset from the specified workspace can be bound to.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsDiscovergatewaysingroup(string groupId, string datasetId) returns Gateways|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/Default.DiscoverGateways`;
        Gateways response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Transfers ownership over the specified dataset to the current authorized user.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsTakeoveringroup(string groupId, string datasetId) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/Default.TakeOver`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Returns a list of imports from the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function importsGetimportsingroup(string groupId) returns Imports|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/imports`;
        Imports response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates new content on the specified workspace from PBIX (Power BI Desktop), JSON, XLSX (Excel), RDL, or file path in OneDrive for Business.
    #
    # + groupId - The workspace id 
    # + datasetDisplayName - The display name of the dataset should include file extension. Not supported when importing from OneDrive for Business. For importing or creating dataflows, this parameter should be hardcoded to model.json. 
    # + nameConflict - Determines what to do if a dataset with the same name already exists. Default value is 'Ignore'.<br/>Only Abort and Overwrite are supported with Rdl files.<br/>Only Abort and GenerateUniqueName are supported with dataflow model.json files. 
    # + skipReport - Determines whether to skip report import, if specified value must be 'true'. Only supported for PBIX files. 
    # + payload - The import to post 
    # + return - OK 
    remote isolated function importsPostimportingroup(string groupId, string datasetDisplayName, ImportInfo payload, string? nameConflict = (), boolean? skipReport = ()) returns Import|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/imports`;
        map<anydata> queryParam = {"datasetDisplayName": datasetDisplayName, "nameConflict": nameConflict, "skipReport": skipReport};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Import response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the specified import from the specified workspace.
    #
    # + groupId - The workspace id 
    # + importId - The import id 
    # + return - OK 
    remote isolated function importsGetimportingroup(string groupId, string importId) returns Import|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/imports/${getEncodedUri(importId)}`;
        Import response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a temporary blob storage to be used to import large .pbix files larger than 1 GB and up to 10 GB.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function importsCreatetemporaryuploadlocationingroup(string groupId) returns TemporaryUploadLocation|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/imports/createTemporaryUploadLocation`;
        http:Request request = new;
        //TODO: Update the request as needed;
        TemporaryUploadLocation response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Returns a list of reports from the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function reportsGetreportsingroup(string groupId) returns Reports|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/reports`;
        Reports response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the specified report from the specified workspace.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsGetreportingroup(string groupId, string reportId) returns Report|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/reports/${getEncodedUri(reportId)}`;
        Report response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes the specified report from the specified workspace.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsDeletereportingroup(string groupId, string reportId) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/reports/${getEncodedUri(reportId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Clones the specified report from the specified workspace.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + payload - Clone report parameters 
    # + return - OK 
    remote isolated function reportsClonereportingroup(string groupId, string reportId, CloneReportRequest payload) returns Report|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/reports/${getEncodedUri(reportId)}/Clone`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Report response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Exports the specified report from the specified workspace to a .pbix file.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + return - Exported File 
    remote isolated function reportsExportreportingroup(string groupId, string reportId) returns string|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/reports/${getEncodedUri(reportId)}/Export`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the specified report from the specified workspace to have the same content as the specified report in the request body.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + payload - UpdateReportContent parameters 
    # + return - OK 
    remote isolated function reportsUpdatereportcontentingroup(string groupId, string reportId, UpdateReportContentRequest payload) returns Report|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/reports/${getEncodedUri(reportId)}/UpdateReportContent`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Report response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Rebinds the specified report from the specified workspace to the requested dataset.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + payload - Rebind report parameters 
    # + return - OK 
    remote isolated function reportsRebindreportingroup(string groupId, string reportId, RebindReportRequest payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/reports/${getEncodedUri(reportId)}/Rebind`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of pages within the specified report from the specified workspace.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsGetpagesingroup(string groupId, string reportId) returns Pages|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/reports/${getEncodedUri(reportId)}/pages`;
        Pages response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the specified page within the specified report from the specified workspace.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + pageName - The page name 
    # + return - OK 
    remote isolated function reportsGetpageingroup(string groupId, string reportId, string pageName) returns Page|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/reports/${getEncodedUri(reportId)}/pages/${getEncodedUri(pageName)}`;
        Page response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of datasources for the specified RDL report from the specified workspace.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsGetdatasourcesingroup(string groupId, string reportId) returns Datasources|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/reports/${getEncodedUri(reportId)}/datasources`;
        Datasources response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the datasources of the specified paginated report from the specified workspace. (Preview)
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + payload - Update RDL datasources request 
    # + return - OK 
    remote isolated function reportsUpdatedatasourcesingroup(string groupId, string reportId, UpdateRdlDatasourcesRequest payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/reports/${getEncodedUri(reportId)}/Default.UpdateDatasources`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Exports the specified report from the specified workspace to the requested format.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + payload - Export to file request parameters 
    # + return - Accepted 
    remote isolated function reportsExporttofileingroup(string groupId, string reportId, ExportReportRequest payload) returns Export|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/reports/${getEncodedUri(reportId)}/ExportTo`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Export response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the status of the Export to file job from the specified workspace.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + exportId - The export id 
    # + return - OK 
    remote isolated function reportsGetexporttofilestatusingroup(string groupId, string reportId, string exportId) returns Export|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/reports/${getEncodedUri(reportId)}/exports/${getEncodedUri(exportId)}`;
        Export response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the file of the Export to file job of the specified report from the specified group.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + exportId - The export id 
    # + return - The exported file 
    remote isolated function reportsGetfileofexporttofileingroup(string groupId, string reportId, string exportId) returns string|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/reports/${getEncodedUri(reportId)}/exports/${getEncodedUri(exportId)}/file`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of dashboards from the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function dashboardsGetdashboardsingroup(string groupId) returns Dashboards|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dashboards`;
        Dashboards response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new empty dashboard on the specified workspace.
    #
    # + groupId - The workspace id 
    # + payload - Add dashboard parameters 
    # + return - OK 
    remote isolated function dashboardsAdddashboardingroup(string groupId, AddDashboardRequest payload) returns Dashboard|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dashboards`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Dashboard response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the specified dashboard from the specified workspace.
    #
    # + groupId - The workspace id 
    # + dashboardId - The dashboard id 
    # + return - OK 
    remote isolated function dashboardsGetdashboardingroup(string groupId, string dashboardId) returns Dashboard|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dashboards/${getEncodedUri(dashboardId)}`;
        Dashboard response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of tiles within the specified dashboard from the specified workspace.
    #
    # + groupId - The workspace id 
    # + dashboardId - The dashboard id 
    # + return - OK 
    remote isolated function dashboardsGettilesingroup(string groupId, string dashboardId) returns Tiles|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dashboards/${getEncodedUri(dashboardId)}/tiles`;
        Tiles response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the specified tile within the specified dashboard from the specified workspace.
    #
    # + groupId - The workspace id 
    # + dashboardId - The dashboard id 
    # + tileId - The tile id 
    # + return - OK 
    remote isolated function dashboardsGettileingroup(string groupId, string dashboardId, string tileId) returns Tile|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dashboards/${getEncodedUri(dashboardId)}/tiles/${getEncodedUri(tileId)}`;
        Tile response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Clones the specified tile from the specified workspace.
    #
    # + groupId - The workspace id 
    # + dashboardId - The dashboard id 
    # + tileId - The tile id 
    # + payload - Clone tile parameters 
    # + return - OK 
    remote isolated function dashboardsClonetileingroup(string groupId, string dashboardId, string tileId, CloneTileRequest payload) returns Tile|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dashboards/${getEncodedUri(dashboardId)}/tiles/${getEncodedUri(tileId)}/Clone`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Tile response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Generates an embed token to allow report creation on the specified workspace based on the specified dataset.<br/><br/>This API is relevant only to ['App owns data' embed scenario](https://docs.microsoft.com/power-bi/developer/embed-sample-for-customers). For more information about using this API, see [Considerations when generating an embed token](https://docs.microsoft.com/power-bi/developer/embedded/generate-embed-token).
    #
    # + groupId - The workspace id 
    # + payload - Generate token parameters 
    # + return - OK 
    remote isolated function reportsGeneratetokenforcreateingroup(string groupId, GenerateTokenRequest payload) returns EmbedToken|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/reports/GenerateToken`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmbedToken response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Generates an embed token to view or edit the specified report from the specified workspace.<br/><br/>This API is relevant only to ['App owns data' embed scenario](https://docs.microsoft.com/power-bi/developer/embed-sample-for-customers). For more information about using this API, see [Considerations when generating an embed token](https://docs.microsoft.com/power-bi/developer/embedded/generate-embed-token).
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + payload - Generate token parameters 
    # + return - OK 
    remote isolated function reportsGeneratetokeningroup(string groupId, string reportId, GenerateTokenRequest payload) returns EmbedToken|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/reports/${getEncodedUri(reportId)}/GenerateToken`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmbedToken response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Generates an embed token to [Embed Q&A](https://docs.microsoft.com/power-bi/developer/qanda) based on the specified dataset from the specified workspace.<br/><br/>This API is relevant only to ['App owns data' embed scenario](https://docs.microsoft.com/power-bi/developer/embed-sample-for-customers). For more information about using this API, see [Considerations when generating an embed token](https://docs.microsoft.com/power-bi/developer/embedded/generate-embed-token).
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + payload - Generate token parameters 
    # + return - OK 
    remote isolated function datasetsGeneratetokeningroup(string groupId, string datasetId, GenerateTokenRequest payload) returns EmbedToken|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/datasets/${getEncodedUri(datasetId)}/GenerateToken`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmbedToken response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Generates an embed token to view the specified dashboard from the specified workspace.<br/><br/>This API is relevant only to the ['App owns data' embed scenario](https://docs.microsoft.com/power-bi/developer/embed-sample-for-customers). For more information about using this API, see [Considerations when generating an embed token](https://docs.microsoft.com/power-bi/developer/embedded/generate-embed-token).
    #
    # + groupId - The workspace id 
    # + dashboardId - The dashboard id 
    # + payload - Generate token parameters 
    # + return - OK 
    remote isolated function dashboardsGeneratetokeningroup(string groupId, string dashboardId, GenerateTokenRequest payload) returns EmbedToken|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dashboards/${getEncodedUri(dashboardId)}/GenerateToken`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmbedToken response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Generates an embed token to view the specified tile from the specified workspace.<br/><br/>This API is relevant only to ['App owns data' embed scenario](https://docs.microsoft.com/power-bi/developer/embed-sample-for-customers). Generates an embed token to view the specified tile from the specified workspace.
    #
    # + groupId - The workspace id 
    # + dashboardId - The dashboard id 
    # + tileId - The tile id 
    # + payload - Generate token parameters 
    # + return - OK 
    remote isolated function tilesGeneratetokeningroup(string groupId, string dashboardId, string tileId, GenerateTokenRequest payload) returns EmbedToken|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dashboards/${getEncodedUri(dashboardId)}/tiles/${getEncodedUri(tileId)}/GenerateToken`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmbedToken response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of installed apps.
    #
    # + return - OK 
    remote isolated function appsGetapps() returns Apps|error {
        string resourcePath = string `/apps`;
        Apps response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the specified installed app.
    #
    # + appId - The app id 
    # + return - OK 
    remote isolated function appsGetapp(string appId) returns App|error {
        string resourcePath = string `/apps/${getEncodedUri(appId)}`;
        App response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of reports from the specified app.
    #
    # + appId - The app id 
    # + return - OK 
    remote isolated function appsGetreports(string appId) returns Reports|error {
        string resourcePath = string `/apps/${getEncodedUri(appId)}/reports`;
        Reports response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the specified report from the specified app.
    #
    # + appId - The app id 
    # + reportId - The report id 
    # + return - OK 
    remote isolated function appsGetreport(string appId, string reportId) returns Report|error {
        string resourcePath = string `/apps/${getEncodedUri(appId)}/reports/${getEncodedUri(reportId)}`;
        Report response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of dashboards from the specified app.
    #
    # + appId - The app id 
    # + return - OK 
    remote isolated function appsGetdashboards(string appId) returns Dashboards|error {
        string resourcePath = string `/apps/${getEncodedUri(appId)}/dashboards`;
        Dashboards response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the specified dashboard from the specified app.
    #
    # + appId - The app id 
    # + dashboardId - The dashboard id 
    # + return - OK 
    remote isolated function appsGetdashboard(string appId, string dashboardId) returns Dashboard|error {
        string resourcePath = string `/apps/${getEncodedUri(appId)}/dashboards/${getEncodedUri(dashboardId)}`;
        Dashboard response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of tiles within the specified dashboard from the specified app.
    #
    # + appId - The app id 
    # + dashboardId - The dashboard id 
    # + return - OK 
    remote isolated function appsGettiles(string appId, string dashboardId) returns Tiles|error {
        string resourcePath = string `/apps/${getEncodedUri(appId)}/dashboards/${getEncodedUri(dashboardId)}/tiles`;
        Tiles response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the specified tile within the specified dashboard from the specified app.
    #
    # + appId - The app id 
    # + dashboardId - The dashboard id 
    # + tileId - The tile id 
    # + return - OK 
    remote isolated function appsGettile(string appId, string dashboardId, string tileId) returns Tile|error {
        string resourcePath = string `/apps/${getEncodedUri(appId)}/dashboards/${getEncodedUri(dashboardId)}/tiles/${getEncodedUri(tileId)}`;
        Tile response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Exports the specified dataflow definition to a .json file.
    #
    # + groupId - The workspace id 
    # + dataflowId - The dataflow id 
    # + return - Exported Json file 
    remote isolated function dataflowsGetdataflow(string groupId, string dataflowId) returns string|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dataflows/${getEncodedUri(dataflowId)}`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a dataflow from the CDS for Analytics storage, including its definition file and actual model.
    #
    # + groupId - The workspace id 
    # + dataflowId - The dataflow id 
    # + return - OK 
    remote isolated function dataflowsDeletedataflow(string groupId, string dataflowId) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dataflows/${getEncodedUri(dataflowId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update dataflow properties, capabilities and settings.
    #
    # + groupId - The workspace id 
    # + dataflowId - The dataflow id 
    # + payload - Patch dataflow properties, capabilities and settings 
    # + return - OK 
    remote isolated function dataflowsUpdatedataflow(string groupId, string dataflowId, DataflowUpdateRequestMessage payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dataflows/${getEncodedUri(dataflowId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Triggers a refresh for the specified dataflow. The only supported mail notification options are either in case of failure, or none. MailOnCompletion is not supported.
    #
    # + groupId - The workspace id 
    # + dataflowId - The dataflow id 
    # + processType - Type of refresh process to use. 
    # + payload - Refresh request 
    # + return - OK 
    remote isolated function dataflowsRefreshdataflow(string groupId, string dataflowId, RefreshRequest payload, string? processType = ()) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dataflows/${getEncodedUri(dataflowId)}/refreshes`;
        map<anydata> queryParam = {"processType": processType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of datasources for the specified dataflow.
    #
    # + groupId - The workspace id 
    # + dataflowId - The dataflow id 
    # + return - OK 
    remote isolated function dataflowsGetdataflowdatasources(string groupId, string dataflowId) returns Datasources|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dataflows/${getEncodedUri(dataflowId)}/datasources`;
        Datasources response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of all dataflows from the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function dataflowsGetdataflows(string groupId) returns Dataflows|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dataflows`;
        Dataflows response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of upstream dataflows for the specified dataflow.
    #
    # + groupId - The workspace id 
    # + dataflowId - The dataflow id 
    # + return - OK 
    remote isolated function dataflowsGetupstreamdataflowsingroup(string groupId, string dataflowId) returns DependentDataflows|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dataflows/${getEncodedUri(dataflowId)}/upstreamDataflows`;
        DependentDataflows response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates or updates the specified dataflow refresh schedule configuration.
    #
    # + groupId - The workspace id 
    # + dataflowId - The dataflow id 
    # + payload - The dataflow refresh schedule to create or update 
    # + return - OK 
    remote isolated function dataflowsUpdaterefreshschedule(string groupId, string dataflowId, RefreshScheduleRequest payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dataflows/${getEncodedUri(dataflowId)}/refreshSchedule`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Returns a list of transactions for the specified dataflow.
    #
    # + groupId - The workspace id 
    # + dataflowId - The dataflow id 
    # + return - OK 
    remote isolated function dataflowsGetdataflowtransactions(string groupId, string dataflowId) returns DataflowTransactions|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dataflows/${getEncodedUri(dataflowId)}/transactions`;
        DataflowTransactions response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Attempts to Cancel the specified transactions.
    #
    # + groupId - The workspace id 
    # + transactionId - The transaction id 
    # + return - OK 
    remote isolated function dataflowsCanceldataflowtransaction(string groupId, string transactionId) returns DataflowTransactionStatus|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/dataflows//transactions/${getEncodedUri(transactionId)}/cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        DataflowTransactionStatus response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Returns a list of gateways for which the user is an admin.
    #
    # + return - OK 
    remote isolated function gatewaysGetgateways() returns Gateways|error {
        string resourcePath = string `/gateways`;
        Gateways response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the specified gateway.
    #
    # + gatewayId - The gateway id 
    # + return - OK 
    remote isolated function gatewaysGetgateway(string gatewayId) returns Gateway|error {
        string resourcePath = string `/gateways/${getEncodedUri(gatewayId)}`;
        Gateway response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of datasources from the specified gateway.
    #
    # + gatewayId - The gateway id 
    # + return - OK 
    remote isolated function gatewaysGetdatasources(string gatewayId) returns GatewayDatasources|error {
        string resourcePath = string `/gateways/${getEncodedUri(gatewayId)}/datasources`;
        GatewayDatasources response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new datasource on the specified gateway.
    #
    # + gatewayId - The gateway id 
    # + payload - The datasource requested to create 
    # + return - Created 
    remote isolated function gatewaysCreatedatasource(string gatewayId, PublishDatasourceToGatewayRequest payload) returns GatewayDatasource|error {
        string resourcePath = string `/gateways/${getEncodedUri(gatewayId)}/datasources`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GatewayDatasource response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the specified datasource from the specified gateway.
    #
    # + gatewayId - The gateway id 
    # + datasourceId - The datasource id 
    # + return - OK 
    remote isolated function gatewaysGetdatasource(string gatewayId, string datasourceId) returns GatewayDatasource|error {
        string resourcePath = string `/gateways/${getEncodedUri(gatewayId)}/datasources/${getEncodedUri(datasourceId)}`;
        GatewayDatasource response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes the specified datasource from the specified gateway.
    #
    # + gatewayId - The gateway id 
    # + datasourceId - The datasource id 
    # + return - OK 
    remote isolated function gatewaysDeletedatasource(string gatewayId, string datasourceId) returns http:Response|error {
        string resourcePath = string `/gateways/${getEncodedUri(gatewayId)}/datasources/${getEncodedUri(datasourceId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates the credentials of the specified datasource from the specified gateway.
    #
    # + gatewayId - The gateway id 
    # + datasourceId - The datasource id 
    # + payload - The update datasource request 
    # + return - OK 
    remote isolated function gatewaysUpdatedatasource(string gatewayId, string datasourceId, UpdateDatasourceRequest payload) returns http:Response|error {
        string resourcePath = string `/gateways/${getEncodedUri(gatewayId)}/datasources/${getEncodedUri(datasourceId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Checks the connectivity status of the specified datasource from the specified gateway.
    #
    # + gatewayId - The gateway id 
    # + datasourceId - The datasource id 
    # + return - OK 
    remote isolated function gatewaysGetdatasourcestatus(string gatewayId, string datasourceId) returns http:Response|error {
        string resourcePath = string `/gateways/${getEncodedUri(gatewayId)}/datasources/${getEncodedUri(datasourceId)}/status`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of users who have access to the specified datasource.
    #
    # + gatewayId - The gateway id 
    # + datasourceId - The datasource id 
    # + return - OK 
    remote isolated function gatewaysGetdatasourceusers(string gatewayId, string datasourceId) returns DatasourceUsers|error {
        string resourcePath = string `/gateways/${getEncodedUri(gatewayId)}/datasources/${getEncodedUri(datasourceId)}/users`;
        DatasourceUsers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Grants or updates the permissions required to use the specified datasource for the specified user.
    #
    # + gatewayId - The gateway id 
    # + datasourceId - The datasource id 
    # + payload - The add user to datasource request 
    # + return - OK 
    remote isolated function gatewaysAdddatasourceuser(string gatewayId, string datasourceId, DatasourceUser payload) returns http:Response|error {
        string resourcePath = string `/gateways/${getEncodedUri(gatewayId)}/datasources/${getEncodedUri(datasourceId)}/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Removes the specified user from the specified datasource.
    #
    # + gatewayId - The gateway id 
    # + datasourceId - The datasource id 
    # + emailAdress - The user's email address or the service principal object id 
    # + return - OK 
    remote isolated function gatewaysDeletedatasourceuser(string gatewayId, string datasourceId, string emailAdress) returns http:Response|error {
        string resourcePath = string `/gateways/${getEncodedUri(gatewayId)}/datasources/${getEncodedUri(datasourceId)}/users/${getEncodedUri(emailAdress)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns a list of workspaces the user has access to.
    #
    # + filter - Filters the results, based on a boolean condition 
    # + top - Returns only the first n results 
    # + skip - Skips the first n results 
    # + return - OK 
    remote isolated function groupsGetgroups(string? filter = (), int? top = (), int? skip = ()) returns Groups|error {
        string resourcePath = string `/groups`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Groups response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates new workspace.
    #
    # + workspaceV2 - Preview feature: Create a workspace V2. The only supported value is true. 
    # + payload - Create group request parameters 
    # + return - OK 
    remote isolated function groupsCreategroup(GroupCreationRequest payload, boolean? workspaceV2 = ()) returns Group|error {
        string resourcePath = string `/groups`;
        map<anydata> queryParam = {"workspaceV2": workspaceV2};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Group response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Deletes the specified workspace.
    #
    # + groupId - The workspace id to delete 
    # + return - OK 
    remote isolated function groupsDeletegroup(string groupId) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns a list of users that have access to the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function groupsGetgroupusers(string groupId) returns GroupUsers|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/users`;
        GroupUsers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update the specified user permissions to the specified workspace.
    #
    # + groupId - The workspace id 
    # + payload - Details of user access right 
    # + return - OK 
    remote isolated function groupsUpdategroupuser(string groupId, GroupUser payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Grants the specified user permissions to the specified workspace.
    #
    # + groupId - The workspace id 
    # + payload - Details of user access right 
    # + return - OK 
    remote isolated function groupsAddgroupuser(string groupId, GroupUser payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Deletes the specified user permissions from the specified workspace.
    #
    # + groupId - The workspace id 
    # + user - The email address of the user or the service principal object id to delete 
    # + return - OK 
    remote isolated function groupsDeleteuseringroup(string groupId, string user) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/users/${getEncodedUri(user)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns a list of capacities the user has access to.
    #
    # + return - OK 
    remote isolated function capacitiesGetcapacities() returns Capacities|error {
        string resourcePath = string `/capacities`;
        Capacities response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the current state of the specified capacity workloads, if a workload is enabled also returns the maximum memory percentage that the workload can consume.
    #
    # + capacityId - The capacity Id 
    # + return - OK 
    remote isolated function capacitiesGetworkloads(string capacityId) returns Workloads|error {
        string resourcePath = string `/capacities/${getEncodedUri(capacityId)}/Workloads`;
        Workloads response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the current state of a workload and if the workload is enabled also returns the maximum memory percentage that the workload can consume.
    #
    # + capacityId - The capacity Id 
    # + workloadName - The name of the workload 
    # + return - OK 
    remote isolated function capacitiesGetworkload(string capacityId, string workloadName) returns Workload|error {
        string resourcePath = string `/capacities/${getEncodedUri(capacityId)}/Workloads/${getEncodedUri(workloadName)}`;
        Workload response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Changes the state of a specific workload to Enabled or Disabled. When enabling a workload the maximum memory percentage that the workload can consume must be set.
    #
    # + capacityId - The capacity Id 
    # + workloadName - The name of the workload 
    # + payload - Patch workload parameters 
    # + return - OK 
    remote isolated function capacitiesPatchworkload(string capacityId, string workloadName, PatchWorkloadRequest payload) returns http:Response|error {
        string resourcePath = string `/capacities/${getEncodedUri(capacityId)}/Workloads/${getEncodedUri(workloadName)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Returns a list of refreshables for all capacities of which the user has access to.
    #
    # + expand - Expands related entities inline, receives a comma-separated list of data types. Supported: capacities and groups 
    # + filter - Filters the results based on a boolean condition 
    # + top - Returns only the first n results. 
    # + skip - Skips the first n results. Use with top to fetch results beyond the first 1000. 
    # + return - OK 
    remote isolated function capacitiesGetrefreshables(int top, string? expand = (), string? filter = (), int? skip = ()) returns Refreshables|error {
        string resourcePath = string `/capacities/refreshables`;
        map<anydata> queryParam = {"$expand": expand, "$filter": filter, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Refreshables response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of refreshables for the specified capacity the user has access to
    #
    # + capacityId - The capacity id 
    # + expand - Expands related entities inline, receives a comma-separated list of data types. Supported: capacities and groups 
    # + filter - Filters the results based on a boolean condition 
    # + top - Returns only the first n results. 
    # + skip - Skips the first n results. Use with top to fetch results beyond the first 1000. 
    # + return - OK 
    remote isolated function capacitiesGetrefreshablesforcapacity(string capacityId, int top, string? expand = (), string? filter = (), int? skip = ()) returns Refreshables|error {
        string resourcePath = string `/capacities/${getEncodedUri(capacityId)}/refreshables`;
        map<anydata> queryParam = {"$expand": expand, "$filter": filter, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Refreshables response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the specified refreshable for the specified capacity the user has access to
    #
    # + capacityId - The capacity id 
    # + refreshableId - The refreshable id 
    # + expand - Expands related entities inline, receives a comma-separated list of data types. Supported: capacities and groups 
    # + return - OK 
    remote isolated function capacitiesGetrefreshableforcapacity(string capacityId, string refreshableId, string? expand = ()) returns Refreshables|error {
        string resourcePath = string `/capacities/${getEncodedUri(capacityId)}/refreshables/${getEncodedUri(refreshableId)}`;
        map<anydata> queryParam = {"$expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Refreshables response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Assigns **"My Workspace"** to the specified capacity.
    #
    # + payload - Assign to capacity parameters 
    # + return - OK 
    remote isolated function groupsAssignmyworkspacetocapacity(AssignToCapacityRequest payload) returns http:Response|error {
        string resourcePath = string `/AssignToCapacity`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Assigns the specified workspace to the specified capacity.
    #
    # + groupId - The workspace id 
    # + payload - Assign to capacity parameters 
    # + return - OK 
    remote isolated function groupsAssigntocapacity(string groupId, AssignToCapacityRequest payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/AssignToCapacity`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets the status of **"My Workspace"** assignment to capacity operation.
    #
    # + return - OK 
    remote isolated function groupsCapacityassignmentstatusmyworkspace() returns WorkspaceCapacityAssignmentStatus|error {
        string resourcePath = string `/CapacityAssignmentStatus`;
        WorkspaceCapacityAssignmentStatus response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the status of the assignment to capacity operation of the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function groupsCapacityassignmentstatus(string groupId) returns WorkspaceCapacityAssignmentStatus|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/CapacityAssignmentStatus`;
        WorkspaceCapacityAssignmentStatus response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of available features for the user
    #
    # + return - OK 
    remote isolated function availablefeaturesGetavailablefeatures() returns AvailableFeatures|error {
        string resourcePath = string `/availableFeatures`;
        AvailableFeatures response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the specified available feature for user by name.
    #
    # + featureName - The feature name 
    # + return - OK 
    remote isolated function availablefeaturesGetavailablefeaturebyname(string featureName) returns AvailableFeature|error {
        string resourcePath = string `/availableFeatures(featureName='${getEncodedUri(featureName)}')`;
        AvailableFeature response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of dataflow storage accounts the user has access to.
    #
    # + return - OK 
    remote isolated function dataflowstorageaccountsGetdataflowstorageaccounts() returns DataflowStorageAccounts|error {
        string resourcePath = string `/dataflowStorageAccounts`;
        DataflowStorageAccounts response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Assigns the specified workspace to the specified dataflow storage account.
    #
    # + groupId - The workspace id 
    # + payload - Assign to Power BI dataflow storage account parameters 
    # + return - OK 
    remote isolated function groupsAssigntodataflowstorage(string groupId, AssignToDataflowStorageRequest payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/AssignToDataflowStorage`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Initiate a call to receive metadata for the requested list of workspaces. (Preview)
    #
    # + lineage - Whether to return lineage info (upstream dataflows, tiles, datasource IDs)​ 
    # + datasourceDetails - Whether to return datasource details​ 
    # + payload - Required workspace IDs to get info for 
    # + return - Accepted 
    remote isolated function workspaceinfoPostworkspaceinfo(RequiredWorkspaces payload, boolean? lineage = (), boolean? datasourceDetails = ()) returns ScanRequest|error {
        string resourcePath = string `/admin/workspaces/getInfo`;
        map<anydata> queryParam = {"lineage": lineage, "datasourceDetails": datasourceDetails};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ScanRequest response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets scan status for the specified scan. (Preview)
    #
    # + scanId - The scan id 
    # + return - OK 
    remote isolated function workspaceinfoGetscanstatus(string scanId) returns ScanRequest|error {
        string resourcePath = string `/admin/workspaces/scanStatus/${getEncodedUri(scanId)}`;
        ScanRequest response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets scan result for the specified scan (should be called only after getting status Succeeded in the scan status API). Scan result will be available for up to 24 hours. (Preview)
    #
    # + scanId - The scan id 
    # + return - OK 
    remote isolated function workspaceinfoGetscanresult(string scanId) returns WorkspaceInfoResponse|error {
        string resourcePath = string `/admin/workspaces/scanResult/${getEncodedUri(scanId)}`;
        WorkspaceInfoResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of workspace IDs in the organization. When using modifiedSince, returns only the IDs of workspaces that had changed since the time specified in the modifiedSince parameter. If not provided, returns a list of all workspace IDs in the organization. modifiedSince parameter should range from 30 minutes to 30 days ago. Notice changes can take up to 30 minutes to take effect. (Preview)
    #
    # + modifiedSince - Last modified date​ (must be in ISO 8601 compliant UTC format) 
    # + return - OK 
    remote isolated function workspaceinfoGetmodifiedworkspaces(string? modifiedSince = ()) returns ModifiedWorkspaces|error {
        string resourcePath = string `/admin/workspaces/modified`;
        map<anydata> queryParam = {"modifiedSince": modifiedSince};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ModifiedWorkspaces response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Assigns the provided workspaces to the specified capacity.
    #
    # + payload - Admin assign workspaces capacity parameters 
    # + return - OK 
    remote isolated function capacitiesAssignworkspacestocapacity(AssignWorkspacesToCapacityRequest payload) returns http:Response|error {
        string resourcePath = string `/admin/capacities/AssignWorkspaces`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Unassigns the provided workspaces from capacity.
    #
    # + payload - Admin assign workspaces to shared capacity parameters 
    # + return - OK 
    remote isolated function capacitiesUnassignworkspacesfromcapacity(UnassignWorkspacesCapacityRequest payload) returns http:Response|error {
        string resourcePath = string `/admin/capacities/UnassignWorkspaces`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of datasets for the organization.
    #
    # + filter - Filters the results, based on a boolean condition 
    # + top - Returns only the first n results 
    # + skip - Skips the first n results 
    # + return - OK 
    remote isolated function datasetsGetdatasetsasadmin(string? filter = (), int? top = (), int? skip = ()) returns Datasets|error {
        string resourcePath = string `/admin/datasets`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Datasets response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of datasources for the specified dataset.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetdatasourcesasadmin(string datasetId) returns Datasources|error {
        string resourcePath = string `/admin/datasets/${getEncodedUri(datasetId)}/datasources`;
        Datasources response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of workspaces for the organization.
    #
    # + expand - Expands related entities inline, receives a comma-separated list of data types. Supported: users, reports, dashboards, datasets, dataflows, workbooks 
    # + filter - Filters the results based on a boolean condition 
    # + top - Returns only the first n results. This parameter is mandatory and must be in the range of 1-5000. 
    # + skip - Skips the first n results. Use with top to fetch results beyond the first 5000. 
    # + return - OK 
    remote isolated function groupsGetgroupsasadmin(int top, string? expand = (), string? filter = (), int? skip = ()) returns Groups|error {
        string resourcePath = string `/admin/groups`;
        map<anydata> queryParam = {"$expand": expand, "$filter": filter, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Groups response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the specified workspace properties.
    #
    # + groupId - The workspace id 
    # + payload - The properties to update 
    # + return - OK 
    remote isolated function groupsUpdategroupasadmin(string groupId, Group payload) returns http:Response|error {
        string resourcePath = string `/admin/groups/${getEncodedUri(groupId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Grants user permissions to the specified workspace.
    #
    # + groupId - The workspace id 
    # + payload - Details of user access right 
    # + return - OK 
    remote isolated function groupsAdduserasadmin(string groupId, GroupUser payload) returns http:Response|error {
        string resourcePath = string `/admin/groups/${getEncodedUri(groupId)}/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Removes user permissions to the specified workspace.
    #
    # + groupId - The workspace id 
    # + user - The user principal name (UPN) of the user to remove (usually the user's email). 
    # + return - OK 
    remote isolated function groupsDeleteuserasadmin(string groupId, string user) returns http:Response|error {
        string resourcePath = string `/admin/groups/${getEncodedUri(groupId)}/users/${getEncodedUri(user)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Restores a deleted workspace.
    #
    # + groupId - The workspace id 
    # + payload - Details of the group restore request 
    # + return - OK 
    remote isolated function groupsRestoredeletedgroupasadmin(string groupId, GroupRestoreRequest payload) returns http:Response|error {
        string resourcePath = string `/admin/groups/${getEncodedUri(groupId)}/restore`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of upstream dataflows for the specified dataflow.
    #
    # + groupId - The workspace id 
    # + dataflowId - The dataflow id 
    # + return - OK 
    remote isolated function dataflowsGetupstreamdataflowsingroupasadmin(string groupId, string dataflowId) returns DependentDataflows|error {
        string resourcePath = string `/admin/groups/${getEncodedUri(groupId)}/dataflows/${getEncodedUri(dataflowId)}/upstreamDataflows`;
        DependentDataflows response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of dashboards from the specified workspace.
    #
    # + groupId - The workspace id 
    # + filter - Filters the results, based on a boolean condition 
    # + top - Returns only the first n results 
    # + skip - Skips the first n results 
    # + return - OK 
    remote isolated function dashboardsGetdashboardsingroupasadmin(string groupId, string? filter = (), int? top = (), int? skip = ()) returns Dashboards|error {
        string resourcePath = string `/admin/groups/${getEncodedUri(groupId)}/dashboards`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Dashboards response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of reports from the specified workspace.
    #
    # + groupId - The workspace id 
    # + filter - Filters the results, based on a boolean condition 
    # + top - Returns only the first n results 
    # + skip - Skips the first n results 
    # + return - OK 
    remote isolated function reportsGetreportsingroupasadmin(string groupId, string? filter = (), int? top = (), int? skip = ()) returns Reports|error {
        string resourcePath = string `/admin/groups/${getEncodedUri(groupId)}/reports`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Reports response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of datasets from the specified workspace.
    #
    # + groupId - The workspace id 
    # + filter - Filters the results, based on a boolean condition 
    # + top - Returns only the first n results 
    # + skip - Skips the first n results 
    # + expand - Expands related entities inline 
    # + return - OK 
    remote isolated function datasetsGetdatasetsingroupasadmin(string groupId, string? filter = (), int? top = (), int? skip = (), string? expand = ()) returns Datasets|error {
        string resourcePath = string `/admin/groups/${getEncodedUri(groupId)}/datasets`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Datasets response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of upstream dataflows for datasets from the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function datasetsGetdatasettodataflowslinksingroupasadmin(string groupId) returns DatasetToDataflowLinksResponse|error {
        string resourcePath = string `/admin/groups/${getEncodedUri(groupId)}/datasets/upstreamDataflows`;
        DatasetToDataflowLinksResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of dataflows from the specified workspace.
    #
    # + groupId - The workspace id 
    # + filter - Filters the results, based on a boolean condition 
    # + top - Returns only the first n results 
    # + skip - Skips the first n results 
    # + return - OK 
    remote isolated function dataflowsGetdataflowsingroupasadmin(string groupId, string? filter = (), int? top = (), int? skip = ()) returns Dataflows|error {
        string resourcePath = string `/admin/groups/${getEncodedUri(groupId)}/dataflows`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Dataflows response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of reports for the organization.
    #
    # + filter - Filters the results, based on a boolean condition 
    # + top - Returns only the first n results 
    # + skip - Skips the first n results 
    # + return - OK 
    remote isolated function reportsGetreportsasadmin(string? filter = (), int? top = (), int? skip = ()) returns Reports|error {
        string resourcePath = string `/admin/reports`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Reports response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of dashboards for the organization.
    #
    # + expand - Expands related entities inline, receives a comma-separated list of data types. Supported: tiles 
    # + filter - Filters the results, based on a boolean condition 
    # + top - Returns only the first n results 
    # + skip - Skips the first n results 
    # + return - OK 
    remote isolated function dashboardsGetdashboardsasadmin(string? expand = (), string? filter = (), int? top = (), int? skip = ()) returns Dashboards|error {
        string resourcePath = string `/admin/dashboards`;
        map<anydata> queryParam = {"$expand": expand, "$filter": filter, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Dashboards response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of tiles within the specified dashboard.
    #
    # + dashboardId - The dashboard id 
    # + return - OK 
    remote isolated function dashboardsGettilesasadmin(string dashboardId) returns Tiles|error {
        string resourcePath = string `/admin/dashboards/${getEncodedUri(dashboardId)}/tiles`;
        Tiles response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of imports for the organization.
    #
    # + expand - Expands related entities inline 
    # + filter - Filters the results, based on a boolean condition 
    # + top - Returns only the first n results 
    # + skip - Skips the first n results 
    # + return - OK 
    remote isolated function importsGetimportsasadmin(string? expand = (), string? filter = (), int? top = (), int? skip = ()) returns Imports|error {
        string resourcePath = string `/admin/imports`;
        map<anydata> queryParam = {"$expand": expand, "$filter": filter, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Imports response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the encryption keys for the tenant.
    #
    # + return - OK 
    remote isolated function adminGetpowerbiencryptionkeys() returns TenantKeys|error {
        string resourcePath = string `/admin/tenantKeys`;
        TenantKeys response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds an encryption key for Power BI workspaces assigned to a capacity.
    #
    # + payload - Tenant key information 
    # + return - OK 
    remote isolated function adminAddpowerbiencryptionkey(TenantKeyCreationRequest payload) returns TenantKey|error {
        string resourcePath = string `/admin/tenantKeys`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TenantKey response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Rotate the encryption key for Power BI workspaces assigned to a capacity.
    #
    # + tenantKeyId - Tenant key id 
    # + payload - Tenant key information 
    # + return - OK 
    remote isolated function adminRotatepowerbiencryptionkey(string tenantKeyId, TenantKeyRotationRequest payload) returns TenantKey|error {
        string resourcePath = string `/admin/tenantKeys/${getEncodedUri(tenantKeyId)}/Default.Rotate`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TenantKey response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of capacities for the organization.
    #
    # + expand - Expands related entities inline 
    # + return - OK 
    remote isolated function adminGetcapacitiesasadmin(string? expand = ()) returns Capacities|error {
        string resourcePath = string `/admin/capacities`;
        map<anydata> queryParam = {"$expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Capacities response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Changes the specific capacity information. Currently, only supports changing the capacity encryption key
    #
    # + capacityId - The capacity Id 
    # + payload - Patch capacity information 
    # + return - OK 
    remote isolated function adminPatchcapacityasadmin(string capacityId, CapacityPatchRequest payload) returns http:Response|error {
        string resourcePath = string `/admin/capacities/${getEncodedUri(capacityId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Returns a list of refreshables for the organization within a capacity
    #
    # + expand - Expands related entities inline, receives a comma-separated list of data types. Supported: capacities and groups 
    # + filter - Filters the results based on a boolean condition 
    # + top - Returns only the first n results. 
    # + skip - Skips the first n results. Use with top to fetch results beyond the first 1000. 
    # + return - OK 
    remote isolated function adminGetrefreshables(int top, string? expand = (), string? filter = (), int? skip = ()) returns Refreshables|error {
        string resourcePath = string `/admin/capacities/refreshables`;
        map<anydata> queryParam = {"$expand": expand, "$filter": filter, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Refreshables response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of refreshables for the specified capacity the user has access to
    #
    # + capacityId - The capacity id 
    # + expand - Expands related entities inline, receives a comma-separated list of data types. Supported: capacities and groups 
    # + filter - Filters the results based on a boolean condition 
    # + top - Returns only the first n results. 
    # + skip - Skips the first n results. Use with top to fetch results beyond the first 1000. 
    # + return - OK 
    remote isolated function adminGetrefreshablesforcapacity(string capacityId, int top, string? expand = (), string? filter = (), int? skip = ()) returns Refreshables|error {
        string resourcePath = string `/admin/capacities/${getEncodedUri(capacityId)}/refreshables`;
        map<anydata> queryParam = {"$expand": expand, "$filter": filter, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Refreshables response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the specified refreshable for the specified capacity the user has access to
    #
    # + capacityId - The capacity id 
    # + refreshableId - The refreshable id 
    # + expand - Expands related entities inline, receives a comma-separated list of data types. Supported: capacities and groups 
    # + return - OK 
    remote isolated function adminGetrefreshableforcapacity(string capacityId, string refreshableId, string? expand = ()) returns Refreshables|error {
        string resourcePath = string `/admin/capacities/${getEncodedUri(capacityId)}/refreshables/${getEncodedUri(refreshableId)}`;
        map<anydata> queryParam = {"$expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Refreshables response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of dataflows for the organization.
    #
    # + filter - Filters the results, based on a boolean condition 
    # + top - Returns only the first n results 
    # + skip - Skips the first n results 
    # + return - OK 
    remote isolated function dataflowsGetdataflowsasadmin(string? filter = (), int? top = (), int? skip = ()) returns Dataflows|error {
        string resourcePath = string `/admin/dataflows`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Dataflows response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Exports the specified dataflow definition to a .json file.
    #
    # + dataflowId - The dataflow id 
    # + return - Exported Json file 
    remote isolated function dataflowsExportdataflowasadmin(string dataflowId) returns string|error {
        string resourcePath = string `/admin/dataflows/${getEncodedUri(dataflowId)}/export`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of datasources for the specified dataflow.
    #
    # + dataflowId - The dataflow id 
    # + return - OK 
    remote isolated function dataflowsGetdataflowdatasourcesasadmin(string dataflowId) returns Datasources|error {
        string resourcePath = string `/admin/dataflows/${getEncodedUri(dataflowId)}/datasources`;
        Datasources response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Generates an embed token for multiple reports, datasets and target workspaces. Reports and datasets do not have to be related. The binding of a report to a dataset can be done during embedding. Creating a report can only be done in workspaces specified in *targetWrokspaces*.<br/><br/>This API is relevant only to ['App owns data' embed scenario](https://docs.microsoft.com/power-bi/developer/embed-sample-for-customers). For more information about using this API, see [Considerations when generating an embed token](https://docs.microsoft.com/power-bi/developer/embedded/generate-embed-token).
    #
    # + payload - Generate token parameters 
    # + return - OK 
    remote isolated function embedtokenGeneratetoken(GenerateTokenRequestV2 payload) returns EmbedToken|error {
        string resourcePath = string `/GenerateToken`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmbedToken response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of audit activity events for a tenant.
    #
    # + startDateTime - Start date and time of the window for audit event results. Must be in ISO 8601 compliant UTC format. 
    # + endDateTime - End date and time of the window for audit event results. Must be in ISO 8601 compliant UTC format. 
    # + continuationToken - Token required to get the next chunk of the result set 
    # + filter - Filters the results based on a boolean condition, using 'Activity', 'UserId', or both properties. Supports only 'eq' and 'and' operators. 
    # + return - OK 
    remote isolated function adminGetactivityevents(string? startDateTime = (), string? endDateTime = (), string? continuationToken = (), string? filter = ()) returns ActivityEventResponse|error {
        string resourcePath = string `/admin/activityevents`;
        map<anydata> queryParam = {"startDateTime": startDateTime, "endDateTime": endDateTime, "continuationToken": continuationToken, "$filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ActivityEventResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Remove sensitivity labels from artifacts by artifact ID.
    #
    # + payload - Composite of artifact Id lists per Type. 
    # + return - OK 
    remote isolated function informationprotectionRemovelabelsasadmin(InformationProtectionArtifactsChangeLabel payload) returns InformationProtectionChangeLabelResponse|error {
        string resourcePath = string `/admin/informationprotection/removeLabels`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InformationProtectionChangeLabelResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Set sensitivity labels on content in Power BI by artifact ID.
    #
    # + payload - Set label details. 
    # + return - OK 
    remote isolated function informationprotectionSetlabelsasadmin(InformationProtectionChangeLabelDetails payload) returns InformationProtectionChangeLabelResponse|error {
        string resourcePath = string `/admin/informationprotection/setLabels`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InformationProtectionChangeLabelResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Generates an installation ticket for Template Apps automated install flow.
    #
    # + payload - Create Install Ticket parameters 
    # + return - OK 
    remote isolated function templateappsCreateinstallticket(CreateInstallTicketRequest payload) returns InstallTicket|error {
        string resourcePath = string `/CreateTemplateAppInstallTicket`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InstallTicket response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Transfers ownership over the specified paginated report datasources to the current authorized user.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsTakeoveringroup(string groupId, string reportId) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/reports/${getEncodedUri(reportId)}/Default.TakeOver`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
}
