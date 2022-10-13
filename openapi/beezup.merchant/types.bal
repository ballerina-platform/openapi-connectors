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

import ballerina/constraint;

public type FunctionalityRightInfoArr FunctionalityRightInfo[];

public type BeezUPColumnConfigurationArr BeezUPColumnConfiguration[];

public type ChannelHeaderArr ChannelHeader[];

public type ChannelColumnArr ChannelColumn[];

public type FilterOperatorArr FilterOperator[];

public type SubscriptionIndexArr SubscriptionIndex[];

public type SubscriptionPushReportingArr SubscriptionPushReporting[];

# The message request to export order list. The store identifier is requested to regroup the exportations.
public type ExportOrderListRequest record {
    # The type of the file to export
    ExportOrderListFormat format?;
    # The store identifier
    BeezupCommonStoreid storeId;
    OrderListRequestWithoutPagination orderListRequestWithoutPagination;
};

public type SaveReportFilterRequest record {
    # Report filter name
    string reportFilterName;
    ReportFilterParameters parameters;
};

# The marketplace channel catalog list
public type MarketplaceChannelCatalogList record {
    MarketplaceChannelCatalogListLinks links;
    # The list of marketplace channel catalog
    MarketplaceChannelCatalog[] marketplaceChannelCatalogs;
};

public type BeezupCommonSuccesssummary record {
    string successCode?;
    string successMessage?;
    record {} successArguments?;
    string propertyName?;
    string propertyValue?;
    string objectName?;
};

# Gives you all entry point operations you can do on this API
public type OrderIndexLinks record {
    LinksGetorderindexlink self;
    LinksGetmarketplaceaccountssynchronizationlink status;
    LinksHarvestalllink harvest;
    LinksSetmerchantorderinfolistlink setMerchantInfos;
    LinksClearmerchantorderinfolistlink clearMerchantInfos;
    LinksExportorderslink export;
    LinksGetautomatictransitionslink autoTransitions;
    LinksGetorderexportationslink exportations?;
    LinksGetorderlistfulllink orders;
    LinksGetorderlistlightlink lightOrders;
};

public type ReportByChannelLinks record {
    LinksOptimisebychannellink enableProducts?;
    LinksOptimisebychannellink disableProducts?;
};

# The catalog column name
public type CatalogColumnName string;

public type LinksCatalogChangecustomcolumnexpressionlink record {
    *BeezupCommonLink3;
};

public type LinksCreaterulelink record {
    *BeezupCommonLink3;
};

public type AutomaticTransitionInfoList record {
    AutomaticTransitionInfoListLinks links;
    AutomaticTransitionInfo[] automaticTransitionInfos?;
};

# The currency code <a href="https://en.wikipedia.org/wiki/ISO_4217">(ISO 4217)</a>
public type CurrencyCode string;

# Your role in your company
public type WhatIDo string;

public type ChannelCatalogMarketplaceNumberSetting record {
    *ChannelCatalogMarketplaceSetting;
    # Channel catalog marketplace property values
    decimal[] values?;
};

public type ImportationCustomColumnLinks record {
    LinksImportationSavecustomcolumnlink save;
    LinksCatalogDeletecustomcolumnlink delete;
    LinksCatalogGetcustomcolumnexpressionlink expression;
    LinksImportationMapcustomcolumnlink 'map?;
    LinksImportationUnmapcustomcolumnlink unmap?;
    LinksImportationGetproductsamplecustomcolumnvaluelink productSampleValue?;
};

public type StoreTrackingStatus record {
    # The utc date of the latest synchronized click
    string clickSynchronizationUtcDate?;
    # The utc date of the latest synchronized order
    string orderSynchonizationUtcDate?;
    # The utc date of the latest synchronized marketplace order
    string marketplaceOrderSynchonizationUtcDate?;
};

public type ProductSetVisibilityCriteria record {
    # Indicate how you want to combine the filters:
    # * funnel: You will get the products which meet at least one of the product set criterion. The criteria are applied in the following order:
    #   - categorization
    #   - exclusion filters
    #   - deactivations
    # * cumulative: You will get the products which have all the product set criteria
    ProductSetVisibilityCriteriaLogicType logic;
    # If false, search for products absent from the current catalog. If true, search for products currently in the catalog. If null the filter will not be taken in account.
    boolean exist?;
    # Search product WITHOUT category mapped with the channel. If null the filter will not be taken in account.
    boolean uncategorized?;
    # Search excluded products by at least an exclusion filter. If null the filter will not be taken in account.
    boolean excluded?;
    # Search disabled products. If null the filter will not be taken in account.
    boolean disabled?;
};

public type LinksImportationConfigurecatalogcolumnlink record {
    *BeezupCommonLink3;
};

# If the report concerned one product for one channel the channel catalog product info will give you all you need to enable or disable the product.
public type ReportByProductOneChannelLinks record {
    LinksGetchannelcatalogproductinfolink productInfo;
    LinksOptimisebyproductlink enableProductForOneChannel;
    LinksOptimisebyproductlink disableProductForOneChannel;
};

public type LinksEnablerulelink record {
    *BeezupCommonLink3;
};

public type NextContractInfo record {
    *ContractInfo;
    NextContractInfoLinks links;
};

# JWT token to access Zendesk restricted help center
public type ZendeskToken record {
    # A JWT token build from your name and email to use on Zendesk
    string token?;
};

public type LinksCatalogGetcustomcolumnslink record {
    *BeezupCommonLink3;
};

# The channel catalog identifier
public type BeezupCommonChannelcatalogid string;

# Define the publication strategy kind, for that you have 2 choices 
# * Delta - This is the recommanded publication strategy kind, this strategy will push to the marketplace only the difference between your catalog and the previous published feeds done by BeezUP. 
# * Full - If you want to force the publication of all your catalog feeds to the marketplace. 
#       !WARNING! Depending to the marketplace this operation will purge the existing offers on the marketplace that are not in the catalog or unknown from the publication feed referential.
public type PublicationStrategyKind string;

# The exclusion filter operator name
public type FilterOperatorName string;

public type ReportByChannel record {
    # The basic info related to a channel
    BeezupCommonChannelbasicinfo channel;
    # The catalog product count
    int catalogProductCount;
    # The enabled product count
    int enabledProductCount;
    # The click count
    int clickCount;
    # The cost for
    decimal cost;
    # The order count
    int orderCount;
    # The Return On Investment
    decimal roi?;
    # The margin
    decimal margin?;
    # The performance indicator based on the performance indicator formula indicated in the request
    decimal performanceIndicator;
    # The total sales
    decimal totalSales;
    # The product sold count count
    int soldProductCount;
    ReportByChannelLinks links;
};

# This update will replace the following values.
public type UpdateRuleRequest record {
    # The name of the rule
    string ruleName;
    # Not required. The start validity utc date of the rule.
    string startUtcDate?;
    # Not required. The end validity utc date of the rule
    string endUtcDate?;
};

public type BillingPeriodList record {
    BillingPeriodListLinks links;
    # The billing period list
    BillingPeriod[] billingPeriods;
};

# The column mapping list between a channel and a catalog
public type ChannelCatalogColumnMappingList ChannelCatalogColumnMapping[];

# Indicate the http method to use on this link
public type HttpMethod string;

public type LinksDisablechannelcataloglink record {
    *BeezupCommonLink3;
};

public type TrackedOrders record {
    TrackedOrder[] orders;
};

# Describes a filter on a product's column.
# The key is the column identifier of your catalog or a custom column.
public type AdditionalAnalyticsProductColumnFilters record {
};

# The request to configure a catalog column
public type ConfigureCatalogColumnCatalogRequest record {
    # The catalog column configuration
    CatalogColumn catalogColumn;
};

public type LinksSavepersonalinfolink record {
    *BeezupCommonLink3;
};

public type LinksDeletenextcontractlink record {
    *BeezupCommonLink3;
};

public type ImportationTechnicalProgression record {
    # Indicate for each step of the importation the uris to look at
    record {} stepsProgression?;
};

public type LinksGetchannelcatalogslink record {
    *BeezupCommonLink3;
};

public type LinksGetchannelcatalogmarketplacepropertieslink record {
    *BeezupCommonLink3;
};

public type LinkParameter3Types record {
};

public type ChannelCatalogMarketplaceBooleanSetting record {
    *ChannelCatalogMarketplaceSetting;
    # Channel catalog marketplace property values
    boolean value?;
};

public type OrderIdentifierWithETag record {
    *OrderIdentifier;
    # ETag value to identify the order.\
    # This information is required for the operation GetOrder and ChangeOrder.\
    # For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3
    Etag etag;
};

# Describe the prorata info based on your previous invoice
public type PreviousFixPeriodInvoiceProrataInfo record {
    # The prorata amount
    decimal computedProrataToBeDeducted?;
    # The previous invoice number
    string invoiceNumber?;
    # The amount to be payed of the previous invoice
    decimal amountToBePaid?;
    # The amout after tax of the previous invoice
    decimal amountAfterTax?;
    # The contract id related to the previous invoice
    string contractId?;
    # The fixed end period of the previous invoice
    string fixedPeriodEndDate?;
    # The fixed start period of the previous invoice
    string fixedPeriodStartDate?;
};

# The error type for this execution if any
public type RuleExecutionReportingErrorType string;

public type LinksHarvestallv3link record {
    *Link3;
};

# Contains common filter parameters with Order By functionnality
public type OrderedReportFilterCommonParameters record {
    *ReportFilterCommonParameters;
    # Indicate on which indicator or value you want to make your formula
    PerformanceIndicatorType orderBy?;
    # Indicate which direction to order results by
    OrderByDirection orderByDirection?;
};

public type LinksAutoScheduleautoimportlink record {
    *BeezupCommonLink3;
};

public type ImportationCustomColumnList record {
    CustomColumnListLinks links;
    ImportationCustomColumn[] customColumns;
};

# In an marketplace technical code like CDiscount you can have several marketplaces like GO SPORT, etc. We identify them by a business code.
public type BeezupCommonMarketplacebusinesscode string;

public type LinksImportationIgnorecolumnlink record {
    *BeezupCommonLink3;
};

public type MarketplaceChannelCatalogListLinks record {
    LinksGetmarketplacechannelcatalogslink self;
};

public type CatalogIndex record {
    CatalogIndexLinks links;
    CatalogIndexLOVLinks lovLinks;
    CatalogStoreIndexList storeLinks?;
};

public type ProductList record {
    BeezupCommonPaginationresult paginationResult;
    Product[] products;
};

# The property identifier of the alert
public type AlertPropertyId int;

public type LinksImportationUnmapcatalogcolumnlink record {
    *BeezupCommonLink3;
};

public type LinksLogoutlink record {
    *BeezupCommonLink3;
};

# The channel category
public type ChannelCategory record {
    BeezupCommonChannelcategoryid channelCategoryId;
    # The channel category path
    BeezupCommonChannelcategorypath channelCategoryPath;
    # The channel category level starting from 1
    ChannelCategoryLevel channelCategoryLevel;
    # The default cost on this channel category
    ChannelCategoryDefaultCost channelCategoryDefaultCost?;
    # The channel category channel code identifier
    ChannelCategoryChannelCode channelCategoryChannelCode?;
    # The channel category column overrides
    ChannelCategoryColumnOverrides channelCategoryColumnOverrides?;
};

# This object is used by LOV apis
public type ListOfValueItem record {
    int position?;
    string codeIdentifier;
    string translationText?;
    int intIdentifier;
};

public type CreditCardInfoResponse record {
    # The different actions you can make on this offer
    CreditCardInfoResponseLinks links;
    # Payment method
    PaymentMethod currentPaymentMethod;
    CreditCardInfoWithCardType creditCardInfo?;
    BeezupCommonInfosummaries info?;
};

public type LinksAutoResumeautoimportlink record {
    *BeezupCommonLink3;
};

public type LinksChangeorderv3link record {
    *Link3;
    # Indicate the relation name related to the link
    string rel?;
};

public type LinksGetstoretrackedorderslink record {
    *BeezupCommonLink3;
};

public type BeezupCommonChannelcategoryid string;

public type RuleList record {
    # Rule list
    Rule[] rules;
    # Links to know if the user can create a rule or run all rules
    RuleListLinks links;
};

# The email
public type Email string;

# * path: if the parameter must be pass in the path uri
# * header: if the parameter must be passed in http header
# * query: if the parameter must be passed in querystring
# * body: if the paramter must be passed in the body
public type BeezupCommonParameterin string;

public type ActivateSubscriptionRequest record {
    # If set, the date must be in the past the subscription will recover existing orders using the begin period order last modification date. If not set then you will receive new/updated orders in real-time.
    string recoverBeginPeriodOrderLastModificationUtcDate?;
    # If end period set, first the date must be in the past, the subscription will recover existing orders using the begin and the end period order last modification date. 
    # If end period is not set and the begin period is set, then you will recover existing orders from the past using the begin period last modification date and after than you will continue to receive new/updated orders in real-time.
    # If begin/end period are not set then you will receive new/updated orders in real-time.
    # REMARK: The begin period is required if the end period is fulfilled.
    # REMARK: If the end period is order last modification date is indicated then once we have push all orders to your target url the subscription will be desactivated.
    string recoverEndPeriodOrderLastModificationUtcDate?;
};

public type BeezupCommonUsererrormessageArguments record {
    # The key of the parameter
    string name;
    # The value of the parameter. Depending to the type.
    record {} value;
};

# The channel identifier
public type BeezupCommonChannelid string;

public type ChannelCategoryColumnOverride record {
    # The channel column identifier
    BeezupCommonChannelcolumnid channelColumnId;
    # The channel column name
    BeezupCommonChannelcolumnname channelColumnName;
    # The channel column description
    ChannelColumnDescription channelColumnDescription?;
    # Indicates if this column must shown in the mapping page or not
    ChannelColumnShowInMapping showInMapping;
    # The channel column configuration. The BeezUP Column Name is optional. If the BeezUP column is mapped we will indicate the data type and column importance of the BeezUP column.
    ChannelColumnConfiguration configuration;
    # The restricted values. The key will be the restricted value identifier (format:guid) and the value will be the restriced value
    ChannelColumnRestrictedValues restrictedValues?;
};

# The version of your application
public type SubscriptionMerchantApplicationVersion string;

# Get Importation Products Report Request
public type GetImportationProductsReportRequest record {
    # Indicates the page number
    BeezupCommonPagenumber pageNumber;
    # Indicate the item count per page
    BeezupCommonPagesize pageSize;
    # Filter by Sku (equals)
    string sku?;
    # Filter by EAN (equals)
    string ean?;
    # Filter by MPN (equals)
    string mpn?;
    # Filter by Title (StartsWith)
    string title?;
    # Get Importation Products Report Request Error Codes
    GetImportationProductsReportRequestErrorCodes errorCodes?;
};

public type AutomaticTransition record {
    # The technical code of the marketplace.
    BeezupCommonMarketplacetechnicalcode marketplaceTechnicalCode;
    # The marketplace account identifier in BeezUP. This account identifier is based on your api settings.
    AccountId accountId;
    int orderStatusTransitionId;
    boolean enabled;
};

public type LinksGetchannelcatalogexclusionfilterslink record {
    *BeezupCommonLink3;
};

public type StandardOffers record {
    StandardOffersLinks links;
    # All standard offers
    StandardOffer[] offers;
    # All functionalities...
    Functionality[] functionalities;
};

public type ProfilePictureInfoWithDefault record {
    *ProfilePictureInfo;
    # Indicate the url of your picture profil based on your initials
    InitialsProfilePictureUrl initialsProfilePictureUrl;
    # Indicate the url of your picture profil based on gravatar
    GravatarProfilePictureUrl gravatarProfilePictureUrl;
};

public type SubscriptionIndex record {
    *Subscription;
    SubscriptionLinks links?;
};

public type LinksCatalogGetbeezupcolumnslink record {
    *BeezupCommonLink3;
};

public type LinksAddchannelcataloglink record {
    *BeezupCommonLink3;
};

# Represents the general settings of your channel catalog
public type GeneralSettings record {
    # If true then you authorize disclosure of my statistics generated from clicks and sales
    boolean acceptToPublishInfo;
    # Do not export "out of stock" products. Note: this option is not taken into account by the counter.
    boolean doNotExportOutOfStockProducts;
    # Activate BeezUP tracking for my statistics (checked by default)
    boolean activeBeezUPTracking;
};

public type LinksGetchannelinfolink record {
    *BeezupCommonLink3;
};

public type PublicChannelIndex record {
    # The key is the country iso code
    record {} channels?;
    PublicchannelindexLinks links?;
};

public type StoreList record {
    # The action links you can do globally on stores
    StoreListLinks links;
    Store[] stores;
};

public type LinksOptimisebychannellink record {
    *BeezupCommonLink3;
};

public type LinksCatalogGetproductslink record {
    *BeezupCommonLink3;
};

public type ReportByChannelResponse record {
    BeezupCommonPaginationresult paginationResult;
    # The currency code <a href="https://en.wikipedia.org/wiki/ISO_4217">(ISO 4217)</a>
    BeezupCommonCurrencycode currencyCode;
    ReportByChannel[] channels;
    ReportByChannelResponseLinks links;
};

public type LinksAnalyticsindexlink record {
    *BeezupCommonLink3;
};

public type LinksChangepasswordlink record {
    *BeezupCommonLink3;
};

public type ReportByDayGlobalAllChannels record {
    # Indicates the global performance indicator
    decimal performanceIndicator;
};

# Last manual import input configuration
public type LastManualImportInputConfiguration record {
    # Describe the input configuration
    InputConfiguration input;
};

public type BeezupCommonInfosummary record {
    string informationCode?;
    string informationMessage?;
    record {} informationArguments?;
    string propertyName?;
    string propertyValue?;
    string objectName?;
};

public type LinksConfigurechannelcatalogproductvalueoverridecopylink record {
    *BeezupCommonLink3;
};

public type ReportByDayAllChannels record {
    # The click count
    int clickCount;
    # The cost
    decimal cost;
    # The order count
    int orderCount;
    # The Return On Investment
    decimal roi;
    # The margin
    decimal margin;
    # The performance indicator based on the performance indicator formula indicated in the request
    decimal performanceIndicator;
    # The total sales
    decimal totalSales;
    # The product sold count count
    int soldProductCount;
};

public type PreviewOrderInvoiceRequest record {
    # Invoice Sequence Number
    InvoiceSequenceNumber invoiceSequenceNumber?;
};

public type ChangePasswordRequest record {
    # Your current password
    string oldPassword;
    # Your new password. Which must respect the same constraints as the user registeration
    string newPassword;
};

# The country iso code alpha 3 based on the list of values /user/lov/StoreCountry
public type StoreCountryIsoCodeAlpha3 string;

# Channel Catalog State
public type ChannelCatalogState record {
    int exportedProductCount;
    ColumnMappingStatus columnMappingStatus;
    # The category mapping state of the channel catalog
    CategoryMappingState categoryMappingState;
    BeezupCommonApisettingsstatus apiSettingsStatus?;
};

public type LinksGetstoretrackedexternalorderslink record {
    *BeezupCommonLink3;
};

public type LinksSetmerchantorderinfov3link record {
    *Link3;
};

public type LinksCatalogstoreindexlink record {
    *BeezupCommonLink3;
};

# Describe the rights for a functionality
public type FunctionalityRightInfo record {
    # The functionality code
    string functionalityCode;
    # The max value for this functionality code considering your rights
    int maxValueInterger?;
    # If you can use this functionality unlimitedly
    boolean unlimited?;
};

public type LinksMigratelegacytrackingchannelcataloglink record {
    *BeezupCommonLink3;
};

public type LinksCatalogSavecustomcolumnlink record {
    *BeezupCommonLink3;
};

public type CurrentContractInfoLinks record {
    LinksTerminatecurrentcontractlink disable?;
    LinksReactivatecurrentcontractlink reenable?;
};

public type LinksGetorderlistfullv3link record {
    *Link3;
};

public type LinksGetorderexportationslink record {
    *BeezupCommonLink3;
};

# Describe the way you have to follow to get access to the LOV
public type LOVLink3 record {
    # Indicate the uri to the list of value
    string href;
    # Indicate the http method to use on this link
    HttpMethod method?;
};

# The channel category path
public type BeezupCommonChannelcategorypath string[];

# The key is the channel column identifier
public type ProductOverridesWithCatalogValues record {
};

public type ReportByDayGlobalByChannel record {
    *ReportByDayGlobalAllChannels;
    # The basic info related to a channel
    BeezupCommonChannelbasicinfo channel;
};

# Indicate the duplicate product sku strategy.
public type DuplicateProductValueStrategy string;

public type CreateSubscriptionRequest record {
    # The URL <a href="https://en.wikipedia.org/wiki/URL">https://en.wikipedia.org/wiki/URL</a>
    HttpUrl targetUrl;
    # The subscription name you want to use
    SubscriptionName name;
    # The name of your application
    SubscriptionMerchantApplicationName merchantApplicationName;
    # The version of your application
    SubscriptionMerchantApplicationVersion merchantApplicationVersion;
    # The email
    Email merchantEmailAlert?;
};

# Indicate the validaty of the discount
public type PromotionalCodeValidity string;

# Get Importation Products Report Request Error Codes
public type GetImportationProductsReportRequestErrorCode record {
    # Error Code
    ErrorCode errorCode?;
    # Column named by the user
    UserColumName userColumnName?;
};

# Your api credential
public type ApiCredential record {
    # The product name related to this credential
    string productName?;
    # The primary token to be used in the next call in the user scope API
    string primaryToken?;
    # The secondary token. Could be usefull if you want to share your access with someone else.
    string secondaryToken?;
};

# Your invoice number
public type InvoiceNumber string;

public type SubscriptionLinks record {
    Link3 reporting?;
    Link3 activate?;
    Link3 deactivate?;
    Link3 'retry?;
    Link3 delete?;
};

public type StoreShares record {
    StoreSharesLinks links;
    StoreShare[] shares;
};

# The key is the OrderMetaInfo.
public type OrderHarvestErrors record {
};

# The time zone identifier based on the list of values /v2/user/lov/BeezUPTimeZone
public type BeezUPTimeZoneId int;

public type ProfilePictureInfoResponseLinks record {
    LinksGetprofilepictureinfolink self;
    LinksSaveprofilepictureinfolink save;
};

public type GetImportationReportResponseImportationInfo record {
    # The start date of the importation
    string beginUtcDate;
    # The start date of the importation
    string endUtcDate;
    # The user identifier
    BeezupCommonUserid userId;
    # Describe how to get and read a file
    InputFileConfiguration inputConfiguration;
};

