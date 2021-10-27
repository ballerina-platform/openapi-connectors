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
    # Represents Access Token  `access_token`
    string accessToken;
|};

# This is a generated connector for [Facebook Marketing API v12.0](https://developers.facebook.com/docs/marketing-apis) OpenAPI specification. 
# Facebook is an American online social media and social networking service owned by Facebook, Inc.Facebook Marketing  APIs are a collection of Graph API endpoints that can be used to help you advertise on Facebook.
@display {label: "Facebook Ads", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Facebook account](https://facebook.com/) and obtain tokens by following [this guide](https://developers.facebook.com/docs/marketing-apis/overview/authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://graph.facebook.com/v12.0") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Returns campaigns under this ad account.
    #
    # + adAccountId - ID of the ad account. 
    # + datePreset - Predefined date range used to aggregate insights metrics. 
    # + effectiveStatus - Effective status for the campaigns 
    # + isCompleted - If true, we return completed campaigns. 
    # + timeRange - Date range used to aggregate insights metrics 
    # + fields - Fields of the campaign 
    # + summary - Aggregated information about the edge, such as counts 
    # + return - Success 
    remote isolated function getCampaigns(string adAccountId, string? datePreset = (), string[]? effectiveStatus = (), boolean? isCompleted = (), TimeRange? timeRange = (), string[]? fields = (), string[]? summary = ()) returns CampaignList|error {
        string path = string `/act_${adAccountId}/campaigns`;
        map<anydata> queryParam = {"date_preset": datePreset, "effective_status": effectiveStatus, "is_completed": isCompleted, "time_range": timeRange, "fields": fields, "summary": summary, "access_token": self.apiKeyConfig.accessToken};
        map<Encoding> queryParamEncoding = {"effective_status": {style: FORM, explode: true}, "time_range": {style: FORM, explode: true}, "fields": {style: FORM, explode: false}, "summary": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        CampaignList response = check self.clientEp->get(path, targetType = CampaignList);
        return response;
    }
    # Cerates a campaign.
    #
    # + adAccountId - ID of the ad account. 
    # + properties - Campaign properties 
    # + return - Success 
    remote isolated function createCampaign(string adAccountId, Campaign properties) returns CampaignResponse|error {
        string path = string `/act_${adAccountId}/campaigns`;
        map<anydata> queryParam = {"properties": properties, "access_token": self.apiKeyConfig.accessToken};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        //TODO: Update the request as needed;
        CampaignResponse response = check self.clientEp-> post(path, request, targetType = CampaignResponse);
        return response;
    }
    # Dissociate a campaign from an AdAccount.
    #
    # + adAccountId - ID of the ad account. 
    # + beforeDate - Set a before date to delete campaigns before this date 
    # + deleteStrategy - Delete strategy 
    # + objectCount - Object count 
    # + return - Success 
    remote isolated function dissociateCampaign(string adAccountId, string deleteStrategy, string? beforeDate = (), int? objectCount = ()) returns CampaignDissociateResponse|error {
        string path = string `/act_${adAccountId}/campaigns`;
        map<anydata> queryParam = {"before_date": beforeDate, "delete_strategy": deleteStrategy, "object_count": objectCount, "access_token": self.apiKeyConfig.accessToken};
        path = path + check getPathForQueryParam(queryParam);
        CampaignDissociateResponse response = check self.clientEp->delete(path, targetType = CampaignDissociateResponse);
        return response;
    }
    # Updates a campaign.
    #
    # + campaignId - ID of the campaign. 
    # + properties - Campaign update properties 
    # + return - Success 
    remote isolated function updateCampaign(string campaignId, CampaignUpdate properties) returns CampaignResponse|error {
        string path = string `/${campaignId}`;
        map<anydata> queryParam = {"properties": properties, "access_token": self.apiKeyConfig.accessToken};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        //TODO: Update the request as needed;
        CampaignResponse response = check self.clientEp-> post(path, request, targetType = CampaignResponse);
        return response;
    }
    # Deletes a campaign.
    #
    # + campaignId - ID of the campaign. 
    # + return - Success 
    remote isolated function deleteCampaign(string campaignId) returns CampaignResponse|error {
        string path = string `/${campaignId}`;
        map<anydata> queryParam = {"access_token": self.apiKeyConfig.accessToken};
        path = path + check getPathForQueryParam(queryParam);
        CampaignResponse response = check self.clientEp->delete(path, targetType = CampaignResponse);
        return response;
    }
    # Returns all ad sets from one ad account
    #
    # + adAccountId - ID of the ad account. 
    # + datePreset - Predefined date range used to aggregate insights metrics. 
    # + timeRange - Time Range. Note if time range is invalid, it will be ignored. 
    # + fields - Fields of the ad set 
    # + return - Success 
    remote isolated function getAdSets(string adAccountId, string? datePreset = (), TimeRange? timeRange = (), string[]? fields = ()) returns AdSetList|error {
        string path = string `/act_${adAccountId}/adsets`;
        map<anydata> queryParam = {"date_preset": datePreset, "time_range": timeRange, "fields": fields, "access_token": self.apiKeyConfig.accessToken};
        map<Encoding> queryParamEncoding = {"time_range": {style: FORM, explode: true}, "fields": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        AdSetList response = check self.clientEp->get(path, targetType = AdSetList);
        return response;
    }
    # Cerates an ad set.
    #
    # + adAccountId - ID of the ad account. 
    # + properties - Ad set properties 
    # + return - Success 
    remote isolated function createAdSet(string adAccountId, AdSet properties) returns AdSetResponse|error {
        string path = string `/act_${adAccountId}/adsets`;
        map<anydata> queryParam = {"properties": properties, "access_token": self.apiKeyConfig.accessToken};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        //TODO: Update the request as needed;
        AdSetResponse response = check self.clientEp-> post(path, request, targetType = AdSetResponse);
        return response;
    }
    # Return date related to an ad set.
    #
    # + adSetId - ID of the ad set. 
    # + datePreset - Predefined date range used to aggregate insights metrics. 
    # + timeRange - Time Range. Note if time range is invalid, it will be ignored. 
    # + fields - Fields of the ad set 
    # + return - Success 
    remote isolated function getAdSet(string adSetId, string? datePreset = (), TimeRange? timeRange = (), string[]? fields = ()) returns AdSet|error {
        string path = string `/${adSetId}`;
        map<anydata> queryParam = {"date_preset": datePreset, "time_range": timeRange, "fields": fields, "access_token": self.apiKeyConfig.accessToken};
        map<Encoding> queryParamEncoding = {"time_range": {style: FORM, explode: true}, "fields": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        AdSet response = check self.clientEp->get(path, targetType = AdSet);
        return response;
    }
    # Updates an ad set.
    #
    # + adSetId - ID of the ad set. 
    # + properties - Ad set update properties 
    # + return - Success 
    remote isolated function updateAdSet(string adSetId, AdSetUpdate properties) returns AdSetResponse|error {
        string path = string `/${adSetId}`;
        map<anydata> queryParam = {"properties": properties, "access_token": self.apiKeyConfig.accessToken};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        //TODO: Update the request as needed;
        AdSetResponse response = check self.clientEp-> post(path, request, targetType = AdSetResponse);
        return response;
    }
    # Deletes a ad set.
    #
    # + adSetId - ID of the ad set. 
    # + return - Success 
    remote isolated function deleteAdSet(string adSetId) returns AdSetResponse|error {
        string path = string `/${adSetId}`;
        map<anydata> queryParam = {"access_token": self.apiKeyConfig.accessToken};
        path = path + check getPathForQueryParam(queryParam);
        AdSetResponse response = check self.clientEp->delete(path, targetType = AdSetResponse);
        return response;
    }
    # Returns ads under this ad account.
    #
    # + adAccountId - ID of the ad account. 
    # + datePreset - Predefined date range used to aggregate insights metrics. 
    # + effectiveStatus - Effective status for the ads 
    # + timeRange - Date range used to aggregate insights metrics 
    # + updatedSince - Updated since. 
    # + fields - Fields of the campaign 
    # + summary - Aggregated information about the edge, such as counts 
    # + return - Success 
    remote isolated function getAds(string adAccountId, string? datePreset = (), string[]? effectiveStatus = (), TimeRange? timeRange = (), int? updatedSince = (), string[]? fields = (), string[]? summary = ()) returns AdList|error {
        string path = string `/act_${adAccountId}/ads`;
        map<anydata> queryParam = {"date_preset": datePreset, "effective_status": effectiveStatus, "time_range": timeRange, "updated_since": updatedSince, "fields": fields, "summary": summary, "access_token": self.apiKeyConfig.accessToken};
        map<Encoding> queryParamEncoding = {"effective_status": {style: FORM, explode: true}, "time_range": {style: FORM, explode: true}, "fields": {style: FORM, explode: false}, "summary": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        AdList response = check self.clientEp->get(path, targetType = AdList);
        return response;
    }
    # Cerates an ad.
    #
    # + adAccountId - ID of the ad account. 
    # + properties - Ad properties 
    # + return - Success 
    remote isolated function createAd(string adAccountId, Ad properties) returns AdResponse|error {
        string path = string `/act_${adAccountId}/ads`;
        map<anydata> queryParam = {"properties": properties, "access_token": self.apiKeyConfig.accessToken};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        //TODO: Update the request as needed;
        AdResponse response = check self.clientEp-> post(path, request, targetType = AdResponse);
        return response;
    }
    # Returns data of an ad.
    #
    # + adId - ID of the ad 
    # + datePreset - Predefined date range used to aggregate insights metrics. 
    # + timeRange - Date range used to aggregate insights metrics 
    # + updatedSince - Updated since. 
    # + fields - Fields of the campaign 
    # + return - Success 
    remote isolated function getAd(string adId, string? datePreset = (), TimeRange? timeRange = (), int? updatedSince = (), string[]? fields = ()) returns Ad|error {
        string path = string `/${adId}`;
        map<anydata> queryParam = {"date_preset": datePreset, "time_range": timeRange, "updated_since": updatedSince, "fields": fields, "access_token": self.apiKeyConfig.accessToken};
        map<Encoding> queryParamEncoding = {"time_range": {style: FORM, explode: true}, "fields": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        Ad response = check self.clientEp->get(path, targetType = Ad);
        return response;
    }
    # Updates an ad.
    #
    # + adId - ID of the ad 
    # + properties - Ad set update properties 
    # + return - Success 
    remote isolated function updateAd(string adId, AdUpdate properties) returns AdResponse|error {
        string path = string `/${adId}`;
        map<anydata> queryParam = {"properties": properties, "access_token": self.apiKeyConfig.accessToken};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        //TODO: Update the request as needed;
        AdResponse response = check self.clientEp-> post(path, request, targetType = AdResponse);
        return response;
    }
    # Deletes an ad.
    #
    # + adId - ID of the ad 
    # + return - Success 
    remote isolated function deleteAd(string adId) returns AdResponse|error {
        string path = string `/${adId}`;
        map<anydata> queryParam = {"access_token": self.apiKeyConfig.accessToken};
        path = path + check getPathForQueryParam(queryParam);
        AdResponse response = check self.clientEp->delete(path, targetType = AdResponse);
        return response;
    }
}
