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

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# The Inventory API is used to create and manage inventory, and then to publish and manage this inventory on an eBay marketplace. There are also methods in this API that will convert eligible, active eBay listings into the Inventory API model.
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    # Client initialization.
    #
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.ebay.com/sell/inventory/v1") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    #
    # + payload - Details of the inventories with sku and locale
    # + return - Success
    remote isolated function bulkCreateOrReplaceInventoryItem(BulkInventoryItem payload) returns BulkInventoryItemResponse|error {
        string  path = string `/bulk_create_or_replace_inventory_item`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BulkInventoryItemResponse response = check self.clientEp->post(path, request, targetType=BulkInventoryItemResponse);
        return response;
    }
    #
    # + payload - Details of the inventories with sku and locale
    # + return - Success
    remote isolated function bulkGetInventoryItem(BulkGetInventoryItem payload) returns BulkGetInventoryItemResponse|error {
        string  path = string `/bulk_get_inventory_item`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BulkGetInventoryItemResponse response = check self.clientEp->post(path, request, targetType=BulkGetInventoryItemResponse);
        return response;
    }
    #
    # + payload - Price and allocation details for the given SKU and Marketplace
    # + return - Success
    remote isolated function bulkUpdatePriceQuantity(BulkPriceQuantity payload) returns BulkPriceQuantityResponse|error {
        string  path = string `/bulk_update_price_quantity`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BulkPriceQuantityResponse response = check self.clientEp->post(path, request, targetType=BulkPriceQuantityResponse);
        return response;
    }
    #
    # + sku - This is the seller-defined SKU value of the product whose inventory item record you wish to retrieve. Max length: 50.
    # + return - Success
    remote isolated function getInventoryItem(string sku) returns InventoryItemWithSkuLocaleGroupid|error {
        string  path = string `/inventory_item/${sku}`;
        InventoryItemWithSkuLocaleGroupid response = check self.clientEp-> get(path, targetType = InventoryItemWithSkuLocaleGroupid);
        return response;
    }
    #
    # + contentLanguage - This request header sets the natural language that will be provided in the field values of the request payload.
    # + sku - The seller-defined SKU value for the inventory item is required whether the seller is creating a new inventory item, or updating an existing inventory item. This SKU value is passed in at the end of the call URI. SKU values must be unique across the seller's inventory. Max length: 50.
    # + payload - Details of the inventory item record.
    # + return - Success
    remote isolated function createOrReplaceInventoryItem(string contentLanguage, string sku, InventoryItem payload) returns BaseResponse|error {
        string  path = string `/inventory_item/${sku}`;
        map<any> headerValues = {"Content-Language": contentLanguage};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BaseResponse response = check self.clientEp->put(path, request, headers = accHeaders, targetType=BaseResponse);
        return response;
    }
    #
    # + sku - This is the seller-defined SKU value of the product whose inventory item record you wish to delete. Max length: 50.
    # + return - No Content
    remote isolated function deleteInventoryItem(string sku) returns http:Response|error {
        string  path = string `/inventory_item/${sku}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    #
    # + 'limit - The value passed in this query parameter sets the maximum number of records to return per page of data. Although this field is a string, the value passed in this field should be an integer from 1 to 100. If this query parameter is not set, up to 100 records will be returned on each page of results. Min: 1, Max: 100
    # + offset - The value passed in this query parameter sets the page number to retrieve. The first page of records has a value of 0, the second page of records has a value of 1, and so on. If this query parameter is not set, its value defaults to 0, and the first page of records is returned.
    # + return - Success
    remote isolated function getInventoryItems(string? 'limit = (), string? offset = ()) returns InventoryItems|error {
        string  path = string `/inventory_item`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InventoryItems response = check self.clientEp-> get(path, targetType = InventoryItems);
        return response;
    }
    #
    # + sku - A SKU (stock keeping unit) is an unique identifier defined by a seller for a product
    # + return - Success
    remote isolated function getProductCompatibility(string sku) returns Compatibility|error {
        string  path = string `/inventory_item/${sku}/product_compatibility`;
        Compatibility response = check self.clientEp-> get(path, targetType = Compatibility);
        return response;
    }
    #
    # + contentLanguage - This request header sets the natural language that will be provided in the field values of the request payload.
    # + sku - A SKU (stock keeping unit) is an unique identifier defined by a seller for a product
    # + payload - Details of the compatibility
    # + return - Success
    remote isolated function createOrReplaceProductCompatibility(string contentLanguage, string sku, Compatibility payload) returns BaseResponse|error {
        string  path = string `/inventory_item/${sku}/product_compatibility`;
        map<any> headerValues = {"Content-Language": contentLanguage};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BaseResponse response = check self.clientEp->put(path, request, headers = accHeaders, targetType=BaseResponse);
        return response;
    }
    #
    # + sku - A SKU (stock keeping unit) is an unique identifier defined by a seller for a product
    # + return - No Content
    remote isolated function deleteProductCompatibility(string sku) returns http:Response|error {
        string  path = string `/inventory_item/${sku}/product_compatibility`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    #
    # + inventoryItemGroupKey - The unique identifier of an inventory item group. This value is assigned by the seller when an inventory item group is created. The inventoryItemGroupKey value for the inventory item group to retrieve is passed in at the end of the call URI.
    # + return - Success
    remote isolated function getInventoryItemGroup(string inventoryItemGroupKey) returns InventoryItemGroup|error {
        string  path = string `/inventory_item_group/${inventoryItemGroupKey}`;
        InventoryItemGroup response = check self.clientEp-> get(path, targetType = InventoryItemGroup);
        return response;
    }
    #
    # + contentLanguage - This request header sets the natural language that will be provided in the field values of the request payload.
    # + inventoryItemGroupKey - Unique identifier of the inventory item group. This identifier is supplied by the seller. The inventoryItemGroupKey value for the inventory item group to create/update is passed in at the end of the call URI. This value cannot be changed once it is set.
    # + payload - Details of the inventory Item Group
    # + return - Success
    remote isolated function createOrReplaceInventoryItemGroup(string contentLanguage, string inventoryItemGroupKey, InventoryItemGroup payload) returns BaseResponse|error {
        string  path = string `/inventory_item_group/${inventoryItemGroupKey}`;
        map<any> headerValues = {"Content-Language": contentLanguage};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BaseResponse response = check self.clientEp->put(path, request, headers = accHeaders, targetType=BaseResponse);
        return response;
    }
    #
    # + inventoryItemGroupKey - The unique identifier of an inventory item group. This value is assigned by the seller when an inventory item group is created. The inventoryItemGroupKey value for the inventory item group to delete is passed in at the end of the call URI.
    # + return - No Content
    remote isolated function deleteInventoryItemGroup(string inventoryItemGroupKey) returns http:Response|error {
        string  path = string `/inventory_item_group/${inventoryItemGroupKey}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    #
    # + payload - Details of the listings that needs to be migrated into Inventory
    # + return - Success
    remote isolated function bulkMigrateListing(BulkMigrateListing payload) returns BulkMigrateListingResponse|error {
        string  path = string `/bulk_migrate_listing`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BulkMigrateListingResponse response = check self.clientEp->post(path, request, targetType=BulkMigrateListingResponse);
        return response;
    }
    #
    # + payload - Details of the offer for the channel
    # + return - Success
    remote isolated function bulkCreateOffer(BulkEbayOfferDetailsWithKeys payload) returns BulkOfferResponse|error {
        string  path = string `/bulk_create_offer`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BulkOfferResponse response = check self.clientEp->post(path, request, targetType=BulkOfferResponse);
        return response;
    }
    #
    # + payload - The base request of the bulkPublishOffer method.
    # + return - Success
    remote isolated function bulkPublishOffer(BulkOffer payload) returns BulkPublishResponse|error {
        string  path = string `/bulk_publish_offer`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BulkPublishResponse response = check self.clientEp->post(path, request, targetType=BulkPublishResponse);
        return response;
    }
    #
    # + format - This enumeration value sets the listing format for the offer. This query parameter will be passed in if the seller only wants to see offers in this specified listing format.
    # + 'limit - The value passed in this query parameter sets the maximum number of records to return per page of data. Although this field is a string, the value passed in this field should be a positive integer value. If this query parameter is not set, up to 100 records will be returned on each page of results.
    # + marketplaceId - The unique identifier of the eBay marketplace. This query parameter will be passed in if the seller only wants to see the product's offers on a specific eBay marketplace. Note: At this time, the same SKU value can not be offered across multiple eBay marketplaces, so the marketplace_id query parameter currently does not have any practical use for this call.
    # + offset - The value passed in this query parameter sets the page number to retrieve. Although this field is a string, the value passed in this field should be a integer value equal to or greater than 0. The first page of records has a value of 0, the second page of records has a value of 1, and so on. If this query parameter is not set, its value defaults to 0, and the first page of records is returned.
    # + sku - The seller-defined SKU value is passed in as a query parameter. All offers associated with this product are returned in the response. Max length: 50.
    # + return - Success
    remote isolated function getOffers(string? format = (), string? 'limit = (), string? marketplaceId = (), string? offset = (), string? sku = ()) returns Offers|error {
        string  path = string `/offer`;
        map<anydata> queryParam = {"format": format, "limit": 'limit, "marketplace_id": marketplaceId, "offset": offset, "sku": sku};
        path = path + check getPathForQueryParam(queryParam);
        Offers response = check self.clientEp-> get(path, targetType = Offers);
        return response;
    }
    #
    # + contentLanguage - This request header sets the natural language that will be provided in the field values of the request payload.
    # + payload - Details of the offer for the channel
    # + return - Created
    remote isolated function createOffer(string contentLanguage, EbayOfferDetailsWithKeys payload) returns OfferResponse|error {
        string  path = string `/offer`;
        map<any> headerValues = {"Content-Language": contentLanguage};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OfferResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=OfferResponse);
        return response;
    }
    #
    # + offerId - The unique identifier of the offer that is to be retrieved.
    # + return - Success
    remote isolated function getOffer(string offerId) returns EbayOfferDetailsWithAll|error {
        string  path = string `/offer/${offerId}`;
        EbayOfferDetailsWithAll response = check self.clientEp-> get(path, targetType = EbayOfferDetailsWithAll);
        return response;
    }
    #
    # + contentLanguage - This request header sets the natural language that will be provided in the field values of the request payload.
    # + offerId - The unique identifier of the offer that is being updated. This identifier is passed in at the end of the call URI.
    # + payload - Details of the offer for the channel
    # + return - Success
    remote isolated function updateOffer(string contentLanguage, string offerId, EbayOfferDetailsWithId payload) returns OfferResponse|error {
        string  path = string `/offer/${offerId}`;
        map<any> headerValues = {"Content-Language": contentLanguage};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OfferResponse response = check self.clientEp->put(path, request, headers = accHeaders, targetType=OfferResponse);
        return response;
    }
    #
    # + offerId - The unique identifier of the offer to delete. The unique identifier of the offer (offerId) is passed in at the end of the call URI.
    # + return - No Content
    remote isolated function deleteOffer(string offerId) returns http:Response|error {
        string  path = string `/offer/${offerId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    #
    # + payload - List of offers that needs fee information
    # + return - Success
    remote isolated function getListingFees(OfferKeysWithId payload) returns FeesSummaryResponse|error {
        string  path = string `/offer/get_listing_fees`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FeesSummaryResponse response = check self.clientEp->post(path, request, targetType=FeesSummaryResponse);
        return response;
    }
    #
    # + offerId - The unique identifier of the offer that is to be published.
    # + return - Success
    remote isolated function publishOffer(string offerId) returns PublishResponse|error {
        string  path = string `/offer/${offerId}/publish/`;
        http:Request request = new;
        //TODO: Update the request as needed;
        PublishResponse response = check self.clientEp-> post(path, request, targetType = PublishResponse);
        return response;
    }
    #
    # + payload - The identifier of the inventory item group to publish and the eBay marketplace where the listing will be published is needed in the request payload.
    # + return - Success
    remote isolated function publishOfferByInventoryItemGroup(PublishByInventoryItemGroupRequest payload) returns PublishResponse|error {
        string  path = string `/offer/publish_by_inventory_item_group/`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PublishResponse response = check self.clientEp->post(path, request, targetType=PublishResponse);
        return response;
    }
    #
    # + offerId - The unique identifier of the offer that is to be withdrawn. This value is passed into the path of the call URI.
    # + return - Success
    remote isolated function withdrawOffer(string offerId) returns WithdrawResponse|error {
        string  path = string `/offer/${offerId}/withdraw`;
        http:Request request = new;
        //TODO: Update the request as needed;
        WithdrawResponse response = check self.clientEp-> post(path, request, targetType = WithdrawResponse);
        return response;
    }
    #
    # + payload - The base request of the withdrawOfferByInventoryItemGroup call.
    # + return - No Content
    remote isolated function withdrawOfferByInventoryItemGroup(WithdrawByInventoryItemGroupRequest payload) returns http:Response|error {
        string  path = string `/offer/withdraw_by_inventory_item_group`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    #
    # + merchantLocationKey - A unique merchant-defined key (ID) for an inventory location. This value is passed in at the end of the call URI to specify the inventory location to retrieve. Max length: 36
    # + return - Success
    remote isolated function getInventoryLocation(string merchantLocationKey) returns InventoryLocationResponse|error {
        string  path = string `/location/${merchantLocationKey}`;
        InventoryLocationResponse response = check self.clientEp-> get(path, targetType = InventoryLocationResponse);
        return response;
    }
    #
    # + merchantLocationKey - A unique, merchant-defined key (ID) for an inventory location. This unique identifier, or key, is used in other Inventory API calls to identify an inventory location. Max length: 36
    # + payload - Inventory Location details
    # + return - No Content
    remote isolated function createInventoryLocation(string merchantLocationKey, InventoryLocationFull payload) returns http:Response|error {
        string  path = string `/location/${merchantLocationKey}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    #
    # + merchantLocationKey - A unique merchant-defined key (ID) for an inventory location. This value is passed in at the end of the call URI to indicate the inventory location to be deleted. Max length: 36
    # + return - Success
    remote isolated function deleteInventoryLocation(string merchantLocationKey) returns http:Response|error {
        string  path = string `/location/${merchantLocationKey}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    #
    # + merchantLocationKey - A unique merchant-defined key (ID) for an inventory location. This value is passed in through the call URI to disable the specified inventory location. Max length: 36
    # + return - Success
    remote isolated function disableInventoryLocation(string merchantLocationKey) returns json|error {
        string  path = string `/location/${merchantLocationKey}/disable`;
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(path, request, targetType = json);
        return response;
    }
    #
    # + merchantLocationKey - A unique merchant-defined key (ID) for an inventory location. This value is passed in through the call URI to specify the disabled inventory location to enable. Max length: 36
    # + return - Success
    remote isolated function enableInventoryLocation(string merchantLocationKey) returns json|error {
        string  path = string `/location/${merchantLocationKey}/enable`;
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(path, request, targetType = json);
        return response;
    }
    #
    # + 'limit - The value passed in this query parameter sets the maximum number of records to return per page of data. Although this field is a string, the value passed in this field should be a positive integer value. If this query parameter is not set, up to 100 records will be returned on each page of results. Min: 1
    # + offset - Specifies the number of locations to skip in the result set before returning the first location in the paginated response. Combine offset with the limit query parameter to control the items returned in the response. For example, if you supply an offset of 0 and a limit of 10, the first page of the response contains the first 10 items from the complete list of items retrieved by the call. If offset is 10 and limit is 20, the first page of the response contains items 11-30 from the complete result set. Default: 0
    # + return - Success
    remote isolated function getInventoryLocations(string? 'limit = (), string? offset = ()) returns LocationResponse|error {
        string  path = string `/location`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        LocationResponse response = check self.clientEp-> get(path, targetType = LocationResponse);
        return response;
    }
    #
    # + merchantLocationKey - A unique merchant-defined key (ID) for an inventory location. This value is passed in the call URI to indicate the inventory location to be updated. Max length: 36
    # + payload - The inventory location details to be updated (other than the address and geo co-ordinates).
    # + return - Success
    remote isolated function updateInventoryLocation(string merchantLocationKey, InventoryLocation payload) returns http:Response|error {
        string  path = string `/location/${merchantLocationKey}/update_location_details`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
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

# Generate header map for given header values.
#
# + headerParam - Headers  map
# + return - Returns generated map or error at failure of client initialization
isolated function  getMapForHeaders(map<any>   headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
