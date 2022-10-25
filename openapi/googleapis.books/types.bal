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
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://accounts.google.com/o/oauth2/token";
|};

public type Bookshelves record {
    # A list of bookshelves.
    Bookshelf[] items?;
    # Resource type.
    string kind?;
};

public type OffersItems1 record {
    string artUrl?;
    string gservicesKey?;
    string id?;
    OffersItems[] items?;
};

# Offer retail (=discounted) price in Micros
public type VolumeSaleinfoRetailprice record {
    # Amount in micros
    decimal amountInMicros?;
    # An ISO 4217, three-letter currency code.
    string currencyCode?;
};

# The viewport for showing this location. This is a latitude, longitude rectangle.
public type GeolayerdataGeoViewport record {
    # Highest viewport for showing this location.
    GeolayerdataGeoViewportHi hi?;
    # Lowest viewport for showing this location.
    GeolayerdataGeoViewportLo lo?;
};

public type DownloadAccesses record {
    # A list of download access responses.
    DownloadAccessRestriction[] downloadAccessList?;
    # Resource type.
    string kind?;
};

# Books annotation range sent by client in different standards.
public type BooksAnnotationsRange record {
    # The offset from the ending position.
    string endOffset?;
    # The ending position for the range.
    string endPosition?;
    # The offset from the starting position.
    string startOffset?;
    # The starting position for the range.
    string startPosition?;
};

# A top-level summary of the panelization info in this volume.
public type VolumeVolumeinfoPanelizationsummary record {
    # Contains epub bubbles
    boolean containsEpubBubbles?;
    # Contains image bubbles
    boolean containsImageBubbles?;
    # Epub bubble version
    string epubBubbleVersion?;
    # Image bubble version
    string imageBubbleVersion?;
};

# Information on the ability to share with the family.
public type VolumeUserinfoFamilysharing record {
    # The role of the user in the family.
    string familyRole?;
    # Whether or not this volume can be shared with the family by the user. This includes sharing eligibility of both the volume and the user. If the value is true, the user can initiate a family sharing action.
    boolean isSharingAllowed?;
    # Whether or not sharing this volume is temporarily disabled due to issues with the Family Wallet.
    boolean isSharingDisabledByFop?;
};

# Selection ranges sent from the client.
public type AnnotationClientversionranges record {
    # Books annotation range sent by client in different standards.
    BooksAnnotationsRange cfiRange?;
    # Content version the client sent in.
    string contentVersion?;
    # Books annotation range sent by client in different standards.
    BooksAnnotationsRange gbImageRange?;
    # Books annotation range sent by client in different standards.
    BooksAnnotationsRange gbTextRange?;
    # Books annotation range sent by client in different standards.
    BooksAnnotationsRange imageCfiRange?;
};

public type Annotations record {
    # A list of annotations.
    Annotation[] items?;
    # Resource type.
    string kind?;
    # Token to pass in for pagination for the next page. This will not be present if this request does not have more results.
    string nextPageToken?;
    # Total number of annotations found. This may be greater than the number of notes returned in this response if results have been paginated.
    int totalItems?;
};

public type VolumeseriesinfoIssue record {
    string issueDisplayNumber?;
    int issueOrderNumber?;
};

public type DictlayerdataDictDerivatives record {
    DictlayerdataDictSource1 'source?;
    string text?;
};

# Selection ranges for the most recent content version.
public type AnnotationCurrentversionranges record {
    # Books annotation range sent by client in different standards.
    BooksAnnotationsRange cfiRange?;
    # Content version applicable to ranges below.
    string contentVersion?;
    # Books annotation range sent by client in different standards.
    BooksAnnotationsRange gbImageRange?;
    # Books annotation range sent by client in different standards.
    BooksAnnotationsRange gbTextRange?;
    # Books annotation range sent by client in different standards.
    BooksAnnotationsRange imageCfiRange?;
};

public type DictlayerdataDictWords record {
    DictlayerdataDictDerivatives[] derivatives?;
    DictlayerdataDictExamples[] examples?;
    DictlayerdataDictSenses[] senses?;
    # The words with different meanings but not related words, e.g. "go" (game) and "go" (verb).
    DictlayerdataDictSource5 'source?;
};

# The source, url and attribution for this dictionary data.
public type DictlayerdataDictSource record {
    # The source attribution for this dictionary data.
    string attribution?;
    # The source URL for this dictionary data.
    string url?;
};

public type DictlayerdataDictSenses record {
    DictlayerdataDictConjugations[] conjugations?;
    DictlayerdataDictDefinitions[] definitions?;
    string partOfSpeech?;
    string pronunciation?;
    string pronunciationUrl?;
    DictlayerdataDictSource4 'source?;
    string syllabification?;
    DictlayerdataDictExamples1[] synonyms?;
};

# User settings in sub-objects, each for different purposes.
public type UsersettingsNotesexport record {
    # Folder name
    string folderName?;
    # Enabled or not
    boolean isEnabled?;
};

