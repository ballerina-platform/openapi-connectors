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
    string refreshUrl = "https://api.ebay.com/identity/v1/oauth2/token";
|};

# This type is used by the productRecommendation container, which is returned if eBay has found an eBay catalog product that may be a match for the product (or product variation) that has a listing violation. Note: eBay catalog product adoption is not enforced at this time, so product adoption violations are no longer returned. Due to this fact, this type and productRecommendation container are not currently applicable.
public type ProductRecommendation record {
    # This field will return the eBay Product ID {ePID) of an eBay Catalog product that eBay recommends that the seller use to make their listing compliant. Note: Product Adoption is not enforced at this time. Product Adoption violations are no longer returned.
    string epid?;
};

# This type is the base type for the getListingViolationsSummary response. The violationSummaries container contains an array of policy violation counts for each unique eBay marketplace and compliance type violation.
public type ComplianceSummary record {
    # This container is an array of one or more policy violation counts. A policy violation count is returned for each unique eBay marketplace and compliance type violation. As long as there is at least one non-compliant listing for the specified compliance type(s), this container will be returned. If no non-compliant listings are found for the specified compliance type(s), an HTTP status code of 204 No Content is returned, and there is no response body.
    ComplianceSummaryInfo[] violationSummaries?;
};

# This type is used to provide a name-value pair, including the identifying aspects of a product variation through the variationAspects container.
public type NameValueList record {
    # This is the name of the variation aspect, or the name of the category of information that is returned through the name-value pair. The type of information that appears here will vary based on the compliance type and type of violation.
    string name?;
    # This is the value of the variation aspect (in name field), or the value of the category of information that is returned through the name-value pair. The type of information that appears here will vary based on the compliance type and type of violation.
    string value?;
};

# This type is used by each listing violation that is returned under the violations container.
public type ComplianceDetail record {
    # This value states the nature of the listing violation. A reasonCode value is returned for each listing violation, and each compliance type can have several reason codes and related messages. The reasonCode values vary by compliance type. The reason codes for each compliance type are summarized below. Aspects adoption The reason codes for ASPECTS_ADOPTION compliance indicate that for the given violation, aspects listed in the violationData container are either missing from the listing or they have invalid values. The reason codes specify whether the violation is for required aspects, recommended (preferred) aspects, or soon to be required aspects. MISSING_OR_INVALID_REQUIRED_ASPECTS MISSING_OR_INVALID_PREFERRED_ASPECTS MISSING_OR_INVALID_SOON_TO_BE_REQUIRED_ASPECTS HTTPS The reason codes for HTTPS compliance identify where in the listing the violation occurs. For HTTPS policy violations, the seller will just need to remove the HTTP link (or update to HTTPS) from the listing details or product details: NON_SECURE_HTTP_LINK_IN_LISTING NON_SECURE_HTTP_LINK_IN_PRODUCT Non-eBay links The reason codes for OUTSIDE_EBAY_BUYING_AND_SELLING compliance identify the specific type of data (e.g., telephone number) that violated the policy. For each of these violations, the seller will just need to revise the listing, removing this information: UNAPPROVED_DOMAIN_WEBLINK_IN_LISTING PHONE_NUMBER_IN_LISTING EMAIL_ADDRESS_IN_LISTING Product adoption Product Adoption is not enforced at this time. Product adoption conformance Product Adoption is not enforced at this time. Returns policy The only RETURNS_POLICY reason code is UNSUPPORTED_RETURNS_PERIOD. The seller will have to revise their listing (or return business policy) with a supported return period for the site and category. The GetCategoryFeatures call of the Trading API can be used to verify the supported return periods for a particular category. For most eBay categories, the minimum return period that can be stated in a Returns Policy is 14 days for domestic and international sales, but some categories require a minimum 30-day return period.
    string reasonCode?;
    # This field provides a textual summary of the listing violation. A message field is returned for each listing violation. This message will vary widely based on the compliance type and corresponding reason code.
    string message?;
    # This type is used to identify the product variation that has the listing violation.
    VariationDetails variation?;
    # This container provides more information about the listing violation, if applicable. The type of information that appears here will vary based on the compliance type and type of violation. For example, for ASPECTS_ADOPTION violations, this container lists the missing aspect(s) or aspect(s) with invalid values.
    NameValueList[] violationData?;
    # This type is used by the correctiveRecommendations container, which is returned if eBay has suggestions for how to correct the given violation.
    CorrectiveRecommendations correctiveRecommendations?;
    # The enumeration value returned in this field indicates if the listing violation is considered to be OUT_OF_COMPLIANCE with an eBay listing policy, or the listing is considered to be AT_RISK of becoming non-compliant against an eBay listing policy. Generally, OUT_OF_COMPLIANCE policy violations can prevent the seller from revising a listing until the underlying violation(s) can be remedied. When the compliance state is AT_RISK, the seller is not blocked from revising the listing, but the seller should correct the violation to prevent the listing from being blocked for revisions in the future. Note: This field is returned for most violations, but not all. In the case that this field is not returned, it can be assumed that the state of the listing violation is OUT_OF_COMPLIANCE. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/compliance/types/com:ComplianceStateEnum'>eBay API documentation</a>
    string complianceState?;
};

