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

public type AnalyticsCalculatedMetricArr AnalyticsCalculatedMetric[];

public type CalcMetricFunctionArr CalcMetricFunction[];

public type TagArr Tag[];

public type RecordArr record {}[];

public type TaggedComponentArr TaggedComponent[];

public type StringArr string[];

public type ShareArr Share[];

public type AnalyticsDimensionArr AnalyticsDimension[];

public type AnalyticsProjectArr AnalyticsProject[];

public type AnalyticsUserArr AnalyticsUser[];

public type AnalyticsMetric record {
    string id?;
    string title?;
    string name?;
    string 'type?;
    string extraTitleInfo?;
    string category?;
    string[] categories?;
    string[] support?;
    boolean allocation?;
    int precision?;
    boolean calculated?;
    boolean segmentable?;
    string description?;
    string polarity?;
    string helpLink?;
    boolean allowedForReporting?;
    Tag[] tags?;
};

public type Locale record {
    string language?;
    string script?;
    string country?;
    string variant?;
    string[] extensionKeys?;
    string[] unicodeLocaleAttributes?;
    string[] unicodeLocaleKeys?;
    string iso3Language?;
    string iso3Country?;
    string displayLanguage?;
    string displayScript?;
    string displayCountry?;
    string displayVariant?;
    string displayName?;
};

# Owner
public type Owner record {
    # the login id of the owner
    int id;
    # the friendly full login name of the owner, included when the expansion parameter ownerFullName is true
    string name?;
    # the friendly full login name of the owner, included when the expansion parameter ownerFullName is true
    string login?;
};

public type RankedSettings record {
    int 'limit?;
    int page?;
    string dimensionSort?;
    boolean countRepeatInstances?;
    boolean reflectRequest?;
    boolean includeAnomalyDetection?;
    boolean includePercentChange?;
    boolean includeLatLong?;
    string nonesBehavior?;
};

public type ReportRow record {
    string rowId?;
    string[] filters?;
};

public type ReportErrorStatus record {
    string errorCode?;
    string errorDescription?;
    string errorId?;
    record {} errorDetails?;
    string rootCauseService?;
};

public type CalcMetricFunctionDef record {
    string func?;
    CalcMetricFunctionParameter[] parameters?;
    record {} formula?;
    int[] 'version?;
};

public type IdentityMetric record {
    string identity?;
    string dimensionView?;
    string allocationModel?;
};

public type RankedReportData record {
    int totalPages?;
    boolean firstPage?;
    boolean lastPage?;
    int numberOfElements?;
    int number?;
    int totalElements?;
    string message?;
    RankedRequest request?;
    string reportId?;
    RankedColumnMetaData columns?;
    Row[] rows?;
};

public type JsonNode record {
};

# Pred
public type AnalyticssegmentdefinitionContainerPred record {
    # Val
    AnalyticssegmentdefinitionContainerPredVal val?;
    # Str
    string str?;
    # Func
    string func?;
};

public type ResponsePageUsageLogDto record {
    UsageLogDto[] content?;
    int totalElements?;
    boolean lastPage?;
    int numberOfElements?;
    int totalPages?;
    boolean firstPage?;
    string sort?;
    int size?;
    int number?;
};

public type CalcMetricFunction record {
    # Calculated Metric Function ID
    string id?;
    # Calculated Metric Function category
    string category?;
    # If a Calculated Metric Function is persistable
    boolean persistable?;
    # Calculated Metric Function name
    string name?;
    # Calculated Metric Function namespace
    string namespace?;
    # Calculated Metric Function description
    string description?;
    # Calculated Metric Function example key
    string exampleKey?;
    # Calculated Metric Function example
    string example?;
    CalcMetricFunctionDef definition?;
};

public type SharedComponent record {
    string componentType?;
    string componentId?;
    Share[] shares?;
};

public type Pageable record {
    int offset?;
    Sort sort?;
    int pageNumber?;
    int pageSize?;
};

public type ProjectsValidateBody record {
    record {} project?;
};

public type ReportMetric record {
    string id?;
    string columnId?;
    string[] filters?;
    string sort?;
    record {} metricDefinition?;
    ReportMetricPredictiveSettings predictive?;
};

public type AnalyticsSegmentResponseItem record {
    # Id of the segment.
    string id?;
    # A name for the segment.
    string name?;
    # A description of the segment.
    string description?;
    # The report suite id.
    string rsid?;
    # The friendly name for the report suite id.
    string reportSuiteName?;
    # Owner
    Owner owner?;
    # Analytics segment definition
    AnalyticsSegmentDefinition definition?;
    # Segment compatibility.
    SegmentCompatibility compatibility?;
    string definitionLastModified?;
    string[] categories?;
    # A name for the report suite.  This is deprecated and should use the report suite name instead.
    string siteTitle?;
    # All existing tags associated with the segment.
    Tag[] tags?;
    # Modified date and time.
    string modified?;
    # Created date and time
    string created?;
};

public type ReportFilter record {
    string id?;
    string 'type?;
    string dimension?;
    string itemId?;
    string[] itemIds?;
    string segmentId?;
    record {} segmentDefinition?;
    string dateRange?;
    string[] excludeItemIds?;
};