public type AnalyticsStoreIndexLinks record {
    LinksAnalyticsindexlink self;
    LinksGetstoretrackingstatuslink trackingStatus;
    LinksGetstoretrackedclickslink trackedClicks;
    LinksGetstoretrackedorderslink trackedOrders;
    LinksGetstoretrackedexternalorderslink trackedExternalOrders?;
    LinksGetstorereportbydaylink reportByDay?;
    LinksGetstorereportbychannellink reportByChannel?;
    LinksGetstorereportbycategorylink reportByCategory?;
    LinksGetstorereportbyproductlink reportByProduct?;
    LinksOptimisealllink optimiseAll?;
    LinksOptimiselink optimise?;
    LinksOptimisebychannellink optimiseByChannel?;
    LinksOptimisebycategorylink optimiseByCategory?;
    LinksOptimisebyproductlink optimiseByProduct?;
    LinksGetreportfilterslink reportFilters;
    LinksGetruleslink rules?;
};

public type GetOrderInvoicePdfFromHtmlInvoiceUrlRequest record {
    # order invoice url
    OrderInvoiceUri orderInvoiceUri;
};

# The order marketplace identifier
public type MarketplaceOrderId string;

public type OMReadyMarketplaceBusinessCodeResponse ListOfValueItem[];

public type LinksGetstorelink record {
    *BeezupCommonLink3;
};

# Describe a BeezUP column
public type BeezUPColumnConfiguration record {
    # The BeezUP column name
    BeezupCommonBeezupcolumnname beezUPColumnName;
    # /!\ ONLY AVAILABLE ON CATALOG COLUMN NOT ON CUSTOM COLUMNS!!
    # If true, an error happen at the second occurence of the same value for this column
    # This information will be used during the importation process and later for mapping proposal
    boolean unique = false;
    # Importance of the column
    BeezupCommonColumnimportance columnImportance;
    # Data type of the column, will be used for parsing and for consolidation proces
    BeezupCommonColumndatatype columnDataType?;
    # If the size of the value is greater than the limit we can truncate the value instead of failing...
    CanBeTruncated canBeTruncated?;
    # Indicate the display group name where the column must be putted
    DisplayGroupName displayGroupName;
    # Describe the BeezUP column
    string description?;
};

public type ErrorSummary record {
    string utcDate?;
    string errorGuid?;
    string errorCode?;
    string errorMessage?;
    string technicalErrorMessage?;
    ExceptionDetail exceptionDetail?;
    record {} errorArguments?;
    string propertyName?;
    string propertyValue?;
    string objectName?;
    string 'source?;
};

public type CatalogStoreIndexLinks record {
    LinksCatalogstoreindexlink self;
    LinksImportationGetmanualupdatelastinputconfiglink inputConfiguration?;
    LinksAutoGetautoimportconfigurationlink autoImportInfo?;
    LinksImportationGetreportingslink importations?;
    LinksImportationStartmanualupdatelink startImportation?;
    LinksCatalogGetcatalogcolumnslink catalogColumns?;
    LinksCatalogGetcustomcolumnslink customColumns?;
    LinksCatalogGetcategorieslink categories?;
    LinksCatalogGetproductslink products?;
    LinksCatalogGetrandomproductslink randomProducts?;
    LinksCatalogComputeexpressionlink computeExpression?;
};

public type BeezupCommonLinkparameterproperty3 record {
    # The label corresponding to the link parameter property. This label is automatically translated based on the Accept-Language http header.
    string label?;
    # The value of the parameter. It can be an integer a string or an object.
    record {} value?;
    boolean required?;
    # The value type of the parameter
    BeezupCommonParametertype 'type;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 lovLink?;
    # If true, you MUST use indicate a value from the list of values otherwise it's a freetext
    boolean lovRequired?;
    # description of the parameter
    string description?;
    # schema of the parameter
    string schema?;
};

# The technical code of the marketplace.
public type BeezupCommonMarketplacetechnicalcode string;

public type AccountSynchronizationList record {
    AccountSynchronization[] accountSynchronizations?;
};

# The different actions you can make on this store share
public type StoreShareLinks record {
    LinksDeletestoresharelink deleteShare?;
};

public type InvoiceList record {
    InvoiceListLinks links;
    Invoice[] invoices;
};

# The request message to unmap a catalog category path to a channel category path
public type UnmapCategoryRequest record {
    # The catalog category path
    BeezupCommonCatalogcategorypath catalogCategoryPath;
};

# Footer Content HTML
@constraint:String {maxLength: 1000}
public type FooterContentHtml string;

public type LinksGetmarketplacechannelcatalogslink record {
    *BeezupCommonLink3;
};

public type OrderListLightWithLinks record {
    OrderHeaderWithLinks[] orders;
    OrderListLightLinks links;
    PaginationResult paginationResult;
};

public type LinksReactivatecurrentcontractlink record {
    *BeezupCommonLink3;
};

public type LinksHarvestalllink record {
    *BeezupCommonLink3;
};

# Indicates if this column must shown in the mapping page or not
public type ChannelColumnShowInMapping boolean;

# The action links you can do globally on stores
public type StoreListLinks record {
    LinksGetstoreslink self?;
    LinksCreatestorelink createStore?;
};

public type BillingPeriodListLinks record {
    LinksGetbillingperiodslink self?;
};

public type PersonalInfo record {
    # Your last name
    LastName lastName;
    # Your first name
    FirstName firstName;
    # Your phone number
    PhoneNumber phoneNumber;
    # Your role in your company
    WhatIDo whatIDo?;
    # The time zone identifier based on the list of values /v2/user/lov/BeezUPTimeZone
    BeezUPTimeZoneId beezUPTimeZoneId;
};

public type ChannelCatalog record {
    *BeezupCommonChannelbasicinfo;
    # Indicates if the channel catalog is enable
    boolean enabled;
    # Indicates if this channel catalog is related to a marketplace
    boolean isMarketplace;
    # The channel catalog identifier
    BeezupCommonChannelcatalogid channelCatalogId;
    # The store identifier
    BeezupCommonStoreid storeId;
    # Represents the general settings of your channel catalog
    GeneralSettings generalSettings;
    # Indicate the default configuration of the cost on this channel.
    ChannelCostSettings channelCostSettings;
    ChannelCategorySettings channelCategorySettings;
    # If this property is not indicated please force the user to configure the cost settings.
    # Defines the cost type you have on this channel with the cost value.
    CostSettings costSettings?;
    ChannelCatalogCategoryMappingSettings categoryMappingSettings?;
    # The column mapping list between a channel and a catalog
    ChannelCatalogColumnMappingListWithName columnMappings?;
    # The exclusion filter list
    ExclusionFilters exclusionFilters?;
    # The URL <a href="https://en.wikipedia.org/wiki/URL">https://en.wikipedia.org/wiki/URL</a>
    BeezupCommonHttpurl exportUrl?;
    # Channel Catalog State
    ChannelCatalogState state;
    # The channel type list related to the channel
    string[] types;
    # Indicates the actions you can do on a channel catalog
    ChannelCatalogLinks links;
};

public type ReportByProductResponse record {
    BeezupCommonPaginationresult paginationResult;
    # The currency code <a href="https://en.wikipedia.org/wiki/ISO_4217">(ISO 4217)</a>
    BeezupCommonCurrencycode currencyCode;
    ReportByProduct[] products;
    ReportByProductResponseLinks links;
};

public type CatalogStoreIndexList record {
    # The key is the store identifier.
    record {} links?;
};

public type LinksGetchannelcatalogmarketplacesettingslink record {
    *BeezupCommonLink3;
};

public type LinksGetstorereportbyproductlink record {
    *BeezupCommonLink3;
};

public type ClickIncludedAndVariablePrice record {
    # Click included
    int clickIncluded?;
    # The pricing applied for this range
    decimal variablePrice?;
};

# The channel category column overrides
public type ChannelCategoryColumnOverrides record {
};

public type OrderIdentifier record {
    # The technical code of the marketplace.
    BeezupCommonMarketplacetechnicalcode marketplaceTechnicalCode;
    # The marketplace account identifier in BeezUP. This account identifier is based on your api settings.
    AccountId accountId;
    # The BeezUP Order identifier
    BeezUPOrderId beezUPOrderId;
};

public type CustomColumnLinks record {
    LinksCatalogSavecustomcolumnlink save;
    LinksCatalogDeletecustomcolumnlink delete;
    LinksCatalogChangecustomcolumnusernamelink rename;
    LinksCatalogGetcustomcolumnexpressionlink expression;
    LinksCatalogChangecustomcolumnexpressionlink saveExpression;
};

public type LinksConfigurechannelcatalogcostsettingslink record {
    *BeezupCommonLink3;
};

# The business operation type that can be done on an order
public type OrderChangeType string;

# Indicates on which order merchant info synchronization status to filter
public type OrderMerchantInfoSynchronizationStatus string;

public type BeezupCommonLink3 record {
    # The label corresponding to the link. This label is automatically translated based on the Accept-Language http header.
    string label?;
    # The documentation related to this operation.
    BeezupCommonDocurl docUrl?;
    # The description of the link
    string description?;
    # Indicate the relative uri for this link
    BeezupCommonHref href;
    # The operationId to call.
    BeezupCommonOperationid operationId?;
    # Indicate the http method to use on this link
    BeezupCommonHttpmethod method?;
    record {} parameters?;
    # indicates whether the href is templated or not
    boolean urlTemplated?;
    # indicates whether all required params have been provided
    boolean allRequiredParamsProvided?;
    # indicates whether all optionals params have been provided
    boolean allOptionalParamsProvided?;
    BeezupCommonInfosummaries info?;
};

public type StandardOfferLinks record {
    LinksGetofferlink getOffer?;
};

public type ChannelCatalogMarketplaceIntegerProperty record {
    *ChannelCatalogMarketplaceProperty;
    # Indicate the default values of the property
    int[] default?;
};

# The alert name
public type AlertName string;

public type ProductOverrideWithCatalogValue record {
    # The overridden product value
    string override;
    # The catalog product value
    string catalogValue?;
};

# The list of actions you can do from the order list response
public type OrderListLinks record {
    LinksHarvestalllink harvest;
    LinksSetmerchantorderinfolistlink setMerchantInfos;
    LinksClearmerchantorderinfolistlink clearMerchantInfos;
    LinksExportorderslink export;
    LinksGetmarketplaceaccountssynchronizationlink status;
};

public type PerformanceIndicatorFormulaOperatorName string;

# Indicates the page number
@constraint:Int {minValue: 1}
public type BeezupCommonPagenumber int;

public type LinksGetmarketplaceaccountssynchronizationlink record {
    *BeezupCommonLink3;
};

public type Functionality record {
    # The functionality code
    string code;
    # UI purpose: Indicate the position of the functionality
    int 'order;
};

public type ChannelCatalogMarketplaceSettingArray ChannelCatalogMarketplaceSetting[];

public type LinksGetpublicationslink record {
    *BeezupCommonLink3;
};

public type LinksMoveuprulelink record {
    *BeezupCommonLink3;
};

# The store identifier
public type BeezupCommonStoreid string;

# Product VAT in percent
@constraint:Number {maxValue: 100}
public type ProductVATPercent decimal;

# Card Verification Code
public type CardVerificationCode string;

public type CreateRuleRequest record {
    # The optimisation action
    OptimisationActionName optimisationActionName;
    # The name of the rule
    string ruleName;
    # The report filter to use for the rule
    string reportFilterId;
    # The start validity utc date of the rule
    string startUtcDate?;
    # The end validity utc date of the rule
    string endUtcDate?;
};

public type LinksImportationStartmanualupdatelink record {
    *BeezupCommonLink3;
};

# The reporting related to a harvest order operation
public type HarvestOrderReporting record {
    # The execution identifier
    ExecutionUUID executionUUID?;
    # The creation UTC date of the execution
    string creationUtcDate?;
    # The processing status of the execution
    string processingStatus?;
    # The last update UTC date of the execution
    string lastUpdateUtcDate?;
    # The warning message during the execution
    string errorMessage?;
    # The warning message during the execution
    string warningMessage?;
    # BeezUP order status. Unified for all marketplaces.
    BeezUPOrderStatus beezUPStatus?;
    # The order marketplace status
    string marketplaceStatus?;
    # The marketplace order status forced by BeezUP during the order change oepration. This could happend when there is no status on the marketplace side.
    string beezUPForcedStatus?;
};

# The order list with all information we have from the orders and its items.\
# The paginationResult properties can be null if the list is empty.
public type OrderListFull record {
    BeezupCommonPaginationresult paginationResult?;
    Order[] orders;
    OrderListFullLinks links;
};

public type DetectedCatalogColumnListLinks record {
    LinksImportationGetdetectedcatalogcolumnslink self;
};

public type LinksAutoStartautoimportlink record {
    *BeezupCommonLink3;
};

public type MappingStatus string;

public type LinksImportationGetcustomcolumnslink record {
    *BeezupCommonLink3;
};

public type LinksRunrulelink record {
    *BeezupCommonLink3;
};

public type OrderWithLinks record {
    *Order;
    OrderLinks links;
    # Contains the authorized change actions for an order
    OrderTransitionLinks transitionLinks;
};

public type ReportByCategory record {
    # The catalog category identifier
    BeezupCommonCatalogcategoryid catalogCategoryId;
    # The catalog category path
    BeezupCommonCatalogcategorypath catalogCategoryPath?;
    # The product count for this category. This includes all the products that have been imported and can still have associated clicks and orders.
    int allProductCount;
    # The catalog product count for this category. This includes all products that are still present in your imported catalog.
    int catalogProductCount;
    # The enabled product count for this category. This includes all products that are still present in your imported catalog and have not been disabled via the optimisation feature.
    int enabledProductCount;
    # The click count for this category
    int clickCount;
    # The cost for this category
    decimal cost;
    # The order count for this category
    int orderCount;
    # The Return On Investment for this category
    decimal roi?;
    # The margin for this category
    decimal margin?;
    # The performance indicator based on the performance indicator formula indicated in the request for this category
    decimal performanceIndicator;
    # The total sales for this category
    decimal totalSales;
    # The product sold count count for this category
    int soldProductCount;
    ReportByCategoryLinks links;
};

# The status of your subscription
public type SubscriptionStatus string;

public type LinksAutoGetautoimportconfigurationlink record {
    *BeezupCommonLink3;
};

# Invoice Sequence Number
public type InvoiceSequenceNumber int;

public type LinksImportationGetmanualupdatelastinputconfiglink record {
    *BeezupCommonLink3;
};

public type LinksExportorderslink record {
    *BeezupCommonLink3;
};

public type LinksGetorderhistoryv3link record {
    *Link3;
};

public type LinksRunruleslink record {
    *BeezupCommonLink3;
};

public type LinksGetfriendinfolink record {
    *BeezupCommonLink3;
};

public type ReportByDayResponse record {
    # The currency code <a href="https://en.wikipedia.org/wiki/ISO_4217">(ISO 4217)</a>
    BeezupCommonCurrencycode currencyCode;
    ReportByDayGlobal globalPerformanceIndicators;
    ReportByDay[] days;
};

# Buyer full name
public type OrderBuyerName string;

# The store's sector based on the list of values /user/lov/ParamSector
public type StoreSector string;

public type ChannelCatalogProductInfoListLinks record {
    LinksGetchannelcatalogproductinfolistlink self;
    LinksExportchannelcatalogproductinfolistlink export?;
};

public type ImportationsResponseLinks record {
    LinksImportationGetreportingslink self?;
    LinksImportationStartmanualupdatelink 'start?;
};

public type ChannelCatalogExportationReporting record {
    # The exportation UTC date
    string exportationUtcDate;
    # The exportation duration. \
    # '00:01:00' measn 1 minute.
    string exportationDuration?;
    # The cache status during the exportation
    string cacheStatus?;
    # The exportated product count during this exportation
    int exportedProductCount?;
    # The IP address of the client who requests this exportation
    string clientIpAddress;
    # The http header User-Agent sent by the client who requests this operation
    string clientUserAgent;
};

# Describe the commitment information related to the offer.
public type ContractCommitmentInfo record {
    # The commitment end date related to the offer
    string commitmentCalculatedFinishDate?;
    # The start date related to the offer
    string newContractStartDate?;
    # The commitment period in month related to the offer
    int commitmentPeriodInMonth?;
    # The trial period in month related to the offer
    int trialPeriodInMonth?;
    # The trial period end date related to the offer
    string trialPeriodFinishDate?;
    # The payment delay in days related to the offer
    int paymentDelayInDays?;
    # The offer id based on /offers. Not a free offer of course.
    OfferId offerId?;
    # The offer Name
    string offerName?;
    # Your current contract id
    string currentContractId?;
    # Your current commercial user id
    string commercialUserId?;
    # Interal usage: Old offer type. The model description
    string model?;
    # The current contract termination date
    string currentContractTerminationDate?;
    # Payment method
    PaymentMethod requestedPaymentMethod?;
    # Payment method
    PaymentMethod currentCustomerPaymentMethod?;
    # Internal usage: Old offer type. Your contract type
    int contractType?;
    # Internal usage: Old offer type. Is the current contract model needs to be converted into a new contract type
    boolean isModelMustBeTransmittedInNewContract?;
    # Internal usage: Old offer type. Describe the fix and variable model information
    FixedAndVariableClickModelInfo fixedAndVariableClickInfo?;
    # Internal usage: Old offer type. Describe the fix and variable model information
    VariableModelInfo variableModelInfo?;
    # Payment method
    PaymentMethod paymentMethodAuthorized?;
    # Your special coupon offer identifier
    CouponOfferCode couponOfferCode?;
    # The commercial that is responsible of the creation of your account
    string commercialCreatorUserId?;
    # The minimum billing period in month authorized for this offer.
    int minBillingPeriodInMonths?;
    # If true, this means you want to leave us and that's sad... :'-(
    boolean isCustomerWantsToTerminateHisContract?;
};

# The different actions you can make on this offer
public type CreditCardInfoResponseLinks record {
    LinksGetcreditcardinfolink self;
    LinksSavecreditcardinfolink saveCreditCardInfo;
};

# The response given by the batch operation for an order
public type OrderOperationResponse record {
    OrderIdentifier 'order;
    # Indicates if the operation succeed or not
    boolean success;
    # Indicates the http status corresponding to the individual operation
    int status;
    # The error list
    BeezupCommonUsererrormessage[] errors?;
};

# Can be null. The billing period in month based on /billingPeriods
@constraint:Int {minValue: 1}
public type BillingPeriodInMonth int;

public type CatalogIndexLinks record {
    LinksCatalogindexlink self;
    LinksCatalogGetbeezupcolumnslink beezUPColumns;
};

# The category mapping state of the channel catalog
public type CategoryMappingState record {
    CategoryMappingStatus status?;
    # Indicates the uncategorized product count
    int uncategorizedProductCount?;
    # Indicates the count of products without cost defined
    int withoutCategoryCostProductCount?;
};

public type LinksGetstoretrackedclickslink record {
    *BeezupCommonLink3;
};

# The request to create a store. The store identifier is optional, if null it will be automatically computed.
public type CreateStoreRequest record {
    # The store identifier
    BeezupCommonStoreid id?;
    # The store name. Must be unique.
    StoreName name;
    # The url of your store
    StoreUrl url;
    # The country iso code alpha 3 based on the list of values /user/lov/StoreCountry
    StoreCountryIsoCodeAlpha3 countryIsoCodeAlpha3;
    # The store's sectors based on the list of values /user/lov/ParamSector
    StoreSectors sectors;
};

public type CatalogColumnList record {
    CatalogColumn[] catalogColumns;
};

public type ExclusionFiltersResponse record {
    ExclusionFiltersResponseLinks links;
    # The exclusion filter list
    ExclusionFilters exclusionFilters?;
};

public type LinksGetchannelcatalogexclusionfilterscopylink record {
    *BeezupCommonLink3;
};

# The Publication Type
public type PublicationStrategy string;

public type TrackedExternalOrderProduct record {
    # The product sku received for the external order
    string productSku;
    # We tried to get the catalog product title based on the product SKU. This property can be null, if we cannot found the product. This is possible if the product is not referenced in the imported catalog.
    string productTitle?;
    # We tried to get the catalog product image Url based on the product SKU. This property can be null, if we cannot found the product. This is possible if the product is not referenced in the imported catalog.
    string productImageUrl?;
    # We tried to get the catalog product if it's still active based on the product SKU. This property can be null, if we cannot found the product. This is possible if the product is not referenced in the imported catalog.
    boolean productActive?;
    # We tried to get the catalog product identifier based on the product SKU. This property can be null, if we cannot found the product. This is possible if the product is not referenced in the imported catalog.
    string productId?;
    # The product's unit price for the external order. This property is voluntarily a string because the value could be an invalid one.
    string unitPrice?;
    # The quantity of this product for the external order. This property is voluntarily a string because the value could be an invalid one
    string quantity?;
    # The product's margin for the external order. This property is voluntarily a string because the value could be an invalid one
    string margin?;
};

# The XML file description
public type InputFileReadXmlConfiguration record {
    # Indicate if the importation should take in account the attribute in the xml nodes.
    boolean useXmlAttributes;
    # Indicate if the children xml nodes should be flatten with there parent to take in account the sub node values.
    boolean flattenXmlChildElements;
};

# CPC means cost per click.
# CPA means cost per action.
# You can have CPC/CPA with a global cost value.
# You can have CPC/CPA by category the cost value MUST be null
# You can have global fixed price.
public type CostType string;

# The catalog importation reporting
public type ImportationReporting record {
    ImportationReportingLinks links?;
    # The execution identifier of the catalog importation
    ExecutionId executionId;
    # The last step name of the importation process
    string stepName?;
    # The user identifier
    BeezupCommonUserid userId?;
    # Indicate if the importation succeed or not.
    boolean success?;
    # Indicate the total product count detected in the catalog during the importation.
    int totalProductCount?;
    # Indicate the total product count in error detected in the catalog during the importation.
    int totalProductErrorCount?;
    # Indicate the total product count in success in the catalog during the importation.
    int totalProductSuccessCount?;
    # Indicate the error message list related to this importation.
    BeezupCommonUsererrormessage[] errors?;
    # Indicate the last update UTC date of the reporting.
    string lastUpdateUtcDate;
    # Indicate if this importation is an auto import or not.
    boolean autoImported?;
    # Indicate the begin UTC date of this importation.
    string beginUtcDate;
    # Indicate the end UTC date of this importation.
    string endUtcDate?;
    # Indicate the input url of this importation.
    string inputConfigurationUrl?;
    # Indicate the steps that have been passed during the importation process
    record {} steps;
};