# This type defines the fields that can be returned in an error.
public type Error record {
    # Identifies the type of erro.
    string category?;
    # Name for the primary system where the error occurred. This is relevant for application errors.
    string domain?;
    # A unique number to identify the error.
    int errorId?;
    # An array of request elements most closely associated to the error.
    string[] inputRefIds?;
    # A more detailed explanation of the error.
    string longMessage?;
    # Information on how to correct the problem, in the end user's terms and language where applicable.
    string message?;
    # An array of request elements most closely associated to the error.
    string[] outputRefIds?;
    # An array of name/value pairs that describe details the error condition. These are useful when multiple errors are returned.
    ErrorParameter[] parameters?;
    # Further helps indicate which subsystem the error is coming from. System subcategories include: Initialization, Serialization, Security, Monitoring, Rate Limiting, etc.
    string subdomain?;
};

public type ErrorParameter record {
    # The object of the error.
    string name?;
    # The value of the object.
    string value?;
};

# This type is the base response type of the getListingViolations method.
public type PagedComplianceViolationCollection record {
    # This integer value shows the offset of the current page of results. The offset value controls the first listing violation in the result set that will be displayed at the top of the response. The offset and limit query parameters are used to control the pagination of the output. For example, if offset is set to 10 and limit is set to 10, the call retrieves listing violations 11 thru 20 from the resulting collection of violations. Note: This feature employs a zero-based index, where the first item in the list has an offset of 0. Default: 0 {zero)
    int offset?;
    # The URI of the getListingViolations call request that produced the current page of the result set.
    string href?;
    # The total number of listing violations in the result set. If this value is higher than the limit value, there are multiple pages in the result set to view.
    int total?;
    # The getListingViolations call URI to use to view the next page of the result set. For example, the following URI returns listing violations 21 thru 30 from the collection of policy violations: path/listing_violation?limit=10&amp;offset=20 This field is only returned if an additional page of listing violations exists.
    string next?;
    # The getListingViolations call URI to use to view the previous page of the result set. For example, the following URI returns listing violations 1 thru 10 from the collection of policy violations: path/listing_violation?limit=10&amp;offset=0 This field is only returned if an previous page of listing violations exists.
    string prev?;
    # The maximum number of listing violations returned per page of the result set. The limit and offset query parameters are used to control the pagination of the output. Note: If this is the last or only page in the result set, it may contain fewer listing violations than the limit value. To determine the number of pages in the result set, divide this value into the value of total and round up to the next integer. Default: 50 Max: 200
    int 'limit?;
    # An array of listing violations that match the criteria in the call request, including pagination control {if set). As long as there is at least one listing violation that matches the input criteria, this container will be returned. If no listing violations are found for the seller, an HTTP status code of 204 No Content is returned, and there is no response body.
    ComplianceViolation[] listingViolations?;
};

# This is the base request type of the suppressViolation method, and is used to identify the listing violation that the seller wishes to suppress.
public type SuppressViolationRequest record {
    # The compliance type of the listing violation to suppress is specified in this field. The compliance type for each listing violation is found in the complianceType field under the listingViolations array in a getListingViolations response. Note: At this time, the suppressViolation method is only used to suppress aspect adoption listing violations in the 'at-risk' state, so ASPECTS_ADOPTION is currently the only supported value for this field. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/compliance/types/com:ComplianceTypeEnum'>eBay API documentation</a>
    string complianceType?;
    # The unique identifier of the listing with the violation(s) is specified in this field. The unique identifier of the listing with the listing violation(s) is found in the listingId field under the listingViolations array in a getListingViolations response. Note: At this time, the suppressViolation method is only used to suppress aspect adoption listing violations in the 'at-risk' state, so the listing specified in this field should be a listing with an ASPECTS_ADOPTION violation in the 'at-risk' state.
    string listingId?;
};

