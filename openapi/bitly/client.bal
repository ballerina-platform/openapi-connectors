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

# This is a generated connector for [Bitly API v4.0.0](https://dev.bitly.com/api-reference) OpenAPI specification.
# Bitly is the most widely trusted link management platform in the world. 
# By using the Bitly API, you will exercise the full power of your links through automated link customization, mobile deep linking, and click analytics.
@display {label: "Bitly", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Bitly account](https://dev.bitly.com/) and obtain tokens by following [this guide](https://dev.bitly.com/docs/getting-started/introduction).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api-ssl.bitly.com/v4") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get Click Metrics for a Group by Referring Networks
    #
    # + groupGuid - A GUID for a Bitly group 
    # + return - SUCCESS 
    remote isolated function getGroupMetricsByReferringNetworks(string groupGuid) returns ClickMetrics|error {
        string resourcePath = string `/groups/${getEncodedUri(groupGuid)}/referring_networks`;
        ClickMetrics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Metrics for a Bitlink by Country
    #
    # + bitlink - A Bitlink made of the domain and hash 
    # + unit - A unit of time 
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time. 
    # + size - The quantity of items to be be returned 
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. 
    # + return - SUCCESS 
    remote isolated function getMetricsForBitlinkByCountries(string bitlink, TimeUnit unit, int units, int size = 50, string? unitReference = ()) returns ClickMetrics|error {
        string resourcePath = string `/bitlinks/${getEncodedUri(bitlink)}/countries`;
        map<anydata> queryParam = {"unit": unit, "units": units, "size": size, "unit_reference": unitReference};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ClickMetrics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve Tags by Group
    #
    # + groupGuid - A GUID for a Bitly group 
    # + return - SUCCESS 
    remote isolated function getGroupTags(string groupGuid) returns Tags|error {
        string resourcePath = string `/groups/${getEncodedUri(groupGuid)}/tags`;
        Tags response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get clicks by group
    #
    # + groupGuid - A GUID for a Bitly group 
    # + unit - A unit of time 
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time. 
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. 
    # + return - SUCCESS 
    remote isolated function getGroupClicks(string groupGuid, TimeUnit unit, int units, string? unitReference = ()) returns GroupClicks|error {
        string resourcePath = string `/groups/${getEncodedUri(groupGuid)}/clicks`;
        map<anydata> queryParam = {"unit": unit, "units": units, "unit_reference": unitReference};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GroupClicks response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve Webhook
    #
    # + webhookGuid - A GUID for a Bitly webhook 
    # + return - SUCCESS 
    remote isolated function getWebhook(string webhookGuid) returns Webhook|error {
        string resourcePath = string `/webhooks/${getEncodedUri(webhookGuid)}`;
        Webhook response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete Webhook
    #
    # + webhookGuid - A GUID for a Bitly webhook 
    # + return - SUCCESS 
    remote isolated function deleteWebhook(string webhookGuid) returns http:Response|error {
        string resourcePath = string `/webhooks/${getEncodedUri(webhookGuid)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update Webhook
    #
    # + webhookGuid - A GUID for a Bitly webhook 
    # + return - SUCCESS 
    remote isolated function updateWebhook(string webhookGuid, WebhookUpdate payload) returns Webhook|error {
        string resourcePath = string `/webhooks/${getEncodedUri(webhookGuid)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Webhook response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get Shorten Counts for an Organization
    #
    # + organizationGuid - A GUID for a Bitly organization 
    # + unit - A unit of time 
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time. 
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. 
    # + return - SUCCESS 
    remote isolated function getOrganizationShortenCounts(string organizationGuid, TimeUnit unit, int units, string? unitReference = ()) returns Metrics|error {
        string resourcePath = string `/organizations/${getEncodedUri(organizationGuid)}/shorten_counts`;
        map<anydata> queryParam = {"unit": unit, "units": units, "unit_reference": unitReference};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Metrics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Expand a Bitlink
    #
    # + return - SUCCESS 
    remote isolated function expandBitlink(ExpandBitlink payload) returns ExpandedBitlink|error {
        string resourcePath = string `/expand`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ExpandedBitlink response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve an Organization
    #
    # + organizationGuid - A GUID for a Bitly organization 
    # + return - SUCCESS 
    remote isolated function getOrganization(string organizationGuid) returns Organization|error {
        string resourcePath = string `/organizations/${getEncodedUri(organizationGuid)}`;
        Organization response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Click Metrics for a Group by Device Type
    #
    # + groupGuid - A GUID for a Bitly group 
    # + unit - A unit of time 
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time. 
    # + size - The quantity of items to be be returned 
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. 
    # + return - SUCCESS 
    remote isolated function getGroupMetricsByDevices(string groupGuid, TimeUnit unit, int units, int size = 50, string? unitReference = ()) returns DeviceMetrics|error {
        string resourcePath = string `/groups/${getEncodedUri(groupGuid)}/devices`;
        map<anydata> queryParam = {"unit": unit, "units": units, "size": size, "unit_reference": unitReference};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DeviceMetrics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Click Metrics for a Group by Country
    #
    # + groupGuid - A GUID for a Bitly group 
    # + unit - A unit of time 
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time. 
    # + size - The quantity of items to be be returned 
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. 
    # + return - SUCCESS 
    remote isolated function getGroupMetricsByCountries(string groupGuid, TimeUnit unit, int units, int size = 50, string? unitReference = ()) returns ClickMetrics|error {
        string resourcePath = string `/groups/${getEncodedUri(groupGuid)}/countries`;
        map<anydata> queryParam = {"unit": unit, "units": units, "size": size, "unit_reference": unitReference};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ClickMetrics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a Clicks Summary for a Bitlink
    #
    # + bitlink - A Bitlink made of the domain and hash 
    # + unit - A unit of time 
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time. 
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. 
    # + return - SUCCESS 
    remote isolated function getClicksSummaryForBitlink(string bitlink, TimeUnit unit, int units, string? unitReference = ()) returns ClicksSummary|error {
        string resourcePath = string `/bitlinks/${getEncodedUri(bitlink)}/clicks/summary`;
        map<anydata> queryParam = {"unit": unit, "units": units, "unit_reference": unitReference};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ClicksSummary response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Metrics for a Custom Bitlink by Destination
    #
    # + customBitlink - A Custom Bitlink made of the domain and keyword 
    # + unit - A unit of time 
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time. 
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. 
    # + return - SUCCESS 
    remote isolated function getCustomBitlinkMetricsByDestination(string customBitlink, TimeUnit unit, int units, string? unitReference = ()) returns ClickMetrics|error {
        string resourcePath = string `/custom_bitlinks/${getEncodedUri(customBitlink)}/clicks_by_destination`;
        map<anydata> queryParam = {"unit": unit, "units": units, "unit_reference": unitReference};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ClickMetrics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a Bitlink
    #
    # + bitlink - A Bitlink made of the domain and hash 
    # + return - SUCCESS 
    remote isolated function getBitlink(string bitlink) returns BitlinkBody|error {
        string resourcePath = string `/bitlinks/${getEncodedUri(bitlink)}`;
        BitlinkBody response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a Bitlink
    #
    # + bitlink - A Bitlink made of the domain and hash 
    # + return - SUCCESS 
    remote isolated function updateBitlink(string bitlink, BitlinkBody payload) returns BitlinkBody|error {
        string resourcePath = string `/bitlinks/${getEncodedUri(bitlink)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BitlinkBody response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Retrieve a Campaign
    #
    # + campaignGuid - A GUID for a Bitly campaign 
    # + return - SUCCESS 
    remote isolated function getCampaign(string campaignGuid) returns Campaign|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignGuid)}`;
        Campaign response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Campaign
    #
    # + campaignGuid - A GUID for a Bitly campaign 
    # + return - SUCCESS 
    remote isolated function updateCampaign(string campaignGuid, CampaignModify payload) returns Campaign|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignGuid)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Campaign response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get Clicks for a Custom Bitlink's Entire History
    #
    # + customBitlink - A Custom Bitlink made of the domain and keyword 
    # + unit - A unit of time 
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time. 
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. 
    # + return - SUCCESS 
    remote isolated function getClicksForCustomBitlink(string customBitlink, TimeUnit unit, int units, string? unitReference = ()) returns Clicks|error {
        string resourcePath = string `/custom_bitlinks/${getEncodedUri(customBitlink)}/clicks`;
        map<anydata> queryParam = {"unit": unit, "units": units, "unit_reference": unitReference};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Clicks response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Metrics for a Bitlink by Referring Domains
    #
    # + bitlink - A Bitlink made of the domain and hash 
    # + unit - A unit of time 
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time. 
    # + size - The quantity of items to be be returned 
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. 
    # + return - SUCCESS 
    remote isolated function getMetricsForBitlinkByReferringDomains(string bitlink, TimeUnit unit, int units, int size = 50, string? unitReference = ()) returns ClickMetrics|error {
        string resourcePath = string `/bitlinks/${getEncodedUri(bitlink)}/referring_domains`;
        map<anydata> queryParam = {"unit": unit, "units": units, "size": size, "unit_reference": unitReference};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ClickMetrics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a Group
    #
    # + groupGuid - A GUID for a Bitly group 
    # + return - SUCCESS 
    remote isolated function getGroup(string groupGuid) returns Group|error {
        string resourcePath = string `/groups/${getEncodedUri(groupGuid)}`;
        Group response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a Group
    #
    # + groupGuid - A GUID for a Bitly group 
    # + return - SUCCESS 
    remote isolated function updateGroup(string groupGuid, GroupUpdate payload) returns Group|error {
        string resourcePath = string `/groups/${getEncodedUri(groupGuid)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Group response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get a QR Code
    #
    # + bitlink - A Bitlink made of the domain and hash 
    # + color - A color denoted in hexidecimal RGB format 
    # + excludeBitlyLogo - Removes the Bitly logo from the center of the generated QR image 
    # + imageFormat - Determines the image format of the returned QR code 
    # + return - SUCCESS 
    remote isolated function getBitlinkQRCode(string bitlink, string? color = (), boolean? excludeBitlyLogo = (), string imageFormat = "png") returns BitlinkQR|error {
        string resourcePath = string `/bitlinks/${getEncodedUri(bitlink)}/qr`;
        map<anydata> queryParam = {"color": color, "exclude_bitly_logo": excludeBitlyLogo, "image_format": imageFormat};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BitlinkQR response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Metrics for a Bitlink by City
    #
    # + bitlink - A Bitlink made of the domain and hash 
    # + unit - A unit of time 
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time. 
    # + size - The quantity of items to be be returned 
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. 
    # + return - SUCCESS 
    remote isolated function getMetricsForBitlinkByCities(string bitlink, TimeUnit unit, int units, int size = 50, string? unitReference = ()) returns CityMetrics|error {
        string resourcePath = string `/bitlinks/${getEncodedUri(bitlink)}/cities`;
        map<anydata> queryParam = {"unit": unit, "units": units, "size": size, "unit_reference": unitReference};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CityMetrics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Click Metrics for a Group by City
    #
    # + groupGuid - A GUID for a Bitly group 
    # + unit - A unit of time 
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time. 
    # + size - The quantity of items to be be returned 
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. 
    # + return - SUCCESS 
    remote isolated function getGroupMetricsByCities(string groupGuid, TimeUnit unit, int units, int size = 50, string? unitReference = ()) returns CityMetrics|error {
        string resourcePath = string `/groups/${getEncodedUri(groupGuid)}/cities`;
        map<anydata> queryParam = {"unit": unit, "units": units, "size": size, "unit_reference": unitReference};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CityMetrics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Metrics for a Bitlink by Device Type
    #
    # + bitlink - A Bitlink made of the domain and hash 
    # + unit - A unit of time 
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time. 
    # + size - The quantity of items to be be returned 
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. 
    # + return - SUCCESS 
    remote isolated function getMetricsForBitlinkByDevices(string bitlink, TimeUnit unit, int units, int size = 50, string? unitReference = ()) returns DeviceMetrics|error {
        string resourcePath = string `/bitlinks/${getEncodedUri(bitlink)}/devices`;
        map<anydata> queryParam = {"unit": unit, "units": units, "size": size, "unit_reference": unitReference};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DeviceMetrics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create Webhook
    #
    # + return - CREATED 
    remote isolated function createWebhook(WebhookCreate payload) returns Webhook|error {
        string resourcePath = string `/webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Webhook response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Plan Limits
    #
    # + organizationGuid - A GUID for a Bitly organization 
    # + return - SUCCESS 
    remote isolated function getPlanLimits(string organizationGuid) returns PlanLimits|error {
        string resourcePath = string `/organizations/${getEncodedUri(organizationGuid)}/plan_limits`;
        PlanLimits response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve OAuth App
    #
    # + clientId - The client ID of an OAuth app 
    # + return - SUCCESS 
    remote isolated function getOAuthApp(string clientId) returns OAuthApp|error {
        string resourcePath = string `/apps/${getEncodedUri(clientId)}`;
        OAuthApp response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve Channels
    #
    # + groupGuid - A GUID for a Bitly group 
    # + campaignGuid - A GUID for a Bitly campaign 
    # + return - SUCCESS 
    remote isolated function getChannels(string? groupGuid = (), string? campaignGuid = ()) returns Channels|error {
        string resourcePath = string `/channels`;
        map<anydata> queryParam = {"group_guid": groupGuid, "campaign_guid": campaignGuid};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Channels response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create Channel
    #
    # + return - SUCCESS 
    remote isolated function createChannel(ChannelModify payload) returns Channel|error {
        string resourcePath = string `/channels`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Channel response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve Custom Bitlink
    #
    # + customBitlink - A Custom Bitlink made of the domain and keyword 
    # + return - SUCCESS 
    remote isolated function getCustomBitlink(string customBitlink) returns CustomBitlink|error {
        string resourcePath = string `/custom_bitlinks/${getEncodedUri(customBitlink)}`;
        CustomBitlink response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Custom Bitlink
    #
    # + customBitlink - A Custom Bitlink made of the domain and keyword 
    # + return - SUCCESS 
    remote isolated function updateCustomBitlink(string customBitlink, UpdateCustomBitlink payload) returns CustomBitlink|error {
        string resourcePath = string `/custom_bitlinks/${getEncodedUri(customBitlink)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomBitlink response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Retrieve Group Shorten Counts
    #
    # + groupGuid - A GUID for a Bitly group 
    # + unit - A unit of time 
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time. 
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. 
    # + return - SUCCESS 
    remote isolated function getGroupShortenCounts(string groupGuid, TimeUnit unit, int units, string? unitReference = ()) returns Metrics|error {
        string resourcePath = string `/groups/${getEncodedUri(groupGuid)}/shorten_counts`;
        map<anydata> queryParam = {"unit": unit, "units": units, "unit_reference": unitReference};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Metrics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve Groups
    #
    # + organizationGuid - A GUID for a Bitly organization 
    # + return - SUCCESS 
    remote isolated function getGroups(string? organizationGuid = ()) returns Groups|error {
        string resourcePath = string `/groups`;
        map<anydata> queryParam = {"organization_guid": organizationGuid};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Groups response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve Organizations
    #
    # + return - SUCCESS 
    remote isolated function getOrganizations() returns Organizations|error {
        string resourcePath = string `/organizations`;
        Organizations response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Metrics for a Bitlink by Referrers by Domain
    #
    # + bitlink - A Bitlink made of the domain and hash 
    # + unit - A unit of time 
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time. 
    # + size - The quantity of items to be be returned 
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. 
    # + return - SUCCESS 
    remote isolated function getMetricsForBitlinkByReferrersByDomains(string bitlink, TimeUnit unit, int units, int size = 50, string? unitReference = ()) returns ReferrersByDomains|error {
        string resourcePath = string `/bitlinks/${getEncodedUri(bitlink)}/referrers_by_domains`;
        map<anydata> queryParam = {"unit": unit, "units": units, "size": size, "unit_reference": unitReference};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ReferrersByDomains response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a User
    #
    # + return - SUCCESS 
    remote isolated function getUser() returns User|error {
        string resourcePath = string `/user`;
        User response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a User
    #
    # + return - SUCCESS 
    remote isolated function updateUser(UserUpdate payload) returns User|error {
        string resourcePath = string `/user`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        User response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get BSDs
    #
    # + return - SUCCESS 
    remote isolated function getBSDs() returns BSDsResponse|error {
        string resourcePath = string `/bsds`;
        BSDsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve Group Preferences
    #
    # + groupGuid - A GUID for a Bitly group 
    # + return - SUCCESS 
    remote isolated function getGroupPreferences(string groupGuid) returns GroupPreferences|error {
        string resourcePath = string `/groups/${getEncodedUri(groupGuid)}/preferences`;
        GroupPreferences response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Group Preferences
    #
    # + groupGuid - A GUID for a Bitly group 
    # + return - SUCCESS 
    remote isolated function updateGroupPreferences(string groupGuid, GroupPreferences payload) returns GroupPreferences|error {
        string resourcePath = string `/groups/${getEncodedUri(groupGuid)}/preferences`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GroupPreferences response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get Clicks for a Bitlink
    #
    # + bitlink - A Bitlink made of the domain and hash 
    # + unit - A unit of time 
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time. 
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. 
    # + return - SUCCESS 
    remote isolated function getClicksForBitlink(string bitlink, TimeUnit unit, int units, string? unitReference = ()) returns Clicks|error {
        string resourcePath = string `/bitlinks/${getEncodedUri(bitlink)}/clicks`;
        map<anydata> queryParam = {"unit": unit, "units": units, "unit_reference": unitReference};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Clicks response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve Sorted Bitlinks for Group
    #
    # + groupGuid - A GUID for a Bitly group 
    # + sort - The type of sorting that you would like to do 
    # + unit - A unit of time 
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time. 
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. 
    # + size - The quantity of items to be be returned 
    # + return - SUCCESS 
    remote isolated function getSortedBitlinks(string groupGuid, string sort, TimeUnit? unit = (), int units = -1, string? unitReference = (), int size = 50) returns SortedLinks|error {
        string resourcePath = string `/groups/${getEncodedUri(groupGuid)}/bitlinks/${getEncodedUri(sort)}`;
        map<anydata> queryParam = {"unit": unit, "units": units, "unit_reference": unitReference, "size": size};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SortedLinks response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Bitlink
    #
    # + return - SUCCESS 
    remote isolated function createFullBitlink(FullShorten payload) returns BitlinkBody|error {
        string resourcePath = string `/bitlinks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BitlinkBody response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Add Custom Bitlink
    #
    # + return - SUCCESS 
    remote isolated function addCustomBitlink(AddCustomBitlink payload) returns CustomBitlink|error {
        string resourcePath = string `/custom_bitlinks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomBitlink response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve Bitlinks by Group
    #
    # + groupGuid - A GUID for a Bitly group 
    # + size - The quantity of items to be be returned 
    # + page - Integer specifying the numbered result at which to start 
    # + keyword - Custom keyword to filter on history entries 
    # + query - the value that you would like to search 
    # + createdBefore - Timestamp as an integer unix epoch 
    # + createdAfter - Timestamp as an integer unix epoch 
    # + modifiedAfter - Timestamp as an integer unix epoch 
    # + archived - Whether or not to include archived bitlinks 
    # + deeplinks - Filter to only Bitlinks that contain deeplinks 
    # + domainDeeplinks - Filter to only Bitlinks that contain deeplinks configured with a custom domain 
    # + campaignGuid - Filter to return only links for the given campaign GUID, can be provided 
    # + channelGuid - Filter to return only links for the given channel GUID, can be provided, overrides all other parameters 
    # + tags - filter by given tags 
    # + launchpadIds - filter by launchpad id 
    # + encodingLogin - Filter by the login of the authenticated user that created the Bitlink 
    # + return - SUCCESS 
    remote isolated function getBitlinksByGroup(string groupGuid, int size = 50, int page = 1, string? keyword = (), string? query = (), int? createdBefore = (), int? createdAfter = (), int? modifiedAfter = (), string archived = "off", string deeplinks = "both", string domainDeeplinks = "both", string? campaignGuid = (), string? channelGuid = (), string customBitlink = "both", string[]? tags = (), string[]? launchpadIds = (), string[]? encodingLogin = ()) returns Bitlinks|error {
        string resourcePath = string `/groups/${getEncodedUri(groupGuid)}/bitlinks`;
        map<anydata> queryParam = {"size": size, "page": page, "keyword": keyword, "query": query, "created_before": createdBefore, "created_after": createdAfter, "modified_after": modifiedAfter, "archived": archived, "deeplinks": deeplinks, "domain_deeplinks": domainDeeplinks, "campaign_guid": campaignGuid, "channel_guid": channelGuid, "custom_bitlink": customBitlink, "tags": tags, "launchpad_ids": launchpadIds, "encoding_login": encodingLogin};
        map<Encoding> queryParamEncoding = {"tags": {style: FORM, explode: true}, "launchpad_ids": {style: FORM, explode: true}, "encoding_login": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Bitlinks response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Bulk update bitlinks
    #
    # + groupGuid - A GUID for a Bitly group 
    # + return - SUCCESS 
    remote isolated function updateBitlinksByGroup(string groupGuid, BulkUpdateRequest payload) returns BulkUpdate|error {
        string resourcePath = string `/groups/${getEncodedUri(groupGuid)}/bitlinks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BulkUpdate response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Retrieve Campaigns
    #
    # + groupGuid - A GUID for a Bitly group 
    # + return - SUCCESS 
    remote isolated function getCampaigns(string? groupGuid = ()) returns Campaigns|error {
        string resourcePath = string `/campaigns`;
        map<anydata> queryParam = {"group_guid": groupGuid};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Campaigns response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create Campaign
    #
    # + return - SUCCESS 
    remote isolated function createCampaign(CampaignModify payload) returns Campaign|error {
        string resourcePath = string `/campaigns`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Campaign response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Metrics for a Bitlink by Referrers
    #
    # + bitlink - A Bitlink made of the domain and hash 
    # + unit - A unit of time 
    # + units - An integer representing the time units to query data for. pass -1 to return all units of time. 
    # + size - The quantity of items to be be returned 
    # + unitReference - An ISO-8601 timestamp, indicating the most recent time for which to pull metrics. Will default to current time. 
    # + return - SUCCESS 
    remote isolated function getMetricsForBitlinkByReferrers(string bitlink, TimeUnit unit, int units, int size = 50, string? unitReference = ()) returns ClickMetrics|error {
        string resourcePath = string `/bitlinks/${getEncodedUri(bitlink)}/referrers`;
        map<anydata> queryParam = {"unit": unit, "units": units, "size": size, "unit_reference": unitReference};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ClickMetrics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Shorten a Link
    #
    # + return - SUCCESS 
    remote isolated function createBitlink(Shorten payload) returns ShortenBitlinkBody|error {
        string resourcePath = string `/shorten`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShortenBitlinkBody response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Verify Webhook
    #
    # + webhookGuid - A GUID for a Bitly webhook 
    # + return - SUCCESS 
    remote isolated function verifyWebhook(string webhookGuid) returns Webhook|error {
        string resourcePath = string `/webhooks/${getEncodedUri(webhookGuid)}/verify`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Webhook response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get Webhooks
    #
    # + organizationGuid - A GUID for a Bitly organization 
    # + return - SUCCESS 
    remote isolated function getWebhooks(string organizationGuid) returns Webhooks|error {
        string resourcePath = string `/organizations/${getEncodedUri(organizationGuid)}/webhooks`;
        Webhooks response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a Channel
    #
    # + channelGuid - A GUID for a Bitly Channel 
    # + return - SUCCESS 
    remote isolated function getChannel(string channelGuid) returns Channel|error {
        string resourcePath = string `/channels/${getEncodedUri(channelGuid)}`;
        Channel response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a Channel
    #
    # + channelGuid - A GUID for a Bitly Channel 
    # + return - SUCCESS 
    remote isolated function updateChannel(string channelGuid, ChannelModify payload) returns Channel|error {
        string resourcePath = string `/channels/${getEncodedUri(channelGuid)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Channel response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
}
