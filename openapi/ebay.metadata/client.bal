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

import ballerina/http;
import ballerina/url;
import ballerina/lang.'string;

public type ClientConfig record {
    http:OAuth2ClientCredentialsGrantConfig|http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# This is a generated connector for [eBay Metadata API v1.4.1](https://developer.ebay.com) OpenAPI specification. 
# 'The Metadata API has operations that retrieve configuration details pertaining to the different eBay marketplaces. 
# In addition to marketplace information, the API also has operations that get information that helps sellers list items on eBay.'
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
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    #
    # + marketplaceId - This path parameter specifies the eBay marketplace for which policy information is retrieved. Note: Only the following eBay marketplaces support automotive parts compatibility: EBAY_US EBAY_AU EBAY_CA EBAY_DE EBAY_ES EBAY_FR EBAY_GB EBAY_IT
    # + filter - This query parameter limits the response by returning policy information for only the selected sections of the category tree. Supply categoryId values for the sections of the tree you want returned. When you specify a categoryId value, the returned category tree includes the policies for that parent node, plus the policies for any leaf nodes below that parent node. The parameter takes a list of categoryId values and you can specify up to 50 separate category IDs. Separate multiple values with a pipe character ('|'). If you specify more than 50 categoryId values, eBay returns the policies for the first 50 IDs and a warning that not all categories were returned. Example: filter=categoryIds:{100|101|102} Note that you must URL-encode the parameter list, which results in the following filter for the above example: &nbsp;&nbsp;filter=categoryIds%3A%7B100%7C101%7C102%7D
    # + return - Success
    remote isolated function getAutomotivePartsCompatibilityPolicies(string marketplaceId, string? filter = ()) returns AutomotivePartsCompatibilityPolicyResponse|error {
        string  path = string `/marketplace/${marketplaceId}/get_automotive_parts_compatibility_policies`;
        map<anydata> queryParam = {"filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        AutomotivePartsCompatibilityPolicyResponse response = check self.clientEp-> get(path, targetType = AutomotivePartsCompatibilityPolicyResponse);
        return response;
    }
    #
    # + marketplaceId - This path parameter specifies the eBay marketplace for which policy information is retrieved. See the following page for a list of valid eBay marketplace IDs: Request components.
    # + filter - This query parameter limits the response by returning policy information for only the selected sections of the category tree. Supply categoryId values for the sections of the tree you want returned. When you specify a categoryId value, the returned category tree includes the policies for that parent node, plus the policies for any leaf nodes below that parent node. The parameter takes a list of categoryId values and you can specify up to 50 separate category IDs. Separate multiple values with a pipe character ('|'). If you specify more than 50 categoryId values, eBay returns the policies for the first 50 IDs and a warning that not all categories were returned. Example: filter=categoryIds:{100|101|102} Note that you must URL-encode the parameter list, which results in the following filter for the above example: &nbsp;&nbsp;filter=categoryIds%3A%7B100%7C101%7C102%7D
    # + return - Success
    remote isolated function getItemConditionPolicies(string marketplaceId, string? filter = ()) returns ItemConditionPolicyResponse|error {
        string  path = string `/marketplace/${marketplaceId}/get_item_condition_policies`;
        map<anydata> queryParam = {"filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        ItemConditionPolicyResponse response = check self.clientEp-> get(path, targetType = ItemConditionPolicyResponse);
        return response;
    }
    #
    # + marketplaceId - This path parameter specifies the eBay marketplace for which policy information is retrieved. See the following page for a list of valid eBay marketplace IDs: Request components.
    # + filter - This query parameter limits the response by returning policy information for only the selected sections of the category tree. Supply categoryId values for the sections of the tree you want returned. When you specify a categoryId value, the returned category tree includes the policies for that parent node, plus the policies for any leaf nodes below that parent node. The parameter takes a list of categoryId values and you can specify up to 50 separate category IDs. Separate multiple values with a pipe character ('|'). If you specify more than 50 categoryId values, eBay returns the policies for the first 50 IDs and a warning that not all categories were returned. Example: filter=categoryIds:{100|101|102} Note that you must URL-encode the parameter list, which results in the following filter for the above example: &nbsp;&nbsp;filter=categoryIds%3A%7B100%7C101%7C102%7D
    # + return - Success
    remote isolated function getListingStructurePolicies(string marketplaceId, string? filter = ()) returns ListingStructurePolicyResponse|error {
        string  path = string `/marketplace/${marketplaceId}/get_listing_structure_policies`;
        map<anydata> queryParam = {"filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        ListingStructurePolicyResponse response = check self.clientEp-> get(path, targetType = ListingStructurePolicyResponse);
        return response;
    }
    #
    # + marketplaceId - This path parameter specifies the eBay marketplace for which policy information is retrieved. See the following page for a list of valid eBay marketplace IDs: Request components.
    # + filter - This query parameter limits the response by returning policy information for only the selected sections of the category tree. Supply categoryId values for the sections of the tree you want returned. When you specify a categoryId value, the returned category tree includes the policies for that parent node, plus the policies for any leaf nodes below that parent node. The parameter takes a list of categoryId values and you can specify up to 50 separate category IDs. Separate multiple values with a pipe character ('|'). If you specify more than 50 categoryId values, eBay returns the policies for the first 50 IDs and a warning that not all categories were returned. Example: filter=categoryIds:{100|101|102} Note that you must URL-encode the parameter list, which results in the following filter for the above example: &nbsp;&nbsp;filter=categoryIds%3A%7B100%7C101%7C102%7D
    # + return - Success
    remote isolated function getNegotiatedPricePolicies(string marketplaceId, string? filter = ()) returns NegotiatedPricePolicyResponse|error {
        string  path = string `/marketplace/${marketplaceId}/get_negotiated_price_policies`;
        map<anydata> queryParam = {"filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        NegotiatedPricePolicyResponse response = check self.clientEp-> get(path, targetType = NegotiatedPricePolicyResponse);
        return response;
    }
    #
    # + marketplaceId - This path parameter specifies the eBay marketplace for which policy information is retrieved. See the following page for a list of valid eBay marketplace IDs: Request components.
    # + filter - This query parameter limits the response by returning policy information for only the selected sections of the category tree. Supply categoryId values for the sections of the tree you want returned. When you specify a categoryId value, the returned category tree includes the policies for that parent node, plus the policies for any leaf nodes below that parent node. The parameter takes a list of categoryId values and you can specify up to 50 separate category IDs. Separate multiple values with a pipe character ('|'). If you specify more than 50 categoryId values, eBay returns the policies for the first 50 IDs and a warning that not all categories were returned. Example: filter=categoryIds:{100|101|102} Note that you must URL-encode the parameter list, which results in the following filter for the above example: &nbsp;&nbsp;filter=categoryIds%3A%7B100%7C101%7C102%7D
    # + return - Success
    remote isolated function getProductAdoptionPolicies(string marketplaceId, string? filter = ()) returns ProductAdoptionPolicyResponse|error {
        string  path = string `/marketplace/${marketplaceId}/get_product_adoption_policies`;
        map<anydata> queryParam = {"filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        ProductAdoptionPolicyResponse response = check self.clientEp-> get(path, targetType = ProductAdoptionPolicyResponse);
        return response;
    }
    #
    # + marketplaceId - This path parameter specifies the eBay marketplace for which policy information is retrieved. See the following page for a list of valid eBay marketplace IDs: Request components.
    # + filter - This query parameter limits the response by returning policy information for only the selected sections of the category tree. Supply categoryId values for the sections of the tree you want returned. When you specify a categoryId value, the returned category tree includes the policies for that parent node, plus the policies for any leaf nodes below that parent node. The parameter takes a list of categoryId values and you can specify up to 50 separate category IDs. Separate multiple values with a pipe character ('|'). If you specify more than 50 categoryId values, eBay returns the policies for the first 50 IDs and a warning that not all categories were returned. Example: filter=categoryIds:{100|101|102} Note that you must URL-encode the parameter list, which results in the following filter for the above example: &nbsp;&nbsp;filter=categoryIds%3A%7B100%7C101%7C102%7D
    # + return - Success
    remote isolated function getReturnPolicies(string marketplaceId, string? filter = ()) returns ReturnPolicyResponse|error {
        string  path = string `/marketplace/${marketplaceId}/get_return_policies`;
        map<anydata> queryParam = {"filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        ReturnPolicyResponse response = check self.clientEp-> get(path, targetType = ReturnPolicyResponse);
        return response;
    }
    #
    # + countryCode - This path parameter specifies the two-letter ISO 3166 country code for the country whose jurisdictions you want to retrieve. eBay provides sales tax jurisdiction information for Canada and the United States.Valid values for this path parameter are CA and US.
    # + return - Success
    remote isolated function getSalesTaxJurisdictions(string countryCode) returns SalesTaxJurisdictions|error {
        string  path = string `/country/${countryCode}/sales_tax_jurisdiction`;
        SalesTaxJurisdictions response = check self.clientEp-> get(path, targetType = SalesTaxJurisdictions);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
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
