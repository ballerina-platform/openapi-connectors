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
    OAuth2ClientCredentialsGrantConfig|http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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

# OAuth2 Client Credentials Grant Configs
public type OAuth2ClientCredentialsGrantConfig record {|
    *http:OAuth2ClientCredentialsGrantConfig;
    # Token URL
    string tokenUrl = "https://api.ebay.com/identity/v1/oauth2/token";
|};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://api.ebay.com/identity/v1/oauth2/token";
|};

# This is a generated connector for [eBay Metadata API v1.4.1](https://developer.ebay.com) OpenAPI specification. 
# 'The Metadata API has operations that retrieve configuration details pertaining to the different eBay marketplaces. 
# In addition to marketplace information, the API also has operations that get information that helps sellers list items on eBay.'
@display {label: "eBay Metadata", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [developer account](https://developer.ebay.com/api-docs/static/creating-edp-account.html) and obtain tokens following [this guide](https://developer.ebay.com/api-docs/static/oauth-tokens.html).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.ebay.com/sell/metadata/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # This method returns the eBay policies that define how to list automotive-parts-compatibility items in the categories of a specific marketplace. By default, this method returns the entire category tree for the specified marketplace. You can limit the size of the result set by using the filter query parameter to specify only the category IDs you want to review. Tip: This method can return a very large response payload and we strongly recommend you get the results from this call in a GZIP file by including the following HTTP header with your request: &nbsp;&nbsp;Accept-Encoding: application/gzip
    #
    # + filter - This query parameter limits the response by returning policy information for only the selected sections of the category tree. Supply categoryId values for the sections of the tree you want returned. When you specify a categoryId value, the returned category tree includes the policies for that parent node, plus the policies for any leaf nodes below that parent node. The parameter takes a list of categoryId values and you can specify up to 50 separate category IDs. Separate multiple values with a pipe character ('|'). If you specify more than 50 categoryId values, eBay returns the policies for the first 50 IDs and a warning that not all categories were returned. Example: filter=categoryIds:{100|101|102} Note that you must URL-encode the parameter list, which results in the following filter for the above example: &nbsp;&nbsp;filter=categoryIds%3A%7B100%7C101%7C102%7D 
    # + marketplaceId - This path parameter specifies the eBay marketplace for which policy information is retrieved. Note: Only the following eBay marketplaces support automotive parts compatibility: EBAY_US EBAY_AU EBAY_CA EBAY_DE EBAY_ES EBAY_FR EBAY_GB EBAY_IT 
    # + return - Success 
    remote isolated function getAutomotivePartsCompatibilityPolicies(string marketplaceId, string? filter = ()) returns AutomotivePartsCompatibilityPolicyResponse|error? {
        string resourcePath = string `/marketplace/${getEncodedUri(marketplaceId)}/get_automotive_parts_compatibility_policies`;
        map<anydata> queryParam = {"filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AutomotivePartsCompatibilityPolicyResponse? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method returns item condition metadata on one, multiple, or all eBay categories on an eBay marketplace. This metadata consists of the different item conditions (with IDs) that an eBay category supports, and a boolean to indicate if an eBay category requires an item condition. The identifier of the eBay marketplace is passed in as a path parameter, and unless one or more eBay category IDs are passed in through the filter query parameter, this method will return metadata on every single category for the specified marketplace. If you only want to view item condition metadata for one eBay category or a select group of eBay categories, you can pass in up to 50 eBay category ID through the filter query parameter. Important!: Certified Refurbished-eligible sellers must use an OAuth token created with the authorization code grant flow and https://api.ebay.com/oauth/api_scope/sell.inventory scope in order to retrieve the 'Certified Refurbished' condition (condition ID 2000) for the relevant categories. The Certified Refurbished item condition will not be returned if an OAuth token created with the client credentials grant flow and https://api.ebay.com/oauth/api_scope scope is used, or if any seller is not eligible to list with that item condition. See the Specifying OAuth scopes topic for more information about specifying scopes. Tip: If you retrieve metadata on all eBay categories for a marketplace, the response payload can be quite large. For this reason, we suggest that you consider using the Accept-Encoding request header and set its value to application/gzip. By doing this, the response payload output will be compressed into a GZIP file.
    #
    # + filter - This query parameter limits the response by returning policy information for only the selected sections of the category tree. Supply categoryId values for the sections of the tree you want returned. When you specify a categoryId value, the returned category tree includes the policies for that parent node, plus the policies for any leaf nodes below that parent node. The parameter takes a list of categoryId values and you can specify up to 50 separate category IDs. Separate multiple values with a pipe character ('|'). If you specify more than 50 categoryId values, eBay returns the policies for the first 50 IDs and a warning that not all categories were returned. Example: filter=categoryIds:{100|101|102} Note that you must URL-encode the parameter list, which results in the following filter for the above example: &nbsp;&nbsp;filter=categoryIds%3A%7B100%7C101%7C102%7D 
    # + marketplaceId - This path parameter specifies the eBay marketplace for which policy information is retrieved. See the following page for a list of valid eBay marketplace IDs: Request components. 
    # + return - Success 
    remote isolated function getItemConditionPolicies(string marketplaceId, string? filter = ()) returns ItemConditionPolicyResponse|error? {
        string resourcePath = string `/marketplace/${getEncodedUri(marketplaceId)}/get_item_condition_policies`;
        map<anydata> queryParam = {"filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ItemConditionPolicyResponse? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method returns the eBay policies that define the allowed listing structures for the categories of a specific marketplace. The listing-structure policies currently pertain to whether or not you can list items with variations. By default, this method returns the entire category tree for the specified marketplace. You can limit the size of the result set by using the filter query parameter to specify only the category IDs you want to review. Tip: This method can return a very large response payload and we strongly recommend you get the results from this call in a GZIP file by including the following HTTP header with your request: &nbsp;&nbsp;Accept-Encoding: application/gzip
    #
    # + filter - This query parameter limits the response by returning policy information for only the selected sections of the category tree. Supply categoryId values for the sections of the tree you want returned. When you specify a categoryId value, the returned category tree includes the policies for that parent node, plus the policies for any leaf nodes below that parent node. The parameter takes a list of categoryId values and you can specify up to 50 separate category IDs. Separate multiple values with a pipe character ('|'). If you specify more than 50 categoryId values, eBay returns the policies for the first 50 IDs and a warning that not all categories were returned. Example: filter=categoryIds:{100|101|102} Note that you must URL-encode the parameter list, which results in the following filter for the above example: &nbsp;&nbsp;filter=categoryIds%3A%7B100%7C101%7C102%7D 
    # + marketplaceId - This path parameter specifies the eBay marketplace for which policy information is retrieved. See the following page for a list of valid eBay marketplace IDs: Request components. 
    # + return - Success 
    remote isolated function getListingStructurePolicies(string marketplaceId, string? filter = ()) returns ListingStructurePolicyResponse|error? {
        string resourcePath = string `/marketplace/${getEncodedUri(marketplaceId)}/get_listing_structure_policies`;
        map<anydata> queryParam = {"filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListingStructurePolicyResponse? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method returns the eBay policies that define the supported negotiated price features (like &quot;best offer&quot;) for the categories of a specific marketplace. By default, this method returns the entire category tree for the specified marketplace. You can limit the size of the result set by using the filter query parameter to specify only the category IDs you want to review. Tip: This method can return a very large response payload and we strongly recommend you get the results from this call in a GZIP file by including the following HTTP header with your request: &nbsp;&nbsp;Accept-Encoding: application/gzip
    #
    # + filter - This query parameter limits the response by returning policy information for only the selected sections of the category tree. Supply categoryId values for the sections of the tree you want returned. When you specify a categoryId value, the returned category tree includes the policies for that parent node, plus the policies for any leaf nodes below that parent node. The parameter takes a list of categoryId values and you can specify up to 50 separate category IDs. Separate multiple values with a pipe character ('|'). If you specify more than 50 categoryId values, eBay returns the policies for the first 50 IDs and a warning that not all categories were returned. Example: filter=categoryIds:{100|101|102} Note that you must URL-encode the parameter list, which results in the following filter for the above example: &nbsp;&nbsp;filter=categoryIds%3A%7B100%7C101%7C102%7D 
    # + marketplaceId - This path parameter specifies the eBay marketplace for which policy information is retrieved. See the following page for a list of valid eBay marketplace IDs: Request components. 
    # + return - Success 
    remote isolated function getNegotiatedPricePolicies(string marketplaceId, string? filter = ()) returns NegotiatedPricePolicyResponse|error? {
        string resourcePath = string `/marketplace/${getEncodedUri(marketplaceId)}/get_negotiated_price_policies`;
        map<anydata> queryParam = {"filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        NegotiatedPricePolicyResponse? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method retrieves a list of leaf categories for a marketplace and identifies the categories that require items to have an eBay product ID value in order to be listed in those categories. An eBay product ID value (known as an &quot;ePID&quot;) is a value that references a specific product in the eBay Catalog. Important: eBay catalog product adoption is not currently required for any product categories. If product adoption requirements change, they will be noted here. Use the marketplace_id path parameter to specify the marketplace you want to review and use the filter query parameter to limit the categories returned in the response. Tip: This method can return a very large response payload and we strongly recommend you get the results from this call in a GZIP file by including the following HTTP header with your request: &nbsp;&nbsp;Accept-Encoding: application/gzip
    #
    # + filter - This query parameter limits the response by returning policy information for only the selected sections of the category tree. Supply categoryId values for the sections of the tree you want returned. When you specify a categoryId value, the returned category tree includes the policies for that parent node, plus the policies for any leaf nodes below that parent node. The parameter takes a list of categoryId values and you can specify up to 50 separate category IDs. Separate multiple values with a pipe character ('|'). If you specify more than 50 categoryId values, eBay returns the policies for the first 50 IDs and a warning that not all categories were returned. Example: filter=categoryIds:{100|101|102} Note that you must URL-encode the parameter list, which results in the following filter for the above example: &nbsp;&nbsp;filter=categoryIds%3A%7B100%7C101%7C102%7D 
    # + marketplaceId - This path parameter specifies the eBay marketplace for which policy information is retrieved. See the following page for a list of valid eBay marketplace IDs: Request components. 
    # + return - Success 
    remote isolated function getProductAdoptionPolicies(string marketplaceId, string? filter = ()) returns ProductAdoptionPolicyResponse|error? {
        string resourcePath = string `/marketplace/${getEncodedUri(marketplaceId)}/get_product_adoption_policies`;
        map<anydata> queryParam = {"filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ProductAdoptionPolicyResponse? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method returns the eBay policies that define whether or not you must include a return policy for the items you list in the categories of a specific marketplace, plus the guidelines for creating domestic and international return policies in the different eBay categories. By default, this method returns the entire category tree for the specified marketplace. You can limit the size of the result set by using the filter query parameter to specify only the category IDs you want to review. Tip: This method can return a very large response payload and we strongly recommend you get the results from this call in a GZIP file by including the following HTTP header with your request: &nbsp;&nbsp;Accept-Encoding: application/gzip
    #
    # + filter - This query parameter limits the response by returning policy information for only the selected sections of the category tree. Supply categoryId values for the sections of the tree you want returned. When you specify a categoryId value, the returned category tree includes the policies for that parent node, plus the policies for any leaf nodes below that parent node. The parameter takes a list of categoryId values and you can specify up to 50 separate category IDs. Separate multiple values with a pipe character ('|'). If you specify more than 50 categoryId values, eBay returns the policies for the first 50 IDs and a warning that not all categories were returned. Example: filter=categoryIds:{100|101|102} Note that you must URL-encode the parameter list, which results in the following filter for the above example: &nbsp;&nbsp;filter=categoryIds%3A%7B100%7C101%7C102%7D 
    # + marketplaceId - This path parameter specifies the eBay marketplace for which policy information is retrieved. See the following page for a list of valid eBay marketplace IDs: Request components. 
    # + return - Success 
    remote isolated function getReturnPolicies(string marketplaceId, string? filter = ()) returns ReturnPolicyResponse|error? {
        string resourcePath = string `/marketplace/${getEncodedUri(marketplaceId)}/get_return_policies`;
        map<anydata> queryParam = {"filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ReturnPolicyResponse? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method retrieves all the sales tax jurisdictions for the country that you specify in the countryCode path parameter. Countries with valid sales tax jurisdictions are Canada and the US. The response from this call tells you the jurisdictions for which a seller can configure tax tables. Although setting up tax tables is optional, you can use the createOrReplaceSalesTax in the Account API call to configure the tax tables for the jurisdictions you sell to.
    #
    # + countryCode - This path parameter specifies the two-letter ISO 3166 country code for the country whose jurisdictions you want to retrieve. eBay provides sales tax jurisdiction information for Canada and the United States.Valid values for this path parameter are CA and US. 
    # + return - Success 
    remote isolated function getSalesTaxJurisdictions(string countryCode) returns SalesTaxJurisdictions|error {
        string resourcePath = string `/country/${getEncodedUri(countryCode)}/sales_tax_jurisdiction`;
        SalesTaxJurisdictions response = check self.clientEp->get(resourcePath);
        return response;
    }
}