# The content ranges to identify the selected text.
public type VolumeannotationContentranges record {
    # Books annotation range sent by client in different standards.
    BooksAnnotationsRange cfiRange?;
    # Content version applicable to ranges below.
    string contentVersion?;
    # Books annotation range sent by client in different standards.
    BooksAnnotationsRange gbImageRange?;
    # Books annotation range sent by client in different standards.
    BooksAnnotationsRange gbTextRange?;
};

public type Offers record {
    # A list of offers.
    OffersItems1[] items?;
    # Resource type.
    string kind?;
};

public type AnnotationsSummary record {
    string kind?;
    AnnotationssummaryLayers[] layers?;
};

public type Layersummaries record {
    # A list of layer summary items.
    Layersummary[] items?;
    # Resource type.
    string kind?;
    # The total number of layer summaries found.
    int totalItems?;
};

public type Volumeannotation record {
    # The annotation data id for this volume annotation.
    string annotationDataId?;
    # Link to get data for this annotation.
    string annotationDataLink?;
    # The type of annotation this is.
    string annotationType?;
    # The content ranges to identify the selected text.
    VolumeannotationContentranges contentRanges?;
    # Data for this annotation.
    string data?;
    # Indicates that this annotation is deleted.
    boolean deleted?;
    # Unique id of this volume annotation.
    string id?;
    # Resource Type
    string kind?;
    # The Layer this annotation is for.
    string layerId?;
    # Pages the annotation spans.
    string[] pageIds?;
    # Excerpt from the volume.
    string selectedText?;
    # URL to this resource.
    string selfLink?;
    # Timestamp for the last time this anntoation was updated. (RFC 3339 UTC date-time format).
    string updated?;
    # The Volume this annotation is for.
    string volumeId?;
};

# The download access restriction.
public type DownloadAccessRestriction record {
    # If restricted, whether access is granted for this (user, device, volume).
    boolean deviceAllowed?;
    # If restricted, the number of content download licenses already acquired (including the requesting client, if licensed).
    int downloadsAcquired?;
    # If deviceAllowed, whether access was just acquired with this request.
    boolean justAcquired?;
    # Resource type.
    string kind?;
    # If restricted, the maximum number of content download licenses for this volume.
    int maxDownloadDevices?;
    # Error/warning message.
    string message?;
    # Client nonce for verification. Download access and client-validation only.
    string nonce?;
    # Error/warning reason code. Additional codes may be added in the future. 0 OK 100 ACCESS_DENIED_PUBLISHER_LIMIT 101 ACCESS_DENIED_LIMIT 200 WARNING_USED_LAST_ACCESS
    string reasonCode?;
    # Whether this volume has any download access restrictions.
    boolean restricted?;
    # Response signature.
    string signature?;
    # Client app identifier for verification. Download access and client-validation only.
    string 'source?;
    # Identifies the volume for which this entry applies.
    string volumeId?;
};

public type DictlayerdataDictSource1 record {
    # The derivatives attribution for this dictionary data.
    string attribution?;
    # The derivatives URL for this dictionary data.
    string url?;
};

# Offer list (=undiscounted) price in Micros.
public type VolumeSaleinfoListprice1 record {
    # Amount in micros
    decimal amountInMicros?;
    # An ISO 4217, three-letter currency code.
    string currencyCode?;
};

# Copy/Paste accounting information.
public type VolumeUserinfoCopy record {
    # Allowed character count.
    int allowedCharacterCount?;
    # Type of limitation on this layer.
    string limitType?;
    # Remaining character count.
    int remainingCharacterCount?;
    # Updated user info.
    string updated?;
};

# The words with different meanings but not related words, e.g. "go" (game) and "go" (verb).
public type DictlayerdataDictSource5 record {
    # The source attribution for this dictionary data.
    string attribution?;
    # The source URL for this dictionary data.
    string url?;
};

public type Volume record {
    # Any information about a volume related to reading or obtaining that volume text. This information can depend on country (books may be public domain in one country but not in another, e.g.).
    VolumeAccessinfo accessInfo?;
    # Opaque identifier for a specific version of a volume resource. (In LITE projection)
    string etag?;
    # Unique identifier for a volume. (In LITE projection.)
    string id?;
    # Resource type for a volume. (In LITE projection.)
    string kind?;
    # What layers exist in this volume and high level information about them.
    VolumeLayerinfo layerInfo?;
    # Recommendation related information for this volume.
    VolumeRecommendedinfo recommendedInfo?;
    # Any information about a volume related to the eBookstore and/or purchaseability. This information can depend on the country where the request originates from (i.e. books may not be for sale in certain countries).
    VolumeSaleinfo saleInfo?;
    # Search result information related to this volume.
    VolumeSearchinfo searchInfo?;
    # URL to this resource. (In LITE projection.)
    string selfLink?;
    # User specific information related to this volume. (e.g. page this user last read or whether they purchased this book)
    VolumeUserinfo userInfo?;
    # General volume information.
    VolumeVolumeinfo volumeInfo?;
};

