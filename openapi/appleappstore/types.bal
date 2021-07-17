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

public type App record {
    string 'type;
    string id;
    record  { string name?; string bundleId?; string sku?; string primaryLocale?; boolean isOrEverWasMadeForKids?; boolean availableInNewTerritories?; string contentRightsDeclaration?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  betaGroups?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  appStoreVersions?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  preReleaseVersions?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  betaAppLocalizations?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  builds?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  betaLicenseAgreement?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  betaAppReviewDetail?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  appInfos?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  endUserLicenseAgreement?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  preOrder?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  prices?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  availableTerritories?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  inAppPurchases?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  gameCenterEnabledVersions?;}  relationships?;
    ResourceLinks links;
};

public type IdfaDeclarationCreateRequest record {
    record  { string 'type; record  { boolean servesAds; boolean attributesAppInstallationToPreviousAd; boolean attributesActionWithPreviousAd; boolean honorsLimitedAdTracking;}  attributes; record  { record  { record  { string 'type; string id;}  data;}  appStoreVersion;}  relationships;}  data;
};

public type BundleIdCapabilityResponse record {
    BundleIdCapability data;
    DocumentLinks links;
};

public type BetaAppLocalization record {
    string 'type;
    string id;
    record  { string feedbackEmail?; string marketingUrl?; string privacyPolicyUrl?; string tvOsPrivacyPolicy?; string description?; string locale?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  app?;}  relationships?;
    ResourceLinks links;
};

public type AppEncryptionDeclarationBuildsLinkagesRequest record {
    record  { string 'type; string id;} [] data;
};

public type AppStoreVersionsResponse record {
    AppStoreVersion[] data;
    anydata[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BundleIdCapabilitiesResponse record {
    BundleIdCapability[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppPreviewsResponse record {
    AppPreview[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BuildIcon record {
    string 'type;
    string id;
    record  { ImageAsset iconAsset?; IconAssetType iconType?;}  attributes?;
    ResourceLinks links;
};

public type IconAssetType string;

public type BetaTestersResponse record {
    BetaTester[] data;
    anydata[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppPreviewSetAppPreviewsLinkagesRequest record {
    record  { string 'type; string id;} [] data;
};

public type BuildBetaDetailResponse record {
    BuildBetaDetail data;
    Build[] included?;
    DocumentLinks links;
};

public type BetaLicenseAgreementsResponse record {
    BetaLicenseAgreement[] data;
    App[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type ProfilesResponse record {
    Profile[] data;
    anydata[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type InAppPurchase record {
    string 'type;
    string id;
    record  { string referenceName?; string productId?; string inAppPurchaseType?; string state?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  apps?;}  relationships?;
    ResourceLinks links;
};

public type AppStoreVersionSubmission record {
    string 'type;
    string id;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  appStoreVersion?;}  relationships?;
    ResourceLinks links;
};

public type AppEncryptionDeclaration record {
    string 'type;
    string id;
    record  { boolean usesEncryption?; boolean exempt?; boolean containsProprietaryCryptography?; boolean containsThirdPartyCryptography?; boolean availableOnFrenchStore?; Platform platform?; string uploadedDate?; string documentUrl?; string documentName?; string documentType?; AppEncryptionDeclarationState appEncryptionDeclarationState?; string codeValue?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  app?;}  relationships?;
    ResourceLinks links;
};

public type BetaLicenseAgreement record {
    string 'type;
    string id;
    record  { string agreementText?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  app?;}  relationships?;
    ResourceLinks links;
};

public type DocumentLinks record {
    string self;
};

public type GameCenterEnabledVersion record {
    string 'type;
    string id;
    record  { Platform platform?; string versionString?; ImageAsset iconAsset?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  compatibleVersions?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  app?;}  relationships?;
    ResourceLinks links;
};

public type AppStoreVersionLocalizationUpdateRequest record {
    record  { string 'type; string id; record  { string description?; string keywords?; string marketingUrl?; string promotionalText?; string supportUrl?; string whatsNew?;}  attributes?;}  data;
};

public type UserInvitationCreateRequest record {
    record  { string 'type; record  { string email; string firstName; string lastName; UserRole[] roles; boolean allAppsVisible?; boolean provisioningAllowed?;}  attributes; record  { record  { record  { string 'type; string id;} [] data?;}  visibleApps?;}  relationships?;}  data;
};

public type DeviceCreateRequest record {
    record  { string 'type; record  { string name; BundleIdPlatform platform; string udid;}  attributes;}  data;
};

public type BetaAppReviewDetailResponse record {
    BetaAppReviewDetail data;
    App[] included?;
    DocumentLinks links;
};

public type AppScreenshotsResponse record {
    AppScreenshot[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type EndUserLicenseAgreementUpdateRequest record {
    record  { string 'type; string id; record  { string agreementText?;}  attributes?; record  { record  { record  { string 'type; string id;} [] data?;}  territories?;}  relationships?;}  data;
};

public type AppStoreVersionUpdateRequest record {
    record  { string 'type; string id; record  { string versionString?; string copyright?; string releaseType?; string earliestReleaseDate?; boolean usesIdfa?; boolean downloadable?;}  attributes?; record  { record  { record  { string 'type; string id;}  data?;}  build?;}  relationships?;}  data;
};

public type BundleIdCreateRequest record {
    record  { string 'type; record  { string name; BundleIdPlatform platform; string identifier; string seedId?;}  attributes;}  data;
};

public type BetaTesterAppsLinkagesResponse record {
    record  { string 'type; string id;} [] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
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

public type BetaAppLocalizationCreateRequest record {
    record  { string 'type; record  { string feedbackEmail?; string marketingUrl?; string privacyPolicyUrl?; string tvOsPrivacyPolicy?; string description?; string locale;}  attributes; record  { record  { record  { string 'type; string id;}  data;}  app;}  relationships;}  data;
};

public type GameCenterEnabledVersionCompatibleVersionsLinkagesResponse record {
    record  { string 'type; string id;} [] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppStoreVersionSubmissionCreateRequest record {
    record  { string 'type; record  { record  { record  { string 'type; string id;}  data;}  appStoreVersion;}  relationships;}  data;
};

public type ExternalBetaState string;

public type AppScreenshotCreateRequest record {
    record  { string 'type; record  { int fileSize; string fileName;}  attributes; record  { record  { record  { string 'type; string id;}  data;}  appScreenshotSet;}  relationships;}  data;
};

public type AppInfoLocalizationCreateRequest record {
    record  { string 'type; record  { string locale; string name?; string subtitle?; string privacyPolicyUrl?; string privacyPolicyText?;}  attributes; record  { record  { record  { string 'type; string id;}  data;}  appInfo;}  relationships;}  data;
};