public type Sort record {
};

public type UsageLogDto record {
    string dateCreated?;
    string eventDescription?;
    string ipAddress?;
    string rsid?;
    string eventType?;
    string login?;
};

public type ReportDimension record {
    string id?;
    string 'type?;
};

public type CalculatedMetricErrorStatus record {
    string errorCode?;
    string errorDescription?;
    string errorId?;
    record {} errorDetails?;
    string rootCauseService?;
};

public type RankedColumnError record {
    string columnId?;
    string errorCode?;
    string errorId?;
    string errorDescription?;
};

public type RankedRequest record {
    string rsid?;
    string dimension?;
    Locale locale?;
    ReportFilter[] globalFilters?;
    ReportSearch search?;
    RankedSettings settings?;
    RankedStatistics statistics?;
    ReportMetrics metricContainer?;
    ReportRows rowContainer?;
    string anchorDate?;
};

public type ComponentSearch record {
    string componentType?;
    string[] componentIds?;
};

public type ReportRows record {
    ReportFilter[] rowFilters?;
    ReportRow[] rows?;
};

public type AnalyticsUser record {
    int companyid?;
    int loginId?;
    string login?;
    boolean changePassword?;
    string createDate?;
    boolean disabled?;
    string email?;
    string firstName?;
    string fullName?;
    string imsUserId?;
    string lastName?;
    string lastAccess?;
    string phoneNumber?;
    string tempLoginEnd?;
    string title?;
};

public type AnalyticsDimension record {
    string id?;
    string title?;
    string name?;
    string 'type?;
    string category?;
    string[] categories?;
    string[] support?;
    boolean pathable?;
    string parent?;
    string extraTitleInfo?;
    boolean segmentable?;
    string[] reportable?;
    string description?;
    boolean allowedForReporting?;
    NoneSettings noneSettings?;
    Tag[] tags?;
};

public type ProjectCompatibility record {
    boolean valid?;
    string validatorVersion?;
    string message?;
};

public type NoneSettings record {
    boolean includeNoneByDefault?;
    boolean noneChangeable?;
};

public type UnhashReportData record {
    int totalPages?;
    boolean firstPage?;
    boolean lastPage?;
    int numberOfElements?;
    int number?;
    int totalElements?;
    string message?;
    string reportId?;
    string searchAnd?;
    string searchOr?;
    string searchNot?;
    string searchPhrase?;
    string oberonRequestXML?;
    string oberonResponseXML?;
    RowItem[] rows?;
};

public type DeleteResponse record {
    string result?;
    string message?;
};

public type RowItem record {
    string itemId?;
    string value?;
};

public type RollingDateFunction record {
    string 'function?;
    string granularity?;
    int offset?;
    string dow?;
    string date?;
};

public type Row record {
    string itemId?;
    string value?;
    string rowId?;
    decimal[] data?;
    decimal[] dataExpected?;
    decimal[] dataUpperBound?;
    decimal[] dataLowerBound?;
    boolean[] dataAnomalyDetected?;
    decimal[] percentChange?;
    decimal latitude?;
    decimal longitude?;
};

# Analytics segment definition
public type AnalyticsSegmentDefinition record {
    # Analytics segment definition container
    AnalyticssegmentdefinitionContainer container?;
    # Func
    string func?;
    # Version
    int[] 'version?;
};

public type AnalyticsSegment record {
    # A name for the segment.
    string name?;
    # A description of the segment.
    string description?;
    # The report suite id.
    string rsid?;
    # The friendly name for the report suite id.
    string reportSuiteName?;
    # Owner
    Owner owner?;
    # Analytics segment definition
    AnalyticsSegmentDefinition definition?;
    # Segment compatibility.
    SegmentCompatibility compatibility?;
    string definitionLastModified?;
    string[] categories?;
    # A name for the report suite.  This is deprecated and should use the report suite name instead.
    string siteTitle?;
    # All existing tags associated with the segment.
    Tag[] tags?;
    string modified?;
    string created?;
};

public type SuiteCollectionItem record {
    string name?;
    # Suite friendly timezone name
    string timezoneZoneInfo?;
    # Parent report suite id for virtual report suite
    string parentRsid?;
    # Suite type
    string collectionItemType?;
    string currency?;
    CalendarType calendarType?;
    string rsid?;
};

public type CalcMetricCompatibility record {
    boolean valid?;
    string message?;
    IdentityMetric[] identityMetrics?;
    string[] identityDimensions?;
    string[] segments?;
    string[] functions?;
    string validator_version?;
    string[] supported_products?;
    string[] supported_schema?;
};

public type PublishingStatus record {
    boolean published?;
    string publishedDate?;
    int lookbackPeriod?;
    string lookbackGranularity?;
};

public type InlineResponse200 record {
    int shareId?;
    InlineResponse200Success success?;
};

public type InlineResponse200Success record {
    string success?;
};