public type DictlayerdataDictSource4 record {
    # The senses source attribution for this dictionary data.
    string attribution?;
    # The senses source URL for this dictionary data.
    string url?;
};

public type DictlayerdataDictSource3 record {
    string attribution?;
    string url?;
};

public type DictlayerdataDictExamples1 record {
    DictlayerdataDictSource3 'source?;
    string text?;
};

public type DictlayerdataDictSource2 record {
    # The examples attribution for this dictionary data.
    string attribution?;
    # The examples URL for this dictionary data.
    string url?;
};

# Recommendation related information for this volume.
public type VolumeRecommendedinfo record {
    # A text explaining why this volume is recommended.
    string explanation?;
};

public type FamilyInfo record {
    # Resource type.
    string kind?;
    # Family membership info of the user that made the request.
    FamilyinfoMembership membership?;
};

public type UsersettingsNotification record {
    UsersettingsNotificationMatchmyinterests matchMyInterests?;
    UsersettingsNotificationMatchmyinterests moreFromAuthors?;
    UsersettingsNotificationMatchmyinterests moreFromSeries?;
    UsersettingsNotificationMatchmyinterests priceDrop?;
    UsersettingsNotificationMatchmyinterests rewardExpirations?;
};

public type UsersettingsNotificationMatchmyinterests record {
    string opted_state?;
};

# Suggested retail price. (In LITE projection.)
public type VolumeSaleinfoListprice record {
    # Amount in the currency listed below. (In LITE projection.)
    decimal amount?;
    # An ISO 4217, three-letter currency code. (In LITE projection.)
    string currencyCode?;
};

public type GeolayerdataGeo record {
    # The boundary of the location as a set of loops containing pairs of latitude, longitude coordinates.
    string[] boundary?;
    # The cache policy active for this data. EX: UNRESTRICTED, RESTRICTED, NEVER
    string cachePolicy?;
    # The country code of the location.
    string countryCode?;
    # The latitude of the location.
    decimal latitude?;
    # The longitude of the location.
    decimal longitude?;
    # The type of map that should be used for this location. EX: HYBRID, ROADMAP, SATELLITE, TERRAIN
    string mapType?;
    # The viewport for showing this location. This is a latitude, longitude rectangle.
    GeolayerdataGeoViewport viewport?;
    # The Zoom level to use for the map. Zoom levels between 0 (the lowest zoom level, in which the entire world can be seen on one map) to 21+ (down to individual buildings). See: https: //developers.google.com/maps/documentation/staticmaps/#Zoomlevels
    int zoom?;
};

public type Geolayerdata record {
    GeolayerdataCommon common?;
    GeolayerdataGeo geo?;
    string kind?;
};

public type GeolayerdataCommon record {
    # The language of the information url and description.
    string lang?;
    # The URL for the preview image information.
    string previewImageUrl?;
    # The description for this location.
    string snippet?;
    # The URL for information for this location. Ex: wikipedia link.
    string snippetUrl?;
    # The display title and localized canonical name to use when searching for this entity on Google search.
    string title?;
};

public type Metadata record {
    # A list of offline dictionary metadata.
    MetadataItems[] items?;
    # Resource type.
    string kind?;
};

public type AnnotationssummaryLayers record {
    # Allowed character count.
    int allowedCharacterCount?;
    # Layer id.
    string layerId?;
    # Type of limitation on this layer.
    string limitType?;
    # Remaining character count.
    int remainingCharacterCount?;
    # Updated annotation.
    string updated?;
};

public type Notification record {
    string body?;
    # The list of crm experiment ids.
    string[] crmExperimentIds?;
    string doc_id?;
    string doc_type?;
    boolean dont_show_notification?;
    string iconUrl?;
    boolean is_document_mature?;
    # Resource type.
    string kind?;
    string notificationGroup?;
    string notification_type?;
    string pcampaign_id?;
    string reason?;
    boolean show_notification_settings_action?;
    string targetUrl?;
    string timeToExpireMs?;
    string title?;
};

public type VolumeLayerinfoLayers record {
    # The layer id of this layer (e.g. "geo").
    string layerId?;
    # The current version of this layer's volume annotations. Note that this version applies only to the data in the books.layers.volumeAnnotations.* responses. The actual annotation data is versioned separately.
    string volumeAnnotationsVersion?;
};

public type Dictlayerdata record {
    DictlayerdataCommon common?;
    DictlayerdataDict dict?;
    string kind?;
};

# Family membership info of the user that made the request.
public type FamilyinfoMembership record {
    # Restrictions on user buying and acquiring content.
    string acquirePermission?;
    # The age group of the user.
    string ageGroup?;
    # The maximum allowed maturity rating for the user.
    string allowedMaturityRating?;
    # Status of included in family
    boolean isInFamily?;
    # The role of the user in the family.
    string role?;
};

# Author of this review.
public type ReviewAuthor record {
    # Name of this person.
    string displayName?;
};