public type UserUpdateRequest record {
    record  { string 'type; string id; record  { UserRole[] roles?; boolean allAppsVisible?; boolean provisioningAllowed?;}  attributes?; record  { record  { record  { string 'type; string id;} [] data?;}  visibleApps?;}  relationships?;}  data;
};

public type AppPreOrder record {
    string 'type;
    string id;
    record  { string preOrderAvailableDate?; string appReleaseDate?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  app?;}  relationships?;
    ResourceLinks links;
};

public type AppsResponse record {
    App[] data;
    anydata[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetaGroupBetaTestersLinkagesRequest record {
    record  { string 'type; string id;} [] data;
};

public type AppInfosResponse record {
    AppInfo[] data;
    anydata[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppScreenshotSetResponse record {
    AppScreenshotSet data;
    AppScreenshot[] included?;
    DocumentLinks links;
};

public type ErrorResponse record {
    record  { string id?; string status; string code; string title; string detail; record {}|record {} 'source?;} [] errors?;
};

public type BetaAppReviewSubmissionResponse record {
    BetaAppReviewSubmission data;
    Build[] included?;
    DocumentLinks links;
};

public type GameCenterEnabledVersionCompatibleVersionsLinkagesRequest record {
    record  { string 'type; string id;} [] data;
};

public type AppPricePointsResponse record {
    AppPricePoint[] data;
    Territory[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppScreenshotSetCreateRequest record {
    record  { string 'type; record  { ScreenshotDisplayType screenshotDisplayType;}  attributes; record  { record  { record  { string 'type; string id;}  data;}  appStoreVersionLocalization;}  relationships;}  data;
};

public type AppStoreVersionPhasedRelease record {
    string 'type;
    string id;
    record  { PhasedReleaseState phasedReleaseState?; string startDate?; int totalPauseDuration?; int currentDayNumber?;}  attributes?;
    ResourceLinks links;
};

public type BetaAppReviewSubmissionCreateRequest record {
    record  { string 'type; record  { record  { record  { string 'type; string id;}  data;}  build;}  relationships;}  data;
};

public type EndUserLicenseAgreement record {
    string 'type;
    string id;
    record  { string agreementText?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  app?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  territories?;}  relationships?;
    ResourceLinks links;
};

public type BetaTesterAppsLinkagesRequest record {
    record  { string 'type; string id;} [] data;
};

public type BundleIdCapabilityUpdateRequest record {
    record  { string 'type; string id; record  { CapabilityType capabilityType?; CapabilitySetting[] settings?;}  attributes?;}  data;
};

public type AgeRatingDeclarationResponse record {
    AgeRatingDeclaration data;
    DocumentLinks links;
};

public type AppStoreVersionLocalizationCreateRequest record {
    record  { string 'type; record  { string description?; string locale; string keywords?; string marketingUrl?; string promotionalText?; string supportUrl?; string whatsNew?;}  attributes; record  { record  { record  { string 'type; string id;}  data;}  appStoreVersion;}  relationships;}  data;
};

public type AppStoreReviewAttachmentResponse record {
    AppStoreReviewAttachment data;
    DocumentLinks links;
};

public type AppPricePointResponse record {
    AppPricePoint data;
    Territory[] included?;
    DocumentLinks links;
};

public type BetaTesterBuildsLinkagesRequest record {
    record  { string 'type; string id;} [] data;
};

public type AppMediaStateError record {
    string code?;
    string description?;
};

public type BuildAppEncryptionDeclarationLinkageResponse record {
    record  { string 'type; string id;}  data;
    DocumentLinks links;
};

public type BuildIconsResponse record {
    BuildIcon[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetaAppReviewSubmission record {
    string 'type;
    string id;
    record  { BetaReviewState betaReviewState?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  build?;}  relationships?;
    ResourceLinks links;
};

public type AppStoreReviewDetailResponse record {
    AppStoreReviewDetail data;
    AppStoreReviewAttachment[] included?;
    DocumentLinks links;
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
    record  { string platform?; string metricType?; string deviceType?;}  attributes?;
    ResourceLinks links;
};

public type BetaTesterResponse record {
    BetaTester data;
    anydata[] included?;
    DocumentLinks links;
};

public type BetaGroupBuildsLinkagesRequest record {
    record  { string 'type; string id;} [] data;
};

public type AppInfoUpdateRequest record {
    record  { string 'type; string id; record  { record  { record  { string 'type; string id;}  data?;}  primaryCategory?; record  { record  { string 'type; string id;}  data?;}  primarySubcategoryOne?; record  { record  { string 'type; string id;}  data?;}  primarySubcategoryTwo?; record  { record  { string 'type; string id;}  data?;}  secondaryCategory?; record  { record  { string 'type; string id;}  data?;}  secondarySubcategoryOne?; record  { record  { string 'type; string id;}  data?;}  secondarySubcategoryTwo?;}  relationships?;}  data;
};

public type AppStoreVersionLocalization record {
    string 'type;
    string id;
    record  { string description?; string locale?; string keywords?; string marketingUrl?; string promotionalText?; string supportUrl?; string whatsNew?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  appStoreVersion?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  appScreenshotSets?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  appPreviewSets?;}  relationships?;
    ResourceLinks links;
};

public type TerritoryResponse record {
    Territory data;
    DocumentLinks links;
};

public type Territory record {
    string 'type;
    string id;
    record  { string currency?;}  attributes?;
    ResourceLinks links;
};

public type BuildIndividualTestersLinkagesRequest record {
    record  { string 'type; string id;} [] data;
};

public type AppInfoLocalizationsResponse record {
    AppInfoLocalization[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppStoreAgeRating string;

public type AppStoreVersionPhasedReleaseCreateRequest record {
    record  { string 'type; record  { PhasedReleaseState phasedReleaseState?;}  attributes?; record  { record  { record  { string 'type; string id;}  data;}  appStoreVersion;}  relationships;}  data;
};

public type DiagnosticLogsResponse record {
    DiagnosticLog[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
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

public type BetaBuildLocalization record {
    string 'type;
    string id;
    record  { string whatsNew?; string locale?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  build?;}  relationships?;
    ResourceLinks links;
};

public type AppPreviewUpdateRequest record {
    record  { string 'type; string id; record  { string sourceFileChecksum?; string previewFrameTimeCode?; boolean uploaded?;}  attributes?;}  data;
};

public type BuildBetaNotification record {
    string 'type;
    string id;
    ResourceLinks links;
};

public type BuildBetaNotificationCreateRequest record {
    record  { string 'type; record  { record  { record  { string 'type; string id;}  data;}  build;}  relationships;}  data;
};

public type ProfileResponse record {
    Profile data;
    anydata[] included?;
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
    anydata[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type UploadOperationHeader record {
    string name?;
    string value?;
};

public type AppPreOrderCreateRequest record {
    record  { string 'type; record  { string appReleaseDate?;}  attributes?; record  { record  { record  { string 'type; string id;}  data;}  app;}  relationships;}  data;
};

public type AppStoreReviewDetail record {
    string 'type;
    string id;
    record  { string contactFirstName?; string contactLastName?; string contactPhone?; string contactEmail?; string demoAccountName?; string demoAccountPassword?; boolean demoAccountRequired?; string notes?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  appStoreVersion?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  appStoreReviewAttachments?;}  relationships?;
    ResourceLinks links;
};

public type BuildBetaDetail record {
    string 'type;
    string id;
    record  { boolean autoNotifyEnabled?; InternalBetaState internalBuildState?; ExternalBetaState externalBuildState?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  build?;}  relationships?;
    ResourceLinks links;
};

public type UserVisibleAppsLinkagesRequest record {
    record  { string 'type; string id;} [] data;
};

public type BetaLicenseAgreementResponse record {
    BetaLicenseAgreement data;
    App[] included?;
    DocumentLinks links;
};

public type AppStoreReviewAttachmentUpdateRequest record {
    record  { string 'type; string id; record  { string sourceFileChecksum?; boolean uploaded?;}  attributes?;}  data;
};

public type DeviceUpdateRequest record {
    record  { string 'type; string id; record  { string name?; string status?;}  attributes?;}  data;
};

public type BetaTester record {
    string 'type;
    string id;
    record  { string firstName?; string lastName?; string email?; BetaInviteType inviteType?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  apps?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  betaGroups?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  builds?;}  relationships?;
    ResourceLinks links;
};

public type Certificate record {
    string 'type;
    string id;
    record  { string name?; CertificateType certificateType?; string displayName?; string serialNumber?; BundleIdPlatform platform?; string expirationDate?; string certificateContent?;}  attributes?;
    ResourceLinks links;
};

public type AppPriceTier record {
    string 'type;
    string id;
    record  { record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  pricePoints?;}  relationships?;
    ResourceLinks links;
};

public type BuildBetaNotificationResponse record {
    BuildBetaNotification data;
    DocumentLinks links;
};

public type AppInfoResponse record {
    AppInfo data;
    anydata[] included?;
    DocumentLinks links;
};

public type BetaGroupsResponse record {
    BetaGroup[] data;
    anydata[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetaGroupCreateRequest record {
    record  { string 'type; record  { string name; boolean publicLinkEnabled?; boolean publicLinkLimitEnabled?; int publicLinkLimit?; boolean feedbackEnabled?;}  attributes; record  { record  { record  { string 'type; string id;}  data;}  app; record  { record  { string 'type; string id;} [] data?;}  builds?; record  { record  { string 'type; string id;} [] data?;}  betaTesters?;}  relationships;}  data;
};

public type BuildUpdateRequest record {
    record  { string 'type; string id; record  { boolean expired?; boolean usesNonExemptEncryption?;}  attributes?; record  { record  { record  { string 'type; string id;}  data?;}  appEncryptionDeclaration?;}  relationships?;}  data;
};

public type AppStoreVersionSubmissionResponse record {
    AppStoreVersionSubmission data;
    DocumentLinks links;
};

public type AppResponse record {
    App data;
    anydata[] included?;
    DocumentLinks links;
};

public type ResourceLinks record {
    string self;
};

public type BetaBuildLocalizationResponse record {
    BetaBuildLocalization data;
    Build[] included?;
    DocumentLinks links;
};

public type DevicesResponse record {
    Device[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppInfoLocalizationUpdateRequest record {
    record  { string 'type; string id; record  { string name?; string subtitle?; string privacyPolicyUrl?; string privacyPolicyText?;}  attributes?;}  data;
};

public type AppScreenshotSetAppScreenshotsLinkagesResponse record {
    record  { string 'type; string id;} [] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BrazilAgeRating string;

public type CertificateResponse record {
    Certificate data;
    DocumentLinks links;
};

public type BuildBetaDetailUpdateRequest record {
    record  { string 'type; string id; record  { boolean autoNotifyEnabled?;}  attributes?;}  data;
};

public type BetaLicenseAgreementUpdateRequest record {
    record  { string 'type; string id; record  { string agreementText?;}  attributes?;}  data;
};

public type UserResponse record {
    User data;
    App[] included?;
    DocumentLinks links;
};

public type AgeRatingDeclaration record {
    string 'type;
    string id;
    record  { string alcoholTobaccoOrDrugUseOrReferences?; string contests?; boolean gamblingAndContests?; boolean gambling?; string gamblingSimulated?; KidsAgeBand kidsAgeBand?; string medicalOrTreatmentInformation?; string profanityOrCrudeHumor?; string sexualContentGraphicAndNudity?; string sexualContentOrNudity?; boolean seventeenPlus?; string horrorOrFearThemes?; string matureOrSuggestiveThemes?; boolean unrestrictedWebAccess?; string violenceCartoonOrFantasy?; string violenceRealisticProlongedGraphicOrSadistic?; string violenceRealistic?;}  attributes?;
    ResourceLinks links;
};

public type ProfileCreateRequest record {
    record  { string 'type; record  { string name; string profileType;}  attributes; record  { record  { record  { string 'type; string id;}  data;}  bundleId; record  { record  { string 'type; string id;} [] data?;}  devices?; record  { record  { string 'type; string id;} [] data;}  certificates;}  relationships;}  data;
};

public type TerritoriesResponse record {
    Territory[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type UserRole string;

public type AppStoreVersion record {
    string 'type;
    string id;
    record  { Platform platform?; string versionString?; AppStoreVersionState appStoreState?; string copyright?; string releaseType?; string earliestReleaseDate?; boolean usesIdfa?; boolean downloadable?; string createdDate?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  app?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  ageRatingDeclaration?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  appStoreVersionLocalizations?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  build?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  appStoreVersionPhasedRelease?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  routingAppCoverage?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  appStoreReviewDetail?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  appStoreVersionSubmission?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  idfaDeclaration?;}  relationships?;
    ResourceLinks links;
};

public type BetaGroupBetaTestersLinkagesResponse record {
    record  { string 'type; string id;} [] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BuildAppEncryptionDeclarationLinkageRequest record {
    record  { string 'type; string id;}  data;
};

public type EndUserLicenseAgreementResponse record {
    EndUserLicenseAgreement data;
    Territory[] included?;
    DocumentLinks links;
};

public type AppScreenshotSetsResponse record {
    AppScreenshotSet[] data;
    AppScreenshot[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type Platform string;

public type BetaTesterInvitationCreateRequest record {
    record  { string 'type; record  { record  { record  { string 'type; string id;}  data;}  betaTester; record  { record  { string 'type; string id;}  data;}  app;}  relationships;}  data;
};

public type AppPreviewCreateRequest record {
    record  { string 'type; record  { int fileSize; string fileName; string previewFrameTimeCode?; string mimeType?;}  attributes; record  { record  { record  { string 'type; string id;}  data;}  appPreviewSet;}  relationships;}  data;
};

public type AppScreenshotResponse record {
    AppScreenshot data;
    DocumentLinks links;
};

public type BuildIndividualTestersLinkagesResponse record {
    record  { string 'type; string id;} [] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppStoreReviewAttachmentsResponse record {
    AppStoreReviewAttachment[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type CertificateCreateRequest record {
    record  { string 'type; record  { string csrContent; CertificateType certificateType;}  attributes;}  data;
};

public type AppCategory record {
    string 'type;
    string id;
    record  { Platform[] platforms?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  subcategories?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  parent?;}  relationships?;
    ResourceLinks links;
};

public type AppStoreReviewDetailCreateRequest record {
    record  { string 'type; record  { string contactFirstName?; string contactLastName?; string contactPhone?; string contactEmail?; string demoAccountName?; string demoAccountPassword?; boolean demoAccountRequired?; string notes?;}  attributes?; record  { record  { record  { string 'type; string id;}  data;}  appStoreVersion;}  relationships;}  data;
};

public type BetaTesterBuildsLinkagesResponse record {
    record  { string 'type; string id;} [] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BuildsResponse record {
    Build[] data;
    anydata[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppPricesResponse record {
    AppPrice[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppStoreVersionCreateRequest record {
    record  { string 'type; record  { Platform platform; string versionString; string copyright?; string releaseType?; string earliestReleaseDate?; boolean usesIdfa?;}  attributes; record  { record  { record  { string 'type; string id;}  data;}  app; record  { record  { string 'type; string id;}  data?;}  build?;}  relationships;}  data;
};

public type InAppPurchaseResponse record {
    InAppPurchase data;
    DocumentLinks links;
};

public type DiagnosticSignature record {
    string 'type;
    string id;
    record  { string diagnosticType?; string signature?; decimal weight?;}  attributes?;
    ResourceLinks links;
};

public type AppStoreVersionState string;

public type EndUserLicenseAgreementCreateRequest record {
    record  { string 'type; record  { string agreementText;}  attributes; record  { record  { record  { string 'type; string id;}  data;}  app; record  { record  { string 'type; string id;} [] data;}  territories;}  relationships;}  data;
};

public type AppPreviewSetsResponse record {
    AppPreviewSet[] data;
    AppPreview[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
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

public type AppInfoLocalizationResponse record {
    AppInfoLocalization data;
    DocumentLinks links;
};

public type AppStoreReviewAttachmentCreateRequest record {
    record  { string 'type; record  { int fileSize; string fileName;}  attributes; record  { record  { record  { string 'type; string id;}  data;}  appStoreReviewDetail;}  relationships;}  data;
};

public type GameCenterEnabledVersionsResponse record {
    GameCenterEnabledVersion[] data;
    GameCenterEnabledVersion[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppBetaTestersLinkagesRequest record {
    record  { string 'type; string id;} [] data;
};

public type AppStoreVersionLocalizationResponse record {
    AppStoreVersionLocalization data;
    anydata[] included?;
    DocumentLinks links;
};

public type RoutingAppCoverageCreateRequest record {
    record  { string 'type; record  { int fileSize; string fileName;}  attributes; record  { record  { record  { string 'type; string id;}  data;}  appStoreVersion;}  relationships;}  data;
};

public type AppPreOrderUpdateRequest record {
    record  { string 'type; string id; record  { string appReleaseDate?;}  attributes?;}  data;
};

public type AppStoreVersionPhasedReleaseUpdateRequest record {
    record  { string 'type; string id; record  { PhasedReleaseState phasedReleaseState?;}  attributes?;}  data;
};

public type AppPreviewSet record {
    string 'type;
    string id;
    record  { PreviewType previewType?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  appStoreVersionLocalization?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  appPreviews?;}  relationships?;
    ResourceLinks links;
};

public type AppPriceTierResponse record {
    AppPriceTier data;
    AppPricePoint[] included?;
    DocumentLinks links;
};

public type BetaGroup record {
    string 'type;
    string id;
    record  { string name?; string createdDate?; boolean isInternalGroup?; boolean publicLinkEnabled?; string publicLinkId?; boolean publicLinkLimitEnabled?; int publicLinkLimit?; string publicLink?; boolean feedbackEnabled?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  app?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  builds?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  betaTesters?;}  relationships?;
    ResourceLinks links;
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

public type BundleIdPlatform string;

public type UserVisibleAppsLinkagesResponse record {
    record  { string 'type; string id;} [] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppStoreVersionBuildLinkageResponse record {
    record  { string 'type; string id;}  data;
    DocumentLinks links;
};

public type DiagnosticSignaturesResponse record {
    DiagnosticSignature[] data;
    DiagnosticLog[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppScreenshot record {
    string 'type;
    string id;
    record  { int fileSize?; string fileName?; string sourceFileChecksum?; ImageAsset imageAsset?; string assetToken?; string assetType?; UploadOperation[] uploadOperations?; AppMediaAssetState assetDeliveryState?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  appScreenshotSet?;}  relationships?;
    ResourceLinks links;
};

public type Profile record {
    string 'type;
    string id;
    record  { string name?; BundleIdPlatform platform?; string profileType?; string profileState?; string profileContent?; string uuid?; string createdDate?; string expirationDate?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  bundleId?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  devices?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  certificates?;}  relationships?;
    ResourceLinks links;
};

public type PerfPowerMetricsResponse record {
    PerfPowerMetric[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BuildBetaGroupsLinkagesRequest record {
    record  { string 'type; string id;} [] data;
};

public type AppInfoLocalization record {
    string 'type;
    string id;
    record  { string locale?; string name?; string subtitle?; string privacyPolicyUrl?; string privacyPolicyText?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  appInfo?;}  relationships?;
    ResourceLinks links;
};

public type AppPreviewSetAppPreviewsLinkagesResponse record {
    record  { string 'type; string id;} [] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppEncryptionDeclarationResponse record {
    AppEncryptionDeclaration data;
    App[] included?;
    DocumentLinks links;
};

public type BetaGroupUpdateRequest record {
    record  { string 'type; string id; record  { string name?; boolean publicLinkEnabled?; boolean publicLinkLimitEnabled?; int publicLinkLimit?; boolean feedbackEnabled?;}  attributes?;}  data;
};

public type InternalBetaState string;

public type BetaAppLocalizationResponse record {
    BetaAppLocalization data;
    App[] included?;
    DocumentLinks links;
};

public type BetaTesterBetaGroupsLinkagesRequest record {
    record  { string 'type; string id;} [] data;
};

public type BundleIdCapabilityCreateRequest record {
    record  { string 'type; record  { CapabilityType capabilityType; CapabilitySetting[] settings?;}  attributes; record  { record  { record  { string 'type; string id;}  data;}  bundleId;}  relationships;}  data;
};

public type IdfaDeclaration record {
    string 'type;
    string id;
    record  { boolean servesAds?; boolean attributesAppInstallationToPreviousAd?; boolean attributesActionWithPreviousAd?; boolean honorsLimitedAdTracking?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  appStoreVersion?;}  relationships?;
    ResourceLinks links;
};

public type IdfaDeclarationUpdateRequest record {
    record  { string 'type; string id; record  { boolean servesAds?; boolean attributesAppInstallationToPreviousAd?; boolean attributesActionWithPreviousAd?; boolean honorsLimitedAdTracking?;}  attributes?;}  data;
};

public type ImageAsset record {
    string templateUrl?;
    int width?;
    int height?;
};

public type PreReleaseVersionsResponse record {
    PrereleaseVersion[] data;
    anydata[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetaAppReviewDetailsResponse record {
    BetaAppReviewDetail[] data;
    App[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type UserInvitationsResponse record {
    UserInvitation[] data;
    App[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetaAppReviewDetailUpdateRequest record {
    record  { string 'type; string id; record  { string contactFirstName?; string contactLastName?; string contactPhone?; string contactEmail?; string demoAccountName?; string demoAccountPassword?; boolean demoAccountRequired?; string notes?;}  attributes?;}  data;
};

public type BetaReviewState string;

public type AppEncryptionDeclarationState string;

public type AppPrice record {
    string 'type;
    string id;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  app?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  priceTier?;}  relationships?;
    ResourceLinks links;
};

public type ScreenshotDisplayType string;

public type KidsAgeBand string;

public type BetaTesterCreateRequest record {
    record  { string 'type; record  { string firstName?; string lastName?; string email;}  attributes; record  { record  { record  { string 'type; string id;} [] data?;}  betaGroups?; record  { record  { string 'type; string id;} [] data?;}  builds?;}  relationships?;}  data;
};

public type PreviewType string;

public type BundleIdResponse record {
    BundleId data;
    anydata[] included?;
    DocumentLinks links;
};

public type AppPricePoint record {
    string 'type;
    string id;
    record  { string customerPrice?; string proceeds?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  priceTier?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  territory?;}  relationships?;
    ResourceLinks links;
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

public type DeviceResponse record {
    Device data;
    DocumentLinks links;
};

public type Build record {
    string 'type;
    string id;
    record  { string 'version?; string uploadedDate?; string expirationDate?; boolean expired?; string minOsVersion?; ImageAsset iconAssetToken?; string processingState?; boolean usesNonExemptEncryption?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  preReleaseVersion?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  individualTesters?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  betaBuildLocalizations?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  appEncryptionDeclaration?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  betaAppReviewSubmission?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  app?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  buildBetaDetail?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  appStoreVersion?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  icons?;}  relationships?;
    ResourceLinks links;
};

public type UserInvitation record {
    string 'type;
    string id;
    record  { string email?; string firstName?; string lastName?; string expirationDate?; UserRole[] roles?; boolean allAppsVisible?; boolean provisioningAllowed?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  visibleApps?;}  relationships?;
    ResourceLinks links;
};

public type AppScreenshotSet record {
    string 'type;
    string id;
    record  { ScreenshotDisplayType screenshotDisplayType?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  appStoreVersionLocalization?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  appScreenshots?;}  relationships?;
    ResourceLinks links;
};

public type CertificatesResponse record {
    Certificate[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppStoreReviewDetailUpdateRequest record {
    record  { string 'type; string id; record  { string contactFirstName?; string contactLastName?; string contactPhone?; string contactEmail?; string demoAccountName?; string demoAccountPassword?; boolean demoAccountRequired?; string notes?;}  attributes?;}  data;
};

public type IdfaDeclarationResponse record {
    IdfaDeclaration data;
    DocumentLinks links;
};

public type RoutingAppCoverage record {
    string 'type;
    string id;
    record  { int fileSize?; string fileName?; string sourceFileChecksum?; UploadOperation[] uploadOperations?; AppMediaAssetState assetDeliveryState?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  appStoreVersion?;}  relationships?;
    ResourceLinks links;
};

public type BetaTesterInvitationResponse record {
    BetaTesterInvitation data;
    DocumentLinks links;
};

public type BuildResponse record {
    Build data;
    anydata[] included?;
    DocumentLinks links;
};

public type AppStoreVersionResponse record {
    AppStoreVersion data;
    anydata[] included?;
    DocumentLinks links;
};

public type Device record {
    string 'type;
    string id;
    record  { string name?; BundleIdPlatform platform?; string udid?; string deviceClass?; string status?; string model?; string addedDate?;}  attributes?;
    ResourceLinks links;
};

public type PrereleaseVersionResponse record {
    PrereleaseVersion data;
    anydata[] included?;
    DocumentLinks links;
};

public type AppCategoryResponse record {
    AppCategory data;
    anydata[] included?;
    DocumentLinks links;
};

public type BundleIdCapability record {
    string 'type;
    string id;
    record  { CapabilityType capabilityType?; CapabilitySetting[] settings?;}  attributes?;
    ResourceLinks links;
};

public type InAppPurchasesResponse record {
    InAppPurchase[] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppInfo record {
    string 'type;
    string id;
    record  { AppStoreVersionState appStoreState?; AppStoreAgeRating appStoreAgeRating?; BrazilAgeRating brazilAgeRating?; KidsAgeBand kidsAgeBand?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  app?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  ageRatingDeclaration?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  appInfoLocalizations?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  primaryCategory?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  primarySubcategoryOne?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  primarySubcategoryTwo?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  secondaryCategory?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  secondarySubcategoryOne?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  secondarySubcategoryTwo?;}  relationships?;
    ResourceLinks links;
};

public type UserInvitationResponse record {
    UserInvitation data;
    App[] included?;
    DocumentLinks links;
};

public type AppPreviewSetResponse record {
    AppPreviewSet data;
    AppPreview[] included?;
    DocumentLinks links;
};

public type BetaBuildLocalizationCreateRequest record {
    record  { string 'type; record  { string whatsNew?; string locale;}  attributes; record  { record  { record  { string 'type; string id;}  data;}  build;}  relationships;}  data;
};

public type BetaBuildLocalizationUpdateRequest record {
    record  { string 'type; string id; record  { string whatsNew?;}  attributes?;}  data;
};

public type RoutingAppCoverageUpdateRequest record {
    record  { string 'type; string id; record  { string sourceFileChecksum?; boolean uploaded?;}  attributes?;}  data;
};

public type AgeRatingDeclarationUpdateRequest record {
    record  { string 'type; string id; record  { string alcoholTobaccoOrDrugUseOrReferences?; string contests?; boolean gamblingAndContests?; boolean gambling?; string gamblingSimulated?; KidsAgeBand kidsAgeBand?; string medicalOrTreatmentInformation?; string profanityOrCrudeHumor?; string sexualContentGraphicAndNudity?; string sexualContentOrNudity?; boolean seventeenPlus?; string horrorOrFearThemes?; string matureOrSuggestiveThemes?; boolean unrestrictedWebAccess?; string violenceCartoonOrFantasy?; string violenceRealisticProlongedGraphicOrSadistic?; string violenceRealistic?;}  attributes?;}  data;
};

public type DiagnosticLog record {
    string 'type;
    string id;
    ResourceLinks links;
};

public type PagingInformation record {
    record  { int total; int 'limit;}  paging;
};

public type User record {
    string 'type;
    string id;
    record  { string username?; string firstName?; string lastName?; UserRole[] roles?; boolean allAppsVisible?; boolean provisioningAllowed?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  visibleApps?;}  relationships?;
    ResourceLinks links;
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
    record  { string 'version?; Platform platform?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  builds?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  app?;}  relationships?;
    ResourceLinks links;
};

public type BetaBuildLocalizationsResponse record {
    BetaBuildLocalization[] data;
    Build[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppStoreReviewAttachment record {
    string 'type;
    string id;
    record  { int fileSize?; string fileName?; string sourceFileChecksum?; UploadOperation[] uploadOperations?; AppMediaAssetState assetDeliveryState?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  appStoreReviewDetail?;}  relationships?;
    ResourceLinks links;
};

public type PhasedReleaseState string;

public type AppPriceResponse record {
    AppPrice data;
    DocumentLinks links;
};

public type AppPreviewSetCreateRequest record {
    record  { string 'type; record  { PreviewType previewType;}  attributes; record  { record  { record  { string 'type; string id;}  data;}  appStoreVersionLocalization;}  relationships;}  data;
};

public type BetaGroupResponse record {
    BetaGroup data;
    anydata[] included?;
    DocumentLinks links;
};

public type BetaGroupBuildsLinkagesResponse record {
    record  { string 'type; string id;} [] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetaAppLocalizationUpdateRequest record {
    record  { string 'type; string id; record  { string feedbackEmail?; string marketingUrl?; string privacyPolicyUrl?; string tvOsPrivacyPolicy?; string description?;}  attributes?;}  data;
};

public type AppPreviewResponse record {
    AppPreview data;
    DocumentLinks links;
};

public type AppUpdateRequest record {
    record  { string 'type; string id; record  { string bundleId?; string primaryLocale?; boolean availableInNewTerritories?; string contentRightsDeclaration?;}  attributes?; record  { record  { record  { string 'type; string id;} [] data?;}  prices?; record  { record  { string 'type; string id;} [] data?;}  availableTerritories?;}  relationships?;}  data;
};

public type BetaAppReviewDetail record {
    string 'type;
    string id;
    record  { string contactFirstName?; string contactLastName?; string contactPhone?; string contactEmail?; string demoAccountName?; string demoAccountPassword?; boolean demoAccountRequired?; string notes?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  app?;}  relationships?;
    ResourceLinks links;
};

public type AppStoreVersionBuildLinkageRequest record {
    record  { string 'type; string id;}  data;
};

public type AppPreview record {
    string 'type;
    string id;
    record  { int fileSize?; string fileName?; string sourceFileChecksum?; string previewFrameTimeCode?; string mimeType?; string videoUrl?; ImageAsset previewImage?; UploadOperation[] uploadOperations?; AppMediaAssetState assetDeliveryState?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  appPreviewSet?;}  relationships?;
    ResourceLinks links;
};

public type AppScreenshotUpdateRequest record {
    record  { string 'type; string id; record  { string sourceFileChecksum?; boolean uploaded?;}  attributes?;}  data;
};

public type CapabilityType string;

public type BundleIdsResponse record {
    BundleId[] data;
    anydata[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BetaTesterBetaGroupsLinkagesResponse record {
    record  { string 'type; string id;} [] data;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type BundleIdUpdateRequest record {
    record  { string 'type; string id; record  { string name?;}  attributes?;}  data;
};

public type BundleId record {
    string 'type;
    string id;
    record  { string name?; BundleIdPlatform platform?; string identifier?; string seedId?;}  attributes?;
    record  { record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  profiles?; record  { record  { string self?; string related?;}  links?; PagingInformation meta?; record  { string 'type; string id;} [] data?;}  bundleIdCapabilities?; record  { record  { string self?; string related?;}  links?; record  { string 'type; string id;}  data?;}  app?;}  relationships?;
    ResourceLinks links;
};

public type RoutingAppCoverageResponse record {
    RoutingAppCoverage data;
    DocumentLinks links;
};

public type AppScreenshotSetAppScreenshotsLinkagesRequest record {
    record  { string 'type; string id;} [] data;
};

public type AppPriceTiersResponse record {
    AppPriceTier[] data;
    AppPricePoint[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};

public type AppPreOrderResponse record {
    AppPreOrder data;
    DocumentLinks links;
};

public type AppCategoriesResponse record {
    AppCategory[] data;
    anydata[] included?;
    PagedDocumentLinks links;
    PagingInformation meta?;
};
