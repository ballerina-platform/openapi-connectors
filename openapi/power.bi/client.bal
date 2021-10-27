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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
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

# This is a generated connector for [Power BI API v1.0](https://powerbi.microsoft.com/en-us/) OpenAPI specification.
# Power BI REST API provides service endpoints for embedding, administration, and user resources.
@display {label: "Power BI", iconPath: "resources/power.bi.svg"}
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
    }
    # Returns a list of datasets from **"My Workspace"**.
    #
    # + return - OK 
    remote isolated function datasetsGetdatasets() returns Datasets|error {
        string path = string `/datasets`;
        Datasets response = check self.clientEp->get(path, targetType = Datasets);
        return response;
    }
    # Creates a new dataset on **"My Workspace"**.
    #
    # + defaultRetentionPolicy - The default retention policy 
    # + payload - Dataset definition to create 
    # + return - Created 
    remote isolated function datasetsPostdataset(CreateDatasetRequest payload, string? defaultRetentionPolicy = ()) returns Dataset|error {
        string path = string `/datasets`;
        map<anydata> queryParam = {"defaultRetentionPolicy": defaultRetentionPolicy};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Dataset response = check self.clientEp->post(path, request, targetType = Dataset);
        return response;
    }
    # Returns the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetdataset(string datasetId) returns Dataset|error {
        string path = string `/datasets/${datasetId}`;
        Dataset response = check self.clientEp->get(path, targetType = Dataset);
        return response;
    }
    # Deletes the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsDeletedataset(string datasetId) returns http:Response|error {
        string path = string `/datasets/${datasetId}`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
    # Returns a list of tables tables within the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGettables(string datasetId) returns Tables|error {
        string path = string `/datasets/${datasetId}/tables`;
        Tables response = check self.clientEp->get(path, targetType = Tables);
        return response;
    }
    # Updates the metadata and schema for the specified table within the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + tableName - The table name 
    # + payload - Table name and columns to update existing table 
    # + return - OK 
    remote isolated function datasetsPuttable(string datasetId, string tableName, Table payload) returns Table|error {
        string path = string `/datasets/${datasetId}/tables/${tableName}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Table response = check self.clientEp->put(path, request, targetType = Table);
        return response;
    }
    # Adds new data rows to the specified table within the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + tableName - The table name 
    # + payload - The request message 
    # + return - OK 
    remote isolated function datasetsPostrows(string datasetId, string tableName, PostRowsRequest payload) returns http:Response|error {
        string path = string `/datasets/${datasetId}/tables/${tableName}/rows`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Deletes all rows from the specified table within the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + tableName - The table name 
    # + return - OK 
    remote isolated function datasetsDeleterows(string datasetId, string tableName) returns http:Response|error {
        string path = string `/datasets/${datasetId}/tables/${tableName}/rows`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
    # Returns the refresh history of the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + top - The requested number of entries in the refresh history. If not provided, the default is all available entries. 
    # + return - OK 
    remote isolated function datasetsGetrefreshhistory(string datasetId, int? top = ()) returns Refreshes|error {
        string path = string `/datasets/${datasetId}/refreshes`;
        map<anydata> queryParam = {"$top": top};
        path = path + check getPathForQueryParam(queryParam);
        Refreshes response = check self.clientEp->get(path, targetType = Refreshes);
        return response;
    }
    # Triggers a refresh for the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + payload - Refresh request 
    # + return - Accepted 
    remote isolated function datasetsRefreshdataset(string datasetId, RefreshRequest payload) returns http:Response|error {
        string path = string `/datasets/${datasetId}/refreshes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Returns the refresh schedule of the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetrefreshschedule(string datasetId) returns RefreshSchedule|error {
        string path = string `/datasets/${datasetId}/refreshSchedule`;
        RefreshSchedule response = check self.clientEp->get(path, targetType = RefreshSchedule);
        return response;
    }
    # Updates the refresh schedule for the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + payload - Update Refresh Schedule parameters, by specifying all or some of the parameters 
    # + return - OK 
    remote isolated function datasetsUpdaterefreshschedule(string datasetId, RefreshScheduleRequest payload) returns http:Response|error {
        string path = string `/datasets/${datasetId}/refreshSchedule`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType = http:Response);
        return response;
    }
    # Returns the refresh schedule of a specified DirectQuery or LiveConnection dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetdirectqueryrefreshschedule(string datasetId) returns DirectQueryRefreshSchedule|error {
        string path = string `/datasets/${datasetId}/directQueryRefreshSchedule`;
        DirectQueryRefreshSchedule response = check self.clientEp->get(path, targetType = DirectQueryRefreshSchedule);
        return response;
    }
    # Updates the refresh schedule for the specified DirectQuery or LiveConnection dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + payload - Patch DirectQuery or LiveConnection Refresh Schedule parameters, by specifying all or some of the parameters 
    # + return - OK 
    remote isolated function datasetsUpdatedirectqueryrefreshschedule(string datasetId, DirectQueryRefreshScheduleRequest payload) returns http:Response|error {
        string path = string `/datasets/${datasetId}/directQueryRefreshSchedule`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType = http:Response);
        return response;
    }
    # Returns a list of parameters for the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetparameters(string datasetId) returns MashupParameters|error {
        string path = string `/datasets/${datasetId}/parameters`;
        MashupParameters response = check self.clientEp->get(path, targetType = MashupParameters);
        return response;
    }
    # Updates the parameters values for the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + payload - Update mashup parameter request 
    # + return - OK 
    remote isolated function datasetsUpdateparameters(string datasetId, UpdateMashupParametersRequest payload) returns http:Response|error {
        string path = string `/datasets/${datasetId}/Default.UpdateParameters`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Returns a list of datasources for the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetdatasources(string datasetId) returns Datasources|error {
        string path = string `/datasets/${datasetId}/datasources`;
        Datasources response = check self.clientEp->get(path, targetType = Datasources);
        return response;
    }
    # Updates the datasources of the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + payload - Update datasource request 
    # + return - OK 
    remote isolated function datasetsUpdatedatasources(string datasetId, UpdateDatasourcesRequest payload) returns http:Response|error {
        string path = string `/datasets/${datasetId}/Default.UpdateDatasources`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
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
        string path = string `/datasets/${datasetId}/Default.SetAllConnections`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Binds the specified dataset from **"My Workspace"** to the specified gateway with (optional) given set of datasource Ids. This only supports the On-Premises Data Gateway.
    #
    # + datasetId - The dataset id 
    # + payload - The bind to gateway request 
    # + return - OK 
    remote isolated function datasetsBindtogateway(string datasetId, BindToGatewayRequest payload) returns http:Response|error {
        string path = string `/datasets/${datasetId}/Default.BindToGateway`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Returns a list of gateway datasources for the specified dataset from **"My Workspace"**.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetgatewaydatasources(string datasetId) returns GatewayDatasources|error {
        string path = string `/datasets/${datasetId}/Default.GetBoundGatewayDatasources`;
        GatewayDatasources response = check self.clientEp->get(path, targetType = GatewayDatasources);
        return response;
    }
    # Returns a list of gateways which the specified dataset from **"My Workspace"** can be bound to.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsDiscovergateways(string datasetId) returns Gateways|error {
        string path = string `/datasets/${datasetId}/Default.DiscoverGateways`;
        Gateways response = check self.clientEp->get(path, targetType = Gateways);
        return response;
    }
    # Refreshes user permissions in Power BI.
    #
    # + return - OK 
    remote isolated function usersRefreshuserpermissions() returns http:Response|error {
        string path = string `/RefreshUserPermissions`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Returns a list of imports from **"My Workspace"**.
    #
    # + return - OK 
    remote isolated function importsGetimports() returns Imports|error {
        string path = string `/imports`;
        Imports response = check self.clientEp->get(path, targetType = Imports);
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
        string path = string `/imports`;
        map<anydata> queryParam = {"datasetDisplayName": datasetDisplayName, "nameConflict": nameConflict, "skipReport": skipReport};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Import response = check self.clientEp->post(path, request, targetType = Import);
        return response;
    }
    # Returns the specified import from **"My Workspace"**.
    #
    # + importId - The import id 
    # + return - OK 
    remote isolated function importsGetimport(string importId) returns Import|error {
        string path = string `/imports/${importId}`;
        Import response = check self.clientEp->get(path, targetType = Import);
        return response;
    }
    # Creates a temporary blob storage to be used to import large .pbix files larger than 1 GB and up to 10 GB.
    #
    # + return - OK 
    remote isolated function importsCreatetemporaryuploadlocation() returns TemporaryUploadLocation|error {
        string path = string `/imports/createTemporaryUploadLocation`;
        http:Request request = new;
        //TODO: Update the request as needed;
        TemporaryUploadLocation response = check self.clientEp-> post(path, request, targetType = TemporaryUploadLocation);
        return response;
    }
    # Returns a list of reports from **"My Workspace"**.
    #
    # + return - OK 
    remote isolated function reportsGetreports() returns Reports|error {
        string path = string `/reports`;
        Reports response = check self.clientEp->get(path, targetType = Reports);
        return response;
    }
    # Returns the specified report from **"My Workspace"**.
    #
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsGetreport(string reportId) returns Report|error {
        string path = string `/reports/${reportId}`;
        Report response = check self.clientEp->get(path, targetType = Report);
        return response;
    }
    # Deletes the specified report from **"My Workspace"**.
    #
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsDeletereport(string reportId) returns http:Response|error {
        string path = string `/reports/${reportId}`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
    # Clones the specified report from **"My Workspace"**.
    #
    # + reportId - The report id 
    # + payload - Clone report parameters 
    # + return - OK 
    remote isolated function reportsClonereport(string reportId, CloneReportRequest payload) returns Report|error {
        string path = string `/reports/${reportId}/Clone`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Report response = check self.clientEp->post(path, request, targetType = Report);
        return response;
    }
    # Exports the specified report from **"My Workspace"** to a .pbix file.
    #
    # + reportId - The report id 
    # + return - Exported File 
    remote isolated function reportsExportreport(string reportId) returns string|error {
        string path = string `/reports/${reportId}/Export`;
        string response = check self.clientEp->get(path, targetType = string);
        return response;
    }
    # Updates the specified report from **"My Workspace"** to have the same content as the report in the request body.
    #
    # + reportId - The report id 
    # + payload - UpdateReportContent parameters 
    # + return - OK 
    remote isolated function reportsUpdatereportcontent(string reportId, UpdateReportContentRequest payload) returns Report|error {
        string path = string `/reports/${reportId}/UpdateReportContent`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Report response = check self.clientEp->post(path, request, targetType = Report);
        return response;
    }
    # Rebinds the specified report from **"My Workspace"** to the requested dataset.
    #
    # + reportId - The report id 
    # + payload - Rebind report parameters 
    # + return - OK 
    remote isolated function reportsRebindreport(string reportId, RebindReportRequest payload) returns http:Response|error {
        string path = string `/reports/${reportId}/Rebind`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Returns a list of pages within the specified report from **"My Workspace"**.
    #
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsGetpages(string reportId) returns Pages|error {
        string path = string `/reports/${reportId}/pages`;
        Pages response = check self.clientEp->get(path, targetType = Pages);
        return response;
    }
    # Returns the specified page within the specified report from **"My Workspace"**.
    #
    # + reportId - The report id 
    # + pageName - The page name 
    # + return - OK 
    remote isolated function reportsGetpage(string reportId, string pageName) returns Page|error {
        string path = string `/reports/${reportId}/pages/${pageName}`;
        Page response = check self.clientEp->get(path, targetType = Page);
        return response;
    }
    # Returns a list of datasources for the specified RDL report from **"My Workspace"**.
    #
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsGetdatasources(string reportId) returns Datasources|error {
        string path = string `/reports/${reportId}/datasources`;
        Datasources response = check self.clientEp->get(path, targetType = Datasources);
        return response;
    }
    # Updates the datasources of the specified paginated report from **"My Workspace"**. (Preview)
    #
    # + reportId - The report id 
    # + payload - Update RDL datasources request 
    # + return - OK 
    remote isolated function reportsUpdatedatasources(string reportId, UpdateRdlDatasourcesRequest payload) returns http:Response|error {
        string path = string `/reports/${reportId}/Default.UpdateDatasources`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Exports the specified report from **"My Workspace"** to the requested format.
    #
    # + reportId - The report id 
    # + payload - Export to file request parameters 
    # + return - Accepted 
    remote isolated function reportsExporttofile(string reportId, ExportReportRequest payload) returns Export|error {
        string path = string `/reports/${reportId}/ExportTo`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Export response = check self.clientEp->post(path, request, targetType = Export);
        return response;
    }
    # Returns the status of the Export to file job from **"My Workspace"**.
    #
    # + reportId - The report id 
    # + exportId - The export id 
    # + return - OK 
    remote isolated function reportsGetexporttofilestatus(string reportId, string exportId) returns Export|error {
        string path = string `/reports/${reportId}/exports/${exportId}`;
        Export response = check self.clientEp->get(path, targetType = Export);
        return response;
    }
    # Returns the file of the Export to file job of the specified report from **"My Workspace"**.
    #
    # + reportId - The report id 
    # + exportId - The export id 
    # + return - The exported file 
    remote isolated function reportsGetfileofexporttofile(string reportId, string exportId) returns string|error {
        string path = string `/reports/${reportId}/exports/${exportId}/file`;
        string response = check self.clientEp->get(path, targetType = string);
        return response;
    }
    # Returns a list of dashboards from **"My Workspace"**.
    #
    # + return - OK 
    remote isolated function dashboardsGetdashboards() returns Dashboards|error {
        string path = string `/dashboards`;
        Dashboards response = check self.clientEp->get(path, targetType = Dashboards);
        return response;
    }
    # Creates a new empty dashboard on **"My Workspace"**.
    #
    # + payload - Add dashboard parameters 
    # + return - OK 
    remote isolated function dashboardsAdddashboard(AddDashboardRequest payload) returns Dashboard|error {
        string path = string `/dashboards`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Dashboard response = check self.clientEp->post(path, request, targetType = Dashboard);
        return response;
    }
    # Returns the specified dashboard from **"My Workspace"**.
    #
    # + dashboardId - The dashboard id 
    # + return - OK 
    remote isolated function dashboardsGetdashboard(string dashboardId) returns Dashboard|error {
        string path = string `/dashboards/${dashboardId}`;
        Dashboard response = check self.clientEp->get(path, targetType = Dashboard);
        return response;
    }
    # Returns a list of tiles within the specified dashboard from **"My Workspace"**.
    #
    # + dashboardId - The dashboard id 
    # + return - OK 
    remote isolated function dashboardsGettiles(string dashboardId) returns Tiles|error {
        string path = string `/dashboards/${dashboardId}/tiles`;
        Tiles response = check self.clientEp->get(path, targetType = Tiles);
        return response;
    }
    # Returns the specified tile within the specified dashboard from **"My Workspace"**.
    #
    # + dashboardId - The dashboard id 
    # + tileId - The tile id 
    # + return - OK 
    remote isolated function dashboardsGettile(string dashboardId, string tileId) returns Tile|error {
        string path = string `/dashboards/${dashboardId}/tiles/${tileId}`;
        Tile response = check self.clientEp->get(path, targetType = Tile);
        return response;
    }
    # Clones the specified tile from **"My Workspace"**.
    #
    # + dashboardId - The dashboard id 
    # + tileId - The tile id 
    # + payload - Clone tile parameters 
    # + return - OK 
    remote isolated function dashboardsClonetile(string dashboardId, string tileId, CloneTileRequest payload) returns Tile|error {
        string path = string `/dashboards/${dashboardId}/tiles/${tileId}/Clone`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Tile response = check self.clientEp->post(path, request, targetType = Tile);
        return response;
    }
    # Returns a list of datasets from the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function datasetsGetdatasetsingroup(string groupId) returns Datasets|error {
        string path = string `/groups/${groupId}/datasets`;
        Datasets response = check self.clientEp->get(path, targetType = Datasets);
        return response;
    }
    # Creates a new dataset in the specified workspace.
    #
    # + groupId - The workspace id 
    # + defaultRetentionPolicy - The default retention policy 
    # + payload - Create dataset parameters 
    # + return - Created 
    remote isolated function datasetsPostdatasetingroup(string groupId, CreateDatasetRequest payload, string? defaultRetentionPolicy = ()) returns Dataset|error {
        string path = string `/groups/${groupId}/datasets`;
        map<anydata> queryParam = {"defaultRetentionPolicy": defaultRetentionPolicy};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Dataset response = check self.clientEp->post(path, request, targetType = Dataset);
        return response;
    }
    # Returns a list of upstream dataflows for datasets from the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function datasetsGetdatasettodataflowslinksingroup(string groupId) returns DatasetToDataflowLinksResponse|error {
        string path = string `/groups/${groupId}/datasets/upstreamDataflows`;
        DatasetToDataflowLinksResponse response = check self.clientEp->get(path, targetType = DatasetToDataflowLinksResponse);
        return response;
    }
    # Returns the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetdatasetingroup(string groupId, string datasetId) returns Dataset|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}`;
        Dataset response = check self.clientEp->get(path, targetType = Dataset);
        return response;
    }
    # Deletes the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsDeletedatasetingroup(string groupId, string datasetId) returns http:Response|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
    # Returns a list of tables within the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGettablesingroup(string groupId, string datasetId) returns Tables|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}/tables`;
        Tables response = check self.clientEp->get(path, targetType = Tables);
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
        string path = string `/groups/${groupId}/datasets/${datasetId}/tables/${tableName}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Table response = check self.clientEp->put(path, request, targetType = Table);
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
        string path = string `/groups/${groupId}/datasets/${datasetId}/tables/${tableName}/rows`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Deletes all rows from the specified table, within the specified dataset, from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + tableName - The table name 
    # + return - OK 
    remote isolated function datasetsDeleterowsingroup(string groupId, string datasetId, string tableName) returns http:Response|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}/tables/${tableName}/rows`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
    # Returns the refresh history of the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + top - The requested number of entries in the refresh history. If not provided, the default is all available entries. 
    # + return - OK 
    remote isolated function datasetsGetrefreshhistoryingroup(string groupId, string datasetId, int? top = ()) returns Refreshes|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}/refreshes`;
        map<anydata> queryParam = {"$top": top};
        path = path + check getPathForQueryParam(queryParam);
        Refreshes response = check self.clientEp->get(path, targetType = Refreshes);
        return response;
    }
    # Triggers a refresh for the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + payload - Refresh request 
    # + return - Accepted 
    remote isolated function datasetsRefreshdatasetingroup(string groupId, string datasetId, RefreshRequest payload) returns http:Response|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}/refreshes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Returns the refresh schedule of the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetrefreshscheduleingroup(string groupId, string datasetId) returns RefreshSchedule|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}/refreshSchedule`;
        RefreshSchedule response = check self.clientEp->get(path, targetType = RefreshSchedule);
        return response;
    }
    # Updates the refresh schedule for the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + payload - Update Refresh Schedule parameters, by specifying all or some of the parameters 
    # + return - OK 
    remote isolated function datasetsUpdaterefreshscheduleingroup(string groupId, string datasetId, RefreshScheduleRequest payload) returns http:Response|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}/refreshSchedule`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType = http:Response);
        return response;
    }
    # Returns the refresh schedule of a specified DirectQuery or LiveConnection dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetdirectqueryrefreshscheduleingroup(string groupId, string datasetId) returns DirectQueryRefreshSchedule|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}/directQueryRefreshSchedule`;
        DirectQueryRefreshSchedule response = check self.clientEp->get(path, targetType = DirectQueryRefreshSchedule);
        return response;
    }
    # Updates the refresh schedule for the specified DirectQuery or LiveConnection dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + payload - Patch DirectQuery or LiveConnection Refresh Schedule parameters, by specifying all or some of the parameters 
    # + return - OK 
    remote isolated function datasetsUpdatedirectqueryrefreshscheduleingroup(string groupId, string datasetId, DirectQueryRefreshScheduleRequest payload) returns http:Response|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}/directQueryRefreshSchedule`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType = http:Response);
        return response;
    }
    # Returns a list of parameters for the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetparametersingroup(string groupId, string datasetId) returns MashupParameters|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}/parameters`;
        MashupParameters response = check self.clientEp->get(path, targetType = MashupParameters);
        return response;
    }
    # Updates the parameters values for the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + payload - Update mashup parameter request 
    # + return - OK 
    remote isolated function datasetsUpdateparametersingroup(string groupId, string datasetId, UpdateMashupParametersRequest payload) returns http:Response|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}/Default.UpdateParameters`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Returns a list of datasources for the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetdatasourcesingroup(string groupId, string datasetId) returns Datasources|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}/datasources`;
        Datasources response = check self.clientEp->get(path, targetType = Datasources);
        return response;
    }
    # Updates the datasources of the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + payload - Update datasource request 
    # + return - OK 
    remote isolated function datasetsUpdatedatasourcesingroup(string groupId, string datasetId, UpdateDatasourcesRequest payload) returns http:Response|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}/Default.UpdateDatasources`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
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
        string path = string `/groups/${groupId}/datasets/${datasetId}/Default.SetAllConnections`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Binds the specified dataset from the specified workspace to the specified gateway with (optional) given set of datasource Ids. This only supports the On-Premises Data Gateway.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + payload - The bind to gateway request 
    # + return - OK 
    remote isolated function datasetsBindtogatewayingroup(string groupId, string datasetId, BindToGatewayRequest payload) returns http:Response|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}/Default.BindToGateway`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Returns a list of gateway datasources for the specified dataset from the specified workspace.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetgatewaydatasourcesingroup(string groupId, string datasetId) returns GatewayDatasources|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}/Default.GetBoundGatewayDatasources`;
        GatewayDatasources response = check self.clientEp->get(path, targetType = GatewayDatasources);
        return response;
    }
    # Returns a list of gateways that the specified dataset from the specified workspace can be bound to.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsDiscovergatewaysingroup(string groupId, string datasetId) returns Gateways|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}/Default.DiscoverGateways`;
        Gateways response = check self.clientEp->get(path, targetType = Gateways);
        return response;
    }
    # Transfers ownership over the specified dataset to the current authorized user.
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsTakeoveringroup(string groupId, string datasetId) returns http:Response|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}/Default.TakeOver`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Returns a list of imports from the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function importsGetimportsingroup(string groupId) returns Imports|error {
        string path = string `/groups/${groupId}/imports`;
        Imports response = check self.clientEp->get(path, targetType = Imports);
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
        string path = string `/groups/${groupId}/imports`;
        map<anydata> queryParam = {"datasetDisplayName": datasetDisplayName, "nameConflict": nameConflict, "skipReport": skipReport};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Import response = check self.clientEp->post(path, request, targetType = Import);
        return response;
    }
    # Returns the specified import from the specified workspace.
    #
    # + groupId - The workspace id 
    # + importId - The import id 
    # + return - OK 
    remote isolated function importsGetimportingroup(string groupId, string importId) returns Import|error {
        string path = string `/groups/${groupId}/imports/${importId}`;
        Import response = check self.clientEp->get(path, targetType = Import);
        return response;
    }
    # Creates a temporary blob storage to be used to import large .pbix files larger than 1 GB and up to 10 GB.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function importsCreatetemporaryuploadlocationingroup(string groupId) returns TemporaryUploadLocation|error {
        string path = string `/groups/${groupId}/imports/createTemporaryUploadLocation`;
        http:Request request = new;
        //TODO: Update the request as needed;
        TemporaryUploadLocation response = check self.clientEp-> post(path, request, targetType = TemporaryUploadLocation);
        return response;
    }
    # Returns a list of reports from the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function reportsGetreportsingroup(string groupId) returns Reports|error {
        string path = string `/groups/${groupId}/reports`;
        Reports response = check self.clientEp->get(path, targetType = Reports);
        return response;
    }
    # Returns the specified report from the specified workspace.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsGetreportingroup(string groupId, string reportId) returns Report|error {
        string path = string `/groups/${groupId}/reports/${reportId}`;
        Report response = check self.clientEp->get(path, targetType = Report);
        return response;
    }
    # Deletes the specified report from the specified workspace.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsDeletereportingroup(string groupId, string reportId) returns http:Response|error {
        string path = string `/groups/${groupId}/reports/${reportId}`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
    # Clones the specified report from the specified workspace.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + payload - Clone report parameters 
    # + return - OK 
    remote isolated function reportsClonereportingroup(string groupId, string reportId, CloneReportRequest payload) returns Report|error {
        string path = string `/groups/${groupId}/reports/${reportId}/Clone`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Report response = check self.clientEp->post(path, request, targetType = Report);
        return response;
    }
    # Exports the specified report from the specified workspace to a .pbix file.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + return - Exported File 
    remote isolated function reportsExportreportingroup(string groupId, string reportId) returns string|error {
        string path = string `/groups/${groupId}/reports/${reportId}/Export`;
        string response = check self.clientEp->get(path, targetType = string);
        return response;
    }
    # Updates the specified report from the specified workspace to have the same content as the specified report in the request body.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + payload - UpdateReportContent parameters 
    # + return - OK 
    remote isolated function reportsUpdatereportcontentingroup(string groupId, string reportId, UpdateReportContentRequest payload) returns Report|error {
        string path = string `/groups/${groupId}/reports/${reportId}/UpdateReportContent`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Report response = check self.clientEp->post(path, request, targetType = Report);
        return response;
    }
    # Rebinds the specified report from the specified workspace to the requested dataset.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + payload - Rebind report parameters 
    # + return - OK 
    remote isolated function reportsRebindreportingroup(string groupId, string reportId, RebindReportRequest payload) returns http:Response|error {
        string path = string `/groups/${groupId}/reports/${reportId}/Rebind`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Returns a list of pages within the specified report from the specified workspace.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsGetpagesingroup(string groupId, string reportId) returns Pages|error {
        string path = string `/groups/${groupId}/reports/${reportId}/pages`;
        Pages response = check self.clientEp->get(path, targetType = Pages);
        return response;
    }
    # Returns the specified page within the specified report from the specified workspace.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + pageName - The page name 
    # + return - OK 
    remote isolated function reportsGetpageingroup(string groupId, string reportId, string pageName) returns Page|error {
        string path = string `/groups/${groupId}/reports/${reportId}/pages/${pageName}`;
        Page response = check self.clientEp->get(path, targetType = Page);
        return response;
    }
    # Returns a list of datasources for the specified RDL report from the specified workspace.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsGetdatasourcesingroup(string groupId, string reportId) returns Datasources|error {
        string path = string `/groups/${groupId}/reports/${reportId}/datasources`;
        Datasources response = check self.clientEp->get(path, targetType = Datasources);
        return response;
    }
    # Updates the datasources of the specified paginated report from the specified workspace. (Preview)
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + payload - Update RDL datasources request 
    # + return - OK 
    remote isolated function reportsUpdatedatasourcesingroup(string groupId, string reportId, UpdateRdlDatasourcesRequest payload) returns http:Response|error {
        string path = string `/groups/${groupId}/reports/${reportId}/Default.UpdateDatasources`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Exports the specified report from the specified workspace to the requested format.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + payload - Export to file request parameters 
    # + return - Accepted 
    remote isolated function reportsExporttofileingroup(string groupId, string reportId, ExportReportRequest payload) returns Export|error {
        string path = string `/groups/${groupId}/reports/${reportId}/ExportTo`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Export response = check self.clientEp->post(path, request, targetType = Export);
        return response;
    }
    # Returns the status of the Export to file job from the specified workspace.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + exportId - The export id 
    # + return - OK 
    remote isolated function reportsGetexporttofilestatusingroup(string groupId, string reportId, string exportId) returns Export|error {
        string path = string `/groups/${groupId}/reports/${reportId}/exports/${exportId}`;
        Export response = check self.clientEp->get(path, targetType = Export);
        return response;
    }
    # Returns the file of the Export to file job of the specified report from the specified group.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + exportId - The export id 
    # + return - The exported file 
    remote isolated function reportsGetfileofexporttofileingroup(string groupId, string reportId, string exportId) returns string|error {
        string path = string `/groups/${groupId}/reports/${reportId}/exports/${exportId}/file`;
        string response = check self.clientEp->get(path, targetType = string);
        return response;
    }
    # Returns a list of dashboards from the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function dashboardsGetdashboardsingroup(string groupId) returns Dashboards|error {
        string path = string `/groups/${groupId}/dashboards`;
        Dashboards response = check self.clientEp->get(path, targetType = Dashboards);
        return response;
    }
    # Creates a new empty dashboard on the specified workspace.
    #
    # + groupId - The workspace id 
    # + payload - Add dashboard parameters 
    # + return - OK 
    remote isolated function dashboardsAdddashboardingroup(string groupId, AddDashboardRequest payload) returns Dashboard|error {
        string path = string `/groups/${groupId}/dashboards`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Dashboard response = check self.clientEp->post(path, request, targetType = Dashboard);
        return response;
    }
    # Returns the specified dashboard from the specified workspace.
    #
    # + groupId - The workspace id 
    # + dashboardId - The dashboard id 
    # + return - OK 
    remote isolated function dashboardsGetdashboardingroup(string groupId, string dashboardId) returns Dashboard|error {
        string path = string `/groups/${groupId}/dashboards/${dashboardId}`;
        Dashboard response = check self.clientEp->get(path, targetType = Dashboard);
        return response;
    }
    # Returns a list of tiles within the specified dashboard from the specified workspace.
    #
    # + groupId - The workspace id 
    # + dashboardId - The dashboard id 
    # + return - OK 
    remote isolated function dashboardsGettilesingroup(string groupId, string dashboardId) returns Tiles|error {
        string path = string `/groups/${groupId}/dashboards/${dashboardId}/tiles`;
        Tiles response = check self.clientEp->get(path, targetType = Tiles);
        return response;
    }
    # Returns the specified tile within the specified dashboard from the specified workspace.
    #
    # + groupId - The workspace id 
    # + dashboardId - The dashboard id 
    # + tileId - The tile id 
    # + return - OK 
    remote isolated function dashboardsGettileingroup(string groupId, string dashboardId, string tileId) returns Tile|error {
        string path = string `/groups/${groupId}/dashboards/${dashboardId}/tiles/${tileId}`;
        Tile response = check self.clientEp->get(path, targetType = Tile);
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
        string path = string `/groups/${groupId}/dashboards/${dashboardId}/tiles/${tileId}/Clone`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Tile response = check self.clientEp->post(path, request, targetType = Tile);
        return response;
    }
    # Generates an embed token to allow report creation on the specified workspace based on the specified dataset.<br/><br/>This API is relevant only to ['App owns data' embed scenario](https://docs.microsoft.com/power-bi/developer/embed-sample-for-customers). For more information about using this API, see [Considerations when generating an embed token](https://docs.microsoft.com/power-bi/developer/embedded/generate-embed-token).
    #
    # + groupId - The workspace id 
    # + payload - Generate token parameters 
    # + return - OK 
    remote isolated function reportsGeneratetokenforcreateingroup(string groupId, GenerateTokenRequest payload) returns EmbedToken|error {
        string path = string `/groups/${groupId}/reports/GenerateToken`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EmbedToken response = check self.clientEp->post(path, request, targetType = EmbedToken);
        return response;
    }
    # Generates an embed token to view or edit the specified report from the specified workspace.<br/><br/>This API is relevant only to ['App owns data' embed scenario](https://docs.microsoft.com/power-bi/developer/embed-sample-for-customers). For more information about using this API, see [Considerations when generating an embed token](https://docs.microsoft.com/power-bi/developer/embedded/generate-embed-token).
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + payload - Generate token parameters 
    # + return - OK 
    remote isolated function reportsGeneratetokeningroup(string groupId, string reportId, GenerateTokenRequest payload) returns EmbedToken|error {
        string path = string `/groups/${groupId}/reports/${reportId}/GenerateToken`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EmbedToken response = check self.clientEp->post(path, request, targetType = EmbedToken);
        return response;
    }
    # Generates an embed token to [Embed Q&A](https://docs.microsoft.com/power-bi/developer/qanda) based on the specified dataset from the specified workspace.<br/><br/>This API is relevant only to ['App owns data' embed scenario](https://docs.microsoft.com/power-bi/developer/embed-sample-for-customers). For more information about using this API, see [Considerations when generating an embed token](https://docs.microsoft.com/power-bi/developer/embedded/generate-embed-token).
    #
    # + groupId - The workspace id 
    # + datasetId - The dataset id 
    # + payload - Generate token parameters 
    # + return - OK 
    remote isolated function datasetsGeneratetokeningroup(string groupId, string datasetId, GenerateTokenRequest payload) returns EmbedToken|error {
        string path = string `/groups/${groupId}/datasets/${datasetId}/GenerateToken`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EmbedToken response = check self.clientEp->post(path, request, targetType = EmbedToken);
        return response;
    }
    # Generates an embed token to view the specified dashboard from the specified workspace.<br/><br/>This API is relevant only to the ['App owns data' embed scenario](https://docs.microsoft.com/power-bi/developer/embed-sample-for-customers). For more information about using this API, see [Considerations when generating an embed token](https://docs.microsoft.com/power-bi/developer/embedded/generate-embed-token).
    #
    # + groupId - The workspace id 
    # + dashboardId - The dashboard id 
    # + payload - Generate token parameters 
    # + return - OK 
    remote isolated function dashboardsGeneratetokeningroup(string groupId, string dashboardId, GenerateTokenRequest payload) returns EmbedToken|error {
        string path = string `/groups/${groupId}/dashboards/${dashboardId}/GenerateToken`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EmbedToken response = check self.clientEp->post(path, request, targetType = EmbedToken);
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
        string path = string `/groups/${groupId}/dashboards/${dashboardId}/tiles/${tileId}/GenerateToken`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EmbedToken response = check self.clientEp->post(path, request, targetType = EmbedToken);
        return response;
    }
    # Returns a list of installed apps.
    #
    # + return - OK 
    remote isolated function appsGetapps() returns Apps|error {
        string path = string `/apps`;
        Apps response = check self.clientEp->get(path, targetType = Apps);
        return response;
    }
    # Returns the specified installed app.
    #
    # + appId - The app id 
    # + return - OK 
    remote isolated function appsGetapp(string appId) returns App|error {
        string path = string `/apps/${appId}`;
        App response = check self.clientEp->get(path, targetType = App);
        return response;
    }
    # Returns a list of reports from the specified app.
    #
    # + appId - The app id 
    # + return - OK 
    remote isolated function appsGetreports(string appId) returns Reports|error {
        string path = string `/apps/${appId}/reports`;
        Reports response = check self.clientEp->get(path, targetType = Reports);
        return response;
    }
    # Returns the specified report from the specified app.
    #
    # + appId - The app id 
    # + reportId - The report id 
    # + return - OK 
    remote isolated function appsGetreport(string appId, string reportId) returns Report|error {
        string path = string `/apps/${appId}/reports/${reportId}`;
        Report response = check self.clientEp->get(path, targetType = Report);
        return response;
    }
    # Returns a list of dashboards from the specified app.
    #
    # + appId - The app id 
    # + return - OK 
    remote isolated function appsGetdashboards(string appId) returns Dashboards|error {
        string path = string `/apps/${appId}/dashboards`;
        Dashboards response = check self.clientEp->get(path, targetType = Dashboards);
        return response;
    }
    # Returns the specified dashboard from the specified app.
    #
    # + appId - The app id 
    # + dashboardId - The dashboard id 
    # + return - OK 
    remote isolated function appsGetdashboard(string appId, string dashboardId) returns Dashboard|error {
        string path = string `/apps/${appId}/dashboards/${dashboardId}`;
        Dashboard response = check self.clientEp->get(path, targetType = Dashboard);
        return response;
    }
    # Returns a list of tiles within the specified dashboard from the specified app.
    #
    # + appId - The app id 
    # + dashboardId - The dashboard id 
    # + return - OK 
    remote isolated function appsGettiles(string appId, string dashboardId) returns Tiles|error {
        string path = string `/apps/${appId}/dashboards/${dashboardId}/tiles`;
        Tiles response = check self.clientEp->get(path, targetType = Tiles);
        return response;
    }
    # Returns the specified tile within the specified dashboard from the specified app.
    #
    # + appId - The app id 
    # + dashboardId - The dashboard id 
    # + tileId - The tile id 
    # + return - OK 
    remote isolated function appsGettile(string appId, string dashboardId, string tileId) returns Tile|error {
        string path = string `/apps/${appId}/dashboards/${dashboardId}/tiles/${tileId}`;
        Tile response = check self.clientEp->get(path, targetType = Tile);
        return response;
    }
    # Exports the specified dataflow definition to a .json file.
    #
    # + groupId - The workspace id 
    # + dataflowId - The dataflow id 
    # + return - Exported Json file 
    remote isolated function dataflowsGetdataflow(string groupId, string dataflowId) returns string|error {
        string path = string `/groups/${groupId}/dataflows/${dataflowId}`;
        string response = check self.clientEp->get(path, targetType = string);
        return response;
    }
    # Deletes a dataflow from the CDS for Analytics storage, including its definition file and actual model.
    #
    # + groupId - The workspace id 
    # + dataflowId - The dataflow id 
    # + return - OK 
    remote isolated function dataflowsDeletedataflow(string groupId, string dataflowId) returns http:Response|error {
        string path = string `/groups/${groupId}/dataflows/${dataflowId}`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
    # Update dataflow properties, capabilities and settings.
    #
    # + groupId - The workspace id 
    # + dataflowId - The dataflow id 
    # + payload - Patch dataflow properties, capabilities and settings 
    # + return - OK 
    remote isolated function dataflowsUpdatedataflow(string groupId, string dataflowId, DataflowUpdateRequestMessage payload) returns http:Response|error {
        string path = string `/groups/${groupId}/dataflows/${dataflowId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType = http:Response);
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
        string path = string `/groups/${groupId}/dataflows/${dataflowId}/refreshes`;
        map<anydata> queryParam = {"processType": processType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Returns a list of datasources for the specified dataflow.
    #
    # + groupId - The workspace id 
    # + dataflowId - The dataflow id 
    # + return - OK 
    remote isolated function dataflowsGetdataflowdatasources(string groupId, string dataflowId) returns Datasources|error {
        string path = string `/groups/${groupId}/dataflows/${dataflowId}/datasources`;
        Datasources response = check self.clientEp->get(path, targetType = Datasources);
        return response;
    }
    # Returns a list of all dataflows from the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function dataflowsGetdataflows(string groupId) returns Dataflows|error {
        string path = string `/groups/${groupId}/dataflows`;
        Dataflows response = check self.clientEp->get(path, targetType = Dataflows);
        return response;
    }
    # Returns a list of upstream dataflows for the specified dataflow.
    #
    # + groupId - The workspace id 
    # + dataflowId - The dataflow id 
    # + return - OK 
    remote isolated function dataflowsGetupstreamdataflowsingroup(string groupId, string dataflowId) returns DependentDataflows|error {
        string path = string `/groups/${groupId}/dataflows/${dataflowId}/upstreamDataflows`;
        DependentDataflows response = check self.clientEp->get(path, targetType = DependentDataflows);
        return response;
    }
    # Creates or updates the specified dataflow refresh schedule configuration.
    #
    # + groupId - The workspace id 
    # + dataflowId - The dataflow id 
    # + payload - The dataflow refresh schedule to create or update 
    # + return - OK 
    remote isolated function dataflowsUpdaterefreshschedule(string groupId, string dataflowId, RefreshScheduleRequest payload) returns http:Response|error {
        string path = string `/groups/${groupId}/dataflows/${dataflowId}/refreshSchedule`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType = http:Response);
        return response;
    }
    # Returns a list of transactions for the specified dataflow.
    #
    # + groupId - The workspace id 
    # + dataflowId - The dataflow id 
    # + return - OK 
    remote isolated function dataflowsGetdataflowtransactions(string groupId, string dataflowId) returns DataflowTransactions|error {
        string path = string `/groups/${groupId}/dataflows/${dataflowId}/transactions`;
        DataflowTransactions response = check self.clientEp->get(path, targetType = DataflowTransactions);
        return response;
    }
    # Attempts to Cancel the specified transactions.
    #
    # + groupId - The workspace id 
    # + transactionId - The transaction id 
    # + return - OK 
    remote isolated function dataflowsCanceldataflowtransaction(string groupId, string transactionId) returns DataflowTransactionStatus|error {
        string path = string `/groups/${groupId}/dataflows//transactions/${transactionId}/cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        DataflowTransactionStatus response = check self.clientEp-> post(path, request, targetType = DataflowTransactionStatus);
        return response;
    }
    # Returns a list of gateways for which the user is an admin.
    #
    # + return - OK 
    remote isolated function gatewaysGetgateways() returns Gateways|error {
        string path = string `/gateways`;
        Gateways response = check self.clientEp->get(path, targetType = Gateways);
        return response;
    }
    # Returns the specified gateway.
    #
    # + gatewayId - The gateway id 
    # + return - OK 
    remote isolated function gatewaysGetgateway(string gatewayId) returns Gateway|error {
        string path = string `/gateways/${gatewayId}`;
        Gateway response = check self.clientEp->get(path, targetType = Gateway);
        return response;
    }
    # Returns a list of datasources from the specified gateway.
    #
    # + gatewayId - The gateway id 
    # + return - OK 
    remote isolated function gatewaysGetdatasources(string gatewayId) returns GatewayDatasources|error {
        string path = string `/gateways/${gatewayId}/datasources`;
        GatewayDatasources response = check self.clientEp->get(path, targetType = GatewayDatasources);
        return response;
    }
    # Creates a new datasource on the specified gateway.
    #
    # + gatewayId - The gateway id 
    # + payload - The datasource requested to create 
    # + return - Created 
    remote isolated function gatewaysCreatedatasource(string gatewayId, PublishDatasourceToGatewayRequest payload) returns GatewayDatasource|error {
        string path = string `/gateways/${gatewayId}/datasources`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GatewayDatasource response = check self.clientEp->post(path, request, targetType = GatewayDatasource);
        return response;
    }
    # Returns the specified datasource from the specified gateway.
    #
    # + gatewayId - The gateway id 
    # + datasourceId - The datasource id 
    # + return - OK 
    remote isolated function gatewaysGetdatasource(string gatewayId, string datasourceId) returns GatewayDatasource|error {
        string path = string `/gateways/${gatewayId}/datasources/${datasourceId}`;
        GatewayDatasource response = check self.clientEp->get(path, targetType = GatewayDatasource);
        return response;
    }
    # Deletes the specified datasource from the specified gateway.
    #
    # + gatewayId - The gateway id 
    # + datasourceId - The datasource id 
    # + return - OK 
    remote isolated function gatewaysDeletedatasource(string gatewayId, string datasourceId) returns http:Response|error {
        string path = string `/gateways/${gatewayId}/datasources/${datasourceId}`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
    # Updates the credentials of the specified datasource from the specified gateway.
    #
    # + gatewayId - The gateway id 
    # + datasourceId - The datasource id 
    # + payload - The update datasource request 
    # + return - OK 
    remote isolated function gatewaysUpdatedatasource(string gatewayId, string datasourceId, UpdateDatasourceRequest payload) returns http:Response|error {
        string path = string `/gateways/${gatewayId}/datasources/${datasourceId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType = http:Response);
        return response;
    }
    # Checks the connectivity status of the specified datasource from the specified gateway.
    #
    # + gatewayId - The gateway id 
    # + datasourceId - The datasource id 
    # + return - OK 
    remote isolated function gatewaysGetdatasourcestatus(string gatewayId, string datasourceId) returns http:Response|error {
        string path = string `/gateways/${gatewayId}/datasources/${datasourceId}/status`;
        http:Response response = check self.clientEp->get(path, targetType = http:Response);
        return response;
    }
    # Returns a list of users who have access to the specified datasource.
    #
    # + gatewayId - The gateway id 
    # + datasourceId - The datasource id 
    # + return - OK 
    remote isolated function gatewaysGetdatasourceusers(string gatewayId, string datasourceId) returns DatasourceUsers|error {
        string path = string `/gateways/${gatewayId}/datasources/${datasourceId}/users`;
        DatasourceUsers response = check self.clientEp->get(path, targetType = DatasourceUsers);
        return response;
    }
    # Grants or updates the permissions required to use the specified datasource for the specified user.
    #
    # + gatewayId - The gateway id 
    # + datasourceId - The datasource id 
    # + payload - The add user to datasource request 
    # + return - OK 
    remote isolated function gatewaysAdddatasourceuser(string gatewayId, string datasourceId, DatasourceUser payload) returns http:Response|error {
        string path = string `/gateways/${gatewayId}/datasources/${datasourceId}/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Removes the specified user from the specified datasource.
    #
    # + gatewayId - The gateway id 
    # + datasourceId - The datasource id 
    # + emailAdress - The user's email address or the service principal object id 
    # + return - OK 
    remote isolated function gatewaysDeletedatasourceuser(string gatewayId, string datasourceId, string emailAdress) returns http:Response|error {
        string path = string `/gateways/${gatewayId}/datasources/${datasourceId}/users/${emailAdress}`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
    # Returns a list of workspaces the user has access to.
    #
    # + filter - Filters the results, based on a boolean condition 
    # + top - Returns only the first n results 
    # + skip - Skips the first n results 
    # + return - OK 
    remote isolated function groupsGetgroups(string? filter = (), int? top = (), int? skip = ()) returns Groups|error {
        string path = string `/groups`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip};
        path = path + check getPathForQueryParam(queryParam);
        Groups response = check self.clientEp->get(path, targetType = Groups);
        return response;
    }
    # Creates new workspace.
    #
    # + workspaceV2 - Preview feature: Create a workspace V2. The only supported value is true. 
    # + payload - Create group request parameters 
    # + return - OK 
    remote isolated function groupsCreategroup(GroupCreationRequest payload, boolean? workspaceV2 = ()) returns Group|error {
        string path = string `/groups`;
        map<anydata> queryParam = {"workspaceV2": workspaceV2};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Group response = check self.clientEp->post(path, request, targetType = Group);
        return response;
    }
    # Deletes the specified workspace.
    #
    # + groupId - The workspace id to delete 
    # + return - OK 
    remote isolated function groupsDeletegroup(string groupId) returns http:Response|error {
        string path = string `/groups/${groupId}`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
    # Returns a list of users that have access to the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function groupsGetgroupusers(string groupId) returns GroupUsers|error {
        string path = string `/groups/${groupId}/users`;
        GroupUsers response = check self.clientEp->get(path, targetType = GroupUsers);
        return response;
    }
    # Update the specified user permissions to the specified workspace.
    #
    # + groupId - The workspace id 
    # + payload - Details of user access right 
    # + return - OK 
    remote isolated function groupsUpdategroupuser(string groupId, GroupUser payload) returns http:Response|error {
        string path = string `/groups/${groupId}/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType = http:Response);
        return response;
    }
    # Grants the specified user permissions to the specified workspace.
    #
    # + groupId - The workspace id 
    # + payload - Details of user access right 
    # + return - OK 
    remote isolated function groupsAddgroupuser(string groupId, GroupUser payload) returns http:Response|error {
        string path = string `/groups/${groupId}/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Deletes the specified user permissions from the specified workspace.
    #
    # + groupId - The workspace id 
    # + user - The email address of the user or the service principal object id to delete 
    # + return - OK 
    remote isolated function groupsDeleteuseringroup(string groupId, string user) returns http:Response|error {
        string path = string `/groups/${groupId}/users/${user}`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
    # Returns a list of capacities the user has access to.
    #
    # + return - OK 
    remote isolated function capacitiesGetcapacities() returns Capacities|error {
        string path = string `/capacities`;
        Capacities response = check self.clientEp->get(path, targetType = Capacities);
        return response;
    }
    # Returns the current state of the specified capacity workloads, if a workload is enabled also returns the maximum memory percentage that the workload can consume.
    #
    # + capacityId - The capacity Id 
    # + return - OK 
    remote isolated function capacitiesGetworkloads(string capacityId) returns Workloads|error {
        string path = string `/capacities/${capacityId}/Workloads`;
        Workloads response = check self.clientEp->get(path, targetType = Workloads);
        return response;
    }
    # Returns the current state of a workload and if the workload is enabled also returns the maximum memory percentage that the workload can consume.
    #
    # + capacityId - The capacity Id 
    # + workloadName - The name of the workload 
    # + return - OK 
    remote isolated function capacitiesGetworkload(string capacityId, string workloadName) returns Workload|error {
        string path = string `/capacities/${capacityId}/Workloads/${workloadName}`;
        Workload response = check self.clientEp->get(path, targetType = Workload);
        return response;
    }
    # Changes the state of a specific workload to Enabled or Disabled. When enabling a workload the maximum memory percentage that the workload can consume must be set.
    #
    # + capacityId - The capacity Id 
    # + workloadName - The name of the workload 
    # + payload - Patch workload parameters 
    # + return - OK 
    remote isolated function capacitiesPatchworkload(string capacityId, string workloadName, PatchWorkloadRequest payload) returns http:Response|error {
        string path = string `/capacities/${capacityId}/Workloads/${workloadName}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType = http:Response);
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
        string path = string `/capacities/refreshables`;
        map<anydata> queryParam = {"$expand": expand, "$filter": filter, "$top": top, "$skip": skip};
        path = path + check getPathForQueryParam(queryParam);
        Refreshables response = check self.clientEp->get(path, targetType = Refreshables);
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
        string path = string `/capacities/${capacityId}/refreshables`;
        map<anydata> queryParam = {"$expand": expand, "$filter": filter, "$top": top, "$skip": skip};
        path = path + check getPathForQueryParam(queryParam);
        Refreshables response = check self.clientEp->get(path, targetType = Refreshables);
        return response;
    }
    # Returns the specified refreshable for the specified capacity the user has access to
    #
    # + capacityId - The capacity id 
    # + refreshableId - The refreshable id 
    # + expand - Expands related entities inline, receives a comma-separated list of data types. Supported: capacities and groups 
    # + return - OK 
    remote isolated function capacitiesGetrefreshableforcapacity(string capacityId, string refreshableId, string? expand = ()) returns Refreshables|error {
        string path = string `/capacities/${capacityId}/refreshables/${refreshableId}`;
        map<anydata> queryParam = {"$expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        Refreshables response = check self.clientEp->get(path, targetType = Refreshables);
        return response;
    }
    # Assigns **"My Workspace"** to the specified capacity.
    #
    # + payload - Assign to capacity parameters 
    # + return - OK 
    remote isolated function groupsAssignmyworkspacetocapacity(AssignToCapacityRequest payload) returns http:Response|error {
        string path = string `/AssignToCapacity`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Assigns the specified workspace to the specified capacity.
    #
    # + groupId - The workspace id 
    # + payload - Assign to capacity parameters 
    # + return - OK 
    remote isolated function groupsAssigntocapacity(string groupId, AssignToCapacityRequest payload) returns http:Response|error {
        string path = string `/groups/${groupId}/AssignToCapacity`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Gets the status of **"My Workspace"** assignment to capacity operation.
    #
    # + return - OK 
    remote isolated function groupsCapacityassignmentstatusmyworkspace() returns WorkspaceCapacityAssignmentStatus|error {
        string path = string `/CapacityAssignmentStatus`;
        WorkspaceCapacityAssignmentStatus response = check self.clientEp->get(path, targetType = WorkspaceCapacityAssignmentStatus);
        return response;
    }
    # Gets the status of the assignment to capacity operation of the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function groupsCapacityassignmentstatus(string groupId) returns WorkspaceCapacityAssignmentStatus|error {
        string path = string `/groups/${groupId}/CapacityAssignmentStatus`;
        WorkspaceCapacityAssignmentStatus response = check self.clientEp->get(path, targetType = WorkspaceCapacityAssignmentStatus);
        return response;
    }
    # Returns a list of available features for the user
    #
    # + return - OK 
    remote isolated function availablefeaturesGetavailablefeatures() returns AvailableFeatures|error {
        string path = string `/availableFeatures`;
        AvailableFeatures response = check self.clientEp->get(path, targetType = AvailableFeatures);
        return response;
    }
    # Returns the specified available feature for user by name.
    #
    # + featureName - The feature name 
    # + return - OK 
    remote isolated function availablefeaturesGetavailablefeaturebyname(string featureName) returns AvailableFeature|error {
        string path = string `/availableFeatures(featureName='${featureName}')`;
        AvailableFeature response = check self.clientEp->get(path, targetType = AvailableFeature);
        return response;
    }
    # Returns a list of dataflow storage accounts the user has access to.
    #
    # + return - OK 
    remote isolated function dataflowstorageaccountsGetdataflowstorageaccounts() returns DataflowStorageAccounts|error {
        string path = string `/dataflowStorageAccounts`;
        DataflowStorageAccounts response = check self.clientEp->get(path, targetType = DataflowStorageAccounts);
        return response;
    }
    # Assigns the specified workspace to the specified dataflow storage account.
    #
    # + groupId - The workspace id 
    # + payload - Assign to Power BI dataflow storage account parameters 
    # + return - OK 
    remote isolated function groupsAssigntodataflowstorage(string groupId, AssignToDataflowStorageRequest payload) returns http:Response|error {
        string path = string `/groups/${groupId}/AssignToDataflowStorage`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Initiate a call to receive metadata for the requested list of workspaces. (Preview)
    #
    # + lineage - Whether to return lineage info (upstream dataflows, tiles, datasource IDs)​ 
    # + datasourceDetails - Whether to return datasource details​ 
    # + payload - Required workspace IDs to get info for 
    # + return - Accepted 
    remote isolated function workspaceinfoPostworkspaceinfo(RequiredWorkspaces payload, boolean? lineage = (), boolean? datasourceDetails = ()) returns ScanRequest|error {
        string path = string `/admin/workspaces/getInfo`;
        map<anydata> queryParam = {"lineage": lineage, "datasourceDetails": datasourceDetails};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ScanRequest response = check self.clientEp->post(path, request, targetType = ScanRequest);
        return response;
    }
    # Gets scan status for the specified scan. (Preview)
    #
    # + scanId - The scan id 
    # + return - OK 
    remote isolated function workspaceinfoGetscanstatus(string scanId) returns ScanRequest|error {
        string path = string `/admin/workspaces/scanStatus/${scanId}`;
        ScanRequest response = check self.clientEp->get(path, targetType = ScanRequest);
        return response;
    }
    # Gets scan result for the specified scan (should be called only after getting status Succeeded in the scan status API). Scan result will be available for up to 24 hours. (Preview)
    #
    # + scanId - The scan id 
    # + return - OK 
    remote isolated function workspaceinfoGetscanresult(string scanId) returns WorkspaceInfoResponse|error {
        string path = string `/admin/workspaces/scanResult/${scanId}`;
        WorkspaceInfoResponse response = check self.clientEp->get(path, targetType = WorkspaceInfoResponse);
        return response;
    }
    # Gets a list of workspace IDs in the organization. When using modifiedSince, returns only the IDs of workspaces that had changed since the time specified in the modifiedSince parameter. If not provided, returns a list of all workspace IDs in the organization. modifiedSince parameter should range from 30 minutes to 30 days ago. Notice changes can take up to 30 minutes to take effect. (Preview)
    #
    # + modifiedSince - Last modified date​ (must be in ISO 8601 compliant UTC format) 
    # + return - OK 
    remote isolated function workspaceinfoGetmodifiedworkspaces(string? modifiedSince = ()) returns ModifiedWorkspaces|error {
        string path = string `/admin/workspaces/modified`;
        map<anydata> queryParam = {"modifiedSince": modifiedSince};
        path = path + check getPathForQueryParam(queryParam);
        ModifiedWorkspaces response = check self.clientEp->get(path, targetType = ModifiedWorkspaces);
        return response;
    }
    # Assigns the provided workspaces to the specified capacity.
    #
    # + payload - Admin assign workspaces capacity parameters 
    # + return - OK 
    remote isolated function capacitiesAssignworkspacestocapacity(AssignWorkspacesToCapacityRequest payload) returns http:Response|error {
        string path = string `/admin/capacities/AssignWorkspaces`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Unassigns the provided workspaces from capacity.
    #
    # + payload - Admin assign workspaces to shared capacity parameters 
    # + return - OK 
    remote isolated function capacitiesUnassignworkspacesfromcapacity(UnassignWorkspacesCapacityRequest payload) returns http:Response|error {
        string path = string `/admin/capacities/UnassignWorkspaces`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Returns a list of datasets for the organization.
    #
    # + filter - Filters the results, based on a boolean condition 
    # + top - Returns only the first n results 
    # + skip - Skips the first n results 
    # + return - OK 
    remote isolated function datasetsGetdatasetsasadmin(string? filter = (), int? top = (), int? skip = ()) returns Datasets|error {
        string path = string `/admin/datasets`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip};
        path = path + check getPathForQueryParam(queryParam);
        Datasets response = check self.clientEp->get(path, targetType = Datasets);
        return response;
    }
    # Returns a list of datasources for the specified dataset.
    #
    # + datasetId - The dataset id 
    # + return - OK 
    remote isolated function datasetsGetdatasourcesasadmin(string datasetId) returns Datasources|error {
        string path = string `/admin/datasets/${datasetId}/datasources`;
        Datasources response = check self.clientEp->get(path, targetType = Datasources);
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
        string path = string `/admin/groups`;
        map<anydata> queryParam = {"$expand": expand, "$filter": filter, "$top": top, "$skip": skip};
        path = path + check getPathForQueryParam(queryParam);
        Groups response = check self.clientEp->get(path, targetType = Groups);
        return response;
    }
    # Updates the specified workspace properties.
    #
    # + groupId - The workspace id 
    # + payload - The properties to update 
    # + return - OK 
    remote isolated function groupsUpdategroupasadmin(string groupId, Group payload) returns http:Response|error {
        string path = string `/admin/groups/${groupId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType = http:Response);
        return response;
    }
    # Grants user permissions to the specified workspace.
    #
    # + groupId - The workspace id 
    # + payload - Details of user access right 
    # + return - OK 
    remote isolated function groupsAdduserasadmin(string groupId, GroupUser payload) returns http:Response|error {
        string path = string `/admin/groups/${groupId}/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Removes user permissions to the specified workspace.
    #
    # + groupId - The workspace id 
    # + user - The user principal name (UPN) of the user to remove (usually the user's email). 
    # + return - OK 
    remote isolated function groupsDeleteuserasadmin(string groupId, string user) returns http:Response|error {
        string path = string `/admin/groups/${groupId}/users/${user}`;
        http:Response response = check self.clientEp->delete(path, targetType = http:Response);
        return response;
    }
    # Restores a deleted workspace.
    #
    # + groupId - The workspace id 
    # + payload - Details of the group restore request 
    # + return - OK 
    remote isolated function groupsRestoredeletedgroupasadmin(string groupId, GroupRestoreRequest payload) returns http:Response|error {
        string path = string `/admin/groups/${groupId}/restore`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType = http:Response);
        return response;
    }
    # Returns a list of upstream dataflows for the specified dataflow.
    #
    # + groupId - The workspace id 
    # + dataflowId - The dataflow id 
    # + return - OK 
    remote isolated function dataflowsGetupstreamdataflowsingroupasadmin(string groupId, string dataflowId) returns DependentDataflows|error {
        string path = string `/admin/groups/${groupId}/dataflows/${dataflowId}/upstreamDataflows`;
        DependentDataflows response = check self.clientEp->get(path, targetType = DependentDataflows);
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
        string path = string `/admin/groups/${groupId}/dashboards`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip};
        path = path + check getPathForQueryParam(queryParam);
        Dashboards response = check self.clientEp->get(path, targetType = Dashboards);
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
        string path = string `/admin/groups/${groupId}/reports`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip};
        path = path + check getPathForQueryParam(queryParam);
        Reports response = check self.clientEp->get(path, targetType = Reports);
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
        string path = string `/admin/groups/${groupId}/datasets`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        Datasets response = check self.clientEp->get(path, targetType = Datasets);
        return response;
    }
    # Returns a list of upstream dataflows for datasets from the specified workspace.
    #
    # + groupId - The workspace id 
    # + return - OK 
    remote isolated function datasetsGetdatasettodataflowslinksingroupasadmin(string groupId) returns DatasetToDataflowLinksResponse|error {
        string path = string `/admin/groups/${groupId}/datasets/upstreamDataflows`;
        DatasetToDataflowLinksResponse response = check self.clientEp->get(path, targetType = DatasetToDataflowLinksResponse);
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
        string path = string `/admin/groups/${groupId}/dataflows`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip};
        path = path + check getPathForQueryParam(queryParam);
        Dataflows response = check self.clientEp->get(path, targetType = Dataflows);
        return response;
    }
    # Returns a list of reports for the organization.
    #
    # + filter - Filters the results, based on a boolean condition 
    # + top - Returns only the first n results 
    # + skip - Skips the first n results 
    # + return - OK 
    remote isolated function reportsGetreportsasadmin(string? filter = (), int? top = (), int? skip = ()) returns Reports|error {
        string path = string `/admin/reports`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip};
        path = path + check getPathForQueryParam(queryParam);
        Reports response = check self.clientEp->get(path, targetType = Reports);
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
        string path = string `/admin/dashboards`;
        map<anydata> queryParam = {"$expand": expand, "$filter": filter, "$top": top, "$skip": skip};
        path = path + check getPathForQueryParam(queryParam);
        Dashboards response = check self.clientEp->get(path, targetType = Dashboards);
        return response;
    }
    # Returns a list of tiles within the specified dashboard.
    #
    # + dashboardId - The dashboard id 
    # + return - OK 
    remote isolated function dashboardsGettilesasadmin(string dashboardId) returns Tiles|error {
        string path = string `/admin/dashboards/${dashboardId}/tiles`;
        Tiles response = check self.clientEp->get(path, targetType = Tiles);
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
        string path = string `/admin/imports`;
        map<anydata> queryParam = {"$expand": expand, "$filter": filter, "$top": top, "$skip": skip};
        path = path + check getPathForQueryParam(queryParam);
        Imports response = check self.clientEp->get(path, targetType = Imports);
        return response;
    }
    # Returns the encryption keys for the tenant.
    #
    # + return - OK 
    remote isolated function adminGetpowerbiencryptionkeys() returns TenantKeys|error {
        string path = string `/admin/tenantKeys`;
        TenantKeys response = check self.clientEp->get(path, targetType = TenantKeys);
        return response;
    }
    # Adds an encryption key for Power BI workspaces assigned to a capacity.
    #
    # + payload - Tenant key information 
    # + return - OK 
    remote isolated function adminAddpowerbiencryptionkey(TenantKeyCreationRequest payload) returns TenantKey|error {
        string path = string `/admin/tenantKeys`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TenantKey response = check self.clientEp->post(path, request, targetType = TenantKey);
        return response;
    }
    # Rotate the encryption key for Power BI workspaces assigned to a capacity.
    #
    # + tenantKeyId - Tenant key id 
    # + payload - Tenant key information 
    # + return - OK 
    remote isolated function adminRotatepowerbiencryptionkey(string tenantKeyId, TenantKeyRotationRequest payload) returns TenantKey|error {
        string path = string `/admin/tenantKeys/${tenantKeyId}/Default.Rotate`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TenantKey response = check self.clientEp->post(path, request, targetType = TenantKey);
        return response;
    }
    # Returns a list of capacities for the organization.
    #
    # + expand - Expands related entities inline 
    # + return - OK 
    remote isolated function adminGetcapacitiesasadmin(string? expand = ()) returns Capacities|error {
        string path = string `/admin/capacities`;
        map<anydata> queryParam = {"$expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        Capacities response = check self.clientEp->get(path, targetType = Capacities);
        return response;
    }
    # Changes the specific capacity information. Currently, only supports changing the capacity encryption key
    #
    # + capacityId - The capacity Id 
    # + payload - Patch capacity information 
    # + return - OK 
    remote isolated function adminPatchcapacityasadmin(string capacityId, CapacityPatchRequest payload) returns http:Response|error {
        string path = string `/admin/capacities/${capacityId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType = http:Response);
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
        string path = string `/admin/capacities/refreshables`;
        map<anydata> queryParam = {"$expand": expand, "$filter": filter, "$top": top, "$skip": skip};
        path = path + check getPathForQueryParam(queryParam);
        Refreshables response = check self.clientEp->get(path, targetType = Refreshables);
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
        string path = string `/admin/capacities/${capacityId}/refreshables`;
        map<anydata> queryParam = {"$expand": expand, "$filter": filter, "$top": top, "$skip": skip};
        path = path + check getPathForQueryParam(queryParam);
        Refreshables response = check self.clientEp->get(path, targetType = Refreshables);
        return response;
    }
    # Returns the specified refreshable for the specified capacity the user has access to
    #
    # + capacityId - The capacity id 
    # + refreshableId - The refreshable id 
    # + expand - Expands related entities inline, receives a comma-separated list of data types. Supported: capacities and groups 
    # + return - OK 
    remote isolated function adminGetrefreshableforcapacity(string capacityId, string refreshableId, string? expand = ()) returns Refreshables|error {
        string path = string `/admin/capacities/${capacityId}/refreshables/${refreshableId}`;
        map<anydata> queryParam = {"$expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        Refreshables response = check self.clientEp->get(path, targetType = Refreshables);
        return response;
    }
    # Returns a list of dataflows for the organization.
    #
    # + filter - Filters the results, based on a boolean condition 
    # + top - Returns only the first n results 
    # + skip - Skips the first n results 
    # + return - OK 
    remote isolated function dataflowsGetdataflowsasadmin(string? filter = (), int? top = (), int? skip = ()) returns Dataflows|error {
        string path = string `/admin/dataflows`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip};
        path = path + check getPathForQueryParam(queryParam);
        Dataflows response = check self.clientEp->get(path, targetType = Dataflows);
        return response;
    }
    # Exports the specified dataflow definition to a .json file.
    #
    # + dataflowId - The dataflow id 
    # + return - Exported Json file 
    remote isolated function dataflowsExportdataflowasadmin(string dataflowId) returns string|error {
        string path = string `/admin/dataflows/${dataflowId}/export`;
        string response = check self.clientEp->get(path, targetType = string);
        return response;
    }
    # Returns a list of datasources for the specified dataflow.
    #
    # + dataflowId - The dataflow id 
    # + return - OK 
    remote isolated function dataflowsGetdataflowdatasourcesasadmin(string dataflowId) returns Datasources|error {
        string path = string `/admin/dataflows/${dataflowId}/datasources`;
        Datasources response = check self.clientEp->get(path, targetType = Datasources);
        return response;
    }
    # Generates an embed token for multiple reports, datasets and target workspaces. Reports and datasets do not have to be related. The binding of a report to a dataset can be done during embedding. Creating a report can only be done in workspaces specified in *targetWrokspaces*.<br/><br/>This API is relevant only to ['App owns data' embed scenario](https://docs.microsoft.com/power-bi/developer/embed-sample-for-customers). For more information about using this API, see [Considerations when generating an embed token](https://docs.microsoft.com/power-bi/developer/embedded/generate-embed-token).
    #
    # + payload - Generate token parameters 
    # + return - OK 
    remote isolated function embedtokenGeneratetoken(GenerateTokenRequestV2 payload) returns EmbedToken|error {
        string path = string `/GenerateToken`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EmbedToken response = check self.clientEp->post(path, request, targetType = EmbedToken);
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
        string path = string `/admin/activityevents`;
        map<anydata> queryParam = {"startDateTime": startDateTime, "endDateTime": endDateTime, "continuationToken": continuationToken, "$filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        ActivityEventResponse response = check self.clientEp->get(path, targetType = ActivityEventResponse);
        return response;
    }
    # Remove sensitivity labels from artifacts by artifact ID.
    #
    # + payload - Composite of artifact Id lists per Type. 
    # + return - OK 
    remote isolated function informationprotectionRemovelabelsasadmin(InformationProtectionArtifactsChangeLabel payload) returns InformationProtectionChangeLabelResponse|error {
        string path = string `/admin/informationprotection/removeLabels`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InformationProtectionChangeLabelResponse response = check self.clientEp->post(path, request, targetType = InformationProtectionChangeLabelResponse);
        return response;
    }
    # Set sensitivity labels on content in Power BI by artifact ID.
    #
    # + payload - Set label details. 
    # + return - OK 
    remote isolated function informationprotectionSetlabelsasadmin(InformationProtectionChangeLabelDetails payload) returns InformationProtectionChangeLabelResponse|error {
        string path = string `/admin/informationprotection/setLabels`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InformationProtectionChangeLabelResponse response = check self.clientEp->post(path, request, targetType = InformationProtectionChangeLabelResponse);
        return response;
    }
    # Generates an installation ticket for Template Apps automated install flow.
    #
    # + payload - Create Install Ticket parameters 
    # + return - OK 
    remote isolated function templateappsCreateinstallticket(CreateInstallTicketRequest payload) returns InstallTicket|error {
        string path = string `/CreateTemplateAppInstallTicket`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InstallTicket response = check self.clientEp->post(path, request, targetType = InstallTicket);
        return response;
    }
    # Transfers ownership over the specified paginated report datasources to the current authorized user.
    #
    # + groupId - The workspace id 
    # + reportId - The report id 
    # + return - OK 
    remote isolated function reportsTakeoveringroup(string groupId, string reportId) returns http:Response|error {
        string path = string `/groups/${groupId}/reports/${reportId}/Default.TakeOver`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
}