public type DiscoveryclustersClusters record {
    DiscoveryclustersBannerWithContentContainer banner_with_content_container?;
    string subTitle?;
    string title?;
    int totalVolumes?;
    string uid?;
    Volume[] volumes?;
};

# The volume series information.
public type Volumeseriesinfo record {
    # The display number string. This should be used only for display purposes and the actual sequence should be inferred from the below orderNumber.
    string bookDisplayNumber?;
    # Resource type.
    string kind?;
    # Short book title in the context of the series.
    string shortSeriesBookTitle?;
    # Volume series
    VolumeseriesinfoVolumeseries[] volumeSeries?;
};

# User specific information related to this volume. (e.g. page this user last read or whether they purchased this book)
public type VolumeUserinfo record {
    # Timestamp when this volume was acquired by the user. (RFC 3339 UTC date-time format) Acquiring includes purchase, user upload, receiving family sharing, etc.
    string acquiredTime?;
    # How this volume was acquired.
    int acquisitionType?;
    # Copy/Paste accounting information.
    VolumeUserinfoCopy copy?;
    # Whether this volume is purchased, sample, pd download etc.
    int entitlementType?;
    # Information on the ability to share with the family.
    VolumeUserinfoFamilysharing familySharing?;
    # Whether or not the user shared this volume with the family.
    boolean isFamilySharedFromUser?;
    # Whether or not the user received this volume through family sharing.
    boolean isFamilySharedToUser?;
    # Deprecated: Replaced by familySharing.
    boolean isFamilySharingAllowed?;
    # Deprecated: Replaced by familySharing.
    boolean isFamilySharingDisabledByFop?;
    # Whether or not this volume is currently in "my books."
    boolean isInMyBooks?;
    # Whether or not this volume was pre-ordered by the authenticated user making the request. (In LITE projection.)
    boolean isPreordered?;
    # Whether or not this volume was purchased by the authenticated user making the request. (In LITE projection.)
    boolean isPurchased?;
    # Whether or not this volume was user uploaded.
    boolean isUploaded?;
    # Reading position
    ReadingPosition readingPosition?;
    # Period during this book is/was a valid rental.
    VolumeUserinfoRentalperiod rentalPeriod?;
    # Whether this book is an active or an expired rental.
    string rentalState?;
    # Review description.
    Review review?;
    # Timestamp when this volume was last modified by a user action, such as a reading position update, volume purchase or writing a review. (RFC 3339 UTC date-time format).
    string updated?;
    # User uploaded volume info.
    VolumeUserinfoUseruploadedvolumeinfo userUploadedVolumeInfo?;
};

public type Volumeannotations record {
    # A list of volume annotations.
    Volumeannotation[] items?;
    # Resource type
    string kind?;
    # Token to pass in for pagination for the next page. This will not be present if this request does not have more results.
    string nextPageToken?;
    # The total number of volume annotations found.
    int totalItems?;
    # The version string for all of the volume annotations in this layer (not just the ones in this response). Note: the version string doesn't apply to the annotation data, just the information in this response (e.g. the location of annotations in the book).
    string 'version?;
};

# General volume information.
public type VolumeVolumeinfo record {
    # Whether anonymous logging should be allowed.
    boolean allowAnonLogging?;
    # The names of the authors and/or editors for this volume. (In LITE projection)
    string[] authors?;
    # The mean review rating for this volume. (min = 1.0, max = 5.0)
    decimal averageRating?;
    # Canonical URL for a volume. (In LITE projection.)
    string canonicalVolumeLink?;
    # A list of subject categories, such as "Fiction", "Suspense", etc.
    string[] categories?;
    # Whether the volume has comics content.
    boolean comicsContent?;
    # An identifier for the version of the volume content (text & images). (In LITE projection)
    string contentVersion?;
    # A synopsis of the volume. The text of the description is formatted in HTML and includes simple formatting elements, such as b, i, and br tags. (In LITE projection.)
    string description?;
    # Physical dimensions of this volume.
    VolumeVolumeinfoDimensions dimensions?;
    # A list of image links for all the sizes that are available. (In LITE projection.)
    VolumeVolumeinfoImagelinks imageLinks?;
    # Industry standard identifiers for this volume.
    VolumeVolumeinfoIndustryidentifiers[] industryIdentifiers?;
    # URL to view information about this volume on the Google Books site. (In LITE projection)
    string infoLink?;
    # Best language for this volume (based on content). It is the two-letter ISO 639-1 code such as 'fr', 'en', etc.
    string language?;
    # The main category to which this volume belongs. It will be the category from the categories list returned below that has the highest weight.
    string mainCategory?;
    # The main rating to which this volume belongs.
    string maturityRating?;
    # Total number of pages as per publisher metadata.
    int pageCount?;
    # A top-level summary of the panelization info in this volume.
    VolumeVolumeinfoPanelizationsummary panelizationSummary?;
    # URL to preview this volume on the Google Books site.
    string previewLink?;
    # Type of publication of this volume. Possible values are BOOK or MAGAZINE.
    string printType?;
    # Total number of printed pages in generated pdf representation.
    int printedPageCount?;
    # Date of publication. (In LITE projection.)
    string publishedDate?;
    # Publisher of this volume. (In LITE projection.)
    string publisher?;
    # The number of review ratings for this volume.
    int ratingsCount?;
    # The reading modes available for this volume.
    VolumeVolumeinfoReadingmodes readingModes?;
    # Total number of sample pages as per publisher metadata.
    int samplePageCount?;
    # The volume series information.
    Volumeseriesinfo seriesInfo?;
    # Volume subtitle. (In LITE projection.)
    string subtitle?;
    # Volume title. (In LITE projection.)
    string title?;
};

