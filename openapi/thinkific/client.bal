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

# Thinkific's public API can be used to integrate your application with your Thinkific site.
@display {label: "Thinkific", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig? apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # For private apps login to your Thinkific account and obtain API Key and Subdomain using the guide [here](https://developers.thinkific.com/api/api-key-auth/)
    # For public apps create a Thinkific Partner Account and register an App to access the credentials. Follow the guide [here](https://developers.thinkific.com/api/authorization/) for more details. 
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.thinkific.com/api/public/v1") returns error? {
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
        if config.auth is ApiKeysConfig {
            self.apiKeyConfig = (<ApiKeysConfig>config.auth).cloneReadOnly();
        } else {
            config.auth = <http:BearerTokenConfig>config.auth;
            self.apiKeyConfig = ();
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # List a bundle
    #
    # + id - ID of the Bundle in the form of an integer 
    # + return - Bundle Response 
    remote isolated function getBundleByID(decimal id) returns BundleResponse|error {
        string resourcePath = string `/bundles/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BundleResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Courses by bundle ID
    #
    # + id - ID of the Bundle in the form of an integer 
    # + page - The page within the collection to fetch 
    # + 'limit - The number of items to be returned 
    # + return - Courses Response 
    remote isolated function listCoursesByBundleId(decimal id, decimal page = 1.0, decimal 'limit = 25.0) returns GetCoursesResponse|error {
        string resourcePath = string `/bundles/${getEncodedUri(id)}/courses`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetCoursesResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List a enrollments in a bundle
    #
    # + id - ID of the Bundle in the form of an integer 
    # + page - The page within the collection to fetch 
    # + 'limit - The number of items to be returned 
    # + queryUserId - Search Bundle Enrollments by User ID. 
    # + queryEmail - Search Bundle Enrollments by User email 
    # + queryCompleted - Filter for only completed Bundle Enrollments when set to true. 
    # + queryExpired - Filter for only expired Bundle Enrollments when set to true. 
    # + queryCreatedAfter - Filter for only Enrollments created after the date specified. 
    # + queryCreatedBefore - Filter for only Enrollments created before the date specified. 
    # + queryCreatedOn - Filter for only Enrollments created on the date specified. 
    # + queryCreatedOnOrAfter - Filter for only Enrollments created on or after the date specified. 
    # + queryCreatedOnOrBefore - Filter for only Enrollments created on or before the date specified. 
    # + queryUpdatedAfter - Filter for only Enrollments updated after the date specified. 
    # + queryUpdatedBefore - Filter for only Enrollments updated before the date specified. 
    # + queryUpdatedOn - Filter for only Enrollments updated on the date specified. 
    # + queryUpdatedOnOrAfter - Filter for only Enrollments created on or after the date specified. 
    # + queryUpdatedOnOrBefore - Filter for only Enrollments updated on or before the date specified. 
    # + return - Bundle Response 
    remote isolated function getBundleEnrollments(decimal id, decimal page = 1.0, decimal 'limit = 25.0, decimal? queryUserId = (), string? queryEmail = (), string? queryCompleted = (), string? queryExpired = (), string? queryCreatedAfter = (), string? queryCreatedBefore = (), string? queryCreatedOn = (), string? queryCreatedOnOrAfter = (), string? queryCreatedOnOrBefore = (), string? queryUpdatedAfter = (), string? queryUpdatedBefore = (), string? queryUpdatedOn = (), string? queryUpdatedOnOrAfter = (), string? queryUpdatedOnOrBefore = ()) returns GetEnrollmentsResponse|error {
        string resourcePath = string `/bundles/${getEncodedUri(id)}/enrollments`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit, "query[user_id]": queryUserId, "query[email]": queryEmail, "query[completed]": queryCompleted, "query[expired]": queryExpired, "query[created_after]": queryCreatedAfter, "query[created_before]": queryCreatedBefore, "query[created_on]": queryCreatedOn, "query[created_on_or_after]": queryCreatedOnOrAfter, "query[created_on_or_before]": queryCreatedOnOrBefore, "query[updated_after]": queryUpdatedAfter, "query[updated_before]": queryUpdatedBefore, "query[updated_on]": queryUpdatedOn, "query[updated_on_or_after]": queryUpdatedOnOrAfter, "query[updated_on_or_before]": queryUpdatedOnOrBefore};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetEnrollmentsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Enrollments in a Bundle
    #
    # + id - ID of the bundle in a form of integer 
    # + payload - New enrollment attributes 
    # + return - Enrollments Updated 
    remote isolated function updateEnrollmentsInBundle(decimal id, IdEnrollmentsBody payload) returns http:Response|error {
        string resourcePath = string `/bundles/${getEncodedUri(id)}/enrollments`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Create an Enrollment in a Bundle of Courses
    #
    # + id - ID of the bundle in a form of integer 
    # + payload - New enrollment attributes 
    # + return - Enrollments created synchronously 
    remote isolated function createEnrollmentInBundle(decimal id, IdEnrollmentsBody1 payload) returns http:Response|error {
        string resourcePath = string `/bundles/${getEncodedUri(id)}/enrollments`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Chapters
    #
    # + id - ID of the Chapter in the form of an integer. 
    # + return - Chapters response 
    remote isolated function getChapterByID(decimal id) returns ChapterResponse|error {
        string resourcePath = string `/chapters/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChapterResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Contents by Chapter id
    #
    # + id - ID of the Chapter in the form of an integer 
    # + page - The page within the collection to fetch. 
    # + 'limit - The number of items to be returned. 
    # + return - Chapters response 
    remote isolated function getContentsByID(decimal id, decimal page = 1.0, decimal 'limit = 25.0) returns GetContentsResponse|error {
        string resourcePath = string `/chapters/${getEncodedUri(id)}/contents`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetContentsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Collections
    #
    # + page - The page within the collection to fetch 
    # + 'limit - The number of items to be returned 
    # + return - Collections response 
    remote isolated function getCollections(decimal page = 1.0, decimal 'limit = 25.0) returns GetCollectionsResponse|error {
        string resourcePath = string `/collections`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetCollectionsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new Category
    #
    # + payload - New collections attributes 
    # + return - Collection response 
    remote isolated function crateCollection(CollectionRequest payload) returns CollectionResponse|error {
        string resourcePath = string `/collections`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CollectionResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Collections by Id
    #
    # + id - ID of the Category in the form of an integer 
    # + return - Collection response 
    remote isolated function getCollectionbyID(decimal id) returns CollectionResponse|error {
        string resourcePath = string `/collections/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CollectionResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update collection by ID
    #
    # + id - ID of the Category in the form of an integer 
    # + payload - Collections attributes 
    # + return - Collection Updated 
    remote isolated function updateCollectioByID(decimal id, CollectionRequest payload) returns http:Response|error {
        string resourcePath = string `/collections/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete collection by ID
    #
    # + id - ID of the Category in the form of an integer 
    # + return - Collection deleted 
    remote isolated function deleteCollectionByID(decimal id) returns http:Response|error {
        string resourcePath = string `/collections/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get products by Collections id
    #
    # + id - ID of the Chapter in the form of an integer 
    # + page - The page within the collection to fetch 
    # + 'limit - The number of items to be returned 
    # + return - Products response 
    remote isolated function getProductsbyID(decimal id, decimal page = 1.0, decimal 'limit = 25.0) returns GetProductsResponse|error {
        string resourcePath = string `/collections/${getEncodedUri(id)}/products`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetProductsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Coupons
    #
    # + promotionId - The ID of the Promotion for which to get the Coupons in the form of an integer. 
    # + page - The page within the collection to fetch. 
    # + 'limit - The number of items to be returned 
    # + return - Coupon Response 
    remote isolated function getCoupons(decimal promotionId, decimal page = 1.0, decimal 'limit = 25.0) returns GetCouponResponse|error {
        string resourcePath = string `/coupons`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"promotion_id": promotionId, "page": page, "limit": 'limit};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetCouponResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a Coupon
    #
    # + promotionId - ID of the Promotion to add the Coupon to in the form of an integer. 
    # + payload - New Coupon attributes 
    # + return - Create Coupon Response 
    remote isolated function createCoupon(decimal promotionId, CreateCouponRequest payload) returns CouponResponse|error {
        string resourcePath = string `/coupons`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"promotion_id": promotionId};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CouponResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Bulk Create Coupons
    #
    # + promotionId - The ID of the Promotion for which to bulk create the Coupons. 
    # + payload - New Coupon attributes 
    # + return - Create Coupon Response 
    remote isolated function bulkCreateCoupons(decimal promotionId, BulkCreateCouponRequest payload) returns CreateBulkCouponResponse|error {
        string resourcePath = string `/coupons/bulk_create`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"promotion_id": promotionId};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateBulkCouponResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a Coupon by ID
    #
    # + id - The ID of the Coupon in the form of an integer. 
    # + return - Coupon Response 
    remote isolated function getCouponByID(decimal id) returns CouponResponse|error {
        string resourcePath = string `/coupons/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CouponResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a Coupon
    #
    # + id - The ID of the Coupon in the form of an integer. 
    # + payload - Update an existing coupon 
    # + return - Coupon Updated 
    remote isolated function updateCoupon(decimal id, UpdateCoupon payload) returns http:Response|error {
        string resourcePath = string `/coupons/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Coupon by ID
    #
    # + id - The ID of the Coupon in the form of an integer. 
    # + return - Coupon Deleted 
    remote isolated function deleteCouponByID(decimal id) returns http:Response|error {
        string resourcePath = string `/coupons/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get Contents by Id
    #
    # + id - ID of the Content in the form of an integer 
    # + return - Content response 
    remote isolated function getContentByID(decimal id) returns ContentResponse|error {
        string resourcePath = string `/contents/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ContentResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Courses
    #
    # + page - The page within the collection to fetch. 
    # + 'limit - The number of items to be returned 
    # + return - Courses Response 
    remote isolated function getCourses(decimal page = 1.0, decimal 'limit = 25.0) returns GetCoursesResponse|error {
        string resourcePath = string `/courses`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetCoursesResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get courses by ID
    #
    # + id - ID of the Course in the form of an integer. 
    # + return - Courses response 
    remote isolated function getCourseByID(decimal id) returns CourseResponse|error {
        string resourcePath = string `/courses/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CourseResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Chapters by Course ID
    #
    # + id - ID of the Chapter in the form of an integer. 
    # + page - The page within the collection to fetch. 
    # + 'limit - The number of items to be returned. 
    # + return - Chapter of a course response 
    remote isolated function getChapterOfCourseByID(decimal id, decimal page = 1.0, decimal 'limit = 25.0) returns GetChaptersResponse|error {
        string resourcePath = string `/courses/${getEncodedUri(id)}/chapters`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetChaptersResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Custom profile field definition
    #
    # + page - The page within the collection to fetch. 
    # + 'limit - The number of items to be returned. 
    # + return - Custom Profile Field Definitions 
    remote isolated function getCustomProfileFields(decimal page = 1.0, decimal 'limit = 25.0) returns GetCustomProfileFieldDefinitions|error {
        string resourcePath = string `/custom_profile_field_definitions`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetCustomProfileFieldDefinitions response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Enrollments
    #
    # + page - The page within the collection to fetch. 
    # + 'limit - The number of items to be returned. 
    # + queryUserId - Search Enrollments by User ID. 
    # + queryCourseId - Search Enrollments by Course ID. 
    # + queryEmail - Search Enrollments by User email. 
    # + queryFreeTrial - Filter for only Free Trial Enrollments when set to true. 
    # + queryFull - Filter for only full Enrollments when set to true. 
    # + queryCompleted - Filter for only completed Enrollments when set to true. 
    # + queryExpired - Filter for only expired Enrollments when set to true. 
    # + queryCreatedOn - Filter for only Enrollments created on the date specified. 
    # + queryCreatedBefore - Filter for only Enrollments created before the date specified. 
    # + queryCreatedOnOrBefore - Filter for only Enrollments created on or before the date specified. 
    # + queryCreatedAfter - Filter for only Enrollments created after the date specified. 
    # + queryCreatedOnOrAfter - Filter for only Enrollments created on or after the date specified. 
    # + queryUpdatedOn - Filter for only Enrollments updated on the date specified. 
    # + queryUpdatedBefore - Filter for only Enrollments updated before the date specified. 
    # + queryUpdatedOnOrBefore - Filter for only Enrollments updated on or before the date specified. 
    # + queryUpdatedAfter - Filter for only Enrollments updated after the date specified. 
    # + return - Enrollments response 
    remote isolated function getEnrollments(decimal page = 1.0, decimal 'limit = 25.0, decimal? queryUserId = (), decimal? queryCourseId = (), string? queryEmail = (), boolean? queryFreeTrial = (), boolean? queryFull = (), boolean? queryCompleted = (), boolean? queryExpired = (), string? queryCreatedOn = (), string? queryCreatedBefore = (), string? queryCreatedOnOrBefore = (), string? queryCreatedAfter = (), string? queryCreatedOnOrAfter = (), string? queryUpdatedOn = (), string? queryUpdatedBefore = (), string? queryUpdatedOnOrBefore = (), string? queryUpdatedAfter = ()) returns GetEnrollmentsResponse|error {
        string resourcePath = string `/enrollments`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit, "query[user_id]": queryUserId, "query[course_id]": queryCourseId, "query[email]": queryEmail, "query[free_trial]": queryFreeTrial, "query[full]": queryFull, "query[completed]": queryCompleted, "query[expired]": queryExpired, "query[created_on]": queryCreatedOn, "query[created_before]": queryCreatedBefore, "query[created_on_or_before]": queryCreatedOnOrBefore, "query[created_after]": queryCreatedAfter, "query[created_on_or_after]": queryCreatedOnOrAfter, "query[updated_on]": queryUpdatedOn, "query[updated_before]": queryUpdatedBefore, "query[updated_on_or_before]": queryUpdatedOnOrBefore, "query[updated_after]": queryUpdatedAfter};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetEnrollmentsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create enrollment
    #
    # + payload - New enrollment attributes 
    # + return - Enrollment response 
    remote isolated function createEnrollment(CreateEnrollmentRequest payload) returns EnrollmentResponse|error {
        string resourcePath = string `/enrollments`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EnrollmentResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get enrollments by ID
    #
    # + id - ID of the Enrollment in the form of an integer. 
    # + return - Enrollment response 
    remote isolated function getEnrollmentsByID(decimal id) returns EnrollmentResponse|error {
        string resourcePath = string `/enrollments/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EnrollmentResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update enrollment
    #
    # + id - ID of the Enrollment in the form of an integer. 
    # + payload - New enrollment attributes 
    # + return - Enrollment Updated 
    remote isolated function updateEnrollment(decimal id, UpdateEnrollmentRequest payload) returns http:Response|error {
        string resourcePath = string `/enrollments/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Create a new external order
    #
    # + payload - External Order request 
    # + return - External Order created 
    remote isolated function createExternalOrder(ExternalOrderRequest payload) returns InlineResponse201|error {
        string resourcePath = string `/external_orders`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse201 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # refund transaction
    #
    # + id - External Order ID as integer 
    # + payload - Transaction 
    # + return - Transaction created 
    remote isolated function createTransactionRefund(decimal id, ExternalOrderTransaction payload) returns http:Response|error {
        string resourcePath = string `/external_orders/${getEncodedUri(id)}/transactions/refund`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # purchase transaction
    #
    # + id - External Order ID 
    # + payload - Transaction 
    # + return - Transaction created 
    remote isolated function createTransactionPurchase(string id, ExternalOrderTransaction payload) returns http:Response|error {
        string resourcePath = string `/external_orders/${getEncodedUri(id)}/transactions/purchase`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Groups
    #
    # + page - The page within the collection to fetch. 
    # + 'limit - The number of items to be returned. 
    # + return - Groups response 
    remote isolated function getGroups(decimal page = 1.0, decimal 'limit = 25.0) returns GetGroupsResponse|error {
        string resourcePath = string `/groups`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetGroupsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Group
    #
    # + payload - Group 
    # + return - Group response 
    remote isolated function createGroup(GroupRequest payload) returns GroupResponse|error {
        string resourcePath = string `/groups`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GroupResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Group
    #
    # + id - The ID of the Group to fetch. 
    # + return - Group response 
    remote isolated function getGroup(decimal id) returns GroupResponse|error {
        string resourcePath = string `/groups/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GroupResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Group Analysts
    #
    # + groupId - ID of the Group in the form of an integer. 
    # + return - Groups response 
    remote isolated function getGroupAnalysts(decimal groupId) returns GetGroupAnalystsResponse|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/analysts`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetGroupAnalystsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Assign Analysts to a Group
    #
    # + groupId - ID of the Group in the form of an integer. 
    # + payload - Group Analyst 
    # + return - Group Analyst response 
    remote isolated function postGroupAnalysts(decimal groupId, GroupAddAnalystRequest payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/analysts`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Analyst
    #
    # + groupId - ID of the Group in the form of an integer. 
    # + userId - ID of the User in the form of an integer. 
    # + return - Group Analyst response 
    remote isolated function removeAnalystFromGroup(decimal groupId, decimal userId) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/analysts/${getEncodedUri(userId)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Add Analyst to Groups
    #
    # + userId - ID of the User in the form of an integer. 
    # + payload - Group Analyst 
    # + return - Group Analyst response 
    remote isolated function addGroupToAnalyst(decimal userId, GroupAnalystsAddGroupRequest payload) returns http:Response|error {
        string resourcePath = string `/group_analysts/${getEncodedUri(userId)}/groups`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Analyst
    #
    # + userId - ID of the User in the form of an integer. 
    # + groupId - ID of the Group in the form of an integer. 
    # + return - Group Analyst response 
    remote isolated function removeGroupFromAnalyst(decimal userId, decimal groupId) returns http:Response|error {
        string resourcePath = string `/group_analysts/${getEncodedUri(userId)}/groups/${getEncodedUri(groupId)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get Instructors
    #
    # + page - The page within the collection to fetch. 
    # + 'limit - The number of items to be returned. 
    # + return - Instructors response 
    remote isolated function getInstructors(decimal page = 1.0, decimal 'limit = 25.0) returns GetInstructorsResponse|error {
        string resourcePath = string `/instructors`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetInstructorsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create instructor
    #
    # + payload - New instructor attributes 
    # + return - Instructor response 
    remote isolated function createInstructor(InstructorRequest payload) returns InstructorResponse|error {
        string resourcePath = string `/instructors`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InstructorResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Instructor by ID
    #
    # + id - ID of the Instructor in the form of an integer. 
    # + return - Instructor response 
    remote isolated function getInstructorByID(decimal id) returns InstructorResponse|error {
        string resourcePath = string `/instructors/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InstructorResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update instructor
    #
    # + id - ID of the Instructor in the form of an integer 
    # + payload - New instructor attributes 
    # + return - Instructor Updated 
    remote isolated function updateInstructor(decimal id, InstructorRequest payload) returns http:Response|error {
        string resourcePath = string `/instructors/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete instructor
    #
    # + id - ID of the Instructor in the form of an integer 
    # + return - Instructor deleted 
    remote isolated function deleteInstructorByID(decimal id) returns http:Response|error {
        string resourcePath = string `/instructors/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get Orders
    #
    # + page - The page within the collection to fetch. 
    # + 'limit - The number of items to be returned. 
    # + return - Orders 
    remote isolated function getOrders(decimal page = 1.0, decimal 'limit = 25.0) returns GetOrdersResponse|error {
        string resourcePath = string `/orders`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetOrdersResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get orders by ID
    #
    # + id - ID of the Orders in the form of an integer. 
    # + return - Orders response 
    remote isolated function getOrderByID(decimal id) returns OrderResponse|error {
        string resourcePath = string `/orders/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OrderResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a User to existing Groups
    #
    # + payload - Group Users attributes 
    # + return - Group Users response 
    remote isolated function createGroupUsers(CreateGroupUsersRequest payload) returns http:Response|error {
        string resourcePath = string `/group_users`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get List of product publish requests
    #
    # + page - The page within the collection to fetch 
    # + 'limit - The number of items to be returned 
    # + return - Product Publish Requests response 
    remote isolated function getProductPublishRequests(decimal page = 1.0, decimal 'limit = 25.0) returns GetProductPublishResponse|error {
        string resourcePath = string `/product_publish_requests`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetProductPublishResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get product publish request by ID
    #
    # + id - ID of the Product Publish Request in the form of an integer. 
    # + return - Product Publish Request success response 
    remote isolated function getProductPublishRequestByID(decimal id) returns ProductPublishRequest|error {
        string resourcePath = string `/product_publish_requests/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProductPublishRequest response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Approves Product Publish Request
    #
    # + id - ID of the Product Publish Request in the form of an integer. 
    # + return - Product Publish Request approved 
    remote isolated function approveProductPublishRequest(decimal id) returns http:Response|error {
        string resourcePath = string `/product_publish_requests/${getEncodedUri(id)}/approve`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Denies Product Publish Request
    #
    # + id - ID of the Product Publish Request in the form of an integer. 
    # + return - Product Publish Request denied 
    remote isolated function denyProductPublishRequest(decimal id) returns http:Response|error {
        string resourcePath = string `/product_publish_requests/${getEncodedUri(id)}/deny`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # List products
    #
    # + page - The page within the collection to fetch 
    # + 'limit - The number of items to be returned 
    # + return - Products response 
    remote isolated function getProducts(decimal page = 1.0, decimal 'limit = 25.0) returns GetProductsResponse|error {
        string resourcePath = string `/products`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetProductsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get product by ID
    #
    # + id - Id of the product in the form of an integer 
    # + return - Products response 
    remote isolated function getProductByID(decimal id) returns ProductResponse|error {
        string resourcePath = string `/products/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProductResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get related products
    #
    # + id - Id of the product in the form of an integer 
    # + page - The page within the collection to fetch 
    # + 'limit - The number of items to be returned 
    # + return - Products response 
    remote isolated function getRelatedProductByProductID(decimal id, decimal page = 1.0, decimal 'limit = 25.0) returns GetProductsResponse|error {
        string resourcePath = string `/products/${getEncodedUri(id)}/related`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetProductsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List promotions
    #
    # + page - The page within the collection to fetch 
    # + 'limit - The number of items to be returned 
    # + return - Promotions response 
    remote isolated function getPromotions(decimal page = 1.0, decimal 'limit = 25.0) returns GetPromotionsResponse|error {
        string resourcePath = string `/promotions`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetPromotionsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new promotion
    #
    # + payload - New Promotion parameters 
    # + return - Promotions response 
    remote isolated function createPromotion(PromotionRequest payload) returns PromotionResponse|error {
        string resourcePath = string `/promotions`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PromotionResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get promotion by provided ID
    #
    # + id - Id of the promotion in the form of an integer 
    # + return - Promotions response 
    remote isolated function getPromotionByID(decimal id) returns PromotionResponse|error {
        string resourcePath = string `/promotions/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PromotionResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update promotion by provided ID
    #
    # + id - Id of the promotion in the form of an integer 
    # + payload - Promotion attributes 
    # + return - Promotion Updated 
    remote isolated function updatePromotionByID(decimal id, PromotionRequest payload) returns http:Response|error {
        string resourcePath = string `/promotions/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete promotion by provided ID
    #
    # + id - Id of the promotion in the form of an integer 
    # + return - Promotions deleted 
    remote isolated function deletePromotionByID(decimal id) returns http:Response|error {
        string resourcePath = string `/promotions/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get Promotion associated with the provided Coupon code.
    #
    # + productId - The id of the Product to which the promotion applies. 
    # + couponCode - The Coupon code to be used as search criteria. 
    # + return - Promotions response 
    remote isolated function getPromotionByCouponCode(decimal productId, string couponCode) returns PromotionResponse|error {
        string resourcePath = string `/promotions/by_coupon`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"product_id": productId, "coupon_code": couponCode};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PromotionResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get Course Reviews
    #
    # + courseId - ID of the Course in the form of an integer. 
    # + page - The page within the collection to fetch. 
    # + 'limit - The number of items to be returned. 
    # + approved - If true, returns only approved Course Reviews. 
    # + return - CourseReviews 
    remote isolated function getCourseReviews(decimal courseId, decimal page = 1.0, decimal 'limit = 25.0, boolean? approved = ()) returns GetCourseReviewsResponse|error {
        string resourcePath = string `/course_reviews`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"course_id": courseId, "page": page, "limit": 'limit, "approved": approved};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetCourseReviewsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a course review
    #
    # + courseId - ID of the Course for which the review needs to be created for. 
    # + payload - Course Review Attributes 
    # + return - Course Review Created 
    remote isolated function createCourseReview(decimal courseId, CreateCourseReviewRequest payload) returns CourseReviewResponse|error {
        string resourcePath = string `/course_reviews`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"course_id": courseId};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CourseReviewResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Course Reviews By ID
    #
    # + id - ID of the Course Review in the form of an integer. 
    # + return - CourseReviewByID 
    remote isolated function getCourseReviewByID(decimal id) returns CourseReviewResponse|error {
        string resourcePath = string `/course_reviews/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CourseReviewResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Users
    #
    # + page - The page within the collection to fetch 
    # + 'limit - The number of items to be returned 
    # + queryEmail - Search Users by email. 
    # + queryRole - Search Users by role. 
    # + queryExternalSource - Search Users by external source. 
    # + queryCustomProfileFieldLabel - Search by custom profile field label (must be combined with custom_profile_field_value) 
    # + queryCustomProfileFieldValue - Search by custom profile field value (must be combined with custom_profile_field_label) 
    # + queryGroupId - Search by group id. 
    # + return - Users response 
    remote isolated function getUsers(decimal page = 1.0, decimal 'limit = 25.0, string? queryEmail = (), string? queryRole = (), string? queryExternalSource = (), string? queryCustomProfileFieldLabel = (), string? queryCustomProfileFieldValue = (), decimal? queryGroupId = ()) returns GetUsersResponse|error {
        string resourcePath = string `/users`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit, "query[email]": queryEmail, "query[role]": queryRole, "query[external_source]": queryExternalSource, "query[custom_profile_field_label]": queryCustomProfileFieldLabel, "query[custom_profile_field_value]": queryCustomProfileFieldValue, "query[group_id]": queryGroupId};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetUsersResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create user
    #
    # + payload - Create user request body 
    # + return - User Created 
    remote isolated function createUser(CreateUserRequest payload) returns UserResponse|error {
        string resourcePath = string `/users`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # List Users by ID
    #
    # + id - Accepts a Thinkific generated ID (in the form of an integer), or an External ID (as a string) when accompanied by the "provider" parameter. 
    # + provider - Provider from which the user's External Id is associated (Required if using External Id as id parameter) 
    # + return - User Response 
    remote isolated function getUserByID(string id, string? provider = ()) returns UserResponse|error {
        string resourcePath = string `/users/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"provider": provider};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update user by ID
    #
    # + id - Accepts a Thinkific generated ID (in the form of an integer), or an External ID (as a string) when accompanied by the "provider" parameter. 
    # + provider - Provider from which the user's External Id is associated (Required if using External Id as id parameter) 
    # + payload - User details 
    # + return - User Updated 
    remote isolated function updateUserByID(string id, UpdateUserRequest payload, string? provider = ()) returns http:Response|error {
        string resourcePath = string `/users/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"provider": provider};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete user by ID
    #
    # + id - Accepts a Thinkific generated ID (in the form of an integer), or an External ID (as a string) when accompanied by the "provider" parameter. 
    # + provider - Provider from which the user's External Id is associated (Required if using External Id as id parameter) 
    # + return - User Deleted 
    remote isolated function deleteUserByID(string id, string? provider = ()) returns http:Response|error {
        string resourcePath = string `/users/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"provider": provider};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List Site Scripts
    #
    # + page - The page within the collection to fetch 
    # + 'limit - The number of items to be returned 
    # + return - Site Scripts response 
    remote isolated function getSiteScripts(decimal page = 1.0, decimal 'limit = 25.0) returns GetSiteScriptsResponse|error {
        string resourcePath = string `/site_scripts`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"page": page, "limit": 'limit};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetSiteScriptsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Site Script
    #
    # + payload - Create Site Script request body 
    # + return - Site Script created 
    remote isolated function createSiteScript(SiteScriptRequest payload) returns SiteScriptResponse|error {
        string resourcePath = string `/site_scripts`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SiteScriptResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get Site Script by ID
    #
    # + id - ID of the Site Script in the form of a string 
    # + return - Site Script Response 
    remote isolated function getSiteScriptByID(string id) returns SiteScriptResponse|error {
        string resourcePath = string `/site_scripts/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SiteScriptResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Site Script by ID
    #
    # + id - ID of the Site Script in the form of a string 
    # + payload - Update Site Script request body 
    # + return - Site Script Updated 
    remote isolated function updateSiteScriptByID(string id, SiteScriptRequest payload) returns http:Response|error {
        string resourcePath = string `/site_scripts/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Site Script by ID
    #
    # + id - ID of the Site Script in the form of a string 
    # + return - Site Script Deleted 
    remote isolated function deleteSiteScriptByID(string id) returns http:Response|error {
        string resourcePath = string `/site_scripts/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["X-Auth-API-Key"] = self.apiKeyConfig?.xAuthApiKey;
            headerValues["X-Auth-Subdomain"] = self.apiKeyConfig?.xAuthSubdomain;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
}
