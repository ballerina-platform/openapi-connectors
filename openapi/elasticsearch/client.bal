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
import ballerina/mime;

# This is a generated connector for [Elastic Cloud API](https://cloud.elastic.co/api/v1/api-docs/spec.json) OpenAPI Specification.
@display {label: "Elasticsearch", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Please create a [Elastic](https://cloud.elastic.co/) account and obtain tokens by following [this guide](https://www.elastic.co/guide/en/elasticsearch/reference/7.16/setting-up-authentication.html).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.elastic-cloud.com/api/v1/") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
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
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Shutdown Deployment Elasticsearch Resource
    #
    # + deploymentId - Identifier for the Deployment. 
    # + refId - User-specified RefId for the Resource. 
    # + hide - Hide cluster on shutdown. Hidden clusters are not listed by default. Only applicable for Platform administrators. 
    # + skipSnapshot - If true, will skip taking a snapshot of the cluster before shutting the cluster down (if even possible). 
    # + return - Standard response. 
    remote isolated function shutdownDeploymentEsResource(string deploymentId, string refId, boolean? hide = (), boolean skipSnapshot = false) returns DeploymentResourceCommandResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/elasticsearch/${getEncodedUri(refId)}/_shutdown`;
        map<anydata> queryParam = {"hide": hide, "skip_snapshot": skipSnapshot};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeploymentResourceCommandResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Start all instances
    #
    # + deploymentId - Identifier for the Deployment. 
    # + resourceKind - The kind of resource (one of elasticsearch, kibana, apm, or integrations_server). 
    # + refId - User-specified RefId for the Resource. 
    # + return - The start command was issued successfully. 
    remote isolated function startDeploymentResourceInstancesAll(string deploymentId, string resourceKind, string refId) returns DeploymentResourceCommandResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/${getEncodedUri(resourceKind)}/${getEncodedUri(refId)}/instances/_start`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeploymentResourceCommandResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get stack versions
    #
    # + showDeleted - Whether to show deleted stack versions or not 
    # + showUnusable - Whether to show versions that are unusable by the authenticated user 
    # + return - The list of all available Elastic Stack versions are retrieved, including the template version and structure. 
    remote isolated function getVersionStacks(boolean showDeleted = false, boolean showUnusable = false) returns StackVersionConfigs|error {
        string resourcePath = string `/stack/versions`;
        map<anydata> queryParam = {"show_deleted": showDeleted, "show_unusable": showUnusable};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StackVersionConfigs response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Restores a shutdown resource
    #
    # + deploymentId - Identifier for the Deployment 
    # + resourceKind - The kind of resource 
    # + refId - User-specified RefId for the Resource 
    # + restoreSnapshot - Whether or not to restore a snapshot for those resources that allow it. 
    # + return - Standard Deployment Resource Crud Response 
    remote isolated function restoreDeploymentResource(string deploymentId, string resourceKind, string refId, boolean restoreSnapshot = false) returns DeploymentResourceCrudResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/${getEncodedUri(resourceKind)}/${getEncodedUri(refId)}/_restore`;
        map<anydata> queryParam = {"restore_snapshot": restoreSnapshot};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeploymentResourceCrudResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Restores a shutdown Deployment
    #
    # + deploymentId - Identifier for the Deployment 
    # + restoreSnapshot - Whether or not to restore a snapshot for those resources that allow it. 
    # + return - The request was valid and the resources of the deployment were restored. 
    remote isolated function restoreDeployment(string deploymentId, boolean restoreSnapshot = false) returns DeploymentRestoreResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/_restore`;
        map<anydata> queryParam = {"restore_snapshot": restoreSnapshot};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeploymentRestoreResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get deployment templates
    #
    # + metadata - An optional key/value pair in the form of (key:value) that will act as a filter and exclude any templates that do not have a matching metadata item associated. 
    # + showInstanceConfigurations - If true, will return details for each instance configuration referenced by the template. 
    # + showMaxZones - If true, will populate the max_zones field in the instance configurations. Only relevant if show_instance_configurations=true. 
    # + stackVersion - If present, it will cause the returned deployment templates to be adapted to return only the elements allowed in that version. 
    # + region - Region of the deployment templates 
    # + return - The deployment templates were returned successfully. 
    remote isolated function getDeploymentTemplatesV2(string region, string? metadata = (), boolean showInstanceConfigurations = true, boolean showMaxZones = false, string? stackVersion = ()) returns DeploymentTemplateInfoV2[]|error {
        string resourcePath = string `/deployments/templates`;
        map<anydata> queryParam = {"metadata": metadata, "show_instance_configurations": showInstanceConfigurations, "show_max_zones": showMaxZones, "stack_version": stackVersion, "region": region};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeploymentTemplateInfoV2[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get API key
    #
    # + apiKeyId - The API Key ID. 
    # + return - The API key metadata is retrieved. 
    remote isolated function getApiKey(string apiKeyId) returns ApiKeyResponse|error {
        string resourcePath = string `/users/auth/keys/${getEncodedUri(apiKeyId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ApiKeyResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete API key
    #
    # + apiKeyId - The API Key ID. 
    # + return - The API key is deleted. 
    remote isolated function deleteApiKey(string apiKeyId) returns EmptyResponse|error {
        string resourcePath = string `/users/auth/keys/${getEncodedUri(apiKeyId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EmptyResponse response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Fetch current account information
    #
    # + return - Account fetched successfully 
    remote isolated function getCurrentAccount() returns AccountResponse|error {
        string resourcePath = string `/account`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Updates the current account
    #
    # + payload - the current account 
    # + return - Account updated successfully 
    remote isolated function updateCurrentAccount(AccountUpdateRequest payload) returns AccountResponse|error {
        string resourcePath = string `/account`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AccountResponse response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Updates the current account
    #
    # + payload - All changes in the specified object are applied to the current account according to the JSON Merge Patch processing rules. Omitting existing fields causes the same values to be reapplied. Specifying a `null` value reverts the field to the default value, or removes the field when no default value exists. 
    # + return - Account updated successfully 
    remote isolated function patchCurrentAccount(string payload) returns AccountResponse|error {
        string resourcePath = string `/account`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AccountResponse response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Get remote clusters
    #
    # + deploymentId - Identifier for the Deployment. 
    # + refId - User-specified RefId for the Resource. 
    # + return - List of remote clusters for the resource 
    remote isolated function getDeploymentEsResourceRemoteClusters(string deploymentId, string refId) returns RemoteResources|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/elasticsearch/${getEncodedUri(refId)}/remote-clusters`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RemoteResources response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Set remote clusters
    #
    # + deploymentId - Identifier for the Deployment. 
    # + refId - User-specified RefId for the Resource. 
    # + payload - List of remote clusters for the resource 
    # + return - The Remote Clusters were updated 
    remote isolated function setDeploymentEsResourceRemoteClusters(string deploymentId, string refId, RemoteResources payload) returns EmptyResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/elasticsearch/${getEncodedUri(refId)}/remote-clusters`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmptyResponse response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Get deployment template
    #
    # + templateId - The identifier for the deployment template. 
    # + showInstanceConfigurations - If true, will return details for each instance configuration referenced by the template. 
    # + showMaxZones - If true, will populate the max_zones field in the instance configurations. Only relevant if show_instance_configurations=true. 
    # + stackVersion - If present, it will cause the returned deployment template to be adapted to return only the elements allowed in that version. 
    # + region - Region of the deployment template 
    # + return - The deployment template was found and returned successfully. 
    remote isolated function getDeploymentTemplateV2(string templateId, string region, boolean showInstanceConfigurations = true, boolean showMaxZones = false, string? stackVersion = ()) returns DeploymentTemplateInfoV2|error {
        string resourcePath = string `/deployments/templates/${getEncodedUri(templateId)}`;
        map<anydata> queryParam = {"show_instance_configurations": showInstanceConfigurations, "show_max_zones": showMaxZones, "stack_version": stackVersion, "region": region};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeploymentTemplateInfoV2 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Reset the secret token for an APM resource.
    #
    # + deploymentId - Identifier for the Deployment. 
    # + refId - User-specified RefId for the Resource. 
    # + return - Response containing the new secret token, plan to apply it starts 
    remote isolated function deploymentApmResetSecretToken(string deploymentId, string refId) returns ApmCrudResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/apm/${getEncodedUri(refId)}/_reset-token`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ApmCrudResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Deployment Enterprise Search Resource Info
    #
    # + deploymentId - Identifier for the Deployment 
    # + refId - User-specified RefId for the Resource 
    # + showMetadata - Whether to include the full cluster metadata in the response - can be large per cluster and also include credentials. 
    # + showPlans - Whether to include the full current and pending plan information in the response - can be large per cluster. 
    # + showPlanLogs - Whether to include with the current and pending plan information the attempt log - can be very large per cluster. 
    # + showPlanHistory - Whether to include with the current and pending plan information the plan history- can be very large per cluster. 
    # + showPlanDefaults - If showing plans, whether to show values that are left at their default value (less readable but more informative). 
    # + showSettings - Whether to show cluster settings in the response. 
    # + return - Standard response. 
    remote isolated function getDeploymentEnterpriseSearchResourceInfo(string deploymentId, string refId, boolean showMetadata = false, boolean showPlans = true, boolean showPlanLogs = false, boolean showPlanHistory = false, boolean showPlanDefaults = false, boolean showSettings = false) returns EnterpriseSearchResourceInfo|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/enterprise_search/${getEncodedUri(refId)}`;
        map<anydata> queryParam = {"show_metadata": showMetadata, "show_plans": showPlans, "show_plan_logs": showPlanLogs, "show_plan_history": showPlanHistory, "show_plan_defaults": showPlanDefaults, "show_settings": showSettings};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EnterpriseSearchResourceInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Deployment Kibana Resource Info
    #
    # + deploymentId - Identifier for the Deployment 
    # + refId - User-specified RefId for the Resource 
    # + showMetadata - Whether to include the full cluster metadata in the response - can be large per cluster and also include credentials. 
    # + showPlans - Whether to include the full current and pending plan information in the response - can be large per cluster. 
    # + showPlanLogs - Whether to include with the current and pending plan information the attempt log - can be very large per cluster. 
    # + showPlanHistory - Whether to include with the current and pending plan information the plan history- can be very large per cluster. 
    # + showPlanDefaults - If showing plans, whether to show values that are left at their default value (less readable but more informative). 
    # + convertLegacyPlans - If showing plans, whether to leave pre-2.0.0 plans in their legacy format (the default), or whether to update them to 2.0.x+ format (if 'true'). 
    # + showSettings - Whether to show cluster settings in the response. 
    # + return - Standard response. 
    remote isolated function getDeploymentKibResourceInfo(string deploymentId, string refId, boolean showMetadata = false, boolean showPlans = true, boolean showPlanLogs = false, boolean showPlanHistory = false, boolean showPlanDefaults = false, boolean convertLegacyPlans = false, boolean showSettings = false) returns KibanaResourceInfo|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/kibana/${getEncodedUri(refId)}`;
        map<anydata> queryParam = {"show_metadata": showMetadata, "show_plans": showPlans, "show_plan_logs": showPlanLogs, "show_plan_history": showPlanHistory, "show_plan_defaults": showPlanDefaults, "convert_legacy_plans": convertLegacyPlans, "show_settings": showSettings};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        KibanaResourceInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Set AppSearch read-only status
    #
    # + deploymentId - Identifier for the Deployment. 
    # + refId - User-specified RefId for the Resource. 
    # + return - Standard response 
    remote isolated function getAppsearchReadOnlyMode(string deploymentId, string refId) returns ReadOnlyResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/appsearch/${getEncodedUri(refId)}/read_only_mode`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ReadOnlyResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Set AppSearch read-only status
    #
    # + deploymentId - Identifier for the Deployment. 
    # + refId - User-specified RefId for the Resource. 
    # + payload - read-only request body 
    # + return - Standard response 
    remote isolated function setAppsearchReadOnlyMode(string deploymentId, string refId, ReadOnlyRequest payload) returns ReadOnlyResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/appsearch/${getEncodedUri(refId)}/read_only_mode`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ReadOnlyResponse response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Restart Deployment Stateless Resource
    #
    # + deploymentId - Identifier for the Deployment. 
    # + statelessResourceKind - The kind of stateless resource 
    # + refId - User-specified RefId for the Resource. 
    # + cancelPending - If true, cancels any pending plans before restarting. If false and there are pending plans, returns an error. 
    # + return - The restart command was issued successfully 
    remote isolated function restartDeploymentStatelessResource(string deploymentId, string statelessResourceKind, string refId, boolean cancelPending = false) returns DeploymentResourceCommandResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/${getEncodedUri(statelessResourceKind)}/${getEncodedUri(refId)}/_restart`;
        map<anydata> queryParam = {"cancel_pending": cancelPending};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeploymentResourceCommandResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Shuts down Deployment
    #
    # + deploymentId - Identifier for the Deployment 
    # + hide - Whether or not to hide the deployment and its resources.Only applicable for Platform administrators. 
    # + skipSnapshot - Whether or not to skip snapshots before shutting down the resources 
    # + return - The request was valid and the resources of the deployment were shutdown. 
    remote isolated function shutdownDeployment(string deploymentId, boolean? hide = (), boolean skipSnapshot = false) returns DeploymentShutdownResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/_shutdown`;
        map<anydata> queryParam = {"hide": hide, "skip_snapshot": skipSnapshot};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeploymentShutdownResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Migrate Elasticsearch resource to use SLM
    #
    # + deploymentId - Identifier for the Deployment. 
    # + refId - User-specified RefId for the Resource. 
    # + validateOnly - When `true`, does not enable SLM but returns warnings if any applications may lose availability during SLM migration. 
    # + return - Standard response 
    remote isolated function enableDeploymentResourceSlm(string deploymentId, string refId, boolean validateOnly = false) returns DeploymentResourceCommandResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/elasticsearch/${getEncodedUri(refId)}/_enable-slm`;
        map<anydata> queryParam = {"validate_only": validateOnly};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeploymentResourceCommandResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete ruleset association
    #
    # + rulesetId - The mandatory ruleset ID. 
    # + associationType - Association type 
    # + associatedEntityId - Associated entity ID 
    # + return - Delete association request was valid and the association has been deleted 
    remote isolated function deleteTrafficFilterRulesetAssociation(string rulesetId, string associationType, string associatedEntityId) returns EmptyResponse|error {
        string resourcePath = string `/deployments/traffic-filter/rulesets/${getEncodedUri(rulesetId)}/associations/${getEncodedUri(associationType)}/${getEncodedUri(associatedEntityId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EmptyResponse response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Restart Deployment Elasticsearch Resource
    #
    # + deploymentId - Identifier for the Deployment. 
    # + refId - User-specified RefId for the Resource. 
    # + restoreSnapshot - When set to true and restoring from shutdown, then will restore the cluster from the last snapshot (if available). 
    # + skipSnapshot - If true, will not take a snapshot of the cluster before restarting. 
    # + cancelPending - If true, cancels any pending plans before restarting. If false and there are pending plans, returns an error. 
    # + groupAttribute - Indicates the property or properties used to divide the list of instances to restart in groups. Valid options are: '\_\_all\_\_' (restart all at once), '\_\_zone\_\_' by logical zone, '\_\_name\_\_' one instance at a time, or a comma-separated list of attributes of the instances 
    # + shardInitWaitTime - The time, in seconds, to wait for shards that show no progress of initializing, before rolling the next group (default: 10 minutes) 
    # + return - The restart command was issued successfully. 
    remote isolated function restartDeploymentEsResource(string deploymentId, string refId, boolean restoreSnapshot = true, boolean skipSnapshot = true, boolean cancelPending = false, string groupAttribute = "__zone__", int shardInitWaitTime = 600) returns DeploymentResourceCommandResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/elasticsearch/${getEncodedUri(refId)}/_restart`;
        map<anydata> queryParam = {"restore_snapshot": restoreSnapshot, "skip_snapshot": skipSnapshot, "cancel_pending": cancelPending, "group_attribute": groupAttribute, "shard_init_wait_time": shardInitWaitTime};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeploymentResourceCommandResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get costs overview for the organization
    #
    # + organizationId - Identifier for the organization 
    # + 'from - A datetime for the beginning of the desired range for which to fetch costs. Defaults to start of current month. 
    # + to - A datetime for the end of the desired range for which to fetch costs. Defaults to the current date. 
    # + return - Top-level cost overview for the organization 
    remote isolated function getCostsOverview(string organizationId, string? 'from = (), string? to = ()) returns CostsOverview|error {
        string resourcePath = string `/billing/costs/${getEncodedUri(organizationId)}`;
        map<anydata> queryParam = {"from": 'from, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CostsOverview response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Start maintenance mode (all instances)
    #
    # + deploymentId - Identifier for the Deployment. 
    # + resourceKind - The kind of resource (one of elasticsearch, kibana, apm, or integrations_server). 
    # + refId - User-specified RefId for the Resource. 
    # + return - The start maintenance command was issued successfully. 
    remote isolated function startDeploymentResourceInstancesAllMaintenanceMode(string deploymentId, string resourceKind, string refId) returns DeploymentResourceCommandResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/${getEncodedUri(resourceKind)}/${getEncodedUri(refId)}/instances/maintenance-mode/_start`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeploymentResourceCommandResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get deployments costs for the organization
    #
    # + organizationId - Identifier for the organization 
    # + 'from - A datetime for the beginning of the desired range for which to fetch activity. Defaults to start of current month. 
    # + to - A datetime for the end of the desired range for which to fetch activity. Defaults to the current date. 
    # + return - The costs associated to a set of products 
    remote isolated function getCostsDeployments(string organizationId, string? 'from = (), string? to = ()) returns DeploymentsCosts|error {
        string resourcePath = string `/billing/costs/${getEncodedUri(organizationId)}/deployments`;
        map<anydata> queryParam = {"from": 'from, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeploymentsCosts response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Extensions
    #
    # + includeDeployments - Include deployments referencing this extension. DEPRECATED: To get the list of deployments that reference an extension, use the Get Extension API. 
    # + return - The extensions that are available 
    remote isolated function listExtensions(boolean includeDeployments = false) returns Extensions|error {
        string resourcePath = string `/deployments/extensions`;
        map<anydata> queryParam = {"include_deployments": includeDeployments};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Extensions response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create an extension
    #
    # + payload - the data that creates the extension 
    # + return - The extension that was just created. 
    remote isolated function createExtension(CreateExtensionRequest payload) returns Extension|error {
        string resourcePath = string `/deployments/extensions`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Extension response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get itemized costs for the organization
    #
    # + organizationId - Identifier for the organization 
    # + 'from - A datetime for the beginning of the desired range for which to fetch costs. Defaults to start of current month. 
    # + to - A datetime for the end of the desired range for which to fetch costs. Defaults to the current date. 
    # + return - The costs associated to a set of items 
    remote isolated function getCostsItems(string organizationId, string? 'from = (), string? to = ()) returns ItemsCosts|error {
        string resourcePath = string `/billing/costs/${getEncodedUri(organizationId)}/items`;
        map<anydata> queryParam = {"from": 'from, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ItemsCosts response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get associated deployments
    #
    # + rulesetId - The mandatory ruleset ID. 
    # + return - Associations referred by traffic filter rulesets were successfully returned 
    remote isolated function getTrafficFilterRulesetDeploymentAssociations(string rulesetId) returns RulesetAssociations|error {
        string resourcePath = string `/deployments/traffic-filter/rulesets/${getEncodedUri(rulesetId)}/associations`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RulesetAssociations response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create ruleset association
    #
    # + rulesetId - The mandatory ruleset ID. 
    # + payload - Mandatory ruleset association description 
    # + return - Create association request was valid and the association already exists 
    remote isolated function createTrafficFilterRulesetAssociation(string rulesetId, FilterAssociation payload) returns EmptyResponse|error {
        string resourcePath = string `/deployments/traffic-filter/rulesets/${getEncodedUri(rulesetId)}/associations`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EmptyResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reset 'elastic' user password
    #
    # + deploymentId - Identifier for the Deployment. 
    # + refId - User-specified RefId for the Resource. 
    # + return - The password reset was out carried successfully 
    remote isolated function resetElasticsearchUserPassword(string deploymentId, string refId) returns ElasticsearchElasticUserPasswordResetResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/elasticsearch/${getEncodedUri(refId)}/_reset-password`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ElasticsearchElasticUserPasswordResetResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Deployment upgade assistant status
    #
    # + deploymentId - Identifier for the Deployment 
    # + return - The Upgrade Assistant returned the status successfully 
    remote isolated function getDeploymentUpgradeAssistantStatus(string deploymentId) returns DeploymentUpgradeAssistantStatusResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/upgrade_assistant/status`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeploymentUpgradeAssistantStatusResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Stop all instances
    #
    # + deploymentId - Identifier for the Deployment. 
    # + resourceKind - The kind of resource (one of elasticsearch, kibana, apm, or integrations_server). 
    # + refId - User-specified RefId for the Resource. 
    # + return - The stop command was issued successfully. 
    remote isolated function stopDeploymentResourceInstancesAll(string deploymentId, string resourceKind, string refId) returns DeploymentResourceCommandResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/${getEncodedUri(resourceKind)}/${getEncodedUri(refId)}/instances/_stop`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeploymentResourceCommandResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get all API keys
    #
    # + return - The metadata for the API keys is retrieved. 
    remote isolated function getApiKeys() returns ApiKeysResponse|error {
        string resourcePath = string `/users/auth/keys`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ApiKeysResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create API key
    #
    # + payload - The request to create the API key 
    # + return - The API key is created and returned in the body of the response. 
    remote isolated function createApiKey(CreateApiKeyRequest payload) returns ApiKeyResponse|error {
        string resourcePath = string `/users/auth/keys`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiKeyResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Migrate Elasticsearch and associated Kibana resources to enable CCR
    #
    # + deploymentId - Identifier for the Deployment. 
    # + refId - User-specified RefId for the Resource. 
    # + validateOnly - When `true`, will not enable CCR but returns warnings if any elements may lose availability during CCR enablement 
    # + return - Standard response 
    remote isolated function enableDeploymentResourceCcr(string deploymentId, string refId, boolean validateOnly = false) returns DeploymentResourceCommandResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/elasticsearch/${getEncodedUri(refId)}/_enable-ccr`;
        map<anydata> queryParam = {"validate_only": validateOnly};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeploymentResourceCommandResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the items in the Elasticsearch resource keystore
    #
    # + deploymentId - Identifier for the Deployment 
    # + refId - User-specified RefId for the Resource 
    # + return - The contents of the Elasticsearch keystore 
    remote isolated function getDeploymentEsResourceKeystore(string deploymentId, string refId) returns KeystoreContents|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/elasticsearch/${getEncodedUri(refId)}/keystore`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        KeystoreContents response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add or remove items from the Elasticsearch resource keystore
    #
    # + deploymentId - Identifier for the Deployment 
    # + refId - User-specified RefId for the Resource 
    # + payload - The new settings that will be applied to the keystore of the Elasticsearch resource. 
    # + return - The new contents of the Elasticsearch keystore 
    remote isolated function setDeploymentEsResourceKeystore(string deploymentId, string refId, KeystoreContents payload) returns KeystoreContents|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/elasticsearch/${getEncodedUri(refId)}/keystore`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        KeystoreContents response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # List traffic filter rulesets
    #
    # + includeAssociations - Retrieves a list of resources that are associated to the specified ruleset. 
    # + region - If provided limits the rulesets to that region only. 
    # + return - The collection of traffic filter routes 
    remote isolated function getTrafficFilterRulesets(boolean includeAssociations = false, string? region = ()) returns TrafficFilterRulesets|error {
        string resourcePath = string `/deployments/traffic-filter/rulesets`;
        map<anydata> queryParam = {"include_associations": includeAssociations, "region": region};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TrafficFilterRulesets response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a ruleset
    #
    # + payload - The specification for traffic filter ruleset. 
    # + return - The ruleset definition is valid and the creation has started. 
    remote isolated function createTrafficFilterRuleset(TrafficFilterRulesetRequest payload) returns TrafficFilterRulesetResponse|error {
        string resourcePath = string `/deployments/traffic-filter/rulesets`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TrafficFilterRulesetResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Search Deployments
    #
    # + payload - (Optional) The search query to run. When not specified, all of the deployments are matched. 
    # + return - The list of deployments that match the specified query and belong to the authenticated user. 
    remote isolated function searchDeployments(SearchRequest payload) returns DeploymentsSearchResponse|error {
        string resourcePath = string `/deployments/_search`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeploymentsSearchResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get itemized costs by deployments
    #
    # + organizationId - Identifier for the organization 
    # + deploymentId - Id of a Deployment 
    # + 'from - A datetime for the beginning of the desired range for which to fetch costs. Defaults to start of current month. 
    # + to - A datetime for the end of the desired range for which to fetch costs. Defaults to the current date. 
    # + return - The costs associated to a set items billed for a single deployment. 
    remote isolated function getCostsItemsByDeployment(string organizationId, string deploymentId, string? 'from = (), string? to = ()) returns ItemsCosts|error {
        string resourcePath = string `/billing/costs/${getEncodedUri(organizationId)}/deployments/${getEncodedUri(deploymentId)}/items`;
        map<anydata> queryParam = {"from": 'from, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ItemsCosts response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get eligible remote clusters
    #
    # + deploymentId - Identifier for the Deployment. 
    # + refId - User-specified RefId for the Resource. 
    # + payload - (Optional) The search query to run against all deployments containing eligible remote clusters. When not specified, all the eligible deployments are matched. 
    # + return - List of deployments which contains eligible remote clusters for the resource 
    remote isolated function getDeploymentEsResourceEligibleRemoteClusters(string deploymentId, string refId, SearchRequest payload) returns DeploymentsSearchResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/elasticsearch/${getEncodedUri(refId)}/eligible-remote-clusters`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeploymentsSearchResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Deployment
    #
    # + deploymentId - Identifier for the Deployment 
    # + showSecurity - Whether to include the Elasticsearch 2.x security information in the response - can be large per cluster and also include credentials 
    # + showMetadata - Whether to include the full cluster metadata in the response - can be large per cluster and also include credentials 
    # + showPlans - Whether to include the full current and pending plan information in the response - can be large per cluster 
    # + showPlanLogs - Whether to include with the current and pending plan information the attempt log - can be very large per cluster 
    # + showPlanHistory - Whether to include with the current and pending plan information the plan history- can be very large per cluster 
    # + showPlanDefaults - If showing plans, whether to show values that are left at their default value (less readable but more informative) 
    # + convertLegacyPlans - If showing plans, whether to leave pre-2.0.0 plans in their legacy format (the default), or whether to update them to 2.0.x+ format (if 'true') 
    # + showSystemAlerts - Number of system alerts (such as forced restarts due to memory limits) to be included in the response - can be large per cluster. Negative numbers or 0 will not return field. 
    # + showSettings - Whether to show cluster settings in the response. 
    # + enrichWithTemplate - If showing plans, whether to enrich the plan by including the missing elements from the deployment template it is based on 
    # + return - The Deployment info response 
    remote isolated function getDeployment(string deploymentId, boolean showSecurity = false, boolean showMetadata = false, boolean showPlans = true, boolean showPlanLogs = false, boolean showPlanHistory = false, boolean showPlanDefaults = false, boolean convertLegacyPlans = false, int showSystemAlerts = 0, boolean showSettings = false, boolean enrichWithTemplate = true) returns DeploymentGetResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}`;
        map<anydata> queryParam = {"show_security": showSecurity, "show_metadata": showMetadata, "show_plans": showPlans, "show_plan_logs": showPlanLogs, "show_plan_history": showPlanHistory, "show_plan_defaults": showPlanDefaults, "convert_legacy_plans": convertLegacyPlans, "show_system_alerts": showSystemAlerts, "show_settings": showSettings, "enrich_with_template": enrichWithTemplate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeploymentGetResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Deployment
    #
    # + deploymentId - Identifier for the Deployment 
    # + hidePrunedOrphans - Whether or not to hide orphaned resources that were shut down (relevant if prune on the request is true) 
    # + skipSnapshot - Whether or not to skip snapshots before shutting down orphaned resources (relevant if prune on the request is true) 
    # + validateOnly - If true, will just validate the Deployment definition but will not perform the update 
    # + 'version - If specified then checks for conflicts against the version stored in the persistent store (returned in 'x-cloud-resource-version' of the GET request) 
    # + payload - The deployment definition 
    # + return - The request was valid and the deployment was updated. 
    remote isolated function updateDeployment(string deploymentId, DeploymentUpdateRequest payload, boolean hidePrunedOrphans = false, boolean skipSnapshot = false, boolean validateOnly = false, string? 'version = ()) returns DeploymentUpdateResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}`;
        map<anydata> queryParam = {"hide_pruned_orphans": hidePrunedOrphans, "skip_snapshot": skipSnapshot, "validate_only": validateOnly, "version": 'version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeploymentUpdateResponse response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Deployment Elasticsearch Resource Info
    #
    # + deploymentId - Identifier for the Deployment 
    # + refId - User-specified RefId for the Resource 
    # + showSecurity - Whether to include the Elasticsearch 2.x security information in the response - can be large per cluster and also include credentials. 
    # + showMetadata - Whether to include the full cluster metadata in the response - can be large per cluster and also include credentials. 
    # + showPlans - Whether to include the full current and pending plan information in the response - can be large per cluster. 
    # + showPlanLogs - Whether to include with the current and pending plan information the attempt log - can be very large per cluster. 
    # + showPlanHistory - Whether to include with the current and pending plan information the plan history- can be very large per cluster. 
    # + showPlanDefaults - If showing plans, whether to show values that are left at their default value (less readable but more informative). 
    # + convertLegacyPlans - If showing plans, whether to leave pre-2.0.0 plans in their legacy format (the default), or whether to update them to 2.0.x+ format (if 'true'). 
    # + showSystemAlerts - Number of system alerts (such as forced restarts due to memory limits) to be included in the response - can be large per cluster. Negative numbers or 0 will not return field. 
    # + showSettings - Whether to show cluster settings in the response. 
    # + enrichWithTemplate - If showing plans, whether to enrich the plan by including the missing elements from the deployment template it is based on. 
    # + return - Standard response. 
    remote isolated function getDeploymentEsResourceInfo(string deploymentId, string refId, boolean showSecurity = false, boolean showMetadata = false, boolean showPlans = true, boolean showPlanLogs = false, boolean showPlanHistory = false, boolean showPlanDefaults = false, boolean convertLegacyPlans = false, int showSystemAlerts = 0, boolean showSettings = false, boolean enrichWithTemplate = true) returns ElasticsearchResourceInfo|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/elasticsearch/${getEncodedUri(refId)}`;
        map<anydata> queryParam = {"show_security": showSecurity, "show_metadata": showMetadata, "show_plans": showPlans, "show_plan_logs": showPlanLogs, "show_plan_history": showPlanHistory, "show_plan_defaults": showPlanDefaults, "convert_legacy_plans": convertLegacyPlans, "show_system_alerts": showSystemAlerts, "show_settings": showSettings, "enrich_with_template": enrichWithTemplate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ElasticsearchResourceInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Stop maintenance mode (all instances)
    #
    # + deploymentId - Identifier for the Deployment. 
    # + resourceKind - The kind of resource (one of elasticsearch, kibana, apm, or integrations_server). 
    # + refId - User-specified RefId for the Resource. 
    # + return - The stop maintenance mode command was issued successfully. 
    remote isolated function stopDeploymentResourceInstancesAllMaintenanceMode(string deploymentId, string resourceKind, string refId) returns DeploymentResourceCommandResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/${getEncodedUri(resourceKind)}/${getEncodedUri(refId)}/instances/maintenance-mode/_stop`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeploymentResourceCommandResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Migrate Elasticsearch resource to use ILM
    #
    # + deploymentId - Identifier for the Deployment. 
    # + refId - User-specified RefId for the Resource. 
    # + validateOnly - When `true`, does not enable ILM but returns warnings if any applications may lose availability during ILM migration. 
    # + payload - Information to build the ILM policies that will be created 
    # + return - Standard response 
    remote isolated function enableDeploymentResourceIlm(string deploymentId, string refId, EnableIlmRequest payload, boolean validateOnly = false) returns DeploymentResourceCommandResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/elasticsearch/${getEncodedUri(refId)}/_enable-ilm`;
        map<anydata> queryParam = {"validate_only": validateOnly};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeploymentResourceCommandResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Extension
    #
    # + extensionId - Id of an extension 
    # + includeDeployments - Include deployments referencing this extension. Up to only 10000 deployments will be included. 
    # + return - The Extension 
    remote isolated function getExtension(string extensionId, boolean includeDeployments = false) returns Extension|error {
        string resourcePath = string `/deployments/extensions/${getEncodedUri(extensionId)}`;
        map<anydata> queryParam = {"include_deployments": includeDeployments};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Extension response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Uploads the Extension
    #
    # + extensionId - Id of an extension 
    # + return - Archive uploaded successfully. 
    remote isolated function uploadExtension(string extensionId, ExtensionsExtensionIdBody payload) returns Extension|error {
        string resourcePath = string `/deployments/extensions/${getEncodedUri(extensionId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        Extension response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Update Extension
    #
    # + extensionId - Id of an extension 
    # + payload - The extension update data. 
    # + return - Extension updated successfully. 
    remote isolated function updateExtension(string extensionId, UpdateExtensionRequest payload) returns Extension|error {
        string resourcePath = string `/deployments/extensions/${getEncodedUri(extensionId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Extension response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Extension
    #
    # + extensionId - Id of an extension 
    # + return - Extension deleted successfully. 
    remote isolated function deleteExtension(string extensionId) returns EmptyResponse|error {
        string resourcePath = string `/deployments/extensions/${getEncodedUri(extensionId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EmptyResponse response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Shutdown Deployment Stateless Resource
    #
    # + deploymentId - Identifier for the Deployment. 
    # + statelessResourceKind - The kind of stateless resource 
    # + refId - User-specified RefId for the Resource. 
    # + hide - Hide cluster on shutdown. Hidden clusters are not listed by default. Only applicable for Platform administrators. 
    # + skipSnapshot - If true, will skip taking a snapshot of the cluster before shutting the cluster down (if even possible) 
    # + return - Standard response 
    remote isolated function shutdownDeploymentStatelessResource(string deploymentId, string statelessResourceKind, string refId, boolean? hide = (), boolean skipSnapshot = false) returns DeploymentResourceCommandResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/${getEncodedUri(statelessResourceKind)}/${getEncodedUri(refId)}/_shutdown`;
        map<anydata> queryParam = {"hide": hide, "skip_snapshot": skipSnapshot};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeploymentResourceCommandResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Deployment APM Resource Info
    #
    # + deploymentId - Identifier for the Deployment 
    # + refId - User-specified RefId for the Resource 
    # + showMetadata - Whether to include the full cluster metadata in the response - can be large per cluster and also include credentials. 
    # + showPlans - Whether to include the full current and pending plan information in the response - can be large per cluster. 
    # + showPlanLogs - Whether to include with the current and pending plan information the attempt log - can be very large per cluster. 
    # + showPlanHistory - Whether to include with the current and pending plan information the plan history- can be very large per cluster. 
    # + showPlanDefaults - If showing plans, whether to show values that are left at their default value (less readable but more informative). 
    # + showSettings - Whether to show cluster settings in the response. 
    # + return - Standard response. 
    remote isolated function getDeploymentApmResourceInfo(string deploymentId, string refId, boolean showMetadata = false, boolean showPlans = true, boolean showPlanLogs = false, boolean showPlanHistory = false, boolean showPlanDefaults = false, boolean showSettings = false) returns ApmResourceInfo|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/apm/${getEncodedUri(refId)}`;
        map<anydata> queryParam = {"show_metadata": showMetadata, "show_plans": showPlans, "show_plan_logs": showPlanLogs, "show_plan_history": showPlanHistory, "show_plan_defaults": showPlanDefaults, "show_settings": showSettings};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ApmResourceInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Cancel resource pending plan
    #
    # + deploymentId - Identifier for the Deployment 
    # + resourceKind - The kind of resource 
    # + refId - User-specified RefId for the Resource 
    # + forceDelete - When `true`, deletes the pending plan instead of attempting a graceful cancellation. The default is `false`. 
    # + ignoreMissing - When `true`, returns successfully, even when plans are missing. The default is `false`. 
    # + return - Standard Deployment Resource Crud Response 
    remote isolated function cancelDeploymentResourcePendingPlan(string deploymentId, string resourceKind, string refId, boolean forceDelete = false, boolean ignoreMissing = false) returns DeploymentResourceCrudResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/${getEncodedUri(resourceKind)}/${getEncodedUri(refId)}/plan/pending`;
        map<anydata> queryParam = {"force_delete": forceDelete, "ignore_missing": ignoreMissing};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeploymentResourceCrudResponse response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get associated rulesets
    #
    # + associationType - Association type 
    # + associatedEntityId - Associated entity ID 
    # + return - Rulesets in the deployment were successfully returned 
    remote isolated function getTrafficFilterDeploymentRulesetAssociations(string associationType, string associatedEntityId) returns TrafficFilterSettings|error {
        string resourcePath = string `/deployments/traffic-filter/associations/${getEncodedUri(associationType)}/${getEncodedUri(associatedEntityId)}/rulesets`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TrafficFilterSettings response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Deployment App Search Resource Info
    #
    # + deploymentId - Identifier for the Deployment 
    # + refId - User-specified RefId for the Resource 
    # + showMetadata - Whether to include the full cluster metadata in the response - can be large per cluster and also include credentials. 
    # + showPlans - Whether to include the full current and pending plan information in the response - can be large per cluster. 
    # + showPlanLogs - Whether to include with the current and pending plan information the attempt log - can be very large per cluster. 
    # + showPlanHistory - Whether to include with the current and pending plan information the plan history- can be very large per cluster. 
    # + showPlanDefaults - If showing plans, whether to show values that are left at their default value (less readable but more informative). 
    # + showSettings - Whether to show cluster settings in the response. 
    # + return - Standard response. 
    remote isolated function getDeploymentAppsearchResourceInfo(string deploymentId, string refId, boolean showMetadata = false, boolean showPlans = true, boolean showPlanLogs = false, boolean showPlanHistory = false, boolean showPlanDefaults = false, boolean showSettings = false) returns AppSearchResourceInfo|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/appsearch/${getEncodedUri(refId)}`;
        map<anydata> queryParam = {"show_metadata": showMetadata, "show_plans": showPlans, "show_plan_logs": showPlanLogs, "show_plan_history": showPlanHistory, "show_plan_defaults": showPlanDefaults, "show_settings": showSettings};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AppSearchResourceInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get eligible remote clusters
    #
    # + 'version - The version of the Elasticsearch cluster cluster that will potentially be configured to have remote clusters. 
    # + payload - (Optional) The search query to run against all deployments containing eligible remote clusters. When not specified, all the eligible deployments are matched. 
    # + return - List of deployments which contains eligible remote clusters for a specific version 
    remote isolated function searchEligibleRemoteClusters(string 'version, SearchRequest payload) returns DeploymentsSearchResponse|error {
        string resourcePath = string `/deployments/eligible-remote-clusters`;
        map<anydata> queryParam = {"version": 'version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeploymentsSearchResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieves the ruleset by ID.
    #
    # + rulesetId - The mandatory ruleset ID. 
    # + includeAssociations - Retrieves a list of resources that are associated to the specified ruleset. 
    # + return - The container for a set of traffic filter rules. 
    remote isolated function getTrafficFilterRuleset(string rulesetId, boolean includeAssociations = false) returns TrafficFilterRulesetInfo|error {
        string resourcePath = string `/deployments/traffic-filter/rulesets/${getEncodedUri(rulesetId)}`;
        map<anydata> queryParam = {"include_associations": includeAssociations};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TrafficFilterRulesetInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Updates a ruleset
    #
    # + rulesetId - The mandatory ruleset ID. 
    # + payload - The specification for traffic filter ruleset. 
    # + return - The ruleset definition was valid and the update has started. 
    remote isolated function updateTrafficFilterRuleset(string rulesetId, TrafficFilterRulesetRequest payload) returns TrafficFilterRulesetResponse|error {
        string resourcePath = string `/deployments/traffic-filter/rulesets/${getEncodedUri(rulesetId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TrafficFilterRulesetResponse response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a ruleset
    #
    # + rulesetId - The mandatory ruleset ID. 
    # + ignoreAssociations - When true, ignores the associations and deletes the ruleset. When false, recognizes the associations, which prevents the deletion of the rule set. 
    # + return - The traffic filter ruleset was successfully deleted. 
    remote isolated function deleteTrafficFilterRuleset(string rulesetId, boolean ignoreAssociations = false) returns EmptyResponse|error {
        string resourcePath = string `/deployments/traffic-filter/rulesets/${getEncodedUri(rulesetId)}`;
        map<anydata> queryParam = {"ignore_associations": ignoreAssociations};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EmptyResponse response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List Deployments
    #
    # + return - The list of deployments that belong to the authenticated user. 
    remote isolated function listDeployments() returns DeploymentsListResponse|error {
        string resourcePath = string `/deployments`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeploymentsListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Deployment
    #
    # + requestId - An optional idempotency token - if two create requests share the same request_id token (min size 32 characters, max 128) then only one deployment will be created, the second request will return the info of that deployment (in the same format described below, but with blanks for auth-related fields) 
    # + validateOnly - If true, will just validate the Deployment definition but will not perform the creation 
    # + payload - The deployment definition 
    # + return - The request was valid (used when validate_only is true). 
    remote isolated function createDeployment(DeploymentCreateRequest payload, string? requestId = (), boolean validateOnly = false) returns DeploymentCreateResponse|error {
        string resourcePath = string `/deployments`;
        map<anydata> queryParam = {"request_id": requestId, "validate_only": validateOnly};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeploymentCreateResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Upgrade Kibana, APM, Integrations Server, AppSearch, Enterprise Search inside Deployment
    #
    # + deploymentId - Identifier for the Deployment. 
    # + statelessResourceKind - The kind of stateless resource 
    # + refId - User-specified RefId for the Resource. 
    # + validateOnly - When `true`, returns the update version without performing the upgrade 
    # + return - The upgrade command was issued successfully, use the "GET" command on the /{cluster_id} resource to monitor progress 
    remote isolated function upgradeDeploymentStatelessResource(string deploymentId, string statelessResourceKind, string refId, boolean validateOnly = false) returns DeploymentResourceUpgradeResponse|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/${getEncodedUri(statelessResourceKind)}/${getEncodedUri(refId)}/_upgrade`;
        map<anydata> queryParam = {"validate_only": validateOnly};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        DeploymentResourceUpgradeResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