# Highest viewport for showing this location.
public type GeolayerdataGeoViewportHi record {
    # The latitude of the location.
    decimal latitude?;
    # The longitude of the location.
    decimal longitude?;
};

# User uploaded volume info.
public type VolumeUserinfoUseruploadedvolumeinfo record {
    # User uploaded volume processing state.
    string processingState?;
};

# Information regarding the source of this review, when the review is not from a Google Books user.
public type ReviewSource record {
    # Name of the source.
    string description?;
    # Extra text about the source of the review.
    string extraDescription?;
    # URL of the source of the review.
    string url?;
};

# Physical dimensions of this volume.
public type VolumeVolumeinfoDimensions record {
    # Height or length of this volume (in cm).
    string height?;
    # Thickness of this volume (in cm).
    string thickness?;
    # Width of this volume (in cm).
    string width?;
};

public type Annotation record {
    # Anchor text after excerpt. For requests, if the user bookmarked a screen that has no flowing text on it, then this field should be empty.
    string afterSelectedText?;
    # Anchor text before excerpt. For requests, if the user bookmarked a screen that has no flowing text on it, then this field should be empty.
    string beforeSelectedText?;
    # Selection ranges sent from the client.
    AnnotationClientversionranges clientVersionRanges?;
    # Timestamp for the created time of this annotation.
    string created?;
    # Selection ranges for the most recent content version.
    AnnotationCurrentversionranges currentVersionRanges?;
    # User-created data for this annotation.
    string data?;
    # Indicates that this annotation is deleted.
    boolean deleted?;
    # The highlight style for this annotation.
    string highlightStyle?;
    # Id of this annotation, in the form of a GUID.
    string id?;
    # Resource type.
    string kind?;
    # The layer this annotation is for.
    string layerId?;
    AnnotationLayersummary layerSummary?;
    # Pages that this annotation spans.
    string[] pageIds?;
    # Excerpt from the volume.
    string selectedText?;
    # URL to this resource.
    string selfLink?;
    # Timestamp for the last time this annotation was modified.
    string updated?;
    # The volume that this annotation belongs to.
    string volumeId?;
};

public type DictlayerdataCommon record {
    # The display title and localized canonical name to use when searching for this entity on Google search.
    string title?;
};

public type VolumeVolumeinfoIndustryidentifiers record {
    # Industry specific volume identifier.
    string identifier?;
    # Identifier type. Possible values are ISBN_10, ISBN_13, ISSN and OTHER.
    string 'type?;
};

public type DictionaryAnnotationdata record {
    # The type of annotation this data is for.
    string annotationType?;
    Dictlayerdata data?;
    # Base64 encoded data for this annotation data.
    string encodedData?;
    # Unique id for this annotation data.
    string id?;
    # Resource Type
    string kind?;
    # The Layer id for this data. *
    string layerId?;
    # URL for this resource. *
    string selfLink?;
    # Timestamp for the last time this data was updated. (RFC 3339 UTC date-time format).
    string updated?;
    # The volume id for this data. *
    string volumeId?;
};

# Period during this book is/was a valid rental.
public type VolumeUserinfoRentalperiod record {
    # End rental period in UTC.
    string endUtcSec?;
    # Start rental period in UTC.
    string startUtcSec?;
};

public type ConcurrentAccessRestriction record {
    # Whether access is granted for this (user, device, volume).
    boolean deviceAllowed?;
    # Resource type.
    string kind?;
    # The maximum number of concurrent access licenses for this volume.
    int maxConcurrentDevices?;
    # Error/warning message.
    string message?;
    # Client nonce for verification. Download access and client-validation only.
    string nonce?;
    # Error/warning reason code.
    string reasonCode?;
    # Whether this volume has any concurrent access restrictions.
    boolean restricted?;
    # Response signature.
    string signature?;
    # Client app identifier for verification. Download access and client-validation only.
    string 'source?;
    # Time in seconds for license auto-expiration.
    int timeWindowSeconds?;
    # Identifies the volume for which this entry applies.
    string volumeId?;
};

# The rental duration (for rental offers only).
public type VolumeSaleinfoRentalduration record {
    # Count of rental duration.
    decimal count?;
    # Unit of rental duration.
    string unit?;
};

public type DictlayerdataDictDefinitions record {
    string definition?;
    DictlayerdataDictExamples1[] examples?;
};