# The key is the channel column identifier
public type ProductOverrides record {
};

public type ClearMerchantOrderInfoListRequest record {
    @constraint:Array {maxLength: 100, minLength: 1}
    OrderIdentifier[] orders;
};

public type LinksCatalogDeletecustomcolumnlink record {
    *BeezupCommonLink3;
};

public type OrderExportationsLinks record {
    LinksGetorderexportationslink self;
};

public type LinksSetchannelcatalogmarketplacesettingslink record {
    *BeezupCommonLink3;
};

public type ImportationsResponse record {
    ImportationsResponseLinks links?;
    ImportationReporting[] importations?;
};

public type DetectedCatalogColumn record {
    *CatalogColumn;
    DetectedCatalogColumnLinks links;
};

public type LinksDeletechannelcataloglink record {
    *BeezupCommonLink3;
};

public type OrderListRequestWithoutPagination record {
    BeezupCommonMarketplacetechnicalcode[] marketplaceTechnicalCodes?;
    BeezupCommonMarketplacebusinesscode[] marketplaceBusinessCodes?;
    # Account Id list
    AccountId[] accountIds?;
    # Store Id list
    BeezupCommonStoreid[] storeIds?;
    BeezUPOrderStatus[] beezUPOrderStatuses?;
    # Indicates on which date you want to make the filter
    DateSearchType dateSearchType?;
    # The begin period you want to make the search. \
    # The period MUST not be greater than 30 days.
    # The begin period MUST be lower than the end period.
    string beginPeriodUtcDate;
    # The end period of you search. \
    # The period MUST not be greater than 30 days. \
    # The end period MUST be greater than the begin period.
    # The end period MUST be lower to the current date.
    string endPeriodUtcDate;
    # Indicates on which invoice availability to filter
    InvoiceAvailabilityType invoiceAvailabilityType?;
    # Buyer full name
    OrderBuyerName order_Buyer_Name?;
    MarketplaceOrderId[] marketplaceOrderIds?;
    # Indicates on which order merchant info synchronization status to filter
    OrderMerchantInfoSynchronizationStatus orderMerchantInfoSynchronizationStatus?;
    # Merchant order id list
    OrderMerchantorderid[] order_MerchantOrderIds?;
};

public type OptimiseRequest record {
    *OptimiseAllRequest;
    *PaginationRequestParameters;
};

public type ErrorResponseMessagePaymentRequired record {
    *BeezupCommonErrorresponsemessage;
    ErrorResponseMessagePaymentRequiredLinks links;
};

public type LinksGetchannelcatalogcategorieslink record {
    *BeezupCommonLink3;
};

# Provides the credentials
public type Credential record {
    # The user name
    string userName;
    # The password
    string password?;
};

public type LinksGettrackingstatuslink record {
    *BeezupCommonLink3;
};

public type LinksOptimisealllink record {
    *BeezupCommonLink3;
};

# Publication feed reporting
public type PublicationFeedReporting record {
    # The Feed Type
    FeedType feedType;
    # The feed publication start time (UTC timezone)
    string startUtcDate;
    # The feed publication end time (UTC timezone)
    string endUtcDate?;
    # The processing status
    string processingStatus;
    # The product count downloaded from BeezUP Export
    int exportedProducts?;
    # The item count (products or offers) sent to the marketplace
    int transmittedItems?;
    # The item count (products or offers) the marketplace flagged as successful
    int publishedItems?;
    # The item count (products or offers) the marketplace flagged as successful with warnings
    int publishedItemsWithWarning?;
    # The item count (products or offers) the marketplace flagged as failed
    int failedItems?;
    # The error message
    string errorMessage?;
    # The Url for the Html Report generated
    string htmlReportUrl?;
    # The error message if the Html Report generation failed
    string htmlReportGenerationErrorMessage?;
    # Indicates if the publication is completed or not
    boolean completed?;
};

public type LinksGetorderhistorylink record {
    *BeezupCommonLink3;
};

public type MarginType string;

public type ChannelCatalogMarketplacePropertyDiscriminatorType string;

public type ChannelCatalogCategoryConfigurationList record {
    # The action you can do on the category mappings
    ChannelCatalogCategoryMappingsLinks links;
    ChannelCatalogCategoryConfigurationInfo[] channelCatalogCategoryConfigurations;
    MappingStatus mappingStatus;
    CostStatus costStatus;
};

# The subscription name you want to use
public type SubscriptionName string;

public type OrderInvoiceDesignSettings record {
    # Header Content HTML
    HeaderContentHtml headerContentHtml?;
    # Footer Content HTML
    FooterContentHtml footerContentHtml?;
};

# Describe the input configuration
public type InputConfiguration record {
    # Can be null. Use to transform multiple files with an XSLT file.
    string transformFileUrl?;
    # The list of files to get and read
    @constraint:Array {minLength: 1}
    InputFileConfiguration[] files;
};

public type LinksGetchannelcatalogexportationhistorylink record {
    *BeezupCommonLink3;
};

# Indicates the status of the catalog store.
# * OK: If the latest importation is a success!
# * Failed: If the latest importation has failed !
# * Outdated: If the latest succeed importation is later than 1 day.
public type CatalogStoreStatus string;

public type ExternallinksCatalogGetbeezupcolumnslink record {
    *BeezupCommonLink3;
};

public type AccountPublicationsLinks record {
    LinksGetpublicationslink self;
};

public type LinksConfigurechannelcatalogexclusionfilterscopylink record {
    *BeezupCommonLink3;
};

public type GetChannelCatalogProductInfoListRequest record {
    @constraint:Int {minValue: 1}
    int pageNumber;
    @constraint:Int {minValue: 100}
    int pageSize;
    ProductSetVisibilityCriteria criteria;
    # Search overridden products. If null the filter will not be taken in account.
    boolean overridden?;
    ChannelCatalogProductFilters productFilters?;
    BeezupCommonCatalogcategoryfilter catalogCategoryFilter?;
    BeezupCommonChannelcategoryfilter channelCategoryFilter?;
};

public type LinksUpdaterulelink record {
    *BeezupCommonLink3;
};

public type LinksGetuserlovindexlink record {
    *BeezupCommonLink3;
};

# The country iso code alpha 3 <a href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3">(ISO 3166-1_alpha-3)</a>
public type BeezupCommonCountryisocodealpha3 string;

public type LinksImportationSavecustomcolumnlink record {
    *BeezupCommonLink3;
};

public type LinksConfigurechannelcatalogcategorylink record {
    *BeezupCommonLink3;
};

public type StoreShare record {
    # The user identifier
    BeezupCommonUserid userId;
    # Indicates the role can have a user on a store.
    # * Owner: Indicates that you are the owner of this store
    # * User: Indicates that you are a simple user on this store
    StoreUserRole userRole;
    # The different actions you can make on this store share
    StoreShareLinks links;
};

# The message request to change a custom column expression an user name
public type ChangeCustomColumnRequest record {
    # The encrypted excel expression of the column
    EncryptedExpression encryptedExpression;
    # The encrypted XML Blockly representation of the expression
    EncryptedBlocklyExpression encryptedBlocklyExpression;
    # Column named by the user
    UserColumName userColumName;
};

# The exclusion filter
public type ExclusionFilter record {
    # The exclusion filter name
    ExclusionFilterName name;
    # The position of the exclusion filter
    @constraint:Int {minValue: 1}
    int position;
    # Indicate the filter's group. All filters in the same group means an "AND" operation in the filter group
    string groupId;
    # Indicate the filter group position. This information is used for the UI purpose and must be unique in the filter group.
    @constraint:Int {minValue: 1}
    int positionInGroup;
    # The channel column identifier
    BeezupCommonChannelcolumnid channelColumnId;
    # The exclusion filter operator name
    FilterOperatorName operatorName;
    # The value indicate by the user when the filter operation requires it.
    @constraint:String {maxLength: 4000}
    string value?;
    # indicates if the filter is currently enable.
    boolean enabled;
};

# The column mapping list between a channel and a catalog
public type ChannelCatalogColumnMappingListWithName ChannelCatalogColumnMappingWithName[];

public type ChannelCategorySettings record {
    # Indicates if the category mapping is required, otherwise you can map the categories but it will not block the publication of your catalog
    boolean mappingRequired?;
    # Indicates if the category mapping is required on category path leaf or not
    boolean mappingLeafRequired?;
};

# Channel catalog marketplace property name
public type ChannelCatalogMarketplacePropertyName string;

# The offer id based on /offers. Not a free offer of course.
@constraint:Int {minValue: 1}
public type OfferId int;

# order invoice url
public type OrderInvoiceUri string;

public type LinksGetstorereportbycategorylink record {
    *BeezupCommonLink3;
};

# Links to retrieve/action on this rule execution
public type RuleExecutionReportingLinks record {
    LinksGetrulelink rule?;
};

public type ReportByDayGlobal record {
    ReportByDayGlobalAllChannels allChannels;
    ReportByDayGlobalByChannel[] byChannels;
};

# The order merchant identifier
public type OrderMerchantorderid string;

public type LinksImportationReattendcolumnlink record {
    *BeezupCommonLink3;
};

public type ChannelCatalogMarketplaceSettingDiscriminatorType string;

# Describe how to get and read a file
public type InputFileConfiguration record {
    # The file number starting by 1
    @constraint:Int {minValue: 1}
    int fileNumber;
    # Describe the way to download the file
    InputFileFetchConfiguration fetch;
    # Describe how to read the file. If FileFormatStrategy is CSV, csvFileReadProperties is required. Otherwise the xmlFileReadProperties is required.
    InputFileReadConfiguration read;
};

# CSV or XML
public type FileFormatStrategy string;

public type ChannelCatalogExportCacheInfoResponse record {
    ChannelCatalogExportCacheInfo cacheInfo;
    ChannelCatalogExportCacheInfoResponseLinks links;
};

# The store name. Must be unique.
public type StoreName string;

# The navigation links 'first', 'last', 'next', 'previous'
public type BeezupCommonPaginationresultlinks record {
    BeezupCommonLink3 first;
    BeezupCommonLink3 last;
    BeezupCommonLink3 previous?;
    BeezupCommonLink3 next?;
};

public type LinksImportationGetproductsamplelink record {
    *BeezupCommonLink3;
};

public type LinksDisablerulelink record {
    *BeezupCommonLink3;
};

public type LinksOptimiselink record {
    *BeezupCommonLink3;
};

public type ProductError record {
    int lineNumber;
    # The Stock Keeping Unit (SKU), i.e. a merchant-specific identifier for a product or service, or the product to which the offer refers. http://schema.org/sku
    Sku sku?;
    string ean?;
    string mpn?;
    string title?;
    ProductErrorCodes errors;
};

public type LinksPublishcatalogtomarketplacelink record {
    *BeezupCommonLink3;
};

public type OrderHarvestErrorValue record {
    string technicalCodePropertyName;
    string errorMessage;
};

public type AnalyticsStoreIndex record {
    AnalyticsStoreIndexLinks links;
};

public type OfferRequest record {
    # The offer id based on /offers. Not a free offer of course.
    OfferId offerId;
    # The store count you want to have in your contract.
    StoreCount storeCount;
    # The coupon discount code
    CouponDiscountCode couponDiscountCode?;
    # Your special coupon offer identifier
    CouponOfferCode couponOfferCode?;
    # Can be null. The billing period in month based on /billingPeriods
    BillingPeriodInMonth billingPeriodInMonth;
};

public type ReportFilterHeader record {
    # Report filter identifier
    string reportFilterId;
    # Report filter name
    string reportFilterName;
    # The report type
    ReportType reportType;
    ReportFilterHeaderLinks links;
};

public type BeezupCommonWarningsummary record {
    string technicalErrorMessage?;
    string warningMessage?;
    string warningCode?;
    record {} warningArguments?;
};

# The first level category with his sub categories
public type ChannelFirstLevelCategory record {
    BeezupCommonChannelcategoryid channelCategoryId;
    # The channel category name
    string channelCategoryName;
    # The channel category level starting from 1
    ChannelCategoryLevel channelCategoryLevel;
    # The default cost on this channel category
    ChannelCategoryDefaultCost channelCategoryDefaultCost?;
    # The channel category channel code identifier
    ChannelCategoryChannelCode channelCategoryChannelCode?;
    # The channel category column overrides
    ChannelCategoryColumnOverrides channelCategoryColumnOverrides?;
    ChannelCategory[] subCategories?;
};

public type ChannelCatalogProductInfo record {
    *BeezupCommonProductbasicinfo;
    # The key is the channel column identifier
    ProductOverridesWithCatalogValues overrides;
    # Indicates if the product has been disabled or not
    boolean disabled;
    # Indicates if the product's category has been NOT mapped to a channel category
    boolean uncategorized;
    # Indicates if the product has been excluded by a exclusion filter
    boolean excluded;
    ExclusionFilterName[] excludedBy?;
    # Indicates the differents actions you can do on a channel product
    ChannelCatalogProductInfoLinks links;
};

public type ReportByProduct record {
    # The basic information related to a product
    BeezupCommonProductbasicinfo product;
    # The count of channel where this product is enabled
    int enabledOnChannelCount;
    # The channel count where this product can be enabled
    int channelCount;
    # The click count for this product
    int clickCount;
    # The cost for this product
    decimal cost;
    # The order count for this product
    int orderCount;
    # The Return On Investment for this product
    decimal roi?;
    # The margin for this product
    decimal margin?;
    # The performance indicator based on the performance indicator formula indicated in the request for this product
    decimal performanceIndicator;
    # The total sales for this product
    decimal totalSales;
    # The product sold count count for this product
    int soldProductCount;
    # Depending if the report concerned multiple channels or one channel.
    ReportByProductLinks links;
};

public type LinksSaveprofilepictureinfolink record {
    *BeezupCommonLink3;
};

# The exclusion filter name
public type ExclusionFilterName string;

public type ReportByProductResponseLinks ReportByCommonResponseLinks;

public type LinksAutoConfigureautoimportintervallink record {
    *BeezupCommonLink3;
};

public type ChannelCatalogProductByChannelCatalogRequest record {
    # The store identifier
    BeezupCommonStoreid storeId;
    # The product identifier
    BeezupCommonProductid productId;
    # The list of channel catalog identifier
    BeezupCommonChannelcatalogid[] channelCatalogIds;
};

# The url of your store
public type StoreUrl string;

public type ReportFiltersLinks record {
    LinksGetreportfilterslink self;
    LinksSavereportfilterlink save;
};

public type ReportAdvancedFilters record {
    MarginType marginType;
    # If the margin type is 'Global', indicate the percentage of sale price.
    @constraint:Int {maxValue: 100}
    int globalMarginPercent?;
    LinkClickToOrderType linkClickToOrderType;
    # If the linkOrderType is OnClickDate, indicate the max day to search the click from the order
    @constraint:Int {maxValue: 180}
    int linkClickToOrderMaxDay?;
    # If true, you will get the only the orders with payment validated. Otherwise, you will get all orders validated or not.
    boolean onlyPaymentValidatedOrders;
    # If true, you will get only direct sales. Otherwise the indirect sales will be included.
    boolean onlyDirectSales;
    # The KPI formula
    PerformanceIndicatorFormula performanceIndicatorFormula;
};

# BeezUP order status. Unified for all marketplaces.
public type BeezUPOrderStatus string;

public type LinksDisablechannelcatalogcategorymappinglink record {
    *BeezupCommonLink3;
};

public type ChannelCatalogExportationHistory record {
    BeezupCommonPaginationresult paginationResult?;
    ChannelCatalogExportationReporting[] exportations;
    ChannelCatalogExportationHistoryLinks links;
};

public type LinksChangeorderlink record {
    *BeezupCommonLink3;
    # Indicate the relation name related to the link
    string rel?;
};

# Describe the billing period information related to the offer.
public type ContractBillingPeriodInfo record {
    # The amount discounted related to the billing period
    decimal amountBillingPeriodDiscount?;
    # The discount percent related to the billing period
    decimal billingPeriodPercentDiscount?;
    # Can be null. The billing period in month based on /billingPeriods
    BillingPeriodInMonth billingPeriodInMonth?;
};

public type LinksImportationActivateautoimportlink record {
    *BeezupCommonLink3;
};

public type LinksGetorderlistlightlink record {
    *BeezupCommonLink3;
};

public type BeezupCommonLinkparameter3 record {
    # The label corresponding to the link parameter. This label is automatically translated based on the Accept-Language http header.
    string label?;
    # The value of the parameter. It can be an integer a string or an object.
    record {} value?;
    boolean required = false;
    # * path: if the parameter must be pass in the path uri
    # * header: if the parameter must be passed in http header
    # * query: if the parameter must be passed in querystring
    # * body: if the paramter must be passed in the body
    BeezupCommonParameterin 'in;
    # The value type of the parameter
    BeezupCommonParametertype 'type?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 lovLink?;
    # If true, you MUST indicate a value from the list of values otherwise it's a freetext
    boolean lovRequired?;
    # description of the parameter
    string description?;
    # schema of the parameter
    string schema?;
    # If the parameter is an object with flexible properties (additionProperties/dictionary), we will describe the properties of the object.
    record {} properties?;
};

# The URL <a href="https://en.wikipedia.org/wiki/URL">https://en.wikipedia.org/wiki/URL</a>
public type HttpUrl string;

# The currency code <a href="https://en.wikipedia.org/wiki/ISO_4217">(ISO 4217)</a>
public type BeezupCommonCurrencycode string;

public type AnalyticsProductColumnFilters record {
    # The product sku filter
    string sku?;
    # The product title filter
    string title?;
    # Describes a filter on a product's column.
    # The key is the column identifier of your catalog or a custom column.
    AdditionalAnalyticsProductColumnFilters additionalAnalyticsProductColumnFilters?;
};

public type ReportByProductRequest record {
    *OrderedReportFilterCommonParameters;
    *PaginationRequestParameters;
    ProductColumnsToDisplay productColumnsToDisplay?;
    # You can filter on the product state.
    ProductStateFilter productState;
    AnalyticsProductColumnFilters analyticsProductColumnFilters?;
};

public type NextContractInfoLinks record {
    LinksDeletenextcontractlink delete?;
};

# The marketplace account identifier in BeezUP. This account identifier is based on your api settings.
public type BeezUPMarketplaceAccountId int;

public type LinksCatalogGetcategorieslink record {
    *BeezupCommonLink3;
};

# The message identifier. It's a guid.
public type MessageId string;

public type LinksGetmarketplaceaccountssynchronizationv3link record {
    *Link3;
};

public type Invoice record {
    # The invoice date
    string invoiceDate;
    # Your contract identifier
    ContractId contractId;
    # Your invoice number
    InvoiceNumber invoiceNumber;
    # The amount of your invoice
    decimal amount;
    # The remaining amount to be paid for this invoice
    decimal amountToBePaid;
    # The currency code <a href="https://en.wikipedia.org/wiki/ISO_4217">(ISO 4217)</a>
    BeezupCommonCurrencycode currencyCode;
    # The payment status
    InvoicePaymentStatus paymentStatus;
    string dueDate;
    # The url of the invoice document
    string invoiceUrl?;
};

public type GetOrderInvoiceDesignPreviewResponse record {
    # Invoice Content HTML
    InvoiceContentHtml invoiceHtmlContent;
};

# Indicate the url of your picture profil
public type ProfilePictureUrl string;

# This object is used by LOV apis
public type BeezupCommonListofvalueitem record {
    int position?;
    string codeIdentifier;
    string translationText?;
    int intIdentifier;
};

public type TrackedExternalOrders record {
    TrackedExternalOrder[] externalOrders;
};

# Contains all change order operations you want to make.  (max 100 items per call)
public type ChangeOrderListRequest record {
    # The change order operations
    ChangeOrderListRequestItem[] changeOrders;
};

public type LinksGetchannelcatalogexportationcacheinfolink record {
    *BeezupCommonLink3;
};

# The custom column configuration
public type CustomColumn record {
    # The catalog column identifier
    ColumnId id;
    # Column named by the user
    UserColumName userColumName;
    # Indicates the configuration applied on the column (catalog or custom) during the importation process.
    ColumnConfiguration configuration;
    CatalogColumnName[] catalogColumnDependencies?;
    CustomColumnLinks links;
};

# Invoice Prefix. Can contain 1 to 50 characters, with alphanumeric characters in lowercase uppercase and #, _, -
public type InvoicePrefix string;

# Publish the catalog to the marketplace
public type PublishCatalogToMarketplaceRequest record {
    # Define the publication strategy kind, for that you have 2 choices 
    # * Delta - This is the recommanded publication strategy kind, this strategy will push to the marketplace only the difference between your catalog and the previous published feeds done by BeezUP. 
    # * Full - If you want to force the publication of all your catalog feeds to the marketplace. 
    #       !WARNING! Depending to the marketplace this operation will purge the existing offers on the marketplace that are not in the catalog or unknown from the publication feed referential.
    PublicationStrategyKind publicationStrategyKind;
    # The Feed Type
    FeedType feedType;
    # In full publication strategy kind, for some marktetplace, you can ask to unpublish or not your existing feeds on the markeptlace absent from your exported catalog.
    boolean withUnpublish;
};

# The subscription definition
public type Subscription record {
    # The identifier of the subscription to the orders for a merchant
    SubscriptionId id;
    # The status of your subscription
    SubscriptionStatus status;
    # The URL <a href="https://en.wikipedia.org/wiki/URL">https://en.wikipedia.org/wiki/URL</a>
    HttpUrl targetUrl;
    # The subscription name you want to use
    SubscriptionName name;
    # The name of your application
    SubscriptionMerchantApplicationName merchantApplicationName;
    # The version of your application
    SubscriptionMerchantApplicationVersion merchantApplicationVersion;
    # Recover existing orders using the begin period order last modification date. If not set then you will receive new/updated orders in real-time.
    string recoverBeginPeriodOrderLastModificationUtcDate?;
    # Recover existing orders using the begin and the end period order last modification date.
    # Otherwise, you will receive new/updated orders in real-time.
    string recoverEndPeriodOrderLastModificationUtcDate?;
    # This modification date correspond to the last order pushed by your subscription consumer
    string lastOrderPushedModificationUtcDate?;
    # The date of the last pushed order successfully received by your subscription consumer
    string lastSuccessfulOrderPushedUtcDate?;
    # The subscription consumption status
    ConsumptionAvailabilityStatus consumerHealthStatus?;
    # This date indicates since when the subscription consumer is unavailable
    string consumerUnvailableSinceUtcDate?;
    # The last date we retry to send orders
    string lastRetryUtcDate?;
    # The retry count. When we the retry count will reach maximum retry count, the subscription will be deactivated.
    int retryCount?;
    # The maximum BeezUP will retry to push orders. When we the retry count will reach maximum retry count, the subscription will be deactivated.
    int maxRetryCount?;
    # The next scheduled  date we retry to send orders
    string nextScheduledRetryUtcDate?;
    # The email
    Email merchantEmailAlert?;
    ErrorResponseMessage lastErrorMessage?;
    # The URL <a href="https://en.wikipedia.org/wiki/URL">https://en.wikipedia.org/wiki/URL</a>
    HttpUrl consumerLastRequestSentUri?;
};

