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

# This is a generated connector for [App Store Connect API v1.4.1](https://developer.apple.com/documentation/appstoreconnectapi) OpenAPI Specification.
# The App Store Connect API enables the automation of actions you take in App Store Connect. 
@display {label: "Apple App Store", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [App Store Connect account](https://appstoreconnect.apple.com/)  and obtain tokens following [this guide](https://developer.apple.com/documentation/appstoreconnectapi/creating_api_keys_for_app_store_connect_api).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.appstoreconnect.apple.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    #
    # + id - the id of the requested resource 
    # + payload - AgeRatingDeclaration representation 
    # + return - Single AgeRatingDeclaration 
    remote isolated function ageratingdeclarationsUpdateInstance(string id, AgeRatingDeclarationUpdateRequest payload) returns AgeRatingDeclarationResponse|error {
        string resourcePath = string `/v1/ageRatingDeclarations/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AgeRatingDeclarationResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
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
        string resourcePath = string `/v1/appCategories`;
        map<anydata> queryParam = {"filter[platforms]": filterPlatforms, "exists[parent]": existsParent, "fields[appCategories]": fieldsAppcategories, "limit": 'limit, "include": include, "limit[subcategories]": limitSubcategories};
        map<Encoding> queryParamEncoding = {"filter[platforms]": {style: FORM, explode: false}, "exists[parent]": {style: FORM, explode: false}, "fields[appCategories]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppCategoriesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories 
    # + include - comma-separated list of relationships to include 
    # + limitSubcategories - maximum number of related subcategories returned (when they are included) 
    # + return - Single AppCategory 
    remote isolated function appcategoriesGetInstance(string id, string[]? fieldsAppcategories = (), string[]? include = (), int? limitSubcategories = ()) returns AppCategoryResponse|error {
        string resourcePath = string `/v1/appCategories/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories, "include": include, "limit[subcategories]": limitSubcategories};
        map<Encoding> queryParamEncoding = {"fields[appCategories]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppCategoryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + filterPlatform - filter by attribute 'platform' 
    # + filterApp - filter by id(s) of related 'app' 
    # + filterBuilds - filter by id(s) of related 'builds' 
    # + fieldsAppencryptiondeclarations - the fields to include for returned resources of type appEncryptionDeclarations 
    # + 'limit - maximum resources per page 
    # + include - comma-separated list of relationships to include 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + return - List of AppEncryptionDeclarations 
    remote isolated function appencryptiondeclarationsGetCollection(string[]? filterPlatform = (), string[]? filterApp = (), string[]? filterBuilds = (), string[]? fieldsAppencryptiondeclarations = (), int? 'limit = (), string[]? include = (), string[]? fieldsApps = ()) returns AppEncryptionDeclarationsResponse|error {
        string resourcePath = string `/v1/appEncryptionDeclarations`;
        map<anydata> queryParam = {"filter[platform]": filterPlatform, "filter[app]": filterApp, "filter[builds]": filterBuilds, "fields[appEncryptionDeclarations]": fieldsAppencryptiondeclarations, "limit": 'limit, "include": include, "fields[apps]": fieldsApps};
        map<Encoding> queryParamEncoding = {"filter[platform]": {style: FORM, explode: false}, "filter[app]": {style: FORM, explode: false}, "filter[builds]": {style: FORM, explode: false}, "fields[appEncryptionDeclarations]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppEncryptionDeclarationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppencryptiondeclarations - the fields to include for returned resources of type appEncryptionDeclarations 
    # + include - comma-separated list of relationships to include 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + return - Single AppEncryptionDeclaration 
    remote isolated function appencryptiondeclarationsGetInstance(string id, string[]? fieldsAppencryptiondeclarations = (), string[]? include = (), string[]? fieldsApps = ()) returns AppEncryptionDeclarationResponse|error {
        string resourcePath = string `/v1/appEncryptionDeclarations/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[appEncryptionDeclarations]": fieldsAppencryptiondeclarations, "include": include, "fields[apps]": fieldsApps};
        map<Encoding> queryParamEncoding = {"fields[appEncryptionDeclarations]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppEncryptionDeclarationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + payload - AppInfoLocalization representation 
    # + return - Single AppInfoLocalization 
    remote isolated function appinfolocalizationsCreateInstance(AppInfoLocalizationCreateRequest payload) returns AppInfoLocalizationResponse|error {
        string resourcePath = string `/v1/appInfoLocalizations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppInfoLocalizationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppinfolocalizations - the fields to include for returned resources of type appInfoLocalizations 
    # + include - comma-separated list of relationships to include 
    # + return - Single AppInfoLocalization 
    remote isolated function appinfolocalizationsGetInstance(string id, string[]? fieldsAppinfolocalizations = (), string[]? include = ()) returns AppInfoLocalizationResponse|error {
        string resourcePath = string `/v1/appInfoLocalizations/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[appInfoLocalizations]": fieldsAppinfolocalizations, "include": include};
        map<Encoding> queryParamEncoding = {"fields[appInfoLocalizations]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppInfoLocalizationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function appinfolocalizationsDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/appInfoLocalizations/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - AppInfoLocalization representation 
    # + return - Single AppInfoLocalization 
    remote isolated function appinfolocalizationsUpdateInstance(string id, AppInfoLocalizationUpdateRequest payload) returns AppInfoLocalizationResponse|error {
        string resourcePath = string `/v1/appInfoLocalizations/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppInfoLocalizationResponse response = check self.clientEp->patch(resourcePath, request);
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
        string resourcePath = string `/v1/appInfos/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[appInfos]": fieldsAppinfos, "include": include, "fields[ageRatingDeclarations]": fieldsAgeratingdeclarations, "fields[appCategories]": fieldsAppcategories, "fields[appInfoLocalizations]": fieldsAppinfolocalizations, "limit[appInfoLocalizations]": limitAppinfolocalizations};
        map<Encoding> queryParamEncoding = {"fields[appInfos]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[ageRatingDeclarations]": {style: FORM, explode: false}, "fields[appCategories]": {style: FORM, explode: false}, "fields[appInfoLocalizations]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppInfoResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - AppInfo representation 
    # + return - Single AppInfo 
    remote isolated function appinfosUpdateInstance(string id, AppInfoUpdateRequest payload) returns AppInfoResponse|error {
        string resourcePath = string `/v1/appInfos/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppInfoResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + payload - AppPreOrder representation 
    # + return - Single AppPreOrder 
    remote isolated function apppreordersCreateInstance(AppPreOrderCreateRequest payload) returns AppPreOrderResponse|error {
        string resourcePath = string `/v1/appPreOrders`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppPreOrderResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApppreorders - the fields to include for returned resources of type appPreOrders 
    # + include - comma-separated list of relationships to include 
    # + return - Single AppPreOrder 
    remote isolated function apppreordersGetInstance(string id, string[]? fieldsApppreorders = (), string[]? include = ()) returns AppPreOrderResponse|error {
        string resourcePath = string `/v1/appPreOrders/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[appPreOrders]": fieldsApppreorders, "include": include};
        map<Encoding> queryParamEncoding = {"fields[appPreOrders]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppPreOrderResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function apppreordersDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/appPreOrders/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - AppPreOrder representation 
    # + return - Single AppPreOrder 
    remote isolated function apppreordersUpdateInstance(string id, AppPreOrderUpdateRequest payload) returns AppPreOrderResponse|error {
        string resourcePath = string `/v1/appPreOrders/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppPreOrderResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + payload - AppPreviewSet representation 
    # + return - Single AppPreviewSet 
    remote isolated function apppreviewsetsCreateInstance(AppPreviewSetCreateRequest payload) returns AppPreviewSetResponse|error {
        string resourcePath = string `/v1/appPreviewSets`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppPreviewSetResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApppreviewsets - the fields to include for returned resources of type appPreviewSets 
    # + include - comma-separated list of relationships to include 
    # + fieldsApppreviews - the fields to include for returned resources of type appPreviews 
    # + limitApppreviews - maximum number of related appPreviews returned (when they are included) 
    # + return - Single AppPreviewSet 
    remote isolated function apppreviewsetsGetInstance(string id, string[]? fieldsApppreviewsets = (), string[]? include = (), string[]? fieldsApppreviews = (), int? limitApppreviews = ()) returns AppPreviewSetResponse|error {
        string resourcePath = string `/v1/appPreviewSets/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[appPreviewSets]": fieldsApppreviewsets, "include": include, "fields[appPreviews]": fieldsApppreviews, "limit[appPreviews]": limitApppreviews};
        map<Encoding> queryParamEncoding = {"fields[appPreviewSets]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[appPreviews]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppPreviewSetResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function apppreviewsetsDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/appPreviewSets/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + payload - AppPreview representation 
    # + return - Single AppPreview 
    remote isolated function apppreviewsCreateInstance(AppPreviewCreateRequest payload) returns AppPreviewResponse|error {
        string resourcePath = string `/v1/appPreviews`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppPreviewResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApppreviews - the fields to include for returned resources of type appPreviews 
    # + include - comma-separated list of relationships to include 
    # + return - Single AppPreview 
    remote isolated function apppreviewsGetInstance(string id, string[]? fieldsApppreviews = (), string[]? include = ()) returns AppPreviewResponse|error {
        string resourcePath = string `/v1/appPreviews/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[appPreviews]": fieldsApppreviews, "include": include};
        map<Encoding> queryParamEncoding = {"fields[appPreviews]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppPreviewResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function apppreviewsDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/appPreviews/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - AppPreview representation 
    # + return - Single AppPreview 
    remote isolated function apppreviewsUpdateInstance(string id, AppPreviewUpdateRequest payload) returns AppPreviewResponse|error {
        string resourcePath = string `/v1/appPreviews/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppPreviewResponse response = check self.clientEp->patch(resourcePath, request);
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
        string resourcePath = string `/v1/appPricePoints`;
        map<anydata> queryParam = {"filter[priceTier]": filterPricetier, "filter[territory]": filterTerritory, "fields[appPricePoints]": fieldsApppricepoints, "limit": 'limit, "include": include, "fields[territories]": fieldsTerritories};
        map<Encoding> queryParamEncoding = {"filter[priceTier]": {style: FORM, explode: false}, "filter[territory]": {style: FORM, explode: false}, "fields[appPricePoints]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[territories]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppPricePointsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApppricepoints - the fields to include for returned resources of type appPricePoints 
    # + include - comma-separated list of relationships to include 
    # + fieldsTerritories - the fields to include for returned resources of type territories 
    # + return - Single AppPricePoint 
    remote isolated function apppricepointsGetInstance(string id, string[]? fieldsApppricepoints = (), string[]? include = (), string[]? fieldsTerritories = ()) returns AppPricePointResponse|error {
        string resourcePath = string `/v1/appPricePoints/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[appPricePoints]": fieldsApppricepoints, "include": include, "fields[territories]": fieldsTerritories};
        map<Encoding> queryParamEncoding = {"fields[appPricePoints]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[territories]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppPricePointResponse response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v1/appPriceTiers`;
        map<anydata> queryParam = {"filter[id]": filterId, "fields[appPriceTiers]": fieldsApppricetiers, "limit": 'limit, "include": include, "fields[appPricePoints]": fieldsApppricepoints, "limit[pricePoints]": limitPricepoints};
        map<Encoding> queryParamEncoding = {"filter[id]": {style: FORM, explode: false}, "fields[appPriceTiers]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[appPricePoints]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppPriceTiersResponse response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v1/appPriceTiers/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[appPriceTiers]": fieldsApppricetiers, "include": include, "fields[appPricePoints]": fieldsApppricepoints, "limit[pricePoints]": limitPricepoints};
        map<Encoding> queryParamEncoding = {"fields[appPriceTiers]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[appPricePoints]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppPriceTierResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppprices - the fields to include for returned resources of type appPrices 
    # + include - comma-separated list of relationships to include 
    # + return - Single AppPrice 
    remote isolated function apppricesGetInstance(string id, string[]? fieldsAppprices = (), string[]? include = ()) returns AppPriceResponse|error {
        string resourcePath = string `/v1/appPrices/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[appPrices]": fieldsAppprices, "include": include};
        map<Encoding> queryParamEncoding = {"fields[appPrices]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppPriceResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + payload - AppScreenshotSet representation 
    # + return - Single AppScreenshotSet 
    remote isolated function appscreenshotsetsCreateInstance(AppScreenshotSetCreateRequest payload) returns AppScreenshotSetResponse|error {
        string resourcePath = string `/v1/appScreenshotSets`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppScreenshotSetResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppscreenshotsets - the fields to include for returned resources of type appScreenshotSets 
    # + include - comma-separated list of relationships to include 
    # + fieldsAppscreenshots - the fields to include for returned resources of type appScreenshots 
    # + limitAppscreenshots - maximum number of related appScreenshots returned (when they are included) 
    # + return - Single AppScreenshotSet 
    remote isolated function appscreenshotsetsGetInstance(string id, string[]? fieldsAppscreenshotsets = (), string[]? include = (), string[]? fieldsAppscreenshots = (), int? limitAppscreenshots = ()) returns AppScreenshotSetResponse|error {
        string resourcePath = string `/v1/appScreenshotSets/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[appScreenshotSets]": fieldsAppscreenshotsets, "include": include, "fields[appScreenshots]": fieldsAppscreenshots, "limit[appScreenshots]": limitAppscreenshots};
        map<Encoding> queryParamEncoding = {"fields[appScreenshotSets]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[appScreenshots]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppScreenshotSetResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function appscreenshotsetsDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/appScreenshotSets/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + payload - AppScreenshot representation 
    # + return - Single AppScreenshot 
    remote isolated function appscreenshotsCreateInstance(AppScreenshotCreateRequest payload) returns AppScreenshotResponse|error {
        string resourcePath = string `/v1/appScreenshots`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppScreenshotResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppscreenshots - the fields to include for returned resources of type appScreenshots 
    # + include - comma-separated list of relationships to include 
    # + return - Single AppScreenshot 
    remote isolated function appscreenshotsGetInstance(string id, string[]? fieldsAppscreenshots = (), string[]? include = ()) returns AppScreenshotResponse|error {
        string resourcePath = string `/v1/appScreenshots/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[appScreenshots]": fieldsAppscreenshots, "include": include};
        map<Encoding> queryParamEncoding = {"fields[appScreenshots]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppScreenshotResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function appscreenshotsDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/appScreenshots/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - AppScreenshot representation 
    # + return - Single AppScreenshot 
    remote isolated function appscreenshotsUpdateInstance(string id, AppScreenshotUpdateRequest payload) returns AppScreenshotResponse|error {
        string resourcePath = string `/v1/appScreenshots/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppScreenshotResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + payload - AppStoreReviewAttachment representation 
    # + return - Single AppStoreReviewAttachment 
    remote isolated function appstorereviewattachmentsCreateInstance(AppStoreReviewAttachmentCreateRequest payload) returns AppStoreReviewAttachmentResponse|error {
        string resourcePath = string `/v1/appStoreReviewAttachments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppStoreReviewAttachmentResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppstorereviewattachments - the fields to include for returned resources of type appStoreReviewAttachments 
    # + include - comma-separated list of relationships to include 
    # + return - Single AppStoreReviewAttachment 
    remote isolated function appstorereviewattachmentsGetInstance(string id, string[]? fieldsAppstorereviewattachments = (), string[]? include = ()) returns AppStoreReviewAttachmentResponse|error {
        string resourcePath = string `/v1/appStoreReviewAttachments/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[appStoreReviewAttachments]": fieldsAppstorereviewattachments, "include": include};
        map<Encoding> queryParamEncoding = {"fields[appStoreReviewAttachments]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppStoreReviewAttachmentResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function appstorereviewattachmentsDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/appStoreReviewAttachments/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - AppStoreReviewAttachment representation 
    # + return - Single AppStoreReviewAttachment 
    remote isolated function appstorereviewattachmentsUpdateInstance(string id, AppStoreReviewAttachmentUpdateRequest payload) returns AppStoreReviewAttachmentResponse|error {
        string resourcePath = string `/v1/appStoreReviewAttachments/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppStoreReviewAttachmentResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + payload - AppStoreReviewDetail representation 
    # + return - Single AppStoreReviewDetail 
    remote isolated function appstorereviewdetailsCreateInstance(AppStoreReviewDetailCreateRequest payload) returns AppStoreReviewDetailResponse|error {
        string resourcePath = string `/v1/appStoreReviewDetails`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppStoreReviewDetailResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppstorereviewdetails - the fields to include for returned resources of type appStoreReviewDetails 
    # + include - comma-separated list of relationships to include 
    # + fieldsAppstorereviewattachments - the fields to include for returned resources of type appStoreReviewAttachments 
    # + limitAppstorereviewattachments - maximum number of related appStoreReviewAttachments returned (when they are included) 
    # + return - Single AppStoreReviewDetail 
    remote isolated function appstorereviewdetailsGetInstance(string id, string[]? fieldsAppstorereviewdetails = (), string[]? include = (), string[]? fieldsAppstorereviewattachments = (), int? limitAppstorereviewattachments = ()) returns AppStoreReviewDetailResponse|error {
        string resourcePath = string `/v1/appStoreReviewDetails/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[appStoreReviewDetails]": fieldsAppstorereviewdetails, "include": include, "fields[appStoreReviewAttachments]": fieldsAppstorereviewattachments, "limit[appStoreReviewAttachments]": limitAppstorereviewattachments};
        map<Encoding> queryParamEncoding = {"fields[appStoreReviewDetails]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[appStoreReviewAttachments]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppStoreReviewDetailResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - AppStoreReviewDetail representation 
    # + return - Single AppStoreReviewDetail 
    remote isolated function appstorereviewdetailsUpdateInstance(string id, AppStoreReviewDetailUpdateRequest payload) returns AppStoreReviewDetailResponse|error {
        string resourcePath = string `/v1/appStoreReviewDetails/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppStoreReviewDetailResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + payload - AppStoreVersionLocalization representation 
    # + return - Single AppStoreVersionLocalization 
    remote isolated function appstoreversionlocalizationsCreateInstance(AppStoreVersionLocalizationCreateRequest payload) returns AppStoreVersionLocalizationResponse|error {
        string resourcePath = string `/v1/appStoreVersionLocalizations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppStoreVersionLocalizationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppstoreversionlocalizations - the fields to include for returned resources of type appStoreVersionLocalizations 
    # + include - comma-separated list of relationships to include 
    # + fieldsAppscreenshotsets - the fields to include for returned resources of type appScreenshotSets 
    # + fieldsApppreviewsets - the fields to include for returned resources of type appPreviewSets 
    # + limitApppreviewsets - maximum number of related appPreviewSets returned (when they are included) 
    # + limitAppscreenshotsets - maximum number of related appScreenshotSets returned (when they are included) 
    # + return - Single AppStoreVersionLocalization 
    remote isolated function appstoreversionlocalizationsGetInstance(string id, string[]? fieldsAppstoreversionlocalizations = (), string[]? include = (), string[]? fieldsAppscreenshotsets = (), string[]? fieldsApppreviewsets = (), int? limitApppreviewsets = (), int? limitAppscreenshotsets = ()) returns AppStoreVersionLocalizationResponse|error {
        string resourcePath = string `/v1/appStoreVersionLocalizations/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[appStoreVersionLocalizations]": fieldsAppstoreversionlocalizations, "include": include, "fields[appScreenshotSets]": fieldsAppscreenshotsets, "fields[appPreviewSets]": fieldsApppreviewsets, "limit[appPreviewSets]": limitApppreviewsets, "limit[appScreenshotSets]": limitAppscreenshotsets};
        map<Encoding> queryParamEncoding = {"fields[appStoreVersionLocalizations]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[appScreenshotSets]": {style: FORM, explode: false}, "fields[appPreviewSets]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppStoreVersionLocalizationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function appstoreversionlocalizationsDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/appStoreVersionLocalizations/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - AppStoreVersionLocalization representation 
    # + return - Single AppStoreVersionLocalization 
    remote isolated function appstoreversionlocalizationsUpdateInstance(string id, AppStoreVersionLocalizationUpdateRequest payload) returns AppStoreVersionLocalizationResponse|error {
        string resourcePath = string `/v1/appStoreVersionLocalizations/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppStoreVersionLocalizationResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + payload - AppStoreVersionPhasedRelease representation 
    # + return - Single AppStoreVersionPhasedRelease 
    remote isolated function appstoreversionphasedreleasesCreateInstance(AppStoreVersionPhasedReleaseCreateRequest payload) returns AppStoreVersionPhasedReleaseResponse|error {
        string resourcePath = string `/v1/appStoreVersionPhasedReleases`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppStoreVersionPhasedReleaseResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function appstoreversionphasedreleasesDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/appStoreVersionPhasedReleases/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - AppStoreVersionPhasedRelease representation 
    # + return - Single AppStoreVersionPhasedRelease 
    remote isolated function appstoreversionphasedreleasesUpdateInstance(string id, AppStoreVersionPhasedReleaseUpdateRequest payload) returns AppStoreVersionPhasedReleaseResponse|error {
        string resourcePath = string `/v1/appStoreVersionPhasedReleases/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppStoreVersionPhasedReleaseResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + payload - AppStoreVersionSubmission representation 
    # + return - Single AppStoreVersionSubmission 
    remote isolated function appstoreversionsubmissionsCreateInstance(AppStoreVersionSubmissionCreateRequest payload) returns AppStoreVersionSubmissionResponse|error {
        string resourcePath = string `/v1/appStoreVersionSubmissions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppStoreVersionSubmissionResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function appstoreversionsubmissionsDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/appStoreVersionSubmissions/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + payload - AppStoreVersion representation 
    # + return - Single AppStoreVersion 
    remote isolated function appstoreversionsCreateInstance(AppStoreVersionCreateRequest payload) returns AppStoreVersionResponse|error {
        string resourcePath = string `/v1/appStoreVersions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppStoreVersionResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppstoreversions - the fields to include for returned resources of type appStoreVersions 
    # + include - comma-separated list of relationships to include 
    # + fieldsAppstoreversionlocalizations - the fields to include for returned resources of type appStoreVersionLocalizations 
    # + fieldsIdfadeclarations - the fields to include for returned resources of type idfaDeclarations 
    # + fieldsRoutingappcoverages - the fields to include for returned resources of type routingAppCoverages 
    # + fieldsAppstoreversionphasedreleases - the fields to include for returned resources of type appStoreVersionPhasedReleases 
    # + fieldsAgeratingdeclarations - the fields to include for returned resources of type ageRatingDeclarations 
    # + fieldsAppstorereviewdetails - the fields to include for returned resources of type appStoreReviewDetails 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + fieldsAppstoreversionsubmissions - the fields to include for returned resources of type appStoreVersionSubmissions 
    # + limitAppstoreversionlocalizations - maximum number of related appStoreVersionLocalizations returned (when they are included) 
    # # Deprecated parameters
    # + fieldsAgeratingdeclarations -
    # + return - Single AppStoreVersion 
    remote isolated function appstoreversionsGetInstance(string id, string[]? fieldsAppstoreversions = (), string[]? include = (), string[]? fieldsAppstoreversionlocalizations = (), string[]? fieldsIdfadeclarations = (), string[]? fieldsRoutingappcoverages = (), string[]? fieldsAppstoreversionphasedreleases = (), @deprecated string[]? fieldsAgeratingdeclarations = (), string[]? fieldsAppstorereviewdetails = (), string[]? fieldsBuilds = (), string[]? fieldsAppstoreversionsubmissions = (), int? limitAppstoreversionlocalizations = ()) returns AppStoreVersionResponse|error {
        string resourcePath = string `/v1/appStoreVersions/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[appStoreVersions]": fieldsAppstoreversions, "include": include, "fields[appStoreVersionLocalizations]": fieldsAppstoreversionlocalizations, "fields[idfaDeclarations]": fieldsIdfadeclarations, "fields[routingAppCoverages]": fieldsRoutingappcoverages, "fields[appStoreVersionPhasedReleases]": fieldsAppstoreversionphasedreleases, "fields[ageRatingDeclarations]": fieldsAgeratingdeclarations, "fields[appStoreReviewDetails]": fieldsAppstorereviewdetails, "fields[builds]": fieldsBuilds, "fields[appStoreVersionSubmissions]": fieldsAppstoreversionsubmissions, "limit[appStoreVersionLocalizations]": limitAppstoreversionlocalizations};
        map<Encoding> queryParamEncoding = {"fields[appStoreVersions]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[appStoreVersionLocalizations]": {style: FORM, explode: false}, "fields[idfaDeclarations]": {style: FORM, explode: false}, "fields[routingAppCoverages]": {style: FORM, explode: false}, "fields[appStoreVersionPhasedReleases]": {style: FORM, explode: false}, "fields[ageRatingDeclarations]": {style: FORM, explode: false}, "fields[appStoreReviewDetails]": {style: FORM, explode: false}, "fields[builds]": {style: FORM, explode: false}, "fields[appStoreVersionSubmissions]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppStoreVersionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function appstoreversionsDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/appStoreVersions/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - AppStoreVersion representation 
    # + return - Single AppStoreVersion 
    remote isolated function appstoreversionsUpdateInstance(string id, AppStoreVersionUpdateRequest payload) returns AppStoreVersionResponse|error {
        string resourcePath = string `/v1/appStoreVersions/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppStoreVersionResponse response = check self.clientEp->patch(resourcePath, request);
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
        string resourcePath = string `/v1/apps`;
        map<anydata> queryParam = {"filter[appStoreVersions.appStoreState]": filterAppstoreversionsAppstorestate, "filter[appStoreVersions.platform]": filterAppstoreversionsPlatform, "filter[bundleId]": filterBundleid, "filter[name]": filterName, "filter[sku]": filterSku, "filter[appStoreVersions]": filterAppstoreversions, "filter[id]": filterId, "exists[gameCenterEnabledVersions]": existsGamecenterenabledversions, "sort": sort, "fields[apps]": fieldsApps, "limit": 'limit, "include": include, "fields[betaGroups]": fieldsBetagroups, "fields[perfPowerMetrics]": fieldsPerfpowermetrics, "fields[appInfos]": fieldsAppinfos, "fields[appPreOrders]": fieldsApppreorders, "fields[preReleaseVersions]": fieldsPrereleaseversions, "fields[appPrices]": fieldsAppprices, "fields[inAppPurchases]": fieldsInapppurchases, "fields[betaAppReviewDetails]": fieldsBetaappreviewdetails, "fields[territories]": fieldsTerritories, "fields[gameCenterEnabledVersions]": fieldsGamecenterenabledversions, "fields[appStoreVersions]": fieldsAppstoreversions, "fields[builds]": fieldsBuilds, "fields[betaAppLocalizations]": fieldsBetaapplocalizations, "fields[betaLicenseAgreements]": fieldsBetalicenseagreements, "fields[endUserLicenseAgreements]": fieldsEnduserlicenseagreements, "limit[appInfos]": limitAppinfos, "limit[appStoreVersions]": limitAppstoreversions, "limit[availableTerritories]": limitAvailableterritories, "limit[betaAppLocalizations]": limitBetaapplocalizations, "limit[betaGroups]": limitBetagroups, "limit[builds]": limitBuilds, "limit[gameCenterEnabledVersions]": limitGamecenterenabledversions, "limit[inAppPurchases]": limitInapppurchases, "limit[preReleaseVersions]": limitPrereleaseversions, "limit[prices]": limitPrices};
        map<Encoding> queryParamEncoding = {"filter[appStoreVersions.appStoreState]": {style: FORM, explode: false}, "filter[appStoreVersions.platform]": {style: FORM, explode: false}, "filter[bundleId]": {style: FORM, explode: false}, "filter[name]": {style: FORM, explode: false}, "filter[sku]": {style: FORM, explode: false}, "filter[appStoreVersions]": {style: FORM, explode: false}, "filter[id]": {style: FORM, explode: false}, "exists[gameCenterEnabledVersions]": {style: FORM, explode: false}, "sort": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[betaGroups]": {style: FORM, explode: false}, "fields[perfPowerMetrics]": {style: FORM, explode: false}, "fields[appInfos]": {style: FORM, explode: false}, "fields[appPreOrders]": {style: FORM, explode: false}, "fields[preReleaseVersions]": {style: FORM, explode: false}, "fields[appPrices]": {style: FORM, explode: false}, "fields[inAppPurchases]": {style: FORM, explode: false}, "fields[betaAppReviewDetails]": {style: FORM, explode: false}, "fields[territories]": {style: FORM, explode: false}, "fields[gameCenterEnabledVersions]": {style: FORM, explode: false}, "fields[appStoreVersions]": {style: FORM, explode: false}, "fields[builds]": {style: FORM, explode: false}, "fields[betaAppLocalizations]": {style: FORM, explode: false}, "fields[betaLicenseAgreements]": {style: FORM, explode: false}, "fields[endUserLicenseAgreements]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppsResponse response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[apps]": fieldsApps, "include": include, "fields[betaGroups]": fieldsBetagroups, "fields[perfPowerMetrics]": fieldsPerfpowermetrics, "fields[appInfos]": fieldsAppinfos, "fields[appPreOrders]": fieldsApppreorders, "fields[preReleaseVersions]": fieldsPrereleaseversions, "fields[appPrices]": fieldsAppprices, "fields[inAppPurchases]": fieldsInapppurchases, "fields[betaAppReviewDetails]": fieldsBetaappreviewdetails, "fields[territories]": fieldsTerritories, "fields[gameCenterEnabledVersions]": fieldsGamecenterenabledversions, "fields[appStoreVersions]": fieldsAppstoreversions, "fields[builds]": fieldsBuilds, "fields[betaAppLocalizations]": fieldsBetaapplocalizations, "fields[betaLicenseAgreements]": fieldsBetalicenseagreements, "fields[endUserLicenseAgreements]": fieldsEnduserlicenseagreements, "limit[appInfos]": limitAppinfos, "limit[appStoreVersions]": limitAppstoreversions, "limit[availableTerritories]": limitAvailableterritories, "limit[betaAppLocalizations]": limitBetaapplocalizations, "limit[betaGroups]": limitBetagroups, "limit[builds]": limitBuilds, "limit[gameCenterEnabledVersions]": limitGamecenterenabledversions, "limit[inAppPurchases]": limitInapppurchases, "limit[preReleaseVersions]": limitPrereleaseversions, "limit[prices]": limitPrices};
        map<Encoding> queryParamEncoding = {"fields[apps]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[betaGroups]": {style: FORM, explode: false}, "fields[perfPowerMetrics]": {style: FORM, explode: false}, "fields[appInfos]": {style: FORM, explode: false}, "fields[appPreOrders]": {style: FORM, explode: false}, "fields[preReleaseVersions]": {style: FORM, explode: false}, "fields[appPrices]": {style: FORM, explode: false}, "fields[inAppPurchases]": {style: FORM, explode: false}, "fields[betaAppReviewDetails]": {style: FORM, explode: false}, "fields[territories]": {style: FORM, explode: false}, "fields[gameCenterEnabledVersions]": {style: FORM, explode: false}, "fields[appStoreVersions]": {style: FORM, explode: false}, "fields[builds]": {style: FORM, explode: false}, "fields[betaAppLocalizations]": {style: FORM, explode: false}, "fields[betaLicenseAgreements]": {style: FORM, explode: false}, "fields[endUserLicenseAgreements]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - App representation 
    # + return - Single App 
    remote isolated function appsUpdateInstance(string id, AppUpdateRequest payload) returns AppResponse|error {
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AppResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + filterLocale - filter by attribute 'locale' 
    # + filterApp - filter by id(s) of related 'app' 
    # + fieldsBetaapplocalizations - the fields to include for returned resources of type betaAppLocalizations 
    # + 'limit - maximum resources per page 
    # + include - comma-separated list of relationships to include 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + return - List of BetaAppLocalizations 
    remote isolated function betaapplocalizationsGetCollection(string[]? filterLocale = (), string[]? filterApp = (), string[]? fieldsBetaapplocalizations = (), int? 'limit = (), string[]? include = (), string[]? fieldsApps = ()) returns BetaAppLocalizationsResponse|error {
        string resourcePath = string `/v1/betaAppLocalizations`;
        map<anydata> queryParam = {"filter[locale]": filterLocale, "filter[app]": filterApp, "fields[betaAppLocalizations]": fieldsBetaapplocalizations, "limit": 'limit, "include": include, "fields[apps]": fieldsApps};
        map<Encoding> queryParamEncoding = {"filter[locale]": {style: FORM, explode: false}, "filter[app]": {style: FORM, explode: false}, "fields[betaAppLocalizations]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaAppLocalizationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + payload - BetaAppLocalization representation 
    # + return - Single BetaAppLocalization 
    remote isolated function betaapplocalizationsCreateInstance(BetaAppLocalizationCreateRequest payload) returns BetaAppLocalizationResponse|error {
        string resourcePath = string `/v1/betaAppLocalizations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BetaAppLocalizationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBetaapplocalizations - the fields to include for returned resources of type betaAppLocalizations 
    # + include - comma-separated list of relationships to include 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + return - Single BetaAppLocalization 
    remote isolated function betaapplocalizationsGetInstance(string id, string[]? fieldsBetaapplocalizations = (), string[]? include = (), string[]? fieldsApps = ()) returns BetaAppLocalizationResponse|error {
        string resourcePath = string `/v1/betaAppLocalizations/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[betaAppLocalizations]": fieldsBetaapplocalizations, "include": include, "fields[apps]": fieldsApps};
        map<Encoding> queryParamEncoding = {"fields[betaAppLocalizations]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaAppLocalizationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function betaapplocalizationsDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/betaAppLocalizations/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - BetaAppLocalization representation 
    # + return - Single BetaAppLocalization 
    remote isolated function betaapplocalizationsUpdateInstance(string id, BetaAppLocalizationUpdateRequest payload) returns BetaAppLocalizationResponse|error {
        string resourcePath = string `/v1/betaAppLocalizations/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BetaAppLocalizationResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + filterApp - filter by id(s) of related 'app' 
    # + fieldsBetaappreviewdetails - the fields to include for returned resources of type betaAppReviewDetails 
    # + 'limit - maximum resources per page 
    # + include - comma-separated list of relationships to include 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + return - List of BetaAppReviewDetails 
    remote isolated function betaappreviewdetailsGetCollection(string[] filterApp, string[]? fieldsBetaappreviewdetails = (), int? 'limit = (), string[]? include = (), string[]? fieldsApps = ()) returns BetaAppReviewDetailsResponse|error {
        string resourcePath = string `/v1/betaAppReviewDetails`;
        map<anydata> queryParam = {"filter[app]": filterApp, "fields[betaAppReviewDetails]": fieldsBetaappreviewdetails, "limit": 'limit, "include": include, "fields[apps]": fieldsApps};
        map<Encoding> queryParamEncoding = {"filter[app]": {style: FORM, explode: false}, "fields[betaAppReviewDetails]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaAppReviewDetailsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBetaappreviewdetails - the fields to include for returned resources of type betaAppReviewDetails 
    # + include - comma-separated list of relationships to include 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + return - Single BetaAppReviewDetail 
    remote isolated function betaappreviewdetailsGetInstance(string id, string[]? fieldsBetaappreviewdetails = (), string[]? include = (), string[]? fieldsApps = ()) returns BetaAppReviewDetailResponse|error {
        string resourcePath = string `/v1/betaAppReviewDetails/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[betaAppReviewDetails]": fieldsBetaappreviewdetails, "include": include, "fields[apps]": fieldsApps};
        map<Encoding> queryParamEncoding = {"fields[betaAppReviewDetails]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaAppReviewDetailResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - BetaAppReviewDetail representation 
    # + return - Single BetaAppReviewDetail 
    remote isolated function betaappreviewdetailsUpdateInstance(string id, BetaAppReviewDetailUpdateRequest payload) returns BetaAppReviewDetailResponse|error {
        string resourcePath = string `/v1/betaAppReviewDetails/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BetaAppReviewDetailResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + filterBetareviewstate - filter by attribute 'betaReviewState' 
    # + filterBuild - filter by id(s) of related 'build' 
    # + fieldsBetaappreviewsubmissions - the fields to include for returned resources of type betaAppReviewSubmissions 
    # + 'limit - maximum resources per page 
    # + include - comma-separated list of relationships to include 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + return - List of BetaAppReviewSubmissions 
    remote isolated function betaappreviewsubmissionsGetCollection(string[] filterBuild, string[]? filterBetareviewstate = (), string[]? fieldsBetaappreviewsubmissions = (), int? 'limit = (), string[]? include = (), string[]? fieldsBuilds = ()) returns BetaAppReviewSubmissionsResponse|error {
        string resourcePath = string `/v1/betaAppReviewSubmissions`;
        map<anydata> queryParam = {"filter[betaReviewState]": filterBetareviewstate, "filter[build]": filterBuild, "fields[betaAppReviewSubmissions]": fieldsBetaappreviewsubmissions, "limit": 'limit, "include": include, "fields[builds]": fieldsBuilds};
        map<Encoding> queryParamEncoding = {"filter[betaReviewState]": {style: FORM, explode: false}, "filter[build]": {style: FORM, explode: false}, "fields[betaAppReviewSubmissions]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[builds]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaAppReviewSubmissionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + payload - BetaAppReviewSubmission representation 
    # + return - Single BetaAppReviewSubmission 
    remote isolated function betaappreviewsubmissionsCreateInstance(BetaAppReviewSubmissionCreateRequest payload) returns BetaAppReviewSubmissionResponse|error {
        string resourcePath = string `/v1/betaAppReviewSubmissions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BetaAppReviewSubmissionResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBetaappreviewsubmissions - the fields to include for returned resources of type betaAppReviewSubmissions 
    # + include - comma-separated list of relationships to include 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + return - Single BetaAppReviewSubmission 
    remote isolated function betaappreviewsubmissionsGetInstance(string id, string[]? fieldsBetaappreviewsubmissions = (), string[]? include = (), string[]? fieldsBuilds = ()) returns BetaAppReviewSubmissionResponse|error {
        string resourcePath = string `/v1/betaAppReviewSubmissions/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[betaAppReviewSubmissions]": fieldsBetaappreviewsubmissions, "include": include, "fields[builds]": fieldsBuilds};
        map<Encoding> queryParamEncoding = {"fields[betaAppReviewSubmissions]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[builds]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaAppReviewSubmissionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + filterLocale - filter by attribute 'locale' 
    # + filterBuild - filter by id(s) of related 'build' 
    # + fieldsBetabuildlocalizations - the fields to include for returned resources of type betaBuildLocalizations 
    # + 'limit - maximum resources per page 
    # + include - comma-separated list of relationships to include 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + return - List of BetaBuildLocalizations 
    remote isolated function betabuildlocalizationsGetCollection(string[]? filterLocale = (), string[]? filterBuild = (), string[]? fieldsBetabuildlocalizations = (), int? 'limit = (), string[]? include = (), string[]? fieldsBuilds = ()) returns BetaBuildLocalizationsResponse|error {
        string resourcePath = string `/v1/betaBuildLocalizations`;
        map<anydata> queryParam = {"filter[locale]": filterLocale, "filter[build]": filterBuild, "fields[betaBuildLocalizations]": fieldsBetabuildlocalizations, "limit": 'limit, "include": include, "fields[builds]": fieldsBuilds};
        map<Encoding> queryParamEncoding = {"filter[locale]": {style: FORM, explode: false}, "filter[build]": {style: FORM, explode: false}, "fields[betaBuildLocalizations]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[builds]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaBuildLocalizationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + payload - BetaBuildLocalization representation 
    # + return - Single BetaBuildLocalization 
    remote isolated function betabuildlocalizationsCreateInstance(BetaBuildLocalizationCreateRequest payload) returns BetaBuildLocalizationResponse|error {
        string resourcePath = string `/v1/betaBuildLocalizations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BetaBuildLocalizationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBetabuildlocalizations - the fields to include for returned resources of type betaBuildLocalizations 
    # + include - comma-separated list of relationships to include 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + return - Single BetaBuildLocalization 
    remote isolated function betabuildlocalizationsGetInstance(string id, string[]? fieldsBetabuildlocalizations = (), string[]? include = (), string[]? fieldsBuilds = ()) returns BetaBuildLocalizationResponse|error {
        string resourcePath = string `/v1/betaBuildLocalizations/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[betaBuildLocalizations]": fieldsBetabuildlocalizations, "include": include, "fields[builds]": fieldsBuilds};
        map<Encoding> queryParamEncoding = {"fields[betaBuildLocalizations]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[builds]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaBuildLocalizationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function betabuildlocalizationsDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/betaBuildLocalizations/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - BetaBuildLocalization representation 
    # + return - Single BetaBuildLocalization 
    remote isolated function betabuildlocalizationsUpdateInstance(string id, BetaBuildLocalizationUpdateRequest payload) returns BetaBuildLocalizationResponse|error {
        string resourcePath = string `/v1/betaBuildLocalizations/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BetaBuildLocalizationResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + filterIsinternalgroup - filter by attribute 'isInternalGroup' 
    # + filterName - filter by attribute 'name' 
    # + filterPubliclink - filter by attribute 'publicLink' 
    # + filterPubliclinkenabled - filter by attribute 'publicLinkEnabled' 
    # + filterPubliclinklimitenabled - filter by attribute 'publicLinkLimitEnabled' 
    # + filterApp - filter by id(s) of related 'app' 
    # + filterBuilds - filter by id(s) of related 'builds' 
    # + filterId - filter by id(s) 
    # + sort - comma-separated list of sort expressions; resources will be sorted as specified 
    # + fieldsBetagroups - the fields to include for returned resources of type betaGroups 
    # + 'limit - maximum resources per page 
    # + include - comma-separated list of relationships to include 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + fieldsBetatesters - the fields to include for returned resources of type betaTesters 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + limitBetatesters - maximum number of related betaTesters returned (when they are included) 
    # + limitBuilds - maximum number of related builds returned (when they are included) 
    # + return - List of BetaGroups 
    remote isolated function betagroupsGetCollection(string[]? filterIsinternalgroup = (), string[]? filterName = (), string[]? filterPubliclink = (), string[]? filterPubliclinkenabled = (), string[]? filterPubliclinklimitenabled = (), string[]? filterApp = (), string[]? filterBuilds = (), string[]? filterId = (), string[]? sort = (), string[]? fieldsBetagroups = (), int? 'limit = (), string[]? include = (), string[]? fieldsBuilds = (), string[]? fieldsBetatesters = (), string[]? fieldsApps = (), int? limitBetatesters = (), int? limitBuilds = ()) returns BetaGroupsResponse|error {
        string resourcePath = string `/v1/betaGroups`;
        map<anydata> queryParam = {"filter[isInternalGroup]": filterIsinternalgroup, "filter[name]": filterName, "filter[publicLink]": filterPubliclink, "filter[publicLinkEnabled]": filterPubliclinkenabled, "filter[publicLinkLimitEnabled]": filterPubliclinklimitenabled, "filter[app]": filterApp, "filter[builds]": filterBuilds, "filter[id]": filterId, "sort": sort, "fields[betaGroups]": fieldsBetagroups, "limit": 'limit, "include": include, "fields[builds]": fieldsBuilds, "fields[betaTesters]": fieldsBetatesters, "fields[apps]": fieldsApps, "limit[betaTesters]": limitBetatesters, "limit[builds]": limitBuilds};
        map<Encoding> queryParamEncoding = {"filter[isInternalGroup]": {style: FORM, explode: false}, "filter[name]": {style: FORM, explode: false}, "filter[publicLink]": {style: FORM, explode: false}, "filter[publicLinkEnabled]": {style: FORM, explode: false}, "filter[publicLinkLimitEnabled]": {style: FORM, explode: false}, "filter[app]": {style: FORM, explode: false}, "filter[builds]": {style: FORM, explode: false}, "filter[id]": {style: FORM, explode: false}, "sort": {style: FORM, explode: false}, "fields[betaGroups]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[builds]": {style: FORM, explode: false}, "fields[betaTesters]": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaGroupsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + payload - BetaGroup representation 
    # + return - Single BetaGroup 
    remote isolated function betagroupsCreateInstance(BetaGroupCreateRequest payload) returns BetaGroupResponse|error {
        string resourcePath = string `/v1/betaGroups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BetaGroupResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBetagroups - the fields to include for returned resources of type betaGroups 
    # + include - comma-separated list of relationships to include 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + fieldsBetatesters - the fields to include for returned resources of type betaTesters 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + limitBetatesters - maximum number of related betaTesters returned (when they are included) 
    # + limitBuilds - maximum number of related builds returned (when they are included) 
    # + return - Single BetaGroup 
    remote isolated function betagroupsGetInstance(string id, string[]? fieldsBetagroups = (), string[]? include = (), string[]? fieldsBuilds = (), string[]? fieldsBetatesters = (), string[]? fieldsApps = (), int? limitBetatesters = (), int? limitBuilds = ()) returns BetaGroupResponse|error {
        string resourcePath = string `/v1/betaGroups/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[betaGroups]": fieldsBetagroups, "include": include, "fields[builds]": fieldsBuilds, "fields[betaTesters]": fieldsBetatesters, "fields[apps]": fieldsApps, "limit[betaTesters]": limitBetatesters, "limit[builds]": limitBuilds};
        map<Encoding> queryParamEncoding = {"fields[betaGroups]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[builds]": {style: FORM, explode: false}, "fields[betaTesters]": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaGroupResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function betagroupsDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/betaGroups/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - BetaGroup representation 
    # + return - Single BetaGroup 
    remote isolated function betagroupsUpdateInstance(string id, BetaGroupUpdateRequest payload) returns BetaGroupResponse|error {
        string resourcePath = string `/v1/betaGroups/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BetaGroupResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + filterApp - filter by id(s) of related 'app' 
    # + fieldsBetalicenseagreements - the fields to include for returned resources of type betaLicenseAgreements 
    # + 'limit - maximum resources per page 
    # + include - comma-separated list of relationships to include 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + return - List of BetaLicenseAgreements 
    remote isolated function betalicenseagreementsGetCollection(string[]? filterApp = (), string[]? fieldsBetalicenseagreements = (), int? 'limit = (), string[]? include = (), string[]? fieldsApps = ()) returns BetaLicenseAgreementsResponse|error {
        string resourcePath = string `/v1/betaLicenseAgreements`;
        map<anydata> queryParam = {"filter[app]": filterApp, "fields[betaLicenseAgreements]": fieldsBetalicenseagreements, "limit": 'limit, "include": include, "fields[apps]": fieldsApps};
        map<Encoding> queryParamEncoding = {"filter[app]": {style: FORM, explode: false}, "fields[betaLicenseAgreements]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaLicenseAgreementsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBetalicenseagreements - the fields to include for returned resources of type betaLicenseAgreements 
    # + include - comma-separated list of relationships to include 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + return - Single BetaLicenseAgreement 
    remote isolated function betalicenseagreementsGetInstance(string id, string[]? fieldsBetalicenseagreements = (), string[]? include = (), string[]? fieldsApps = ()) returns BetaLicenseAgreementResponse|error {
        string resourcePath = string `/v1/betaLicenseAgreements/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[betaLicenseAgreements]": fieldsBetalicenseagreements, "include": include, "fields[apps]": fieldsApps};
        map<Encoding> queryParamEncoding = {"fields[betaLicenseAgreements]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaLicenseAgreementResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - BetaLicenseAgreement representation 
    # + return - Single BetaLicenseAgreement 
    remote isolated function betalicenseagreementsUpdateInstance(string id, BetaLicenseAgreementUpdateRequest payload) returns BetaLicenseAgreementResponse|error {
        string resourcePath = string `/v1/betaLicenseAgreements/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BetaLicenseAgreementResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + payload - BetaTesterInvitation representation 
    # + return - Single BetaTesterInvitation 
    remote isolated function betatesterinvitationsCreateInstance(BetaTesterInvitationCreateRequest payload) returns BetaTesterInvitationResponse|error {
        string resourcePath = string `/v1/betaTesterInvitations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BetaTesterInvitationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + filterEmail - filter by attribute 'email' 
    # + filterFirstname - filter by attribute 'firstName' 
    # + filterInvitetype - filter by attribute 'inviteType' 
    # + filterLastname - filter by attribute 'lastName' 
    # + filterApps - filter by id(s) of related 'apps' 
    # + filterBetagroups - filter by id(s) of related 'betaGroups' 
    # + filterBuilds - filter by id(s) of related 'builds' 
    # + sort - comma-separated list of sort expressions; resources will be sorted as specified 
    # + fieldsBetatesters - the fields to include for returned resources of type betaTesters 
    # + 'limit - maximum resources per page 
    # + include - comma-separated list of relationships to include 
    # + fieldsBetagroups - the fields to include for returned resources of type betaGroups 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + limitApps - maximum number of related apps returned (when they are included) 
    # + limitBetagroups - maximum number of related betaGroups returned (when they are included) 
    # + limitBuilds - maximum number of related builds returned (when they are included) 
    # + return - List of BetaTesters 
    remote isolated function betatestersGetCollection(string[]? filterEmail = (), string[]? filterFirstname = (), string[]? filterInvitetype = (), string[]? filterLastname = (), string[]? filterApps = (), string[]? filterBetagroups = (), string[]? filterBuilds = (), string[]? sort = (), string[]? fieldsBetatesters = (), int? 'limit = (), string[]? include = (), string[]? fieldsBetagroups = (), string[]? fieldsBuilds = (), string[]? fieldsApps = (), int? limitApps = (), int? limitBetagroups = (), int? limitBuilds = ()) returns BetaTestersResponse|error {
        string resourcePath = string `/v1/betaTesters`;
        map<anydata> queryParam = {"filter[email]": filterEmail, "filter[firstName]": filterFirstname, "filter[inviteType]": filterInvitetype, "filter[lastName]": filterLastname, "filter[apps]": filterApps, "filter[betaGroups]": filterBetagroups, "filter[builds]": filterBuilds, "sort": sort, "fields[betaTesters]": fieldsBetatesters, "limit": 'limit, "include": include, "fields[betaGroups]": fieldsBetagroups, "fields[builds]": fieldsBuilds, "fields[apps]": fieldsApps, "limit[apps]": limitApps, "limit[betaGroups]": limitBetagroups, "limit[builds]": limitBuilds};
        map<Encoding> queryParamEncoding = {"filter[email]": {style: FORM, explode: false}, "filter[firstName]": {style: FORM, explode: false}, "filter[inviteType]": {style: FORM, explode: false}, "filter[lastName]": {style: FORM, explode: false}, "filter[apps]": {style: FORM, explode: false}, "filter[betaGroups]": {style: FORM, explode: false}, "filter[builds]": {style: FORM, explode: false}, "sort": {style: FORM, explode: false}, "fields[betaTesters]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[betaGroups]": {style: FORM, explode: false}, "fields[builds]": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaTestersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + payload - BetaTester representation 
    # + return - Single BetaTester 
    remote isolated function betatestersCreateInstance(BetaTesterCreateRequest payload) returns BetaTesterResponse|error {
        string resourcePath = string `/v1/betaTesters`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BetaTesterResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBetatesters - the fields to include for returned resources of type betaTesters 
    # + include - comma-separated list of relationships to include 
    # + fieldsBetagroups - the fields to include for returned resources of type betaGroups 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + limitApps - maximum number of related apps returned (when they are included) 
    # + limitBetagroups - maximum number of related betaGroups returned (when they are included) 
    # + limitBuilds - maximum number of related builds returned (when they are included) 
    # + return - Single BetaTester 
    remote isolated function betatestersGetInstance(string id, string[]? fieldsBetatesters = (), string[]? include = (), string[]? fieldsBetagroups = (), string[]? fieldsBuilds = (), string[]? fieldsApps = (), int? limitApps = (), int? limitBetagroups = (), int? limitBuilds = ()) returns BetaTesterResponse|error {
        string resourcePath = string `/v1/betaTesters/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[betaTesters]": fieldsBetatesters, "include": include, "fields[betaGroups]": fieldsBetagroups, "fields[builds]": fieldsBuilds, "fields[apps]": fieldsApps, "limit[apps]": limitApps, "limit[betaGroups]": limitBetagroups, "limit[builds]": limitBuilds};
        map<Encoding> queryParamEncoding = {"fields[betaTesters]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[betaGroups]": {style: FORM, explode: false}, "fields[builds]": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaTesterResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function betatestersDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/betaTesters/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + filterBuild - filter by id(s) of related 'build' 
    # + filterId - filter by id(s) 
    # + fieldsBuildbetadetails - the fields to include for returned resources of type buildBetaDetails 
    # + 'limit - maximum resources per page 
    # + include - comma-separated list of relationships to include 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + return - List of BuildBetaDetails 
    remote isolated function buildbetadetailsGetCollection(string[]? filterBuild = (), string[]? filterId = (), string[]? fieldsBuildbetadetails = (), int? 'limit = (), string[]? include = (), string[]? fieldsBuilds = ()) returns BuildBetaDetailsResponse|error {
        string resourcePath = string `/v1/buildBetaDetails`;
        map<anydata> queryParam = {"filter[build]": filterBuild, "filter[id]": filterId, "fields[buildBetaDetails]": fieldsBuildbetadetails, "limit": 'limit, "include": include, "fields[builds]": fieldsBuilds};
        map<Encoding> queryParamEncoding = {"filter[build]": {style: FORM, explode: false}, "filter[id]": {style: FORM, explode: false}, "fields[buildBetaDetails]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[builds]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BuildBetaDetailsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBuildbetadetails - the fields to include for returned resources of type buildBetaDetails 
    # + include - comma-separated list of relationships to include 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + return - Single BuildBetaDetail 
    remote isolated function buildbetadetailsGetInstance(string id, string[]? fieldsBuildbetadetails = (), string[]? include = (), string[]? fieldsBuilds = ()) returns BuildBetaDetailResponse|error {
        string resourcePath = string `/v1/buildBetaDetails/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[buildBetaDetails]": fieldsBuildbetadetails, "include": include, "fields[builds]": fieldsBuilds};
        map<Encoding> queryParamEncoding = {"fields[buildBetaDetails]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[builds]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BuildBetaDetailResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - BuildBetaDetail representation 
    # + return - Single BuildBetaDetail 
    remote isolated function buildbetadetailsUpdateInstance(string id, BuildBetaDetailUpdateRequest payload) returns BuildBetaDetailResponse|error {
        string resourcePath = string `/v1/buildBetaDetails/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BuildBetaDetailResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + payload - BuildBetaNotification representation 
    # + return - Single BuildBetaNotification 
    remote isolated function buildbetanotificationsCreateInstance(BuildBetaNotificationCreateRequest payload) returns BuildBetaNotificationResponse|error {
        string resourcePath = string `/v1/buildBetaNotifications`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BuildBetaNotificationResponse response = check self.clientEp->post(resourcePath, request);
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
        string resourcePath = string `/v1/builds`;
        map<anydata> queryParam = {"filter[betaAppReviewSubmission.betaReviewState]": filterBetaappreviewsubmissionBetareviewstate, "filter[expired]": filterExpired, "filter[preReleaseVersion.platform]": filterPrereleaseversionPlatform, "filter[preReleaseVersion.version]": filterPrereleaseversionVersion, "filter[processingState]": filterProcessingstate, "filter[usesNonExemptEncryption]": filterUsesnonexemptencryption, "filter[version]": filterVersion, "filter[app]": filterApp, "filter[appStoreVersion]": filterAppstoreversion, "filter[betaGroups]": filterBetagroups, "filter[preReleaseVersion]": filterPrereleaseversion, "filter[id]": filterId, "sort": sort, "fields[builds]": fieldsBuilds, "limit": 'limit, "include": include, "fields[appEncryptionDeclarations]": fieldsAppencryptiondeclarations, "fields[betaAppReviewSubmissions]": fieldsBetaappreviewsubmissions, "fields[buildBetaDetails]": fieldsBuildbetadetails, "fields[buildIcons]": fieldsBuildicons, "fields[perfPowerMetrics]": fieldsPerfpowermetrics, "fields[preReleaseVersions]": fieldsPrereleaseversions, "fields[appStoreVersions]": fieldsAppstoreversions, "fields[diagnosticSignatures]": fieldsDiagnosticsignatures, "fields[betaTesters]": fieldsBetatesters, "fields[betaBuildLocalizations]": fieldsBetabuildlocalizations, "fields[apps]": fieldsApps, "limit[betaBuildLocalizations]": limitBetabuildlocalizations, "limit[icons]": limitIcons, "limit[individualTesters]": limitIndividualtesters};
        map<Encoding> queryParamEncoding = {"filter[betaAppReviewSubmission.betaReviewState]": {style: FORM, explode: false}, "filter[expired]": {style: FORM, explode: false}, "filter[preReleaseVersion.platform]": {style: FORM, explode: false}, "filter[preReleaseVersion.version]": {style: FORM, explode: false}, "filter[processingState]": {style: FORM, explode: false}, "filter[usesNonExemptEncryption]": {style: FORM, explode: false}, "filter[version]": {style: FORM, explode: false}, "filter[app]": {style: FORM, explode: false}, "filter[appStoreVersion]": {style: FORM, explode: false}, "filter[betaGroups]": {style: FORM, explode: false}, "filter[preReleaseVersion]": {style: FORM, explode: false}, "filter[id]": {style: FORM, explode: false}, "sort": {style: FORM, explode: false}, "fields[builds]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[appEncryptionDeclarations]": {style: FORM, explode: false}, "fields[betaAppReviewSubmissions]": {style: FORM, explode: false}, "fields[buildBetaDetails]": {style: FORM, explode: false}, "fields[buildIcons]": {style: FORM, explode: false}, "fields[perfPowerMetrics]": {style: FORM, explode: false}, "fields[preReleaseVersions]": {style: FORM, explode: false}, "fields[appStoreVersions]": {style: FORM, explode: false}, "fields[diagnosticSignatures]": {style: FORM, explode: false}, "fields[betaTesters]": {style: FORM, explode: false}, "fields[betaBuildLocalizations]": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BuildsResponse response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[builds]": fieldsBuilds, "include": include, "fields[appEncryptionDeclarations]": fieldsAppencryptiondeclarations, "fields[betaAppReviewSubmissions]": fieldsBetaappreviewsubmissions, "fields[buildBetaDetails]": fieldsBuildbetadetails, "fields[buildIcons]": fieldsBuildicons, "fields[perfPowerMetrics]": fieldsPerfpowermetrics, "fields[preReleaseVersions]": fieldsPrereleaseversions, "fields[appStoreVersions]": fieldsAppstoreversions, "fields[diagnosticSignatures]": fieldsDiagnosticsignatures, "fields[betaTesters]": fieldsBetatesters, "fields[betaBuildLocalizations]": fieldsBetabuildlocalizations, "fields[apps]": fieldsApps, "limit[betaBuildLocalizations]": limitBetabuildlocalizations, "limit[icons]": limitIcons, "limit[individualTesters]": limitIndividualtesters};
        map<Encoding> queryParamEncoding = {"fields[builds]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[appEncryptionDeclarations]": {style: FORM, explode: false}, "fields[betaAppReviewSubmissions]": {style: FORM, explode: false}, "fields[buildBetaDetails]": {style: FORM, explode: false}, "fields[buildIcons]": {style: FORM, explode: false}, "fields[perfPowerMetrics]": {style: FORM, explode: false}, "fields[preReleaseVersions]": {style: FORM, explode: false}, "fields[appStoreVersions]": {style: FORM, explode: false}, "fields[diagnosticSignatures]": {style: FORM, explode: false}, "fields[betaTesters]": {style: FORM, explode: false}, "fields[betaBuildLocalizations]": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BuildResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - Build representation 
    # + return - Single Build 
    remote isolated function buildsUpdateInstance(string id, BuildUpdateRequest payload) returns BuildResponse|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BuildResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + payload - BundleIdCapability representation 
    # + return - Single BundleIdCapability 
    remote isolated function bundleidcapabilitiesCreateInstance(BundleIdCapabilityCreateRequest payload) returns BundleIdCapabilityResponse|error {
        string resourcePath = string `/v1/bundleIdCapabilities`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BundleIdCapabilityResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function bundleidcapabilitiesDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/bundleIdCapabilities/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - BundleIdCapability representation 
    # + return - Single BundleIdCapability 
    remote isolated function bundleidcapabilitiesUpdateInstance(string id, BundleIdCapabilityUpdateRequest payload) returns BundleIdCapabilityResponse|error {
        string resourcePath = string `/v1/bundleIdCapabilities/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BundleIdCapabilityResponse response = check self.clientEp->patch(resourcePath, request);
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
        string resourcePath = string `/v1/bundleIds`;
        map<anydata> queryParam = {"filter[identifier]": filterIdentifier, "filter[name]": filterName, "filter[platform]": filterPlatform, "filter[seedId]": filterSeedid, "filter[id]": filterId, "sort": sort, "fields[bundleIds]": fieldsBundleids, "limit": 'limit, "include": include, "fields[bundleIdCapabilities]": fieldsBundleidcapabilities, "fields[profiles]": fieldsProfiles, "fields[apps]": fieldsApps, "limit[bundleIdCapabilities]": limitBundleidcapabilities, "limit[profiles]": limitProfiles};
        map<Encoding> queryParamEncoding = {"filter[identifier]": {style: FORM, explode: false}, "filter[name]": {style: FORM, explode: false}, "filter[platform]": {style: FORM, explode: false}, "filter[seedId]": {style: FORM, explode: false}, "filter[id]": {style: FORM, explode: false}, "sort": {style: FORM, explode: false}, "fields[bundleIds]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[bundleIdCapabilities]": {style: FORM, explode: false}, "fields[profiles]": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BundleIdsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + payload - BundleId representation 
    # + return - Single BundleId 
    remote isolated function bundleidsCreateInstance(BundleIdCreateRequest payload) returns BundleIdResponse|error {
        string resourcePath = string `/v1/bundleIds`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BundleIdResponse response = check self.clientEp->post(resourcePath, request);
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
        string resourcePath = string `/v1/bundleIds/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[bundleIds]": fieldsBundleids, "include": include, "fields[bundleIdCapabilities]": fieldsBundleidcapabilities, "fields[profiles]": fieldsProfiles, "fields[apps]": fieldsApps, "limit[bundleIdCapabilities]": limitBundleidcapabilities, "limit[profiles]": limitProfiles};
        map<Encoding> queryParamEncoding = {"fields[bundleIds]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[bundleIdCapabilities]": {style: FORM, explode: false}, "fields[profiles]": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BundleIdResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function bundleidsDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/bundleIds/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - BundleId representation 
    # + return - Single BundleId 
    remote isolated function bundleidsUpdateInstance(string id, BundleIdUpdateRequest payload) returns BundleIdResponse|error {
        string resourcePath = string `/v1/bundleIds/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BundleIdResponse response = check self.clientEp->patch(resourcePath, request);
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
        string resourcePath = string `/v1/certificates`;
        map<anydata> queryParam = {"filter[certificateType]": filterCertificatetype, "filter[displayName]": filterDisplayname, "filter[serialNumber]": filterSerialnumber, "filter[id]": filterId, "sort": sort, "fields[certificates]": fieldsCertificates, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"filter[certificateType]": {style: FORM, explode: false}, "filter[displayName]": {style: FORM, explode: false}, "filter[serialNumber]": {style: FORM, explode: false}, "filter[id]": {style: FORM, explode: false}, "sort": {style: FORM, explode: false}, "fields[certificates]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CertificatesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + payload - Certificate representation 
    # + return - Single Certificate 
    remote isolated function certificatesCreateInstance(CertificateCreateRequest payload) returns CertificateResponse|error {
        string resourcePath = string `/v1/certificates`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CertificateResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsCertificates - the fields to include for returned resources of type certificates 
    # + return - Single Certificate 
    remote isolated function certificatesGetInstance(string id, string[]? fieldsCertificates = ()) returns CertificateResponse|error {
        string resourcePath = string `/v1/certificates/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[certificates]": fieldsCertificates};
        map<Encoding> queryParamEncoding = {"fields[certificates]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CertificateResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function certificatesDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/certificates/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
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
        string resourcePath = string `/v1/devices`;
        map<anydata> queryParam = {"filter[name]": filterName, "filter[platform]": filterPlatform, "filter[status]": filterStatus, "filter[udid]": filterUdid, "filter[id]": filterId, "sort": sort, "fields[devices]": fieldsDevices, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"filter[name]": {style: FORM, explode: false}, "filter[platform]": {style: FORM, explode: false}, "filter[status]": {style: FORM, explode: false}, "filter[udid]": {style: FORM, explode: false}, "filter[id]": {style: FORM, explode: false}, "sort": {style: FORM, explode: false}, "fields[devices]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DevicesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + payload - Device representation 
    # + return - Single Device 
    remote isolated function devicesCreateInstance(DeviceCreateRequest payload) returns DeviceResponse|error {
        string resourcePath = string `/v1/devices`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeviceResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsDevices - the fields to include for returned resources of type devices 
    # + return - Single Device 
    remote isolated function devicesGetInstance(string id, string[]? fieldsDevices = ()) returns DeviceResponse|error {
        string resourcePath = string `/v1/devices/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[devices]": fieldsDevices};
        map<Encoding> queryParamEncoding = {"fields[devices]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DeviceResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - Device representation 
    # + return - Single Device 
    remote isolated function devicesUpdateInstance(string id, DeviceUpdateRequest payload) returns DeviceResponse|error {
        string resourcePath = string `/v1/devices/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeviceResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + payload - EndUserLicenseAgreement representation 
    # + return - Single EndUserLicenseAgreement 
    remote isolated function enduserlicenseagreementsCreateInstance(EndUserLicenseAgreementCreateRequest payload) returns EndUserLicenseAgreementResponse|error {
        string resourcePath = string `/v1/endUserLicenseAgreements`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EndUserLicenseAgreementResponse response = check self.clientEp->post(resourcePath, request);
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
        string resourcePath = string `/v1/endUserLicenseAgreements/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[endUserLicenseAgreements]": fieldsEnduserlicenseagreements, "include": include, "fields[territories]": fieldsTerritories, "limit[territories]": limitTerritories};
        map<Encoding> queryParamEncoding = {"fields[endUserLicenseAgreements]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[territories]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EndUserLicenseAgreementResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function enduserlicenseagreementsDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/endUserLicenseAgreements/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - EndUserLicenseAgreement representation 
    # + return - Single EndUserLicenseAgreement 
    remote isolated function enduserlicenseagreementsUpdateInstance(string id, EndUserLicenseAgreementUpdateRequest payload) returns EndUserLicenseAgreementResponse|error {
        string resourcePath = string `/v1/endUserLicenseAgreements/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EndUserLicenseAgreementResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + filterRegioncode - filter by attribute 'regionCode' 
    # + filterReportdate - filter by attribute 'reportDate' 
    # + filterReporttype - filter by attribute 'reportType' 
    # + filterVendornumber - filter by attribute 'vendorNumber' 
    # + return - List of FinanceReports 
    remote isolated function financereportsGetCollection(string[] filterRegioncode, string[] filterReportdate, string[] filterReporttype, string[] filterVendornumber) returns string|error {
        string resourcePath = string `/v1/financeReports`;
        map<anydata> queryParam = {"filter[regionCode]": filterRegioncode, "filter[reportDate]": filterReportdate, "filter[reportType]": filterReporttype, "filter[vendorNumber]": filterVendornumber};
        map<Encoding> queryParamEncoding = {"filter[regionCode]": {style: FORM, explode: false}, "filter[reportDate]": {style: FORM, explode: false}, "filter[reportType]": {style: FORM, explode: false}, "filter[vendorNumber]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + payload - IdfaDeclaration representation 
    # + return - Single IdfaDeclaration 
    remote isolated function idfadeclarationsCreateInstance(IdfaDeclarationCreateRequest payload) returns IdfaDeclarationResponse|error {
        string resourcePath = string `/v1/idfaDeclarations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdfaDeclarationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function idfadeclarationsDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/idfaDeclarations/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - IdfaDeclaration representation 
    # + return - Single IdfaDeclaration 
    remote isolated function idfadeclarationsUpdateInstance(string id, IdfaDeclarationUpdateRequest payload) returns IdfaDeclarationResponse|error {
        string resourcePath = string `/v1/idfaDeclarations/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IdfaDeclarationResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsInapppurchases - the fields to include for returned resources of type inAppPurchases 
    # + include - comma-separated list of relationships to include 
    # + limitApps - maximum number of related apps returned (when they are included) 
    # + return - Single InAppPurchase 
    remote isolated function inapppurchasesGetInstance(string id, string[]? fieldsInapppurchases = (), string[]? include = (), int? limitApps = ()) returns InAppPurchaseResponse|error {
        string resourcePath = string `/v1/inAppPurchases/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[inAppPurchases]": fieldsInapppurchases, "include": include, "limit[apps]": limitApps};
        map<Encoding> queryParamEncoding = {"fields[inAppPurchases]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InAppPurchaseResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + filterBuildsExpired - filter by attribute 'builds.expired' 
    # + filterBuildsProcessingstate - filter by attribute 'builds.processingState' 
    # + filterPlatform - filter by attribute 'platform' 
    # + filterVersion - filter by attribute 'version' 
    # + filterApp - filter by id(s) of related 'app' 
    # + filterBuilds - filter by id(s) of related 'builds' 
    # + sort - comma-separated list of sort expressions; resources will be sorted as specified 
    # + fieldsPrereleaseversions - the fields to include for returned resources of type preReleaseVersions 
    # + 'limit - maximum resources per page 
    # + include - comma-separated list of relationships to include 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + limitBuilds - maximum number of related builds returned (when they are included) 
    # + return - List of PreReleaseVersions 
    remote isolated function prereleaseversionsGetCollection(string[]? filterBuildsExpired = (), string[]? filterBuildsProcessingstate = (), string[]? filterPlatform = (), string[]? filterVersion = (), string[]? filterApp = (), string[]? filterBuilds = (), string[]? sort = (), string[]? fieldsPrereleaseversions = (), int? 'limit = (), string[]? include = (), string[]? fieldsBuilds = (), string[]? fieldsApps = (), int? limitBuilds = ()) returns PreReleaseVersionsResponse|error {
        string resourcePath = string `/v1/preReleaseVersions`;
        map<anydata> queryParam = {"filter[builds.expired]": filterBuildsExpired, "filter[builds.processingState]": filterBuildsProcessingstate, "filter[platform]": filterPlatform, "filter[version]": filterVersion, "filter[app]": filterApp, "filter[builds]": filterBuilds, "sort": sort, "fields[preReleaseVersions]": fieldsPrereleaseversions, "limit": 'limit, "include": include, "fields[builds]": fieldsBuilds, "fields[apps]": fieldsApps, "limit[builds]": limitBuilds};
        map<Encoding> queryParamEncoding = {"filter[builds.expired]": {style: FORM, explode: false}, "filter[builds.processingState]": {style: FORM, explode: false}, "filter[platform]": {style: FORM, explode: false}, "filter[version]": {style: FORM, explode: false}, "filter[app]": {style: FORM, explode: false}, "filter[builds]": {style: FORM, explode: false}, "sort": {style: FORM, explode: false}, "fields[preReleaseVersions]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[builds]": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PreReleaseVersionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsPrereleaseversions - the fields to include for returned resources of type preReleaseVersions 
    # + include - comma-separated list of relationships to include 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + limitBuilds - maximum number of related builds returned (when they are included) 
    # + return - Single PrereleaseVersion 
    remote isolated function prereleaseversionsGetInstance(string id, string[]? fieldsPrereleaseversions = (), string[]? include = (), string[]? fieldsBuilds = (), string[]? fieldsApps = (), int? limitBuilds = ()) returns PrereleaseVersionResponse|error {
        string resourcePath = string `/v1/preReleaseVersions/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[preReleaseVersions]": fieldsPrereleaseversions, "include": include, "fields[builds]": fieldsBuilds, "fields[apps]": fieldsApps, "limit[builds]": limitBuilds};
        map<Encoding> queryParamEncoding = {"fields[preReleaseVersions]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[builds]": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PrereleaseVersionResponse response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v1/profiles`;
        map<anydata> queryParam = {"filter[name]": filterName, "filter[profileState]": filterProfilestate, "filter[profileType]": filterProfiletype, "filter[id]": filterId, "sort": sort, "fields[profiles]": fieldsProfiles, "limit": 'limit, "include": include, "fields[certificates]": fieldsCertificates, "fields[devices]": fieldsDevices, "fields[bundleIds]": fieldsBundleids, "limit[certificates]": limitCertificates, "limit[devices]": limitDevices};
        map<Encoding> queryParamEncoding = {"filter[name]": {style: FORM, explode: false}, "filter[profileState]": {style: FORM, explode: false}, "filter[profileType]": {style: FORM, explode: false}, "filter[id]": {style: FORM, explode: false}, "sort": {style: FORM, explode: false}, "fields[profiles]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[certificates]": {style: FORM, explode: false}, "fields[devices]": {style: FORM, explode: false}, "fields[bundleIds]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProfilesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + payload - Profile representation 
    # + return - Single Profile 
    remote isolated function profilesCreateInstance(ProfileCreateRequest payload) returns ProfileResponse|error {
        string resourcePath = string `/v1/profiles`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProfileResponse response = check self.clientEp->post(resourcePath, request);
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
        string resourcePath = string `/v1/profiles/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[profiles]": fieldsProfiles, "include": include, "fields[certificates]": fieldsCertificates, "fields[devices]": fieldsDevices, "fields[bundleIds]": fieldsBundleids, "limit[certificates]": limitCertificates, "limit[devices]": limitDevices};
        map<Encoding> queryParamEncoding = {"fields[profiles]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[certificates]": {style: FORM, explode: false}, "fields[devices]": {style: FORM, explode: false}, "fields[bundleIds]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProfileResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function profilesDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/profiles/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + payload - RoutingAppCoverage representation 
    # + return - Single RoutingAppCoverage 
    remote isolated function routingappcoveragesCreateInstance(RoutingAppCoverageCreateRequest payload) returns RoutingAppCoverageResponse|error {
        string resourcePath = string `/v1/routingAppCoverages`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RoutingAppCoverageResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsRoutingappcoverages - the fields to include for returned resources of type routingAppCoverages 
    # + include - comma-separated list of relationships to include 
    # + return - Single RoutingAppCoverage 
    remote isolated function routingappcoveragesGetInstance(string id, string[]? fieldsRoutingappcoverages = (), string[]? include = ()) returns RoutingAppCoverageResponse|error {
        string resourcePath = string `/v1/routingAppCoverages/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[routingAppCoverages]": fieldsRoutingappcoverages, "include": include};
        map<Encoding> queryParamEncoding = {"fields[routingAppCoverages]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        RoutingAppCoverageResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function routingappcoveragesDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/routingAppCoverages/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - RoutingAppCoverage representation 
    # + return - Single RoutingAppCoverage 
    remote isolated function routingappcoveragesUpdateInstance(string id, RoutingAppCoverageUpdateRequest payload) returns RoutingAppCoverageResponse|error {
        string resourcePath = string `/v1/routingAppCoverages/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RoutingAppCoverageResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + filterFrequency - filter by attribute 'frequency' 
    # + filterReportdate - filter by attribute 'reportDate' 
    # + filterReportsubtype - filter by attribute 'reportSubType' 
    # + filterReporttype - filter by attribute 'reportType' 
    # + filterVendornumber - filter by attribute 'vendorNumber' 
    # + filterVersion - filter by attribute 'version' 
    # + return - List of SalesReports 
    remote isolated function salesreportsGetCollection(string[] filterFrequency, string[] filterReportsubtype, string[] filterReporttype, string[] filterVendornumber, string[]? filterReportdate = (), string[]? filterVersion = ()) returns string|error {
        string resourcePath = string `/v1/salesReports`;
        map<anydata> queryParam = {"filter[frequency]": filterFrequency, "filter[reportDate]": filterReportdate, "filter[reportSubType]": filterReportsubtype, "filter[reportType]": filterReporttype, "filter[vendorNumber]": filterVendornumber, "filter[version]": filterVersion};
        map<Encoding> queryParamEncoding = {"filter[frequency]": {style: FORM, explode: false}, "filter[reportDate]": {style: FORM, explode: false}, "filter[reportSubType]": {style: FORM, explode: false}, "filter[reportType]": {style: FORM, explode: false}, "filter[vendorNumber]": {style: FORM, explode: false}, "filter[version]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + fieldsTerritories - the fields to include for returned resources of type territories 
    # + 'limit - maximum resources per page 
    # + return - List of Territories 
    remote isolated function territoriesGetCollection(string[]? fieldsTerritories = (), int? 'limit = ()) returns TerritoriesResponse|error {
        string resourcePath = string `/v1/territories`;
        map<anydata> queryParam = {"fields[territories]": fieldsTerritories, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[territories]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TerritoriesResponse response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v1/userInvitations`;
        map<anydata> queryParam = {"filter[email]": filterEmail, "filter[roles]": filterRoles, "filter[visibleApps]": filterVisibleapps, "sort": sort, "fields[userInvitations]": fieldsUserinvitations, "limit": 'limit, "include": include, "fields[apps]": fieldsApps, "limit[visibleApps]": limitVisibleapps};
        map<Encoding> queryParamEncoding = {"filter[email]": {style: FORM, explode: false}, "filter[roles]": {style: FORM, explode: false}, "filter[visibleApps]": {style: FORM, explode: false}, "sort": {style: FORM, explode: false}, "fields[userInvitations]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        UserInvitationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + payload - UserInvitation representation 
    # + return - Single UserInvitation 
    remote isolated function userinvitationsCreateInstance(UserInvitationCreateRequest payload) returns UserInvitationResponse|error {
        string resourcePath = string `/v1/userInvitations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserInvitationResponse response = check self.clientEp->post(resourcePath, request);
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
        string resourcePath = string `/v1/userInvitations/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[userInvitations]": fieldsUserinvitations, "include": include, "fields[apps]": fieldsApps, "limit[visibleApps]": limitVisibleapps};
        map<Encoding> queryParamEncoding = {"fields[userInvitations]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        UserInvitationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function userinvitationsDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/userInvitations/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
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
        string resourcePath = string `/v1/users`;
        map<anydata> queryParam = {"filter[roles]": filterRoles, "filter[username]": filterUsername, "filter[visibleApps]": filterVisibleapps, "sort": sort, "fields[users]": fieldsUsers, "limit": 'limit, "include": include, "fields[apps]": fieldsApps, "limit[visibleApps]": limitVisibleapps};
        map<Encoding> queryParamEncoding = {"filter[roles]": {style: FORM, explode: false}, "filter[username]": {style: FORM, explode: false}, "filter[visibleApps]": {style: FORM, explode: false}, "sort": {style: FORM, explode: false}, "fields[users]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        UsersResponse response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v1/users/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"fields[users]": fieldsUsers, "include": include, "fields[apps]": fieldsApps, "limit[visibleApps]": limitVisibleapps};
        map<Encoding> queryParamEncoding = {"fields[users]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        UserResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function usersDeleteInstance(string id) returns http:Response|error {
        string resourcePath = string `/v1/users/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - User representation 
    # + return - Single User 
    remote isolated function usersUpdateInstance(string id, UserUpdateRequest payload) returns UserResponse|error {
        string resourcePath = string `/v1/users/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserResponse response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories 
    # + return - Related resource 
    remote isolated function appcategoriesParentGetToOneRelated(string id, string[]? fieldsAppcategories = ()) returns AppCategoryResponse|error {
        string resourcePath = string `/v1/appCategories/${getEncodedUri(id)}/parent`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories};
        map<Encoding> queryParamEncoding = {"fields[appCategories]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppCategoryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function appcategoriesSubcategoriesGetToManyRelated(string id, string[]? fieldsAppcategories = (), int? 'limit = ()) returns AppCategoriesResponse|error {
        string resourcePath = string `/v1/appCategories/${getEncodedUri(id)}/subcategories`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[appCategories]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppCategoriesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + return - Related resource 
    remote isolated function appencryptiondeclarationsAppGetToOneRelated(string id, string[]? fieldsApps = ()) returns AppResponse|error {
        string resourcePath = string `/v1/appEncryptionDeclarations/${getEncodedUri(id)}/app`;
        map<anydata> queryParam = {"fields[apps]": fieldsApps};
        map<Encoding> queryParamEncoding = {"fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - List of related linkages 
    # + return - Success (no content) 
    remote isolated function appencryptiondeclarationsBuildsCreateToManyRelationship(string id, AppEncryptionDeclarationBuildsLinkagesRequest payload) returns http:Response|error {
        string resourcePath = string `/v1/appEncryptionDeclarations/${getEncodedUri(id)}/relationships/builds`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAgeratingdeclarations - the fields to include for returned resources of type ageRatingDeclarations 
    # + return - Related resource 
    remote isolated function appinfosAgeratingdeclarationGetToOneRelated(string id, string[]? fieldsAgeratingdeclarations = ()) returns AgeRatingDeclarationResponse|error {
        string resourcePath = string `/v1/appInfos/${getEncodedUri(id)}/ageRatingDeclaration`;
        map<anydata> queryParam = {"fields[ageRatingDeclarations]": fieldsAgeratingdeclarations};
        map<Encoding> queryParamEncoding = {"fields[ageRatingDeclarations]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AgeRatingDeclarationResponse response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v1/appInfos/${getEncodedUri(id)}/appInfoLocalizations`;
        map<anydata> queryParam = {"filter[locale]": filterLocale, "fields[appInfos]": fieldsAppinfos, "fields[appInfoLocalizations]": fieldsAppinfolocalizations, "limit": 'limit, "include": include};
        map<Encoding> queryParamEncoding = {"filter[locale]": {style: FORM, explode: false}, "fields[appInfos]": {style: FORM, explode: false}, "fields[appInfoLocalizations]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppInfoLocalizationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories 
    # + return - Related resource 
    remote isolated function appinfosPrimarycategoryGetToOneRelated(string id, string[]? fieldsAppcategories = ()) returns AppCategoryResponse|error {
        string resourcePath = string `/v1/appInfos/${getEncodedUri(id)}/primaryCategory`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories};
        map<Encoding> queryParamEncoding = {"fields[appCategories]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppCategoryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories 
    # + return - Related resource 
    remote isolated function appinfosPrimarysubcategoryoneGetToOneRelated(string id, string[]? fieldsAppcategories = ()) returns AppCategoryResponse|error {
        string resourcePath = string `/v1/appInfos/${getEncodedUri(id)}/primarySubcategoryOne`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories};
        map<Encoding> queryParamEncoding = {"fields[appCategories]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppCategoryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories 
    # + return - Related resource 
    remote isolated function appinfosPrimarysubcategorytwoGetToOneRelated(string id, string[]? fieldsAppcategories = ()) returns AppCategoryResponse|error {
        string resourcePath = string `/v1/appInfos/${getEncodedUri(id)}/primarySubcategoryTwo`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories};
        map<Encoding> queryParamEncoding = {"fields[appCategories]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppCategoryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories 
    # + return - Related resource 
    remote isolated function appinfosSecondarycategoryGetToOneRelated(string id, string[]? fieldsAppcategories = ()) returns AppCategoryResponse|error {
        string resourcePath = string `/v1/appInfos/${getEncodedUri(id)}/secondaryCategory`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories};
        map<Encoding> queryParamEncoding = {"fields[appCategories]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppCategoryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories 
    # + return - Related resource 
    remote isolated function appinfosSecondarysubcategoryoneGetToOneRelated(string id, string[]? fieldsAppcategories = ()) returns AppCategoryResponse|error {
        string resourcePath = string `/v1/appInfos/${getEncodedUri(id)}/secondarySubcategoryOne`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories};
        map<Encoding> queryParamEncoding = {"fields[appCategories]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppCategoryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppcategories - the fields to include for returned resources of type appCategories 
    # + return - Related resource 
    remote isolated function appinfosSecondarysubcategorytwoGetToOneRelated(string id, string[]? fieldsAppcategories = ()) returns AppCategoryResponse|error {
        string resourcePath = string `/v1/appInfos/${getEncodedUri(id)}/secondarySubcategoryTwo`;
        map<anydata> queryParam = {"fields[appCategories]": fieldsAppcategories};
        map<Encoding> queryParamEncoding = {"fields[appCategories]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppCategoryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + 'limit - maximum resources per page 
    # + return - List of related linkages 
    remote isolated function apppreviewsetsApppreviewsGetToManyRelationship(string id, int? 'limit = ()) returns AppPreviewSetAppPreviewsLinkagesResponse|error {
        string resourcePath = string `/v1/appPreviewSets/${getEncodedUri(id)}/relationships/appPreviews`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AppPreviewSetAppPreviewsLinkagesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - List of related linkages 
    # + return - Success (no content) 
    remote isolated function apppreviewsetsApppreviewsReplaceToManyRelationship(string id, AppPreviewSetAppPreviewsLinkagesRequest payload) returns http:Response|error {
        string resourcePath = string `/v1/appPreviewSets/${getEncodedUri(id)}/relationships/appPreviews`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApppreviews - the fields to include for returned resources of type appPreviews 
    # + fieldsApppreviewsets - the fields to include for returned resources of type appPreviewSets 
    # + 'limit - maximum resources per page 
    # + include - comma-separated list of relationships to include 
    # + return - List of related resources 
    remote isolated function apppreviewsetsApppreviewsGetToManyRelated(string id, string[]? fieldsApppreviews = (), string[]? fieldsApppreviewsets = (), int? 'limit = (), string[]? include = ()) returns AppPreviewsResponse|error {
        string resourcePath = string `/v1/appPreviewSets/${getEncodedUri(id)}/appPreviews`;
        map<anydata> queryParam = {"fields[appPreviews]": fieldsApppreviews, "fields[appPreviewSets]": fieldsApppreviewsets, "limit": 'limit, "include": include};
        map<Encoding> queryParamEncoding = {"fields[appPreviews]": {style: FORM, explode: false}, "fields[appPreviewSets]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppPreviewsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsTerritories - the fields to include for returned resources of type territories 
    # + return - Related resource 
    remote isolated function apppricepointsTerritoryGetToOneRelated(string id, string[]? fieldsTerritories = ()) returns TerritoryResponse|error {
        string resourcePath = string `/v1/appPricePoints/${getEncodedUri(id)}/territory`;
        map<anydata> queryParam = {"fields[territories]": fieldsTerritories};
        map<Encoding> queryParamEncoding = {"fields[territories]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TerritoryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApppricepoints - the fields to include for returned resources of type appPricePoints 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function apppricetiersPricepointsGetToManyRelated(string id, string[]? fieldsApppricepoints = (), int? 'limit = ()) returns AppPricePointsResponse|error {
        string resourcePath = string `/v1/appPriceTiers/${getEncodedUri(id)}/pricePoints`;
        map<anydata> queryParam = {"fields[appPricePoints]": fieldsApppricepoints, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[appPricePoints]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppPricePointsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + 'limit - maximum resources per page 
    # + return - List of related linkages 
    remote isolated function appscreenshotsetsAppscreenshotsGetToManyRelationship(string id, int? 'limit = ()) returns AppScreenshotSetAppScreenshotsLinkagesResponse|error {
        string resourcePath = string `/v1/appScreenshotSets/${getEncodedUri(id)}/relationships/appScreenshots`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AppScreenshotSetAppScreenshotsLinkagesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - List of related linkages 
    # + return - Success (no content) 
    remote isolated function appscreenshotsetsAppscreenshotsReplaceToManyRelationship(string id, AppScreenshotSetAppScreenshotsLinkagesRequest payload) returns http:Response|error {
        string resourcePath = string `/v1/appScreenshotSets/${getEncodedUri(id)}/relationships/appScreenshots`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppscreenshotsets - the fields to include for returned resources of type appScreenshotSets 
    # + fieldsAppscreenshots - the fields to include for returned resources of type appScreenshots 
    # + 'limit - maximum resources per page 
    # + include - comma-separated list of relationships to include 
    # + return - List of related resources 
    remote isolated function appscreenshotsetsAppscreenshotsGetToManyRelated(string id, string[]? fieldsAppscreenshotsets = (), string[]? fieldsAppscreenshots = (), int? 'limit = (), string[]? include = ()) returns AppScreenshotsResponse|error {
        string resourcePath = string `/v1/appScreenshotSets/${getEncodedUri(id)}/appScreenshots`;
        map<anydata> queryParam = {"fields[appScreenshotSets]": fieldsAppscreenshotsets, "fields[appScreenshots]": fieldsAppscreenshots, "limit": 'limit, "include": include};
        map<Encoding> queryParamEncoding = {"fields[appScreenshotSets]": {style: FORM, explode: false}, "fields[appScreenshots]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppScreenshotsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppstorereviewdetails - the fields to include for returned resources of type appStoreReviewDetails 
    # + fieldsAppstorereviewattachments - the fields to include for returned resources of type appStoreReviewAttachments 
    # + 'limit - maximum resources per page 
    # + include - comma-separated list of relationships to include 
    # + return - List of related resources 
    remote isolated function appstorereviewdetailsAppstorereviewattachmentsGetToManyRelated(string id, string[]? fieldsAppstorereviewdetails = (), string[]? fieldsAppstorereviewattachments = (), int? 'limit = (), string[]? include = ()) returns AppStoreReviewAttachmentsResponse|error {
        string resourcePath = string `/v1/appStoreReviewDetails/${getEncodedUri(id)}/appStoreReviewAttachments`;
        map<anydata> queryParam = {"fields[appStoreReviewDetails]": fieldsAppstorereviewdetails, "fields[appStoreReviewAttachments]": fieldsAppstorereviewattachments, "limit": 'limit, "include": include};
        map<Encoding> queryParamEncoding = {"fields[appStoreReviewDetails]": {style: FORM, explode: false}, "fields[appStoreReviewAttachments]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppStoreReviewAttachmentsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + filterPreviewtype - filter by attribute 'previewType' 
    # + fieldsAppstoreversionlocalizations - the fields to include for returned resources of type appStoreVersionLocalizations 
    # + fieldsApppreviews - the fields to include for returned resources of type appPreviews 
    # + fieldsApppreviewsets - the fields to include for returned resources of type appPreviewSets 
    # + 'limit - maximum resources per page 
    # + include - comma-separated list of relationships to include 
    # + return - List of related resources 
    remote isolated function appstoreversionlocalizationsApppreviewsetsGetToManyRelated(string id, string[]? filterPreviewtype = (), string[]? fieldsAppstoreversionlocalizations = (), string[]? fieldsApppreviews = (), string[]? fieldsApppreviewsets = (), int? 'limit = (), string[]? include = ()) returns AppPreviewSetsResponse|error {
        string resourcePath = string `/v1/appStoreVersionLocalizations/${getEncodedUri(id)}/appPreviewSets`;
        map<anydata> queryParam = {"filter[previewType]": filterPreviewtype, "fields[appStoreVersionLocalizations]": fieldsAppstoreversionlocalizations, "fields[appPreviews]": fieldsApppreviews, "fields[appPreviewSets]": fieldsApppreviewsets, "limit": 'limit, "include": include};
        map<Encoding> queryParamEncoding = {"filter[previewType]": {style: FORM, explode: false}, "fields[appStoreVersionLocalizations]": {style: FORM, explode: false}, "fields[appPreviews]": {style: FORM, explode: false}, "fields[appPreviewSets]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppPreviewSetsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + filterScreenshotdisplaytype - filter by attribute 'screenshotDisplayType' 
    # + fieldsAppstoreversionlocalizations - the fields to include for returned resources of type appStoreVersionLocalizations 
    # + fieldsAppscreenshotsets - the fields to include for returned resources of type appScreenshotSets 
    # + fieldsAppscreenshots - the fields to include for returned resources of type appScreenshots 
    # + 'limit - maximum resources per page 
    # + include - comma-separated list of relationships to include 
    # + return - List of related resources 
    remote isolated function appstoreversionlocalizationsAppscreenshotsetsGetToManyRelated(string id, string[]? filterScreenshotdisplaytype = (), string[]? fieldsAppstoreversionlocalizations = (), string[]? fieldsAppscreenshotsets = (), string[]? fieldsAppscreenshots = (), int? 'limit = (), string[]? include = ()) returns AppScreenshotSetsResponse|error {
        string resourcePath = string `/v1/appStoreVersionLocalizations/${getEncodedUri(id)}/appScreenshotSets`;
        map<anydata> queryParam = {"filter[screenshotDisplayType]": filterScreenshotdisplaytype, "fields[appStoreVersionLocalizations]": fieldsAppstoreversionlocalizations, "fields[appScreenshotSets]": fieldsAppscreenshotsets, "fields[appScreenshots]": fieldsAppscreenshots, "limit": 'limit, "include": include};
        map<Encoding> queryParamEncoding = {"filter[screenshotDisplayType]": {style: FORM, explode: false}, "fields[appStoreVersionLocalizations]": {style: FORM, explode: false}, "fields[appScreenshotSets]": {style: FORM, explode: false}, "fields[appScreenshots]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppScreenshotSetsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAgeratingdeclarations - the fields to include for returned resources of type ageRatingDeclarations 
    # # Deprecated parameters
    # + fieldsAgeratingdeclarations -
    # + return - Related resource 
    # 
    # # Deprecated
    @deprecated
    remote isolated function appstoreversionsAgeratingdeclarationGetToOneRelated(string id, @deprecated string[]? fieldsAgeratingdeclarations = ()) returns AgeRatingDeclarationResponse|error {
        string resourcePath = string `/v1/appStoreVersions/${getEncodedUri(id)}/ageRatingDeclaration`;
        map<anydata> queryParam = {"fields[ageRatingDeclarations]": fieldsAgeratingdeclarations};
        map<Encoding> queryParamEncoding = {"fields[ageRatingDeclarations]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AgeRatingDeclarationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppstorereviewdetails - the fields to include for returned resources of type appStoreReviewDetails 
    # + fieldsAppstoreversions - the fields to include for returned resources of type appStoreVersions 
    # + fieldsAppstorereviewattachments - the fields to include for returned resources of type appStoreReviewAttachments 
    # + include - comma-separated list of relationships to include 
    # + return - Related resource 
    remote isolated function appstoreversionsAppstorereviewdetailGetToOneRelated(string id, string[]? fieldsAppstorereviewdetails = (), string[]? fieldsAppstoreversions = (), string[]? fieldsAppstorereviewattachments = (), string[]? include = ()) returns AppStoreReviewDetailResponse|error {
        string resourcePath = string `/v1/appStoreVersions/${getEncodedUri(id)}/appStoreReviewDetail`;
        map<anydata> queryParam = {"fields[appStoreReviewDetails]": fieldsAppstorereviewdetails, "fields[appStoreVersions]": fieldsAppstoreversions, "fields[appStoreReviewAttachments]": fieldsAppstorereviewattachments, "include": include};
        map<Encoding> queryParamEncoding = {"fields[appStoreReviewDetails]": {style: FORM, explode: false}, "fields[appStoreVersions]": {style: FORM, explode: false}, "fields[appStoreReviewAttachments]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppStoreReviewDetailResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppstoreversionlocalizations - the fields to include for returned resources of type appStoreVersionLocalizations 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function appstoreversionsAppstoreversionlocalizationsGetToManyRelated(string id, string[]? fieldsAppstoreversionlocalizations = (), int? 'limit = ()) returns AppStoreVersionLocalizationsResponse|error {
        string resourcePath = string `/v1/appStoreVersions/${getEncodedUri(id)}/appStoreVersionLocalizations`;
        map<anydata> queryParam = {"fields[appStoreVersionLocalizations]": fieldsAppstoreversionlocalizations, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[appStoreVersionLocalizations]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppStoreVersionLocalizationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppstoreversionphasedreleases - the fields to include for returned resources of type appStoreVersionPhasedReleases 
    # + return - Related resource 
    remote isolated function appstoreversionsAppstoreversionphasedreleaseGetToOneRelated(string id, string[]? fieldsAppstoreversionphasedreleases = ()) returns AppStoreVersionPhasedReleaseResponse|error {
        string resourcePath = string `/v1/appStoreVersions/${getEncodedUri(id)}/appStoreVersionPhasedRelease`;
        map<anydata> queryParam = {"fields[appStoreVersionPhasedReleases]": fieldsAppstoreversionphasedreleases};
        map<Encoding> queryParamEncoding = {"fields[appStoreVersionPhasedReleases]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppStoreVersionPhasedReleaseResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppstoreversions - the fields to include for returned resources of type appStoreVersions 
    # + fieldsAppstoreversionsubmissions - the fields to include for returned resources of type appStoreVersionSubmissions 
    # + include - comma-separated list of relationships to include 
    # + return - Related resource 
    remote isolated function appstoreversionsAppstoreversionsubmissionGetToOneRelated(string id, string[]? fieldsAppstoreversions = (), string[]? fieldsAppstoreversionsubmissions = (), string[]? include = ()) returns AppStoreVersionSubmissionResponse|error {
        string resourcePath = string `/v1/appStoreVersions/${getEncodedUri(id)}/appStoreVersionSubmission`;
        map<anydata> queryParam = {"fields[appStoreVersions]": fieldsAppstoreversions, "fields[appStoreVersionSubmissions]": fieldsAppstoreversionsubmissions, "include": include};
        map<Encoding> queryParamEncoding = {"fields[appStoreVersions]": {style: FORM, explode: false}, "fields[appStoreVersionSubmissions]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppStoreVersionSubmissionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Related linkage 
    remote isolated function appstoreversionsBuildGetToOneRelationship(string id) returns AppStoreVersionBuildLinkageResponse|error {
        string resourcePath = string `/v1/appStoreVersions/${getEncodedUri(id)}/relationships/build`;
        AppStoreVersionBuildLinkageResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - Related linkage 
    # + return - Success (no content) 
    remote isolated function appstoreversionsBuildUpdateToOneRelationship(string id, AppStoreVersionBuildLinkageRequest payload) returns http:Response|error {
        string resourcePath = string `/v1/appStoreVersions/${getEncodedUri(id)}/relationships/build`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + return - Related resource 
    remote isolated function appstoreversionsBuildGetToOneRelated(string id, string[]? fieldsBuilds = ()) returns BuildResponse|error {
        string resourcePath = string `/v1/appStoreVersions/${getEncodedUri(id)}/build`;
        map<anydata> queryParam = {"fields[builds]": fieldsBuilds};
        map<Encoding> queryParamEncoding = {"fields[builds]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BuildResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsIdfadeclarations - the fields to include for returned resources of type idfaDeclarations 
    # + return - Related resource 
    remote isolated function appstoreversionsIdfadeclarationGetToOneRelated(string id, string[]? fieldsIdfadeclarations = ()) returns IdfaDeclarationResponse|error {
        string resourcePath = string `/v1/appStoreVersions/${getEncodedUri(id)}/idfaDeclaration`;
        map<anydata> queryParam = {"fields[idfaDeclarations]": fieldsIdfadeclarations};
        map<Encoding> queryParamEncoding = {"fields[idfaDeclarations]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        IdfaDeclarationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsRoutingappcoverages - the fields to include for returned resources of type routingAppCoverages 
    # + return - Related resource 
    remote isolated function appstoreversionsRoutingappcoverageGetToOneRelated(string id, string[]? fieldsRoutingappcoverages = ()) returns RoutingAppCoverageResponse|error {
        string resourcePath = string `/v1/appStoreVersions/${getEncodedUri(id)}/routingAppCoverage`;
        map<anydata> queryParam = {"fields[routingAppCoverages]": fieldsRoutingappcoverages};
        map<Encoding> queryParamEncoding = {"fields[routingAppCoverages]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        RoutingAppCoverageResponse response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}/appInfos`;
        map<anydata> queryParam = {"fields[ageRatingDeclarations]": fieldsAgeratingdeclarations, "fields[appInfos]": fieldsAppinfos, "fields[appCategories]": fieldsAppcategories, "fields[appInfoLocalizations]": fieldsAppinfolocalizations, "fields[apps]": fieldsApps, "limit": 'limit, "include": include};
        map<Encoding> queryParamEncoding = {"fields[ageRatingDeclarations]": {style: FORM, explode: false}, "fields[appInfos]": {style: FORM, explode: false}, "fields[appCategories]": {style: FORM, explode: false}, "fields[appInfoLocalizations]": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppInfosResponse response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}/appStoreVersions`;
        map<anydata> queryParam = {"filter[appStoreState]": filterAppstorestate, "filter[platform]": filterPlatform, "filter[versionString]": filterVersionstring, "filter[id]": filterId, "fields[idfaDeclarations]": fieldsIdfadeclarations, "fields[appStoreVersionLocalizations]": fieldsAppstoreversionlocalizations, "fields[routingAppCoverages]": fieldsRoutingappcoverages, "fields[appStoreVersionPhasedReleases]": fieldsAppstoreversionphasedreleases, "fields[ageRatingDeclarations]": fieldsAgeratingdeclarations, "fields[appStoreReviewDetails]": fieldsAppstorereviewdetails, "fields[appStoreVersions]": fieldsAppstoreversions, "fields[builds]": fieldsBuilds, "fields[appStoreVersionSubmissions]": fieldsAppstoreversionsubmissions, "fields[apps]": fieldsApps, "limit": 'limit, "include": include};
        map<Encoding> queryParamEncoding = {"filter[appStoreState]": {style: FORM, explode: false}, "filter[platform]": {style: FORM, explode: false}, "filter[versionString]": {style: FORM, explode: false}, "filter[id]": {style: FORM, explode: false}, "fields[idfaDeclarations]": {style: FORM, explode: false}, "fields[appStoreVersionLocalizations]": {style: FORM, explode: false}, "fields[routingAppCoverages]": {style: FORM, explode: false}, "fields[appStoreVersionPhasedReleases]": {style: FORM, explode: false}, "fields[ageRatingDeclarations]": {style: FORM, explode: false}, "fields[appStoreReviewDetails]": {style: FORM, explode: false}, "fields[appStoreVersions]": {style: FORM, explode: false}, "fields[builds]": {style: FORM, explode: false}, "fields[appStoreVersionSubmissions]": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppStoreVersionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsTerritories - the fields to include for returned resources of type territories 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function appsAvailableterritoriesGetToManyRelated(string id, string[]? fieldsTerritories = (), int? 'limit = ()) returns TerritoriesResponse|error {
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}/availableTerritories`;
        map<anydata> queryParam = {"fields[territories]": fieldsTerritories, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[territories]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TerritoriesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBetaapplocalizations - the fields to include for returned resources of type betaAppLocalizations 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function appsBetaapplocalizationsGetToManyRelated(string id, string[]? fieldsBetaapplocalizations = (), int? 'limit = ()) returns BetaAppLocalizationsResponse|error {
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}/betaAppLocalizations`;
        map<anydata> queryParam = {"fields[betaAppLocalizations]": fieldsBetaapplocalizations, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[betaAppLocalizations]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaAppLocalizationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBetaappreviewdetails - the fields to include for returned resources of type betaAppReviewDetails 
    # + return - Related resource 
    remote isolated function appsBetaappreviewdetailGetToOneRelated(string id, string[]? fieldsBetaappreviewdetails = ()) returns BetaAppReviewDetailResponse|error {
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}/betaAppReviewDetail`;
        map<anydata> queryParam = {"fields[betaAppReviewDetails]": fieldsBetaappreviewdetails};
        map<Encoding> queryParamEncoding = {"fields[betaAppReviewDetails]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaAppReviewDetailResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBetagroups - the fields to include for returned resources of type betaGroups 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function appsBetagroupsGetToManyRelated(string id, string[]? fieldsBetagroups = (), int? 'limit = ()) returns BetaGroupsResponse|error {
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}/betaGroups`;
        map<anydata> queryParam = {"fields[betaGroups]": fieldsBetagroups, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[betaGroups]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaGroupsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBetalicenseagreements - the fields to include for returned resources of type betaLicenseAgreements 
    # + return - Related resource 
    remote isolated function appsBetalicenseagreementGetToOneRelated(string id, string[]? fieldsBetalicenseagreements = ()) returns BetaLicenseAgreementResponse|error {
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}/betaLicenseAgreement`;
        map<anydata> queryParam = {"fields[betaLicenseAgreements]": fieldsBetalicenseagreements};
        map<Encoding> queryParamEncoding = {"fields[betaLicenseAgreements]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaLicenseAgreementResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function appsBetatestersDeleteToManyRelationship(string id) returns http:Response|error {
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}/relationships/betaTesters`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function appsBuildsGetToManyRelated(string id, string[]? fieldsBuilds = (), int? 'limit = ()) returns BuildsResponse|error {
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}/builds`;
        map<anydata> queryParam = {"fields[builds]": fieldsBuilds, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[builds]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BuildsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsEnduserlicenseagreements - the fields to include for returned resources of type endUserLicenseAgreements 
    # + return - Related resource 
    remote isolated function appsEnduserlicenseagreementGetToOneRelated(string id, string[]? fieldsEnduserlicenseagreements = ()) returns EndUserLicenseAgreementResponse|error {
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}/endUserLicenseAgreement`;
        map<anydata> queryParam = {"fields[endUserLicenseAgreements]": fieldsEnduserlicenseagreements};
        map<Encoding> queryParamEncoding = {"fields[endUserLicenseAgreements]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EndUserLicenseAgreementResponse response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}/gameCenterEnabledVersions`;
        map<anydata> queryParam = {"filter[platform]": filterPlatform, "filter[versionString]": filterVersionstring, "filter[id]": filterId, "sort": sort, "fields[gameCenterEnabledVersions]": fieldsGamecenterenabledversions, "fields[apps]": fieldsApps, "limit": 'limit, "include": include};
        map<Encoding> queryParamEncoding = {"filter[platform]": {style: FORM, explode: false}, "filter[versionString]": {style: FORM, explode: false}, "filter[id]": {style: FORM, explode: false}, "sort": {style: FORM, explode: false}, "fields[gameCenterEnabledVersions]": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GameCenterEnabledVersionsResponse response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}/inAppPurchases`;
        map<anydata> queryParam = {"filter[inAppPurchaseType]": filterInapppurchasetype, "filter[canBeSubmitted]": filterCanbesubmitted, "sort": sort, "fields[inAppPurchases]": fieldsInapppurchases, "fields[apps]": fieldsApps, "limit": 'limit, "include": include};
        map<Encoding> queryParamEncoding = {"filter[inAppPurchaseType]": {style: FORM, explode: false}, "filter[canBeSubmitted]": {style: FORM, explode: false}, "sort": {style: FORM, explode: false}, "fields[inAppPurchases]": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InAppPurchasesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + filterDevicetype - filter by attribute 'deviceType' 
    # + filterMetrictype - filter by attribute 'metricType' 
    # + filterPlatform - filter by attribute 'platform' 
    # + return - List of related resources 
    remote isolated function appsPerfpowermetricsGetToManyRelated(string id, string[]? filterDevicetype = (), string[]? filterMetrictype = (), string[]? filterPlatform = ()) returns PerfPowerMetricsResponse|error {
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}/perfPowerMetrics`;
        map<anydata> queryParam = {"filter[deviceType]": filterDevicetype, "filter[metricType]": filterMetrictype, "filter[platform]": filterPlatform};
        map<Encoding> queryParamEncoding = {"filter[deviceType]": {style: FORM, explode: false}, "filter[metricType]": {style: FORM, explode: false}, "filter[platform]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PerfPowerMetricsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApppreorders - the fields to include for returned resources of type appPreOrders 
    # + return - Related resource 
    remote isolated function appsPreorderGetToOneRelated(string id, string[]? fieldsApppreorders = ()) returns AppPreOrderResponse|error {
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}/preOrder`;
        map<anydata> queryParam = {"fields[appPreOrders]": fieldsApppreorders};
        map<Encoding> queryParamEncoding = {"fields[appPreOrders]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppPreOrderResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsPrereleaseversions - the fields to include for returned resources of type preReleaseVersions 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function appsPrereleaseversionsGetToManyRelated(string id, string[]? fieldsPrereleaseversions = (), int? 'limit = ()) returns PreReleaseVersionsResponse|error {
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}/preReleaseVersions`;
        map<anydata> queryParam = {"fields[preReleaseVersions]": fieldsPrereleaseversions, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[preReleaseVersions]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PreReleaseVersionsResponse response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v1/apps/${getEncodedUri(id)}/prices`;
        map<anydata> queryParam = {"fields[appPrices]": fieldsAppprices, "fields[appPriceTiers]": fieldsApppricetiers, "fields[apps]": fieldsApps, "limit": 'limit, "include": include};
        map<Encoding> queryParamEncoding = {"fields[appPrices]": {style: FORM, explode: false}, "fields[appPriceTiers]": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppPricesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + return - Related resource 
    remote isolated function betaapplocalizationsAppGetToOneRelated(string id, string[]? fieldsApps = ()) returns AppResponse|error {
        string resourcePath = string `/v1/betaAppLocalizations/${getEncodedUri(id)}/app`;
        map<anydata> queryParam = {"fields[apps]": fieldsApps};
        map<Encoding> queryParamEncoding = {"fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + return - Related resource 
    remote isolated function betaappreviewdetailsAppGetToOneRelated(string id, string[]? fieldsApps = ()) returns AppResponse|error {
        string resourcePath = string `/v1/betaAppReviewDetails/${getEncodedUri(id)}/app`;
        map<anydata> queryParam = {"fields[apps]": fieldsApps};
        map<Encoding> queryParamEncoding = {"fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + return - Related resource 
    remote isolated function betaappreviewsubmissionsBuildGetToOneRelated(string id, string[]? fieldsBuilds = ()) returns BuildResponse|error {
        string resourcePath = string `/v1/betaAppReviewSubmissions/${getEncodedUri(id)}/build`;
        map<anydata> queryParam = {"fields[builds]": fieldsBuilds};
        map<Encoding> queryParamEncoding = {"fields[builds]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BuildResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + return - Related resource 
    remote isolated function betabuildlocalizationsBuildGetToOneRelated(string id, string[]? fieldsBuilds = ()) returns BuildResponse|error {
        string resourcePath = string `/v1/betaBuildLocalizations/${getEncodedUri(id)}/build`;
        map<anydata> queryParam = {"fields[builds]": fieldsBuilds};
        map<Encoding> queryParamEncoding = {"fields[builds]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BuildResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + return - Related resource 
    remote isolated function betagroupsAppGetToOneRelated(string id, string[]? fieldsApps = ()) returns AppResponse|error {
        string resourcePath = string `/v1/betaGroups/${getEncodedUri(id)}/app`;
        map<anydata> queryParam = {"fields[apps]": fieldsApps};
        map<Encoding> queryParamEncoding = {"fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + 'limit - maximum resources per page 
    # + return - List of related linkages 
    remote isolated function betagroupsBetatestersGetToManyRelationship(string id, int? 'limit = ()) returns BetaGroupBetaTestersLinkagesResponse|error {
        string resourcePath = string `/v1/betaGroups/${getEncodedUri(id)}/relationships/betaTesters`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BetaGroupBetaTestersLinkagesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - List of related linkages 
    # + return - Success (no content) 
    remote isolated function betagroupsBetatestersCreateToManyRelationship(string id, BetaGroupBetaTestersLinkagesRequest payload) returns http:Response|error {
        string resourcePath = string `/v1/betaGroups/${getEncodedUri(id)}/relationships/betaTesters`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function betagroupsBetatestersDeleteToManyRelationship(string id) returns http:Response|error {
        string resourcePath = string `/v1/betaGroups/${getEncodedUri(id)}/relationships/betaTesters`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBetatesters - the fields to include for returned resources of type betaTesters 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function betagroupsBetatestersGetToManyRelated(string id, string[]? fieldsBetatesters = (), int? 'limit = ()) returns BetaTestersResponse|error {
        string resourcePath = string `/v1/betaGroups/${getEncodedUri(id)}/betaTesters`;
        map<anydata> queryParam = {"fields[betaTesters]": fieldsBetatesters, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[betaTesters]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaTestersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + 'limit - maximum resources per page 
    # + return - List of related linkages 
    remote isolated function betagroupsBuildsGetToManyRelationship(string id, int? 'limit = ()) returns BetaGroupBuildsLinkagesResponse|error {
        string resourcePath = string `/v1/betaGroups/${getEncodedUri(id)}/relationships/builds`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BetaGroupBuildsLinkagesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - List of related linkages 
    # + return - Success (no content) 
    remote isolated function betagroupsBuildsCreateToManyRelationship(string id, BetaGroupBuildsLinkagesRequest payload) returns http:Response|error {
        string resourcePath = string `/v1/betaGroups/${getEncodedUri(id)}/relationships/builds`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function betagroupsBuildsDeleteToManyRelationship(string id) returns http:Response|error {
        string resourcePath = string `/v1/betaGroups/${getEncodedUri(id)}/relationships/builds`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function betagroupsBuildsGetToManyRelated(string id, string[]? fieldsBuilds = (), int? 'limit = ()) returns BuildsResponse|error {
        string resourcePath = string `/v1/betaGroups/${getEncodedUri(id)}/builds`;
        map<anydata> queryParam = {"fields[builds]": fieldsBuilds, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[builds]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BuildsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + return - Related resource 
    remote isolated function betalicenseagreementsAppGetToOneRelated(string id, string[]? fieldsApps = ()) returns AppResponse|error {
        string resourcePath = string `/v1/betaLicenseAgreements/${getEncodedUri(id)}/app`;
        map<anydata> queryParam = {"fields[apps]": fieldsApps};
        map<Encoding> queryParamEncoding = {"fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + 'limit - maximum resources per page 
    # + return - List of related linkages 
    remote isolated function betatestersAppsGetToManyRelationship(string id, int? 'limit = ()) returns BetaTesterAppsLinkagesResponse|error {
        string resourcePath = string `/v1/betaTesters/${getEncodedUri(id)}/relationships/apps`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BetaTesterAppsLinkagesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function betatestersAppsDeleteToManyRelationship(string id) returns http:Response|error {
        string resourcePath = string `/v1/betaTesters/${getEncodedUri(id)}/relationships/apps`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function betatestersAppsGetToManyRelated(string id, string[]? fieldsApps = (), int? 'limit = ()) returns AppsResponse|error {
        string resourcePath = string `/v1/betaTesters/${getEncodedUri(id)}/apps`;
        map<anydata> queryParam = {"fields[apps]": fieldsApps, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + 'limit - maximum resources per page 
    # + return - List of related linkages 
    remote isolated function betatestersBetagroupsGetToManyRelationship(string id, int? 'limit = ()) returns BetaTesterBetaGroupsLinkagesResponse|error {
        string resourcePath = string `/v1/betaTesters/${getEncodedUri(id)}/relationships/betaGroups`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BetaTesterBetaGroupsLinkagesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - List of related linkages 
    # + return - Success (no content) 
    remote isolated function betatestersBetagroupsCreateToManyRelationship(string id, BetaTesterBetaGroupsLinkagesRequest payload) returns http:Response|error {
        string resourcePath = string `/v1/betaTesters/${getEncodedUri(id)}/relationships/betaGroups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function betatestersBetagroupsDeleteToManyRelationship(string id) returns http:Response|error {
        string resourcePath = string `/v1/betaTesters/${getEncodedUri(id)}/relationships/betaGroups`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBetagroups - the fields to include for returned resources of type betaGroups 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function betatestersBetagroupsGetToManyRelated(string id, string[]? fieldsBetagroups = (), int? 'limit = ()) returns BetaGroupsResponse|error {
        string resourcePath = string `/v1/betaTesters/${getEncodedUri(id)}/betaGroups`;
        map<anydata> queryParam = {"fields[betaGroups]": fieldsBetagroups, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[betaGroups]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaGroupsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + 'limit - maximum resources per page 
    # + return - List of related linkages 
    remote isolated function betatestersBuildsGetToManyRelationship(string id, int? 'limit = ()) returns BetaTesterBuildsLinkagesResponse|error {
        string resourcePath = string `/v1/betaTesters/${getEncodedUri(id)}/relationships/builds`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BetaTesterBuildsLinkagesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - List of related linkages 
    # + return - Success (no content) 
    remote isolated function betatestersBuildsCreateToManyRelationship(string id, BetaTesterBuildsLinkagesRequest payload) returns http:Response|error {
        string resourcePath = string `/v1/betaTesters/${getEncodedUri(id)}/relationships/builds`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function betatestersBuildsDeleteToManyRelationship(string id) returns http:Response|error {
        string resourcePath = string `/v1/betaTesters/${getEncodedUri(id)}/relationships/builds`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function betatestersBuildsGetToManyRelated(string id, string[]? fieldsBuilds = (), int? 'limit = ()) returns BuildsResponse|error {
        string resourcePath = string `/v1/betaTesters/${getEncodedUri(id)}/builds`;
        map<anydata> queryParam = {"fields[builds]": fieldsBuilds, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[builds]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BuildsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + return - Related resource 
    remote isolated function buildbetadetailsBuildGetToOneRelated(string id, string[]? fieldsBuilds = ()) returns BuildResponse|error {
        string resourcePath = string `/v1/buildBetaDetails/${getEncodedUri(id)}/build`;
        map<anydata> queryParam = {"fields[builds]": fieldsBuilds};
        map<Encoding> queryParamEncoding = {"fields[builds]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BuildResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + return - Related resource 
    remote isolated function buildsAppGetToOneRelated(string id, string[]? fieldsApps = ()) returns AppResponse|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/app`;
        map<anydata> queryParam = {"fields[apps]": fieldsApps};
        map<Encoding> queryParamEncoding = {"fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Related linkage 
    remote isolated function buildsAppencryptiondeclarationGetToOneRelationship(string id) returns BuildAppEncryptionDeclarationLinkageResponse|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/relationships/appEncryptionDeclaration`;
        BuildAppEncryptionDeclarationLinkageResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - Related linkage 
    # + return - Success (no content) 
    remote isolated function buildsAppencryptiondeclarationUpdateToOneRelationship(string id, BuildAppEncryptionDeclarationLinkageRequest payload) returns http:Response|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/relationships/appEncryptionDeclaration`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppencryptiondeclarations - the fields to include for returned resources of type appEncryptionDeclarations 
    # + return - Related resource 
    remote isolated function buildsAppencryptiondeclarationGetToOneRelated(string id, string[]? fieldsAppencryptiondeclarations = ()) returns AppEncryptionDeclarationResponse|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/appEncryptionDeclaration`;
        map<anydata> queryParam = {"fields[appEncryptionDeclarations]": fieldsAppencryptiondeclarations};
        map<Encoding> queryParamEncoding = {"fields[appEncryptionDeclarations]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppEncryptionDeclarationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsAppstoreversions - the fields to include for returned resources of type appStoreVersions 
    # + return - Related resource 
    remote isolated function buildsAppstoreversionGetToOneRelated(string id, string[]? fieldsAppstoreversions = ()) returns AppStoreVersionResponse|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/appStoreVersion`;
        map<anydata> queryParam = {"fields[appStoreVersions]": fieldsAppstoreversions};
        map<Encoding> queryParamEncoding = {"fields[appStoreVersions]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppStoreVersionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBetaappreviewsubmissions - the fields to include for returned resources of type betaAppReviewSubmissions 
    # + return - Related resource 
    remote isolated function buildsBetaappreviewsubmissionGetToOneRelated(string id, string[]? fieldsBetaappreviewsubmissions = ()) returns BetaAppReviewSubmissionResponse|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/betaAppReviewSubmission`;
        map<anydata> queryParam = {"fields[betaAppReviewSubmissions]": fieldsBetaappreviewsubmissions};
        map<Encoding> queryParamEncoding = {"fields[betaAppReviewSubmissions]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaAppReviewSubmissionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBetabuildlocalizations - the fields to include for returned resources of type betaBuildLocalizations 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function buildsBetabuildlocalizationsGetToManyRelated(string id, string[]? fieldsBetabuildlocalizations = (), int? 'limit = ()) returns BetaBuildLocalizationsResponse|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/betaBuildLocalizations`;
        map<anydata> queryParam = {"fields[betaBuildLocalizations]": fieldsBetabuildlocalizations, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[betaBuildLocalizations]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaBuildLocalizationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - List of related linkages 
    # + return - Success (no content) 
    remote isolated function buildsBetagroupsCreateToManyRelationship(string id, BuildBetaGroupsLinkagesRequest payload) returns http:Response|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/relationships/betaGroups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function buildsBetagroupsDeleteToManyRelationship(string id) returns http:Response|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/relationships/betaGroups`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBuildbetadetails - the fields to include for returned resources of type buildBetaDetails 
    # + return - Related resource 
    remote isolated function buildsBuildbetadetailGetToOneRelated(string id, string[]? fieldsBuildbetadetails = ()) returns BuildBetaDetailResponse|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/buildBetaDetail`;
        map<anydata> queryParam = {"fields[buildBetaDetails]": fieldsBuildbetadetails};
        map<Encoding> queryParamEncoding = {"fields[buildBetaDetails]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BuildBetaDetailResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + filterDiagnostictype - filter by attribute 'diagnosticType' 
    # + fieldsDiagnosticsignatures - the fields to include for returned resources of type diagnosticSignatures 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function buildsDiagnosticsignaturesGetToManyRelated(string id, string[]? filterDiagnostictype = (), string[]? fieldsDiagnosticsignatures = (), int? 'limit = ()) returns DiagnosticSignaturesResponse|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/diagnosticSignatures`;
        map<anydata> queryParam = {"filter[diagnosticType]": filterDiagnostictype, "fields[diagnosticSignatures]": fieldsDiagnosticsignatures, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"filter[diagnosticType]": {style: FORM, explode: false}, "fields[diagnosticSignatures]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DiagnosticSignaturesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBuildicons - the fields to include for returned resources of type buildIcons 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function buildsIconsGetToManyRelated(string id, string[]? fieldsBuildicons = (), int? 'limit = ()) returns BuildIconsResponse|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/icons`;
        map<anydata> queryParam = {"fields[buildIcons]": fieldsBuildicons, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[buildIcons]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BuildIconsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + 'limit - maximum resources per page 
    # + return - List of related linkages 
    remote isolated function buildsIndividualtestersGetToManyRelationship(string id, int? 'limit = ()) returns BuildIndividualTestersLinkagesResponse|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/relationships/individualTesters`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BuildIndividualTestersLinkagesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - List of related linkages 
    # + return - Success (no content) 
    remote isolated function buildsIndividualtestersCreateToManyRelationship(string id, BuildIndividualTestersLinkagesRequest payload) returns http:Response|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/relationships/individualTesters`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function buildsIndividualtestersDeleteToManyRelationship(string id) returns http:Response|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/relationships/individualTesters`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBetatesters - the fields to include for returned resources of type betaTesters 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function buildsIndividualtestersGetToManyRelated(string id, string[]? fieldsBetatesters = (), int? 'limit = ()) returns BetaTestersResponse|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/individualTesters`;
        map<anydata> queryParam = {"fields[betaTesters]": fieldsBetatesters, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[betaTesters]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BetaTestersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + filterDevicetype - filter by attribute 'deviceType' 
    # + filterMetrictype - filter by attribute 'metricType' 
    # + filterPlatform - filter by attribute 'platform' 
    # + return - List of related resources 
    remote isolated function buildsPerfpowermetricsGetToManyRelated(string id, string[]? filterDevicetype = (), string[]? filterMetrictype = (), string[]? filterPlatform = ()) returns PerfPowerMetricsResponse|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/perfPowerMetrics`;
        map<anydata> queryParam = {"filter[deviceType]": filterDevicetype, "filter[metricType]": filterMetrictype, "filter[platform]": filterPlatform};
        map<Encoding> queryParamEncoding = {"filter[deviceType]": {style: FORM, explode: false}, "filter[metricType]": {style: FORM, explode: false}, "filter[platform]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PerfPowerMetricsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsPrereleaseversions - the fields to include for returned resources of type preReleaseVersions 
    # + return - Related resource 
    remote isolated function buildsPrereleaseversionGetToOneRelated(string id, string[]? fieldsPrereleaseversions = ()) returns PrereleaseVersionResponse|error {
        string resourcePath = string `/v1/builds/${getEncodedUri(id)}/preReleaseVersion`;
        map<anydata> queryParam = {"fields[preReleaseVersions]": fieldsPrereleaseversions};
        map<Encoding> queryParamEncoding = {"fields[preReleaseVersions]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PrereleaseVersionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + return - Related resource 
    remote isolated function bundleidsAppGetToOneRelated(string id, string[]? fieldsApps = ()) returns AppResponse|error {
        string resourcePath = string `/v1/bundleIds/${getEncodedUri(id)}/app`;
        map<anydata> queryParam = {"fields[apps]": fieldsApps};
        map<Encoding> queryParamEncoding = {"fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBundleidcapabilities - the fields to include for returned resources of type bundleIdCapabilities 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function bundleidsBundleidcapabilitiesGetToManyRelated(string id, string[]? fieldsBundleidcapabilities = (), int? 'limit = ()) returns BundleIdCapabilitiesResponse|error {
        string resourcePath = string `/v1/bundleIds/${getEncodedUri(id)}/bundleIdCapabilities`;
        map<anydata> queryParam = {"fields[bundleIdCapabilities]": fieldsBundleidcapabilities, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[bundleIdCapabilities]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BundleIdCapabilitiesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsProfiles - the fields to include for returned resources of type profiles 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function bundleidsProfilesGetToManyRelated(string id, string[]? fieldsProfiles = (), int? 'limit = ()) returns ProfilesResponse|error {
        string resourcePath = string `/v1/bundleIds/${getEncodedUri(id)}/profiles`;
        map<anydata> queryParam = {"fields[profiles]": fieldsProfiles, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[profiles]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ProfilesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function diagnosticsignaturesLogsGetToManyRelated(string id, int? 'limit = ()) returns DiagnosticLogsResponse|error {
        string resourcePath = string `/v1/diagnosticSignatures/${getEncodedUri(id)}/logs`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DiagnosticLogsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsTerritories - the fields to include for returned resources of type territories 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function enduserlicenseagreementsTerritoriesGetToManyRelated(string id, string[]? fieldsTerritories = (), int? 'limit = ()) returns TerritoriesResponse|error {
        string resourcePath = string `/v1/endUserLicenseAgreements/${getEncodedUri(id)}/territories`;
        map<anydata> queryParam = {"fields[territories]": fieldsTerritories, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[territories]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TerritoriesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + 'limit - maximum resources per page 
    # + return - List of related linkages 
    remote isolated function gamecenterenabledversionsCompatibleversionsGetToManyRelationship(string id, int? 'limit = ()) returns GameCenterEnabledVersionCompatibleVersionsLinkagesResponse|error {
        string resourcePath = string `/v1/gameCenterEnabledVersions/${getEncodedUri(id)}/relationships/compatibleVersions`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GameCenterEnabledVersionCompatibleVersionsLinkagesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - List of related linkages 
    # + return - Success (no content) 
    remote isolated function gamecenterenabledversionsCompatibleversionsCreateToManyRelationship(string id, GameCenterEnabledVersionCompatibleVersionsLinkagesRequest payload) returns http:Response|error {
        string resourcePath = string `/v1/gameCenterEnabledVersions/${getEncodedUri(id)}/relationships/compatibleVersions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function gamecenterenabledversionsCompatibleversionsDeleteToManyRelationship(string id) returns http:Response|error {
        string resourcePath = string `/v1/gameCenterEnabledVersions/${getEncodedUri(id)}/relationships/compatibleVersions`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - List of related linkages 
    # + return - Success (no content) 
    remote isolated function gamecenterenabledversionsCompatibleversionsReplaceToManyRelationship(string id, GameCenterEnabledVersionCompatibleVersionsLinkagesRequest payload) returns http:Response|error {
        string resourcePath = string `/v1/gameCenterEnabledVersions/${getEncodedUri(id)}/relationships/compatibleVersions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
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
        string resourcePath = string `/v1/gameCenterEnabledVersions/${getEncodedUri(id)}/compatibleVersions`;
        map<anydata> queryParam = {"filter[platform]": filterPlatform, "filter[versionString]": filterVersionstring, "filter[app]": filterApp, "filter[id]": filterId, "sort": sort, "fields[gameCenterEnabledVersions]": fieldsGamecenterenabledversions, "fields[apps]": fieldsApps, "limit": 'limit, "include": include};
        map<Encoding> queryParamEncoding = {"filter[platform]": {style: FORM, explode: false}, "filter[versionString]": {style: FORM, explode: false}, "filter[app]": {style: FORM, explode: false}, "filter[id]": {style: FORM, explode: false}, "sort": {style: FORM, explode: false}, "fields[gameCenterEnabledVersions]": {style: FORM, explode: false}, "fields[apps]": {style: FORM, explode: false}, "include": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GameCenterEnabledVersionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + return - Related resource 
    remote isolated function prereleaseversionsAppGetToOneRelated(string id, string[]? fieldsApps = ()) returns AppResponse|error {
        string resourcePath = string `/v1/preReleaseVersions/${getEncodedUri(id)}/app`;
        map<anydata> queryParam = {"fields[apps]": fieldsApps};
        map<Encoding> queryParamEncoding = {"fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBuilds - the fields to include for returned resources of type builds 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function prereleaseversionsBuildsGetToManyRelated(string id, string[]? fieldsBuilds = (), int? 'limit = ()) returns BuildsResponse|error {
        string resourcePath = string `/v1/preReleaseVersions/${getEncodedUri(id)}/builds`;
        map<anydata> queryParam = {"fields[builds]": fieldsBuilds, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[builds]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BuildsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsBundleids - the fields to include for returned resources of type bundleIds 
    # + return - Related resource 
    remote isolated function profilesBundleidGetToOneRelated(string id, string[]? fieldsBundleids = ()) returns BundleIdResponse|error {
        string resourcePath = string `/v1/profiles/${getEncodedUri(id)}/bundleId`;
        map<anydata> queryParam = {"fields[bundleIds]": fieldsBundleids};
        map<Encoding> queryParamEncoding = {"fields[bundleIds]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BundleIdResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsCertificates - the fields to include for returned resources of type certificates 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function profilesCertificatesGetToManyRelated(string id, string[]? fieldsCertificates = (), int? 'limit = ()) returns CertificatesResponse|error {
        string resourcePath = string `/v1/profiles/${getEncodedUri(id)}/certificates`;
        map<anydata> queryParam = {"fields[certificates]": fieldsCertificates, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[certificates]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CertificatesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsDevices - the fields to include for returned resources of type devices 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function profilesDevicesGetToManyRelated(string id, string[]? fieldsDevices = (), int? 'limit = ()) returns DevicesResponse|error {
        string resourcePath = string `/v1/profiles/${getEncodedUri(id)}/devices`;
        map<anydata> queryParam = {"fields[devices]": fieldsDevices, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[devices]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DevicesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function userinvitationsVisibleappsGetToManyRelated(string id, string[]? fieldsApps = (), int? 'limit = ()) returns AppsResponse|error {
        string resourcePath = string `/v1/userInvitations/${getEncodedUri(id)}/visibleApps`;
        map<anydata> queryParam = {"fields[apps]": fieldsApps, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + 'limit - maximum resources per page 
    # + return - List of related linkages 
    remote isolated function usersVisibleappsGetToManyRelationship(string id, int? 'limit = ()) returns UserVisibleAppsLinkagesResponse|error {
        string resourcePath = string `/v1/users/${getEncodedUri(id)}/relationships/visibleApps`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UserVisibleAppsLinkagesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - List of related linkages 
    # + return - Success (no content) 
    remote isolated function usersVisibleappsCreateToManyRelationship(string id, UserVisibleAppsLinkagesRequest payload) returns http:Response|error {
        string resourcePath = string `/v1/users/${getEncodedUri(id)}/relationships/visibleApps`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + return - Success (no content) 
    remote isolated function usersVisibleappsDeleteToManyRelationship(string id) returns http:Response|error {
        string resourcePath = string `/v1/users/${getEncodedUri(id)}/relationships/visibleApps`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + payload - List of related linkages 
    # + return - Success (no content) 
    remote isolated function usersVisibleappsReplaceToManyRelationship(string id, UserVisibleAppsLinkagesRequest payload) returns http:Response|error {
        string resourcePath = string `/v1/users/${getEncodedUri(id)}/relationships/visibleApps`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    #
    # + id - the id of the requested resource 
    # + fieldsApps - the fields to include for returned resources of type apps 
    # + 'limit - maximum resources per page 
    # + return - List of related resources 
    remote isolated function usersVisibleappsGetToManyRelated(string id, string[]? fieldsApps = (), int? 'limit = ()) returns AppsResponse|error {
        string resourcePath = string `/v1/users/${getEncodedUri(id)}/visibleApps`;
        map<anydata> queryParam = {"fields[apps]": fieldsApps, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"fields[apps]": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AppsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
