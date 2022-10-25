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
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

public type IdfaDeclarationCreateRequest record {
    IdfadeclarationcreaterequestData data;
};

public type AppEncryptionDeclarationBuildsLinkagesRequest record {
    AppstoreversionRelationshipsBuildData[] data;
};

public type InapppurchaseAttributes record {
    string referenceName?;
    string productId?;
    string inAppPurchaseType?;
    string state?;
};

public type AppPreviewsResponse record {
    AppPreview[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BuildIcon record {
    string 'type;
    string id;
    BuildiconAttributes attributes?;
    ResourceLinks links;
};

public type AppRelationshipsBetaappreviewdetailData record {
    string 'type;
    string id;
};

public type BundleidcreaterequestDataAttributes record {
    string name;
    BundleIdPlatform platform;
    string identifier;
    string seedId?;
};

public type IconAssetType string;

public type BetaTestersResponse record {
    BetaTester[] data;
    (App|BetaGroup|Build)[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type ApppreordercreaterequestDataRelationships record {
    ApppreordercreaterequestDataRelationshipsApp app;
};

public type BetabuildlocalizationupdaterequestData record {
    string 'type;
    string id;
    BetabuildlocalizationupdaterequestDataAttributes attributes?;
};

public type BetaLicenseAgreementsResponse record {
    BetaLicenseAgreement[] data;
    App[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppstorereviewdetailAttributes record {
    string contactFirstName?;
    string contactLastName?;
    string contactPhone?;
    string contactEmail?;
    string demoAccountName?;
    string demoAccountPassword?;
    boolean demoAccountRequired?;
    string notes?;
};

public type BetaappreviewdetailupdaterequestData record {
    string 'type;
    string id;
    AppstorereviewdetailAttributes attributes?;
};

public type AppEncryptionDeclaration record {
    string 'type;
    string id;
    AppencryptiondeclarationAttributes attributes?;
    AppencryptiondeclarationRelationships relationships?;
    ResourceLinks links;
};

public type AppstoreversionRelationshipsIdfadeclaration record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppstoreversionRelationshipsIdfadeclarationData data?;
};

public type AppscreenshotsetAttributes record {
    ScreenshotDisplayType screenshotDisplayType?;
};

public type ApppreorderAttributes record {
    string preOrderAvailableDate?;
    string appReleaseDate?;
};

public type ProfileRelationshipsDevicesData record {
    string 'type;
    string id;
};

public type UserInvitationCreateRequest record {
    UserinvitationcreaterequestData data;
};

public type BetaapplocalizationAttributes record {
    string feedbackEmail?;
    string marketingUrl?;
    string privacyPolicyUrl?;
    string tvOsPrivacyPolicy?;
    string description?;
    string locale?;
};

public type AppupdaterequestDataRelationships record {
    AppupdaterequestDataRelationshipsPrices prices?;
    AppupdaterequestDataRelationshipsAvailableterritories availableTerritories?;
};

public type AppinfolocalizationAttributes record {
    string locale?;
    string name?;
    string subtitle?;
    string privacyPolicyUrl?;
    string privacyPolicyText?;
};

public type AppinfoRelationshipsAppinfolocalizationsData record {
    string 'type;
    string id;
};

public type BuildRelationshipsBetabuildlocalizationsData record {
    string 'type;
    string id;
};

public type BetaAppReviewDetailResponse record {
    BetaAppReviewDetail data;
    App[] included?;
    DocumentLinks links;
};

public type AppRelationshipsEnduserlicenseagreementData record {
    string 'type;
    string id;
};

public type AppstorereviewattachmentRelationshipsAppstorereviewdetail record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppstorereviewattachmentRelationshipsAppstorereviewdetailData data?;
};

public type AppScreenshotsResponse record {
    AppScreenshot[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type EndUserLicenseAgreementUpdateRequest record {
    EnduserlicenseagreementupdaterequestData data;
};

public type BuildbetadetailupdaterequestDataAttributes record {
    boolean autoNotifyEnabled?;
};

public type AppinfolocalizationupdaterequestData record {
    string 'type;
    string id;
    AppinfolocalizationupdaterequestDataAttributes attributes?;
};

public type BundleIdCreateRequest record {
    BundleidcreaterequestData data;
};

public type BetaTesterAppsLinkagesResponse record {
    AppencryptiondeclarationRelationshipsAppData[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetaAppLocalizationCreateRequest record {
    BetaapplocalizationcreaterequestData data;
};

public type GameCenterEnabledVersionCompatibleVersionsLinkagesResponse record {
    AppRelationshipsGamecenterenabledversionsData[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppstorereviewdetailRelationshipsAppstoreversionData record {
    string 'type;
    string id;
};

public type AppStoreVersionSubmissionCreateRequest record {
    AppstoreversionsubmissioncreaterequestData data;
};

public type ExternalBetaState string;

public type PrereleaseversionRelationships record {
    AppRelationshipsBuilds builds?;
    AppencryptiondeclarationRelationshipsApp app?;
};

public type AppRelationshipsPreorderData record {
    string 'type;
    string id;
};

public type AppscreenshotsetcreaterequestDataAttributes record {
    ScreenshotDisplayType screenshotDisplayType;
};

public type AppInfoLocalizationCreateRequest record {
    AppinfolocalizationcreaterequestData data;
};

public type AppstoreversionRelationshipsBuild record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppstoreversionRelationshipsBuildData data?;
};

public type AppstoreversionRelationshipsAppstoreversionlocalizations record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    ApppreviewsetRelationshipsAppstoreversionlocalizationData[] data?;
};

public type AppinfolocalizationupdaterequestDataAttributes record {
    string name?;
    string subtitle?;
    string privacyPolicyUrl?;
    string privacyPolicyText?;
};

public type ApppreviewRelationshipsApppreviewset record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    ApppreviewRelationshipsApppreviewsetData data?;
};

public type BetaGroupBetaTestersLinkagesRequest record {
    BetagroupRelationshipsBetatestersData[] data;
};

public type AppScreenshotSetResponse record {
    AppScreenshotSet data;
    AppScreenshot[] included?;
    DocumentLinks links;
};

public type ErrorResponse record {
    ErrorresponseErrors[] errors?;
};

public type BetatesterRelationshipsApps record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    AppencryptiondeclarationRelationshipsAppData[] data?;
};

public type GameCenterEnabledVersionCompatibleVersionsLinkagesRequest record {
    AppRelationshipsGamecenterenabledversionsData[] data;
};

public type AppRelationshipsPrices record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    AppRelationshipsPricesData[] data?;
};

public type BundleidRelationshipsProfiles record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    BundleidRelationshipsProfilesData[] data?;
};

public type AppstoreversionRelationshipsAppstoreversionphasedrelease record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppstoreversionRelationshipsAppstoreversionphasedreleaseData data?;
};

public type EndUserLicenseAgreement record {
    string 'type;
    string id;
    BetalicenseagreementAttributes attributes?;
    EnduserlicenseagreementRelationships relationships?;
    ResourceLinks links;
};

public type AppRelationshipsEnduserlicenseagreement record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppRelationshipsEnduserlicenseagreementData data?;
};

public type BuildupdaterequestDataAttributes record {
    boolean expired?;
    boolean usesNonExemptEncryption?;
};

public type AppStoreVersionLocalizationCreateRequest record {
    AppstoreversionlocalizationcreaterequestData data;
};

public type BundleidcapabilitycreaterequestDataAttributes record {
    CapabilityType capabilityType;
    CapabilitySetting[] settings?;
};

public type BetaTesterBuildsLinkagesRequest record {
    AppstoreversionRelationshipsBuildData[] data;
};

public type AppstoreversionupdaterequestDataRelationships record {
    AppstoreversioncreaterequestDataRelationshipsBuild build?;
};

public type AppscreenshotcreaterequestDataAttributes record {
    int fileSize;
    string fileName;
};

public type BuildIconsResponse record {
    BuildIcon[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type ApppricetierRelationships record {
    ApppricetierRelationshipsPricepoints pricePoints?;
};

public type AppscreenshotcreaterequestData record {
    string 'type;
    AppscreenshotcreaterequestDataAttributes attributes;
    AppscreenshotcreaterequestDataRelationships relationships;
};

public type AppStoreReviewDetailResponse record {
    AppStoreReviewDetail data;
    AppStoreReviewAttachment[] included?;
    DocumentLinks links;
};

@deprecated
public type AppstoreversionRelationshipsAgeratingdeclaration record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppinfoRelationshipsAgeratingdeclarationData data?;
};

public type BetaTesterResponse record {
    BetaTester data;
    (App|BetaGroup|Build)[] included?;
    DocumentLinks links;
};

public type BetaGroupBuildsLinkagesRequest record {
    AppstoreversionRelationshipsBuildData[] data;
};

public type AppInfoUpdateRequest record {
    AppinfoupdaterequestData data;
};

public type AppStoreVersionLocalization record {
    string 'type;
    string id;
    AppstoreversionlocalizationAttributes attributes?;
    AppstoreversionlocalizationRelationships relationships?;
    ResourceLinks links;
};

public type TerritoryResponse record {
    Territory data;
    DocumentLinks links;
};

public type ApppreviewcreaterequestDataRelationshipsApppreviewset record {
    ApppreviewRelationshipsApppreviewsetData data;
};

public type BundleidcapabilitycreaterequestDataRelationshipsBundleidData record {
    string 'type;
    string id;
};

public type AppStoreAgeRating string;

public type AppStoreVersionPhasedReleaseCreateRequest record {
    AppstoreversionphasedreleasecreaterequestData data;
};

public type BetaBuildLocalization record {
    string 'type;
    string id;
    BetabuildlocalizationAttributes attributes?;
    BetaappreviewsubmissionRelationships relationships?;
    ResourceLinks links;
};

public type AppPreviewUpdateRequest record {
    ApppreviewupdaterequestData data;
};

public type UserinvitationRelationships record {
    BetatesterRelationshipsApps visibleApps?;
};

public type ProfileResponse record {
    Profile data;
    (BundleId|Device|Certificate)[] included?;
    DocumentLinks links;
};

public type BetaAppLocalizationsResponse record {
    BetaAppLocalization[] data;
    App[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type CertificateType string;

public type AppStoreVersionLocalizationsResponse record {
    AppStoreVersionLocalization[] data;
    (AppScreenshotSet|AppPreviewSet)[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetaapplocalizationcreaterequestDataAttributes record {
    string feedbackEmail?;
    string marketingUrl?;
    string privacyPolicyUrl?;
    string tvOsPrivacyPolicy?;
    string description?;
    string locale;
};

public type UploadOperationHeader record {
    string name?;
    string value?;
};

public type AppupdaterequestDataRelationshipsAvailableterritories record {
    ApppricepointRelationshipsTerritoryData[] data?;
};

public type UserVisibleAppsLinkagesRequest record {
    AppencryptiondeclarationRelationshipsAppData[] data;
};

public type AppStoreReviewAttachmentUpdateRequest record {
    AppstorereviewattachmentupdaterequestData data;
};

public type DeviceUpdateRequest record {
    DeviceupdaterequestData data;
};

public type ApppricetierRelationshipsPricepointsData record {
    string 'type;
    string id;
};

public type AppPriceTier record {
    string 'type;
    string id;
    ApppricetierRelationships relationships?;
    ResourceLinks links;
};

public type AppscreenshotsetcreaterequestData record {
    string 'type;
    AppscreenshotsetcreaterequestDataAttributes attributes;
    ApppreviewsetcreaterequestDataRelationships relationships;
};

public type AppstorereviewattachmentRelationships record {
    AppstorereviewattachmentRelationshipsAppstorereviewdetail appStoreReviewDetail?;
};

public type AppinfoRelationshipsAgeratingdeclaration record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppinfoRelationshipsAgeratingdeclarationData data?;
};

public type UserinvitationAttributes record {
    string email?;
    string firstName?;
    string lastName?;
    string expirationDate?;
    UserRole[] roles?;
    boolean allAppsVisible?;
    boolean provisioningAllowed?;
};

public type AppstorereviewattachmentcreaterequestDataRelationships record {
    AppstorereviewattachmentcreaterequestDataRelationshipsAppstorereviewdetail appStoreReviewDetail;
};

public type AppupdaterequestDataAttributes record {
    string bundleId?;
    string primaryLocale?;
    boolean availableInNewTerritories?;
    string contentRightsDeclaration?;
};

public type ApppreorderupdaterequestData record {
    string 'type;
    string id;
    ApppreordercreaterequestDataAttributes attributes?;
};

public type AppstorereviewdetailcreaterequestDataRelationships record {
    AppstorereviewdetailcreaterequestDataRelationshipsAppstoreversion appStoreVersion;
};

public type AppstoreversionlocalizationupdaterequestData record {
    string 'type;
    string id;
    AppstoreversionlocalizationupdaterequestDataAttributes attributes?;
};

public type BuildRelationshipsBuildbetadetail record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    BuildRelationshipsBuildbetadetailData data?;
};

public type ResourceLinks record {
    string self;
};

public type BetatesterRelationships record {
    BetatesterRelationshipsApps apps?;
    AppRelationshipsBetagroups betaGroups?;
    AppRelationshipsBuilds builds?;
};

public type DevicecreaterequestData record {
    string 'type;
    DevicecreaterequestDataAttributes attributes;
};

public type BetaBuildLocalizationResponse record {
    BetaBuildLocalization data;
    Build[] included?;
    DocumentLinks links;
};

public type AppScreenshotSetAppScreenshotsLinkagesResponse record {
    AppscreenshotsetRelationshipsAppscreenshotsData[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type ApppreviewcreaterequestDataAttributes record {
    int fileSize;
    string fileName;
    string previewFrameTimeCode?;
    string mimeType?;
};

public type AppstoreversioncreaterequestDataRelationships record {
    ApppreordercreaterequestDataRelationshipsApp app;
    AppstoreversioncreaterequestDataRelationshipsBuild build?;
};

public type AppcategoryRelationshipsSubcategories record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    AppcategoryRelationshipsSubcategoriesData[] data?;
};

public type AppscreenshotRelationshipsAppscreenshotset record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppscreenshotRelationshipsAppscreenshotsetData data?;
};

public type BetaLicenseAgreementUpdateRequest record {
    BetalicenseagreementupdaterequestData data;
};

public type AppstorereviewdetailRelationshipsAppstorereviewattachmentsData record {
    string 'type;
    string id;
};

public type AppstoreversionlocalizationupdaterequestDataAttributes record {
    string description?;
    string keywords?;
    string marketingUrl?;
    string promotionalText?;
    string supportUrl?;
    string whatsNew?;
};

public type BundleidcreaterequestData record {
    string 'type;
    BundleidcreaterequestDataAttributes attributes;
};

public type UserRole string;

public type GamecenterenabledversionAttributes record {
    Platform platform?;
    string versionString?;
    ImageAsset iconAsset?;
};

public type ProfilecreaterequestDataRelationshipsCertificates record {
    ProfileRelationshipsCertificatesData[] data;
};

public type AppinfoRelationshipsAgeratingdeclarationData record {
    string 'type;
    string id;
};

public type BetagroupRelationshipsBetatestersData record {
    string 'type;
    string id;
};

public type BetaTesterInvitationCreateRequest record {
    BetatesterinvitationcreaterequestData data;
};

public type BuildIndividualTestersLinkagesResponse record {
    BetagroupRelationshipsBetatestersData[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppRelationshipsInapppurchasesData record {
    string 'type;
    string id;
};

public type BuildiconAttributes record {
    ImageAsset iconAsset?;
    IconAssetType iconType?;
};

public type BuildbetanotificationcreaterequestData record {
    string 'type;
    BetaappreviewsubmissioncreaterequestDataRelationships relationships;
};

public type AppinfoupdaterequestData record {
    string 'type;
    string id;
    AppinfoupdaterequestDataRelationships relationships?;
};

public type AppRelationshipsPrereleaseversionsData record {
    string 'type;
    string id;
};

public type BetabuildlocalizationcreaterequestData record {
    string 'type;
    BetabuildlocalizationcreaterequestDataAttributes attributes;
    BetaappreviewsubmissioncreaterequestDataRelationships relationships;
};

public type AppCategory record {
    string 'type;
    string id;
    AppcategoryAttributes attributes?;
    AppcategoryRelationships relationships?;
    ResourceLinks links;
};

public type AppStoreReviewDetailCreateRequest record {
    AppstorereviewdetailcreaterequestData data;
};

public type BetaTesterBuildsLinkagesResponse record {
    AppstoreversionRelationshipsBuildData[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppstoreversionRelationshipsAppstoreversionphasedreleaseData record {
    string 'type;
    string id;
};

public type AppPricesResponse record {
    AppPrice[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type DiagnosticSignature record {
    string 'type;
    string id;
    DiagnosticsignatureAttributes attributes?;
    ResourceLinks links;
};

public type AppStoreVersionState string;

public type AppinfolocalizationRelationshipsAppinfo record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppinfolocalizationRelationshipsAppinfoData data?;
};

public type PaginginformationPaging record {
    int total;
    int 'limit;
};

public type AppPreviewSetsResponse record {
    AppPreviewSet[] data;
    AppPreview[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppupdaterequestData record {
    string 'type;
    string id;
    AppupdaterequestDataAttributes attributes?;
    AppupdaterequestDataRelationships relationships?;
};

public type AppInfoLocalizationResponse record {
    AppInfoLocalization data;
    DocumentLinks links;
};

public type AppStoreReviewAttachmentCreateRequest record {
    AppstorereviewattachmentcreaterequestData data;
};

public type AppBetaTestersLinkagesRequest record {
    BetagroupRelationshipsBetatestersData[] data;
};

public type AppPreOrderUpdateRequest record {
    ApppreorderupdaterequestData data;
};

public type AppStoreVersionPhasedReleaseUpdateRequest record {
    AppstoreversionphasedreleaseupdaterequestData data;
};

public type AppPreviewSet record {
    string 'type;
    string id;
    ApppreviewsetAttributes attributes?;
    ApppreviewsetRelationships relationships?;
    ResourceLinks links;
};

public type BetaGroup record {
    string 'type;
    string id;
    BetagroupAttributes attributes?;
    BetagroupRelationships relationships?;
    ResourceLinks links;
};

public type AppscreenshotcreaterequestDataRelationshipsAppscreenshotset record {
    AppscreenshotRelationshipsAppscreenshotsetData data;
};

public type BundleIdPlatform string;

public type UserVisibleAppsLinkagesResponse record {
    AppencryptiondeclarationRelationshipsAppData[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BuildRelationshipsAppencryptiondeclaration record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    BuildRelationshipsAppencryptiondeclarationData data?;
};

public type ApppreviewcreaterequestDataRelationships record {
    ApppreviewcreaterequestDataRelationshipsApppreviewset appPreviewSet;
};

public type AppStoreVersionBuildLinkageResponse record {
    AppstoreversionRelationshipsBuildData data;
    DocumentLinks links;
};

public type AppstorereviewdetailRelationshipsAppstorereviewattachments record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    AppstorereviewdetailRelationshipsAppstorereviewattachmentsData[] data?;
};

public type AppScreenshot record {
    string 'type;
    string id;
    AppscreenshotAttributes attributes?;
    AppscreenshotRelationships relationships?;
    ResourceLinks links;
};

public type Profile record {
    string 'type;
    string id;
    ProfileAttributes attributes?;
    ProfileRelationships relationships?;
    ResourceLinks links;
};

public type BuildBetaGroupsLinkagesRequest record {
    AppRelationshipsBetagroupsData[] data;
};

public type AppInfoLocalization record {
    string 'type;
    string id;
    AppinfolocalizationAttributes attributes?;
    AppinfolocalizationRelationships relationships?;
    ResourceLinks links;
};

public type AppstoreversionRelationships record {
    AppencryptiondeclarationRelationshipsApp app?;
    AppstoreversionRelationshipsAgeratingdeclaration ageRatingDeclaration?;
    AppstoreversionRelationshipsAppstoreversionlocalizations appStoreVersionLocalizations?;
    AppstoreversionRelationshipsBuild build?;
    AppstoreversionRelationshipsAppstoreversionphasedrelease appStoreVersionPhasedRelease?;
    AppstoreversionRelationshipsRoutingappcoverage routingAppCoverage?;
    AppstorereviewattachmentRelationshipsAppstorereviewdetail appStoreReviewDetail?;
    AppstoreversionRelationshipsAppstoreversionsubmission appStoreVersionSubmission?;
    AppstoreversionRelationshipsIdfadeclaration idfaDeclaration?;
};

public type AppEncryptionDeclarationResponse record {
    AppEncryptionDeclaration data;
    App[] included?;
    DocumentLinks links;
};

public type BetaGroupUpdateRequest record {
    BetagroupupdaterequestData data;
};

public type InternalBetaState string;

public type ApppreviewsetRelationshipsApppreviewsData record {
    string 'type;
    string id;
};

public type IdfadeclarationcreaterequestDataAttributes record {
    boolean servesAds;
    boolean attributesAppInstallationToPreviousAd;
    boolean attributesActionWithPreviousAd;
    boolean honorsLimitedAdTracking;
};

public type AppscreenshotcreaterequestDataRelationships record {
    AppscreenshotcreaterequestDataRelationshipsAppscreenshotset appScreenshotSet;
};

public type BetaAppLocalizationResponse record {
    BetaAppLocalization data;
    App[] included?;
    DocumentLinks links;
};

public type DeviceAttributes record {
    string name?;
    BundleIdPlatform platform?;
    string udid?;
    string deviceClass?;
    string status?;
    string model?;
    string addedDate?;
};

public type AppstoreversionsubmissionRelationships record {
    AppstorereviewdetailRelationshipsAppstoreversion appStoreVersion?;
};

public type ImageAsset record {
    string templateUrl?;
    int width?;
    int height?;
};

public type EnduserlicenseagreementcreaterequestDataRelationships record {
    ApppreordercreaterequestDataRelationshipsApp app;
    EnduserlicenseagreementcreaterequestDataRelationshipsTerritories territories;
};

public type BundleidcapabilityAttributes record {
    CapabilityType capabilityType?;
    CapabilitySetting[] settings?;
};

public type UserinvitationcreaterequestDataAttributes record {
    string email;
    string firstName;
    string lastName;
    UserRole[] roles;
    boolean allAppsVisible?;
    boolean provisioningAllowed?;
};

public type BetaAppReviewDetailsResponse record {
    BetaAppReviewDetail[] data;
    App[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppinfolocalizationcreaterequestData record {
    string 'type;
    AppinfolocalizationcreaterequestDataAttributes attributes;
    AppinfolocalizationcreaterequestDataRelationships relationships;
};

public type ScreenshotDisplayType string;

public type AppcategoryAttributes record {
    Platform[] platforms?;
};

public type KidsAgeBand string;

public type AppRelationshipsBetalicenseagreementData record {
    string 'type;
    string id;
};

public type PreviewType string;

public type BetalicenseagreementAttributes record {
    string agreementText?;
};

public type BetalicenseagreementupdaterequestData record {
    string 'type;
    string id;
    BetalicenseagreementAttributes attributes?;
};

public type BundleIdResponse record {
    BundleId data;
    (Profile|BundleIdCapability|App)[] included?;
    DocumentLinks links;
};

public type AppPricePoint record {
    string 'type;
    string id;
    ApppricepointAttributes attributes?;
    ApppricepointRelationships relationships?;
    ResourceLinks links;
};

public type BundleidRelationshipsBundleidcapabilities record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    BundleidRelationshipsBundleidcapabilitiesData[] data?;
};

public type PrereleaseversionAttributes record {
    string 'version?;
    Platform platform?;
};

public type ProfilecreaterequestData record {
    string 'type;
    ProfilecreaterequestDataAttributes attributes;
    ProfilecreaterequestDataRelationships relationships;
};

public type ApppreviewsetcreaterequestDataRelationships record {
    ApppreviewsetcreaterequestDataRelationshipsAppstoreversionlocalization appStoreVersionLocalization;
};

public type BetatesterAttributes record {
    string firstName?;
    string lastName?;
    string email?;
    BetaInviteType inviteType?;
};

public type AgeratingdeclarationupdaterequestData record {
    string 'type;
    string id;
    AgeratingdeclarationAttributes attributes?;
};

public type BetaappreviewsubmissioncreaterequestDataRelationships record {
    BetaappreviewsubmissioncreaterequestDataRelationshipsBuild build;
};

public type BundleidRelationshipsBundleidcapabilitiesData record {
    string 'type;
    string id;
};

public type AppscreenshotRelationships record {
    AppscreenshotRelationshipsAppscreenshotset appScreenshotSet?;
};

public type CapabilitySetting record {
    string 'key?;
    string name?;
    string description?;
    boolean enabledByDefault?;
    boolean visible?;
    string allowedInstances?;
    int minInstances?;
    CapabilityOption[] options?;
};

public type ApppricepointRelationshipsPricetierData record {
    string 'type;
    string id;
};

public type DeviceResponse record {
    Device data;
    DocumentLinks links;
};

public type Build record {
    string 'type;
    string id;
    BuildAttributes attributes?;
    BuildRelationships relationships?;
    ResourceLinks links;
};

public type UserInvitation record {
    string 'type;
    string id;
    UserinvitationAttributes attributes?;
    UserinvitationRelationships relationships?;
    ResourceLinks links;
};

public type ApppreviewsetcreaterequestDataRelationshipsAppstoreversionlocalization record {
    ApppreviewsetRelationshipsAppstoreversionlocalizationData data;
};

public type DeviceupdaterequestDataAttributes record {
    string name?;
    string status?;
};

public type AppScreenshotSet record {
    string 'type;
    string id;
    AppscreenshotsetAttributes attributes?;
    AppscreenshotsetRelationships relationships?;
    ResourceLinks links;
};

public type AppStoreReviewDetailUpdateRequest record {
    AppstorereviewdetailupdaterequestData data;
};

public type AppencryptiondeclarationRelationshipsApp record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppencryptiondeclarationRelationshipsAppData data?;
};

public type RoutingAppCoverage record {
    string 'type;
    string id;
    AppstorereviewattachmentAttributes attributes?;
    AppstoreversionsubmissionRelationships relationships?;
    ResourceLinks links;
};

public type BetabuildlocalizationcreaterequestDataAttributes record {
    string whatsNew?;
    string locale;
};

public type BuildResponse record {
    Build data;
    (PrereleaseVersion|BetaTester|BetaBuildLocalization|AppEncryptionDeclaration|BetaAppReviewSubmission|App|BuildBetaDetail|AppStoreVersion|BuildIcon|PerfPowerMetric|DiagnosticSignature)[] included?;
    DocumentLinks links;
};

public type AppstoreversionphasedreleaseupdaterequestData record {
    string 'type;
    string id;
    AppstoreversionphasedreleasecreaterequestDataAttributes attributes?;
};

public type PrereleaseVersionResponse record {
    PrereleaseVersion data;
    (Build|App)[] included?;
    DocumentLinks links;
};

public type AppCategoryResponse record {
    AppCategory data;
    (AppCategory|AppCategory)[] included?;
    DocumentLinks links;
};

public type InapppurchaseRelationships record {
    BetatesterRelationshipsApps apps?;
};

public type BundleIdCapability record {
    string 'type;
    string id;
    BundleidcapabilityAttributes attributes?;
    ResourceLinks links;
};

public type ApppreviewsetcreaterequestDataAttributes record {
    PreviewType previewType;
};

public type InAppPurchasesResponse record {
    InAppPurchase[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppInfo record {
    string 'type;
    string id;
    AppinfoAttributes attributes?;
    AppinfoRelationships relationships?;
    ResourceLinks links;
};

public type AppupdaterequestDataRelationshipsPrices record {
    AppRelationshipsPricesData[] data?;
};

public type BetaBuildLocalizationCreateRequest record {
    BetabuildlocalizationcreaterequestData data;
};

public type BetaBuildLocalizationUpdateRequest record {
    BetabuildlocalizationupdaterequestData data;
};

public type BuildAttributes record {
    string 'version?;
    string uploadedDate?;
    string expirationDate?;
    boolean expired?;
    string minOsVersion?;
    ImageAsset iconAssetToken?;
    string processingState?;
    boolean usesNonExemptEncryption?;
};

public type ApppricepointRelationshipsPricetier record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    ApppricepointRelationshipsPricetierData data?;
};

public type ProfileRelationshipsBundleid record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    BundleidcapabilitycreaterequestDataRelationshipsBundleidData data?;
};

public type ErrorresponseErrors record {
    string id?;
    string status;
    string code;
    string title;
    string detail;
    record {string pointer?;}|record {string 'parameter?;} 'source?;
};

public type AgeRatingDeclarationUpdateRequest record {
    AgeratingdeclarationupdaterequestData data;
};

public type AppstorereviewattachmentcreaterequestDataRelationshipsAppstorereviewdetail record {
    AppstorereviewattachmentRelationshipsAppstorereviewdetailData data;
};

public type AppstorereviewdetailcreaterequestData record {
    string 'type;
    AppstorereviewdetailAttributes attributes?;
    AppstorereviewdetailcreaterequestDataRelationships relationships;
};

public type GamecenterenabledversionRelationships record {
    AppRelationshipsGamecenterenabledversions compatibleVersions?;
    AppencryptiondeclarationRelationshipsApp app?;
};

public type UsersResponse record {
    User[] data;
    App[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type PrereleaseVersion record {
    string 'type;
    string id;
    PrereleaseversionAttributes attributes?;
    PrereleaseversionRelationships relationships?;
    ResourceLinks links;
};

public type BetaBuildLocalizationsResponse record {
    BetaBuildLocalization[] data;
    Build[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppstorereviewattachmentAttributes record {
    int fileSize?;
    string fileName?;
    string sourceFileChecksum?;
    UploadOperation[] uploadOperations?;
    AppMediaAssetState assetDeliveryState?;
};

public type BuildRelationshipsBetabuildlocalizations record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    BuildRelationshipsBetabuildlocalizationsData[] data?;
};

public type PhasedReleaseState string;

public type AppPriceResponse record {
    AppPrice data;
    DocumentLinks links;
};

public type DeviceupdaterequestData record {
    string 'type;
    string id;
    DeviceupdaterequestDataAttributes attributes?;
};

public type ApppreordercreaterequestDataRelationshipsApp record {
    AppencryptiondeclarationRelationshipsAppData data;
};

public type BetaappreviewsubmissioncreaterequestDataRelationshipsBuild record {
    AppstoreversionRelationshipsBuildData data;
};

public type BetaAppLocalizationUpdateRequest record {
    BetaapplocalizationupdaterequestData data;
};

public type CertificatecreaterequestData record {
    string 'type;
    CertificatecreaterequestDataAttributes attributes;
};

public type BetaAppReviewDetail record {
    string 'type;
    string id;
    AppstorereviewdetailAttributes attributes?;
    AppencryptiondeclarationRelationships relationships?;
    ResourceLinks links;
};

public type AppStoreVersionBuildLinkageRequest record {
    AppstoreversionRelationshipsBuildData data;
};

public type AppPreview record {
    string 'type;
    string id;
    ApppreviewAttributes attributes?;
    ApppreviewRelationships relationships?;
    ResourceLinks links;
};

public type ApppreviewsetRelationshipsApppreviews record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    ApppreviewsetRelationshipsApppreviewsData[] data?;
};

public type AppstoreversionphasedreleaseAttributes record {
    PhasedReleaseState phasedReleaseState?;
    string startDate?;
    int totalPauseDuration?;
    int currentDayNumber?;
};

public type BundleidcapabilitycreaterequestDataRelationships record {
    BundleidcapabilitycreaterequestDataRelationshipsBundleid bundleId;
};

public type AppscreenshotsetRelationships record {
    ApppreviewsetRelationshipsAppstoreversionlocalization appStoreVersionLocalization?;
    AppscreenshotsetRelationshipsAppscreenshots appScreenshots?;
};

public type BetatesterinvitationcreaterequestDataRelationships record {
    BetatesterinvitationcreaterequestDataRelationshipsBetatester betaTester;
    ApppreordercreaterequestDataRelationshipsApp app;
};

public type EnduserlicenseagreementcreaterequestDataRelationshipsTerritories record {
    ApppricepointRelationshipsTerritoryData[] data;
};

public type ApppreviewcreaterequestData record {
    string 'type;
    ApppreviewcreaterequestDataAttributes attributes;
    ApppreviewcreaterequestDataRelationships relationships;
};

public type BundleidupdaterequestData record {
    string 'type;
    string id;
    BundleidupdaterequestDataAttributes attributes?;
};

public type AppstoreversioncreaterequestDataAttributes record {
    Platform platform;
    string versionString;
    string copyright?;
    string releaseType?;
    string earliestReleaseDate?;
    boolean usesIdfa?;
};

public type AppScreenshotSetAppScreenshotsLinkagesRequest record {
    AppscreenshotsetRelationshipsAppscreenshotsData[] data;
};

public type AppPriceTiersResponse record {
    AppPriceTier[] data;
    AppPricePoint[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppstorereviewdetailRelationshipsAppstoreversion record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppstorereviewdetailRelationshipsAppstoreversionData data?;
};

public type AppRelationshipsPrereleaseversions record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    AppRelationshipsPrereleaseversionsData[] data?;
};

public type AppRelationshipsAppstoreversions record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    AppstorereviewdetailRelationshipsAppstoreversionData[] data?;
};

public type App record {
    string 'type;
    string id;
    AppAttributes attributes?;
    AppRelationships relationships?;
    ResourceLinks links;
};

public type BetaapplocalizationcreaterequestData record {
    string 'type;
    BetaapplocalizationcreaterequestDataAttributes attributes;
    ApppreordercreaterequestDataRelationships relationships;
};

public type BundleIdCapabilityResponse record {
    BundleIdCapability data;
    DocumentLinks links;
};

public type BetaAppLocalization record {
    string 'type;
    string id;
    BetaapplocalizationAttributes attributes?;
    AppencryptiondeclarationRelationships relationships?;
    ResourceLinks links;
};

public type AppStoreVersionsResponse record {
    AppStoreVersion[] data;
    (AgeRatingDeclaration|AppStoreVersionLocalization|Build|AppStoreVersionPhasedRelease|RoutingAppCoverage|AppStoreReviewDetail|AppStoreVersionSubmission|IdfaDeclaration)[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BundleIdCapabilitiesResponse record {
    BundleIdCapability[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetatestercreaterequestDataRelationships record {
    BetatestercreaterequestDataRelationshipsBetagroups betaGroups?;
    BetagroupcreaterequestDataRelationshipsBuilds builds?;
};

public type AppstoreversionRelationshipsBuildData record {
    string 'type;
    string id;
};

public type BetaapplocalizationupdaterequestDataAttributes record {
    string feedbackEmail?;
    string marketingUrl?;
    string privacyPolicyUrl?;
    string tvOsPrivacyPolicy?;
    string description?;
};

public type BetaappreviewsubmissionRelationships record {
    AppstoreversionRelationshipsBuild build?;
};

public type AppPreviewSetAppPreviewsLinkagesRequest record {
    ApppreviewsetRelationshipsApppreviewsData[] data;
};

public type AppstoreversionAttributes record {
    Platform platform?;
    string versionString?;
    AppStoreVersionState appStoreState?;
    string copyright?;
    string releaseType?;
    string earliestReleaseDate?;
    boolean usesIdfa?;
    boolean downloadable?;
    string createdDate?;
};

public type BuildBetaDetailResponse record {
    BuildBetaDetail data;
    Build[] included?;
    DocumentLinks links;
};

public type AppstoreversionphasedreleasecreaterequestDataAttributes record {
    PhasedReleaseState phasedReleaseState?;
};

public type ProfilesResponse record {
    Profile[] data;
    (BundleId|Device|Certificate)[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppencryptiondeclarationRelationshipsAppData record {
    string 'type;
    string id;
};

public type CertificatecreaterequestDataAttributes record {
    string csrContent;
    CertificateType certificateType;
};

public type InAppPurchase record {
    string 'type;
    string id;
    InapppurchaseAttributes attributes?;
    InapppurchaseRelationships relationships?;
    ResourceLinks links;
};

public type AgeratingdeclarationAttributes record {
    string alcoholTobaccoOrDrugUseOrReferences?;
    string contests?;
    boolean gamblingAndContests?;
    boolean gambling?;
    string gamblingSimulated?;
    KidsAgeBand kidsAgeBand?;
    string medicalOrTreatmentInformation?;
    string profanityOrCrudeHumor?;
    string sexualContentGraphicAndNudity?;
    string sexualContentOrNudity?;
    boolean seventeenPlus?;
    string horrorOrFearThemes?;
    string matureOrSuggestiveThemes?;
    boolean unrestrictedWebAccess?;
    string violenceCartoonOrFantasy?;
    string violenceRealisticProlongedGraphicOrSadistic?;
    string violenceRealistic?;
};

public type AppStoreVersionSubmission record {
    string 'type;
    string id;
    AppstoreversionsubmissionRelationships relationships?;
    ResourceLinks links;
};

public type BetaLicenseAgreement record {
    string 'type;
    string id;
    BetalicenseagreementAttributes attributes?;
    AppencryptiondeclarationRelationships relationships?;
    ResourceLinks links;
};

public type IdfadeclarationAttributes record {
    boolean servesAds?;
    boolean attributesAppInstallationToPreviousAd?;
    boolean attributesActionWithPreviousAd?;
    boolean honorsLimitedAdTracking?;
};

public type DocumentLinks record {
    string self;
};

public type BundleidcapabilitycreaterequestDataRelationshipsBundleid record {
    BundleidcapabilitycreaterequestDataRelationshipsBundleidData data;
};

public type EnduserlicenseagreementRelationships record {
    AppencryptiondeclarationRelationshipsApp app?;
    AppRelationshipsAvailableterritories territories?;
};

public type BuildupdaterequestData record {
    string 'type;
    string id;
    BuildupdaterequestDataAttributes attributes?;
    BuildupdaterequestDataRelationships relationships?;
};

public type GameCenterEnabledVersion record {
    string 'type;
    string id;
    GamecenterenabledversionAttributes attributes?;
    GamecenterenabledversionRelationships relationships?;
    ResourceLinks links;
};

public type AppscreenshotupdaterequestDataAttributes record {
    string sourceFileChecksum?;
    boolean uploaded?;
};

public type AppAttributes record {
    string name?;
    string bundleId?;
    string sku?;
    string primaryLocale?;
    boolean isOrEverWasMadeForKids?;
    boolean availableInNewTerritories?;
    string contentRightsDeclaration?;
};

public type BuildupdaterequestDataRelationshipsAppencryptiondeclaration record {
    BuildRelationshipsAppencryptiondeclarationData data?;
};

public type AppRelationshipsBetagroups record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    AppRelationshipsBetagroupsData[] data?;
};

public type AppRelationshipsPricesData record {
    string 'type;
    string id;
};

public type BuildRelationshipsPrereleaseversion record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppRelationshipsPrereleaseversionsData data?;
};

public type AppStoreVersionLocalizationUpdateRequest record {
    AppstoreversionlocalizationupdaterequestData data;
};

public type AppstoreversionRelationshipsAppstoreversionsubmissionData record {
    string 'type;
    string id;
};

public type BuildupdaterequestDataRelationships record {
    BuildupdaterequestDataRelationshipsAppencryptiondeclaration appEncryptionDeclaration?;
};

public type DeviceCreateRequest record {
    DevicecreaterequestData data;
};

public type ProfileRelationshipsCertificatesData record {
    string 'type;
    string id;
};

public type AppStoreVersionUpdateRequest record {
    AppstoreversionupdaterequestData data;
};

public type BundleidRelationshipsProfilesData record {
    string 'type;
    string id;
};

public type AppstoreversionsubmissioncreaterequestData record {
    string 'type;
    AppstorereviewdetailcreaterequestDataRelationships relationships;
};

public type AppscreenshotRelationshipsAppscreenshotsetData record {
    string 'type;
    string id;
};

public type BuildRelationshipsBuildbetadetailData record {
    string 'type;
    string id;
};

public type ApppreviewsetRelationshipsAppstoreversionlocalization record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    ApppreviewsetRelationshipsAppstoreversionlocalizationData data?;
};

public type AppStoreVersionPhasedReleaseResponse record {
    AppStoreVersionPhasedRelease data;
    DocumentLinks links;
};

public type BetaInviteType string;

public type UploadOperation record {
    string method?;
    string url?;
    int length?;
    int offset?;
    UploadOperationHeader[] requestHeaders?;
};

public type AppRelationshipsAppinfos record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    AppinfolocalizationRelationshipsAppinfoData[] data?;
};

public type EnduserlicenseagreementcreaterequestDataAttributes record {
    string agreementText;
};

public type ProfilecreaterequestDataAttributes record {
    string name;
    string profileType;
};

public type AppScreenshotCreateRequest record {
    AppscreenshotcreaterequestData data;
};

public type UserUpdateRequest record {
    UserupdaterequestData data;
};

public type TerritoryAttributes record {
    string currency?;
};

public type AppinfoRelationships record {
    AppencryptiondeclarationRelationshipsApp app?;
    AppinfoRelationshipsAgeratingdeclaration ageRatingDeclaration?;
    AppinfoRelationshipsAppinfolocalizations appInfoLocalizations?;
    AppcategoryRelationshipsParent primaryCategory?;
    AppcategoryRelationshipsParent primarySubcategoryOne?;
    AppcategoryRelationshipsParent primarySubcategoryTwo?;
    AppcategoryRelationshipsParent secondaryCategory?;
    AppcategoryRelationshipsParent secondarySubcategoryOne?;
    AppcategoryRelationshipsParent secondarySubcategoryTwo?;
};

public type ApppreviewRelationshipsApppreviewsetData record {
    string 'type;
    string id;
};

public type AppPreOrder record {
    string 'type;
    string id;
    ApppreorderAttributes attributes?;
    AppencryptiondeclarationRelationships relationships?;
    ResourceLinks links;
};

public type AppRelationships record {
    AppRelationshipsBetagroups betaGroups?;
    AppRelationshipsAppstoreversions appStoreVersions?;
    AppRelationshipsPrereleaseversions preReleaseVersions?;
    AppRelationshipsBetaapplocalizations betaAppLocalizations?;
    AppRelationshipsBuilds builds?;
    AppRelationshipsBetalicenseagreement betaLicenseAgreement?;
    AppRelationshipsBetaappreviewdetail betaAppReviewDetail?;
    AppRelationshipsAppinfos appInfos?;
    AppRelationshipsEnduserlicenseagreement endUserLicenseAgreement?;
    AppRelationshipsPreorder preOrder?;
    AppRelationshipsPrices prices?;
    AppRelationshipsAvailableterritories availableTerritories?;
    AppRelationshipsInapppurchases inAppPurchases?;
    AppRelationshipsGamecenterenabledversions gameCenterEnabledVersions?;
};

public type AppsResponse record {
    App[] data;
    (BetaGroup|AppStoreVersion|PrereleaseVersion|BetaAppLocalization|Build|BetaLicenseAgreement|BetaAppReviewDetail|AppInfo|EndUserLicenseAgreement|AppPreOrder|AppPrice|Territory|InAppPurchase|GameCenterEnabledVersion|PerfPowerMetric)[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetagroupupdaterequestData record {
    string 'type;
    string id;
    BetagroupupdaterequestDataAttributes attributes?;
};

public type BuildRelationshipsIconsData record {
    string 'type;
    string id;
};

public type AppInfosResponse record {
    AppInfo[] data;
    (AppInfoLocalization|AppCategory|AppCategory|AppCategory|AppCategory|AppCategory|AppCategory)[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetaAppReviewSubmissionResponse record {
    BetaAppReviewSubmission data;
    Build[] included?;
    DocumentLinks links;
};

public type BetagroupRelationshipsBetatesters record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    BetagroupRelationshipsBetatestersData[] data?;
};

public type AppPricePointsResponse record {
    AppPricePoint[] data;
    Territory[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppScreenshotSetCreateRequest record {
    AppscreenshotsetcreaterequestData data;
};

public type AppStoreVersionPhasedRelease record {
    string 'type;
    string id;
    AppstoreversionphasedreleaseAttributes attributes?;
    ResourceLinks links;
};

public type BetatestercreaterequestDataRelationshipsBetagroups record {
    AppRelationshipsBetagroupsData[] data?;
};

public type BuildRelationshipsAppencryptiondeclarationData record {
    string 'type;
    string id;
};

public type BetaAppReviewSubmissionCreateRequest record {
    BetaappreviewsubmissioncreaterequestData data;
};

public type AppinfolocalizationRelationshipsAppinfoData record {
    string 'type;
    string id;
};

public type AppcategoryRelationshipsParent record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppcategoryRelationshipsSubcategoriesData data?;
};

public type BetaTesterAppsLinkagesRequest record {
    AppencryptiondeclarationRelationshipsAppData[] data;
};

public type BundleIdCapabilityUpdateRequest record {
    BundleidcapabilityupdaterequestData data;
};

public type AppstoreversionphasedreleasecreaterequestData record {
    string 'type;
    AppstoreversionphasedreleasecreaterequestDataAttributes attributes?;
    AppstorereviewdetailcreaterequestDataRelationships relationships;
};

public type BuildRelationships record {
    BuildRelationshipsPrereleaseversion preReleaseVersion?;
    BetagroupRelationshipsBetatesters individualTesters?;
    BuildRelationshipsBetabuildlocalizations betaBuildLocalizations?;
    BuildRelationshipsAppencryptiondeclaration appEncryptionDeclaration?;
    BuildRelationshipsBetaappreviewsubmission betaAppReviewSubmission?;
    AppencryptiondeclarationRelationshipsApp app?;
    BuildRelationshipsBuildbetadetail buildBetaDetail?;
    AppstorereviewdetailRelationshipsAppstoreversion appStoreVersion?;
    BuildRelationshipsIcons icons?;
};

public type BundleidupdaterequestDataAttributes record {
    string name?;
};

public type AgeRatingDeclarationResponse record {
    AgeRatingDeclaration data;
    DocumentLinks links;
};

public type AppStoreReviewAttachmentResponse record {
    AppStoreReviewAttachment data;
    DocumentLinks links;
};

public type AppstorereviewdetailRelationships record {
    AppstorereviewdetailRelationshipsAppstoreversion appStoreVersion?;
    AppstorereviewdetailRelationshipsAppstorereviewattachments appStoreReviewAttachments?;
};

public type AppPricePointResponse record {
    AppPricePoint data;
    Territory[] included?;
    DocumentLinks links;
};

public type AppstorereviewattachmentupdaterequestData record {
    string 'type;
    string id;
    AppscreenshotupdaterequestDataAttributes attributes?;
};

public type BuildRelationshipsBetaappreviewsubmission record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    BuildRelationshipsBetaappreviewsubmissionData data?;
};

public type AppMediaStateError record {
    string code?;
    string description?;
};

public type BuildAppEncryptionDeclarationLinkageResponse record {
    BuildRelationshipsAppencryptiondeclarationData data;
    DocumentLinks links;
};

public type BetaAppReviewSubmission record {
    string 'type;
    string id;
    BetaappreviewsubmissionAttributes attributes?;
    BetaappreviewsubmissionRelationships relationships?;
    ResourceLinks links;
};

public type BuildBetaDetailsResponse record {
    BuildBetaDetail[] data;
    Build[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type PerfPowerMetric record {
    string 'type;
    string id;
    PerfpowermetricAttributes attributes?;
    ResourceLinks links;
};

public type AppRelationshipsBetagroupsData record {
    string 'type;
    string id;
};

public type Territory record {
    string 'type;
    string id;
    TerritoryAttributes attributes?;
    ResourceLinks links;
};

public type AppstorereviewattachmentRelationshipsAppstorereviewdetailData record {
    string 'type;
    string id;
};

public type AppstorereviewdetailcreaterequestDataRelationshipsAppstoreversion record {
    AppstorereviewdetailRelationshipsAppstoreversionData data;
};

public type BetaappreviewsubmissionAttributes record {
    BetaReviewState betaReviewState?;
};

public type BuildIndividualTestersLinkagesRequest record {
    BetagroupRelationshipsBetatestersData[] data;
};

public type AppInfoLocalizationsResponse record {
    AppInfoLocalization[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppRelationshipsBetaapplocalizationsData record {
    string 'type;
    string id;
};

public type DiagnosticLogsResponse record {
    DiagnosticLog[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetagroupcreaterequestDataAttributes record {
    string name;
    boolean publicLinkEnabled?;
    boolean publicLinkLimitEnabled?;
    int publicLinkLimit?;
    boolean feedbackEnabled?;
};

public type AppRelationshipsInapppurchases record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    AppRelationshipsInapppurchasesData[] data?;
};

public type AppEncryptionDeclarationsResponse record {
    AppEncryptionDeclaration[] data;
    App[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetaAppReviewSubmissionsResponse record {
    BetaAppReviewSubmission[] data;
    Build[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BuildBetaNotification record {
    string 'type;
    string id;
    ResourceLinks links;
};

public type BuildBetaNotificationCreateRequest record {
    BuildbetanotificationcreaterequestData data;
};

public type ApppriceRelationships record {
    AppencryptiondeclarationRelationshipsApp app?;
    ApppricepointRelationshipsPricetier priceTier?;
};

public type EnduserlicenseagreementcreaterequestData record {
    string 'type;
    EnduserlicenseagreementcreaterequestDataAttributes attributes;
    EnduserlicenseagreementcreaterequestDataRelationships relationships;
};

public type AppPreOrderCreateRequest record {
    ApppreordercreaterequestData data;
};

public type AppStoreReviewDetail record {
    string 'type;
    string id;
    AppstorereviewdetailAttributes attributes?;
    AppstorereviewdetailRelationships relationships?;
    ResourceLinks links;
};

public type AppstoreversionlocalizationRelationshipsApppreviewsets record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    ApppreviewRelationshipsApppreviewsetData[] data?;
};

public type BuildBetaDetail record {
    string 'type;
    string id;
    BuildbetadetailAttributes attributes?;
    BetaappreviewsubmissionRelationships relationships?;
    ResourceLinks links;
};

public type BetaLicenseAgreementResponse record {
    BetaLicenseAgreement data;
    App[] included?;
    DocumentLinks links;
};

public type ApppricepointAttributes record {
    string customerPrice?;
    string proceeds?;
};

public type BetaTester record {
    string 'type;
    string id;
    BetatesterAttributes attributes?;
    BetatesterRelationships relationships?;
    ResourceLinks links;
};

public type Certificate record {
    string 'type;
    string id;
    CertificateAttributes attributes?;
    ResourceLinks links;
};

public type AppinfoAttributes record {
    AppStoreVersionState appStoreState?;
    AppStoreAgeRating appStoreAgeRating?;
    BrazilAgeRating brazilAgeRating?;
    KidsAgeBand kidsAgeBand?;
};

public type ApppreviewupdaterequestData record {
    string 'type;
    string id;
    ApppreviewupdaterequestDataAttributes attributes?;
};

public type BuildBetaNotificationResponse record {
    BuildBetaNotification data;
    DocumentLinks links;
};

public type ApppricetierRelationshipsPricepoints record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    ApppricetierRelationshipsPricepointsData[] data?;
};

public type BundleidRelationships record {
    BundleidRelationshipsProfiles profiles?;
    BundleidRelationshipsBundleidcapabilities bundleIdCapabilities?;
    AppencryptiondeclarationRelationshipsApp app?;
};

public type AppInfoResponse record {
    AppInfo data;
    (AppInfoLocalization|AppCategory|AppCategory|AppCategory|AppCategory|AppCategory|AppCategory)[] included?;
    DocumentLinks links;
};

public type UserAttributes record {
    string username?;
    string firstName?;
    string lastName?;
    UserRole[] roles?;
    boolean allAppsVisible?;
    boolean provisioningAllowed?;
};

public type BetaGroupsResponse record {
    BetaGroup[] data;
    (App|Build|BetaTester)[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetaGroupCreateRequest record {
    BetagroupcreaterequestData data;
};

public type UserupdaterequestDataAttributes record {
    UserRole[] roles?;
    boolean allAppsVisible?;
    boolean provisioningAllowed?;
};

public type BuildUpdateRequest record {
    BuildupdaterequestData data;
};

public type ApppreviewsetRelationshipsAppstoreversionlocalizationData record {
    string 'type;
    string id;
};

public type AppstoreversionlocalizationcreaterequestDataAttributes record {
    string description?;
    string locale;
    string keywords?;
    string marketingUrl?;
    string promotionalText?;
    string supportUrl?;
    string whatsNew?;
};

public type BundleidcapabilitycreaterequestData record {
    string 'type;
    BundleidcapabilitycreaterequestDataAttributes attributes;
    BundleidcapabilitycreaterequestDataRelationships relationships;
};

public type AppStoreVersionSubmissionResponse record {
    AppStoreVersionSubmission data;
    DocumentLinks links;
};

public type AppResponse record {
    App data;
    (BetaGroup|AppStoreVersion|PrereleaseVersion|BetaAppLocalization|Build|BetaLicenseAgreement|BetaAppReviewDetail|AppInfo|EndUserLicenseAgreement|AppPreOrder|AppPrice|Territory|InAppPurchase|GameCenterEnabledVersion|PerfPowerMetric)[] included?;
    DocumentLinks links;
};

public type DevicesResponse record {
    Device[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppinfolocalizationRelationships record {
    AppinfolocalizationRelationshipsAppinfo appInfo?;
};

public type BetagroupcreaterequestDataRelationshipsBetatesters record {
    BetagroupRelationshipsBetatestersData[] data?;
};

public type AppInfoLocalizationUpdateRequest record {
    AppinfolocalizationupdaterequestData data;
};

public type AppscreenshotsetRelationshipsAppscreenshots record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    AppscreenshotsetRelationshipsAppscreenshotsData[] data?;
};

public type ProfileRelationshipsCertificates record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    ProfileRelationshipsCertificatesData[] data?;
};

public type ApppreviewupdaterequestDataAttributes record {
    string sourceFileChecksum?;
    string previewFrameTimeCode?;
    boolean uploaded?;
};

public type BetagroupcreaterequestDataRelationshipsBuilds record {
    AppstoreversionRelationshipsBuildData[] data?;
};

public type AppstorereviewdetailupdaterequestData record {
    string 'type;
    string id;
    AppstorereviewdetailAttributes attributes?;
};

public type RoutingappcoveragecreaterequestData record {
    string 'type;
    AppscreenshotcreaterequestDataAttributes attributes;
    AppstorereviewdetailcreaterequestDataRelationships relationships;
};

public type BrazilAgeRating string;

public type CertificateResponse record {
    Certificate data;
    DocumentLinks links;
};

public type BuildBetaDetailUpdateRequest record {
    BuildbetadetailupdaterequestData data;
};

public type ProfilecreaterequestDataRelationshipsDevices record {
    ProfileRelationshipsDevicesData[] data?;
};

public type UserResponse record {
    User data;
    App[] included?;
    DocumentLinks links;
};

public type AgeRatingDeclaration record {
    string 'type;
    string id;
    AgeratingdeclarationAttributes attributes?;
    ResourceLinks links;
};

public type AppstoreversioncreaterequestData record {
    string 'type;
    AppstoreversioncreaterequestDataAttributes attributes;
    AppstoreversioncreaterequestDataRelationships relationships;
};

public type ProfileCreateRequest record {
    ProfilecreaterequestData data;
};

public type TerritoriesResponse record {
    Territory[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type ApppreviewAttributes record {
    int fileSize?;
    string fileName?;
    string sourceFileChecksum?;
    string previewFrameTimeCode?;
    string mimeType?;
    string videoUrl?;
    ImageAsset previewImage?;
    UploadOperation[] uploadOperations?;
    AppMediaAssetState assetDeliveryState?;
};

public type AppStoreVersion record {
    string 'type;
    string id;
    AppstoreversionAttributes attributes?;
    AppstoreversionRelationships relationships?;
    ResourceLinks links;
};

public type BetaGroupBetaTestersLinkagesResponse record {
    BetagroupRelationshipsBetatestersData[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type IdfadeclarationcreaterequestData record {
    string 'type;
    IdfadeclarationcreaterequestDataAttributes attributes;
    AppstorereviewdetailcreaterequestDataRelationships relationships;
};

public type AppRelationshipsBetaappreviewdetail record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppRelationshipsBetaappreviewdetailData data?;
};

public type BuildAppEncryptionDeclarationLinkageRequest record {
    BuildRelationshipsAppencryptiondeclarationData data;
};

public type EndUserLicenseAgreementResponse record {
    EndUserLicenseAgreement data;
    Territory[] included?;
    DocumentLinks links;
};

public type AppRelationshipsGamecenterenabledversionsData record {
    string 'type;
    string id;
};

public type AppScreenshotSetsResponse record {
    AppScreenshotSet[] data;
    AppScreenshot[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppRelationshipsBuilds record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    AppstoreversionRelationshipsBuildData[] data?;
};

public type Platform string;

public type DevicecreaterequestDataAttributes record {
    string name;
    BundleIdPlatform platform;
    string udid;
};

public type AppinfoRelationshipsAppinfolocalizations record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    AppinfoRelationshipsAppinfolocalizationsData[] data?;
};

public type ApppricepointRelationshipsTerritoryData record {
    string 'type;
    string id;
};

public type ApppreviewRelationships record {
    ApppreviewRelationshipsApppreviewset appPreviewSet?;
};

public type AppPreviewCreateRequest record {
    ApppreviewcreaterequestData data;
};

public type AppScreenshotResponse record {
    AppScreenshot data;
    DocumentLinks links;
};

public type BetagroupcreaterequestDataRelationships record {
    ApppreordercreaterequestDataRelationshipsApp app;
    BetagroupcreaterequestDataRelationshipsBuilds builds?;
    BetagroupcreaterequestDataRelationshipsBetatesters betaTesters?;
};

public type AppstoreversioncreaterequestDataRelationshipsBuild record {
    AppstoreversionRelationshipsBuildData data?;
};

public type AppStoreReviewAttachmentsResponse record {
    AppStoreReviewAttachment[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppstoreversionupdaterequestDataAttributes record {
    string versionString?;
    string copyright?;
    string releaseType?;
    string earliestReleaseDate?;
    boolean usesIdfa?;
    boolean downloadable?;
};

public type AppinfoupdaterequestDataRelationshipsPrimarycategory record {
    AppcategoryRelationshipsSubcategoriesData data?;
};

public type CertificateCreateRequest record {
    CertificatecreaterequestData data;
};

public type UserinvitationcreaterequestDataRelationships record {
    UserinvitationcreaterequestDataRelationshipsVisibleapps visibleApps?;
};

public type BuildsResponse record {
    Build[] data;
    (PrereleaseVersion|BetaTester|BetaBuildLocalization|AppEncryptionDeclaration|BetaAppReviewSubmission|App|BuildBetaDetail|AppStoreVersion|BuildIcon|PerfPowerMetric|DiagnosticSignature)[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type ProfileRelationships record {
    ProfileRelationshipsBundleid bundleId?;
    ProfileRelationshipsDevices devices?;
    ProfileRelationshipsCertificates certificates?;
};

public type AppStoreVersionCreateRequest record {
    AppstoreversioncreaterequestData data;
};

public type InAppPurchaseResponse record {
    InAppPurchase data;
    DocumentLinks links;
};

public type EndUserLicenseAgreementCreateRequest record {
    EnduserlicenseagreementcreaterequestData data;
};

public type ProfileRelationshipsDevices record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    ProfileRelationshipsDevicesData[] data?;
};

public type BetagroupupdaterequestDataAttributes record {
    string name?;
    boolean publicLinkEnabled?;
    boolean publicLinkLimitEnabled?;
    int publicLinkLimit?;
    boolean feedbackEnabled?;
};

public type AppstoreversionlocalizationRelationships record {
    AppstorereviewdetailRelationshipsAppstoreversion appStoreVersion?;
    AppstoreversionlocalizationRelationshipsAppscreenshotsets appScreenshotSets?;
    AppstoreversionlocalizationRelationshipsApppreviewsets appPreviewSets?;
};

public type PagedDocumentLinks record {
    string self;
    string first?;
    string next?;
};

public type CapabilityOption record {
    string 'key?;
    string name?;
    string description?;
    boolean enabledByDefault?;
    boolean enabled?;
    boolean supportsWildcard?;
};

public type AppcategoryRelationshipsSubcategoriesLinks record {
    string self?;
    string related?;
};

public type AppscreenshotAttributes record {
    int fileSize?;
    string fileName?;
    string sourceFileChecksum?;
    ImageAsset imageAsset?;
    string assetToken?;
    string assetType?;
    UploadOperation[] uploadOperations?;
    AppMediaAssetState assetDeliveryState?;
};

public type GameCenterEnabledVersionsResponse record {
    GameCenterEnabledVersion[] data;
    GameCenterEnabledVersion[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppencryptiondeclarationRelationships record {
    AppencryptiondeclarationRelationshipsApp app?;
};

public type BuildRelationshipsIcons record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    BuildRelationshipsIconsData[] data?;
};

public type AppStoreVersionLocalizationResponse record {
    AppStoreVersionLocalization data;
    (AppScreenshotSet|AppPreviewSet)[] included?;
    DocumentLinks links;
};

public type RoutingAppCoverageCreateRequest record {
    RoutingappcoveragecreaterequestData data;
};

public type AppRelationshipsBetalicenseagreement record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppRelationshipsBetalicenseagreementData data?;
};

public type AppPriceTierResponse record {
    AppPriceTier data;
    AppPricePoint[] included?;
    DocumentLinks links;
};

public type UserupdaterequestData record {
    string 'type;
    string id;
    UserupdaterequestDataAttributes attributes?;
    UserinvitationcreaterequestDataRelationships relationships?;
};

public type AppMediaAssetState record {
    AppMediaStateError[] errors?;
    AppMediaStateError[] warnings?;
    string state?;
};

public type BetaTesterInvitation record {
    string 'type;
    string id;
    ResourceLinks links;
};

public type AppinfolocalizationcreaterequestDataRelationshipsAppinfo record {
    AppinfolocalizationRelationshipsAppinfoData data;
};

public type DiagnosticSignaturesResponse record {
    DiagnosticSignature[] data;
    DiagnosticLog[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type PerfPowerMetricsResponse record {
    PerfPowerMetric[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppscreenshotupdaterequestData record {
    string 'type;
    string id;
    AppscreenshotupdaterequestDataAttributes attributes?;
};

public type AppPreviewSetAppPreviewsLinkagesResponse record {
    ApppreviewsetRelationshipsApppreviewsData[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetatestercreaterequestDataAttributes record {
    string firstName?;
    string lastName?;
    string email;
};

public type ApppreviewsetRelationships record {
    ApppreviewsetRelationshipsAppstoreversionlocalization appStoreVersionLocalization?;
    ApppreviewsetRelationshipsApppreviews appPreviews?;
};

public type BetagroupcreaterequestData record {
    string 'type;
    BetagroupcreaterequestDataAttributes attributes;
    BetagroupcreaterequestDataRelationships relationships;
};

public type BetaTesterBetaGroupsLinkagesRequest record {
    AppRelationshipsBetagroupsData[] data;
};

public type BundleIdCapabilityCreateRequest record {
    BundleidcapabilitycreaterequestData data;
};

public type IdfaDeclaration record {
    string 'type;
    string id;
    IdfadeclarationAttributes attributes?;
    AppstoreversionsubmissionRelationships relationships?;
    ResourceLinks links;
};

public type AppstoreversionlocalizationRelationshipsAppscreenshotsets record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    AppscreenshotRelationshipsAppscreenshotsetData[] data?;
};

public type IdfaDeclarationUpdateRequest record {
    IdfadeclarationupdaterequestData data;
};

public type AppinfolocalizationcreaterequestDataAttributes record {
    string locale;
    string name?;
    string subtitle?;
    string privacyPolicyUrl?;
    string privacyPolicyText?;
};

public type PreReleaseVersionsResponse record {
    PrereleaseVersion[] data;
    (Build|App)[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BundleidAttributes record {
    string name?;
    BundleIdPlatform platform?;
    string identifier?;
    string seedId?;
};

public type UserInvitationsResponse record {
    UserInvitation[] data;
    App[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetaAppReviewDetailUpdateRequest record {
    BetaappreviewdetailupdaterequestData data;
};

public type BetaReviewState string;

public type BetatesterinvitationcreaterequestData record {
    string 'type;
    BetatesterinvitationcreaterequestDataRelationships relationships;
};

public type AppEncryptionDeclarationState string;

public type AppPrice record {
    string 'type;
    string id;
    ApppriceRelationships relationships?;
    ResourceLinks links;
};

public type BetagroupRelationships record {
    AppencryptiondeclarationRelationshipsApp app?;
    AppRelationshipsBuilds builds?;
    BetagroupRelationshipsBetatesters betaTesters?;
};

public type UserinvitationcreaterequestDataRelationshipsVisibleapps record {
    AppencryptiondeclarationRelationshipsAppData[] data?;
};

public type BetaTesterCreateRequest record {
    BetatestercreaterequestData data;
};

public type AppRelationshipsGamecenterenabledversions record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    AppRelationshipsGamecenterenabledversionsData[] data?;
};

public type AppRelationshipsPreorder record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppRelationshipsPreorderData data?;
};

public type AppRelationshipsBetaapplocalizations record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    AppRelationshipsBetaapplocalizationsData[] data?;
};

public type UserinvitationcreaterequestData record {
    string 'type;
    UserinvitationcreaterequestDataAttributes attributes;
    UserinvitationcreaterequestDataRelationships relationships?;
};

public type AppstoreversionRelationshipsAppstoreversionsubmission record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppstoreversionRelationshipsAppstoreversionsubmissionData data?;
};

public type AppinfoupdaterequestDataRelationships record {
    AppinfoupdaterequestDataRelationshipsPrimarycategory primaryCategory?;
    AppinfoupdaterequestDataRelationshipsPrimarycategory primarySubcategoryOne?;
    AppinfoupdaterequestDataRelationshipsPrimarycategory primarySubcategoryTwo?;
    AppinfoupdaterequestDataRelationshipsPrimarycategory secondaryCategory?;
    AppinfoupdaterequestDataRelationshipsPrimarycategory secondarySubcategoryOne?;
    AppinfoupdaterequestDataRelationshipsPrimarycategory secondarySubcategoryTwo?;
};

public type ApppreviewsetAttributes record {
    PreviewType previewType?;
};

public type EnduserlicenseagreementupdaterequestData record {
    string 'type;
    string id;
    BetalicenseagreementAttributes attributes?;
    EnduserlicenseagreementupdaterequestDataRelationships relationships?;
};

public type CertificatesResponse record {
    Certificate[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type IdfaDeclarationResponse record {
    IdfaDeclaration data;
    DocumentLinks links;
};

public type BuildbetadetailAttributes record {
    boolean autoNotifyEnabled?;
    InternalBetaState internalBuildState?;
    ExternalBetaState externalBuildState?;
};

public type BetaTesterInvitationResponse record {
    BetaTesterInvitation data;
    DocumentLinks links;
};

public type BetatestercreaterequestData record {
    string 'type;
    BetatestercreaterequestDataAttributes attributes;
    BetatestercreaterequestDataRelationships relationships?;
};

public type BetatesterinvitationcreaterequestDataRelationshipsBetatester record {
    BetagroupRelationshipsBetatestersData data;
};

public type BuildRelationshipsBetaappreviewsubmissionData record {
    string 'type;
    string id;
};

public type AppStoreVersionResponse record {
    AppStoreVersion data;
    (AgeRatingDeclaration|AppStoreVersionLocalization|Build|AppStoreVersionPhasedRelease|RoutingAppCoverage|AppStoreReviewDetail|AppStoreVersionSubmission|IdfaDeclaration)[] included?;
    DocumentLinks links;
};

public type Device record {
    string 'type;
    string id;
    DeviceAttributes attributes?;
    ResourceLinks links;
};

public type PerfpowermetricAttributes record {
    string platform?;
    string metricType?;
    string deviceType?;
};

public type BetabuildlocalizationAttributes record {
    string whatsNew?;
    string locale?;
};

public type AppscreenshotsetRelationshipsAppscreenshotsData record {
    string 'type;
    string id;
};

public type AppstorereviewattachmentcreaterequestData record {
    string 'type;
    AppscreenshotcreaterequestDataAttributes attributes;
    AppstorereviewattachmentcreaterequestDataRelationships relationships;
};

public type UserInvitationResponse record {
    UserInvitation data;
    App[] included?;
    DocumentLinks links;
};

public type BetaappreviewsubmissioncreaterequestData record {
    string 'type;
    BetaappreviewsubmissioncreaterequestDataRelationships relationships;
};

public type ProfileAttributes record {
    string name?;
    BundleIdPlatform platform?;
    string profileType?;
    string profileState?;
    string profileContent?;
    string uuid?;
    string createdDate?;
    string expirationDate?;
};

public type AppPreviewSetResponse record {
    AppPreviewSet data;
    AppPreview[] included?;
    DocumentLinks links;
};

public type RoutingAppCoverageUpdateRequest record {
    RoutingappcoverageupdaterequestData data;
};

public type AppcategoryRelationships record {
    AppcategoryRelationshipsSubcategories subcategories?;
    AppcategoryRelationshipsParent parent?;
};

public type ApppricepointRelationshipsTerritory record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    ApppricepointRelationshipsTerritoryData data?;
};

public type DiagnosticLog record {
    string 'type;
    string id;
    ResourceLinks links;
};

public type PagingInformation record {
    PaginginformationPaging paging;
};

public type AppstoreversionRelationshipsRoutingappcoverageData record {
    string 'type;
    string id;
};

public type User record {
    string 'type;
    string id;
    UserAttributes attributes?;
    UserinvitationRelationships relationships?;
    ResourceLinks links;
};

public type ApppreordercreaterequestDataAttributes record {
    string appReleaseDate?;
};

public type AppstoreversionlocalizationAttributes record {
    string description?;
    string locale?;
    string keywords?;
    string marketingUrl?;
    string promotionalText?;
    string supportUrl?;
    string whatsNew?;
};

public type RoutingappcoverageupdaterequestData record {
    string 'type;
    string id;
    AppscreenshotupdaterequestDataAttributes attributes?;
};

public type AppstoreversionRelationshipsRoutingappcoverage record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    AppstoreversionRelationshipsRoutingappcoverageData data?;
};

public type AppStoreReviewAttachment record {
    string 'type;
    string id;
    AppstorereviewattachmentAttributes attributes?;
    AppstorereviewattachmentRelationships relationships?;
    ResourceLinks links;
};

public type AppPreviewSetCreateRequest record {
    ApppreviewsetcreaterequestData data;
};

public type BetaGroupResponse record {
    BetaGroup data;
    (App|Build|BetaTester)[] included?;
    DocumentLinks links;
};

public type BundleidcapabilityupdaterequestData record {
    string 'type;
    string id;
    BundleidcapabilityAttributes attributes?;
};

public type AppRelationshipsAvailableterritories record {
    AppcategoryRelationshipsSubcategoriesLinks links?;
    PagingInformation meta?;
    ApppricepointRelationshipsTerritoryData[] data?;
};

public type BetaGroupBuildsLinkagesResponse record {
    AppstoreversionRelationshipsBuildData[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppinfolocalizationcreaterequestDataRelationships record {
    AppinfolocalizationcreaterequestDataRelationshipsAppinfo appInfo;
};

public type AppPreviewResponse record {
    AppPreview data;
    DocumentLinks links;
};

public type AppUpdateRequest record {
    AppupdaterequestData data;
};

public type AppencryptiondeclarationAttributes record {
    boolean usesEncryption?;
    boolean exempt?;
    boolean containsProprietaryCryptography?;
    boolean containsThirdPartyCryptography?;
    boolean availableOnFrenchStore?;
    Platform platform?;
    string uploadedDate?;
    string documentUrl?;
    string documentName?;
    string documentType?;
    AppEncryptionDeclarationState appEncryptionDeclarationState?;
    string codeValue?;
};

public type AppstoreversionlocalizationcreaterequestData record {
    string 'type;
    AppstoreversionlocalizationcreaterequestDataAttributes attributes;
    AppstorereviewdetailcreaterequestDataRelationships relationships;
};

public type ApppreviewsetcreaterequestData record {
    string 'type;
    ApppreviewsetcreaterequestDataAttributes attributes;
    ApppreviewsetcreaterequestDataRelationships relationships;
};

public type AppstoreversionRelationshipsIdfadeclarationData record {
    string 'type;
    string id;
};

public type ApppricepointRelationships record {
    ApppricepointRelationshipsPricetier priceTier?;
    ApppricepointRelationshipsTerritory territory?;
};

public type EnduserlicenseagreementupdaterequestDataRelationships record {
    AppupdaterequestDataRelationshipsAvailableterritories territories?;
};

public type AppScreenshotUpdateRequest record {
    AppscreenshotupdaterequestData data;
};

public type BetaapplocalizationupdaterequestData record {
    string 'type;
    string id;
    BetaapplocalizationupdaterequestDataAttributes attributes?;
};

public type BuildbetadetailupdaterequestData record {
    string 'type;
    string id;
    BuildbetadetailupdaterequestDataAttributes attributes?;
};

public type CapabilityType string;

public type BetabuildlocalizationupdaterequestDataAttributes record {
    string whatsNew?;
};

public type BundleIdsResponse record {
    BundleId[] data;
    (Profile|BundleIdCapability|App)[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetaTesterBetaGroupsLinkagesResponse record {
    AppRelationshipsBetagroupsData[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type CertificateAttributes record {
    string name?;
    CertificateType certificateType?;
    string displayName?;
    string serialNumber?;
    BundleIdPlatform platform?;
    string expirationDate?;
    string certificateContent?;
};

public type ProfilecreaterequestDataRelationships record {
    BundleidcapabilitycreaterequestDataRelationshipsBundleid bundleId;
    ProfilecreaterequestDataRelationshipsDevices devices?;
    ProfilecreaterequestDataRelationshipsCertificates certificates;
};

public type BundleIdUpdateRequest record {
    BundleidupdaterequestData data;
};

public type ApppreordercreaterequestData record {
    string 'type;
    ApppreordercreaterequestDataAttributes attributes?;
    ApppreordercreaterequestDataRelationships relationships;
};

public type BundleId record {
    string 'type;
    string id;
    BundleidAttributes attributes?;
    BundleidRelationships relationships?;
    ResourceLinks links;
};

public type BetagroupAttributes record {
    string name?;
    string createdDate?;
    boolean isInternalGroup?;
    boolean publicLinkEnabled?;
    string publicLinkId?;
    boolean publicLinkLimitEnabled?;
    int publicLinkLimit?;
    string publicLink?;
    boolean feedbackEnabled?;
};

public type AppcategoryRelationshipsSubcategoriesData record {
    string 'type;
    string id;
};

public type DiagnosticsignatureAttributes record {
    string diagnosticType?;
    string signature?;
    decimal weight?;
};

public type RoutingAppCoverageResponse record {
    RoutingAppCoverage data;
    DocumentLinks links;
};

public type AppPreOrderResponse record {
    AppPreOrder data;
    DocumentLinks links;
};

public type IdfadeclarationupdaterequestData record {
    string 'type;
    string id;
    IdfadeclarationAttributes attributes?;
};

public type AppstoreversionupdaterequestData record {
    string 'type;
    string id;
    AppstoreversionupdaterequestDataAttributes attributes?;
    AppstoreversionupdaterequestDataRelationships relationships?;
};

public type AppCategoriesResponse record {
    AppCategory[] data;
    (AppCategory|AppCategory)[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};