# Reading position
public type ReadingPosition record {
    # Position in an EPUB as a CFI.
    string epubCfiPosition?;
    # Position in a volume for image-based content.
    string gbImagePosition?;
    # Position in a volume for text-based content.
    string gbTextPosition?;
    # Resource type for a reading position.
    string kind?;
    # Position in a PDF file.
    string pdfPosition?;
    # Timestamp when this reading position was last updated (formatted UTC timestamp with millisecond resolution).
    string updated?;
    # Volume id associated with this reading position.
    string volumeId?;
};

# What layers exist in this volume and high level information about them.
public type VolumeLayerinfo record {
    # A layer should appear here if and only if the layer exists for this book.
    VolumeLayerinfoLayers[] layers?;
};

public type Volumes record {
    # A list of volumes.
    Volume[] items?;
    # Resource type.
    string kind?;
    # Total number of volumes found. This might be greater than the number of volumes returned in this response if results have been paginated.
    int totalItems?;
};

# Any information about a volume related to the eBookstore and/or purchaseability. This information can depend on the country where the request originates from (i.e. books may not be for sale in certain countries).
public type VolumeSaleinfo record {
    # URL to purchase this volume on the Google Books site. (In LITE projection)
    string buyLink?;
    # The two-letter ISO_3166-1 country code for which this sale information is valid. (In LITE projection.)
    string country?;
    # Whether or not this volume is an eBook (can be added to the My eBooks shelf).
    boolean isEbook?;
    # Suggested retail price. (In LITE projection.)
    VolumeSaleinfoListprice listPrice?;
    # Offers available for this volume (sales and rentals).
    VolumeSaleinfoOffers[] offers?;
    # The date on which this book is available for sale.
    string onSaleDate?;
    # The actual selling price of the book. This is the same as the suggested retail or list price unless there are offers or discounts on this volume. (In LITE projection.)
    VolumeSaleinfoRetailprice1 retailPrice?;
    # Whether or not this book is available for sale or offered for free in the Google eBookstore for the country listed above. Possible values are FOR_SALE, FOR_RENTAL_ONLY, FOR_SALE_AND_RENTAL, FREE, NOT_FOR_SALE, or FOR_PREORDER.
    string saleability?;
};

public type Annotationsdata record {
    # A list of Annotation Data.
    GeoAnnotationdata[] items?;
    # Resource type
    string kind?;
    # Token to pass in for pagination for the next page. This will not be present if this request does not have more results.
    string nextPageToken?;
    # The total number of volume annotations found.
    int totalItems?;
};

# Information about pdf content. (In LITE projection.)
public type VolumeAccessinfoPdf record {
    # URL to retrieve ACS token for pdf download. (In LITE projection.)
    string acsTokenLink?;
    # URL to download pdf. (In LITE projection.)
    string downloadLink?;
    # Is a scanned image pdf available either as public domain or for purchase. (In LITE projection.)
    boolean isAvailable?;
};

public type SeriesSeriessubscriptionreleaseinfoCurrentreleaseinfo record {
    # Amount in micros
    decimal amountInMicros?;
    string currencyCode?;
    string releaseNumber?;
    string releaseTime?;
};

public type Usersettings record {
    # Resource type.
    string kind?;
    # User settings in sub-objects, each for different purposes.
    UsersettingsNotesexport notesExport?;
    UsersettingsNotification notification?;
};

public type VolumeseriesinfoVolumeseries record {
    # List of issues. Applicable only for Collection Edition and Omnibus.
    VolumeseriesinfoIssue[] issue?;
    # The book order number in the series.
    int orderNumber?;
    # The book type in the context of series. Examples - Single Issue, Collection Edition, etc.
    string seriesBookType?;
    # The series id.
    string seriesId?;
};

public type MetadataItems record {
    string download_url?;
    string encrypted_key?;
    string language?;
    string size?;
    string 'version?;
};

public type OffersItems record {
    string author?;
    string canonicalVolumeLink?;
    string coverUrl?;
    string description?;
    string title?;
    string volumeId?;
};

public type SeriesSeries record {
    string bannerImageUrl?;
    boolean eligibleForSubscription?;
    string imageUrl?;
    boolean isComplete?;
    string seriesFormatType?;
    string seriesId?;
    SeriesSeriessubscriptionreleaseinfo seriesSubscriptionReleaseInfo?;
    string seriesType?;
    string subscriptionId?;
    string title?;
};

public type DictlayerdataDict record {
    # The source, url and attribution for this dictionary data.
    DictlayerdataDictSource 'source?;
    DictlayerdataDictWords[] words?;
};

public type BooksVolumesRecommendedRateResponse record {
    string consistency_token?;
};

public type BooksCloudloadingResource record {
    string author?;
    string processingState?;
    string title?;
    string volumeId?;
};

public type Category record {
    # A list of onboarding categories.
    CategoryItems[] items?;
    # Resource type.
    string kind?;
};