# This type is used by the aspectsRecommendation container, which is returned if eBay has found a listing with missing or invalid item aspects (ASPECTS_ADOPTION compliance type).
public type AspectRecommendations record {
    # The name of the item aspect for which eBay has a recommendation. In many cases, the same item aspect(s) that are returned under the violationData array for ASPECTS_ADOPTION listing violations are also returned here Note: This name is always localized for the specified marketplace.
    string localizedAspectName?;
    # One or more valid values for the corresponding item aspect (in localizedAspectName) are returned here. These suggested values for the item aspect depend on the listing category and on the information specified in the listing. Sellers should confirm accuracy of the values before applying them to the listing. Please use getItemAspectsForCategory in the Taxonomy API or GetCategorySpecifics in the Trading API to get a comprehensive list of required and recommended aspects for a given category and a list of supported aspect values for each.
    string[] suggestedValues?;
};

# This type is used by each unique eBay marketplace and compliance type combination that is returned in the getListingViolationsSummary response to indicate the total number of listing violations in regards to that eBay marketplace and compliance type.
public type ComplianceSummaryInfo record {
    # This enumeration value indicates the type of compliance. See ComplianceTypeEnum for more information on each compliance type. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/compliance/types/com:ComplianceTypeEnum'>eBay API documentation</a>
    string complianceType?;
    # This enumeration value indicates the eBay marketplace where the listing violations exist. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/compliance/types/bas:MarketplaceIdEnum'>eBay API documentation</a>
    string marketplaceId?;
    # This integer value indicates the number of eBay listings that are currently violating the compliance type indicated in the complianceType field, for the eBay marketplace indicated in the marketplaceId field.
    int listingCount?;
};

# This type is used by each listing violation that is returned under the listingViolations container.
public type ComplianceViolation record {
    # This enumeration value indicates the compliance type of listing violation. See ComplianceTypeEnum for more information on each compliance type. This will always be returned for each listing violation that is found. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/compliance/types/com:ComplianceTypeEnum'>eBay API documentation</a>
    string complianceType?;
    # The unique identifier of the eBay listing that currently has the corresponding listing violation{s). This field will always be returned for each listing that has one or more violations.
    string listingId?;
    # The seller-defined SKU value of the product in the listing with the violation{s). This field is only returned if defined in the listing. SKU values are optional in listings except when creating listings using the Inventory API model.
    string sku?;
    # Note: This field is for future use, and will not be returned, even for listings created through the Inventory API. The unique identifier of the offer. This field is only applicable and returned for listings that were created through the Inventory API. To convert an Inventory Item object into an eBay listing, an Offer object must be created and published.
    string offerId?;
    # This container consists of an array of one or more listing violations applicable to the eBay listing specified in the listingId field. This array is returned for each eBay listing that has one or more violations. For each returned violation, the fields that are returned and the details that are given will depend on the listing violation.
    ComplianceDetail[] violations?;
};

# This type is used to identify the product variation that has the listing violation.
public type VariationDetails record {
    # The seller-defined SKU value of the variation within the multiple-variation listing with the violation{s). This field is only returned if a seller-defined SKU value is defined for the variation. SKU values are optional in listing except when creating listings using the Inventory API.
    string sku?;
    # An array of one or more variation aspects that define a variation within a multiple-variation listing. The aspect{s) returned here define the individual variation, because these aspects will differ for each variation. Common varying aspects include color and size.
    NameValueList[] variationAspects?;
};

# This type is used by the correctiveRecommendations container, which is returned if eBay has suggestions for how to correct the given violation.
public type CorrectiveRecommendations record {
    # This type is used by the productRecommendation container, which is returned if eBay has found an eBay catalog product that may be a match for the product (or product variation) that has a listing violation. Note: eBay catalog product adoption is not enforced at this time, so product adoption violations are no longer returned. Due to this fact, this type and productRecommendation container are not currently applicable.
    ProductRecommendation productRecommendation?;
    # This container is returned for ASPECTS_ADOPTION violations if eBay has found one or more item aspect name-value pairs that may be appropriate for the seller's product. In many cases, the missing or invalid item aspect(s) shown under the corresponding violationData array, will also show up under this array with suggested value(s).
    AspectRecommendations[] aspectRecommendations?;
};
