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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
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
|};

# The Inventory API is used to create and manage inventory, and then to publish and manage this inventory on an eBay marketplace. There are also methods in this API that will convert eligible, active eBay listings into the Inventory API model.
@display {label: "Ebay Inventory", iconPath: "resources/ebay.inventory.svg"} 
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.ebay.com/sell/inventory/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Note: Please note that any eBay listing created using the Inventory API cannot be revised or relisted using the Trading API calls. This call can be used to create and/or update up to 25 new inventory item records. It is up to sellers whether they want to create a complete inventory item records right from the start, or sellers can provide only some information with the initial bulkCreateOrReplaceInventoryItem call, and then make one or more additional bulkCreateOrReplaceInventoryItem calls to complete all required fields for the inventory item records and prepare for publishing. Upon first creating inventory item records, only the SKU values are required. In the case of updating existing inventory item records, the bulkCreateOrReplaceInventoryItem call will do a complete replacement of the existing inventory item records, so all fields that are currently defined for the inventory item record are required in that update action, regardless of whether their values changed. So, when replacing/updating an inventory item record, it is advised that the seller run a 'Get' call to retrieve the full details of the inventory item records and see all of its current values/settings before attempting to update the records. Any changes that are made to inventory item records that are part of one or more active eBay listings, a successful call will automatically update these active listings. The key information that is set with the bulkCreateOrReplaceInventoryItem call include: Seller-defined SKU value for the product. Each seller product, including products within an item inventory group, must have their own SKU value. Condition of the item Product details, including any product identifier(s), such as a UPC, ISBN, EAN, or Brand/Manufacturer Part Number pair, a product description, a product title, product/item aspects, and links to images. eBay will use any supplied eBay Product ID (ePID) or a GTIN (UPC, ISBN, or EAN) and attempt to match those identifiers to a product in the eBay Catalog, and if a product match is found, the product details for the inventory item will automatically be populated. Quantity of the inventory item that is available for purchase Package weight and dimensions, which is required if the seller will be offering calculated shipping options. The package weight will also be required if the seller will be providing flat-rate shipping services, but charging a weight surcharge. In addition to the authorization header, which is required for all eBay REST API calls, the bulkCreateOrReplaceInventoryItem call also requires the Content-Language header, that sets the natural language that will be used in the field values of the request payload. For US English, the code value passed in this header should be en-US. To view other supported Content-Language values, and to read more about all supported HTTP headers for eBay REST API calls, see the HTTP request headers topic in the Using eBay RESTful APIs document. For those who prefer to create or update a single inventory item record, the createOrReplaceInventoryItem method can be used.
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
    # This call retrieves up to 25 inventory item records. The SKU value of each inventory item record to retrieve is specified in the request payload. The authorization header is the only required HTTP header for this call, and it is required for all Inventory API calls. See the HTTP request headers section for more information. For those who prefer to retrieve only one inventory item record by SKU value, , the getInventoryItem method can be used. To retrieve all inventory item records defined on the seller's account, the getInventoryItems method can be used (with pagination control if desired).
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
    # This call is used by the seller to update the total ship-to-home quantity of one inventory item, and/or to update the price and/or quantity of one or more offers associated with one inventory item. Up to 25 offers associated with an inventory item may be updated with one bulkUpdatePriceQuantity call. Only one SKU (one product) can be updated per call. The getOffers call can be used to retrieve all offers associated with a SKU. The seller will just pass in the correct SKU value through the sku query parameter. To update an offer, the offerId value is required, and this value is returned in the getOffers call response. It is also useful to know which offers are unpublished and which ones are published. To get this status, look for the status value in the getOffers call response. Offers in the published state are live eBay listings, and these listings will be revised with a successful bulkUpdatePriceQuantity call. An issue will occur if duplicate offerId values are passed through the same offers container, or if one or more of the specified offers are associated with different products/SKUs. Note: For multiple-variation listings, it is recommended that the bulkUpdatePriceQuantity call be used to update price and quantity information for each SKU within that multiple-variation listing instead of using createOrReplaceInventoryItem calls to update the price and quantity for each SKU. Just remember that only one SKU (one product variation) can be updated per call. The authorization header is the only required HTTP header for this call. See the HTTP request headers section for more information.
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
    # This call retrieves the inventory item record for a given SKU. The SKU value is passed in at the end of the call URI. There is no request payload for this call. The authorization header is the only required HTTP header for this call, and it is required for all Inventory API calls. See the HTTP request headers section for more information. For those who prefer to retrieve numerous inventory item records by SKU value with one call (up to 25 at a time), the bulkGetInventoryItem method can be used. To retrieve all inventory item records defined on the seller's account, the getInventoryItems method can be used (with pagination control if desired).
    #
    # + sku - This is the seller-defined SKU value of the product whose inventory item record you wish to retrieve. Max length: 50. 
    # + return - Success 
    remote isolated function getInventoryItem(string sku) returns InventoryItemWithSkuLocaleGroupid|error {
        string  path = string `/inventory_item/${sku}`;
        InventoryItemWithSkuLocaleGroupid response = check self.clientEp-> get(path, targetType = InventoryItemWithSkuLocaleGroupid);
        return response;
    }
    # Note: Please note that any eBay listing created using the Inventory API cannot be revised or relisted using the Trading API calls. This call creates a new inventory item record or replaces an existing inventory item record. It is up to sellers whether they want to create a complete inventory item record right from the start, or sellers can provide only some information with the initial createOrReplaceInventoryItem call, and then make one or more additional createOrReplaceInventoryItem calls to complete all required fields for the inventory item record and prepare it for publishing. Upon first creating an inventory item record, only the SKU value in the call path is required. In the case of replacing an existing inventory item record, the createOrReplaceInventoryItem call will do a complete replacement of the existing inventory item record, so all fields that are currently defined for the inventory item record are required in that update action, regardless of whether their values changed. So, when replacing/updating an inventory item record, it is advised that the seller run a getInventoryItem call to retrieve the full inventory item record and see all of its current values/settings before attempting to update the record. And if changes are made to an inventory item that is part of one or more active eBay listings, a successful call will automatically update these eBay listings. The key information that is set with the createOrReplaceInventoryItem call include: Seller-defined SKU value for the product. Each seller product, including products within an item inventory group, must have their own SKU value. This SKU value is passed in at the end of the call URI Condition of the item Product details, including any product identifier(s), such as a UPC, ISBN, EAN, or Brand/Manufacturer Part Number pair, a product description, a product title, product/item aspects, and links to images. eBay will use any supplied eBay Product ID (ePID) or a GTIN (UPC, ISBN, or EAN) and attempt to match those identifiers to a product in the eBay Catalog, and if a product match is found, the product details for the inventory item will automatically be populated. Quantity of the inventory item that is available for purchase Package weight and dimensions, which is required if the seller will be offering calculated shipping options. The package weight will also be required if the seller will be providing flat-rate shipping services, but charging a weight surcharge. In addition to the authorization header, which is required for all eBay REST API calls, the createOrReplaceInventoryItem call also requires the Content-Language header, that sets the natural language that will be used in the field values of the request payload. For US English, the code value passed in this header should be en-US. To view other supported Content-Language values, and to read more about all supported HTTP headers for eBay REST API calls, see the HTTP request headers topic in the Using eBay RESTful APIs document. For those who prefer to create or update numerous inventory item records with one call (up to 25 at a time), the bulkCreateOrReplaceInventoryItem method can be used.
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
    # This call is used to delete an inventory item record associated with a specified SKU. A successful call will not only delete that inventory item record, but will also have the following effects: Delete any and all unpublished offers associated with that SKU; Delete any and all single-variation eBay listings associated with that SKU; Automatically remove that SKU from a multiple-variation listing and remove that SKU from any and all inventory item groups in which that SKU was a member. The authorization header is the only required HTTP header for this call. See the HTTP request headers section for more information.
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
    # This call retrieves all inventory item records defined for the seller's account. The limit query parameter allows the seller to control how many records are returned per page, and the offset query parameter is used to retrieve a specific page of records. The seller can make multiple calls to scan through multiple pages of records. There is no request payload for this call. The authorization header is the only required HTTP header for this call, and it is required for all Inventory API calls. See the HTTP request headers section for more information. For those who prefer to retrieve numerous inventory item records by SKU value with one call (up to 25 at a time), the bulkGetInventoryItem method can be used.
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
    # This call is used by the seller to retrieve the list of products that are compatible with the inventory item. The SKU value for the inventory item is passed into the call URI, and a successful call with return the compatible vehicle list associated with this inventory item. Product compatibility is currently only applicable to motor vehicle parts and accessory categories, but more categories may be supported in the future.
    #
    # + sku - A SKU (stock keeping unit) is an unique identifier defined by a seller for a product 
    # + return - Success 
    remote isolated function getProductCompatibility(string sku) returns Compatibility|error {
        string  path = string `/inventory_item/${sku}/product_compatibility`;
        Compatibility response = check self.clientEp-> get(path, targetType = Compatibility);
        return response;
    }
    # This call is used by the seller to create or replace a list of products that are compatible with the inventory item. The inventory item is identified with a SKU value in the URI. Product compatibility is currently only applicable to motor vehicle parts and accessory categories, but more categories may be supported in the future. In addition to the authorization header, which is required for all eBay REST API calls, the createOrReplaceProductCompatibility call also requires the Content-Language header, that sets the natural language that will be used in the field values of the request payload. For US English, the code value passed in this header should be en-US. To view other supported Content-Language values, and to read more about all supported HTTP headers for eBay REST API calls, see the HTTP request headers topic in the Using eBay RESTful APIs document.
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
    # This call is used by the seller to delete the list of products that are compatible with the inventory item that is associated with the compatible product list. The inventory item is identified with a SKU value in the URI. Product compatibility is currently only applicable to motor vehicle parts and accessory categories, but more categories may be supported in the future.
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
    # This call retrieves the inventory item group for a given inventoryItemGroupKey value. The inventoryItemGroupKey value is passed in at the end of the call URI.
    #
    # + inventoryItemGroupKey - The unique identifier of an inventory item group. This value is assigned by the seller when an inventory item group is created. The inventoryItemGroupKey value for the inventory item group to retrieve is passed in at the end of the call URI. 
    # + return - Success 
    remote isolated function getInventoryItemGroup(string inventoryItemGroupKey) returns InventoryItemGroup|error {
        string  path = string `/inventory_item_group/${inventoryItemGroupKey}`;
        InventoryItemGroup response = check self.clientEp-> get(path, targetType = InventoryItemGroup);
        return response;
    }
    # This call creates a new inventory item group or updates an existing inventory item group. It is up to sellers whether they want to create a complete inventory item group record right from the start, or sellers can provide only some information with the initial createOrReplaceInventoryItemGroup call, and then make one or more additional createOrReplaceInventoryItemGroup calls to complete the inventory item group record. Upon first creating an inventory item group record, the only required elements are the inventoryItemGroupKey identifier in the call URI, and the members of the inventory item group specified through the variantSKUs array in the request payload. In the case of updating/replacing an existing inventory item group, this call does a complete replacement of the existing inventory item group record, so all fields (including the member SKUs) that make up the inventory item group are required, regardless of whether their values changed. So, when replacing/updating an inventory item group record, it is advised that the seller run a getInventoryItemGroup call for that inventory item group to see all of its current values/settings/members before attempting to update the record. And if changes are made to an inventory item group that is part of a live, multiple-variation eBay listing, these changes automatically update the eBay listing. For example, if a SKU value is removed from the inventory item group, the corresponding product variation will be removed from the eBay listing as well. In addition to the required inventory item group identifier and member SKUs, other key information that is set with this call include: Title and description of the inventory item group. The string values provided in these fields will actually become the listing title and listing description of the listing once the first SKU of the inventory item group is published successfully Common aspects that inventory items in the qroup share Product aspects that vary within each product variation Links to images demonstrating the variations of the product, and these images should correspond to the product aspect that is set with the variesBy.aspectsImageVariesBy field In addition to the authorization header, which is required for all eBay REST API calls, the createOrReplaceInventoryItemGroup call also requires the Content-Language header, that sets the natural language that will be used in the field values of the request payload. For US English, the code value passed in this header should be en-US. To view other supported Content-Language values, and to read more about all supported HTTP headers for eBay REST API calls, see the HTTP request headers topic in the Using eBay RESTful APIs document.
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
    # This call deletes the inventory item group for a given inventoryItemGroupKey value.
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
    # This call is used to convert existing eBay Listings to the corresponding Inventory API objects. If an eBay listing is successfully migrated to the Inventory API model, new Inventory Location, Inventory Item, and Offer objects are created. For a multiple-variation listing that is successfully migrated, in addition to the three new Inventory API objects just mentioned, an Inventory Item Group object will also be created. If the eBay listing is a motor vehicle part or accessory listing with a compatible vehicle list (ItemCompatibilityList container in Trading API's Add/Revise/Relist/Verify calls), a Product Compatibility object will be created. Migration Requirements To be eligible for migration, the active eBay listings must meet the following requirements: Listing type is Fixed-Price Listing duration is 'GTC' (Good 'til Cancelled) The item(s) in the listings must have seller-defined SKU values associated with them, and in the case of a multiple-variation listing, each product variation must also have its own SKU value Business Polices (Payment, Return Policy, and Shipping) must be used on the listing, as legacy payment, return policy, and shipping fields will not be accepted. With the Payment Policy associated with a listing, the immediate payment requirement must be enabled, and the only accepted payment method should be PayPal The postal/zip code (PostalCode field in Trading's ItemType) or city (Location field in Trading's ItemType) must be set in the listing; the country is also needed, but this value is required in Trading API, so it will always be set for every listing Unsupported Listing Features The following features are not yet available to be set or modified through the Inventory API, but they will remain on the active eBay listing, even after a successful migration to the Inventory model. The downside to this is that the seller will be completely blocked (in APIs or My eBay) from revising these features/settings once the migration takes place: Any listing-level Buyer Requirements Charity donations from sale proceeds Listing Designer Template applied to the listing Listing enhancements like a bold listing title or Gallery Plus Making the Call In the request payload of the bulkMigrateListings call, the seller will pass in an array of one to five eBay listing IDs (aka Item IDs). To save time and hassle, that seller should do a pre-check on each listing to make sure those listings meet the requirements to be migrated to the new Inventory model. There are no path or query parameters for this call. Call Response If an eBay listing is migrated successfully to the new Inventory model, the following will occur: An Inventory Item object will be created for the item(s) in the listing, and this object will be accessible through the Inventory API An Offer object will be created for the listing, and this object will be accessible through the Inventory API An Inventory Location object will be created and associated with the Offer object, as an Inventory Location must be associated with a published OfferThe response payload of the Bulk Migrate Listings call will show the results of each listing migration. These results include an HTTP status code to indicate the success or failure of each listing migration, the SKU value associated with each item, and if the migration is successful, an Offer ID value. The SKU value will be used in the Inventory API to manage the Inventory Item object, and the Offer ID value will be used in the Inventory API to manage the Offer object. Errors and/or warnings containers will be returned for each listing where an error and/or warning occurred with the attempted migration. If a multiple-variation listing is successfully migrated, along with the Offer and Inventory Location objects, an Inventory Item object will be created for each product variation within the listing, and an Inventory Item Group object will also be created, grouping those variations together in the Inventory API platform. For a motor vehicle part or accessory listing that has a specified list of compatible vehicles, in addition to the Inventory Item, Inventory Location, and Offer objects that are created, a Product Compatibility object will also be created in the Inventory API platform.
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
    # This call creates multiple offers (up to 25) for specific inventory items on a specific eBay marketplace. Although it is not a requirement for the seller to create complete offers (with all necessary details) right from the start, eBay recommends that the seller provide all necessary details with this call since there is currently no bulk operation available to update multiple offers with one call. The following fields are always required in the request payload: sku, marketplaceId, and (listing) format. Other information that will be required before a offer can be published are highlighted below: Inventory location Offer price Available quantity eBay listing category Referenced listing policy profiles to set payment, return, and fulfillment values/settings Note: Though the includeCatalogProductDetails parameter is not required to be submitted in the request, the parameter defaults to true if omitted. If the call is successful, unique offerId values are returned in the response for each successfully created offer. The offerId value will be required for many other offer-related calls. Note that this call only stages an offer for publishing. The seller must run either the publishOffer, bulkPublishOffer, or publishOfferByInventoryItemGroup call to convert offer(s) into an active single- or multiple-variation listing. In addition to the authorization header, which is required for all eBay REST API calls, the bulkCreateOffer call also requires the Content-Language header, that sets the natural language that will be used in the field values of the request payload. For US English, the code value passed in this header should be en-US. To view other supported Content-Language values, and to read more about all supported HTTP headers for eBay REST API calls, see the HTTP request headers topic in the Using eBay RESTful APIs document. For those who prefer to create a single offer per call, the createOffer method can be used instead.
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
    # This call is used to convert unpublished offers (up to 25) into published offers, or live eBay listings. The unique identifier (offerId) of each offer to publlish is passed into the request payload. It is possible that some unpublished offers will be successfully created into eBay listings, but others may fail. The response payload will show the results for each offerId value that is passed into the request payload. The errors and warnings containers will be returned for an offer that had one or more issues being published. For those who prefer to publish one offer per call, the publishOffer method can be used instead. In the case of a multiple-variation listing, the publishOfferByInventoryItemGroup call should be used instead, as this call will convert all unpublished offers associated with an inventory item group into a multiple-variation listing.
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
    # This call retrieves all existing offers for the specified SKU value. The seller has the option of limiting the offers that are retrieved to a specific eBay marketplace, or to a listing format. Note: At this time, the same SKU value can not be offered across multiple eBay marketplaces, and the only supported listing format is fixed-price, so the marketplace_id and format query parameters currently do not have any practical use for this call. The authorization header is the only required HTTP header for this call. See the HTTP request headers section for more information.
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
    # This call creates an offer for a specific inventory item on a specific eBay marketplace. It is up to the sellers whether they want to create a complete offer (with all necessary details) right from the start, or sellers can provide only some information with the initial createOffer call, and then make one or more subsequent updateOffer calls to complete the offer and prepare to publish the offer. Upon first creating an offer, the following fields are required in the request payload: sku, marketplaceId, and (listing) format. Other information that will be required before an offer can be published are highlighted below. These settings are either set with createOffer, or they can be set with a subsequent updateOffer call: Inventory location Offer price Available quantity eBay listing category Referenced listing policy profiles to set payment, return, and fulfillment values/settings Note: Though the includeCatalogProductDetails parameter is not required to be submitted in the request, the parameter defaults to true if omitted. If the call is successful, a unique offerId value is returned in the response. This value will be required for many other offer-related calls. Note that this call only stages an offer for publishing. The seller must run the publishOffer call to convert the offer to an active eBay listing. In addition to the authorization header, which is required for all eBay REST API calls, the createOffer call also requires the Content-Language header, that sets the natural language that will be used in the field values of the request payload. For US English, the code value passed in this header should be en-US. To view other supported Content-Language values, and to read more about all supported HTTP headers for eBay REST API calls, see the HTTP request headers topic in the Using eBay RESTful APIs document. For those who prefer to create multiple offers (up to 25 at a time) with one call, the bulkCreateOffer method can be used.
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
    # This call retrieves a specific published or unpublished offer. The unique identifier of the offer (offerId) is passed in at the end of the call URI. The authorization header is the only required HTTP header for this call. See the HTTP request headers section for more information.
    #
    # + offerId - The unique identifier of the offer that is to be retrieved. 
    # + return - Success 
    remote isolated function getOffer(string offerId) returns EbayOfferDetailsWithAll|error {
        string  path = string `/offer/${offerId}`;
        EbayOfferDetailsWithAll response = check self.clientEp-> get(path, targetType = EbayOfferDetailsWithAll);
        return response;
    }
    # This call updates an existing offer. An existing offer may be in published state (active eBay listing), or in an unpublished state and yet to be published with the publishOffer call. The unique identifier (offerId) for the offer to update is passed in at the end of the call URI. The updateOffer call does a complete replacement of the existing offer object, so all fields that make up the current offer object are required, regardless of whether their values changed. Other information that is required before an unpublished offer can be published or before a published offer can be revised include: Inventory location Offer price Available quantity eBay listing category Referenced listing policy profiles to set payment, return, and fulfillment values/settings Note: Though the includeCatalogProductDetails parameter is not required to be submitted in the request, the parameter defaults to true if omitted from both the updateOffer and the createOffer calls. If a value is specified in the updateOffer call, this value will be used. For published offers, the listingDescription field is also required to update the offer/eBay listing. For unpublished offers, this field is not necessarily required unless it is already set for the unpublished offer. In addition to the authorization header, which is required for all eBay REST API calls, the updateOffer call also requires the Content-Language header, that sets the natural language that will be used in the field values of the request payload. For US English, the code value passed in this header should be en-US. To view other supported Content-Language values, and to read more about all supported HTTP headers for eBay REST API calls, see the HTTP request headers topic in the Using eBay RESTful APIs document.
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
    # If used against an unpublished offer, this call will permanently delete that offer. In the case of a published offer (or live eBay listing), a successful call will either end the single-variation listing associated with the offer, or it will remove that product variation from the eBay listing and also automatically remove that product variation from the inventory item group. In the case of a multiple-variation listing, the deleteOffer will not remove the product variation from the listing if that variation has one or more sales. If that product variation has one or more sales, the seller can alternately just set the available quantity of that product variation to 0, so it is not available in the eBay search or View Item page, and then the seller can remove that product variation from the inventory item group at a later time.
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
    # This call is used to retrieve the expected listing fees for up to 250 unpublished offers. An array of one or more offerId values are passed in under the offers container. In the response payload, all listing fees are grouped by eBay marketplace, and listing fees per offer are not shown. A fees container will be returned for each eBay marketplace where the seller is selling the products associated with the specified offers. Errors will occur if the seller passes in offerIds that represent published offers, so this call should be made before the seller publishes offers with the publishOffer.
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
    # This call is used to convert an unpublished offer into a published offer, or live eBay listing. The unique identifier of the offer (offerId) is passed in at the end of the call URI. For those who prefer to publish multiple offers (up to 25 at a time) with one call, the bulkPublishOffer method can be used. In the case of a multiple-variation listing, the publishOfferByInventoryItemGroup call should be used instead, as this call will convert all unpublished offers associated with an inventory item group into a multiple-variation listing.
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
    # Note: Please note that any eBay listing created using the Inventory API cannot be revised or relisted using the Trading API calls. This call is used to convert all unpublished offers associated with an inventory item group into an active, multiple-variation listing. The unique identifier of the inventory item group (inventoryItemGroupKey) is passed in the request payload. All inventory items and their corresponding offers in the inventory item group must be valid (meet all requirements) for the publishOfferByInventoryItemGroup call to be completely successful. For any inventory items in the group that are missing required data or have no corresponding offers, the publishOfferByInventoryItemGroup will create a new multiple-variation listing, but any inventory items with missing required data/offers will not be in the newly-created listing. If any inventory items in the group to be published have invalid data, or one or more of the inventory items have conflicting data with one another, the publishOfferByInventoryItemGroup call will fail. Be sure to check for any error or warning messages in the call response for any applicable information about one or more inventory items/offers having issues.
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
    # This call is used to end a single-variation listing that is associated with the specified offer. This call is used in place of the deleteOffer call if the seller only wants to end the listing associated with the offer but does not want to delete the offer object. With this call, the offer object remains, but it goes into the unpublished state, and will require a publishOffer call to relist the offer. To end a multiple-variation listing that is associated with an inventory item group, the withdrawOfferByInventoryItemGroup method can be used. This call only ends the multiple-variation listing associated with an inventory item group but does not delete the inventory item group object, nor does it delete any of the offers associated with the inventory item group, but instead all of these offers go into the unpublished state.
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
    # This call is used to end a multiple-variation eBay listing that is associated with the specified inventory item group. This call only ends multiple-variation eBay listing associated with the inventory item group but does not delete the inventory item group object. Similarly, this call also does not delete any of the offers associated with the inventory item group, but instead all of these offers go into the unpublished state. If the seller wanted to relist the multiple-variation eBay listing, they could use the publishOfferByInventoryItemGroup method.
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
    # This call retrieves all defined details of the inventory location that is specified by the merchantLocationKey path parameter. The authorization HTTP header is the only required request header for this call. A successful call will return an HTTP status value of 200 OK.
    #
    # + merchantLocationKey - A unique merchant-defined key (ID) for an inventory location. This value is passed in at the end of the call URI to specify the inventory location to retrieve. Max length: 36 
    # + return - Success 
    remote isolated function getInventoryLocation(string merchantLocationKey) returns InventoryLocationResponse|error {
        string  path = string `/location/${merchantLocationKey}`;
        InventoryLocationResponse response = check self.clientEp-> get(path, targetType = InventoryLocationResponse);
        return response;
    }
    # Use this call to create a new inventory location. In order to create and publish an offer (and create an eBay listing), a seller must have at least one inventory location, as every offer must be associated with a location. Upon first creating an inventory location, only a seller-defined location identifier and a physical location is required, and once set, these values can not be changed. The unique identifier value (merchantLocationKey) is passed in at the end of the call URI. This merchantLocationKey value will be used in other Inventory Location calls to identify the inventory location to perform an action against. At this time, location types are either warehouse or store. Warehouse locations are used for traditional shipping, and store locations are generally used by US merchants selling products through the In-Store Pickup program, or used by UK, Australian, and German merchants selling products through the Click and Collect program. A full address is required for store inventory locations. However, for warehouse inventory locations, a full street address is not needed, but the city, state/province, and country of the location must be provided. Note that all inventory locations are &quot;enabled&quot; by default when they are created, and you must specifically disable them (by passing in a value of DISABLED in the merchantLocationStatus field) if you want them to be set to the disabled state. The seller's inventory cannot be loaded to inventory locations in the disabled state. In addition to the authorization header, which is required for all eBay REST API calls, the following table includes another request header that is mandatory for the createInventoryLocation call, and two other request headers that are optional: Header Description Required? Applicable Values Accept Describes the response encoding, as required by the caller. Currently, the interfaces require payloads formatted in JSON, and JSON is the default. No application/json Content-Language Use this header to control the language that is used for any returned errors or warnings in the call response. No en-US Content-Type The MIME type of the body of the request. Must be JSON. Yes application/json Unless one or more errors and/or warnings occur with the call, there is no response payload for this call. A successful call will return an HTTP status value of 204 No Content.
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
    # This call deletes the inventory location that is specified in the merchantLocationKey path parameter. Note that deleting a location will not affect any active eBay listings associated with the deleted location, but the seller will not be able modify the offers associated with the inventory location once it is deleted. The authorization HTTP header is the only required request header for this call. Unless one or more errors and/or warnings occur with the call, there is no response payload for this call. A successful call will return an HTTP status value of 200 OK.
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
    # This call disables the inventory location that is specified in the merchantLocationKey path parameter. Sellers can not load/modify inventory to disabled inventory locations. Note that disabling an inventory location will not affect any active eBay listings associated with the disabled location, but the seller will not be able modify the offers associated with a disabled inventory location. The authorization HTTP header is the only required request header for this call. A successful call will return an HTTP status value of 200 OK.
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
    # This call enables a disabled inventory location that is specified in the merchantLocationKey path parameter. Once a disabled inventory location is enabled, sellers can start loading/modifying inventory to that inventory location. The authorization HTTP header is the only required request header for this call. A successful call will return an HTTP status value of 200 OK.
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
    # This call retrieves all defined details for every inventory location associated with the seller's account. There are no required parameters for this call and no request payload. However, there are two optional query parameters, limit and offset. The limit query parameter sets the maximum number of inventory locations returned on one page of data, and the offset query parameter specifies the page of data to return. These query parameters are discussed more in the URI parameters table below. The authorization HTTP header is the only required request header for this call. A successful call will return an HTTP status value of 200 OK.
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
    # Use this call to update non-physical location details for an existing inventory location. Specify the inventory location you want to update using the merchantLocationKey path parameter. You can update the following text-based fields: name, phone, locationWebUrl, locationInstructions and locationAdditionalInformation. Whatever text is passed in for these fields in an updateInventoryLocation call will replace the current text strings defined for these fields. For store inventory locations, the operating hours and/or the special hours can also be updated. The merchant location key, the physical location of the store, and its geo-location coordinates can not be updated with an updateInventoryLocation call In addition to the authorization header, which is required for all eBay REST API calls, the following table includes another request header that is mandatory for the updateInventoryLocation call, and two other request headers that are optional: Header Description Required? Applicable Values Accept Describes the response encoding, as required by the caller. Currently, the interfaces require payloads formatted in JSON, and JSON is the default. No application/json Content-Language Use this header to control the language that is used for any returned errors or warnings in the call response. No en-US Content-Type The MIME type of the body of the request. Must be JSON. Yes application/json Unless one or more errors and/or warnings occurs with the call, there is no response payload for this call. A successful call will return an HTTP status value of 204 No Content.
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

# Generate header map for given header values.
#
# + headerParam - Headers  map 
# + return - Returns generated map or error at failure of client initialization 
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