public type VolumeSaleinfoOffers record {
    # The finsky offer type (e.g., PURCHASE=0 RENTAL=3)
    int finskyOfferType?;
    # Indicates whether the offer is giftable.
    boolean giftable?;
    # Offer list (=undiscounted) price in Micros.
    VolumeSaleinfoListprice1 listPrice?;
    # The rental duration (for rental offers only).
    VolumeSaleinfoRentalduration rentalDuration?;
    # Offer retail (=discounted) price in Micros
    VolumeSaleinfoRetailprice retailPrice?;
};

# Search result information related to this volume.
public type VolumeSearchinfo record {
    # A text snippet containing the search query.
    string textSnippet?;
};

public type DiscoveryclustersBannerWithContentContainer record {
    string fillColorArgb?;
    string imageUrl?;
    string maskColorArgb?;
    string moreButtonText?;
    string moreButtonUrl?;
    string textColorArgb?;
};

# Review description.
public type Review record {
    # Author of this review.
    ReviewAuthor author?;
    # Review text.
    string content?;
    # Date of this review.
    string date?;
    # URL for the full review text, for reviews gathered from the web.
    string fullTextUrl?;
    # Resource type for a review.
    string kind?;
    # Star rating for this review. Possible values are ONE, TWO, THREE, FOUR, FIVE or NOT_RATED.
    string rating?;
    # Information regarding the source of this review, when the review is not from a Google Books user.
    ReviewSource 'source?;
    # Title for this review.
    string title?;
    # Source type for this review. Possible values are EDITORIAL, WEB_USER or GOOGLE_USER.
    string 'type?;
    # Volume that this review is for.
    string volumeId?;
};

public type GeoAnnotationdata record {
    # The type of annotation this data is for.
    string annotationType?;
    Geolayerdata data?;
    # Base64 encoded data for this annotation data.
    string encodedData?;
    # Unique id for this annotation data.
    string id?;
    # Resource Type
    string kind?;
    # The Layer id for this data. *
    string layerId?;
    # URL for this resource. *
    string selfLink?;
    # Timestamp for the last time this data was updated. (RFC 3339 UTC date-time format).
    string updated?;
    # The volume id for this data. *
    string volumeId?;
};

public type DictlayerdataDictConjugations record {
    string 'type?;
    string value?;
};

# A generic empty message that you can re-use to avoid defining duplicated empty messages in your APIs. A typical example is to use it as the request or the response type of an API method. For instance: service Foo { rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty); } The JSON representation for `Empty` is empty JSON object `{}`.
public type Empty record {
};

public type Volume2 record {
    # A list of volumes.
    Volume[] items?;
    # Resource type.
    string kind?;
    string nextPageToken?;
};

# Any information about a volume related to reading or obtaining that volume text. This information can depend on country (books may be public domain in one country but not in another, e.g.).
public type VolumeAccessinfo record {
    # Combines the access and viewability of this volume into a single status field for this user. Values can be FULL_PURCHASED, FULL_PUBLIC_DOMAIN, SAMPLE or NONE. (In LITE projection.)
    string accessViewStatus?;
    # The two-letter ISO_3166-1 country code for which this access information is valid. (In LITE projection.)
    string country?;
    # The download access restriction.
    DownloadAccessRestriction downloadAccess?;
    # URL to the Google Drive viewer if this volume is uploaded by the user by selecting the file from Google Drive.
    string driveImportedContentLink?;
    # Whether this volume can be embedded in a viewport using the Embedded Viewer API.
    boolean embeddable?;
    # Information about epub content. (In LITE projection.)
    VolumeAccessinfoEpub epub?;
    # Whether this volume requires that the client explicitly request offline download license rather than have it done automatically when loading the content, if the client supports it.
    boolean explicitOfflineLicenseManagement?;
    # Information about pdf content. (In LITE projection.)
    VolumeAccessinfoPdf pdf?;
    # Whether or not this book is public domain in the country listed above.
    boolean publicDomain?;
    # Whether quote sharing is allowed for this volume.
    boolean quoteSharingAllowed?;
    # Whether text-to-speech is permitted for this volume. Values can be ALLOWED, ALLOWED_FOR_ACCESSIBILITY, or NOT_ALLOWED.
    string textToSpeechPermission?;
    # For ordered but not yet processed orders, we give a URL that can be used to go to the appropriate Google Wallet page.
    string viewOrderUrl?;
    # The read access of a volume. Possible values are PARTIAL, ALL_PAGES, NO_PAGES or UNKNOWN. This value depends on the country listed above. A value of PARTIAL means that the publisher has allowed some portion of the volume to be viewed publicly, without purchase. This can apply to eBooks as well as non-eBooks. Public domain books will always have a value of ALL_PAGES.
    string viewability?;
    # URL to read this volume on the Google Books site. Link will not allow users to read non-viewable volumes.
    string webReaderLink?;
};