# Model for fetching a channel catalog marketplace setting
public type ChannelCatalogMarketplaceSetting record {
    # Channel catalog marketplace property name
    ChannelCatalogMarketplacePropertyName name;
    ChannelCatalogMarketplaceSettingDiscriminatorType discriminatorType;
};

public type AutoImportConfigurationLinks record {
    LinksAutoGetautoimportconfigurationlink self;
    LinksImportationActivateautoimportlink activate?;
    LinksAutoStartautoimportlink 'start?;
    LinksAutoPauseautoimportlink pause?;
    LinksAutoResumeautoimportlink resume?;
    LinksAutoConfigureautoimportintervallink scheduleInterval?;
    LinksAutoScheduleautoimportlink schedule?;
};

# The Publication Type
public type PublicationType string;

# The response given by the batch operation
public type BatchOrderOperationResponse record {
    OrderOperationResponse[] operations;
};

public type LinksImportationCommitcolumnslink record {
    *BeezupCommonLink3;
};

public type CategoryMappingStatus string;

# Indicates how global actions you can do like how to create a channel catalog, exclusion filter operators, etc...
public type LegacyTrackingChannelCatalogListLinks record {
    LinksGetlegacytrackingchannelcatalogslink self?;
};

# Describe the conditions of a contract
public type ContractInfo record {
    # The trial period in month
    int trialPeriodInMonth?;
    # The percent discount related to the billing period
    decimal billingPeriodPercentDiscount?;
    # The discount duration in month
    int discountDurationInMonth?;
    # The percent of the discount
    decimal percentDiscount?;
    # The offer id based on /offers. Not a free offer of course.
    OfferId offerId?;
    # The store count you want to have in your contract.
    StoreCount storeCount?;
    # The start date of your contract
    string startUtcDate?;
    # The calculated end date of commitment
    string commitmentCalculatedFinishUtcDate?;
    # The billing period in month
    int billingPeriodInMonth?;
    # The fixed price of your contract
    decimal fixedPrice?;
    # The offer name based on /offers
    string offerName?;
    # The currency code <a href="https://en.wikipedia.org/wiki/ISO_4217">(ISO 4217)</a>
    BeezupCommonCurrencycode currencyCode?;
    # Your contract identifier
    ContractId contractId?;
    # The commitment period in month
    int commitmentPeriodInMonth?;
    # The click included
    int clickIncluded?;
    # Additional click price
    decimal additionalClickPrice?;
    # The IP of the user who creates the contract
    string ipUserCreation?;
    # The IP of the user who modified the contract
    string ipUserModification?;
    # Internal usage: Old offer type. Describe the fix and variable model information
    FixedAndVariableClickModelInfo fixedAndVariableClickInfo?;
    # Internal usage: Old offer type. Describe the fix and variable model information
    VariableModelInfo variableModelInfo?;
    # Is commitment is automatically renewed
    boolean isCommitmentRenewalAutomatically?;
    # The end of your discount
    string discountEndUtcDate?;
    # Is the contract is modifiable ?
    boolean isModifiableContract?;
};

public type ReportByDayByChannel record {
    *ReportByDayAllChannels;
    # The basic info related to a channel
    BeezupCommonChannelbasicinfo channel;
};

# The message contains the offer identifier required to execute this operation
public type UpgradeOfferRequired record {
    # The offer identifier required
    int offerId;
};

# Indicates the operator you want to apply on this indicator
public type PerformanceIndicatorFilterOperatorName string;

public type Link3 record {
    # The label corresponding to the link. This label is automatically translated based on the Accept-Language http header.
    string label?;
    # The documentation related to this operation.
    DocUrl docUrl?;
    # The description of the link
    string description?;
    # Indicate the relative uri for this link
    Href href;
    # The operationId to call.
    OperationId operationId?;
    # Indicate the http method to use on this link
    HttpMethod method?;
    LinkParameter3Types parameters?;
    # indicates whether the href is templated or not
    boolean urlTemplated?;
    # indicates whether all required params have been provided
    boolean allRequiredParamsProvided?;
    # indicates whether all optionals params have been provided
    boolean allOptionalParamsProvided?;
    InfoSummaries info?;
    # Indicate the relation name related to the link
    string rel?;
};

public type Rule record {
    # The identifier of the rule
    string ruleId;
    # The name of the rule
    string ruleName;
    # The status of the last execution
    RuleLastExecutionStatus lastExecutionStatus?;
    # The utc date of the last execution
    string lastExecutionUtcDate?;
    # The optimisation action
    OptimisationActionName actionName;
    # Report filter identifier linked to the rule
    string reportFilterId;
    # Rule execution position
    int position;
    # Is the rule enabled
    boolean enabled;
    # Rule validity start utc date
    string validityStartUtcDate?;
    # Rule validity end utc date
    string validityEndUtcDate?;
    # Links to retrieve/action on other entities
    RuleLinks links;
};

public type StoreAlertPropertyInfo record {
    *StoreAlertProperty;
    # The property name of the alert
    string propertyName;
    # The regular expression related to the alert property
    string propertyValidationExpression?;
};

public type PaginationResult record {
    # The entry count currently returned
    int entryCount;
    # The page count
    int pageCount;
    # The total entry count
    int totalEntryCount;
    # The navigation links 'first', 'last', 'next', 'previous'
    PaginationResultLinks links;
};

# The status of the last execution
public type RuleLastExecutionStatus string;

public type LinksSavestorealertslink record {
    *BeezupCommonLink3;
};

public type LinksOptimisebyproductlink record {
    *BeezupCommonLink3;
};

# The subscription push reporting
public type SubscriptionPushReporting record {
    # The identifier of the subscription to the orders for a merchant
    SubscriptionId subscriptionId;
    # The message identifier. It's a guid.
    MessageId eventId;
    # Indicates if the push operation has succeed
    boolean succeed;
    # This modification date correspond to the last order pushed by your subscription consumer
    string lastOrderModificationUtcDate;
    # The retry count. When we the retry count will reach maximum retry count, the subscription will be deactivated.
    int retryCount?;
    # The maximum BeezUP will retry to push orders. When we the retry count will reach maximum retry count, the subscription will be deactivated.
    int maxRetryCount?;
    # The next scheduled  date we retry to send orders
    string nextScheduledRetryUtcDate?;
    ErrorResponseMessage errorMessage?;
    # The URL <a href="https://en.wikipedia.org/wiki/URL">https://en.wikipedia.org/wiki/URL</a>
    HttpUrl requestUri?;
    # The URL <a href="https://en.wikipedia.org/wiki/URL">https://en.wikipedia.org/wiki/URL</a>
    HttpUrl responseUri?;
    # The order count sent
    int orderCount;
    # The duration of the push operation
    string duration;
    # The HTTP status received from the consumer
    int httpStatus?;
};

public type LinksGetruleslink record {
    *BeezupCommonLink3;
};

# The key is the StoreId.
public type ReportByDayPerStoreResponse record {
};

public type ReportByCommonResponseLinks record {
    LinksOptimisealllink enableAllProducts?;
    LinksOptimisealllink disableAllProducts?;
    LinksOptimiselink enableProducts?;
    LinksOptimiselink disableProducts?;
};

# Indicate on which indicator or value you want to make your formula
public type PerformanceIndicatorFormulaParameterType string;

# Describe the pricing information related to the offer.
public type ContractMoneyInfo record {
    # The amount excluding taxes and excluding code promo discount including billing period discount.
    decimal amountExcludingTaxesAndExcludingCodePromoDiscountIncludingBillingPeriodDiscount?;
    # The amount excluding taxes including discounts.
    decimal amountExcludingTaxesIncludingDiscounts?;
    # The taxes excluding discount including billing period discount.
    decimal amountTaxesExcludingDiscountIncludingBillingPeriodDiscount?;
    # The amount including taxes excluding discount including billing period discount.
    decimal amountIncludingTaxesExcludingDiscountIncludingBillingPeriodDiscount?;
    # The currency code <a href="https://en.wikipedia.org/wiki/ISO_4217">(ISO 4217)</a>
    BeezupCommonCurrencycode currencyCode?;
    # The VAT percent.
    decimal vatPercent?;
    # The amount excluding taxes including discounts per month.
    decimal amountExcludingTaxesIncludingDiscountsPerMonth?;
    # The amount excluding taxes and excluding discounts.
    decimal amountExcludingTaxesAndExcludingDiscounts?;
    # Taxes including discounts.
    decimal amountTaxesIncludingDiscounts?;
    # The amount including taxes including discounts.
    decimal amountIncludingTaxesIncludingDiscounts?;
    # The initial offer fixed price.
    decimal initialOfferFixedPrice?;
};

public type LinksGetpubliclistofvalueslink record {
    *BeezupCommonLink3;
};

public type LinksClearmerchantorderinfov3link record {
    *Link3;
};

public type AccountInfo record {
    # The user identifier
    BeezupCommonUserid userId;
    # The email
    BeezupCommonEmail email;
    PersonalInfo personalInfo?;
    # The account status
    # * Active:  When the account is active
    # * SystemBlocked:  When all stores on the account are blocked by the system
    # * UserBlocked: When all stores on the account are blocked on GO not on the system
    # * NotActivated: When the email is not verified
    AccountStatus status;
    CompanyInfo companyInfo?;
    # Indicate the url of your picture profil
    ProfilePictureUrl profilePictureUrl?;
    # The different actions you can make on this account
    AccountInfoLinks links;
    BeezupCommonInfosummaries info?;
};

# The report type
public type ReportType string;

public type RegisterRequest record {
    # Your email. We refuse disposable email.
    string email;
    # The password you want to use for your new account. \
    # The password length must be greater or equals to 6 and lower or equals to 128. \
    # The password must contains at least one number and one special character
    string password;
    # Can be null. Default: en-GB. The culture name you want to use. FYI. \
    # The email activation will use this culture.
    string cultureName?;
    # The user id of your commercial in BeezUP.
    string commercialOwnerUserId?;
};

# The value type of the parameter
public type ParameterType string;

# The documentation related to this operation.
public type DocUrl string;

# Internal usage: Old offer type. Describe the fix and variable model information
public type FixedAndVariableClickModelInfo record {
    ClickIncludedAndAdditionalClickPrice[] clickIncludedAndAdditionalClickPrices;
};

public type ReportFilterHeaderLinks record {
    LinksGetreportfilterlink self;
};

# The channel column configuration. The BeezUP Column Name is optional. If the BeezUP column is mapped we will indicate the data type and column importance of the BeezUP column.
public type ChannelColumnConfiguration record {
    # Importance of the column
    BeezupCommonColumnimportance columnImportance;
    # Data type of the column, will be used for parsing and for consolidation proces
    BeezupCommonColumndatatype columnDataType;
    # The BeezUP column name
    BeezupCommonBeezupcolumnname beezUPColumnName?;
};

# Indicate the relative uri for this link
public type Href string;

public type RuleExecutionReportings record {
    # The rules executions history
    RuleExecutionReporting[] executions?;
    BeezupCommonPaginationresult paginationResult?;
};

# The message request for the change user column name
public type ChangeUserColumnNameRequest record {
    # Column named by the user
    UserColumName userColumName;
};

# If non null, format used to parse the value to the storage type of this column\r\n will be used for parsing and for consolidation proces
public type ColumnFormat string;

# The Data Type
public type Type string;

public type PublicChannelInfo record {
    # The channel name
    string name;
    # The channel home url
    string homeUrl;
    # The channel logo url
    string logoUrl;
    # The type list related to a channel
    string[] types;
    # The sector list related to a channel
    string[] sectors?;
};

public type LinksGetchannelcatalogproductinfolistlink record {
    *BeezupCommonLink3;
};

# Contains all change order operations you want to make.  (max 100 items per call)
public type ChangeOrderListRequestV2 record {
    # The change order operations
    ChangeOrderListRequestItemV2[] changeOrders;
};

public type RuleExecutionReporting record {
    # The rule identifier
    string ruleId;
    # The name of the rule
    string ruleName;
    # The start utc date of the execution of the rule
    string startedUtcDate?;
    # The completed utc date of the execution of the rule
    string completedUtcDate?;
    # The status of the execution of the rule
    RuleExecutionReportingStatus status;
    # The error type for this execution if any
    RuleExecutionReportingErrorType errorType?;
    # The count of affected products, active or not
    int affectedProductCount?;
    # The count of affected active products
    int activeAffectedProductCount?;
    # The count of affected Channels across all products
    int affectedChannelCount?;
    # The optimisation action
    OptimisationActionName optimisationActionName?;
    # The userId that executed the rule if any
    string userId?;
    # The requestor type for the execution of the rule
    RuleExecutionReportingExecutionSource executionSource;
    # The url for the excel report for this execution
    string reportUrl?;
    # Links to retrieve/action on this rule execution
    RuleExecutionReportingLinks links?;
};

# Describe how to read the file. If FileFormatStrategy is CSV, csvFileReadProperties is required. Otherwise the xmlFileReadProperties is required.
public type InputFileReadConfiguration record {
    # CSV or XML
    FileFormatStrategy format;
    # The encoding type. UTF-8 by default.
    string encodingTypeName = "UTF-8";
    # The culture name of the file.  (i.e. fr-FR). If null then Invariant culture will be used.
    string cultureName = "";
    # The CSV file description
    InputFileReadCsvConfiguration csvFileReadProperties?;
    # The XML file description
    InputFileReadXmlConfiguration xmlFileReadProperties?;
};

# Internal usage: Old offer type. Describe the fix and variable model information
public type VariableModelInfo record {
    # Click included with variable pricing information
    ClickIncludedAndVariablePrice[] clickIncludedAndVariablePrices;
    # The overflow click count
    int overflowClickCount;
    # The overflow click price
    decimal overflowClickPrice;
};

# If non null, culture used to parse the value to the storage type of this column\r\n will be used for parsing and for consolidation proces
public type ColumnCultureName string;

public type LinksGetprofilepictureinfolink record {
    *BeezupCommonLink3;
};

public type GenerateOrderInvoiceRequest record {
    # Invoice Sequence Number
    InvoiceSequenceNumber invoiceSequenceNumber?;
};

# The account status
# * Active:  When the account is active
# * SystemBlocked:  When all stores on the account are blocked by the system
# * UserBlocked: When all stores on the account are blocked on GO not on the system
# * NotActivated: When the email is not verified
public type AccountStatus string;

# Describe a product sample
public type ProductSample record {
    # The key is the column identifier
    ProductValues productValues?;
};

public type StoreAlertProperty record {
    # The property identifier of the alert
    AlertPropertyId propertyId;
    # The property value
    AlertPropertyValue propertyValue;
};

# Contains the order identifier and the change order request
public type ChangeOrderListRequestItemV2 record {
    OrderIdentifier 'order;
    # All properties with the prefix order_ are translated in the list of values /user/lov#OrderMetaInfoPosted
    ChangeOrderRequest changeOrderRequest?;
};

# Describe the history related to an order
public type OrderHistory record {
    # The list of change order operation
    ChangeOrderReporting[] changeOrderReportings?;
    HarvestOrderReporting[] harvestOrderReportings?;
    string lastModificationUtcDate?;
};

public type Order record {
    *OrderHeader;
    OrderLinks links;
    # Useful to identify the origin of the order. For example in Amazon.
    string order_MarketPlaceChannel?;
    # The total tax of this order
    decimal order_TotalTax?;
    # The total commission of this order
    decimal order_TotalCommission?;
    # The payment method of this order
    string order_PaymentMethod?;
    # The UTC date of the payment of this order
    string order_PayingUtcDate?;
    # The comment associated to this order
    string order_Comment?;
    # Order Shipping first name
    string order_Shipping_FirstName?;
    # Order Shipping last name
    string order_Shipping_LastName?;
    # The civility of the person in the shipping address for this order
    string order_Shipping_Civility?;
    # The company name of the shipping address for this order
    string order_Shipping_CompanyName?;
    # The name of the person in the shipping address for this order
    string order_Shipping_AddressName?;
    # The email of the person in the shipping address for this order
    string order_Shipping_Email?;
    # The shipping address line 1 of this order
    string order_Shipping_AddressLine1?;
    # The shipping address line 2 of this order
    string order_Shipping_AddressLine2?;
    # The shipping address line 3 of this order
    string order_Shipping_AddressLine3?;
    # The shipping address postal code of this order
    string order_Shipping_AddressPostalCode?;
    # The shipping address city of this order
    string order_Shipping_AddressCity?;
    # The shipping address state or region of this order
    string order_Shipping_AddressStateOrRegion?;
    # The shipping address country name
    string order_Shipping_AddressCountryName?;
    # The shipping address country iso code alpha 2 (see http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#/decoding_table for more details)
    string order_Shipping_AddressCountryIsoCodeAlpha2?;
    # The phone number of the person in the shipping address for this order
    string order_Shipping_Phone?;
    # The mobile phone number of the person in the shipping address for this order
    string order_Shipping_MobilePhone?;
    # The shipping price of this order
    decimal order_Shipping_Price?;
    # The shipping method of this order
    string order_Shipping_Method?;
    # The shipping tax for this order
    decimal order_Shipping_ShippingTax?;
    # The UTC date of the earliest ship for this order
    string order_Shipping_EarliestShipUtcDate?;
    # The UTC date of the latest ship for this order
    string order_Shipping_LatestShipUtcDate?;
    # The buyer identifier for this order
    string order_Buyer_Identifier?;
    # Order Buyer first name
    string order_Buyer_FirstName?;
    # Order Buyer last name
    string order_Buyer_LastName?;
    # The buyer civility for this order
    string order_Buyer_Civility?;
    # The buyer company name for this order
    string order_Buyer_CompanyName?;
    # The email of the buyer for this order
    string order_Buyer_Email?;
    # The Buyer address line 1 of this order
    string order_Buyer_AddressLine1?;
    # The Buyer address line 2 of this order
    string order_Buyer_AddressLine2?;
    # The Buyer address line 3 of this order
    string order_Buyer_AddressLine3?;
    # The Buyer address postal code of this order
    string order_Buyer_AddressPostalCode?;
    # The Buyer address city of this order
    string order_Buyer_AddressCity?;
    # The Buyer address state or region of this order
    string order_Buyer_AddressStateOrRegion?;
    # The Buyer address country name
    string order_Buyer_AddressCountryName?;
    # The Buyer address country iso code alpha 2 (see http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#/decoding_table for more details)
    string order_Buyer_AddressCountryIsoCodeAlpha2?;
    # The phone number of the buyer for this order
    string order_Buyer_Phone?;
    # The mobile phone number of the buyer for this order
    string order_Buyer_MobilePhone?;
    # Indicates if the order is considered as Prime (only on Amazon)
    boolean order_IsPrime?;
    # The order FulfilledBy
    string order_FulfilledBy?;
    # The order IsBusiness
    boolean order_IsBusiness?;
    # Technical information: The url to the source of this order. We received this information from the marketplace.
    string order_OrderSourceUri?;
    # Technical information: The url to the source of this order items. We received this information from the marketplace.
    string order_OrderItemsSourceUri?;
    OrderItem[] orderItems;
    # Contains the authorized change actions for an order
    OrderTransitionLinks transitionLinks;
};

public type ErrorResponseMessage record {
    UserErrorMessage[] errors;
};

# Describe the basic information related to an order. All properties with the prefix order_ are translated in the list of values /user/lov/OrderMetaInfoOrderDetails
public type OrderHeader record {
    # The technical code of the marketplace.
    BeezupCommonMarketplacetechnicalcode marketplaceTechnicalCode;
    # The marketplace account identifier in BeezUP. This account identifier is based on your api settings.
    AccountId accountId;
    # The BeezUP Order identifier
    BeezUPOrderId beezUPOrderId;
    # The URL <a href="https://en.wikipedia.org/wiki/URL">https://en.wikipedia.org/wiki/URL</a>
    BeezupCommonHttpurl beezUPOrderUrl?;
    # In an marketplace technical code like CDiscount you can have several marketplaces like GO SPORT, etc. We identify them by a business code.
    BeezupCommonMarketplacebusinesscode marketplaceBusinessCode;
    # The order marketplace identifier
    MarketplaceOrderId order_MarketplaceOrderId;
    # BeezUP order status. Unified for all marketplaces.
    BeezUPOrderStatus order_Status_BeezUPOrderStatus;
    # The marketplace order state
    MarketplaceOrderStatus order_Status_MarketplaceOrderStatus?;
    # The order merchant identifier
    OrderMerchantorderid order_MerchantOrderId?;
    # The e-commerce software name of the merchant
    OrderMerchantecommercesoftwarename order_MerchantECommerceSoftwareName?;
    # The e-commece software version of the merchant
    OrderMerchantecommercesoftwareversion order_MerchantECommerceSoftwareVersion?;
    # The purchase date of this order
    string order_PurchaseUtcDate;
    # The last modification UTC date done by BeezUP of this order
    string order_LastModificationUtcDate;
    # The last modification UTC date done by the marketplace on this order
    string order_MarketplaceLastModificationUtcDate;
    # Buyer full name
    OrderBuyerName order_Buyer_Name?;
    # The total price of this order (corresponding to the amount paid by the customer)
    decimal order_TotalPrice?;
    # The currency code <a href="https://en.wikipedia.org/wiki/ISO_4217">(ISO 4217)</a>
    BeezupCommonCurrencycode order_CurrencyCode?;
    # The order invoice number
    string order_Invoice_Number?;
    # The order invoice URI
    string order_Invoice_Uri?;
    # If true, there is currently a harvest or an order change in progress. Otherwise false.
    Processing processing;
    # ETag value to identify the order.\
    # This information is required for the operation GetOrder and ChangeOrder.\
    # For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3
    Etag etag;
    OrderHeaderLinks links;
};

public type LinksImportationMapcatalogcolumnlink record {
    *BeezupCommonLink3;
};

# Shipping cost VAT in percent
@constraint:Number {maxValue: 100}
public type ShippingVATPercent decimal;

# Indicate the item count per page
@constraint:Int {minValue: 25, maxValue: 100}
public type BeezupCommonPagesize int;