public type AnalyticsDateRange record {
    # System generated id
    string id?;
    # Name
    string name?;
    # Description
    string description?;
    # The report suite id for which the component was created/updated
    string rsid?;
    # The report suite name for which the component was created/updated
    string reportSuiteName?;
    # Owner
    Owner owner?;
    # Definition
    record {} definition?;
    # Tags
    Tag[] tags?;
    # Site Title
    string siteTitle?;
    # Modified date time
    string modified?;
    # Created date time
    string created?;
};

# Analytics segment definition container
public type AnalyticssegmentdefinitionContainer record {
    # Context
    string context?;
    # Func
    string func?;
    # Pred
    AnalyticssegmentdefinitionContainerPred pred?;
};

public type Column record {
    string 'type?;
    string id?;
    string title?;
    string[] segmentIds?;
};

public type CalcMetricFunctionParameter record {
    string func?;
    string name?;
    string 'type?;
    string friendlyNameKey?;
    string descKey?;
    string friendlyName?;
    string description?;
    record {} 'default\-value?;
};

public type AnalyticsDateRangeDefinition record {
    RollingDateFunction[] 'start?;
    RollingDateFunction[] end?;
    CalendarType calendarType?;
    string 'version?;
};

public type ReportMetricPredictiveSettings record {
    decimal anomalyConfidence?;
};

public type RankedColumnMetaData record {
    ReportDimension dimension?;
    string[] columnIds?;
    RankedColumnError[] columnErrors?;
};

public type CalculatedMetricDef record {
};

public type PredictiveSettings record {
    int trainingPeriods?;
    boolean highAnomalies?;
    boolean lowAnomalies?;
};

public type ReportMetrics record {
    ReportFilter[] metricFilters?;
    ReportMetric[] metrics?;
};

public type RankedStatistics record {
    string[] functions?;
    boolean ignoreZeroes?;
};

# Segment compatibility.
public type SegmentCompatibility record {
    # Validity
    boolean valid?;
    # Message
    string message?;
    # Validator version
    string validator_version?;
    # Suported products
    string[] supported_products?;
    # Supported schema
    string[] supported_schema?;
    # Supported features
    string[] supported_features?;
};

public type AnalyticsProject record {
    # System generated id
    string id?;
    # Name
    string name?;
    # Description
    string description?;
    # The report suite id for which the component was created/updated
    string rsid?;
    # The report suite name for which the component was created/updated
    string reportSuiteName?;
    # Owner
    Owner owner?;
    # Type
    string 'type?;
    JsonNode definition?;
    record {} externalReferences?;
    # Access Level
    string accessLevel?;
    string versionNotes?;
    record {}[] tags?;
    record {}[] shares?;
    string modified?;
    string created?;
};

# Val
public type AnalyticssegmentdefinitionContainerPredVal record {
    # Description
    string description?;
    # Name
    string name?;
    # Func
    string func?;
};

public type AnalyticsCalculatedMetric record {
    # System generated id
    string id?;
    string name?;
    string description?;
    # The report suite id for which the component was created/updated
    string rsid?;
    # The report suite name for which the component was created/updated
    string reportSuiteName?;
    # Owner
    Owner owner?;
    # Set metric polarity, which indicates whether it's good or bad if a given metric goes up. Default=positive
    string polarity?;
    # Number of decimal places to include in calculated metric result
    int precision?;
    string 'type?;
    CalculatedMetricDef definition;
    string[] categories?;
    Tag[] tags?;
    string siteTitle?;
    string modified?;
    # Calculated metric creation date
    string created?;
};

public type TaggedComponent record {
    string componentType?;
    string componentId?;
    Tag[] tags?;
};

public type InlineResponse2001 record {
    string result?;
};

public type AnalyticsVirtualReportSuite record {
    # System generated virtual report suite id
    string id?;
    string name?;
    string description?;
    # The report suite id for which the component was created/updated
    string rsid?;
    # The report suite name for which the component was created/updated
    string reportSuiteName?;
    # Owner
    Owner owner?;
    # Parent report suite id for virtual report suite
    string parentRsid?;
    # Parent report suite name
    string parentRsidName?;
    int timezone?;
    # List of segments applied to this virtual report suite
    string[] segmentList?;
    string currency?;
    CalendarType calendarType?;
    # Suite friendly timezone name
    string timezoneZoneInfo?;
    Tag[] tags?;
    string siteTitle?;
    string modified?;
    string created?;
};

public type ReportSearch record {
    string clause?;
    string[] excludeItemIds?;
    string[] itemIds?;
    boolean includeSearchTotal?;
    boolean empty?;
};

# Tag Model
public type Tag record {
    # the tag id
    int id?;
    # the tag name 
    string name?;
    # the tag description
    string description?;
    # the list of components that have been tagged with this tag
    TaggedComponent[] components?;
};

# Share Model
public type Share record {
    # the share id
    int id?;
    # the id of the user/group the component is shared with
    int shareToId?;
    # the type of entity shared with (user/group/all)
    string shareToType?;
    # full name of the entity shared with
    string shareToDisplayName?;
    # the type of component being shared
    string componentType?;
    # the id of the component being shared
    string componentId?;
    # Level of rights shared with entity. (for projects only)
    string accessLevel?;
};

public type CalendarType record {
    string rsid?;
    string 'type?;
    string anchorDate?;
};
