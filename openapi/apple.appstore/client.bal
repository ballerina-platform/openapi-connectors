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

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

public type ClientConfig record {
    http:BearerTokenConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    # Client initialization.
    #
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.appstoreconnect.apple.com/") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    #
    # + filterPlatforms - filter by attribute 'platforms'
    # + existsParent - filter by existence or non-existence of related 'parent'
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories
    # + 'limit - maximum resources per page
    # + include - comma-separated list of relationships to include
    # + limitSubcategories - maximum number of related subcategories returned (when they are included)
    # + return - List of AppCategories
    remote isolated function appcategoriesGetCollection(string[]? filterPlatforms = (), string[]? existsParent = (), string[]? fieldsAppcategories = (), int? 'limit = (), string[]? include = (), int? limitSubcategories = ()) returns AppCategoriesResponse|error {
        string  path = string `/v1/appCategories`;
        map<anydata> queryParam = {"filter[platforms]": filterPlatforms, "exists[parent]": existsParent, "fields[appCategories]": fieldsAppcategories, "limit": 'limit, "include": include, "limit[subcategories]": limitSubcategories};
        path = path + check getPathForQueryParam(queryParam);
        AppCategoriesResponse response = check self.clientEp-> get(path, targetType = AppCategoriesResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories
    # + include - comma-separated list of relationships to include
    # + limitSubcategories - maximum number of related subcategories returned (when they are included)
    # + return - Single AppCategory
    remote isolated function appcategoriesGetInstance(string id, string[]? fieldsAppcategories = (), string[]? include = (), int? limitSubcategories = ()) returns AppCategoryResponse|error {
        string  path = string `/v1/appCategories/${id}`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories, "include": include, "limit[subcategories]": limitSubcategories};
        path = path + check getPathForQueryParam(queryParam);
        AppCategoryResponse response = check self.clientEp-> get(path, targetType = AppCategoryResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsAppinfos - the fields to include for returned resources of type appInfos
    # + include - comma-separated list of relationships to include
    # + fieldsAgeratingdeclarations - the fields to include for returned resources of type ageRatingDeclarations
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories
    # + fieldsAppinfolocalizations - the fields to include for returned resources of type appInfoLocalizations
    # + limitAppinfolocalizations - maximum number of related appInfoLocalizations returned (when they are included)
    # + return - Single AppInfo
    remote isolated function appinfosGetInstance(string id, string[]? fieldsAppinfos = (), string[]? include = (), string[]? fieldsAgeratingdeclarations = (), string[]? fieldsAppcategories = (), string[]? fieldsAppinfolocalizations = (), int? limitAppinfolocalizations = ()) returns AppInfoResponse|error {
        string  path = string `/v1/appInfos/${id}`;
        map<anydata> queryParam = {"fields[appInfos]": fieldsAppinfos, "include": include, "fields[ageRatingDeclarations]": fieldsAgeratingdeclarations, "fields[appCategories]": fieldsAppcategories, "fields[appInfoLocalizations]": fieldsAppinfolocalizations, "limit[appInfoLocalizations]": limitAppinfolocalizations};
        path = path + check getPathForQueryParam(queryParam);
        AppInfoResponse response = check self.clientEp-> get(path, targetType = AppInfoResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - AppInfo representation
    # + return - Single AppInfo
    remote isolated function appinfosUpdateInstance(string id, AppInfoUpdateRequest payload) returns AppInfoResponse|error {
        string  path = string `/v1/appInfos/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AppInfoResponse response = check self.clientEp->patch(path, request, targetType=AppInfoResponse);
        return response;
    }
    #
    # + filterPricetier - filter by id(s) of related 'priceTier'
    # + filterTerritory - filter by id(s) of related 'territory'
    # + fieldsApppricepoints - the fields to include for returned resources of type appPricePoints
    # + 'limit - maximum resources per page
    # + include - comma-separated list of relationships to include
    # + fieldsTerritories - the fields to include for returned resources of type territories
    # + return - List of AppPricePoints
    remote isolated function apppricepointsGetCollection(string[]? filterPricetier = (), string[]? filterTerritory = (), string[]? fieldsApppricepoints = (), int? 'limit = (), string[]? include = (), string[]? fieldsTerritories = ()) returns AppPricePointsResponse|error {
        string  path = string `/v1/appPricePoints`;
        map<anydata> queryParam = {"filter[priceTier]": filterPricetier, "filter[territory]": filterTerritory, "fields[appPricePoints]": fieldsApppricepoints, "limit": 'limit, "include": include, "fields[territories]": fieldsTerritories};
        path = path + check getPathForQueryParam(queryParam);
        AppPricePointsResponse response = check self.clientEp-> get(path, targetType = AppPricePointsResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsApppricepoints - the fields to include for returned resources of type appPricePoints
    # + include - comma-separated list of relationships to include
    # + fieldsTerritories - the fields to include for returned resources of type territories
    # + return - Single AppPricePoint
    remote isolated function apppricepointsGetInstance(string id, string[]? fieldsApppricepoints = (), string[]? include = (), string[]? fieldsTerritories = ()) returns AppPricePointResponse|error {
        string  path = string `/v1/appPricePoints/${id}`;
        map<anydata> queryParam = {"fields[appPricePoints]": fieldsApppricepoints, "include": include, "fields[territories]": fieldsTerritories};
        path = path + check getPathForQueryParam(queryParam);
        AppPricePointResponse response = check self.clientEp-> get(path, targetType = AppPricePointResponse);
        return response;
    }
    #
    # + filterId - filter by id(s)
    # + fieldsApppricetiers - the fields to include for returned resources of type appPriceTiers
    # + 'limit - maximum resources per page
    # + include - comma-separated list of relationships to include
    # + fieldsApppricepoints - the fields to include for returned resources of type appPricePoints
    # + limitPricepoints - maximum number of related pricePoints returned (when they are included)
    # + return - List of AppPriceTiers
    remote isolated function apppricetiersGetCollection(string[]? filterId = (), string[]? fieldsApppricetiers = (), int? 'limit = (), string[]? include = (), string[]? fieldsApppricepoints = (), int? limitPricepoints = ()) returns AppPriceTiersResponse|error {
        string  path = string `/v1/appPriceTiers`;
        map<anydata> queryParam = {"filter[id]": filterId, "fields[appPriceTiers]": fieldsApppricetiers, "limit": 'limit, "include": include, "fields[appPricePoints]": fieldsApppricepoints, "limit[pricePoints]": limitPricepoints};
        path = path + check getPathForQueryParam(queryParam);
        AppPriceTiersResponse response = check self.clientEp-> get(path, targetType = AppPriceTiersResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsApppricetiers - the fields to include for returned resources of type appPriceTiers
    # + include - comma-separated list of relationships to include
    # + fieldsApppricepoints - the fields to include for returned resources of type appPricePoints
    # + limitPricepoints - maximum number of related pricePoints returned (when they are included)
    # + return - Single AppPriceTier
    remote isolated function apppricetiersGetInstance(string id, string[]? fieldsApppricetiers = (), string[]? include = (), string[]? fieldsApppricepoints = (), int? limitPricepoints = ()) returns AppPriceTierResponse|error {
        string  path = string `/v1/appPriceTiers/${id}`;
        map<anydata> queryParam = {"fields[appPriceTiers]": fieldsApppricetiers, "include": include, "fields[appPricePoints]": fieldsApppricepoints, "limit[pricePoints]": limitPricepoints};
        path = path + check getPathForQueryParam(queryParam);
        AppPriceTierResponse response = check self.clientEp-> get(path, targetType = AppPriceTierResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsAppprices - the fields to include for returned resources of type appPrices
    # + include - comma-separated list of relationships to include
    # + return - Single AppPrice
    remote isolated function apppricesGetInstance(string id, string[]? fieldsAppprices = (), string[]? include = ()) returns AppPriceResponse|error {
        string  path = string `/v1/appPrices/${id}`;
        map<anydata> queryParam = {"fields[appPrices]": fieldsAppprices, "include": include};
        path = path + check getPathForQueryParam(queryParam);
        AppPriceResponse response = check self.clientEp-> get(path, targetType = AppPriceResponse);
        return response;
    }
    #
    # + payload - AppScreenshot representation
    # + return - Single AppScreenshot
    remote isolated function appscreenshotsCreateInstance(AppScreenshotCreateRequest payload) returns AppScreenshotResponse|error {
        string  path = string `/v1/appScreenshots`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AppScreenshotResponse response = check self.clientEp->post(path, request, targetType=AppScreenshotResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsAppscreenshots - the fields to include for returned resources of type appScreenshots
    # + include - comma-separated list of relationships to include
    # + return - Single AppScreenshot
    remote isolated function appscreenshotsGetInstance(string id, string[]? fieldsAppscreenshots = (), string[]? include = ()) returns AppScreenshotResponse|error {
        string  path = string `/v1/appScreenshots/${id}`;
        map<anydata> queryParam = {"fields[appScreenshots]": fieldsAppscreenshots, "include": include};
        path = path + check getPathForQueryParam(queryParam);
        AppScreenshotResponse response = check self.clientEp-> get(path, targetType = AppScreenshotResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + return - Success (no content)
    remote isolated function appscreenshotsDeleteInstance(string id) returns http:Response|error {
        string  path = string `/v1/appScreenshots/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - AppScreenshot representation
    # + return - Single AppScreenshot
    remote isolated function appscreenshotsUpdateInstance(string id, AppScreenshotUpdateRequest payload) returns AppScreenshotResponse|error {
        string  path = string `/v1/appScreenshots/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AppScreenshotResponse response = check self.clientEp->patch(path, request, targetType=AppScreenshotResponse);
        return response;
    }
    #
    # + filterAppstoreversionsAppstorestate - filter by attribute 'appStoreVersions.appStoreState'
    # + filterAppstoreversionsPlatform - filter by attribute 'appStoreVersions.platform'
    # + filterBundleid - filter by attribute 'bundleId'
    # + filterName - filter by attribute 'name'
    # + filterSku - filter by attribute 'sku'
    # + filterAppstoreversions - filter by id(s) of related 'appStoreVersions'
    # + filterId - filter by id(s)
    # + existsGamecenterenabledversions - filter by existence or non-existence of related 'gameCenterEnabledVersions'
    # + sort - comma-separated list of sort expressions; resources will be sorted as specified
    # + fieldsApps - the fields to include for returned resources of type apps
    # + 'limit - maximum resources per page
    # + include - comma-separated list of relationships to include
    # + fieldsBetagroups - the fields to include for returned resources of type betaGroups
    # + fieldsPerfpowermetrics - the fields to include for returned resources of type perfPowerMetrics
    # + fieldsAppinfos - the fields to include for returned resources of type appInfos
    # + fieldsApppreorders - the fields to include for returned resources of type appPreOrders
    # + fieldsPrereleaseversions - the fields to include for returned resources of type preReleaseVersions
    # + fieldsAppprices - the fields to include for returned resources of type appPrices
    # + fieldsInapppurchases - the fields to include for returned resources of type inAppPurchases
    # + fieldsBetaappreviewdetails - the fields to include for returned resources of type betaAppReviewDetails
    # + fieldsTerritories - the fields to include for returned resources of type territories
    # + fieldsGamecenterenabledversions - the fields to include for returned resources of type gameCenterEnabledVersions
    # + fieldsAppstoreversions - the fields to include for returned resources of type appStoreVersions
    # + fieldsBuilds - the fields to include for returned resources of type builds
    # + fieldsBetaapplocalizations - the fields to include for returned resources of type betaAppLocalizations
    # + fieldsBetalicenseagreements - the fields to include for returned resources of type betaLicenseAgreements
    # + fieldsEnduserlicenseagreements - the fields to include for returned resources of type endUserLicenseAgreements
    # + limitAppinfos - maximum number of related appInfos returned (when they are included)
    # + limitAppstoreversions - maximum number of related appStoreVersions returned (when they are included)
    # + limitAvailableterritories - maximum number of related availableTerritories returned (when they are included)
    # + limitBetaapplocalizations - maximum number of related betaAppLocalizations returned (when they are included)
    # + limitBetagroups - maximum number of related betaGroups returned (when they are included)
    # + limitBuilds - maximum number of related builds returned (when they are included)
    # + limitGamecenterenabledversions - maximum number of related gameCenterEnabledVersions returned (when they are included)
    # + limitInapppurchases - maximum number of related inAppPurchases returned (when they are included)
    # + limitPrereleaseversions - maximum number of related preReleaseVersions returned (when they are included)
    # + limitPrices - maximum number of related prices returned (when they are included)
    # + return - List of Apps
    remote isolated function appsGetCollection(string[]? filterAppstoreversionsAppstorestate = (), string[]? filterAppstoreversionsPlatform = (), string[]? filterBundleid = (), string[]? filterName = (), string[]? filterSku = (), string[]? filterAppstoreversions = (), string[]? filterId = (), string[]? existsGamecenterenabledversions = (), string[]? sort = (), string[]? fieldsApps = (), int? 'limit = (), string[]? include = (), string[]? fieldsBetagroups = (), string[]? fieldsPerfpowermetrics = (), string[]? fieldsAppinfos = (), string[]? fieldsApppreorders = (), string[]? fieldsPrereleaseversions = (), string[]? fieldsAppprices = (), string[]? fieldsInapppurchases = (), string[]? fieldsBetaappreviewdetails = (), string[]? fieldsTerritories = (), string[]? fieldsGamecenterenabledversions = (), string[]? fieldsAppstoreversions = (), string[]? fieldsBuilds = (), string[]? fieldsBetaapplocalizations = (), string[]? fieldsBetalicenseagreements = (), string[]? fieldsEnduserlicenseagreements = (), int? limitAppinfos = (), int? limitAppstoreversions = (), int? limitAvailableterritories = (), int? limitBetaapplocalizations = (), int? limitBetagroups = (), int? limitBuilds = (), int? limitGamecenterenabledversions = (), int? limitInapppurchases = (), int? limitPrereleaseversions = (), int? limitPrices = ()) returns AppsResponse|error {
        string  path = string `/v1/apps`;
        map<anydata> queryParam = {"filter[appStoreVersions.appStoreState]": filterAppstoreversionsAppstorestate, "filter[appStoreVersions.platform]": filterAppstoreversionsPlatform, "filter[bundleId]": filterBundleid, "filter[name]": filterName, "filter[sku]": filterSku, "filter[appStoreVersions]": filterAppstoreversions, "filter[id]": filterId, "exists[gameCenterEnabledVersions]": existsGamecenterenabledversions, "sort": sort, "fields[apps]": fieldsApps, "limit": 'limit, "include": include, "fields[betaGroups]": fieldsBetagroups, "fields[perfPowerMetrics]": fieldsPerfpowermetrics, "fields[appInfos]": fieldsAppinfos, "fields[appPreOrders]": fieldsApppreorders, "fields[preReleaseVersions]": fieldsPrereleaseversions, "fields[appPrices]": fieldsAppprices, "fields[inAppPurchases]": fieldsInapppurchases, "fields[betaAppReviewDetails]": fieldsBetaappreviewdetails, "fields[territories]": fieldsTerritories, "fields[gameCenterEnabledVersions]": fieldsGamecenterenabledversions, "fields[appStoreVersions]": fieldsAppstoreversions, "fields[builds]": fieldsBuilds, "fields[betaAppLocalizations]": fieldsBetaapplocalizations, "fields[betaLicenseAgreements]": fieldsBetalicenseagreements, "fields[endUserLicenseAgreements]": fieldsEnduserlicenseagreements, "limit[appInfos]": limitAppinfos, "limit[appStoreVersions]": limitAppstoreversions, "limit[availableTerritories]": limitAvailableterritories, "limit[betaAppLocalizations]": limitBetaapplocalizations, "limit[betaGroups]": limitBetagroups, "limit[builds]": limitBuilds, "limit[gameCenterEnabledVersions]": limitGamecenterenabledversions, "limit[inAppPurchases]": limitInapppurchases, "limit[preReleaseVersions]": limitPrereleaseversions, "limit[prices]": limitPrices};
        path = path + check getPathForQueryParam(queryParam);
        AppsResponse response = check self.clientEp-> get(path, targetType = AppsResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsApps - the fields to include for returned resources of type apps
    # + include - comma-separated list of relationships to include
    # + fieldsBetagroups - the fields to include for returned resources of type betaGroups
    # + fieldsPerfpowermetrics - the fields to include for returned resources of type perfPowerMetrics
    # + fieldsAppinfos - the fields to include for returned resources of type appInfos
    # + fieldsApppreorders - the fields to include for returned resources of type appPreOrders
    # + fieldsPrereleaseversions - the fields to include for returned resources of type preReleaseVersions
    # + fieldsAppprices - the fields to include for returned resources of type appPrices
    # + fieldsInapppurchases - the fields to include for returned resources of type inAppPurchases
    # + fieldsBetaappreviewdetails - the fields to include for returned resources of type betaAppReviewDetails
    # + fieldsTerritories - the fields to include for returned resources of type territories
    # + fieldsGamecenterenabledversions - the fields to include for returned resources of type gameCenterEnabledVersions
    # + fieldsAppstoreversions - the fields to include for returned resources of type appStoreVersions
    # + fieldsBuilds - the fields to include for returned resources of type builds
    # + fieldsBetaapplocalizations - the fields to include for returned resources of type betaAppLocalizations
    # + fieldsBetalicenseagreements - the fields to include for returned resources of type betaLicenseAgreements
    # + fieldsEnduserlicenseagreements - the fields to include for returned resources of type endUserLicenseAgreements
    # + limitAppinfos - maximum number of related appInfos returned (when they are included)
    # + limitAppstoreversions - maximum number of related appStoreVersions returned (when they are included)
    # + limitAvailableterritories - maximum number of related availableTerritories returned (when they are included)
    # + limitBetaapplocalizations - maximum number of related betaAppLocalizations returned (when they are included)
    # + limitBetagroups - maximum number of related betaGroups returned (when they are included)
    # + limitBuilds - maximum number of related builds returned (when they are included)
    # + limitGamecenterenabledversions - maximum number of related gameCenterEnabledVersions returned (when they are included)
    # + limitInapppurchases - maximum number of related inAppPurchases returned (when they are included)
    # + limitPrereleaseversions - maximum number of related preReleaseVersions returned (when they are included)
    # + limitPrices - maximum number of related prices returned (when they are included)
    # + return - Single App
    remote isolated function appsGetInstance(string id, string[]? fieldsApps = (), string[]? include = (), string[]? fieldsBetagroups = (), string[]? fieldsPerfpowermetrics = (), string[]? fieldsAppinfos = (), string[]? fieldsApppreorders = (), string[]? fieldsPrereleaseversions = (), string[]? fieldsAppprices = (), string[]? fieldsInapppurchases = (), string[]? fieldsBetaappreviewdetails = (), string[]? fieldsTerritories = (), string[]? fieldsGamecenterenabledversions = (), string[]? fieldsAppstoreversions = (), string[]? fieldsBuilds = (), string[]? fieldsBetaapplocalizations = (), string[]? fieldsBetalicenseagreements = (), string[]? fieldsEnduserlicenseagreements = (), int? limitAppinfos = (), int? limitAppstoreversions = (), int? limitAvailableterritories = (), int? limitBetaapplocalizations = (), int? limitBetagroups = (), int? limitBuilds = (), int? limitGamecenterenabledversions = (), int? limitInapppurchases = (), int? limitPrereleaseversions = (), int? limitPrices = ()) returns AppResponse|error {
        string  path = string `/v1/apps/${id}`;
        map<anydata> queryParam = {"fields[apps]": fieldsApps, "include": include, "fields[betaGroups]": fieldsBetagroups, "fields[perfPowerMetrics]": fieldsPerfpowermetrics, "fields[appInfos]": fieldsAppinfos, "fields[appPreOrders]": fieldsApppreorders, "fields[preReleaseVersions]": fieldsPrereleaseversions, "fields[appPrices]": fieldsAppprices, "fields[inAppPurchases]": fieldsInapppurchases, "fields[betaAppReviewDetails]": fieldsBetaappreviewdetails, "fields[territories]": fieldsTerritories, "fields[gameCenterEnabledVersions]": fieldsGamecenterenabledversions, "fields[appStoreVersions]": fieldsAppstoreversions, "fields[builds]": fieldsBuilds, "fields[betaAppLocalizations]": fieldsBetaapplocalizations, "fields[betaLicenseAgreements]": fieldsBetalicenseagreements, "fields[endUserLicenseAgreements]": fieldsEnduserlicenseagreements, "limit[appInfos]": limitAppinfos, "limit[appStoreVersions]": limitAppstoreversions, "limit[availableTerritories]": limitAvailableterritories, "limit[betaAppLocalizations]": limitBetaapplocalizations, "limit[betaGroups]": limitBetagroups, "limit[builds]": limitBuilds, "limit[gameCenterEnabledVersions]": limitGamecenterenabledversions, "limit[inAppPurchases]": limitInapppurchases, "limit[preReleaseVersions]": limitPrereleaseversions, "limit[prices]": limitPrices};
        path = path + check getPathForQueryParam(queryParam);
        AppResponse response = check self.clientEp-> get(path, targetType = AppResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - App representation
    # + return - Single App
    remote isolated function appsUpdateInstance(string id, AppUpdateRequest payload) returns AppResponse|error {
        string  path = string `/v1/apps/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AppResponse response = check self.clientEp->patch(path, request, targetType=AppResponse);
        return response;
    }
    #
    # + filterBetaappreviewsubmissionBetareviewstate - filter by attribute 'betaAppReviewSubmission.betaReviewState'
    # + filterExpired - filter by attribute 'expired'
    # + filterPrereleaseversionPlatform - filter by attribute 'preReleaseVersion.platform'
    # + filterPrereleaseversionVersion - filter by attribute 'preReleaseVersion.version'
    # + filterProcessingstate - filter by attribute 'processingState'
    # + filterUsesnonexemptencryption - filter by attribute 'usesNonExemptEncryption'
    # + filterVersion - filter by attribute 'version'
    # + filterApp - filter by id(s) of related 'app'
    # + filterAppstoreversion - filter by id(s) of related 'appStoreVersion'
    # + filterBetagroups - filter by id(s) of related 'betaGroups'
    # + filterPrereleaseversion - filter by id(s) of related 'preReleaseVersion'
    # + filterId - filter by id(s)
    # + sort - comma-separated list of sort expressions; resources will be sorted as specified
    # + fieldsBuilds - the fields to include for returned resources of type builds
    # + 'limit - maximum resources per page
    # + include - comma-separated list of relationships to include
    # + fieldsAppencryptiondeclarations - the fields to include for returned resources of type appEncryptionDeclarations
    # + fieldsBetaappreviewsubmissions - the fields to include for returned resources of type betaAppReviewSubmissions
    # + fieldsBuildbetadetails - the fields to include for returned resources of type buildBetaDetails
    # + fieldsBuildicons - the fields to include for returned resources of type buildIcons
    # + fieldsPerfpowermetrics - the fields to include for returned resources of type perfPowerMetrics
    # + fieldsPrereleaseversions - the fields to include for returned resources of type preReleaseVersions
    # + fieldsAppstoreversions - the fields to include for returned resources of type appStoreVersions
    # + fieldsDiagnosticsignatures - the fields to include for returned resources of type diagnosticSignatures
    # + fieldsBetatesters - the fields to include for returned resources of type betaTesters
    # + fieldsBetabuildlocalizations - the fields to include for returned resources of type betaBuildLocalizations
    # + fieldsApps - the fields to include for returned resources of type apps
    # + limitBetabuildlocalizations - maximum number of related betaBuildLocalizations returned (when they are included)
    # + limitIcons - maximum number of related icons returned (when they are included)
    # + limitIndividualtesters - maximum number of related individualTesters returned (when they are included)
    # + return - List of Builds
    remote isolated function buildsGetCollection(string[]? filterBetaappreviewsubmissionBetareviewstate = (), string[]? filterExpired = (), string[]? filterPrereleaseversionPlatform = (), string[]? filterPrereleaseversionVersion = (), string[]? filterProcessingstate = (), string[]? filterUsesnonexemptencryption = (), string[]? filterVersion = (), string[]? filterApp = (), string[]? filterAppstoreversion = (), string[]? filterBetagroups = (), string[]? filterPrereleaseversion = (), string[]? filterId = (), string[]? sort = (), string[]? fieldsBuilds = (), int? 'limit = (), string[]? include = (), string[]? fieldsAppencryptiondeclarations = (), string[]? fieldsBetaappreviewsubmissions = (), string[]? fieldsBuildbetadetails = (), string[]? fieldsBuildicons = (), string[]? fieldsPerfpowermetrics = (), string[]? fieldsPrereleaseversions = (), string[]? fieldsAppstoreversions = (), string[]? fieldsDiagnosticsignatures = (), string[]? fieldsBetatesters = (), string[]? fieldsBetabuildlocalizations = (), string[]? fieldsApps = (), int? limitBetabuildlocalizations = (), int? limitIcons = (), int? limitIndividualtesters = ()) returns BuildsResponse|error {
        string  path = string `/v1/builds`;
        map<anydata> queryParam = {"filter[betaAppReviewSubmission.betaReviewState]": filterBetaappreviewsubmissionBetareviewstate, "filter[expired]": filterExpired, "filter[preReleaseVersion.platform]": filterPrereleaseversionPlatform, "filter[preReleaseVersion.version]": filterPrereleaseversionVersion, "filter[processingState]": filterProcessingstate, "filter[usesNonExemptEncryption]": filterUsesnonexemptencryption, "filter[version]": filterVersion, "filter[app]": filterApp, "filter[appStoreVersion]": filterAppstoreversion, "filter[betaGroups]": filterBetagroups, "filter[preReleaseVersion]": filterPrereleaseversion, "filter[id]": filterId, "sort": sort, "fields[builds]": fieldsBuilds, "limit": 'limit, "include": include, "fields[appEncryptionDeclarations]": fieldsAppencryptiondeclarations, "fields[betaAppReviewSubmissions]": fieldsBetaappreviewsubmissions, "fields[buildBetaDetails]": fieldsBuildbetadetails, "fields[buildIcons]": fieldsBuildicons, "fields[perfPowerMetrics]": fieldsPerfpowermetrics, "fields[preReleaseVersions]": fieldsPrereleaseversions, "fields[appStoreVersions]": fieldsAppstoreversions, "fields[diagnosticSignatures]": fieldsDiagnosticsignatures, "fields[betaTesters]": fieldsBetatesters, "fields[betaBuildLocalizations]": fieldsBetabuildlocalizations, "fields[apps]": fieldsApps, "limit[betaBuildLocalizations]": limitBetabuildlocalizations, "limit[icons]": limitIcons, "limit[individualTesters]": limitIndividualtesters};
        path = path + check getPathForQueryParam(queryParam);
        BuildsResponse response = check self.clientEp-> get(path, targetType = BuildsResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsBuilds - the fields to include for returned resources of type builds
    # + include - comma-separated list of relationships to include
    # + fieldsAppencryptiondeclarations - the fields to include for returned resources of type appEncryptionDeclarations
    # + fieldsBetaappreviewsubmissions - the fields to include for returned resources of type betaAppReviewSubmissions
    # + fieldsBuildbetadetails - the fields to include for returned resources of type buildBetaDetails
    # + fieldsBuildicons - the fields to include for returned resources of type buildIcons
    # + fieldsPerfpowermetrics - the fields to include for returned resources of type perfPowerMetrics
    # + fieldsPrereleaseversions - the fields to include for returned resources of type preReleaseVersions
    # + fieldsAppstoreversions - the fields to include for returned resources of type appStoreVersions
    # + fieldsDiagnosticsignatures - the fields to include for returned resources of type diagnosticSignatures
    # + fieldsBetatesters - the fields to include for returned resources of type betaTesters
    # + fieldsBetabuildlocalizations - the fields to include for returned resources of type betaBuildLocalizations
    # + fieldsApps - the fields to include for returned resources of type apps
    # + limitBetabuildlocalizations - maximum number of related betaBuildLocalizations returned (when they are included)
    # + limitIcons - maximum number of related icons returned (when they are included)
    # + limitIndividualtesters - maximum number of related individualTesters returned (when they are included)
    # + return - Single Build
    remote isolated function buildsGetInstance(string id, string[]? fieldsBuilds = (), string[]? include = (), string[]? fieldsAppencryptiondeclarations = (), string[]? fieldsBetaappreviewsubmissions = (), string[]? fieldsBuildbetadetails = (), string[]? fieldsBuildicons = (), string[]? fieldsPerfpowermetrics = (), string[]? fieldsPrereleaseversions = (), string[]? fieldsAppstoreversions = (), string[]? fieldsDiagnosticsignatures = (), string[]? fieldsBetatesters = (), string[]? fieldsBetabuildlocalizations = (), string[]? fieldsApps = (), int? limitBetabuildlocalizations = (), int? limitIcons = (), int? limitIndividualtesters = ()) returns BuildResponse|error {
        string  path = string `/v1/builds/${id}`;
        map<anydata> queryParam = {"fields[builds]": fieldsBuilds, "include": include, "fields[appEncryptionDeclarations]": fieldsAppencryptiondeclarations, "fields[betaAppReviewSubmissions]": fieldsBetaappreviewsubmissions, "fields[buildBetaDetails]": fieldsBuildbetadetails, "fields[buildIcons]": fieldsBuildicons, "fields[perfPowerMetrics]": fieldsPerfpowermetrics, "fields[preReleaseVersions]": fieldsPrereleaseversions, "fields[appStoreVersions]": fieldsAppstoreversions, "fields[diagnosticSignatures]": fieldsDiagnosticsignatures, "fields[betaTesters]": fieldsBetatesters, "fields[betaBuildLocalizations]": fieldsBetabuildlocalizations, "fields[apps]": fieldsApps, "limit[betaBuildLocalizations]": limitBetabuildlocalizations, "limit[icons]": limitIcons, "limit[individualTesters]": limitIndividualtesters};
        path = path + check getPathForQueryParam(queryParam);
        BuildResponse response = check self.clientEp-> get(path, targetType = BuildResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - Build representation
    # + return - Single Build
    remote isolated function buildsUpdateInstance(string id, BuildUpdateRequest payload) returns BuildResponse|error {
        string  path = string `/v1/builds/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BuildResponse response = check self.clientEp->patch(path, request, targetType=BuildResponse);
        return response;
    }
    #
    # + filterIdentifier - filter by attribute 'identifier'
    # + filterName - filter by attribute 'name'
    # + filterPlatform - filter by attribute 'platform'
    # + filterSeedid - filter by attribute 'seedId'
    # + filterId - filter by id(s)
    # + sort - comma-separated list of sort expressions; resources will be sorted as specified
    # + fieldsBundleids - the fields to include for returned resources of type bundleIds
    # + 'limit - maximum resources per page
    # + include - comma-separated list of relationships to include
    # + fieldsBundleidcapabilities - the fields to include for returned resources of type bundleIdCapabilities
    # + fieldsProfiles - the fields to include for returned resources of type profiles
    # + fieldsApps - the fields to include for returned resources of type apps
    # + limitBundleidcapabilities - maximum number of related bundleIdCapabilities returned (when they are included)
    # + limitProfiles - maximum number of related profiles returned (when they are included)
    # + return - List of BundleIds
    remote isolated function bundleidsGetCollection(string[]? filterIdentifier = (), string[]? filterName = (), string[]? filterPlatform = (), string[]? filterSeedid = (), string[]? filterId = (), string[]? sort = (), string[]? fieldsBundleids = (), int? 'limit = (), string[]? include = (), string[]? fieldsBundleidcapabilities = (), string[]? fieldsProfiles = (), string[]? fieldsApps = (), int? limitBundleidcapabilities = (), int? limitProfiles = ()) returns BundleIdsResponse|error {
        string  path = string `/v1/bundleIds`;
        map<anydata> queryParam = {"filter[identifier]": filterIdentifier, "filter[name]": filterName, "filter[platform]": filterPlatform, "filter[seedId]": filterSeedid, "filter[id]": filterId, "sort": sort, "fields[bundleIds]": fieldsBundleids, "limit": 'limit, "include": include, "fields[bundleIdCapabilities]": fieldsBundleidcapabilities, "fields[profiles]": fieldsProfiles, "fields[apps]": fieldsApps, "limit[bundleIdCapabilities]": limitBundleidcapabilities, "limit[profiles]": limitProfiles};
        path = path + check getPathForQueryParam(queryParam);
        BundleIdsResponse response = check self.clientEp-> get(path, targetType = BundleIdsResponse);
        return response;
    }
    #
    # + payload - BundleId representation
    # + return - Single BundleId
    remote isolated function bundleidsCreateInstance(BundleIdCreateRequest payload) returns BundleIdResponse|error {
        string  path = string `/v1/bundleIds`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BundleIdResponse response = check self.clientEp->post(path, request, targetType=BundleIdResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsBundleids - the fields to include for returned resources of type bundleIds
    # + include - comma-separated list of relationships to include
    # + fieldsBundleidcapabilities - the fields to include for returned resources of type bundleIdCapabilities
    # + fieldsProfiles - the fields to include for returned resources of type profiles
    # + fieldsApps - the fields to include for returned resources of type apps
    # + limitBundleidcapabilities - maximum number of related bundleIdCapabilities returned (when they are included)
    # + limitProfiles - maximum number of related profiles returned (when they are included)
    # + return - Single BundleId
    remote isolated function bundleidsGetInstance(string id, string[]? fieldsBundleids = (), string[]? include = (), string[]? fieldsBundleidcapabilities = (), string[]? fieldsProfiles = (), string[]? fieldsApps = (), int? limitBundleidcapabilities = (), int? limitProfiles = ()) returns BundleIdResponse|error {
        string  path = string `/v1/bundleIds/${id}`;
        map<anydata> queryParam = {"fields[bundleIds]": fieldsBundleids, "include": include, "fields[bundleIdCapabilities]": fieldsBundleidcapabilities, "fields[profiles]": fieldsProfiles, "fields[apps]": fieldsApps, "limit[bundleIdCapabilities]": limitBundleidcapabilities, "limit[profiles]": limitProfiles};
        path = path + check getPathForQueryParam(queryParam);
        BundleIdResponse response = check self.clientEp-> get(path, targetType = BundleIdResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + return - Success (no content)
    remote isolated function bundleidsDeleteInstance(string id) returns http:Response|error {
        string  path = string `/v1/bundleIds/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - BundleId representation
    # + return - Single BundleId
    remote isolated function bundleidsUpdateInstance(string id, BundleIdUpdateRequest payload) returns BundleIdResponse|error {
        string  path = string `/v1/bundleIds/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BundleIdResponse response = check self.clientEp->patch(path, request, targetType=BundleIdResponse);
        return response;
    }
    #
    # + filterCertificatetype - filter by attribute 'certificateType'
    # + filterDisplayname - filter by attribute 'displayName'
    # + filterSerialnumber - filter by attribute 'serialNumber'
    # + filterId - filter by id(s)
    # + sort - comma-separated list of sort expressions; resources will be sorted as specified
    # + fieldsCertificates - the fields to include for returned resources of type certificates
    # + 'limit - maximum resources per page
    # + return - List of Certificates
    remote isolated function certificatesGetCollection(string[]? filterCertificatetype = (), string[]? filterDisplayname = (), string[]? filterSerialnumber = (), string[]? filterId = (), string[]? sort = (), string[]? fieldsCertificates = (), int? 'limit = ()) returns CertificatesResponse|error {
        string  path = string `/v1/certificates`;
        map<anydata> queryParam = {"filter[certificateType]": filterCertificatetype, "filter[displayName]": filterDisplayname, "filter[serialNumber]": filterSerialnumber, "filter[id]": filterId, "sort": sort, "fields[certificates]": fieldsCertificates, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        CertificatesResponse response = check self.clientEp-> get(path, targetType = CertificatesResponse);
        return response;
    }
    #
    # + payload - Certificate representation
    # + return - Single Certificate
    remote isolated function certificatesCreateInstance(CertificateCreateRequest payload) returns CertificateResponse|error {
        string  path = string `/v1/certificates`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CertificateResponse response = check self.clientEp->post(path, request, targetType=CertificateResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsCertificates - the fields to include for returned resources of type certificates
    # + return - Single Certificate
    remote isolated function certificatesGetInstance(string id, string[]? fieldsCertificates = ()) returns CertificateResponse|error {
        string  path = string `/v1/certificates/${id}`;
        map<anydata> queryParam = {"fields[certificates]": fieldsCertificates};
        path = path + check getPathForQueryParam(queryParam);
        CertificateResponse response = check self.clientEp-> get(path, targetType = CertificateResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + return - Success (no content)
    remote isolated function certificatesDeleteInstance(string id) returns http:Response|error {
        string  path = string `/v1/certificates/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    #
    # + filterName - filter by attribute 'name'
    # + filterPlatform - filter by attribute 'platform'
    # + filterStatus - filter by attribute 'status'
    # + filterUdid - filter by attribute 'udid'
    # + filterId - filter by id(s)
    # + sort - comma-separated list of sort expressions; resources will be sorted as specified
    # + fieldsDevices - the fields to include for returned resources of type devices
    # + 'limit - maximum resources per page
    # + return - List of Devices
    remote isolated function devicesGetCollection(string[]? filterName = (), string[]? filterPlatform = (), string[]? filterStatus = (), string[]? filterUdid = (), string[]? filterId = (), string[]? sort = (), string[]? fieldsDevices = (), int? 'limit = ()) returns DevicesResponse|error {
        string  path = string `/v1/devices`;
        map<anydata> queryParam = {"filter[name]": filterName, "filter[platform]": filterPlatform, "filter[status]": filterStatus, "filter[udid]": filterUdid, "filter[id]": filterId, "sort": sort, "fields[devices]": fieldsDevices, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        DevicesResponse response = check self.clientEp-> get(path, targetType = DevicesResponse);
        return response;
    }
    #
    # + payload - Device representation
    # + return - Single Device
    remote isolated function devicesCreateInstance(DeviceCreateRequest payload) returns DeviceResponse|error {
        string  path = string `/v1/devices`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceResponse response = check self.clientEp->post(path, request, targetType=DeviceResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsDevices - the fields to include for returned resources of type devices
    # + return - Single Device
    remote isolated function devicesGetInstance(string id, string[]? fieldsDevices = ()) returns DeviceResponse|error {
        string  path = string `/v1/devices/${id}`;
        map<anydata> queryParam = {"fields[devices]": fieldsDevices};
        path = path + check getPathForQueryParam(queryParam);
        DeviceResponse response = check self.clientEp-> get(path, targetType = DeviceResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - Device representation
    # + return - Single Device
    remote isolated function devicesUpdateInstance(string id, DeviceUpdateRequest payload) returns DeviceResponse|error {
        string  path = string `/v1/devices/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceResponse response = check self.clientEp->patch(path, request, targetType=DeviceResponse);
        return response;
    }
    #
    # + payload - EndUserLicenseAgreement representation
    # + return - Single EndUserLicenseAgreement
    remote isolated function enduserlicenseagreementsCreateInstance(EndUserLicenseAgreementCreateRequest payload) returns EndUserLicenseAgreementResponse|error {
        string  path = string `/v1/endUserLicenseAgreements`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EndUserLicenseAgreementResponse response = check self.clientEp->post(path, request, targetType=EndUserLicenseAgreementResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsEnduserlicenseagreements - the fields to include for returned resources of type endUserLicenseAgreements
    # + include - comma-separated list of relationships to include
    # + fieldsTerritories - the fields to include for returned resources of type territories
    # + limitTerritories - maximum number of related territories returned (when they are included)
    # + return - Single EndUserLicenseAgreement
    remote isolated function enduserlicenseagreementsGetInstance(string id, string[]? fieldsEnduserlicenseagreements = (), string[]? include = (), string[]? fieldsTerritories = (), int? limitTerritories = ()) returns EndUserLicenseAgreementResponse|error {
        string  path = string `/v1/endUserLicenseAgreements/${id}`;
        map<anydata> queryParam = {"fields[endUserLicenseAgreements]": fieldsEnduserlicenseagreements, "include": include, "fields[territories]": fieldsTerritories, "limit[territories]": limitTerritories};
        path = path + check getPathForQueryParam(queryParam);
        EndUserLicenseAgreementResponse response = check self.clientEp-> get(path, targetType = EndUserLicenseAgreementResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + return - Success (no content)
    remote isolated function enduserlicenseagreementsDeleteInstance(string id) returns http:Response|error {
        string  path = string `/v1/endUserLicenseAgreements/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - EndUserLicenseAgreement representation
    # + return - Single EndUserLicenseAgreement
    remote isolated function enduserlicenseagreementsUpdateInstance(string id, EndUserLicenseAgreementUpdateRequest payload) returns EndUserLicenseAgreementResponse|error {
        string  path = string `/v1/endUserLicenseAgreements/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EndUserLicenseAgreementResponse response = check self.clientEp->patch(path, request, targetType=EndUserLicenseAgreementResponse);
        return response;
    }
    #
    # + filterRegioncode - filter by attribute 'regionCode'
    # + filterReportdate - filter by attribute 'reportDate'
    # + filterReporttype - filter by attribute 'reportType'
    # + filterVendornumber - filter by attribute 'vendorNumber'
    # + return - List of FinanceReports
    remote isolated function financereportsGetCollection(string[] filterRegioncode, string[] filterReportdate, string[] filterReporttype, string[] filterVendornumber) returns string|error {
        string  path = string `/v1/financeReports`;
        map<anydata> queryParam = {"filter[regionCode]": filterRegioncode, "filter[reportDate]": filterReportdate, "filter[reportType]": filterReporttype, "filter[vendorNumber]": filterVendornumber};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsInapppurchases - the fields to include for returned resources of type inAppPurchases
    # + include - comma-separated list of relationships to include
    # + limitApps - maximum number of related apps returned (when they are included)
    # + return - Single InAppPurchase
    remote isolated function inapppurchasesGetInstance(string id, string[]? fieldsInapppurchases = (), string[]? include = (), int? limitApps = ()) returns InAppPurchaseResponse|error {
        string  path = string `/v1/inAppPurchases/${id}`;
        map<anydata> queryParam = {"fields[inAppPurchases]": fieldsInapppurchases, "include": include, "limit[apps]": limitApps};
        path = path + check getPathForQueryParam(queryParam);
        InAppPurchaseResponse response = check self.clientEp-> get(path, targetType = InAppPurchaseResponse);
        return response;
    }
    #
    # + filterName - filter by attribute 'name'
    # + filterProfilestate - filter by attribute 'profileState'
    # + filterProfiletype - filter by attribute 'profileType'
    # + filterId - filter by id(s)
    # + sort - comma-separated list of sort expressions; resources will be sorted as specified
    # + fieldsProfiles - the fields to include for returned resources of type profiles
    # + 'limit - maximum resources per page
    # + include - comma-separated list of relationships to include
    # + fieldsCertificates - the fields to include for returned resources of type certificates
    # + fieldsDevices - the fields to include for returned resources of type devices
    # + fieldsBundleids - the fields to include for returned resources of type bundleIds
    # + limitCertificates - maximum number of related certificates returned (when they are included)
    # + limitDevices - maximum number of related devices returned (when they are included)
    # + return - List of Profiles
    remote isolated function profilesGetCollection(string[]? filterName = (), string[]? filterProfilestate = (), string[]? filterProfiletype = (), string[]? filterId = (), string[]? sort = (), string[]? fieldsProfiles = (), int? 'limit = (), string[]? include = (), string[]? fieldsCertificates = (), string[]? fieldsDevices = (), string[]? fieldsBundleids = (), int? limitCertificates = (), int? limitDevices = ()) returns ProfilesResponse|error {
        string  path = string `/v1/profiles`;
        map<anydata> queryParam = {"filter[name]": filterName, "filter[profileState]": filterProfilestate, "filter[profileType]": filterProfiletype, "filter[id]": filterId, "sort": sort, "fields[profiles]": fieldsProfiles, "limit": 'limit, "include": include, "fields[certificates]": fieldsCertificates, "fields[devices]": fieldsDevices, "fields[bundleIds]": fieldsBundleids, "limit[certificates]": limitCertificates, "limit[devices]": limitDevices};
        path = path + check getPathForQueryParam(queryParam);
        ProfilesResponse response = check self.clientEp-> get(path, targetType = ProfilesResponse);
        return response;
    }
    #
    # + payload - Profile representation
    # + return - Single Profile
    remote isolated function profilesCreateInstance(ProfileCreateRequest payload) returns ProfileResponse|error {
        string  path = string `/v1/profiles`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProfileResponse response = check self.clientEp->post(path, request, targetType=ProfileResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsProfiles - the fields to include for returned resources of type profiles
    # + include - comma-separated list of relationships to include
    # + fieldsCertificates - the fields to include for returned resources of type certificates
    # + fieldsDevices - the fields to include for returned resources of type devices
    # + fieldsBundleids - the fields to include for returned resources of type bundleIds
    # + limitCertificates - maximum number of related certificates returned (when they are included)
    # + limitDevices - maximum number of related devices returned (when they are included)
    # + return - Single Profile
    remote isolated function profilesGetInstance(string id, string[]? fieldsProfiles = (), string[]? include = (), string[]? fieldsCertificates = (), string[]? fieldsDevices = (), string[]? fieldsBundleids = (), int? limitCertificates = (), int? limitDevices = ()) returns ProfileResponse|error {
        string  path = string `/v1/profiles/${id}`;
        map<anydata> queryParam = {"fields[profiles]": fieldsProfiles, "include": include, "fields[certificates]": fieldsCertificates, "fields[devices]": fieldsDevices, "fields[bundleIds]": fieldsBundleids, "limit[certificates]": limitCertificates, "limit[devices]": limitDevices};
        path = path + check getPathForQueryParam(queryParam);
        ProfileResponse response = check self.clientEp-> get(path, targetType = ProfileResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + return - Success (no content)
    remote isolated function profilesDeleteInstance(string id) returns http:Response|error {
        string  path = string `/v1/profiles/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    #
    # + filterEmail - filter by attribute 'email'
    # + filterRoles - filter by attribute 'roles'
    # + filterVisibleapps - filter by id(s) of related 'visibleApps'
    # + sort - comma-separated list of sort expressions; resources will be sorted as specified
    # + fieldsUserinvitations - the fields to include for returned resources of type userInvitations
    # + 'limit - maximum resources per page
    # + include - comma-separated list of relationships to include
    # + fieldsApps - the fields to include for returned resources of type apps
    # + limitVisibleapps - maximum number of related visibleApps returned (when they are included)
    # + return - List of UserInvitations
    remote isolated function userinvitationsGetCollection(string[]? filterEmail = (), string[]? filterRoles = (), string[]? filterVisibleapps = (), string[]? sort = (), string[]? fieldsUserinvitations = (), int? 'limit = (), string[]? include = (), string[]? fieldsApps = (), int? limitVisibleapps = ()) returns UserInvitationsResponse|error {
        string  path = string `/v1/userInvitations`;
        map<anydata> queryParam = {"filter[email]": filterEmail, "filter[roles]": filterRoles, "filter[visibleApps]": filterVisibleapps, "sort": sort, "fields[userInvitations]": fieldsUserinvitations, "limit": 'limit, "include": include, "fields[apps]": fieldsApps, "limit[visibleApps]": limitVisibleapps};
        path = path + check getPathForQueryParam(queryParam);
        UserInvitationsResponse response = check self.clientEp-> get(path, targetType = UserInvitationsResponse);
        return response;
    }
    #
    # + payload - UserInvitation representation
    # + return - Single UserInvitation
    remote isolated function userinvitationsCreateInstance(UserInvitationCreateRequest payload) returns UserInvitationResponse|error {
        string  path = string `/v1/userInvitations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserInvitationResponse response = check self.clientEp->post(path, request, targetType=UserInvitationResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsUserinvitations - the fields to include for returned resources of type userInvitations
    # + include - comma-separated list of relationships to include
    # + fieldsApps - the fields to include for returned resources of type apps
    # + limitVisibleapps - maximum number of related visibleApps returned (when they are included)
    # + return - Single UserInvitation
    remote isolated function userinvitationsGetInstance(string id, string[]? fieldsUserinvitations = (), string[]? include = (), string[]? fieldsApps = (), int? limitVisibleapps = ()) returns UserInvitationResponse|error {
        string  path = string `/v1/userInvitations/${id}`;
        map<anydata> queryParam = {"fields[userInvitations]": fieldsUserinvitations, "include": include, "fields[apps]": fieldsApps, "limit[visibleApps]": limitVisibleapps};
        path = path + check getPathForQueryParam(queryParam);
        UserInvitationResponse response = check self.clientEp-> get(path, targetType = UserInvitationResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + return - Success (no content)
    remote isolated function userinvitationsDeleteInstance(string id) returns http:Response|error {
        string  path = string `/v1/userInvitations/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    #
    # + filterRoles - filter by attribute 'roles'
    # + filterUsername - filter by attribute 'username'
    # + filterVisibleapps - filter by id(s) of related 'visibleApps'
    # + sort - comma-separated list of sort expressions; resources will be sorted as specified
    # + fieldsUsers - the fields to include for returned resources of type users
    # + 'limit - maximum resources per page
    # + include - comma-separated list of relationships to include
    # + fieldsApps - the fields to include for returned resources of type apps
    # + limitVisibleapps - maximum number of related visibleApps returned (when they are included)
    # + return - List of Users
    remote isolated function usersGetCollection(string[]? filterRoles = (), string[]? filterUsername = (), string[]? filterVisibleapps = (), string[]? sort = (), string[]? fieldsUsers = (), int? 'limit = (), string[]? include = (), string[]? fieldsApps = (), int? limitVisibleapps = ()) returns UsersResponse|error {
        string  path = string `/v1/users`;
        map<anydata> queryParam = {"filter[roles]": filterRoles, "filter[username]": filterUsername, "filter[visibleApps]": filterVisibleapps, "sort": sort, "fields[users]": fieldsUsers, "limit": 'limit, "include": include, "fields[apps]": fieldsApps, "limit[visibleApps]": limitVisibleapps};
        path = path + check getPathForQueryParam(queryParam);
        UsersResponse response = check self.clientEp-> get(path, targetType = UsersResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsUsers - the fields to include for returned resources of type users
    # + include - comma-separated list of relationships to include
    # + fieldsApps - the fields to include for returned resources of type apps
    # + limitVisibleapps - maximum number of related visibleApps returned (when they are included)
    # + return - Single User
    remote isolated function usersGetInstance(string id, string[]? fieldsUsers = (), string[]? include = (), string[]? fieldsApps = (), int? limitVisibleapps = ()) returns UserResponse|error {
        string  path = string `/v1/users/${id}`;
        map<anydata> queryParam = {"fields[users]": fieldsUsers, "include": include, "fields[apps]": fieldsApps, "limit[visibleApps]": limitVisibleapps};
        path = path + check getPathForQueryParam(queryParam);
        UserResponse response = check self.clientEp-> get(path, targetType = UserResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + return - Success (no content)
    remote isolated function usersDeleteInstance(string id) returns http:Response|error {
        string  path = string `/v1/users/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - User representation
    # + return - Single User
    remote isolated function usersUpdateInstance(string id, UserUpdateRequest payload) returns UserResponse|error {
        string  path = string `/v1/users/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserResponse response = check self.clientEp->patch(path, request, targetType=UserResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories
    # + return - Related resource
    remote isolated function appcategoriesParentGetToOneRelated(string id, string[]? fieldsAppcategories = ()) returns AppCategoryResponse|error {
        string  path = string `/v1/appCategories/${id}/parent`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories};
        path = path + check getPathForQueryParam(queryParam);
        AppCategoryResponse response = check self.clientEp-> get(path, targetType = AppCategoryResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function appcategoriesSubcategoriesGetToManyRelated(string id, string[]? fieldsAppcategories = (), int? 'limit = ()) returns AppCategoriesResponse|error {
        string  path = string `/v1/appCategories/${id}/subcategories`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        AppCategoriesResponse response = check self.clientEp-> get(path, targetType = AppCategoriesResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsAgeratingdeclarations - the fields to include for returned resources of type ageRatingDeclarations
    # + return - Related resource
    remote isolated function appinfosAgeratingdeclarationGetToOneRelated(string id, string[]? fieldsAgeratingdeclarations = ()) returns AgeRatingDeclarationResponse|error {
        string  path = string `/v1/appInfos/${id}/ageRatingDeclaration`;
        map<anydata> queryParam = {"fields[ageRatingDeclarations]": fieldsAgeratingdeclarations};
        path = path + check getPathForQueryParam(queryParam);
        AgeRatingDeclarationResponse response = check self.clientEp-> get(path, targetType = AgeRatingDeclarationResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + filterLocale - filter by attribute 'locale'
    # + fieldsAppinfos - the fields to include for returned resources of type appInfos
    # + fieldsAppinfolocalizations - the fields to include for returned resources of type appInfoLocalizations
    # + 'limit - maximum resources per page
    # + include - comma-separated list of relationships to include
    # + return - List of related resources
    remote isolated function appinfosAppinfolocalizationsGetToManyRelated(string id, string[]? filterLocale = (), string[]? fieldsAppinfos = (), string[]? fieldsAppinfolocalizations = (), int? 'limit = (), string[]? include = ()) returns AppInfoLocalizationsResponse|error {
        string  path = string `/v1/appInfos/${id}/appInfoLocalizations`;
        map<anydata> queryParam = {"filter[locale]": filterLocale, "fields[appInfos]": fieldsAppinfos, "fields[appInfoLocalizations]": fieldsAppinfolocalizations, "limit": 'limit, "include": include};
        path = path + check getPathForQueryParam(queryParam);
        AppInfoLocalizationsResponse response = check self.clientEp-> get(path, targetType = AppInfoLocalizationsResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories
    # + return - Related resource
    remote isolated function appinfosPrimarycategoryGetToOneRelated(string id, string[]? fieldsAppcategories = ()) returns AppCategoryResponse|error {
        string  path = string `/v1/appInfos/${id}/primaryCategory`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories};
        path = path + check getPathForQueryParam(queryParam);
        AppCategoryResponse response = check self.clientEp-> get(path, targetType = AppCategoryResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories
    # + return - Related resource
    remote isolated function appinfosPrimarysubcategoryoneGetToOneRelated(string id, string[]? fieldsAppcategories = ()) returns AppCategoryResponse|error {
        string  path = string `/v1/appInfos/${id}/primarySubcategoryOne`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories};
        path = path + check getPathForQueryParam(queryParam);
        AppCategoryResponse response = check self.clientEp-> get(path, targetType = AppCategoryResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories
    # + return - Related resource
    remote isolated function appinfosPrimarysubcategorytwoGetToOneRelated(string id, string[]? fieldsAppcategories = ()) returns AppCategoryResponse|error {
        string  path = string `/v1/appInfos/${id}/primarySubcategoryTwo`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories};
        path = path + check getPathForQueryParam(queryParam);
        AppCategoryResponse response = check self.clientEp-> get(path, targetType = AppCategoryResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories
    # + return - Related resource
    remote isolated function appinfosSecondarycategoryGetToOneRelated(string id, string[]? fieldsAppcategories = ()) returns AppCategoryResponse|error {
        string  path = string `/v1/appInfos/${id}/secondaryCategory`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories};
        path = path + check getPathForQueryParam(queryParam);
        AppCategoryResponse response = check self.clientEp-> get(path, targetType = AppCategoryResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories
    # + return - Related resource
    remote isolated function appinfosSecondarysubcategoryoneGetToOneRelated(string id, string[]? fieldsAppcategories = ()) returns AppCategoryResponse|error {
        string  path = string `/v1/appInfos/${id}/secondarySubcategoryOne`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories};
        path = path + check getPathForQueryParam(queryParam);
        AppCategoryResponse response = check self.clientEp-> get(path, targetType = AppCategoryResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories
    # + return - Related resource
    remote isolated function appinfosSecondarysubcategorytwoGetToOneRelated(string id, string[]? fieldsAppcategories = ()) returns AppCategoryResponse|error {
        string  path = string `/v1/appInfos/${id}/secondarySubcategoryTwo`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories};
        path = path + check getPathForQueryParam(queryParam);
        AppCategoryResponse response = check self.clientEp-> get(path, targetType = AppCategoryResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsTerritories - the fields to include for returned resources of type territories
    # + return - Related resource
    remote isolated function apppricepointsTerritoryGetToOneRelated(string id, string[]? fieldsTerritories = ()) returns TerritoryResponse|error {
        string  path = string `/v1/appPricePoints/${id}/territory`;
        map<anydata> queryParam = {"fields[territories]": fieldsTerritories};
        path = path + check getPathForQueryParam(queryParam);
        TerritoryResponse response = check self.clientEp-> get(path, targetType = TerritoryResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsApppricepoints - the fields to include for returned resources of type appPricePoints
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function apppricetiersPricepointsGetToManyRelated(string id, string[]? fieldsApppricepoints = (), int? 'limit = ()) returns AppPricePointsResponse|error {
        string  path = string `/v1/appPriceTiers/${id}/pricePoints`;
        map<anydata> queryParam = {"fields[appPricePoints]": fieldsApppricepoints, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        AppPricePointsResponse response = check self.clientEp-> get(path, targetType = AppPricePointsResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsAgeratingdeclarations - the fields to include for returned resources of type ageRatingDeclarations
    # + fieldsAppinfos - the fields to include for returned resources of type appInfos
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories
    # + fieldsAppinfolocalizations - the fields to include for returned resources of type appInfoLocalizations
    # + fieldsApps - the fields to include for returned resources of type apps
    # + 'limit - maximum resources per page
    # + include - comma-separated list of relationships to include
    # + return - List of related resources
    remote isolated function appsAppinfosGetToManyRelated(string id, string[]? fieldsAgeratingdeclarations = (), string[]? fieldsAppinfos = (), string[]? fieldsAppcategories = (), string[]? fieldsAppinfolocalizations = (), string[]? fieldsApps = (), int? 'limit = (), string[]? include = ()) returns AppInfosResponse|error {
        string  path = string `/v1/apps/${id}/appInfos`;
        map<anydata> queryParam = {"fields[ageRatingDeclarations]": fieldsAgeratingdeclarations, "fields[appInfos]": fieldsAppinfos, "fields[appCategories]": fieldsAppcategories, "fields[appInfoLocalizations]": fieldsAppinfolocalizations, "fields[apps]": fieldsApps, "limit": 'limit, "include": include};
        path = path + check getPathForQueryParam(queryParam);
        AppInfosResponse response = check self.clientEp-> get(path, targetType = AppInfosResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + filterAppstorestate - filter by attribute 'appStoreState'
    # + filterPlatform - filter by attribute 'platform'
    # + filterVersionstring - filter by attribute 'versionString'
    # + filterId - filter by id(s)
    # + fieldsIdfadeclarations - the fields to include for returned resources of type idfaDeclarations
    # + fieldsAppstoreversionlocalizations - the fields to include for returned resources of type appStoreVersionLocalizations
    # + fieldsRoutingappcoverages - the fields to include for returned resources of type routingAppCoverages
    # + fieldsAppstoreversionphasedreleases - the fields to include for returned resources of type appStoreVersionPhasedReleases
    # + fieldsAgeratingdeclarations - the fields to include for returned resources of type ageRatingDeclarations
    # + fieldsAppstorereviewdetails - the fields to include for returned resources of type appStoreReviewDetails
    # + fieldsAppstoreversions - the fields to include for returned resources of type appStoreVersions
    # + fieldsBuilds - the fields to include for returned resources of type builds
    # + fieldsAppstoreversionsubmissions - the fields to include for returned resources of type appStoreVersionSubmissions
    # + fieldsApps - the fields to include for returned resources of type apps
    # + 'limit - maximum resources per page
    # + include - comma-separated list of relationships to include
    # + return - List of related resources
    remote isolated function appsAppstoreversionsGetToManyRelated(string id, string[]? filterAppstorestate = (), string[]? filterPlatform = (), string[]? filterVersionstring = (), string[]? filterId = (), string[]? fieldsIdfadeclarations = (), string[]? fieldsAppstoreversionlocalizations = (), string[]? fieldsRoutingappcoverages = (), string[]? fieldsAppstoreversionphasedreleases = (), string[]? fieldsAgeratingdeclarations = (), string[]? fieldsAppstorereviewdetails = (), string[]? fieldsAppstoreversions = (), string[]? fieldsBuilds = (), string[]? fieldsAppstoreversionsubmissions = (), string[]? fieldsApps = (), int? 'limit = (), string[]? include = ()) returns AppStoreVersionsResponse|error {
        string  path = string `/v1/apps/${id}/appStoreVersions`;
        map<anydata> queryParam = {"filter[appStoreState]": filterAppstorestate, "filter[platform]": filterPlatform, "filter[versionString]": filterVersionstring, "filter[id]": filterId, "fields[idfaDeclarations]": fieldsIdfadeclarations, "fields[appStoreVersionLocalizations]": fieldsAppstoreversionlocalizations, "fields[routingAppCoverages]": fieldsRoutingappcoverages, "fields[appStoreVersionPhasedReleases]": fieldsAppstoreversionphasedreleases, "fields[ageRatingDeclarations]": fieldsAgeratingdeclarations, "fields[appStoreReviewDetails]": fieldsAppstorereviewdetails, "fields[appStoreVersions]": fieldsAppstoreversions, "fields[builds]": fieldsBuilds, "fields[appStoreVersionSubmissions]": fieldsAppstoreversionsubmissions, "fields[apps]": fieldsApps, "limit": 'limit, "include": include};
        path = path + check getPathForQueryParam(queryParam);
        AppStoreVersionsResponse response = check self.clientEp-> get(path, targetType = AppStoreVersionsResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsTerritories - the fields to include for returned resources of type territories
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function appsAvailableterritoriesGetToManyRelated(string id, string[]? fieldsTerritories = (), int? 'limit = ()) returns TerritoriesResponse|error {
        string  path = string `/v1/apps/${id}/availableTerritories`;
        map<anydata> queryParam = {"fields[territories]": fieldsTerritories, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        TerritoriesResponse response = check self.clientEp-> get(path, targetType = TerritoriesResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsBetaapplocalizations - the fields to include for returned resources of type betaAppLocalizations
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function appsBetaapplocalizationsGetToManyRelated(string id, string[]? fieldsBetaapplocalizations = (), int? 'limit = ()) returns BetaAppLocalizationsResponse|error {
        string  path = string `/v1/apps/${id}/betaAppLocalizations`;
        map<anydata> queryParam = {"fields[betaAppLocalizations]": fieldsBetaapplocalizations, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        BetaAppLocalizationsResponse response = check self.clientEp-> get(path, targetType = BetaAppLocalizationsResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsBetaappreviewdetails - the fields to include for returned resources of type betaAppReviewDetails
    # + return - Related resource
    remote isolated function appsBetaappreviewdetailGetToOneRelated(string id, string[]? fieldsBetaappreviewdetails = ()) returns BetaAppReviewDetailResponse|error {
        string  path = string `/v1/apps/${id}/betaAppReviewDetail`;
        map<anydata> queryParam = {"fields[betaAppReviewDetails]": fieldsBetaappreviewdetails};
        path = path + check getPathForQueryParam(queryParam);
        BetaAppReviewDetailResponse response = check self.clientEp-> get(path, targetType = BetaAppReviewDetailResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsBetagroups - the fields to include for returned resources of type betaGroups
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function appsBetagroupsGetToManyRelated(string id, string[]? fieldsBetagroups = (), int? 'limit = ()) returns BetaGroupsResponse|error {
        string  path = string `/v1/apps/${id}/betaGroups`;
        map<anydata> queryParam = {"fields[betaGroups]": fieldsBetagroups, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        BetaGroupsResponse response = check self.clientEp-> get(path, targetType = BetaGroupsResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsBetalicenseagreements - the fields to include for returned resources of type betaLicenseAgreements
    # + return - Related resource
    remote isolated function appsBetalicenseagreementGetToOneRelated(string id, string[]? fieldsBetalicenseagreements = ()) returns BetaLicenseAgreementResponse|error {
        string  path = string `/v1/apps/${id}/betaLicenseAgreement`;
        map<anydata> queryParam = {"fields[betaLicenseAgreements]": fieldsBetalicenseagreements};
        path = path + check getPathForQueryParam(queryParam);
        BetaLicenseAgreementResponse response = check self.clientEp-> get(path, targetType = BetaLicenseAgreementResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - List of related linkages
    # + return - Success (no content)
    remote isolated function appsBetatestersDeleteToManyRelationship(string id, AppBetaTestersLinkagesRequest payload) returns http:Response|error {
        string  path = string `/v1/apps/${id}/relationships/betaTesters`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->delete(path, request, targetType=http:Response);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsBuilds - the fields to include for returned resources of type builds
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function appsBuildsGetToManyRelated(string id, string[]? fieldsBuilds = (), int? 'limit = ()) returns BuildsResponse|error {
        string  path = string `/v1/apps/${id}/builds`;
        map<anydata> queryParam = {"fields[builds]": fieldsBuilds, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        BuildsResponse response = check self.clientEp-> get(path, targetType = BuildsResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsEnduserlicenseagreements - the fields to include for returned resources of type endUserLicenseAgreements
    # + return - Related resource
    remote isolated function appsEnduserlicenseagreementGetToOneRelated(string id, string[]? fieldsEnduserlicenseagreements = ()) returns EndUserLicenseAgreementResponse|error {
        string  path = string `/v1/apps/${id}/endUserLicenseAgreement`;
        map<anydata> queryParam = {"fields[endUserLicenseAgreements]": fieldsEnduserlicenseagreements};
        path = path + check getPathForQueryParam(queryParam);
        EndUserLicenseAgreementResponse response = check self.clientEp-> get(path, targetType = EndUserLicenseAgreementResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + filterPlatform - filter by attribute 'platform'
    # + filterVersionstring - filter by attribute 'versionString'
    # + filterId - filter by id(s)
    # + sort - comma-separated list of sort expressions; resources will be sorted as specified
    # + fieldsGamecenterenabledversions - the fields to include for returned resources of type gameCenterEnabledVersions
    # + fieldsApps - the fields to include for returned resources of type apps
    # + 'limit - maximum resources per page
    # + include - comma-separated list of relationships to include
    # + return - List of related resources
    remote isolated function appsGamecenterenabledversionsGetToManyRelated(string id, string[]? filterPlatform = (), string[]? filterVersionstring = (), string[]? filterId = (), string[]? sort = (), string[]? fieldsGamecenterenabledversions = (), string[]? fieldsApps = (), int? 'limit = (), string[]? include = ()) returns GameCenterEnabledVersionsResponse|error {
        string  path = string `/v1/apps/${id}/gameCenterEnabledVersions`;
        map<anydata> queryParam = {"filter[platform]": filterPlatform, "filter[versionString]": filterVersionstring, "filter[id]": filterId, "sort": sort, "fields[gameCenterEnabledVersions]": fieldsGamecenterenabledversions, "fields[apps]": fieldsApps, "limit": 'limit, "include": include};
        path = path + check getPathForQueryParam(queryParam);
        GameCenterEnabledVersionsResponse response = check self.clientEp-> get(path, targetType = GameCenterEnabledVersionsResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + filterInapppurchasetype - filter by attribute 'inAppPurchaseType'
    # + filterCanbesubmitted - filter by canBeSubmitted
    # + sort - comma-separated list of sort expressions; resources will be sorted as specified
    # + fieldsInapppurchases - the fields to include for returned resources of type inAppPurchases
    # + fieldsApps - the fields to include for returned resources of type apps
    # + 'limit - maximum resources per page
    # + include - comma-separated list of relationships to include
    # + return - List of related resources
    remote isolated function appsInapppurchasesGetToManyRelated(string id, string[]? filterInapppurchasetype = (), string[]? filterCanbesubmitted = (), string[]? sort = (), string[]? fieldsInapppurchases = (), string[]? fieldsApps = (), int? 'limit = (), string[]? include = ()) returns InAppPurchasesResponse|error {
        string  path = string `/v1/apps/${id}/inAppPurchases`;
        map<anydata> queryParam = {"filter[inAppPurchaseType]": filterInapppurchasetype, "filter[canBeSubmitted]": filterCanbesubmitted, "sort": sort, "fields[inAppPurchases]": fieldsInapppurchases, "fields[apps]": fieldsApps, "limit": 'limit, "include": include};
        path = path + check getPathForQueryParam(queryParam);
        InAppPurchasesResponse response = check self.clientEp-> get(path, targetType = InAppPurchasesResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + filterDevicetype - filter by attribute 'deviceType'
    # + filterMetrictype - filter by attribute 'metricType'
    # + filterPlatform - filter by attribute 'platform'
    # + return - List of related resources
    remote isolated function appsPerfpowermetricsGetToManyRelated(string id, string[]? filterDevicetype = (), string[]? filterMetrictype = (), string[]? filterPlatform = ()) returns PerfPowerMetricsResponse|error {
        string  path = string `/v1/apps/${id}/perfPowerMetrics`;
        map<anydata> queryParam = {"filter[deviceType]": filterDevicetype, "filter[metricType]": filterMetrictype, "filter[platform]": filterPlatform};
        path = path + check getPathForQueryParam(queryParam);
        PerfPowerMetricsResponse response = check self.clientEp-> get(path, targetType = PerfPowerMetricsResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsApppreorders - the fields to include for returned resources of type appPreOrders
    # + return - Related resource
    remote isolated function appsPreorderGetToOneRelated(string id, string[]? fieldsApppreorders = ()) returns AppPreOrderResponse|error {
        string  path = string `/v1/apps/${id}/preOrder`;
        map<anydata> queryParam = {"fields[appPreOrders]": fieldsApppreorders};
        path = path + check getPathForQueryParam(queryParam);
        AppPreOrderResponse response = check self.clientEp-> get(path, targetType = AppPreOrderResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsPrereleaseversions - the fields to include for returned resources of type preReleaseVersions
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function appsPrereleaseversionsGetToManyRelated(string id, string[]? fieldsPrereleaseversions = (), int? 'limit = ()) returns PreReleaseVersionsResponse|error {
        string  path = string `/v1/apps/${id}/preReleaseVersions`;
        map<anydata> queryParam = {"fields[preReleaseVersions]": fieldsPrereleaseversions, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        PreReleaseVersionsResponse response = check self.clientEp-> get(path, targetType = PreReleaseVersionsResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsAppprices - the fields to include for returned resources of type appPrices
    # + fieldsApppricetiers - the fields to include for returned resources of type appPriceTiers
    # + fieldsApps - the fields to include for returned resources of type apps
    # + 'limit - maximum resources per page
    # + include - comma-separated list of relationships to include
    # + return - List of related resources
    remote isolated function appsPricesGetToManyRelated(string id, string[]? fieldsAppprices = (), string[]? fieldsApppricetiers = (), string[]? fieldsApps = (), int? 'limit = (), string[]? include = ()) returns AppPricesResponse|error {
        string  path = string `/v1/apps/${id}/prices`;
        map<anydata> queryParam = {"fields[appPrices]": fieldsAppprices, "fields[appPriceTiers]": fieldsApppricetiers, "fields[apps]": fieldsApps, "limit": 'limit, "include": include};
        path = path + check getPathForQueryParam(queryParam);
        AppPricesResponse response = check self.clientEp-> get(path, targetType = AppPricesResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsApps - the fields to include for returned resources of type apps
    # + return - Related resource
    remote isolated function buildsAppGetToOneRelated(string id, string[]? fieldsApps = ()) returns AppResponse|error {
        string  path = string `/v1/builds/${id}/app`;
        map<anydata> queryParam = {"fields[apps]": fieldsApps};
        path = path + check getPathForQueryParam(queryParam);
        AppResponse response = check self.clientEp-> get(path, targetType = AppResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + return - Related linkage
    remote isolated function buildsAppencryptiondeclarationGetToOneRelationship(string id) returns BuildAppEncryptionDeclarationLinkageResponse|error {
        string  path = string `/v1/builds/${id}/relationships/appEncryptionDeclaration`;
        BuildAppEncryptionDeclarationLinkageResponse response = check self.clientEp-> get(path, targetType = BuildAppEncryptionDeclarationLinkageResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - Related linkage
    # + return - Success (no content)
    remote isolated function buildsAppencryptiondeclarationUpdateToOneRelationship(string id, BuildAppEncryptionDeclarationLinkageRequest payload) returns http:Response|error {
        string  path = string `/v1/builds/${id}/relationships/appEncryptionDeclaration`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType=http:Response);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsAppencryptiondeclarations - the fields to include for returned resources of type appEncryptionDeclarations
    # + return - Related resource
    remote isolated function buildsAppencryptiondeclarationGetToOneRelated(string id, string[]? fieldsAppencryptiondeclarations = ()) returns AppEncryptionDeclarationResponse|error {
        string  path = string `/v1/builds/${id}/appEncryptionDeclaration`;
        map<anydata> queryParam = {"fields[appEncryptionDeclarations]": fieldsAppencryptiondeclarations};
        path = path + check getPathForQueryParam(queryParam);
        AppEncryptionDeclarationResponse response = check self.clientEp-> get(path, targetType = AppEncryptionDeclarationResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsAppstoreversions - the fields to include for returned resources of type appStoreVersions
    # + return - Related resource
    remote isolated function buildsAppstoreversionGetToOneRelated(string id, string[]? fieldsAppstoreversions = ()) returns AppStoreVersionResponse|error {
        string  path = string `/v1/builds/${id}/appStoreVersion`;
        map<anydata> queryParam = {"fields[appStoreVersions]": fieldsAppstoreversions};
        path = path + check getPathForQueryParam(queryParam);
        AppStoreVersionResponse response = check self.clientEp-> get(path, targetType = AppStoreVersionResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsBetaappreviewsubmissions - the fields to include for returned resources of type betaAppReviewSubmissions
    # + return - Related resource
    remote isolated function buildsBetaappreviewsubmissionGetToOneRelated(string id, string[]? fieldsBetaappreviewsubmissions = ()) returns BetaAppReviewSubmissionResponse|error {
        string  path = string `/v1/builds/${id}/betaAppReviewSubmission`;
        map<anydata> queryParam = {"fields[betaAppReviewSubmissions]": fieldsBetaappreviewsubmissions};
        path = path + check getPathForQueryParam(queryParam);
        BetaAppReviewSubmissionResponse response = check self.clientEp-> get(path, targetType = BetaAppReviewSubmissionResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsBetabuildlocalizations - the fields to include for returned resources of type betaBuildLocalizations
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function buildsBetabuildlocalizationsGetToManyRelated(string id, string[]? fieldsBetabuildlocalizations = (), int? 'limit = ()) returns BetaBuildLocalizationsResponse|error {
        string  path = string `/v1/builds/${id}/betaBuildLocalizations`;
        map<anydata> queryParam = {"fields[betaBuildLocalizations]": fieldsBetabuildlocalizations, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        BetaBuildLocalizationsResponse response = check self.clientEp-> get(path, targetType = BetaBuildLocalizationsResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - List of related linkages
    # + return - Success (no content)
    remote isolated function buildsBetagroupsCreateToManyRelationship(string id, BuildBetaGroupsLinkagesRequest payload) returns http:Response|error {
        string  path = string `/v1/builds/${id}/relationships/betaGroups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - List of related linkages
    # + return - Success (no content)
    remote isolated function buildsBetagroupsDeleteToManyRelationship(string id, BuildBetaGroupsLinkagesRequest payload) returns http:Response|error {
        string  path = string `/v1/builds/${id}/relationships/betaGroups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->delete(path, request, targetType=http:Response);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsBuildbetadetails - the fields to include for returned resources of type buildBetaDetails
    # + return - Related resource
    remote isolated function buildsBuildbetadetailGetToOneRelated(string id, string[]? fieldsBuildbetadetails = ()) returns BuildBetaDetailResponse|error {
        string  path = string `/v1/builds/${id}/buildBetaDetail`;
        map<anydata> queryParam = {"fields[buildBetaDetails]": fieldsBuildbetadetails};
        path = path + check getPathForQueryParam(queryParam);
        BuildBetaDetailResponse response = check self.clientEp-> get(path, targetType = BuildBetaDetailResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + filterDiagnostictype - filter by attribute 'diagnosticType'
    # + fieldsDiagnosticsignatures - the fields to include for returned resources of type diagnosticSignatures
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function buildsDiagnosticsignaturesGetToManyRelated(string id, string[]? filterDiagnostictype = (), string[]? fieldsDiagnosticsignatures = (), int? 'limit = ()) returns DiagnosticSignaturesResponse|error {
        string  path = string `/v1/builds/${id}/diagnosticSignatures`;
        map<anydata> queryParam = {"filter[diagnosticType]": filterDiagnostictype, "fields[diagnosticSignatures]": fieldsDiagnosticsignatures, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        DiagnosticSignaturesResponse response = check self.clientEp-> get(path, targetType = DiagnosticSignaturesResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsBuildicons - the fields to include for returned resources of type buildIcons
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function buildsIconsGetToManyRelated(string id, string[]? fieldsBuildicons = (), int? 'limit = ()) returns BuildIconsResponse|error {
        string  path = string `/v1/builds/${id}/icons`;
        map<anydata> queryParam = {"fields[buildIcons]": fieldsBuildicons, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        BuildIconsResponse response = check self.clientEp-> get(path, targetType = BuildIconsResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + 'limit - maximum resources per page
    # + return - List of related linkages
    remote isolated function buildsIndividualtestersGetToManyRelationship(string id, int? 'limit = ()) returns BuildIndividualTestersLinkagesResponse|error {
        string  path = string `/v1/builds/${id}/relationships/individualTesters`;
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        BuildIndividualTestersLinkagesResponse response = check self.clientEp-> get(path, targetType = BuildIndividualTestersLinkagesResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - List of related linkages
    # + return - Success (no content)
    remote isolated function buildsIndividualtestersCreateToManyRelationship(string id, BuildIndividualTestersLinkagesRequest payload) returns http:Response|error {
        string  path = string `/v1/builds/${id}/relationships/individualTesters`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - List of related linkages
    # + return - Success (no content)
    remote isolated function buildsIndividualtestersDeleteToManyRelationship(string id, BuildIndividualTestersLinkagesRequest payload) returns http:Response|error {
        string  path = string `/v1/builds/${id}/relationships/individualTesters`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->delete(path, request, targetType=http:Response);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsBetatesters - the fields to include for returned resources of type betaTesters
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function buildsIndividualtestersGetToManyRelated(string id, string[]? fieldsBetatesters = (), int? 'limit = ()) returns BetaTestersResponse|error {
        string  path = string `/v1/builds/${id}/individualTesters`;
        map<anydata> queryParam = {"fields[betaTesters]": fieldsBetatesters, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        BetaTestersResponse response = check self.clientEp-> get(path, targetType = BetaTestersResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + filterDevicetype - filter by attribute 'deviceType'
    # + filterMetrictype - filter by attribute 'metricType'
    # + filterPlatform - filter by attribute 'platform'
    # + return - List of related resources
    remote isolated function buildsPerfpowermetricsGetToManyRelated(string id, string[]? filterDevicetype = (), string[]? filterMetrictype = (), string[]? filterPlatform = ()) returns PerfPowerMetricsResponse|error {
        string  path = string `/v1/builds/${id}/perfPowerMetrics`;
        map<anydata> queryParam = {"filter[deviceType]": filterDevicetype, "filter[metricType]": filterMetrictype, "filter[platform]": filterPlatform};
        path = path + check getPathForQueryParam(queryParam);
        PerfPowerMetricsResponse response = check self.clientEp-> get(path, targetType = PerfPowerMetricsResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsPrereleaseversions - the fields to include for returned resources of type preReleaseVersions
    # + return - Related resource
    remote isolated function buildsPrereleaseversionGetToOneRelated(string id, string[]? fieldsPrereleaseversions = ()) returns PrereleaseVersionResponse|error {
        string  path = string `/v1/builds/${id}/preReleaseVersion`;
        map<anydata> queryParam = {"fields[preReleaseVersions]": fieldsPrereleaseversions};
        path = path + check getPathForQueryParam(queryParam);
        PrereleaseVersionResponse response = check self.clientEp-> get(path, targetType = PrereleaseVersionResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsApps - the fields to include for returned resources of type apps
    # + return - Related resource
    remote isolated function bundleidsAppGetToOneRelated(string id, string[]? fieldsApps = ()) returns AppResponse|error {
        string  path = string `/v1/bundleIds/${id}/app`;
        map<anydata> queryParam = {"fields[apps]": fieldsApps};
        path = path + check getPathForQueryParam(queryParam);
        AppResponse response = check self.clientEp-> get(path, targetType = AppResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsBundleidcapabilities - the fields to include for returned resources of type bundleIdCapabilities
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function bundleidsBundleidcapabilitiesGetToManyRelated(string id, string[]? fieldsBundleidcapabilities = (), int? 'limit = ()) returns BundleIdCapabilitiesResponse|error {
        string  path = string `/v1/bundleIds/${id}/bundleIdCapabilities`;
        map<anydata> queryParam = {"fields[bundleIdCapabilities]": fieldsBundleidcapabilities, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        BundleIdCapabilitiesResponse response = check self.clientEp-> get(path, targetType = BundleIdCapabilitiesResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsProfiles - the fields to include for returned resources of type profiles
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function bundleidsProfilesGetToManyRelated(string id, string[]? fieldsProfiles = (), int? 'limit = ()) returns ProfilesResponse|error {
        string  path = string `/v1/bundleIds/${id}/profiles`;
        map<anydata> queryParam = {"fields[profiles]": fieldsProfiles, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        ProfilesResponse response = check self.clientEp-> get(path, targetType = ProfilesResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsTerritories - the fields to include for returned resources of type territories
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function enduserlicenseagreementsTerritoriesGetToManyRelated(string id, string[]? fieldsTerritories = (), int? 'limit = ()) returns TerritoriesResponse|error {
        string  path = string `/v1/endUserLicenseAgreements/${id}/territories`;
        map<anydata> queryParam = {"fields[territories]": fieldsTerritories, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        TerritoriesResponse response = check self.clientEp-> get(path, targetType = TerritoriesResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + 'limit - maximum resources per page
    # + return - List of related linkages
    remote isolated function gamecenterenabledversionsCompatibleversionsGetToManyRelationship(string id, int? 'limit = ()) returns GameCenterEnabledVersionCompatibleVersionsLinkagesResponse|error {
        string  path = string `/v1/gameCenterEnabledVersions/${id}/relationships/compatibleVersions`;
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        GameCenterEnabledVersionCompatibleVersionsLinkagesResponse response = check self.clientEp-> get(path, targetType = GameCenterEnabledVersionCompatibleVersionsLinkagesResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - List of related linkages
    # + return - Success (no content)
    remote isolated function gamecenterenabledversionsCompatibleversionsCreateToManyRelationship(string id, GameCenterEnabledVersionCompatibleVersionsLinkagesRequest payload) returns http:Response|error {
        string  path = string `/v1/gameCenterEnabledVersions/${id}/relationships/compatibleVersions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - List of related linkages
    # + return - Success (no content)
    remote isolated function gamecenterenabledversionsCompatibleversionsDeleteToManyRelationship(string id, GameCenterEnabledVersionCompatibleVersionsLinkagesRequest payload) returns http:Response|error {
        string  path = string `/v1/gameCenterEnabledVersions/${id}/relationships/compatibleVersions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->delete(path, request, targetType=http:Response);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - List of related linkages
    # + return - Success (no content)
    remote isolated function gamecenterenabledversionsCompatibleversionsReplaceToManyRelationship(string id, GameCenterEnabledVersionCompatibleVersionsLinkagesRequest payload) returns http:Response|error {
        string  path = string `/v1/gameCenterEnabledVersions/${id}/relationships/compatibleVersions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType=http:Response);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + filterPlatform - filter by attribute 'platform'
    # + filterVersionstring - filter by attribute 'versionString'
    # + filterApp - filter by id(s) of related 'app'
    # + filterId - filter by id(s)
    # + sort - comma-separated list of sort expressions; resources will be sorted as specified
    # + fieldsGamecenterenabledversions - the fields to include for returned resources of type gameCenterEnabledVersions
    # + fieldsApps - the fields to include for returned resources of type apps
    # + 'limit - maximum resources per page
    # + include - comma-separated list of relationships to include
    # + return - List of related resources
    remote isolated function gamecenterenabledversionsCompatibleversionsGetToManyRelated(string id, string[]? filterPlatform = (), string[]? filterVersionstring = (), string[]? filterApp = (), string[]? filterId = (), string[]? sort = (), string[]? fieldsGamecenterenabledversions = (), string[]? fieldsApps = (), int? 'limit = (), string[]? include = ()) returns GameCenterEnabledVersionsResponse|error {
        string  path = string `/v1/gameCenterEnabledVersions/${id}/compatibleVersions`;
        map<anydata> queryParam = {"filter[platform]": filterPlatform, "filter[versionString]": filterVersionstring, "filter[app]": filterApp, "filter[id]": filterId, "sort": sort, "fields[gameCenterEnabledVersions]": fieldsGamecenterenabledversions, "fields[apps]": fieldsApps, "limit": 'limit, "include": include};
        path = path + check getPathForQueryParam(queryParam);
        GameCenterEnabledVersionsResponse response = check self.clientEp-> get(path, targetType = GameCenterEnabledVersionsResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsBundleids - the fields to include for returned resources of type bundleIds
    # + return - Related resource
    remote isolated function profilesBundleidGetToOneRelated(string id, string[]? fieldsBundleids = ()) returns BundleIdResponse|error {
        string  path = string `/v1/profiles/${id}/bundleId`;
        map<anydata> queryParam = {"fields[bundleIds]": fieldsBundleids};
        path = path + check getPathForQueryParam(queryParam);
        BundleIdResponse response = check self.clientEp-> get(path, targetType = BundleIdResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsCertificates - the fields to include for returned resources of type certificates
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function profilesCertificatesGetToManyRelated(string id, string[]? fieldsCertificates = (), int? 'limit = ()) returns CertificatesResponse|error {
        string  path = string `/v1/profiles/${id}/certificates`;
        map<anydata> queryParam = {"fields[certificates]": fieldsCertificates, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        CertificatesResponse response = check self.clientEp-> get(path, targetType = CertificatesResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsDevices - the fields to include for returned resources of type devices
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function profilesDevicesGetToManyRelated(string id, string[]? fieldsDevices = (), int? 'limit = ()) returns DevicesResponse|error {
        string  path = string `/v1/profiles/${id}/devices`;
        map<anydata> queryParam = {"fields[devices]": fieldsDevices, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        DevicesResponse response = check self.clientEp-> get(path, targetType = DevicesResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsApps - the fields to include for returned resources of type apps
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function userinvitationsVisibleappsGetToManyRelated(string id, string[]? fieldsApps = (), int? 'limit = ()) returns AppsResponse|error {
        string  path = string `/v1/userInvitations/${id}/visibleApps`;
        map<anydata> queryParam = {"fields[apps]": fieldsApps, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        AppsResponse response = check self.clientEp-> get(path, targetType = AppsResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + 'limit - maximum resources per page
    # + return - List of related linkages
    remote isolated function usersVisibleappsGetToManyRelationship(string id, int? 'limit = ()) returns UserVisibleAppsLinkagesResponse|error {
        string  path = string `/v1/users/${id}/relationships/visibleApps`;
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        UserVisibleAppsLinkagesResponse response = check self.clientEp-> get(path, targetType = UserVisibleAppsLinkagesResponse);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - List of related linkages
    # + return - Success (no content)
    remote isolated function usersVisibleappsCreateToManyRelationship(string id, UserVisibleAppsLinkagesRequest payload) returns http:Response|error {
        string  path = string `/v1/users/${id}/relationships/visibleApps`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - List of related linkages
    # + return - Success (no content)
    remote isolated function usersVisibleappsDeleteToManyRelationship(string id, UserVisibleAppsLinkagesRequest payload) returns http:Response|error {
        string  path = string `/v1/users/${id}/relationships/visibleApps`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->delete(path, request, targetType=http:Response);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + payload - List of related linkages
    # + return - Success (no content)
    remote isolated function usersVisibleappsReplaceToManyRelationship(string id, UserVisibleAppsLinkagesRequest payload) returns http:Response|error {
        string  path = string `/v1/users/${id}/relationships/visibleApps`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType=http:Response);
        return response;
    }
    #
    # + id - the id of the requested resource
    # + fieldsApps - the fields to include for returned resources of type apps
    # + 'limit - maximum resources per page
    # + return - List of related resources
    remote isolated function usersVisibleappsGetToManyRelated(string id, string[]? fieldsApps = (), int? 'limit = ()) returns AppsResponse|error {
        string  path = string `/v1/users/${id}/visibleApps`;
        map<anydata> queryParam = {"fields[apps]": fieldsApps, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        AppsResponse response = check self.clientEp-> get(path, targetType = AppsResponse);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
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