public type LinksImportationDeletecustomcolumnlink record {
    *BeezupCommonLink3;
};

public type ChannelCatalogColumnMappingWithName record {
    *ChannelCatalogColumnMapping;
    # The channel column name
    BeezupCommonChannelcolumnname channelColumnName;
    # The BeezUP column name
    BeezupCommonBeezupcolumnname channelBeezUPColumnName?;
    # The catalog column named by the user (catalog or custom column)
    BeezupCommonCatalogcolumnusername catalogColumnName?;
    # The BeezUP column name
    BeezupCommonBeezupcolumnname catalogBeezUPColumnName?;
};

# Indicates the differents actions you can do on a channel product
public type ChannelCatalogProductInfoLinks record {
    LinksGetchannelcatalogproductinfolink self;
    LinksOverridechannelcatalogproductvalueslink override;
    LinksDisablechannelcatalogproductlink disable?;
    LinksReenablechannelcatalogproductlink reenable?;
};

public type UserListOfValuesResponseLinks record {
    LinksGetuserlistofvalueslink self?;
};

# Payment method
public type PaymentMethod string;

# The action you can do on the category mappings
public type ChannelCatalogCategoryMappingsLinks record {
    LinksGetchannelcatalogcategorieslink self;
    LinksDisablechannelcatalogcategorymappinglink disable?;
    LinksReenablechannelcatalogcategorymappinglink reenable?;
};

public type ReportByChannelRequest record {
    *OrderedReportFilterCommonParameters;
    *PaginationRequestParameters;
};

public type CompanyInfo record {
    # Your address
    Address address;
    # Your address postal code
    PostalCode postalCode;
    # Your address city
    City city;
    # The country iso code alpha 3 <a href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3">(ISO 3166-1_alpha-3)</a>
    BeezupCommonCountryisocodealpha3 countryIsoCodeAlpha3;
    # Your company name
    Company company;
    # Your company VATNumber. Used for french company. This number is checked with official web service before being saved.
    VatNumber vatNumber?;
    # Your company accounting emails
    AccountingEmails accountingEmails?;
};

public type LinksOptimisebycategorylink record {
    *BeezupCommonLink3;
};

public type OrderHeaderWithLinks record {
    *OrderHeader;
    OrderHeaderLinks links;
};

# The channel catalog marketplace settings to save
public type SetChannelCatalogMarketplaceSettingsRequest record {
    ChannelCatalogMarketplaceSettingArray settings;
};

public type TrackedExternalOrder record {
    # The utc date of the external order
    string utcDate;
    # The merchant order identifier
    string merchantOrderId;
    # Can be null. The visitor identifier of the external order
    string visitorId?;
    # The total amount of the external order
    decimal totalAmount;
    # The currency code <a href="https://en.wikipedia.org/wiki/ISO_4217">(ISO 4217)</a>
    BeezupCommonCurrencycode currencyCode;
    # Indicate if the payment of this external order has been validated or not
    boolean paymentValidated;
    # Can be null. The product list included in the external order
    TrackedExternalOrderProduct[] products?;
};

public type BeezupCommonExceptiondetail record {
    string helpLink?;
    string message?;
    string stackTrace?;
    string 'type?;
};

# Your address postal code
public type PostalCode string;

public type LinksClearchannelcatalogexportationcachelink record {
    *BeezupCommonLink3;
};

# The action links for this store
public type StoreLinks record {
    LinksGetstorelink self?;
    LinksDeletestorelink deleteStore?;
    LinksUpdatestorelink updateStore?;
    LinksGetstoreshareslink shares?;
    LinksSharestorelink share?;
};

# The request message to get products based on these filters
public type GetProductsRequest record {
    # Indicates the page number
    BeezupCommonPagenumber pageNumber;
    # Indicate the item count per page
    BeezupCommonPagesize pageSize;
    @constraint:Array {maxLength: 5, minLength: 1}
    BeezupCommonCatalogcolumnid[] columnIdList?;
    # Search for existing products or not. If null you will received both.
    boolean exists?;
    # Filter with a list of product identifier
    BeezupCommonProductid[] productIdList?;
    # Search for product by sku
    string sku?;
    # Search for product by ean
    string ean?;
    # Search for product by mpn
    string mpn?;
    # Search for products containing this title
    string title?;
    # The catalog category path
    BeezupCommonCatalogcategorypath categoryPath?;
    # The catalog column identifier (catalog or custom column)
    BeezupCommonCatalogcolumnid orderByCatalogColumnId?;
    # Do not retrieve sub categories. By default, this value is set to false
    boolean withoutSubCategories?;
};

# Products optimisatisation copied
public type CopyOptimisationResponse record {
    # The basic info related to a channel
    BeezupCommonChannelbasicinfo channel;
    # The catalog product count
    int catalogProductCount;
    # The enabled product count
    int enabledProductCount;
};

# Describe how you want to manage the duplication of the product value
public type DuplicateProductValueConfiguration record {
    # Indicate the duplicate product sku strategy.
    DuplicateProductValueStrategy strategy;
    # Indicate how the product sku are compared for the duplication check.
    CompareOptions compareOptions;
};

public type StoreSharesLinks record {
    LinksGetstoreshareslink self?;
    LinksSharestorelink share?;
};

public type DetectedCatalogColumnLinks record {
    LinksImportationConfigurecatalogcolumnlink configure?;
    LinksImportationIgnorecolumnlink ignore?;
    LinksImportationReattendcolumnlink reattend?;
    LinksImportationMapcatalogcolumnlink 'map?;
    LinksImportationUnmapcatalogcolumnlink unmap?;
};

# The product identifier
public type BeezupCommonProductid string;

public type LinksGetreportfilterlink record {
    *BeezupCommonLink3;
};

# The catalog category identifier
public type BeezupCommonCatalogcategoryid string;

# The marketplace account identifier in BeezUP. This account identifier is based on your api settings.
public type BeezupCommonMarketplaceaccountid int;

public type SetMerchantOrderInfoRequest record {
    # The order merchant identifier
    OrderMerchantorderid order_MerchantOrderId;
    # The e-commerce software name of the merchant
    OrderMerchantecommercesoftwarename order_MerchantECommerceSoftwareName;
    # The e-commece software version of the merchant
    OrderMerchantecommercesoftwareversion order_MerchantECommerceSoftwareVersion;
};

# Indicates the actions you can do on a channel catalog
public type ChannelCatalogLinks record {
    LinksGetchannelcataloglink self;
    LinksDeletechannelcataloglink delete?;
    LinksEnablechannelcataloglink enable?;
    LinksDisablechannelcataloglink disable?;
    LinksConfigurechannelcataloggeneralsettingslink configureGeneralSettings?;
    LinksConfigurechannelcatalogcostsettingslink configureCostSettings?;
    LinksConfigurechannelcatalogcolumnmappingslink configureColumnMappings?;
    LinksReenablechannelcatalogcategorymappinglink reenableCategoryMappings?;
    LinksDisablechannelcatalogcategorymappinglink disableCategoryMappings?;
    LinksGetchannelcatalogcategorieslink categoryMappings?;
    LinksGetchannelcatalogexclusionfilterslink exclusionFilters?;
    LinksGetchannelcatalogproductinfolistlink products?;
    LinksGetchannelcatalogexportationcacheinfolink exportationCacheInfo?;
    ExternallinksGetchannelcatalogmarketplacesettingslink marketplaceSettings?;
    ExternallinksGetchannelinfolink channelInfo?;
};

# The operationId to call.
public type OperationId string;

# The CSV file description
public type InputFileReadCsvConfiguration record {
    # Indicate if the csv file contains the column name at the first row
    boolean hasHeaderRecord;
    # Indicate if the importation should not use the csv column name from the file
    boolean ignoreHeaderRecord;
    # Indicate the separator of the values in the CSV file. Generally ";"
    CsvSeparator csvSeparator;
    # Indicate the text qualifier of the CSV file. Generally the value is "
    string csvTextQualifier = "\"";
};

public type LinksGetstoretrackingstatuslink record {
    *BeezupCommonLink3;
};

public type LinksConfigurechannelcatalogcolumnmappingslink record {
    *BeezupCommonLink3;
};

public type AutomaticTransitionInfo record {
    *AutomaticTransition;
    # In an marketplace technical code like CDiscount you can have several marketplaces like GO SPORT, etc. We identify them by a business code.
    BeezupCommonMarketplacebusinesscode marketplaceBusinessCode;
    # BeezUP order status. Unified for all marketplaces.
    BeezUPOrderStatus beezUPOrderStatus;
    BusinessOperationType businessOperationType;
    AutomaticTransitionInfoLinks links?;
};

# Contains the authorized change actions for an order
public type OrderTransitionLinks LinksChangeorderlink[];

public type UserListOfValuesResponse record {
    UserListOfValuesResponseLinks links?;
    BeezupCommonListofvalueitem[] items?;
};

public type OfferContent record {
    # Describe the prorata info based on your previous invoice
    PreviousFixPeriodInvoiceProrataInfo previousFixPeriodInvoiceProrataInfo;
    # Describe the billing period information related to the offer.
    ContractBillingPeriodInfo contractBillingPeriodInfo;
    # Describe the click information related to the offer.
    ContractClickInfo contractClickInfo;
    # Describe the commitment information related to the offer.
    ContractCommitmentInfo contractCommitmentInfo;
    # Describe the discount information related to the offer.
    ContractDiscountInfo contractDiscountInfo;
    # Describe the pricing information related to the offer.
    ContractMoneyInfo contractMoneyInfo;
    # Describe the store information related to the offer.
    ContractStoreInfo contractStoreInfo;
    # Describe the bonus information related to your current contract.
    ContractBonusInfo contractBonusInfo;
    # The contract termination reason type identifier, if your current contract is scheduled to be terminated. The value is based on the list of values /user/lov/ContractTerminationReason
    ContractTerminationReasonType contractTerminationReasonType?;
    # The termination reason, if your current contract is scheduled to be terminated.
    ContractTerminationReason contractTerminationReason?;
    # Internal usage: Indicates if we have to notify you about VAT exemption.
    boolean notifyVatExemption;
};

public type LinksDisablechannelcatalogproductlink record {
    *BeezupCommonLink3;
};

# The Analytics API operation index.
public type AnalyticsIndex record {
    AnalyticsStoreIndex[] stores;
    AnalyticsIndexLinks links;
    AnalyticsIndexLovLinks lovLinks?;
};

# The documentation related to this operation.
public type BeezupCommonDocurl string;

public type ColumnMappingStatus string;

# The order list with minimum information we have from the orders.\
# The paginationResult properties can be null if the list is empty.
public type OrderListLight record {
    BeezupCommonPaginationresult paginationResult?;
    OrderHeader[] orders;
    OrderListLightLinks links;
};

public type LinksGetorderlistlightv3link record {
    *Link3;
};

public type Store record {
    # The store identifier
    BeezupCommonStoreid storeId;
    # The store name. Must be unique.
    StoreName name;
    # The url of your store
    StoreUrl url;
    # The country iso code alpha 3 based on the list of values /user/lov/StoreCountry
    StoreCountryIsoCodeAlpha3 countryIsoCodeAlpha3;
    # The currency code <a href="https://en.wikipedia.org/wiki/ISO_4217">(ISO 4217)</a>
    BeezupCommonCurrencycode currencyCode;
    # The store's sectors based on the list of values /user/lov/ParamSector
    StoreSectors sectors;
    # Indicates the role can have a user on a store.
    # * Owner: Indicates that you are the owner of this store
    # * User: Indicates that you are a simple user on this store
    StoreUserRole userRole;
    # The store status
    # * Active:  When the store is active
    # * SystemBlocked:  When the store is blocked by the system
    # * UserBlocked: When the store is blocked on GO not on the system
    StoreStatus status;
    # The user id of the owner of the store
    string ownerUserId;
    # The offer id based on /offers. Not a free offer of course.
    OfferId offerId;
    # The offer Name
    string offerName;
    # The share count related to this store
    int shareCount;
    # The creation date of the store
    string creationUtcDate;
    # The version of GO to use
    int goVersion;
    # The action links for this store
    StoreLinks links;
    # Is the store a test or a production store
    boolean isTest;
};

# Represent a catalog product
public type Product record {
    # The product identifier
    BeezupCommonProductid productId;
    # The catalog category identifier
    BeezupCommonCatalogcategoryid categoryId;
    # The key is the column identifier
    ProductValues values;
    # Indicates if the product exists in the current catalog
    boolean exists;
};

public type LinksCatalogChangecatalogcolumnusernamelink record {
    *BeezupCommonLink3;
};

# The channel catalog marketplace settings
public type ChannelCatalogMarketplaceSettings record {
    ChannelCatalogMarketplaceSettingsLinks links;
    ChannelCatalogMarketplaceSetting[] settings;
};

# The contract termination reason type identifier, if your current contract is scheduled to be terminated. The value is based on the list of values /user/lov/ContractTerminationReason
public type ContractTerminationReasonType int;

public type ChannelCatalogExportationHistoryLinks record {
    LinksGetchannelcatalogexportationhistorylink self?;
};

public type LinksConfigurechannelcatalogexclusionfilterslink record {
    *BeezupCommonLink3;
};

# Get Importation Products Report Response
public type GetImportationProductsReportResponse record {
    BeezupCommonPaginationresult paginationResult;
    # Product Errors
    ProductErrors productErrors?;
};

public type BonusInfo record {
    BonusType bonusType;
    decimal amount;
};

# The execution identifier
public type ExecutionUUID string;

public type LinksGetlegacytrackingchannelcatalogslink record {
    *BeezupCommonLink3;
};

# The BeezUP column name
public type BeezupCommonBeezupcolumnname string;

@constraint:Array {maxLength: 1}
public type ProductColumnsToDisplay BeezupCommonCatalogcolumnid[];

public type LinksCatalogGetcustomcolumnexpressionlink record {
    *BeezupCommonLink3;
};

# Product overrides compatibilites list
public type ProductOverridesCopyResponse record {
};

# Indicate which direction to order results by
public type OrderByDirection string;

# The request message to change the custom column expression
public type ChangeCustomColumnExpressionRequest record {
    # The encrypted excel expression of the column
    EncryptedExpression encryptedExpression;
    # The encrypted XML Blockly representation of the expression
    EncryptedBlocklyExpression encryptedBlocklyExpression;
};

public type SetMerchantOrderInfoListRequestItem record {
    *OrderIdentifier;
    # The order merchant identifier
    OrderMerchantorderid order_MerchantOrderId;
};

# Indicate the order count per page
@constraint:Int {minValue: 25, maxValue: 100}
public type PageSize int;

# The URL <a href="https://en.wikipedia.org/wiki/URL">https://en.wikipedia.org/wiki/URL</a>
public type BeezupCommonHttpurl string;

public type LinksSharestorelink record {
    *BeezupCommonLink3;
};

# Get Importation Report Response
public type GetImportationReportResponse record {
    # The execution identifier of the catalog importation
    ExecutionId executionId;
    GetImportationReportResponseImportationInfo importationInfo;
    GetImportationReportResponseDiff columns?;
    GetImportationReportResponseDiff categories?;
    GetImportationReportResponseDiff products?;
    GetImportationReportResponseProductMetrics productMetrics?;
    GetImportationReportResponseErrors errors;
};

# Links to retrieve/action on other entities
public type RuleLinks record {
    LinksGetrulelink self;
    LinksUpdaterulelink update?;
    LinksDeleterulelink delete?;
    LinksMoveuprulelink moveup?;
    LinksMovedownrulelink movedown?;
    LinksEnablerulelink enable?;
    LinksDisablerulelink disable?;
    LinksRunrulelink run?;
    LinksGetreportfilterlink reportFilter?;
};

# Indicate how you want to combine the filters:
# * funnel: You will get the products which meet at least one of the product set criterion. The criteria are applied in the following order:
#   - categorization
#   - exclusion filters
#   - deactivations
# * cumulative: You will get the products which have all the product set criteria
public type ProductSetVisibilityCriteriaLogicType string;

# This object indicates you the association between a channel catalog and a marketplace. The account identifier will be automatically defined based on your marketplace merchant identfier.
public type MarketplaceChannelCatalog record {
    BeezupCommonApisettingsstatus apiSettingsStatus;
    # The enabled status of the Channel Catalog
    boolean enabled;
    # The technical code of the marketplace.
    BeezupCommonMarketplacetechnicalcode marketplaceTechnicalCode;
    # In an marketplace technical code like CDiscount you can have several marketplaces like GO SPORT, etc. We identify them by a business code.
    BeezupCommonMarketplacebusinesscode marketplaceBusinessCode;
    # The marketplace identifier in the marketplace
    string marketplaceMarketPlaceId;
    # The marketplace country iso code alpha 2 (see http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Decoding_table for more details)
    string marketplaceIsoCountryCodeAlpha2;
    # The marketplace name
    record {} beezUPMarketplaceName;
    # The channel identifier
    BeezupCommonChannelid beezUPChannelId;
    # The channel catalog identifier
    BeezupCommonChannelcatalogid beezUPChannelCatalogId;
    # The store identifier
    BeezupCommonStoreid beezUPStoreId;
    # The store name
    string beezUPStoreName;
    # The marketplace merchant identifier list
    record {} marketplaceMerchantIdentifiers?;
    # The marketplace account identifier in BeezUP. This account identifier is based on your api settings.
    BeezupCommonMarketplaceaccountid marketplaceAccountId?;
    # Indicates the List Of Values related to the marketplace
    MarketplaceChannelCatalogLovLinks lovLinks;
    # Indicate the actions you can do on a channel catalog. If the settings are valid, you will be able to access to the publication history.
    MarketplaceChannelCatalogLinks links;
};

# The status of the execution of the rule
public type RuleExecutionReportingStatus string;

public type ChannelinfoTechnicalcontact record {
    # The technical contact name
    string name?;
    # The technical contact phone number
    string phoneNumber?;
    # The technical contact email
    string email?;
};

public type LinksGetchannelslink record {
    *BeezupCommonLink3;
};

# Contains common filter parameters
public type ReportFilterCommonParameters record {
    # The channel identifier
    BeezupCommonChannelid channelId?;
    # Indicates the period type we want use for the report filter
    ReportFilterPeriodType periodType;
    # The begin date period you want to get the report. It's required only in case of custom period type !
    string beginPeriodUtcDate?;
    # The end date period you want to get the report. It's required only in case of custom period type !
    string endPeriodUtcDate?;
    BeezupCommonCatalogcategoryfilter categoryFilter?;
    PerformanceIndicatorFilter[] performanceIndicatorFilters?;
    ReportAdvancedFilters advancedFilters;
};

public type CreditCardInfo record {
    # Card number
    CardNumber cardNumber;
    # Card Verification Code
    CardVerificationCode cardVerificationCode;
    # Expiration Month
    ExpirationMonth expirationMonth;
    # Expiration Year
    ExpirationYear expirationYear;
};

# The action links
public type ImportAlreadyInProgressResponseLinks record {
    LinksImportationGetimportationmonitoringlink currentImportation;
    LinksImportationCancellink cancelCurrentImportation;
};

# The channel category level starting from 1
@constraint:Int {minValue: 1, maxValue: 9}
public type ChannelCategoryLevel int;

# Indicate the default configuration of the cost on this channel.
public type ChannelCostSettings record {
    # CPC means cost per click.
    # CPA means cost per action.
    # You can have CPC/CPA with a global cost value.
    # You can have CPC/CPA by category the cost value MUST be null
    # You can have global fixed price.
    CostType costType;
    # In case of global cost type, you have to indicate the cost value.
    decimal globalCostValue?;
};

public type PublicLovIndex record {
    PublicLovIndexLinks links?;
};

public type LinksSetmerchantorderinfolistv3link record {
    *Link3;
};

public type LinksImportationConfigureremainingcatalogcolumnslink record {
    *BeezupCommonLink3;
};

public type OrderListRequest record {
    *OrderListRequestWithoutPagination;
    # Indicate the order count per page
    PageSize pageSize;
    # Indicates the page number
    PageNumber pageNumber;
};

public type LinksGetcustomerindexlink record {
    *BeezupCommonLink3;
};

# The channel column name
public type BeezupCommonChannelcolumnname string;

# The message request start a manual importation process. Indicate the way to handle duplicate product. Can be null if you want to reuse the configuration of the previous importation succeed.
public type StartManualImportRequest record {
    # Describe the input configuration
    InputConfiguration input;
    # Describe how you want to manage the duplication of the product value
    DuplicateProductValueConfiguration duplicateProductSkuConfiguration?;
};

# Indicate on which indicator or value you want to make your formula
public type PerformanceIndicatorType string;

public type LinksExportchannelcatalogproductinfolistlink record {
    *BeezupCommonLink3;
};

public type ChannelCatalogExportCacheInfo record {
    # The cache status
    string cacheStatus;
    # The last update UTC date of the cache
    string lastUpdateUtcDate?;
    # The last content change UTC date
    string lastContentChangeUtcDate?;
    # The expiration UTC date of the cache
    string expirationUtcDate?;
    # The feed url
    string feedUrl?;
};

public type LinksOverridechannelcatalogproductvalueslink record {
    *BeezupCommonLink3;
};

public type GetOrderInvoiceGeneralSettingsResponse record {
    *OrderInvoiceGeneralSettings;
    # Invoice Sequence Number
    InvoiceSequenceNumber lastInvoiceSequenceNumber?;
};

public type LinksGetinvoiceslink record {
    *BeezupCommonLink3;
};

public type LinksActivateuseraccountlink record {
    *BeezupCommonLink3;
};

public type BeezupCommonChannelcategoryfilter record {
    # Indicates on which channel category path you want to make the filter
    string[] categoryPath?;
};

public type ProductErrorCode record {
    # Error Code
    ErrorCode errorCode?;
    # Column named by the user
    UserColumName userColumName?;
    # The BeezUP column name
    BeezupCommonBeezupcolumnname beezUPColumnName?;
    string errorMessage?;
};

# The key is the alert identifier (alertId)
public type SaveStoreAlertsRequest record {
};

public type SaveStoreAlertRequest record {
    # Is the alert enable ?
    AlertEnabled enabled;
    # Properties to configure the alert
    StoreAlertProperty[] properties?;
};

public type LinksGetbillingperiodslink record {
    *BeezupCommonLink3;
};

public type StandardOffersLinks record {
    LinksGetstandardofferslink self;
};

public type ChannelCatalogMarketplaceSettingsLinks record {
    LinksGetchannelcatalogmarketplacesettingslink self;
    LinksSetchannelcatalogmarketplacesettingslink save;
};

public type LinksImportationGetproductsamplecustomcolumnvaluelink record {
    *BeezupCommonLink3;
};

