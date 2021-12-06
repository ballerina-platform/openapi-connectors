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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # All requests on the LaunchDarkly API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be `authorization`
    string authorization;
|};

# This is a generated connector for [LaunchDarkly API v2.0](https://apidocs.launchdarkly.com/) OpenAPI specification.
# LaunchDarkly is a feature management platform enables teams to deploy code at any time, even if a feature isn't ready to be released to all users.
@display {label: "LaunchDarkly", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [LaunchDarkly account](https://launchdarkly.com/request-a-demo/) and obtain tokens by following [this guide](https://apidocs.launchdarkly.com/#section/Overview/Authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://app.launchdarkly.com/api/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # You can issue a GET request to the root resource to find all of the resource categories supported by the API.
    #
    # + return - A list of links to available resources in the API. 
    remote isolated function getRoot() returns Links|error {
        string  path = string `/`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Links response = check self.clientEp-> get(path, accHeaders, targetType = Links);
        return response;
    }
    # Returns a list of relay proxy configurations in the account.
    #
    # + return - Relay proxy configs response. 
    remote isolated function getRelayProxyConfigs() returns RelayProxyConfigs|error {
        string  path = string `/account/relay-auto-configs`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        RelayProxyConfigs response = check self.clientEp-> get(path, accHeaders, targetType = RelayProxyConfigs);
        return response;
    }
    # Create a new relay proxy config.
    #
    # + payload - Create a new relay proxy configuration 
    # + return - Relay proxy config response. 
    remote isolated function postRelayAutoConfig(Body payload) returns RelayProxyConfig|error {
        string  path = string `/account/relay-auto-configs`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RelayProxyConfig response = check self.clientEp->post(path, request, headers = accHeaders, targetType=RelayProxyConfig);
        return response;
    }
    # Get a single relay proxy configuration by ID.
    #
    # + id - The relay proxy configuration ID 
    # + return - Relay proxy config response. 
    remote isolated function getRelayProxyConfig(string id) returns RelayProxyConfig|error {
        string  path = string `/account/relay-auto-configs/${id}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        RelayProxyConfig response = check self.clientEp-> get(path, accHeaders, targetType = RelayProxyConfig);
        return response;
    }
    # Delete a relay proxy configuration by ID.
    #
    # + id - The relay proxy configuration ID 
    # + return - Action completed successfully. 
    remote isolated function deleteRelayProxyConfig(string id) returns http:Response|error {
        string  path = string `/account/relay-auto-configs/${id}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Modify a relay proxy configuration by ID.
    #
    # + id - The relay proxy configuration ID 
    # + payload - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' 
    # + return - Relay proxy config response. 
    remote isolated function patchRelayProxyConfig(string id, PatchOperation[] payload) returns RelayProxyConfig|error {
        string  path = string `/account/relay-auto-configs/${id}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RelayProxyConfig response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=RelayProxyConfig);
        return response;
    }
    # Reset a relay proxy configuration's secret key with an optional expiry time for the old key.
    #
    # + id - The relay proxy configuration ID 
    # + expiry - An expiration time for the old relay proxy configuration key, expressed as a Unix epoch time in milliseconds. By default, the relay proxy configuration will expire immediately 
    # + return - Relay proxy config response. 
    remote isolated function resetRelayProxyConfig(string id, int? expiry = ()) returns RelayProxyConfig|error {
        string  path = string `/account/relay-auto-configs/${id}/reset`;
        map<anydata> queryParam = {"expiry": expiry};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        RelayProxyConfig response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = RelayProxyConfig);
        return response;
    }
    # Get a list of all audit log entries. The query parameters allow you to restrict the returned results by date ranges, resource specifiers, or a full-text search query.
    #
    # + before - A timestamp filter, expressed as a Unix epoch time in milliseconds. All entries returned will have before this timestamp. 
    # + after - A timestamp filter, expressed as a Unix epoch time in milliseconds. All entries returned will have occurred after this timestamp. 
    # + q - Text to search for. You can search for the full or partial name of the resource involved or full or partial email address of the member who made the change. 
    # + 'limit - A limit on the number of audit log entries to be returned, between 1 and 20. 
    # + spec - A resource specifier, allowing you to filter audit log listings by resource. 
    # + return - Audit log entries response. 
    remote isolated function getAuditLogEntries(int? before = (), int? after = (), string? q = (), decimal? 'limit = (), string? spec = ()) returns AuditLogEntries|error {
        string  path = string `/auditlog`;
        map<anydata> queryParam = {"before": before, "after": after, "q": q, "limit": 'limit, "spec": spec};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AuditLogEntries response = check self.clientEp-> get(path, accHeaders, targetType = AuditLogEntries);
        return response;
    }
    # Use this endpoint to fetch a single audit log entry by its resouce ID.
    #
    # + resourceId - The resource ID. 
    # + return - Audit log entry response. 
    remote isolated function getAuditLogEntry(string resourceId) returns AuditLogEntry|error {
        string  path = string `/auditlog/${resourceId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AuditLogEntry response = check self.clientEp-> get(path, accHeaders, targetType = AuditLogEntry);
        return response;
    }
    # Returns a list of all data export destinations.
    #
    # + return - Destinations response. 
    remote isolated function getDestinations() returns Destinations|error {
        string  path = string `/destinations`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Destinations response = check self.clientEp-> get(path, accHeaders, targetType = Destinations);
        return response;
    }
    # Create a new data export destination
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + payload - Create a new data export destination. 
    # + return - Destination response. 
    remote isolated function postDestination(string projectKey, string environmentKey, Body1 payload) returns Destination|error {
        string  path = string `/destinations/${projectKey}/${environmentKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Destination response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Destination);
        return response;
    }
    # Get a single data export destination by ID
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + destinationId - The data export destination ID. 
    # + return - Destination response. 
    remote isolated function getDestination(string projectKey, string environmentKey, string destinationId) returns Destination|error {
        string  path = string `/destinations/${projectKey}/${environmentKey}/${destinationId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Destination response = check self.clientEp-> get(path, accHeaders, targetType = Destination);
        return response;
    }
    # Get a single data export destination by ID
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + destinationId - The data export destination ID. 
    # + return - Action completed successfully. 
    remote isolated function deleteDestination(string projectKey, string environmentKey, string destinationId) returns http:Response|error {
        string  path = string `/destinations/${projectKey}/${environmentKey}/${destinationId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Perform a partial update to a data export destination.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + destinationId - The data export destination ID. 
    # + payload - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' Feature flag patches also support JSON Merge Patch format. 'https://tools.ietf.org/html/rfc7386' The addition of comments is also supported. 
    # + return - Destination response. 
    remote isolated function patchDestination(string projectKey, string environmentKey, string destinationId, PatchOperation[] payload) returns Destination|error {
        string  path = string `/destinations/${projectKey}/${environmentKey}/${destinationId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Destination response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=Destination);
        return response;
    }
    # Get the status for a particular feature flag across environments
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + featureFlagKey - The feature flag's key. The key identifies the flag in your code. 
    # + return - Status of the requested feature flag across environments 
    remote isolated function getFeatureFlagStatusAcrossEnvironments(string projectKey, string featureFlagKey) returns FeatureFlagStatusAcrossEnvironments|error {
        string  path = string `/flag-status/${projectKey}/${featureFlagKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FeatureFlagStatusAcrossEnvironments response = check self.clientEp-> get(path, accHeaders, targetType = FeatureFlagStatusAcrossEnvironments);
        return response;
    }
    # Get a list of statuses for all feature flags. The status includes the last time the feature flag was requested, as well as the state of the flag.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + return - List of feature flag statuses. 
    remote isolated function getFeatureFlagStatuses(string projectKey, string environmentKey) returns FeatureFlagStatuses|error {
        string  path = string `/flag-statuses/${projectKey}/${environmentKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FeatureFlagStatuses response = check self.clientEp-> get(path, accHeaders, targetType = FeatureFlagStatuses);
        return response;
    }
    # Get the status for a particular feature flag.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + featureFlagKey - The feature flag's key. The key identifies the flag in your code. 
    # + return - Status of the requested feature flag. 
    remote isolated function getFeatureFlagStatus(string projectKey, string environmentKey, string featureFlagKey) returns FeatureFlagStatus|error {
        string  path = string `/flag-statuses/${projectKey}/${environmentKey}/${featureFlagKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FeatureFlagStatus response = check self.clientEp-> get(path, accHeaders, targetType = FeatureFlagStatus);
        return response;
    }
    # Get a list of all features in the given project.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + env - By default, each feature will include configurations for each environment. You can filter environments with the env query parameter. For example, setting env=["production"] will restrict the returned configurations to just your production environment. 
    # + summary - By default in api version >= 1, flags will _not_ include their list of prerequisites, targets or rules.  Set summary=0 to include these fields for each flag returned. 
    # + archived - When set to 1, only archived flags will be included in the list of flags returned.  By default, archived flags are not included in the list of flags. 
    # + 'limit - The number of objects to return. Defaults to -1, which returns everything. 
    # + offset - Where to start in the list. This is for use with pagination. For example, an offset of 10 would skip the first 10 items and then return the next limit items. 
    # + filter - A comma-separated list of filters. Each filter is of the form field:value. 
    # + sort - A comma-separated list of fields to sort by. A field prefixed by a - will be sorted in descending order. 
    # + tag - Filter by tag. A tag can be used to group flags across projects. 
    # + return - Flags response. 
    remote isolated function getFeatureFlags(string projectKey, string[]? env = (), boolean? summary = (), boolean? archived = (), decimal? 'limit = (), decimal? offset = (), string? filter = (), string? sort = (), string? tag = ()) returns FeatureFlags|error {
        string  path = string `/flags/${projectKey}`;
        map<anydata> queryParam = {"env": env, "summary": summary, "archived": archived, "limit": 'limit, "offset": offset, "filter": filter, "sort": sort, "tag": tag};
        map<Encoding> queryParamEncoding = {"env": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FeatureFlags response = check self.clientEp-> get(path, accHeaders, targetType = FeatureFlags);
        return response;
    }
    # Creates a new feature flag.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + clone - The key of the feature flag to be cloned. The key identifies the flag in your code.  For example, setting clone=flagKey will copy the full targeting configuration for all environments (including on/off state) from the original flag to the new flag. 
    # + payload - Create a new feature flag. 
    # + return - Flag response. 
    remote isolated function postFeatureFlag(string projectKey, Body2 payload, string? clone = ()) returns FeatureFlag|error {
        string  path = string `/flags/${projectKey}`;
        map<anydata> queryParam = {"clone": clone};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FeatureFlag response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FeatureFlag);
        return response;
    }
    # Get a single feature flag by key.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + featureFlagKey - The feature flag's key. The key identifies the flag in your code. 
    # + env - By default, each feature will include configurations for each environment. You can filter environments with the env query parameter. For example, setting env=["production"] will restrict the returned configurations to just your production environment. 
    # + return - Flag response. 
    remote isolated function getFeatureFlag(string projectKey, string featureFlagKey, string[]? env = ()) returns FeatureFlag|error {
        string  path = string `/flags/${projectKey}/${featureFlagKey}`;
        map<anydata> queryParam = {"env": env};
        map<Encoding> queryParamEncoding = {"env": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FeatureFlag response = check self.clientEp-> get(path, accHeaders, targetType = FeatureFlag);
        return response;
    }
    # Delete a feature flag in all environments. Be careful-- only delete feature flags that are no longer being used by your application.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + featureFlagKey - The feature flag's key. The key identifies the flag in your code. 
    # + return - Action completed successfully. 
    remote isolated function deleteFeatureFlag(string projectKey, string featureFlagKey) returns http:Response|error {
        string  path = string `/flags/${projectKey}/${featureFlagKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Perform a partial update to a feature.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + featureFlagKey - The feature flag's key. The key identifies the flag in your code. 
    # + payload - Requires a JSON Patch representation of the desired changes to the project, and an optional comment. 'http://jsonpatch.com/' Feature flag patches also support JSON Merge Patch format. 'https://tools.ietf.org/html/rfc7386' The addition of comments is also supported. 
    # + return - Feature flag response. 
    remote isolated function patchFeatureFlag(string projectKey, string featureFlagKey, Body3 payload) returns FeatureFlag|error {
        string  path = string `/flags/${projectKey}/${featureFlagKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FeatureFlag response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=FeatureFlag);
        return response;
    }
    # Copies the feature flag configuration from one environment to the same feature flag in another environment.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + featureFlagKey - The feature flag's key. The key identifies the flag in your code. 
    # + payload - Copy feature flag configurations between environments. 
    # + return - Flag configuration copy response. 
    remote isolated function copyFeatureFlag(string projectKey, string featureFlagKey, Body4 payload) returns FeatureFlag|error {
        string  path = string `/flags/${projectKey}/${featureFlagKey}/copy`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FeatureFlag response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FeatureFlag);
        return response;
    }
    # Get expiring user targets for feature flag
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + featureFlagKey - The feature flag's key. The key identifies the flag in your code. 
    # + return - User targets of the requested feature flag. 
    remote isolated function getExpiringUserTargets(string projectKey, string environmentKey, string featureFlagKey) returns UserTargetingExpirationForFlags|error {
        string  path = string `/flags/${projectKey}/${featureFlagKey}/expiring-user-targets/${environmentKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UserTargetingExpirationForFlags response = check self.clientEp-> get(path, accHeaders, targetType = UserTargetingExpirationForFlags);
        return response;
    }
    # Update, add, or delete expiring user targets on feature flag
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + featureFlagKey - The feature flag's key. The key identifies the flag in your code. 
    # + payload - Requires a Semantic Patch representation of the desired changes to the resource. 'https://apidocs.launchdarkly.com/reference#updates-via-semantic-patches'. The addition of comments is also supported. 
    # + return - User targeting expirations on feature flag response. 
    remote isolated function patchExpiringUserTargets(string projectKey, string environmentKey, string featureFlagKey, SemanticPatchOperation[] payload) returns UserTargetingExpirationForFlags|error {
        string  path = string `/flags/${projectKey}/${featureFlagKey}/expiring-user-targets/${environmentKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserTargetingExpirationForFlags response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=UserTargetingExpirationForFlags);
        return response;
    }
    # Get a list of all configured audit log event integrations associated with this account.
    #
    # + return - Integrations response. 
    remote isolated function getIntegrations() returns Integrations|error {
        string  path = string `/integrations`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Integrations response = check self.clientEp-> get(path, accHeaders, targetType = Integrations);
        return response;
    }
    # Get a list of all configured integrations of a given kind.
    #
    # + integrationKey - The key used to specify the integration kind. 
    # + return - Integrations response. 
    remote isolated function getIntegrationSubscriptions(string integrationKey) returns Integration|error {
        string  path = string `/integrations/${integrationKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Integration response = check self.clientEp-> get(path, accHeaders, targetType = Integration);
        return response;
    }
    # Create a new integration subscription of a given kind.
    #
    # + integrationKey - The key used to specify the integration kind. 
    # + payload - Create a new integration subscription. 
    # + return - Integrations response. 
    remote isolated function postIntegrationSubscription(string integrationKey, Body5 payload) returns IntegrationSubscription|error {
        string  path = string `/integrations/${integrationKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IntegrationSubscription response = check self.clientEp->post(path, request, headers = accHeaders, targetType=IntegrationSubscription);
        return response;
    }
    # Get a single integration subscription by ID.
    #
    # + integrationKey - The key used to specify the integration kind. 
    # + integrationId - The integration ID. 
    # + return - Integrations response. 
    remote isolated function getIntegrationSubscription(string integrationKey, string integrationId) returns IntegrationSubscription|error {
        string  path = string `/integrations/${integrationKey}/${integrationId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        IntegrationSubscription response = check self.clientEp-> get(path, accHeaders, targetType = IntegrationSubscription);
        return response;
    }
    # Delete an integration subscription by ID.
    #
    # + integrationKey - The key used to specify the integration kind. 
    # + integrationId - The integration ID. 
    # + return - Action completed successfully. 
    remote isolated function deleteIntegrationSubscription(string integrationKey, string integrationId) returns http:Response|error {
        string  path = string `/integrations/${integrationKey}/${integrationId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Modify an integration subscription by ID.
    #
    # + integrationKey - The key used to specify the integration kind. 
    # + integrationId - The integration ID. 
    # + payload - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' 
    # + return - Integrations response. 
    remote isolated function patchIntegrationSubscription(string integrationKey, string integrationId, PatchOperation[] payload) returns IntegrationSubscription|error {
        string  path = string `/integrations/${integrationKey}/${integrationId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IntegrationSubscription response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=IntegrationSubscription);
        return response;
    }
    # Returns a list of all members in the account.
    #
    # + 'limit - The number of objects to return. Defaults to -1, which returns everything. 
    # + offset - Where to start in the list. This is for use with pagination. For example, an offset of 10 would skip the first 10 items and then return the next limit items. 
    # + filter - A comma-separated list of filters. Each filter is of the form field:value. 
    # + sort - A comma-separated list of fields to sort by. A field prefixed by a - will be sorted in descending order. 
    # + return - Members response. 
    remote isolated function getMembers(decimal? 'limit = (), decimal? offset = (), string? filter = (), string? sort = ()) returns Members|error {
        string  path = string `/members`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "filter": filter, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Members response = check self.clientEp-> get(path, accHeaders, targetType = Members);
        return response;
    }
    # Invite new members.
    #
    # + payload - New members to invite. 
    # + return - Members response. 
    remote isolated function postMembers(Body6[] payload) returns Members|error {
        string  path = string `/members`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Members response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Members);
        return response;
    }
    # Get the current team member associated with the token
    #
    # + return - Member response. 
    remote isolated function getMe() returns Member|error {
        string  path = string `/members/me`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Member response = check self.clientEp-> get(path, accHeaders, targetType = Member);
        return response;
    }
    # Get a single team member by ID.
    #
    # + memberId - The member ID. 
    # + return - Member response. 
    remote isolated function getMember(string memberId) returns Member|error {
        string  path = string `/members/${memberId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Member response = check self.clientEp-> get(path, accHeaders, targetType = Member);
        return response;
    }
    # Delete a team member by ID.
    #
    # + memberId - The member ID. 
    # + return - Action completed successfully. 
    remote isolated function deleteMember(string memberId) returns http:Response|error {
        string  path = string `/members/${memberId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Modify a team member by ID.
    #
    # + memberId - The member ID. 
    # + payload - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' 
    # + return - Member response. 
    remote isolated function patchMember(string memberId, PatchOperation[] payload) returns Member|error {
        string  path = string `/members/${memberId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Member response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=Member);
        return response;
    }
    # Returns a list of all projects in the account.
    #
    # + return - Projects response 
    remote isolated function getProjects() returns Projects|error {
        string  path = string `/projects`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Projects response = check self.clientEp-> get(path, accHeaders, targetType = Projects);
        return response;
    }
    # Create a new project with the given key and name.
    #
    # + payload - Project keys must be unique within an account. 
    # + return - Successful Project response. 
    remote isolated function postProject(Body7 payload) returns Project|error {
        string  path = string `/projects`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Project);
        return response;
    }
    # Fetch a single project by key.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + return - Successful Project response. 
    remote isolated function getProject(string projectKey) returns Project|error {
        string  path = string `/projects/${projectKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Project response = check self.clientEp-> get(path, accHeaders, targetType = Project);
        return response;
    }
    # Delete a project by key. Caution-- deleting a project will delete all associated environments and feature flags. You cannot delete the last project in an account.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + return - Action completed successfully. 
    remote isolated function deleteProject(string projectKey) returns http:Response|error {
        string  path = string `/projects/${projectKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Modify a project by ID.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + payload - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' 
    # + return - Successful Project response. 
    remote isolated function patchProject(string projectKey, PatchOperation[] payload) returns Project|error {
        string  path = string `/projects/${projectKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=Project);
        return response;
    }
    # Create a new environment in a specified project with a given name, key, and swatch color.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + payload - New environment. 
    # + return - Environment response. 
    remote isolated function postEnvironment(string projectKey, EnvironmentPost payload) returns Environment|error {
        string  path = string `/projects/${projectKey}/environments`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Environment response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Environment);
        return response;
    }
    # Get an environment given a project and key.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + return - Environment response. 
    remote isolated function getEnvironment(string projectKey, string environmentKey) returns Environment|error {
        string  path = string `/projects/${projectKey}/environments/${environmentKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Environment response = check self.clientEp-> get(path, accHeaders, targetType = Environment);
        return response;
    }
    # Delete an environment in a specific project.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + return - Action completed successfully. 
    remote isolated function deleteEnvironment(string projectKey, string environmentKey) returns http:Response|error {
        string  path = string `/projects/${projectKey}/environments/${environmentKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Modify an environment by ID.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + payload - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' 
    # + return - Environment response. 
    remote isolated function patchEnvironment(string projectKey, string environmentKey, PatchOperation[] payload) returns Environment|error {
        string  path = string `/projects/${projectKey}/environments/${environmentKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Environment response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=Environment);
        return response;
    }
    # Reset an environment's SDK key with an optional expiry time for the old key.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + expiry - An expiration time for the old environment SDK key, expressed as a Unix epoch time in milliseconds. By default, the key will expire immediately. 
    # + return - Environment response. 
    remote isolated function resetEnvironmentSDKKey(string projectKey, string environmentKey, int? expiry = ()) returns Environment|error {
        string  path = string `/projects/${projectKey}/environments/${environmentKey}/apiKey`;
        map<anydata> queryParam = {"expiry": expiry};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        Environment response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = Environment);
        return response;
    }
    # Reset an environment's mobile key. The optional expiry for the old key is deprecated for this endpoint, so the old key will always expire immediately.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + expiry - The expiry parameter is deprecated for this endpoint, so the old mobile key will always expire immediately. This parameter will be removed in an upcoming major API client version. 
    # + return - Environment response. 
    remote isolated function resetEnvironmentMobileKey(string projectKey, string environmentKey, int? expiry = ()) returns Environment|error {
        string  path = string `/projects/${projectKey}/environments/${environmentKey}/mobileKey`;
        map<anydata> queryParam = {"expiry": expiry};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        Environment response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = Environment);
        return response;
    }
    # Get all approval requests for a feature flag
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + featureFlagKey - The feature flag's key. The key identifies the flag in your code. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + return - Feature flag approval requests response 
    remote isolated function getFeatureFlagApprovalRequests(string projectKey, string featureFlagKey, string environmentKey) returns FeatureFlagApprovalRequests|error {
        string  path = string `/projects/${projectKey}/flags/${featureFlagKey}/environments/${environmentKey}/approval-requests`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FeatureFlagApprovalRequests response = check self.clientEp-> get(path, accHeaders, targetType = FeatureFlagApprovalRequests);
        return response;
    }
    # Get a single approval request for a feature flag
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + featureFlagKey - The feature flag's key. The key identifies the flag in your code. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + featureFlagApprovalRequestId - The feature flag approval request ID 
    # + return - Feature flag approval request response 
    remote isolated function getFeatureFlagApprovalRequest(string projectKey, string featureFlagKey, string environmentKey, string featureFlagApprovalRequestId) returns FeatureFlagApprovalRequests|error {
        string  path = string `/projects/${projectKey}/flags/${featureFlagKey}/environments/${environmentKey}/approval-requests/${featureFlagApprovalRequestId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FeatureFlagApprovalRequests response = check self.clientEp-> get(path, accHeaders, targetType = FeatureFlagApprovalRequests);
        return response;
    }
    # Create an approval request for a feature flag
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + featureFlagKey - The feature flag's key. The key identifies the flag in your code. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + featureFlagApprovalRequestId - The feature flag approval request ID 
    # + payload - Create a new feature flag approval request 
    # + return - Feature flag approval request response 
    remote isolated function postFeatureFlagApprovalRequest(string projectKey, string featureFlagKey, string environmentKey, string featureFlagApprovalRequestId, PostFeatureFlagApprovalRequestRequest payload) returns FeatureFlagApprovalRequest|error {
        string  path = string `/projects/${projectKey}/flags/${featureFlagKey}/environments/${environmentKey}/approval-requests/${featureFlagApprovalRequestId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FeatureFlagApprovalRequest response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FeatureFlagApprovalRequest);
        return response;
    }
    # Delete an approval request for a feature flag
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + featureFlagKey - The feature flag's key. The key identifies the flag in your code. 
    # + featureFlagApprovalRequestId - The feature flag approval request ID 
    # + payload - Create a new feature flag approval request 
    # + return - Action completed successfully. 
    remote isolated function deleteFeatureFlagApprovalRequest(string projectKey, string environmentKey, string featureFlagKey, string featureFlagApprovalRequestId, DeleteFeatureFlagApprovalRequestRequest payload) returns http:Response|error {
        string  path = string `/projects/${projectKey}/flags/${featureFlagKey}/environments/${environmentKey}/approval-requests/${featureFlagApprovalRequestId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->delete(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Apply approval request for a feature flag
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + featureFlagKey - The feature flag's key. The key identifies the flag in your code. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + featureFlagApprovalRequestId - The feature flag approval request ID 
    # + payload - Apply a new feature flag approval request 
    # + return - Feature flag approval request applied response 
    remote isolated function postApplyFeatureFlagApprovalRequest(string projectKey, string featureFlagKey, string environmentKey, string featureFlagApprovalRequestId, Body8 payload) returns FeatureFlagApprovalRequests|error {
        string  path = string `/projects/${projectKey}/flags/${featureFlagKey}/environments/${environmentKey}/approval-requests/${featureFlagApprovalRequestId}/apply`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FeatureFlagApprovalRequests response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FeatureFlagApprovalRequests);
        return response;
    }
    # Review approval request for a feature flag
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + featureFlagKey - The feature flag's key. The key identifies the flag in your code. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + featureFlagApprovalRequestId - The feature flag approval request ID 
    # + payload - Review a feature flag approval request 
    # + return - Feature flag approval request reviewed response 
    remote isolated function postReviewFeatureFlagApprovalRequest(string projectKey, string featureFlagKey, string environmentKey, string featureFlagApprovalRequestId, Body9 payload) returns FeatureFlagApprovalRequests|error {
        string  path = string `/projects/${projectKey}/flags/${featureFlagKey}/environments/${environmentKey}/approval-requests/${featureFlagApprovalRequestId}/review`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FeatureFlagApprovalRequests response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FeatureFlagApprovalRequests);
        return response;
    }
    # Return a complete list of custom roles.
    #
    # + return - Custom roles response. 
    remote isolated function getCustomRoles() returns CustomRoles|error {
        string  path = string `/roles`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CustomRoles response = check self.clientEp-> get(path, accHeaders, targetType = CustomRoles);
        return response;
    }
    # Create a new custom role.
    #
    # + payload - New role or roles to create. 
    # + return - Custom role response. 
    remote isolated function postCustomRole(Body10 payload) returns CustomRole|error {
        string  path = string `/roles`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CustomRole response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CustomRole);
        return response;
    }
    # Get one custom role by key.
    #
    # + customRoleKey - The custom role key. 
    # + return - Custom role response. 
    remote isolated function getCustomRole(string customRoleKey) returns CustomRole|error {
        string  path = string `/roles/${customRoleKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CustomRole response = check self.clientEp-> get(path, accHeaders, targetType = CustomRole);
        return response;
    }
    # Delete a custom role by key.
    #
    # + customRoleKey - The custom role key. 
    # + return - Action completed successfully. 
    remote isolated function deleteCustomRole(string customRoleKey) returns http:Response|error {
        string  path = string `/roles/${customRoleKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Modify a custom role by key.
    #
    # + customRoleKey - The custom role key. 
    # + payload - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' 
    # + return - Custom role response. 
    remote isolated function patchCustomRole(string customRoleKey, PatchOperation[] payload) returns CustomRole|error {
        string  path = string `/roles/${customRoleKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CustomRole response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=CustomRole);
        return response;
    }
    # Get a list of all user segments in the given project.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + tag - Filter by tag. A tag can be used to group flags across projects. 
    # + return - Segments response. 
    remote isolated function getUserSegments(string projectKey, string environmentKey, string? tag = ()) returns UserSegments|error {
        string  path = string `/segments/${projectKey}/${environmentKey}`;
        map<anydata> queryParam = {"tag": tag};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UserSegments response = check self.clientEp-> get(path, accHeaders, targetType = UserSegments);
        return response;
    }
    # Creates a new user segment.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + payload - Create a new user segment. 
    # + return - User segment response. 
    remote isolated function postUserSegment(string projectKey, string environmentKey, Body11 payload) returns UserSegment|error {
        string  path = string `/segments/${projectKey}/${environmentKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserSegment response = check self.clientEp->post(path, request, headers = accHeaders, targetType=UserSegment);
        return response;
    }
    # Get a single user segment by key.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + userSegmentKey - The user segment's key. The key identifies the user segment in your code. 
    # + return - User segment response. 
    remote isolated function getUserSegment(string projectKey, string environmentKey, string userSegmentKey) returns UserSegment|error {
        string  path = string `/segments/${projectKey}/${environmentKey}/${userSegmentKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UserSegment response = check self.clientEp-> get(path, accHeaders, targetType = UserSegment);
        return response;
    }
    # Delete a user segment.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + userSegmentKey - The user segment's key. The key identifies the user segment in your code. 
    # + return - Action completed successfully. 
    remote isolated function deleteUserSegment(string projectKey, string environmentKey, string userSegmentKey) returns http:Response|error {
        string  path = string `/segments/${projectKey}/${environmentKey}/${userSegmentKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Perform a partial update to a user segment.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + userSegmentKey - The user segment's key. The key identifies the user segment in your code. 
    # + payload - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' Feature flag patches also support JSON Merge Patch format. 'https://tools.ietf.org/html/rfc7386' The addition of comments is also supported. 
    # + return - User segment response. 
    remote isolated function patchUserSegment(string projectKey, string environmentKey, string userSegmentKey, PatchOperation[] payload) returns UserSegment|error {
        string  path = string `/segments/${projectKey}/${environmentKey}/${userSegmentKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserSegment response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=UserSegment);
        return response;
    }
    # Update targets included or excluded in an unbounded segment
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + userSegmentKey - The user segment's key. The key identifies the user segment in your code. 
    # + payload - Add or remove user targets to the included or excluded lists on an unbounded segment 
    # + return - Action completed successfully. 
    remote isolated function updatedUnboundedSegmentTargets(string projectKey, string environmentKey, string userSegmentKey, Body12 payload) returns http:Response|error {
        string  path = string `/segments/${projectKey}/${environmentKey}/${userSegmentKey}/unbounded-users`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Get expiring user targets for user segment
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + userSegmentKey - The user segment's key. The key identifies the user segment in your code. 
    # + return - User targeting expirations on user segment response. 
    remote isolated function getExpiringUserTargetsOnSegment(string projectKey, string environmentKey, string userSegmentKey) returns UserTargetingExpirationForSegment|error {
        string  path = string `/segments/${projectKey}/${userSegmentKey}/expiring-user-targets/${environmentKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UserTargetingExpirationForSegment response = check self.clientEp-> get(path, accHeaders, targetType = UserTargetingExpirationForSegment);
        return response;
    }
    # Update, add, or delete expiring user targets on user segment
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + userSegmentKey - The user segment's key. The key identifies the user segment in your code. 
    # + payload - Requires a Semantic Patch representation of the desired changes to the resource. 'https://apidocs.launchdarkly.com/reference#updates-via-semantic-patches'. The addition of comments is also supported. 
    # + return - User targeting expirations on user segment response. 
    remote isolated function patchExpiringUserTargetsOnSegment(string projectKey, string environmentKey, string userSegmentKey, SemanticPatchOperation[] payload) returns UserTargetingExpirationForSegment|error {
        string  path = string `/segments/${projectKey}/${userSegmentKey}/expiring-user-targets/${environmentKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserTargetingExpirationForSegment response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=UserTargetingExpirationForSegment);
        return response;
    }
    # Returns a list of tokens in the account.
    #
    # + showAll - If set to true, and the authentication access token has the "Admin" role, personal access tokens for all members will be retrieved. 
    # + return - Tokens response. 
    remote isolated function getTokens(boolean? showAll = ()) returns Tokens|error {
        string  path = string `/tokens`;
        map<anydata> queryParam = {"showAll": showAll};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Tokens response = check self.clientEp-> get(path, accHeaders, targetType = Tokens);
        return response;
    }
    # Create a new token.
    #
    # + payload - Create a new access token. 
    # + return - Token response. 
    remote isolated function postToken(Body13 payload) returns Token|error {
        string  path = string `/tokens`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Token response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Token);
        return response;
    }
    # Get a single access token by ID.
    #
    # + tokenId - The access token ID. 
    # + return - Token response. 
    remote isolated function getToken(string tokenId) returns Token|error {
        string  path = string `/tokens/${tokenId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Token response = check self.clientEp-> get(path, accHeaders, targetType = Token);
        return response;
    }
    # Delete an access token by ID.
    #
    # + tokenId - The access token ID. 
    # + return - Action completed successfully. 
    remote isolated function deleteToken(string tokenId) returns http:Response|error {
        string  path = string `/tokens/${tokenId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Modify an access token by ID.
    #
    # + tokenId - The access token ID. 
    # + payload - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' 
    # + return - Token response. 
    remote isolated function patchToken(string tokenId, PatchOperation[] payload) returns Token|error {
        string  path = string `/tokens/${tokenId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Token response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=Token);
        return response;
    }
    # Reset an access token's secret key with an optional expiry time for the old key.
    #
    # + tokenId - The access token ID. 
    # + expiry - An expiration time for the old token key, expressed as a Unix epoch time in milliseconds. By default, the token will expire immediately. 
    # + return - Token response. 
    remote isolated function resetToken(string tokenId, int? expiry = ()) returns Token|error {
        string  path = string `/tokens/${tokenId}/reset`;
        map<anydata> queryParam = {"expiry": expiry};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        Token response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = Token);
        return response;
    }
    # Returns of the usage endpoints available.
    #
    # + return - Usage endpoints 
    remote isolated function getUsage() returns Usage|error {
        string  path = string `/usage`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Usage response = check self.clientEp-> get(path, accHeaders, targetType = Usage);
        return response;
    }
    # Get events usage by event id and the feature flag key.
    #
    # + envId - The environment id for the flag evaluations in question. 
    # + flagKey - The key of the flag we want metrics for. 
    # + return - Returns timeseries data and all sdk versions. 
    remote isolated function getEvaluations(string envId, string flagKey) returns StreamSDKVersion|error {
        string  path = string `/usage/evaluations/${envId}/${flagKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StreamSDKVersion response = check self.clientEp-> get(path, accHeaders, targetType = StreamSDKVersion);
        return response;
    }
    # Get events usage endpoints.
    #
    # + return - Returns timeseries data and all sdk versions. 
    remote isolated function getEvents() returns Events|error {
        string  path = string `/usage/events`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Events response = check self.clientEp-> get(path, accHeaders, targetType = Events);
        return response;
    }
    # Get events usage by event type.
    #
    # + 'type - The type of event we would like to track. 
    # + return - Returns timeseries data and all sdk versions. 
    remote isolated function getEvent(string 'type) returns StreamSDKVersion|error {
        string  path = string `/usage/events/${'type}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StreamSDKVersion response = check self.clientEp-> get(path, accHeaders, targetType = StreamSDKVersion);
        return response;
    }
    # Get monthly active user data.
    #
    # + return - Returns timeseries data and all sdk versions. 
    remote isolated function getMAU() returns MAU|error {
        string  path = string `/usage/mau`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MAU response = check self.clientEp-> get(path, accHeaders, targetType = MAU);
        return response;
    }
    # Get monthly active user data by category.
    #
    # + return - Returns timeseries data and all sdk versions. 
    remote isolated function getMAUByCategory() returns MAUbyCategory|error {
        string  path = string `/usage/mau/bycategory`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MAUbyCategory response = check self.clientEp-> get(path, accHeaders, targetType = MAUbyCategory);
        return response;
    }
    # Returns a list of all streams.
    #
    # + return - Stream usage endpoints 
    remote isolated function getStreams() returns Streams|error {
        string  path = string `/usage/streams`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Streams response = check self.clientEp-> get(path, accHeaders, targetType = Streams);
        return response;
    }
    # Get a stream endpoint and return timeseries data.
    #
    # + 'source - The source of where the stream comes from. 
    # + return - Responds with time series data on stream usage. 
    remote isolated function getStream(string 'source) returns Stream|error {
        string  path = string `/usage/streams/${'source}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Stream response = check self.clientEp-> get(path, accHeaders, targetType = Stream);
        return response;
    }
    # Get a stream timeseries data by source show sdk version metadata.
    #
    # + 'source - The source of where the stream comes from. 
    # + return - Returns timeseries data and metadata on sdk version. 
    remote isolated function getStreamBySDK(string 'source) returns StreamBySDK|error {
        string  path = string `/usage/streams/${'source}/bysdkversion`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StreamBySDK response = check self.clientEp-> get(path, accHeaders, targetType = StreamBySDK);
        return response;
    }
    # Get a stream timeseries data by source and show all sdk version associated.
    #
    # + 'source - The source of where the stream comes from. 
    # + return - Returns timeseries data and all sdk versions. 
    remote isolated function getStreamSDKVersion(string 'source) returns StreamSDKVersion|error {
        string  path = string `/usage/streams/${'source}/sdkversions`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StreamSDKVersion response = check self.clientEp-> get(path, accHeaders, targetType = StreamSDKVersion);
        return response;
    }
    # Search users in LaunchDarkly based on their last active date, or a search query. It should not be used to enumerate all users in LaunchDarkly-- use the List users API resource.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + q - Search query. 
    # + 'limit - Pagination limit. 
    # + offset - Specifies the first item to return in the collection. 
    # + after - A timestamp filter, expressed as a Unix epoch time in milliseconds. All entries returned will have occurred after this timestamp. 
    # + return - Users response. 
    remote isolated function getSearchUsers(string projectKey, string environmentKey, string? q = (), int? 'limit = (), int? offset = (), int? after = ()) returns Users|error {
        string  path = string `/user-search/${projectKey}/${environmentKey}`;
        map<anydata> queryParam = {"q": q, "limit": 'limit, "offset": offset, "after": after};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Users response = check self.clientEp-> get(path, accHeaders, targetType = Users);
        return response;
    }
    # List all users in the environment. Includes the total count of users. In each page, there will be up to 'limit' users returned (default 20). This is useful for exporting all users in the system for further analysis. Paginated collections will include a next link containing a URL with the next set of elements in the collection.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + 'limit - Pagination limit. 
    # + h - This parameter is required when following "next" links. 
    # + scrollId - This parameter is required when following "next" links. 
    # + return - Users response. 
    remote isolated function getUsers(string projectKey, string environmentKey, int? 'limit = (), string? h = (), string? scrollId = ()) returns Users|error {
        string  path = string `/users/${projectKey}/${environmentKey}`;
        map<anydata> queryParam = {"limit": 'limit, "h": h, "scrollId": scrollId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Users response = check self.clientEp-> get(path, accHeaders, targetType = Users);
        return response;
    }
    # Get a user by key.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + userKey - The user's key. 
    # + return - User response. 
    remote isolated function getUser(string projectKey, string environmentKey, string userKey) returns User|error {
        string  path = string `/users/${projectKey}/${environmentKey}/${userKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        User response = check self.clientEp-> get(path, accHeaders, targetType = User);
        return response;
    }
    # Delete a user by ID.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + userKey - The user's key. 
    # + return - Action completed successfully. 
    remote isolated function deleteUser(string projectKey, string environmentKey, string userKey) returns http:Response|error {
        string  path = string `/users/${projectKey}/${environmentKey}/${userKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Fetch a single flag setting for a user by key.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + userKey - The user's key. 
    # + return - User flags settings response. 
    remote isolated function getUserFlagSettings(string projectKey, string environmentKey, string userKey) returns UserFlagSettings|error {
        string  path = string `/users/${projectKey}/${environmentKey}/${userKey}/flags`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UserFlagSettings response = check self.clientEp-> get(path, accHeaders, targetType = UserFlagSettings);
        return response;
    }
    # Fetch a single flag setting for a user by key.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + userKey - The user's key. 
    # + featureFlagKey - The feature flag's key. The key identifies the flag in your code. 
    # + return - User flag setting response. 
    remote isolated function getUserFlagSetting(string projectKey, string environmentKey, string userKey, string featureFlagKey) returns UserFlagSetting|error {
        string  path = string `/users/${projectKey}/${environmentKey}/${userKey}/flags/${featureFlagKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UserFlagSetting response = check self.clientEp-> get(path, accHeaders, targetType = UserFlagSetting);
        return response;
    }
    # Specifically enable or disable a feature flag for a user based on their key.
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + userKey - The user's key. 
    # + featureFlagKey - The feature flag's key. The key identifies the flag in your code. 
    # + payload - A request payload to update feature flag for a user based on their key 
    # + return - Action completed successfully. 
    remote isolated function putFlagSetting(string projectKey, string environmentKey, string userKey, string featureFlagKey, Body14 payload) returns http:Response|error {
        string  path = string `/users/${projectKey}/${environmentKey}/${userKey}/flags/${featureFlagKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Get expiring dates on flags for user
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + userKey - The user's key. 
    # + return - User targets of the requested feature flag. 
    remote isolated function getExpiringUserTargetsForUser(string projectKey, string environmentKey, string userKey) returns UserTargetingExpirationOnFlagsForUser|error {
        string  path = string `/users/${projectKey}/${userKey}/expiring-user-targets/${environmentKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UserTargetingExpirationOnFlagsForUser response = check self.clientEp-> get(path, accHeaders, targetType = UserTargetingExpirationOnFlagsForUser);
        return response;
    }
    # Update, add, or delete expiring user targets for a single user on all flags
    #
    # + projectKey - The project key, used to tie the flags together under one project so they can be managed together. 
    # + environmentKey - The environment key, used to tie together flag configuration and users under one environment so they can be managed together. 
    # + userKey - The user's key. 
    # + payload - Requires a Semantic Patch representation of the desired changes to the resource. 'https://apidocs.launchdarkly.com/reference#updates-via-semantic-patches'. The addition of comments is also supported. 
    # + return - User Targeting expiration for single user on all flags response. 
    remote isolated function patchExpiringUserTargetsForFlags(string projectKey, string environmentKey, string userKey, SemanticPatchOperation[] payload) returns UserTargetingExpirationOnFlagsForUser|error {
        string  path = string `/users/${projectKey}/${userKey}/expiring-user-targets/${environmentKey}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserTargetingExpirationOnFlagsForUser response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=UserTargetingExpirationOnFlagsForUser);
        return response;
    }
    # Fetch a list of all webhooks.
    #
    # + return - Webhooks response. 
    remote isolated function getWebhooks() returns Webhooks|error {
        string  path = string `/webhooks`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Webhooks response = check self.clientEp-> get(path, accHeaders, targetType = Webhooks);
        return response;
    }
    # Create a webhook.
    #
    # + payload - New webhook. 
    # + return - Webhook response. 
    remote isolated function postWebhook(Body15 payload) returns Webhook|error {
        string  path = string `/webhooks`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Webhook response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Webhook);
        return response;
    }
    # Get a webhook by ID.
    #
    # + resourceId - The resource ID. 
    # + return - Webhook response. 
    remote isolated function getWebhook(string resourceId) returns Webhook|error {
        string  path = string `/webhooks/${resourceId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Webhook response = check self.clientEp-> get(path, accHeaders, targetType = Webhook);
        return response;
    }
    # Delete a webhook by ID.
    #
    # + resourceId - The resource ID. 
    # + return - Action completed successfully. 
    remote isolated function deleteWebhook(string resourceId) returns http:Response|error {
        string  path = string `/webhooks/${resourceId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Modify a webhook by ID.
    #
    # + resourceId - The resource ID. 
    # + payload - Requires a JSON Patch representation of the desired changes to the project. 'http://jsonpatch.com/' 
    # + return - Webhook response. 
    remote isolated function patchWebhook(string resourceId, PatchOperation[] payload) returns Webhook|error {
        string  path = string `/webhooks/${resourceId}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Webhook response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=Webhook);
        return response;
    }
}