# Information about epub content. (In LITE projection.)
public type VolumeAccessinfoEpub record {
    # URL to retrieve ACS token for epub download. (In LITE projection.)
    string acsTokenLink?;
    # URL to download epub. (In LITE projection.)
    string downloadLink?;
    # Is a flowing text epub available either as public domain or for purchase. (In LITE projection.)
    boolean isAvailable?;
};

public type CategoryItems record {
    string badgeUrl?;
    string categoryId?;
    string name?;
};

public type Discoveryclusters record {
    DiscoveryclustersClusters[] clusters?;
    # Resorce type.
    string kind?;
    int totalClusters?;
};

public type Seriesmembership record {
    # Resorce type.
    string kind?;
    Volume[] member?;
    string nextPageToken?;
};

# The actual selling price of the book. This is the same as the suggested retail or list price unless there are offers or discounts on this volume. (In LITE projection.)
public type VolumeSaleinfoRetailprice1 record {
    # Amount in the currency listed below. (In LITE projection.)
    decimal amount?;
    # An ISO 4217, three-letter currency code. (In LITE projection.)
    string currencyCode?;
};

public type AnnotationLayersummary record {
    # Maximum allowed characters on this layer, especially for the "copy" layer.
    int allowedCharacterCount?;
    # Type of limitation on this layer. "limited" or "unlimited" for the "copy" layer.
    string limitType?;
    # Remaining allowed characters on this layer, especially for the "copy" layer.
    int remainingCharacterCount?;
};

# A list of image links for all the sizes that are available. (In LITE projection.)
public type VolumeVolumeinfoImagelinks record {
    # Image link for extra large size (width of ~1280 pixels). (In LITE projection)
    string extraLarge?;
    # Image link for large size (width of ~800 pixels). (In LITE projection)
    string large?;
    # Image link for medium size (width of ~575 pixels). (In LITE projection)
    string medium?;
    # Image link for small size (width of ~300 pixels). (In LITE projection)
    string small?;
    # Image link for small thumbnail size (width of ~80 pixels). (In LITE projection)
    string smallThumbnail?;
    # Image link for thumbnail size (width of ~128 pixels). (In LITE projection)
    string thumbnail?;
};

public type DictlayerdataDictExamples record {
    DictlayerdataDictSource2 'source?;
    string text?;
};

public type Series record {
    # Resource type.
    string kind?;
    SeriesSeries[] series?;
};

public type Layersummary record {
    # The number of annotations for this layer.
    int annotationCount?;
    # The list of annotation types contained for this layer.
    string[] annotationTypes?;
    # Link to get data for this annotation.
    string annotationsDataLink?;
    # The link to get the annotations for this layer.
    string annotationsLink?;
    # The content version this resource is for.
    string contentVersion?;
    # The number of data items for this layer.
    int dataCount?;
    # Unique id of this layer summary.
    string id?;
    # Resource Type
    string kind?;
    # The layer id for this summary.
    string layerId?;
    # URL to this resource.
    string selfLink?;
    # Timestamp for the last time an item in this layer was updated. (RFC 3339 UTC date-time format).
    string updated?;
    # The current version of this layer's volume annotations. Note that this version applies only to the data in the books.layers.volumeAnnotations.* responses. The actual annotation data is versioned separately.
    string volumeAnnotationsVersion?;
    # The volume id this resource is for.
    string volumeId?;
};

public type SeriesSeriessubscriptionreleaseinfo record {
    string cancelTime?;
    SeriesSeriessubscriptionreleaseinfoCurrentreleaseinfo currentReleaseInfo?;
    SeriesSeriessubscriptionreleaseinfoCurrentreleaseinfo nextReleaseInfo?;
    string seriesSubscriptionType?;
};

public type Bookshelf record {
    # Whether this bookshelf is PUBLIC or PRIVATE.
    string access?;
    # Created time for this bookshelf (formatted UTC timestamp with millisecond resolution).
    string created?;
    # Description of this bookshelf.
    string description?;
    # Id of this bookshelf, only unique by user.
    int id?;
    # Resource type for bookshelf metadata.
    string kind?;
    # URL to this resource.
    string selfLink?;
    # Title of this bookshelf.
    string title?;
    # Last modified time of this bookshelf (formatted UTC timestamp with millisecond resolution).
    string updated?;
    # Number of volumes in this bookshelf.
    int volumeCount?;
    # Last time a volume was added or removed from this bookshelf (formatted UTC timestamp with millisecond resolution).
    string volumesLastUpdated?;
};

# Lowest viewport for showing this location.
public type GeolayerdataGeoViewportLo record {
    # The latitude of the location.
    decimal latitude?;
    # The longitude of the location.
    decimal longitude?;
};

public type RequestAccessData record {
    ConcurrentAccessRestriction concurrentAccess?;
    # The download access restriction.
    DownloadAccessRestriction downloadAccess?;
    # Resource type.
    string kind?;
};

# The reading modes available for this volume.
public type VolumeVolumeinfoReadingmodes record {
    # Reading mode image
    boolean image?;
    # Reading mode text
    boolean text?;
};