public type RandomProductList record {
    Product[] products;
};

public type ExternallinksGetchannelcatalogmarketplacesettingslink record {
    *BeezupCommonLink3;
};

# The store's sectors based on the list of values /user/lov/ParamSector
public type StoreSectors StoreSector[];

public type LinksGetchannelcatalogproductvalueoverridecopylink record {
    *BeezupCommonLink3;
};

public type ExchangedMessagesItem record {
    string operationName;
    string requestUri?;
    string responseUri?;
    string requestUtcDate?;
    string responseUtcDate?;
};

public type LinkParameter3 record {
    # The label corresponding to the link parameter. This label is automatically translated based on the Accept-Language http header.
    string label?;
    # The value of the parameter. It can be an integer a string or an object.
    record {} value?;
    boolean required = false;
    # * path: if the parameter must be pass in the path uri
    # * header: if the parameter must be passed in http header
    # * query: if the parameter must be passed in querystring
    # * body: if the parameter must be passed in the body
    # * file: if the parameter must be passed in a multipart/form-data (https://swagger.io/docs/specification/2-0/file-upload/)
    ParameterIn 'in;
    # Describe the way you have to follow to get access to the LOV
    LOVLink3 lovLink?;
    # If true, you MUST indicate a value from the list of values otherwise it's a freetext
    boolean lovRequired?;
    # description of the parameter
    string description?;
    # schema of the parameter
    string schema?;
    # The regular expression to validate the value
    ValidationPattern pattern?;
    # If the parameter is an object with flexible properties (additionProperties/dictionary), we will describe the properties of the object.
    record {} properties?;
};

# The name of your application
public type SubscriptionMerchantApplicationName string;

# If true, there is currently a harvest or an order change in progress. Otherwise false.
public type Processing boolean;

# Indicate the url of your picture profil based on your initials
public type InitialsProfilePictureUrl string;

# Product Errors
public type ProductErrors ProductError[];

public type LinksDeletestoresharelink record {
    *BeezupCommonLink3;
};

public type LinksCatalogGetcatalogcolumnslink record {
    *BeezupCommonLink3;
};

public type ReportByCategoryLinks record {
    LinksOptimisebycategorylink enableProducts?;
    LinksOptimisebycategorylink disableProducts?;
};

# Your friend's user country iso code alpha 3
public type FriendCountryIsoCodeAlpha3 string;

public type AddChannelCatalogRequest record {
    # The channel identifier
    BeezupCommonChannelid channelId;
    # The store identifier
    BeezupCommonStoreid storeId;
};

# Data type of the column, will be used for parsing and for consolidation proces
public type BeezupCommonColumndatatype string;

# The payment status
public type InvoicePaymentStatus string;

public type BeezupCommonErrorsummary record {
    string utcDate?;
    string errorGuid?;
    string errorCode?;
    string errorMessage?;
    string technicalErrorMessage?;
    BeezupCommonExceptiondetail exceptionDetail?;
    record {} errorArguments?;
    string propertyName?;
    string propertyValue?;
    string objectName?;
    string 'source?;
};

public type BeezupCommonPaginationresult record {
    # The entry count currently returned
    int entryCount;
    # The page count
    int pageCount;
    # The total entry count
    int totalEntryCount;
    # The navigation links 'first', 'last', 'next', 'previous'
    BeezupCommonPaginationresultlinks links;
};

# The different actions you can make on this account
public type AccountInfoLinks record {
    LinksGetuseraccountinfolink self;
    LinksSavepersonalinfolink savePersonalInfo;
    LinksChangeemaillink changeEmail;
    LinksChangepasswordlink changePassword;
    LinksSavecompanyinfolink saveCompanyInfo;
    LinksGetprofilepictureinfolink getProfilePictureInfo;
    LinksSaveprofilepictureinfolink saveProfilePictureInfo;
    LinksGetcreditcardinfolink getCreditCardInfo;
    LinksSavecreditcardinfolink saveCreditCardInfo;
    LinksActivateuseraccountlink activateUserAccount?;
};

# The BeezUP Order identifier
public type BeezUPOrderId string;

# Indicates the period type we want use for the report filter
public type ReportFilterPeriodType string;

public type ChannelCatalogMarketplaceBooleanProperty record {
    *ChannelCatalogMarketplaceProperty;
    # Indicate the default values of the property
    boolean default?;
};

# The reporting related to a change order operation
public type ChangeOrderReporting record {
    # The execution identifier
    ExecutionUUID executionUUID?;
    BusinessOperationType changeOrderType?;
    # Indicates the origin of the operation
    SourceType sourceType?;
    # The user identifier
    BeezupCommonUserid sourceUserId?;
    string sourceUserName?;
    # The creation UTC date of the execution
    string creationUtcDate?;
    # The processing status of the execution
    string processingStatus?;
    # The last update UTC date of the execution
    string lastUpdateUtcDate?;
    # The error message during the execution
    string errorMessage?;
    # The IP address who request this operation
    string ipAddress?;
    # This operation was a test
    boolean testMode?;
    record {} details?;
};

public type OrderIndex record {
    # Gives you all entry point operations you can do on this API
    OrderIndexLinks links;
    # Gives you all the LOV to get the translations realated to operation name, codes, property names and statuses.
    OrderIndexLovLinks lovLinks;
};

# Your company VATNumber. Used for french company. This number is checked with official web service before being saved.
public type VatNumber string;

public type AutomaticTransitionInfoListLinks record {
    LinksGetautomatictransitionslink self;
    LinksConfigureautomatictransitionslink configure;
};

# If the error is translated, the culture name will be indicated
public type CultureName string;

# The available channel
public type ChannelHeader record {
    # The channel identifier
    BeezupCommonChannelid channelId;
    # The channel name
    BeezupCommonChannelname channelName;
    # The URL <a href="https://en.wikipedia.org/wiki/URL">https://en.wikipedia.org/wiki/URL</a>
    BeezupCommonHttpurl channelLogoUrl;
    # The type list related to a channel
    string[] types;
    # The links related to an available channel
    ChannelHeaderLinks links;
};

# The store count you want to have in your contract.
@constraint:Int {minValue: 1}
public type StoreCount int;

# Links to know if the user can create a rule or run all rules
public type RuleListLinks record {
    LinksGetruleslink self;
    LinksCreaterulelink create;
    LinksGetrulesexecutionslink history;
    LinksRunruleslink run;
};

public type ChannelinfoKeynumbers record {
    # The estimated product count of the channel
    string products?;
    # The estimated category count of the channel
    string categories?;
    # The estimated store count of the channel
    string stores?;
    # The estimated view count per month of the channel
    string viewsPerMonth?;
};

public type LinksGetchannelcatalogproductinfolink record {
    *BeezupCommonLink3;
};

# Error Code
public type ErrorCode string;

# The Stock Keeping Unit (SKU), i.e. a merchant-specific identifier for a product or service, or the product to which the offer refers. http://schema.org/sku
@constraint:String {maxLength: 50}
public type Sku string;

public type BeezupCommonApisettingsstatus string;

# Gives you all the LOV to get the translations realated to operation name, codes, property names and statuses.
public type OrderIndexLovLinks record {
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 orderChangeBusinessOperationType;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 orderState;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 orderProperty;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 orderPropertyPosted;
};

public type LinksGetorderlistfulllink record {
    *BeezupCommonLink3;
};

public type StoreAlert record {
    # The different actions you can make on this alert
    StoreAlertLinks links;
    # Alert identifier
    AlertId alertId;
    # The alert name
    AlertName alertName;
    # Is the alert enable ?
    AlertEnabled enabled;
    # The current configuration properties of the alert
    StoreAlertPropertyInfo[] properties?;
};

# Indicate the url of your picture profil based on gravatar
public type GravatarProfilePictureUrl string;

public type LinksGetrulesexecutionslink record {
    *BeezupCommonLink3;
};

# Your address
public type Address string;

# The property value
public type AlertPropertyValue string;

# The email
public type BeezupCommonEmail string;

# Indicates the role can have a user on a store.
# * Owner: Indicates that you are the owner of this store
# * User: Indicates that you are a simple user on this store
public type StoreUserRole string;

# The channel column identifier
public type BeezupCommonChannelcolumnid string;

public type AccountSynchronization record {
    # The marketplace account identifier in BeezUP. This account identifier is based on your api settings.
    AccountId accountId;
    string completedHarvestSynchroUtcDate?;
    # In an marketplace technical code like CDiscount you can have several marketplaces like GO SPORT, etc. We identify them by a business code.
    BeezupCommonMarketplacebusinesscode marketplaceBusinessCode;
    # The technical code of the marketplace.
    BeezupCommonMarketplacetechnicalcode marketplaceTechnicalCode;
};

public type LinksHarvestorderv3link record {
    *Link3;
};

# ETag value to identify the order.\
# This information is required for the operation GetOrder and ChangeOrder.\
# For more details go to this link: http://tools.ietf.org/html/rfc7232#section-2.3
public type Etag string;

# The channel catalog
public type LegacyTrackingChannelCatalog record {
    # Indicates the actions you can do on a channel catalog
    LegacyTrackingChannelCatalogLinks links;
};

public type GetImportationReportResponseError record {
    # Error Code
    ErrorCode errorCode;
    # Column named by the user
    UserColumName userColumName;
    # The BeezUP column name
    BeezupCommonBeezupcolumnname beezUPColumnName?;
    int productCount;
};

# The default cost on this channel category
public type ChannelCategoryDefaultCost decimal;

# Data type of the operator
public type FilterOperatorDataType string;

# Applicable operations considering the state of the importation
public type ImportationMonitoringLinks record {
    LinksImportationGetimportationmonitoringlink self;
    LinksImportationTechnicalprogressionlink technicalProgression;
    LinksImportationCancellink cancel?;
    LinksImportationConfigureremainingcatalogcolumnslink configureRemainingCatalogColumns?;
    LinksImportationCommitcolumnslink commitColumns?;
    LinksImportationCommitlink 'commit?;
    LinksImportationActivateautoimportlink activateAutoImport?;
    LinksImportationGetdetectedcatalogcolumnslink catalogColumns?;
    LinksImportationGetcustomcolumnslink customColumns?;
    LinksImportationGetproductsamplelink productSamples?;
};

# The user identifier
public type BeezupCommonUserid string;

public type LinksImportationCancellink record {
    *BeezupCommonLink3;
};

public type LinksEnablechannelcataloglink record {
    *BeezupCommonLink3;
};

# Your profile picture choice about usage of gravatar picture, initials picture or uploaded picture.
public type ProfilePictureSelected string;

public type LinksImportationGetreportingslink record {
    *BeezupCommonLink3;
};

public type BillingPeriod record {
    # The billing period in month
    int billingPeriodInMonth;
    # The discount percentage related to this billing period
    decimal discountPercentage;
};

# The catalog column named by the user (catalog or custom column)
public type BeezupCommonCatalogcolumnusername string;

# The regular expression to validate the value
public type ValidationPattern string;

public type ErrorResponseMessagePaymentRequiredLinks record {
    LinksGetofferlink offer;
};

public type LinksImportationGetimportationmonitoringlink record {
    *BeezupCommonLink3;
};

# The request message to compute an expression based on the provided product values
public type ComputeExpressionRequest record {
    # The key is the column identifier
    ProductValues productValues;
    # The encrypted excel expression of the column
    EncryptedExpression encryptedExpression;
};

public type GetImportationReportResponseErrors GetImportationReportResponseError[];

public type LinksTerminatecurrentcontractlink record {
    *BeezupCommonLink3;
};

public type ProfilePictureInfo record {
    # Indicate the url of your picture profil
    ProfilePictureUrl profilePictureUrl?;
    # Your profile picture choice about usage of gravatar picture, initials picture or uploaded picture.
    ProfilePictureSelected profilePictureSelected;
};

# Importance of the column
public type BeezupCommonColumnimportance string;

# The channel name
public type BeezupCommonChannelname string;

public type LinksGetstorereportbydaylink record {
    *BeezupCommonLink3;
};

# Gives you want you can do on this API
public type CustomerIndexLinks record {
    LinksGetcustomerindexlink self;
    LinksGetuseraccountinfolink accountInfo;
    LinksGetfriendinfolink friendInfo;
    LinksLogoutlink logout?;
    LinksGetstoreslink stores?;
    LinksGetbillingperiodslink billingPeriods;
    LinksGetstandardofferslink standardOffers;
    LinksGetofferlink getOffer?;
    LinksGetinvoiceslink invoices?;
    LinksGetcontractslink contracts?;
};

# Indicate the separator of the values in the CSV file. Generally ";"
public type CsvSeparator string;

# Indicate the download strategy (simple uri, ftps, ftplatest file, etc...)
public type DownloadCatalogStrategy string;

public type ChannelCatalogMarketplaceStringSetting record {
    *ChannelCatalogMarketplaceSetting;
    # Channel catalog marketplace property values
    string[] values?;
};

public type ReportByDayRequest record {
    # Indicate the channel identifier list
    BeezupCommonChannelid[] channelIds?;
    # The product identifier
    BeezupCommonProductid productId?;
    # The catalog category identifier
    BeezupCommonCatalogcategoryid catalogCategoryId?;
    # The begin date of the period for the report
    string beginPeriodUtcDate;
    # The end date of the period for the report
    string endPeriodUtcDate;
    ReportAdvancedFilters advancedFilters?;
};

public type ImportationCustomColumnListLinks record {
    LinksImportationGetcustomcolumnslink self;
    LinksImportationSavecustomcolumnlink add?;
};

# Indicates how global actions you can do like how to create a channel catalog, exclusion filter operators, etc...
public type ChannelCatalogListLinks record {
    LinksGetchannelcatalogslink self?;
    ExternallinksCatalogGetbeezupcolumnslink beezUPColumns?;
    LinksAddchannelcataloglink add?;
    LinksGetchannelcatalogfilteroperatorslink filterOperators?;
};

# Indicates the actions you can do on this report filter
public type ReportFilterLinks record {
    LinksGetreportfilterlink self?;
    LinksSavereportfilterlink save?;
    LinksDeletereportfilterlink delete?;
};

# Describe the click information related to the offer.
public type ContractClickInfo record {
    # The addition click price in the offer
    decimal additionalClickPrice?;
    # The click included in the offer
    int clickIncluded?;
    # The click included in your current contract
    int initialOfferClickIncluded?;
};

# The request message to create a custom column
public type CreateCustomColumnRequest record {
    # Column named by the user
    UserColumName userColumnName;
    # The encrypted excel expression of the column
    EncryptedExpression encryptedExpression;
    # The encrypted XML Blockly representation of the expression
    EncryptedBlocklyExpression encryptedBlocklyExpression;
    # Indicate the display group name where the column must be putted
    DisplayGroupName displayGroupName;
};

public type LinksGetorderlink record {
    *BeezupCommonLink3;
};

public type LinksGetstoreslink record {
    *BeezupCommonLink3;
};

# The catalog column identifier
public type ColumnId string;

# * path: if the parameter must be pass in the path uri
# * header: if the parameter must be passed in http header
# * query: if the parameter must be passed in querystring
# * body: if the parameter must be passed in the body
# * file: if the parameter must be passed in a multipart/form-data (https://swagger.io/docs/specification/2-0/file-upload/)
public type ParameterIn string;

public type PerformanceIndicatorFilter record {
    # Indicate on which indicator or value you want to make your formula
    PerformanceIndicatorType performanceIndicator;
    # Indicates the operator you want to apply on this indicator
    PerformanceIndicatorFilterOperatorName operatorName;
    # Indicates the filter value to apply on this indicator
    decimal value;
};

public type WarningSummary record {
    string technicalErrorMessage?;
    string warningMessage?;
    string warningCode?;
    record {} warningArguments?;
};

public type TrackingStatus record {
    # The utc date of the latest synchronized click
    string clickSynchronizationUtcDate;
    # The utc date of the latest synchronized order
    string orderSynchonizationUtcDate;
    # The utc date of the latest synchronized marketplace order
    string marketplaceOrderSynchonizationUtcDate;
};

# Invoice Content HTML
public type InvoiceContentHtml string;

public type TrackedClicks record {
    TrackedClick[] clicks;
};

# Indicates the configuration applied on the column (catalog or custom) during the importation process.
public type ColumnConfiguration record {
    # The BeezUP column name
    BeezupCommonBeezupcolumnname beezUPColumnName?;
    # Importance of the column
    BeezupCommonColumnimportance columnImportance;
    # Data type of the column, will be used for parsing and for consolidation proces
    BeezupCommonColumndatatype columnDataType;
    # If non null, culture used to parse the value to the storage type of this column\r\n will be used for parsing and for consolidation proces
    ColumnCultureName columnCultureName?;
    # If non null, format used to parse the value to the storage type of this column\r\n will be used for parsing and for consolidation proces
    ColumnFormat columnFormat?;
    # If the size of the value is greater than the limit we can truncate the value instead of failing...
    CanBeTruncated canBeTruncated?;
    # Indicate the display group name where the column must be putted
    DisplayGroupName displayGroupName?;
};

public type MapBeezUPColumnRequest record {
    # The BeezUP column name
    BeezupCommonBeezupcolumnname beezUPColumnName;
};

public type ReportByCategoryResponse record {
    BeezupCommonPaginationresult paginationResult?;
    # The currency code <a href="https://en.wikipedia.org/wiki/ISO_4217">(ISO 4217)</a>
    BeezupCommonCurrencycode currencyCode?;
    ReportByCategory[] categories?;
    ReportByCategoryResponseLinks links?;
};

# List of lov link. The key is the list name.
public type UserLovLinks record {
};

# The list of Order report exportations.\
# The paginationResult properties can be null if the list is empty.
public type OrderExportations record {
    BeezupCommonPaginationresult paginationResult?;
    OrderExportationReporting[] exportations;
    OrderExportationsLinks links;
};

public type OfferFunctionality record {
    # The functionality code
    string functionalityCode;
    # The max value in integer for this feature in this offer
    int maxValueInteger?;
    # Is this feature is unlimited for this offer?
    boolean unlimited;
    # A description text of this feature
    string text?;
};

# Your address city
public type City string;

# Indicate the operator you want to make on the columnId
public type BeezupCommonProductcolumnfilteroperatorname string;

# In an marketplace technical code like CDiscount you can have several marketplaces like GO SPORT, etc. We identify them by a business code.
public type BeezUPMarketplaceBusinessCode string;

public type CostStatus string;

public type InvoiceListLinks record {
    LinksGetinvoiceslink self;
};

# The message request to configure the auto import interval
public type ConfigureAutoImportIntervalRequest record {
    # Indicate the interval in time span. (i.e. "04:00:00" for every 4 hours)
    string interval;
};

public type LinksGetstorereportbychannellink record {
    *BeezupCommonLink3;
};

# The catalog category path
public type BeezupCommonCatalogcategorypath string[];

# The different actions you can make on this offer
public type OfferLinks record {
    LinksCreatecontractlink createContract?;
};

public type LinksDeletereportfilterlink record {
    *BeezupCommonLink3;
};

# Expiration Month
@constraint:Int {minValue: 1, maxValue: 12}
public type ExpirationMonth int;

public type LinksCatalogindexlink record {
    *BeezupCommonLink3;
};

# Indicate the actions you can do on a channel catalog. If the settings are valid, you will be able to access to the publication history.
public type MarketplaceChannelCatalogLinks record {
    LinksGetchannelcatalogmarketplacepropertieslink properties;
    LinksGetchannelcatalogmarketplacesettingslink settings;
    LinksGetpublicationslink publications?;
    MarketplaceChannelCatalogPublicationOption[] publishOptions?;
};

public type LinkClickToOrderType string;

public type AutomaticTransitionInfoLinks record {
    LinksConfigureautomatictransitionslink configure;
};

public type LinksCreatestorelink record {
    *BeezupCommonLink3;
};

public type LinksImportationMapcustomcolumnlink record {
    *BeezupCommonLink3;
};

public type InfoSummary record {
    string informationCode?;
    string informationMessage?;
    record {} informationArguments?;
    string propertyName?;
    string propertyValue?;
    string objectName?;
};

public type PublicchannelinfolistLinks record {
    LinksGetchannelslink self?;
};

# The index of the customer API
public type CustomerIndex record {
    # Gives you want you can do on this API
    CustomerIndexLinks links;
    CustomerIndexLovLinks lovLinks;
};

# Indicates the page number
@constraint:Int {minValue: 1}
public type PageNumber int;

public type LinksConfigureautomatictransitionslink record {
    *BeezupCommonLink3;
};

public type BusinessOperationType string;

public type LinksCatalogGetrandomproductslink record {
    *BeezupCommonLink3;
};

public type OrderExportationReportingProcessingStatus string;

# Your contract identifier
public type ContractId string;

public type ChannelinfoDetails record {
    # The cost's description of the channel
    string costs?;
    # The business model of the channel
    string businessModel?;
    # The channel type
    string channelType?;
    # The tracking type
    string trackingType?;
    # The channel category
    string category?;
    # The home url of the channel
    string homeUrl?;
    # The subscription link to the channel
    string subscriptionLink?;
};

public type CreateContractResponse record {
    CreateContractResponseLinks links?;
    BeezupCommonInfosummaries info?;
};

public type LinksImportationTechnicalprogressionlink record {
    *BeezupCommonLink3;
};

public type ChannelCatalogExportCacheInfoResponseLinks record {
    LinksGetchannelcatalogexportationcacheinfolink self;
    LinksClearchannelcatalogexportationcachelink clear?;
};

public type ReportByDay record {
    string day;
    ReportByDayAllChannels allChannels;
    ReportByDayByChannel[] byChannels;
};

# The object which contains the category list
public type CategoryList record {
    # The category list
    Category[] categories;
};

public type OrderListFullLinks record {
    *OrderListLinks;
    LinksGetorderlistfulllink self;
};

public type ImportAlreadyInProgressResponse record {
    # The error message list
    BeezupCommonUsererrormessage[] errors;
    # The action links
    ImportAlreadyInProgressResponseLinks links;
};

# The user identifier
public type UserId string;

public type TrackedOrder record {
    # The utc date of the order
    string utcDate;
    # The basic info related to a channel
    BeezupCommonChannelbasicinfo channel;
    # The merchant order identifier
    string merchantOrderId;
    # The total amount of the order
    decimal totalAmount;
    # The currency code <a href="https://en.wikipedia.org/wiki/ISO_4217">(ISO 4217)</a>
    BeezupCommonCurrencycode currencyCode;
    # Indicate if the payment of this order has been validated or not
    boolean paymentValidated;
    # The product list of this order
    TrackedOrderProduct[] products;
};

# Your special coupon offer identifier
public type CouponOfferCode string;

public type StoreAlerts record {
    StoreAlert[] alerts?;
};

# The type of the file to export
public type ExportOrderListFormat string;

public type LinksChangeemaillink record {
    *BeezupCommonLink3;
};

public type ChannelCatalogMarketplaceIntegerSetting record {
    *ChannelCatalogMarketplaceSetting;
    # Channel catalog marketplace property values
    int[] values?;
};

# The contract termination info
public type TerminateContract record {
    # The contract termination reason type identifier, if your current contract is scheduled to be terminated. The value is based on the list of values /user/lov/ContractTerminationReason
    ContractTerminationReasonType contractTerminationReasonType;
    # The termination reason, if your current contract is scheduled to be terminated.
    ContractTerminationReason contractTerminationReason?;
};

public type LinksGetlegacytrackingchannelcataloglink record {
    *BeezupCommonLink3;
};

public type BeezupCommonInfosummaries record {
    BeezupCommonSuccesssummary[] successes?;
    BeezupCommonErrorsummary[] errors?;
    BeezupCommonWarningsummary[] warnings?;
    BeezupCommonInfosummary[] informations?;
};

public type ChangeEmailRequest record {
    # The email
    BeezupCommonEmail newEmail;
};

# The navigation links 'first', 'last', 'next', 'previous'
public type PaginationResultLinks record {
    Link3 first;
    Link3 last;
    Link3 previous?;
    Link3 next?;
};

public type LinksCreatecontractlink record {
    *BeezupCommonLink3;
};

# Indicate the http method to use on this link
public type BeezupCommonHttpmethod string;

# Indicate the display group name where the column must be putted
public type DisplayGroupName string;

public type UserLovIndex record {
    UserLovIndexLinks links?;
};

# Describe the way to download the file
public type InputFileFetchConfiguration record {
    # Indicate the Uri of the file. (http, https, ftp, ftps, sftp are allowed)
    string uri;
    # Provides the credentials
    Credential credential?;
    # Indicate the download strategy (simple uri, ftps, ftplatest file, etc...)
    DownloadCatalogStrategy downloadCatalogStrategy;
    # Indicate the compression type
    CompressionFormatStrategy compressionFormatStrategy?;
    # Indicate the relative path in the compressed file
    string compressedRelativePath?;
    # Indicate the download time out in second
    int downloadTimeout = 30;
};

public type LinksGetofferlink record {
    *BeezupCommonLink3;
};

public type LinksImportationUnmapcustomcolumnlink record {
    *BeezupCommonLink3;
};

# Represent the reporting of the Order report exportations
public type OrderExportationReporting record {
    string abortionUtcDate?;
    string beginUtcDate?;
    string blobNameUri?;
    string endUtcDate?;
    string enqueuedUtcDate;
    string errorMessage?;
    string executionUUID;
    string expirationUtcDate?;
    string failureUtcDate?;
    string ipAddress;
    # Raw representation of the JSON
    string jsonCriteria?;
    string lastUpdateUtcDate?;
    int orderCount?;
    OrderExportationReportingProcessingStatus processingStatus;
    int remainingOrderCount?;
    string resumedUtcDate?;
    # Indicates the origin of the operation
    SourceType sourceType;
    # The user identifier
    BeezupCommonUserid sourceUserId?;
    string sourceUserName;
    string suspendedUtcDate?;
    string timeoutDuration?;
    string warningMessage?;
};

public type ReportByChannelResponseLinks ReportByCommonResponseLinks;

# The filter operator
public type FilterOperator record {
    # The exclusion filter operator name
    FilterOperatorName name?;
    # Data type of the operator
    FilterOperatorDataType expectedChannelColumnDataType?;
    # This operator requires a value
    boolean valueRequired?;
    # Data type of the operator
    FilterOperatorDataType expectedValueDataType?;
};

public type OrderListLightLinks record {
    *OrderListLinks;
    LinksGetorderlistlightlink self;
};

public type UserFriendInfo record {
    # Your friend's user id
    string userId;
    # Your friend's user last name
    string lastName;
    # Your friend's user first name
    string firstName;
    # Your friend's user email
    FriendEmail email;
    # Your friend's user profile picture url
    FriendProfilePictureUrl profilePictureUrl?;
    # Your friend's user country iso code alpha 3
    FriendCountryIsoCodeAlpha3 countryIsoCodeAlpha3;
    # Your friend's user company name
    string company;
    # Your friend's user occupation in his company
    string whatIDo?;
};

# The termination reason, if your current contract is scheduled to be terminated.
public type ContractTerminationReason string;

# Contains the order identifier and the change order request
public type ChangeOrderListRequestItem record {
    OrderIdentifierWithETag 'order;
    # All properties with the prefix order_ are translated in the list of values /user/lov#OrderMetaInfoPosted
    ChangeOrderRequest changeOrderRequest?;
};

public type GetImportationReportResponseProductMetrics record {
    int detectedCount;
    int duplicatedCount;
    int failedCount;
    int activeCount;
};

public type LinksGetreportfilterslink record {
    *BeezupCommonLink3;
};

# Describe the store information related to the offer.
public type ContractStoreInfo record {
    # The store count you want to have in your contract.
    StoreCount storeCount?;
    # The maximum store count related to the offer.
    int maxStoreCount?;
    # The minimum store count related to the offer.
    int minStoreCount?;
    # The owned store count.
    int ownedStoreCount?;
    # The additional store price.
    decimal additionalStorePrice?;
    # The store count included in the offer.
    int storeIncluded?;
};

# Describe the discount information related to the offer.
public type ContractDiscountInfo record {
    # The amount discounted per month
    decimal amountCodePromoDiscountPerMonth?;
    # Duration of the discount in month
    int discountDurationInMonth?;
    # Percentage of the discount
    decimal percentDiscount?;
    # Indicate the validaty of the discount
    PromotionalCodeValidity promotionalCodeValidity?;
    # The discount amount
    decimal amountCodePromoDiscount?;
    # The discount code
    string couponDiscountCode?;
    # Internal use: The discount id
    int couponDiscountId?;
    # Is this discount is related to a coupon offer
    boolean isCouponDiscountLinkedToCouponOffer?;
    # Do you have currently a discount on your contract ?
    boolean customerHasActualDiscount?;
};

public type LinksCatalogChangecustomcolumnusernamelink record {
    *BeezupCommonLink3;
};

public type CatalogStoreIndex record {
    CatalogStoreIndexLinks links;
    # Indicates the status of the catalog store.
    # * OK: If the latest importation is a success!
    # * Failed: If the latest importation has failed !
    # * Outdated: If the latest succeed importation is later than 1 day.
    CatalogStoreStatus status;
};

# Represent a mapping between a channel column (considering channel category mapping) and a catalog column
public type ChannelCatalogColumnMapping record {
    # The channel column identifier
    BeezupCommonChannelcolumnid channelColumnId;
    # The channel category path
    BeezupCommonChannelcategorypath channelCategoryPath?;
    # The catalog column identifier (catalog or custom column)
    BeezupCommonCatalogcolumnid catalogColumnId?;
};

# The encrypted XML Blockly representation of the expression
public type EncryptedBlocklyExpression string;

# Describe the reporting of the catalog importation
public type ImportationMonitoring record {
    # The user identifier
    BeezupCommonUserid userId?;
    # Indicates if the importation was successfully completed or not
    boolean success;
    # The execution identifier of the catalog importation
    ExecutionId executionId;
    # The last update of the reporting
    string lastUpdateUtcDate;
    # The start date of the importation
    string beginUtcDate;
    # In case of error a description will be indicated
    BeezupCommonUsererrormessage[] errors?;
    # Contains all steps of the importation process with a boolean. If true the step has been passed, false the step is not complete
    record {} steps;
    # Applicable operations considering the state of the importation
    ImportationMonitoringLinks links?;
};

# Depending if the report concerned multiple channels or one channel.
public type ReportByProductLinks record {
    # If the report concerned one product for one channel the channel catalog product info will give you all you need to enable or disable the product.
    ReportByProductOneChannelLinks oneChannelLinks?;
    ReportByProductAllChannelsLinks allChannelsLinks?;
};

public type LinksSavecompanyinfolink record {
    *BeezupCommonLink3;
};

public type Contracts record {
    ContractsLinks links;
    CurrentContractInfo current?;
    NextContractInfo next?;
};

public type LinksGetchannelcataloglink record {
    *BeezupCommonLink3;
};

public type ExternallinksGetchannelinfolink record {
    *BeezupCommonLink3;
};

# The request message to make a mapping between catalog category path and a channel category path
public type ConfigureCategoryRequest record {
    # Great feature! In case of mapping to parent channel category, you can ask to override the mapping of all sub channel category to this catalog category path
    boolean overrideSubCategoryMappings;
    ChannelCatalogCategoryConfiguration[] channelCatalogCategories;
};

# The message request to schedule the auto import
public type ScheduleAutoImportRequest record {
    # Indicate the time span you want to import your catalog. (i.e. "21:00:00" to import your catalog at 9PM)
    @constraint:Array {minLength: 1}
    string[] schedules;
    # If null the local time zone name will be "Romance Standard Time"
    string localTimeZoneName = "Romance Standard Time";
};

# The publication history for an account
public type AccountPublications record {
    AccountPublicationsLinks links;
    # The recent publications for the requested account
    PublicationReporting[] publications;
};

public type LinksGetcontractslink record {
    *BeezupCommonLink3;
};

# Your first name
public type FirstName string;

public type OrderListFullWithLinks record {
    OrderWithLinks[] orders;
    OrderListFullLinks links;
    PaginationResult paginationResult;
};

# Order Invoice General Settings
public type OrderInvoiceGeneralSettings record {
    # If the error is translated, the culture name will be indicated
    CultureName cultureName;
    # Product VAT in percent
    ProductVATPercent productVATPercent;
    # Shipping cost VAT in percent
    ShippingVATPercent shippingVATPercent;
    # Invoice Prefix. Can contain 1 to 50 characters, with alphanumeric characters in lowercase uppercase and #, _, -
    InvoicePrefix invoicePrefix;
    # Invoice Sequence Number
    InvoiceSequenceNumber invoiceStartingSequenceNumber;
};

public type UserLovIndexLinks record {
    LinksGetuserlovindexlink self?;
    # List of lov link. The key is the list name.
    UserLovLinks lists?;
};

# Indicate the operator you want to apply on the columnId
public type AnalyticsProductColumnFilterOperatorName string;

# The Feed Type
public type FeedType string;

public type CatalogColumnLinks record {
    LinksCatalogChangecatalogcolumnusernamelink rename?;
};

# The store status
# * Active:  When the store is active
# * SystemBlocked:  When the store is blocked by the system
# * UserBlocked: When the store is blocked on GO not on the system
public type StoreStatus string;

public type LinksReenablechannelcatalogproductlink record {
    *BeezupCommonLink3;
};

public type CreditCardInfoWithCardType record {
    # Card number
    CardNumber cardNumber;
    # Expiration Month
    ExpirationMonth expirationMonth;
    # Expiration Year
    ExpirationYear expirationYear;
    # Your credit card type. Example: VISA, MasterCard, etc...
    string cardType;
};

public type ConfigureAutomaticTransitionRequest record {
    AutomaticTransition[] automaticTransitions;
};

# Your phone number
public type PhoneNumber string;

# The catalog column configuration
public type CatalogColumn record {
    # IF true, the product values of this column will be not taken in account during the importation process
    boolean ignored = false;
    # Describe how you want to manage the duplication of the product value
    DuplicateProductValueConfiguration duplicateProductValueConfiguration?;
    # The catalog column identifier
    ColumnId id;
    # The catalog column name
    CatalogColumnName catalogColumnName;
    # Column named by the user
    UserColumName userColumName;
    # Indicates the configuration applied on the column (catalog or custom) during the importation process.
    ColumnConfiguration configuration;
    CatalogColumnLinks links;
};

public type TrackedClick record {
    # The utc date of the click
    string utcDate;
    # The basic information related to a product
    BeezupCommonProductbasicinfo product;
    # The user IP address for the click
    string ipAddress;
    # The basic info related to a channel
    BeezupCommonChannelbasicinfo channel;
};

# For all catalog categories the current mapping applied
public type ChannelCatalogCategoryConfigurationInfo record {
    ChannelCatalogCategoryMappingInfoLinks links;
    # The catalog category path
    BeezupCommonCatalogcategorypath catalogCategoryPath;
    # The channel category path
    BeezupCommonChannelcategorypath channelCategoryPath?;
    # In case of CPC_ByCategory or CPA_ByCategory cost type, you have to indicate the cost value.
    ChannelCatalogCategoryCostValue costValue?;
};

public type AutoImportConfiguration record {
    # Describe the input configuration
    InputConfiguration input;
    # The user identifier
    BeezupCommonUserid inputConfiguredByUserId;
    # Indicate the scheduling type. Schedule or Interval. We recommand you to use interval for a better reporting.
    SchedulingType schedulingType;
    # The user identifier
    BeezupCommonUserid scheduledByUserId?;
    # Indicate the scheduling value. If the scheduling type is Interval then the value will be a duration otherwise the values will be the time.
    @constraint:Array {minLength: 1}
    string[] schedulingValue;
    # Indicate if the auto import is in pause or not.
    boolean paused;
    # The user identifier
    BeezupCommonUserid pauseStatusChangedByUserId?;
    # Indicate when the pause status has changed in UTC date.
    string pauseStatusChangedUtcDate?;
    # Describe how you want to manage the duplication of the product value
    DuplicateProductValueConfiguration duplicateProductConfiguration;
    # Indicate the time zone name of the scheduling. If the scheduling type is "Schedule"
    string schedulingLocalTimeZoneName = "Romance Standard Time";
};

# This is the index of the channel catalog API
public type ChannelCatalogList record {
    # Indicates how global actions you can do like how to create a channel catalog, exclusion filter operators, etc...
    ChannelCatalogListLinks links?;
    ChannelCatalogListLovLinks lovLinks?;
    # The channel catalog list. The key is the channel catalog identifier
    record {} channelCatalogs?;
};

# The execution identifier of the catalog importation
public type ExecutionId string;

public type LinksMovedownrulelink record {
    *BeezupCommonLink3;
};

# Model for a publication reporting, can have multiple feeds
public type PublicationReporting record {
    # The Publication Type
    PublicationType publicationType;
    # The feeds that were published
    PublicationFeedReporting[] feeds;
};

public type LinksSetmerchantorderinfolistlink record {
    *BeezupCommonLink3;
};

# All properties with the prefix order_ are translated in the list of values /user/lov#OrderMetaInfoPosted
public type ChangeOrderRequest record {
};

public type BonusType string;

# The channel column description
public type ChannelColumnDescription string;

# Model for fetching a channel catalog marketplace property
public type ChannelCatalogMarketplaceProperty record {
    # Channel catalog marketplace property name
    ChannelCatalogMarketplacePropertyName name;
    BeezupCommonInfosummaries info?;
    # Indicate the description of the property
    string description?;
    # Indicate the position of the property in the display group
    @constraint:Int {minValue: 1}
    int position;
    # Indicate if the value cannot be changed. This is used for example for ebay token that should not be changed.
    boolean readOnly;
    # Indicates the minimum size of the property value
    int minLength = 0;
    # Indicates the maximum size of the property value
    @constraint:Int {minValue: 1}
    int maxLength?;
    # Indicates the minimum item count of the property value.
    int minItems = 1;
    # Indicates the maximum item count of the property value
    @constraint:Int {minValue: 1}
    int maxItems = 1;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 lovLink?;
    # Indicates if the property value must be in the list of value.
    boolean lovRequired = false;
    # Indicate if the property is required or not
    boolean required;
    # Indicates the offer identifier required to configure this property.
    int offerIdRequired?;
    # Indicates if this property should be displayed in the configuration page.
    boolean visible;
    # The Data Type
    Type 'type;
    ChannelCatalogMarketplacePropertyDiscriminatorType discriminatorType;
    # Channel catalog marketplace setting value format validation regular expression
    string pattern?;
};

public type LinksGetstandardofferslink record {
    *BeezupCommonLink3;
};

# The marketplace account identifier in BeezUP. This account identifier is based on your api settings.
public type AccountId int;

public type TrackedOrderProduct record {
    *BeezupCommonProductbasicinfo;
    # The product's unit price for the order
    decimal unitPrice;
    # The quantity of this product for the order
    decimal quantity;
    # The product's margin for the order
    decimal margin;
};

# Indicates the origin of the operation
public type SourceType string;

public type StandardOffer record {
    # The offer Id
    int offerId;
    # The offer name
    string name;
    # The additional click price
    decimal additionalClickPrice?;
    # The included click
    int includedClick?;
    # UI purpose. Is the offer is the most popular
    boolean isMostPopular?;
    # Is an old offer
    boolean isOldOffer?;
    # The fixed price of the offer
    decimal fixedPrice?;
    # The currency code <a href="https://en.wikipedia.org/wiki/ISO_4217">(ISO 4217)</a>
    BeezupCommonCurrencycode currencyCode?;
    # UI purpose. The position of the offer
    int position?;
    OfferFunctionality[] functionalities?;
    StandardOfferLinks links;
};

public type AnalyticsIndexLinks record {
    LinksAnalyticsindexlink self;
    LinksGettrackingstatuslink trackingStatus?;
};

# The channel category channel code identifier
public type ChannelCategoryChannelCode string;

# The exclusion filter list
public type ExclusionFilters ExclusionFilter[];

public type LinksReenablechannelcatalogcategorymappinglink record {
    *BeezupCommonLink3;
};

# Get Importation Products Report Request Error Codes
public type GetImportationProductsReportRequestErrorCodes GetImportationProductsReportRequestErrorCode[];

public type LinksSavereportfilterlink record {
    *BeezupCommonLink3;
};

public type LinksGetchannelcatalogfilteroperatorslink record {
    *BeezupCommonLink3;
};

# The optimisation action
public type OptimisationActionName string;

public type ChannelCatalogProductFilters record {
    # The catalog product SKU filter (multiple values)
    string[] catalogSkus?;
    # The catalog product EAN filter (multiple values)
    string[] catalogEans?;
    # The catalog product MPN filter (multiple values)
    string[] catalogMpns?;
    # The channel product SKU filter (multiple values)
    string[] channelSkus?;
    # The channel product EAN filter (multiple values)
    string[] channelEans?;
    # The channel product MPN filter (multiple values)
    string[] channelMpns?;
    # The product title filter
    string title?;
    # Describe a filter on a product's column.
    # The key is the column identifier of your catalog or a custom column.
    BeezupCommonAdditionalproductfilters additionalProductFilters?;
};

public type LinksImportationGetdetectedcatalogcolumnslink record {
    *BeezupCommonLink3;
};

public type ChannelCatalogCategoryMappingInfoLinks record {
    LinksConfigurechannelcatalogcategorylink configureCategories?;
};

public type CustomColumnList record {
    CustomColumnListLinks links;
    CustomColumn[] customColumns;
};

public type LinksConfigurechannelcataloggeneralsettingslink record {
    *BeezupCommonLink3;
};

# Indicates on which date you want to make the filter
public type DateSearchType string;

# Represent a mapping between a catalog category path and a channel category path.
# The cost on this mapping can be applied.
public type ChannelCatalogCategoryConfiguration record {
    # Great feature! In case of mapping to parent catalog category, you can ask to automatically map new sub catalog category in the next importation to this channel category path.
    boolean autoMapNewSubCategories;
    # The catalog category path
    BeezupCommonCatalogcategorypath catalogCategoryPath;
    # The channel category path
    BeezupCommonChannelcategorypath channelCategoryPath?;
    # In case of CPC_ByCategory or CPA_ByCategory cost type, you have to indicate the cost value.
    ChannelCatalogCategoryCostValue costValue?;
};

public type LinksGetstoreshareslink record {
    *BeezupCommonLink3;
};

public type Offer record {
    OfferContent content?;
    BeezupCommonInfosummaries info?;
    # The different actions you can make on this offer
    OfferLinks links?;
};

public type ImportationsPerStoreResponse record {
};

# Your last name
public type LastName string;

public type PreviewOrderInvoiceResponse record {
    # Invoice Content HTML
    InvoiceContentHtml invoiceHtmlContent;
};

# The requestor type for the execution of the rule
public type RuleExecutionReportingExecutionSource string;

# Indicate the relative uri for this link
public type BeezupCommonHref string;

# The encrypted excel expression of the column
public type EncryptedExpression string;

# The catalog column identifier (catalog or custom column)
public type BeezupCommonCatalogcolumnid string;

public type AnalyticsIndexLovLinks record {
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 performanceIndicatorTypeLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 performanceIndicatorTypeForReportsByChannelLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 performanceIndicatorTypeForReportsByCategoryLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 performanceIndicatorTypeForReportsByProductLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 performanceIndicatorFormulaParameterTypeLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 performanceIndicatorFormulaOperatorNameLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 performanceIndicatorFilterOperatorNameLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 analyticsProductColumnFilterOperatorNameLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 analyticsNumericalProductColumnFilterOperatorNameLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 analyticsStringProductColumnFilterOperatorNameLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 storeOptimisationRuleExecutionStatusLov?;
};

# Header Content HTML
@constraint:String {maxLength: 1000}
public type HeaderContentHtml string;

# The links related to an available channel
public type ChannelHeaderLinks record {
    LinksGetchannelinfolink self?;
};

# The channel catalog products counters. For each counter you will have a count.
public type ChannelCatalogProductsCounters record {
    # Imported product count currently in your catalog.
    int existingProductCount?;
    # Product count WITHOUT category mapped on existing products.
    int uncategorizedProductCount?;
    # Disabled product count INCLUDING uncategorized products on existing products.
    int disabledProductCountIncludingUncategorized?;
    # Disabled product count EXCLUDING uncategorized products on existing products.
    int disabledProductCountExcludingUncategorized?;
    # Excluded product count INCLUDING uncategorized products AND disabled products on existing products.
    int excludedProductCountIncludingUncategorizedAndDisabled?;
    # Excluded product count EXCLUDING uncategorized products AND disabled products on existing products.
    int excludedProductCountExcludingUncategorizedAndDisabled?;
};

public type LinksGetrulelink record {
    *BeezupCommonLink3;
};

# If the size of the value is greater than the limit we can truncate the value instead of failing...
public type CanBeTruncated boolean;

public type BeezupCommonCatalogcategoryfilter record {
    # Indicates on which catalog category path you want to make the filter
    string[] categoryPath?;
};

public type LinksGetpubliclovindexlink record {
    *BeezupCommonLink3;
};

public type LinksGetchannelsindexlink record {
    *BeezupCommonLink3;
};

public type ExclusionFiltersResponseLinks record {
    LinksGetchannelcatalogexclusionfilterslink self;
    LinksConfigurechannelcatalogexclusionfilterslink configure?;
};

public type ChannelCatalogMarketplaceProperties record {
    BeezupCommonInfosummaries info?;
    ChannelCatalogMarketplacePropertiesLinks links;
    # The groups settings with constraints
    ChannelCatalogMarketplacePropertyGroup[] propertyGroups;
};

public type LinksClearmerchantorderinfolistlink record {
    *BeezupCommonLink3;
};

# The basic information related to a product
public type BeezupCommonProductbasicinfo record {
    # The product identifier
    string productId;
    # The product SKU
    string productSku;
    # The product tile
    string productTitle;
    # The product image Url
    string productImageUrl?;
    # Indicates if the product still exists in your catalog
    boolean productExists;
};

public type LinksGetorderindexlink record {
    *BeezupCommonLink3;
};

public type ChannelCatalogMarketplaceNumberProperty record {
    *ChannelCatalogMarketplaceProperty;
    # Indicate the default values of the property
    decimal[] default?;
};

# The e-commerce software name of the merchant
public type OrderMerchantecommercesoftwarename string;

public type OrderHeaderLinks record {
    LinksGetorderlink self;
};

# The marketplace order state
public type MarketplaceOrderStatus string;

public type UpdateStoreRequest record {
    # The store name. Must be unique.
    StoreName name;
    # The url of your store
    StoreUrl url;
    # The store's sectors based on the list of values /user/lov/ParamSector
    StoreSectors sectors;
};

# The key is the column identifier
public type ProductValues record {
};

public type SuccessSummary record {
    string successCode?;
    string successMessage?;
    record {} successArguments?;
    string propertyName?;
    string propertyValue?;
    string objectName?;
};

public type LinksDeleterulelink record {
    *BeezupCommonLink3;
};

# The basic info related to a channel
public type BeezupCommonChannelbasicinfo record {
    # The channel identifier
    BeezupCommonChannelid channelId;
    # The channel name
    BeezupCommonChannelname channelName;
    # The URL <a href="https://en.wikipedia.org/wiki/URL">https://en.wikipedia.org/wiki/URL</a>
    BeezupCommonHttpurl channelImageUrl;
};

public type LinksImportationGetreportlink record {
    *BeezupCommonLink3;
};

public type ReportFilter record {
    # Report filter identifier
    string reportFilterId;
    # Report filter name
    string reportFilterName;
    ReportFilterParameters parameters;
    # Indicates the actions you can do on this report filter
    ReportFilterLinks links?;
};

# Your friend's user profile picture url
public type FriendProfilePictureUrl string;

public type SetMerchantOrderInfoListRequest record {
    # The e-commerce software name of the merchant
    OrderMerchantecommercesoftwarename order_MerchantECommerceSoftwareName;
    # The e-commece software version of the merchant
    OrderMerchantecommercesoftwareversion order_MerchantECommerceSoftwareVersion;
    @constraint:Array {maxLength: 100, minLength: 1}
    SetMerchantOrderInfoListRequestItem[] orders;
};

public type LinkParameterProperty3 record {
    # The label corresponding to the link parameter property. This label is automatically translated based on the Accept-Language http header.
    string label?;
    # The value of the parameter. It can be an integer a string or an object.
    record {} value?;
    boolean required?;
    # The value type of the parameter
    ParameterType 'type;
    # Describe the way you have to follow to get access to the LOV
    LOVLink3 lovLink?;
    # If true, you MUST use indicate a value from the list of values otherwise it's a freetext
    boolean lovRequired?;
    # description of the parameter
    string description?;
    # schema of the parameter
    string schema?;
    # The regular expression to validate the value
    ValidationPattern pattern?;
};

# Indicate the compression type
public type CompressionFormatStrategy string;

public type LinksAutoPauseautoimportlink record {
    *BeezupCommonLink3;
};

# If this property is not indicated please force the user to configure the cost settings.
# Defines the cost type you have on this channel with the cost value.
public type CostSettings record {
    # CPC means cost per click.
    # CPA means cost per action.
    # You can have CPC/CPA with a global cost value.
    # You can have CPC/CPA by category the cost value MUST be null
    # You can have global fixed price.
    CostType costType;
    # In case of global cost type, you have to indicate the cost value.
    decimal globalCostValue?;
};

# Indicates the actions you can do on a channel catalog
public type LegacyTrackingChannelCatalogLinks record {
    LinksGetlegacytrackingchannelcataloglink self;
    LinksMigratelegacytrackingchannelcataloglink migrate?;
};

public type UserErrorMessage record {
    # The documentation related to this operation.
    DocUrl docUrl?;
    # Error Code
    ErrorCode code;
    # The error message
    string message;
    # If the error is translated, the culture name will be indicated
    CultureName cultureName?;
    # a dictionary string/object
    UserErrorMessageArguments arguments?;
};

public type CreateContract OfferRequest;

# The channel catalog product info list
public type ChannelCatalogProductInfoList record {
    BeezupCommonPaginationresult paginationResult;
    ChannelCatalogProductInfoListLinks links;
    ChannelCatalogProductInfo[] productInfos;
};

public type GetImportationReportResponseDiff record {
    int createdCount;
    int updatedCount;
    int deletedCount;
    int unchangedCount?;
};

public type ReportByCategoryResponseLinks ReportByCommonResponseLinks;

# Is the alert enable ?
public type AlertEnabled boolean;

public type BeezupCommonAdditionalproductfiltersvalue record {
    # Indicate the operator you want to make on the columnId
    BeezupCommonProductcolumnfilteroperatorname operatorName?;
    # Must be null if the operator is "IsNull" or "IsNotNull".
    # Can contains multiple value in case of "InList" operator. Otherwise a single value is expected.
    string[] values?;
};

public type LinksImportationCommitlink record {
    *BeezupCommonLink3;
};

# Get channel first level category list
public type ChannelRootCategory record {
    ChannelFirstLevelCategory[] firstLevelCategories;
};

public type BeezupCommonUsererrormessage record {
    # The documentation related to this operation.
    BeezupCommonDocurl docUrl?;
    # the error code. The error code can be a pattern containing the argument's name
    string code;
    # The error message
    string message;
    # If the error is translated, the culture name will be indicated
    string cultureName?;
    # a dictionary string/object
    BeezupCommonUsererrormessageArguments[] arguments?;
};

public type LinksCatalogComputeexpressionlink record {
    *BeezupCommonLink3;
};

public type ReportFilterParameters record {
    *ReportFilterCommonParameters;
    # The report type
    ReportType reportType;
    ProductColumnsToDisplay productColumnsToDisplay?;
    # You can filter on the product state.
    ProductStateFilter productState?;
    AnalyticsProductColumnFilters analyticsProductColumnFilters?;
};

# You can filter on the product state.
public type ProductStateFilter string;

public type ChannelCatalogListLovLinks record {
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 channelCatalogExclusionFilterOperatorLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 channelCatalogExportCacheStatusLov?;
};

public type AnalyticsProductColumnFilter record {
    # Indicate the operator you want to apply on the columnId
    AnalyticsProductColumnFilterOperatorName operatorName;
    # Must be null if the operator is "IsNull" or "IsNotNull".
    # Can contains multiple value in case of "InList" operator. Otherwise a single value is expected.
    string[] values?;
};

# a dictionary string/object
public type UserErrorMessageArguments record {
};

# In case of CPC_ByCategory or CPA_ByCategory cost type, you have to indicate the cost value.
public type ChannelCatalogCategoryCostValue decimal;

# The coupon discount code
public type CouponDiscountCode string;

public type PaginationRequestParameters record {
    # Indicate the item count per page
    BeezupCommonPagesize pageSize?;
    # Indicates the page number
    BeezupCommonPagenumber pageNumber?;
};

# The identifier of the subscription to the orders for a merchant
public type SubscriptionId string;

# The store identifier
public type StoreId string;

# Indicates on which date you want to make the filter
public type OrderListDateSearchType string;

public type OptimiseAllRequest record {
    *OrderedReportFilterCommonParameters;
    # The report type
    ReportType reportType;
    ProductColumnsToDisplay productColumnsToDisplay?;
    # You can filter on the product state.
    ProductStateFilter productState?;
    AnalyticsProductColumnFilters analyticsProductColumnFilters?;
};

# This is the index of the channel catalog API
public type LegacyTrackingChannelCatalogList record {
    # Indicates how global actions you can do like how to create a channel catalog, exclusion filter operators, etc...
    LegacyTrackingChannelCatalogListLinks links?;
    # The channel catalog list. The key is the channel catalog identifier
    record {} channelCatalogs?;
};

public type LinksGetorderv3link record {
    *Link3;
};

# List of lov link. The key is the list name.
public type PublicLovLinks record {
};

public type CreateContractResponseLinks record {
    LinksCreatecontractlink self?;
    LinksGetcontractslink contracts?;
};

public type LinksImportationGetcustomcolumnexpressionlink record {
    *BeezupCommonLink3;
};

public type PublicListOfValuesResponse record {
    PublicListOfValuesResponseLinks links?;
    BeezupCommonListofvalueitem[] items?;
};

# Indicate how the product sku are compared for the duplication check.
public type CompareOptions string;

public type PublicChannelInfoList record {
    PublicchannelinfolistLinks links?;
    PublicChannelInfo[] channels?;
};

public type PublicLovIndexLinks record {
    LinksGetpubliclovindexlink self?;
    # List of lov link. The key is the list name.
    PublicLovLinks lists?;
};

public type MarketplaceChannelCatalogPublicationOption record {
    # Define the publication strategy kind, for that you have 2 choices 
    # * Delta - This is the recommanded publication strategy kind, this strategy will push to the marketplace only the difference between your catalog and the previous published feeds done by BeezUP. 
    # * Full - If you want to force the publication of all your catalog feeds to the marketplace. 
    #       !WARNING! Depending to the marketplace this operation will purge the existing offers on the marketplace that are not in the catalog or unknown from the publication feed referential.
    PublicationStrategyKind kind;
    # The Feed Type
    FeedType feedType;
    boolean withUnpublish;
    # The Publication Type
    PublicationStrategy strategy;
    LinksPublishcatalogtomarketplacelink link;
};

# The e-commece software version of the merchant
public type OrderMerchantecommercesoftwareversion string;

# Describe the bonus information related to your current contract.
public type ContractBonusInfo record {
    BonusInfo[] bonuses;
};

# Describe an order item. All properties with the prefix orderItem_ are translated in the list of values /user/lov/OrderMetaInfoOrderItems
public type OrderItem record {
    # The BeezUP identifier of the order Item
    string beezUPOrderItemId;
    # The order item type of the order item
    string orderItem_OrderItemType;
    # The product id indicated in the catalog importation in BeezUP system for this order item. This property will help you to match the order to the inventory system.
    string orderItem_MerchantImportedProductId?;
    # The column name for the product id indicated in the catalog importation in BeezUP system related to this order item. This property will help you to match the order to the inventory system.
    string orderItem_MerchantImportedProductIdColumnName?;
    # The product url indicated in the catalog importation in BeezUP system related to this order item
    string orderItem_MerchantImportedProductUrl?;
    # The column name indicate in the mapping for the product id related to the order item
    string orderItem_MerchantProductIdColumnName?;
    # The store id in the beezup system related to the order item. This property will help you to match the order to the inventory system.
    string orderItem_BeezUPStoreId?;
    # The tax of the order item
    decimal orderItem_ItemTax?;
    # The title of the order item
    string orderItem_Title?;
    # The URL of the image of the order item
    string orderItem_ImageUrl?;
    # The merchant product id of the order item
    string orderItem_MerchantProductId?;
    # The marketplace product identifier of the order item
    string orderItem_MarketPlaceProductId?;
    # The order item gtin
    string orderItem_gtin?;
    # The price of the order item
    decimal orderItem_ItemPrice?;
    # The quantity of the order item
    decimal orderItem_Quantity?;
    # The total price of the order item
    decimal orderItem_TotalPrice?;
    # The shipping price of the order item
    decimal orderItem_Shipping_Price?;
    # The merchant product condition of the order item
    string orderItem_Condition?;
    # The merchant product uri of the order item
    string orderItem_MarketplaceProductUri?;
    # The marketplace image uri
    string orderItem_MarketplaceImageUri?;
};

public type LinksSavecreditcardinfolink record {
    *BeezupCommonLink3;
};

# The technical code of the marketplace.
public type BeezUPMarketplaceTechnicalCode string;

public type ApiCredentials record {
    # Your API credential list
    ApiCredential[] credentials?;
};

# Card number
public type CardNumber string;

# The KPI formula
public type PerformanceIndicatorFormula record {
    # Indicate on which indicator or value you want to make your formula
    PerformanceIndicatorFormulaParameterType firstParameter?;
    PerformanceIndicatorFormulaOperatorName operatorName?;
    # Indicate on which indicator or value you want to make your formula
    PerformanceIndicatorFormulaParameterType secondParameter?;
    # Indicate the value of the third parameter of your formula
    int thirdParameter?;
};

# Your company name
public type Company string;

# Describe the way you have to follow to get access to the LOV
public type BeezupCommonLovlink3 record {
    # Indicate the uri to the list of value
    string href;
    # Indicate the http method to use on this link
    BeezupCommonHttpmethod method?;
};

public type CustomerIndexLovLinks record {
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 offerLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 activeOfferLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 customerStatusLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 beezUPTimeZoneLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 storeCountryLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 storeSectorLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 countryLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 contractTerminationReasonLov?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 invoicePaymentStatusLov?;
};

public type LinksGetautomatictransitionslink record {
    *BeezupCommonLink3;
};

public type ChannelInfo record {
    # The channel identifier
    BeezupCommonChannelid channelId;
    # The channel name
    BeezupCommonChannelname channelName;
    # The URL <a href="https://en.wikipedia.org/wiki/URL">https://en.wikipedia.org/wiki/URL</a>
    BeezupCommonHttpurl channelLogoUrl?;
    # Indicae a description to the channel
    string channelDescription?;
    # Indicate the BeezUP offer
    string beezUPOffer?;
    ChannelinfoSalescontact salesContact?;
    ChannelinfoDetails details?;
    ChannelinfoKeynumbers keyNumbers?;
    ChannelinfoTechnicalcontact technicalContact?;
};

public type CurrentContractInfo record {
    *ContractInfo;
    CurrentContractInfoLinks links;
};

public type LinksClearmerchantorderinfolink record {
    *BeezupCommonLink3;
};

public type PublicchannelindexLinks record {
    LinksGetchannelsindexlink self?;
    LinksGetpubliclistofvalueslink channelCountryLov?;
    LinksGetpubliclistofvalueslink channelTypeLov?;
    LinksGetpubliclistofvalueslink sectorLov?;
};

public type ChannelCatalogMarketplaceStringProperty record {
    *ChannelCatalogMarketplaceProperty;
    # Indicate the default values of the property
    string[] default?;
};

public type ChannelCatalogMarketplacePropertiesLinks record {
    LinksGetchannelcatalogmarketplacepropertieslink self;
    LinksGetchannelcatalogmarketplacesettingslink settings?;
    ExternallinksGetexternalconfigurationpagelink externalConfigurationPage?;
};

# The value type of the parameter
public type BeezupCommonParametertype string;

public type ChannelCatalogCategoryMappingSettings record {
    # Optional parameter. Indicates that you have decided to do not map your categories with the channel's categories.
    boolean categoryMappingDisabledByMerchant?;
};

public type BeezupCommonErrorresponsemessage record {
    BeezupCommonUsererrormessage[] errors;
};

# The different actions you can make on this alert
public type StoreAlertLinks record {
    LinksSavestorealertslink save?;
};

public type ChannelCatalogProductByChannelCatalogResponse record {
    # The channel catalog product by channel catalog. The key is the channel catalog identifier
    record {} channelCatalogs?;
};

# The list of detected catalog column
public type DetectedCatalogColumnList record {
    DetectedCatalogColumnListLinks links;
    # Contains all deteted catalog columns
    DetectedCatalogColumn[] detectedCatalogColumns?;
};

public type LinksClearmerchantorderinfolistv3link record {
    *Link3;
};

# The operationId to call.
public type BeezupCommonOperationid string;

# Column named by the user
public type UserColumName string;

public type ReportFilterList record {
    ReportFilterHeader[] reportFilters;
    ReportFiltersLinks links;
};

public type LinksGetcreditcardinfolink record {
    *BeezupCommonLink3;
};

public type LinksGetuserlistofvalueslink record {
    *BeezupCommonLink3;
};

public type ImportationReportingLinks record {
    LinksImportationGetreportlink report?;
};

# The channel column
public type ChannelColumn record {
    # The channel column identifier
    BeezupCommonChannelcolumnid channelColumnId;
    # The channel column name
    BeezupCommonChannelcolumnname channelColumnName;
    # The channel column description
    ChannelColumnDescription channelColumnDescription?;
    # Indicates if this column must shown in the mapping page or not
    ChannelColumnShowInMapping showInMapping;
    # The position of the column starting from 1
    int position;
    # The channel column configuration. The BeezUP Column Name is optional. If the BeezUP column is mapped we will indicate the data type and column importance of the BeezUP column.
    ChannelColumnConfiguration configuration;
    # The restricted values. The key will be the restricted value identifier (format:guid) and the value will be the restriced value
    ChannelColumnRestrictedValues restrictedValues?;
};

public type ClickIncludedAndAdditionalClickPrice record {
    # The click included
    int clickIncluded?;
    # The additional click price
    decimal additionalClickPrice?;
};

# Describe a filter on a product's column.
# The key is the column identifier of your catalog or a custom column.
public type BeezupCommonAdditionalproductfilters record {
};

public type ContractsLinks record {
    LinksGetcontractslink self?;
    LinksCreatecontractlink create?;
};

public type InfoSummaries record {
    SuccessSummary[] successes?;
    ErrorSummary[] errors?;
    WarningSummary[] warnings?;
    InfoSummary[] informations?;
};

public type ExceptionDetail record {
    string helpLink?;
    string message?;
    string stackTrace?;
    string 'type?;
};

# The catalog category
public type Category record {
    # The catalog category identifier
    BeezupCommonCatalogcategoryid categoryId?;
    # The catalog category path
    BeezupCommonCatalogcategorypath categoryPath;
    # The total product count related to this category and his sub categories
    int totalProductCount;
    # The product count related to this category
    int selfProductCount;
};

public type ExternallinksGetexternalconfigurationpagelink BeezupCommonLink3;

# Your friend's user email
public type FriendEmail string;

# Indicates the List Of Values related to the marketplace
public type MarketplaceChannelCatalogLovLinks record {
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 shippingMethodLOV?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 carrierCodeLOV?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 cancelationReasonCodeLOV?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 refundReasonCodeLOV?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 marketplaceStorePropertyLOV?;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 marketplaceStorePropertyGroupLOV?;
};

public type LoginRequest record {
    # The email
    BeezupCommonEmail login;
    # Your password
    string password;
};

public type ReportByCategoryRequest record {
    *OrderedReportFilterCommonParameters;
    *PaginationRequestParameters;
};

public type LinksHarvestorderlink record {
    *BeezupCommonLink3;
};

public type PublicListOfValuesResponseLinks record {
    LinksGetpubliclistofvalueslink self?;
};

public type ReportByProductAllChannelsLinks record {
    LinksOptimisebyproductlink enableProductForAllChannels;
    LinksOptimisebyproductlink disableProductForAllChannels;
};

public type ChannelinfoSalescontact record {
    # Indicate the BeezUP offer
    string name?;
    # Indicate the sales contact email
    string email?;
    # The sales contact phone number
    string phoneNumber?;
};

public type LinksUpdatestorelink record {
    *BeezupCommonLink3;
};

# Expiration Year
@constraint:Int {minValue: 2017, maxValue: 9000}
public type ExpirationYear int;

# Copy the optimisation between 2 channels
public type CopyOptimisationRequest record {
    # The channel identifier
    BeezupCommonChannelid channelIdSource;
    # The channel identifier
    BeezupCommonChannelid channelIdTarget;
    # If true the existing optimisation will be kept
    boolean keepExistingOptimisation;
};

# The restricted values. The key will be the restricted value identifier (format:guid) and the value will be the restriced value
public type ChannelColumnRestrictedValues record {
};

public type ChannelCatalogMarketplacePropertyGroup record {
    # Indicate the code identifier of the group
    string name;
    # Indicate the position of the group
    @constraint:Int {minValue: 1}
    int position;
    ChannelCatalogMarketplaceProperty[] properties;
};

# Indicates on which invoice availability to filter
public type InvoiceAvailabilityType string;

# Indicate the scheduling type. Schedule or Interval. We recommand you to use interval for a better reporting.
public type SchedulingType string;

# The subscription consumption status
public type ConsumptionAvailabilityStatus string;

public type LinksSetmerchantorderinfolink record {
    *BeezupCommonLink3;
};

public type LinksGetuseraccountinfolink record {
    *BeezupCommonLink3;
};

# Alert identifier
public type AlertId int;

# The custom column configuration
public type ImportationCustomColumn record {
    # The catalog column identifier
    ColumnId id;
    # Column named by the user
    UserColumName userColumName;
    # Indicates the configuration applied on the column (catalog or custom) during the importation process.
    ColumnConfiguration configuration;
    ImportationCustomColumnLinks links;
};

# Your company accounting emails
public type AccountingEmails BeezupCommonEmail[];

public type CatalogIndexLOVLinks record {
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 beezUPColumnLov;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 beezUPColumnDataTypeLov;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 beezUPColumnImportanceLov;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 beezUPColumnDisplayGroupLov;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 duplicateProductValueStrategyLov;
    # Describe the way you have to follow to get access to the LOV
    BeezupCommonLovlink3 compareOptionLov;
};

public type ProfilePictureInfoResponse record {
    ProfilePictureInfoWithDefault profilePictureInfo;
    ProfilePictureInfoResponseLinks links;
};

public type CustomColumnListLinks record {
    LinksCatalogGetcustomcolumnslink self;
    LinksCatalogSavecustomcolumnlink add?;
};

public type ProductErrorCodes ProductErrorCode[];

public type OrderLinks record {
    *OrderHeaderLinks;
    LinksGetorderhistorylink history;
    LinksHarvestorderlink harvest;
    LinksSetmerchantorderinfolink setMerchantInfo;
    LinksClearmerchantorderinfolink clearMerchantInfo;
};

public type LinksDeletestorelink record {
    *BeezupCommonLink3;
};
