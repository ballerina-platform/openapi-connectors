import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

public type ClientConfig record {
    http:OAuth2ClientCredentialsGrantConfig|http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# <p>The Browse API has the following resources:</p>   <ul> <li><b> item_summary: </b> Lets shoppers search for specific items by keyword, GTIN, category, charity, product, or item aspects and refine the results by using filters, such as aspects, compatibility, and fields values.</li>  <li><b> search_by_image: </b><a href="https://developer.ebay.com/api-docs/static/versioning.html#API" target="_blank"><img src="/cms/img/docs/experimental-icon.svg" class="legend-icon experimental-icon" alt="Experimental Release" title="Experimental Release" />&nbsp;(Experimental)</a> Lets shoppers search for specific items by image. You can refine the results by using URI parameters and filters.</li>   <li><b> item: </b> <ul><li>Lets you retrieve the details of a specific item or all the items in an item group, which is an item with variations such as color and size and check if a product is compatible with the specified item, such as if a specific car is compatible with a specific part.</li> <li>Provides a bridge between the eBay legacy APIs, such as <b> Finding</b>, and the RESTful APIs, which use different formats for the item IDs.</li>  </ul> </li>  <li> <b> shopping_cart: </b> <a href="https://developer.ebay.com/api-docs/static/versioning.html#API" target="_blank"><img src="/cms/img/docs/experimental-icon.svg" class="legend-icon experimental-icon" alt="Experimental Release" title="Experimental Release" />&nbsp;(Experimental)</a> <a href="https://developer.ebay.com/api-docs/static/versioning.html#Limited" target="_blank"> <img src="/cms/img/docs/partners-api.svg" class="legend-icon partners-icon" title="Limited Release"  alt="Limited Release" />(Limited Release)</a> Provides the ability for eBay members to see the contents of their eBay cart, and add, remove, and change the quantity of items in their eBay cart.&nbsp;&nbsp;<b> Note: </b> This resource is not available in the eBay API Explorer.</li></ul>       <p>The <b> item_summary</b>, <b> search_by_image</b>, and <b> item</b> resource calls require an <a href="/api-docs/static/oauth-client-credentials-grant.html">Application access token</a>. The <b> shopping_cart</b> resource calls require a <a href="/api-docs/static/oauth-authorization-code-grant.html">User access token</a>.</p>
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    # Client initialization.
    #
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.ebay.com/buy/browse/v1") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    #
    # + aspectFilter - This field lets you filter by item aspects. The aspect name/value pairs and category, which is required, is used to limit the results to specific aspects of the item. For example, in a clothing category one aspect pair would be Color/Red. For example, the method below uses the category ID for Women's Clothing. This will return only items for a woman's red shirt. /buy/browse/v1/item_summary/search?q=shirt&amp;category_ids=15724&amp;aspect_filter=categoryId:15724,Color:{Red} To get a list of the aspects pairs and the category, which is returned in the dominantCategoryId field, set fieldgroups to ASPECT_REFINEMENTS. /buy/browse/v1/item_summary/search?q=shirt&amp;fieldgroups=ASPECT_REFINEMENTS Required: The category ID is required twice; once as a URI parameter and as part of the aspect_filter. For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/buy/browse/types/gct:AspectFilter
    # + autoCorrect - A query parameter that enables auto correction. Valid Values: KEYWORD
    # + categoryIds - The category ID is used to limit the results. This field can have one category ID or a comma separated list of IDs. For example: /buy/browse/v1/item_summary/search?category_ids=29792 Note: Currently, you can pass in only one category ID per request. You can also use any combination of the category_Ids, epid, and q fields. This gives you additional control over the result set. For example, let's say you are looking of a toy phone. If you search for &quot;phone&quot;, the result set will be mobile phones because this is the &quot;Best Match&quot; for this search. But if you also include the toy category ID, the results will be what you wanted. For example: /buy/browse/v1/item_summary/search?q=phone&amp;category_ids=220 The list of eBay category IDs is not published and category IDs are not the same across all the eBay marketplaces. You can use the following techniques to find a category by site: Use the Category Changes page. Use the Taxonomy API. For details see Get Categories for Buy APIs. Submit the following method to get the dominantCategoryId for an item. /buy/browse/v1/item_summary/search?q= keyword&amp;fieldgroups=ASPECT_REFINEMENTS Note: If a top-level (L1) category is specified, you must also include the q query parameter. Required: The method must have category_ids, epid, gtin, or q (or any combination of these)
    # + charityIds - The charity ID is used to limit the results to only items associated with the specified charity. This field can have one charity ID or a comma separated list of IDs. The method will return all the items associated with the specified charities. For example: /buy/browse/v1/item_summary/search?charity_ids=13-1788491,300108469 The charity ID is the charity's registration ID, also known as the Employer Identification Number (EIN). In GB, it is the Charity Registration Number (CRN), commonly called &quot;Charity Number&quot;. To find the charities eBay supports, you can search for a charity at Charity Search or go to Charity Shop. To find the charity ID of a specific charity, click on a charity and use the EIN number. For example, the charity ID for American Red Cross, is 530196605. You can also use any combination of the category_Ids and q fields with a charity_Ids to filter the result set. This gives you additional control over the result set. Restriction: This is supported only on the US and GB marketplaces. Maximum: 20 IDs Required: One ID
    # + compatibilityFilter - This field specifies the attributes used to define a specific product. The service searches for items matching the keyword or matching the keyword and a product attribute value in the title of the item. For example, if the keyword is brakes and compatibility-filter=Year:2018;Make:Honda, the items returned are items with brakes, 2018, or Honda in the title. The service uses the product attributes to determine if the item is compatible. The service returns the attributes that are compatible and the CompatibilityMatchEnum value that indicates how well the item matches the attributes. For the best compatibility results, submit all the attributes used to define the product. Best Practice: Submit all the product attributes for the specific product. For more details, see Check compatibility in the Buy Integration Guide. Note: The only products supported are cars, trucks, and motorcycles. For an example, see the Samples section. Note: Testing in Sandbox is only supported using mock data. See Testing search in the Sandbox for details. Required: q (keyword) one fitment supported category ID (such as 33559 Brakes) a least one product attribute name/value pair For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/buy/browse/types/gct:CompatibilityFilter
    # + epid - The ePID is the eBay product identifier of a product from the eBay product catalog. This field limits the results to only items in the specified ePID. The Marketing API getMerchandisedProducts method and the Browse API getItem, getItemByLegacyId, and getItemsByItemGroup calls return the ePID of the product. You can also use the product_summary/search method in the Catalog API to search for the ePID of the product. For example: /buy/browse/v1/item_summary/search?epid=15032 Maximum: 1 Required: The method must have category_ids, epid, gtin, or q (or any combination of these)
    # + fieldgroups - This field is a comma separated list of values that lets you control what is returned in the response. The default is MATCHING_ITEMS, which returns the items that match the keyword or category specified. The other values return data that can be used to create histograms or provide additional information. Valid Values: ASPECT_REFINEMENTS - This returns the aspectDistributions container, which has the dominantCategoryId, matchCount, and refinementHref for the various aspects of the items found. For example, if you searched for 'Mustang', some of the aspect would be Model Year, Exterior Color, Vehicle Mileage, etc. Note: ASPECT_REFINEMENTS are category specific. BUYING_OPTION_REFINEMENTS - This returns the buyingOptionDistributions container, which has the matchCount and refinementHref for AUCTION and FIXED_PRICE (Buy It Now) items. Note: Classified items are not supported and only &quot;Buy It Now&quot; (non-auction) items are returned. CATEGORY_REFINEMENTS - This returns the categoryDistributions container, which has the categories that the item is in. CONDITION_REFINEMENTS - This returns the conditionDistributions container, such as NEW, USED, etc. Within these groups are multiple states of the condition. For example, New can be New without tag, New in box, New without box, etc. EXTENDED - This returns the shortDescription field, which provides condition and item aspect information and the itemLocation.city field. MATCHING_ITEMS - This is meant to be used with one or more of the refinement values above. You use this to return the specified refinements and all the matching items. FULL - This returns all the refinement containers and all the matching items. Code so that your app gracefully handles any future changes to this list. Default: MATCHING_ITEMS
    # + filter - This field supports multiple field filters that can be used to limit/customize the result set. For example: /buy/browse/v1/item_summary/search?q=shirt&amp;filter=price:[10..50] You can also combine filters. /buy/browse/v1/item_summary/search?q=shirt&amp;filter=price:[10..50],sellers:{rpseller|bigSal} The following are the supported filters. For details and examples for all the filters, see Buy API Field Filters. bidCount buyingOptions charityOnly conditionIds conditions deliveryCountry deliveryOptions deliveryPostalCode excludeCategoryIds excludeSellers guaranteedDeliveryInDays itemEndDate itemLocationCountry itemStartDate maxDeliveryCost paymentMethods pickupCountry pickupPostalCode pickupRadius pickupRadiusUnit price priceCurrency qualifiedPrograms returnsAccepted searchInDescription sellerAccountTypes sellers For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/buy/browse/types/cos:FilterField
    # + gtin - This field lets you search by the Global Trade Item Number of the item as defined by https://www.gtin.info. You can search only by UPC (Universal Product Code). If you have other formats of GTIN, you need to search by keyword. For example: /buy/browse/v1/item_summary/search?gtin=099482432621 Maximum: 1 Required: The method must have category_ids, epid, gtin, or q (or any combination of these)
    # + 'limit - The number of items, from the result set, returned in a single page. Default: 50 Maximum number of items per page (limit): 200 Maximum number of items in a result set: 10,000
    # + offset - Specifies the number of items to skip in the result set. This is used with the limit field to control the pagination of the output. If offset is 0 and limit is 10, the method will retrieve items 1-10 from the list of items returned, if offset is 10 and limit is 10, the method will retrieve items 11 thru 20 from the list of items returned. Valid Values: 0-10,000 (inclusive) Default: 0 Maximum number of items returned: 10,000
    # + q - A string consisting of one or more keywords that are used to search for items on eBay. The keywords are handled as follows: If the keywords are separated by a space, it is treated as an AND. In the following example, the query returns items that have iphone AND ipad. /buy/browse/v1/item_summary/search?q=iphone ipad If the keywords are input using parentheses and separated by a comma, or if they are URL-encoded, it is treated as an OR. In the following examples, the query returns items that have iphone OR ipad. /buy/browse/v1/item_summary/search?q=(iphone, ipad) /buy/browse/v1/item_summary/search?q=%28iphone%2c%20ipad%29 Restriction: The * wildcard character is not allowed in this field. Required: The method must have category_ids, epid, gtin, or q (or any combination of these).
    # + sort - Specifies the order and the field name to use to sort the items. You can sort items by price (in ascending or descending order) or by distance (only applicable if the &quot;pickup&quot; filters are used, and only ascending order is supported). You can also sort items by listing date, with the most recently listed (newest) items appearing first. Note: To sort in descending order, insert a hyphen (-) before the field name. If no sort parameter is submitted, the result set is sorted by &quot;Best Match&quot;. The following are examples of using the sort query parameter. Sort Result sort=price Sorts by price in ascending order (lowest price first) sort=-price Sorts by price in descending order (highest price first) sort=distance Sorts by distance in ascending order (shortest distance first) sort=newlyListed Sorts by listing date (most recently listed/newest items first) Default: Ascending For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/buy/browse/types/cos:SortField
    # + return - OK
    remote isolated function search(string? aspectFilter = (), string? autoCorrect = (), string? categoryIds = (), string? charityIds = (), string? compatibilityFilter = (), string? epid = (), string? fieldgroups = (), string? filter = (), string? gtin = (), string? 'limit = (), string? offset = (), string? q = (), string? sort = ()) returns SearchPagedCollection|error {
        string  path = string `/item_summary/search`;
        map<anydata> queryParam = {"aspect_filter": aspectFilter, "auto_correct": autoCorrect, "category_ids": categoryIds, "charity_ids": charityIds, "compatibility_filter": compatibilityFilter, "epid": epid, "fieldgroups": fieldgroups, "filter": filter, "gtin": gtin, "limit": 'limit, "offset": offset, "q": q, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        SearchPagedCollection response = check self.clientEp-> get(path, targetType = SearchPagedCollection);
        return response;
    }
    #
    # + payload - The container for the image information fields.
    # + aspectFilter - This field lets you filter by item aspects. The aspect name/value pairs and category, which is required, is used to limit the results to specific aspects of the item. For example, in a clothing category one aspect pair would be Color/Red. For example, the method below uses the category ID for Women's Clothing. This will return only items for a woman's red shirt. category_ids=15724&amp;aspect_filter=categoryId:15724,Color:{Red} Required: The category ID is required twice; once as a URI parameter and as part of the aspect_filter. For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/buy/browse/types/gct:AspectFilter
    # + categoryIds - The category ID is used to limit the results. This field can have one category ID or a comma separated list of IDs. Note: Currently, you can pass in only one category ID per request. You can also use any combination of the category_Ids and epid fields. This gives you additional control over the result set. The list of eBay category IDs is not published and category IDs are not the same across all the eBay marketplaces. You can use the following techniques to find a category by site: Use the Category Changes page. Use the Taxonomy API. For details see Get Categories for Buy APIs. Submit the following method to get the dominantCategoryId for an item. /buy/browse/v1/item_summary/search?q= keyword&amp;fieldgroups=ASPECT_REFINEMENTS Required: The method must have category_ids or epid (or any combination of these)
    # + charityIds - The charity ID is used to limit the results to only items associated with the specified charity. This field can have one charity ID or a comma separated list of IDs. The method will return all the items associated with the specified charities. For example: /buy/browse/v1/item_summary/search?charity_ids=13-1788491,300108469 The charity ID is the charity's registration ID, also known as the Employer Identification Number (EIN). In GB, it is the Charity Registration Number (CRN), commonly called &quot;Charity Number&quot;. To find the charities eBay supports, you can search for a charity at Charity Search or go to Charity Shop. To find the charity ID of a specific charity, click on a charity and use the EIN number. For example, the charity ID for American Red Cross, is 530196605. You can also use any combination of the category_Ids and q fields with a charity_Ids to filter the result set. This gives you additional control over the result set. Restriction: This is supported only on the US and GB marketplaces. Maximum: 20 IDs Required: One ID
    # + fieldgroups - This field is a comma separated list of values that lets you control what is returned in the response. The default is MATCHING_ITEMS, which returns the items that match the keyword or category specified. The other values return data that can be used to create histograms or provide additional information. Valid Values: ASPECT_REFINEMENTS - This returns the aspectDistributions container, which has the dominantCategoryId, matchCount, and refinementHref for the various aspects of the items found. For example, if you searched for 'Mustang', some of the aspect would be Model Year, Exterior Color, Vehicle Mileage, etc. Note: ASPECT_REFINEMENTS are category specific. BUYING_OPTION_REFINEMENTS - This returns the buyingOptionDistributions container, which has the matchCount and refinementHref for AUCTION and FIXED_PRICE (Buy It Now) items. Note: Classified items are not supported and only &quot;Buy It Now&quot; (non-auction) items are returned. CATEGORY_REFINEMENTS - This returns the categoryDistributions container, which has the categories that the item is in. CONDITION_REFINEMENTS - This returns the conditionDistributions container, such as NEW, USED, etc. Within these groups are multiple states of the condition. For example, New can be New without tag, New in box, New without box, etc. EXTENDED - This returns the shortDescription field, which provides condition and item aspect information and the itemLocation.city field. MATCHING_ITEMS - This is meant to be used with one or more of the refinement values above. You use this to return the specified refinements and all the matching items. FULL - This returns all the refinement containers and all the matching items. Code so that your app gracefully handles any future changes to this list. Default: MATCHING_ITEMS
    # + filter - This field supports multiple field filters that can be used to limit/customize the result set. For example: /buy/browse/v1/item_summary/search?q=shirt&amp;filter=price:[10..50] You can also combine filters. /buy/browse/v1/item_summary/search?q=shirt&amp;filter=price:[10..50],sellers:{rpseller|bigSal} The following are the supported filters. For details and examples for all the filters, see Buy API Field Filters. bidCount buyingOptions charityOnly conditionIds conditions deliveryCountry deliveryOptions deliveryPostalCode excludeCategoryIds excludeSellers guaranteedDeliveryInDays itemEndDate itemLocationCountry itemStartDate maxDeliveryCost paymentMethods pickupCountry pickupPostalCode pickupRadius pickupRadiusUnit price priceCurrency qualifiedPrograms returnsAccepted sellerAccountTypes sellers For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/buy/browse/types/cos:FilterField
    # + 'limit - The number of items, from the result set, returned in a single page. Default: 50 Maximum number of items per page (limit): 200 Maximum number of items in a result set: 10,000
    # + offset - The number of items to skip in the result set. This is used with the limit field to control the pagination of the output. If offset is 0 and limit is 10, the method will retrieve items 1-10 from the list of items returned, if offset is 10 and limit is 10, the method will retrieve items 11 thru 20 from the list of items returned. Valid Values: 0-10,000 (inclusive) Default: 0 Maximum number of items returned: 10,000
    # + sort - Specifies the order and the field name to use to sort the items. You can sort items by price (in ascending or descending order) or by distance (only applicable if the &quot;pickup&quot; filters are used, and only ascending order is supported). You can also sort items by listing date, with the most recently listed (newest) items appearing first. Note: To sort in descending order, insert a hyphen (-) before the field name. If no sort parameter is submitted, the result set is sorted by &quot;Best Match&quot;. The following are examples of using the sort query parameter. Sort Result sort=price Sorts by price in ascending order (lowest price first) sort=-price Sorts by price in descending order (highest price first) sort=distance Sorts by distance in ascending order (shortest distance first) sort=newlyListed Sorts by listing date (most recently listed/newest items first) Default: Ascending For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/buy/browse/types/cos:SortField
    # + return - OK
    remote isolated function searchByImage(SearchByImageRequest payload, string? aspectFilter = (), string? categoryIds = (), string? charityIds = (), string? fieldgroups = (), string? filter = (), string? 'limit = (), string? offset = (), string? sort = ()) returns SearchPagedCollection|error {
        string  path = string `/item_summary/search_by_image`;
        map<anydata> queryParam = {"aspect_filter": aspectFilter, "category_ids": categoryIds, "charity_ids": charityIds, "fieldgroups": fieldgroups, "filter": filter, "limit": 'limit, "offset": offset, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SearchPagedCollection response = check self.clientEp->post(path, request, targetType=SearchPagedCollection);
        return response;
    }
    #
    # + item_id - The eBay RESTful identifier of an item. This ID is returned by the Browse and Feed API methods. RESTful Item ID Format: v1|#|# For example: v1|2**********2|0 or v1|1**********2|4**********2 For more information about item ID for RESTful APIs, see the Legacy API compatibility section of the Buy APIs Overview.
    # + fieldgroups - This parameter lets you control what is returned in the response. If you do not set this field, the method returns all the details of the item. Valid Values: PRODUCT - This adds the additionalImages, additionalProductIdentities, aspectGroups, description, gtins, image, and title product fields to the response, which describe the product associated with the item. See Product for more information about these fields. COMPACT - This returns only the following fields, which let you quickly check if the availability or price of the item has changed, if the item has been revised by the seller, or if an item's top-rated plus status has changed for items you have stored. itemId - The identifier of the item. itemAffiliateWebURL - The URL of the View Item page of the item, which includes the affiliate tracking ID. This field is only returned if the eBay partner enables affiliate tracking for the item by including the X-EBAY-C-ENDUSERCTX request header in the method. ItemWebURL - The URL of the View Item page of the item. This enables you to include a &quot;Report Item on eBay&quot; link that takes the buyer to the View Item page on eBay. From there they can report any issues regarding this item to eBay. legacyItemId - The unique identifier of the eBay listing that contains the item. This is the traditional/legacy ID that is often seen in the URL of the listing View Item page. sellerItemRevision - An identifier generated/incremented when a seller revises the item. The follow are the two types of item revisions: Seller changes, such as changing the title eBay system changes, such as changing the quantity when an item is purchased. This ID is changed only when the seller makes a change to the item. This means you cannot use this value to determine if the quantity has changed. To check if the quantity has changed, use estimatedAvailabilities. taxes - A container for the tax information for the item, such as the tax jurisdiction, the tax percentage, and the tax type. topRatedBuyingExperience - A boolean value indicating if this item is a top-rated plus item. A change in the item's top rated plus standing is not tracked by the revision ID. See topRatedBuyingExperience for more information. price - This is tracked by the revision ID but is returned here to enable you to quickly verify the price of the item. estimatedAvailabilities - Returns the item availability information, which is based on the item's quantity. Note: Changes in quantity are not tracked by sellerItemRevision. itemEndDate - This is the scheduled end time of the listing. eligibleForInlineCheckout - This parameter returns items based on whether or not the items can be purchased using the Buy Order API. If the value of this field is true, this indicates that the item can be purchased using the Order API. If the value of this field is false, this indicates that the item cannot be purchased using the Order API and must be purchased on the eBay site. For Example To check if a stored item's information is current, do following. Pass in the item ID and set fieldgroups to COMPACT. item/v1|4**********8|0?fieldgroups=COMPACT Do one of the following: If the sellerItemRevision field is returned and you haven't stored a revision number for this item, record the number and pass in the item ID in the getItem method to get the latest information. If the revision number is different from the value you have stored, update the value and pass in the item ID in the getItem method to get the latest information. If the sellerItemRevision field is not returned or has not changed, where needed, update the item information with the information returned in the response. Maximum value: 1 If more than one values is specified, the first value will be used.
    # + return - Success
    remote isolated function getItem(string item_id, string? fieldgroups = ()) returns Item|error {
        string  path = string `/item/${item_id}`;
        map<anydata> queryParam = {"fieldgroups": fieldgroups};
        path = path + check getPathForQueryParam(queryParam);
        Item response = check self.clientEp-> get(path, targetType = Item);
        return response;
    }
    #
    # + legacyItemId - Specifies either: The legacy item ID of an item that is not part of a group. The legacy item ID of a group, which is the ID of the &quot;parent&quot; of the group of items. Note: If you pass in a group ID, you must also use the legacy_variation_id field and pass in the legacy ID of the specific item variation (child ID). Legacy ids are returned by APIs, such as the Finding API. The following is an example of using the value of the ItemID field for a specific item from Finding to get the RESTful itemId value. &nbsp;&nbsp;&nbsp; browse/v1/item/get_item_by_legacy_id?legacy_item_id=1**********9 Maximum: 1
    # + fieldgroups - This field lets you control what is returned in the response. If you do not set this field, the method returns all the details of the item. Note: In this method, the only value supported is PRODUCT. Valid Values: PRODUCT - This adds the additionalImages, additionalProductIdentities, aspectGroups, description, gtins, image, and title fields to the response, which describe the item's product. See Product for more information about these fields. Code so that your app gracefully handles any future changes to this list.
    # + legacyVariationId - Specifies the legacy item ID of a specific item in an item group, such as the red shirt size L. Legacy ids are returned by APIs, such as the Finding API. Maximum: 1 Requirement: You must always pass in the legacy_item_id with the legacy_variation_id
    # + legacyVariationSku - Specifics the legacy SKU of the item. SKU are item ids created by the seller. Legacy SKUs are returned by eBay the Shopping API. The following is an example of using the value of the ItemID and SKU fields to get the RESTful itemId value. &nbsp;&nbsp;&nbsp; browse/v1/item/get_item_by_legacy_id?legacy_item_id=1**********9&amp;legacy_variation_sku=V**********M Maximum: 1 Requirement: You must always pass in the legacy_item_id with the legacy_variation_sku
    # + return - OK
    remote isolated function getItemByLegacyId(string legacyItemId, string? fieldgroups = (), string? legacyVariationId = (), string? legacyVariationSku = ()) returns Item|error {
        string  path = string `/item/get_item_by_legacy_id`;
        map<anydata> queryParam = {"fieldgroups": fieldgroups, "legacy_item_id": legacyItemId, "legacy_variation_id": legacyVariationId, "legacy_variation_sku": legacyVariationSku};
        path = path + check getPathForQueryParam(queryParam);
        Item response = check self.clientEp-> get(path, targetType = Item);
        return response;
    }
    #
    # + itemIds - A list of item IDs. Item IDs are the eBay RESTful identifier of items. RESTful Item ID Format: v1|#|# For example: v1|2**********2|0 or v1|1**********2|4**********2 In any given request, either item_ids or item_group_ids can be retrieved. Attempting to retrieve both will result in an error. In a request, multiple item_ids can be passed as comma separated values. Maximum allowed itemIDs: 20 For more information about item IDs for RESTful APIs, see the Legacy API compatibility section of the Buy APIs Overview.
    # + itemGroupIds - A list of item group IDs. Item group IDs are the eBay RESTful identifier of item groups. RESTful Group Item ID Format: ############ For example: 3**********9 In any given request, either item_ids or item_group_ids can be retrieved. Attempting to retrieve both will result in an error. In a request, multiple item_group_ids can be passed as comma separated values. Maximum allowed itemGroupIDs: 10
    # + return - Success
    remote isolated function getItems(string? itemIds = (), string? itemGroupIds = ()) returns Items|error {
        string  path = string `/item/`;
        map<anydata> queryParam = {"item_ids": itemIds, "item_group_ids": itemGroupIds};
        path = path + check getPathForQueryParam(queryParam);
        Items response = check self.clientEp-> get(path, targetType = Items);
        return response;
    }
    #
    # + itemGroupId - Identifier of the item group to return. An item group is an item that has various aspect differences, such as color, size, storage capacity, etc. This ID is returned in the itemGroupHref field of the search and getItem methods. For Example: https://api.ebay.com/buy/browse/v1/item/get_items_by_item_group?item_group_id=3**********6
    # + return - OK
    remote isolated function getItemsByItemGroup(string itemGroupId) returns ItemGroup|error {
        string  path = string `/item/get_items_by_item_group`;
        map<anydata> queryParam = {"item_group_id": itemGroupId};
        path = path + check getPathForQueryParam(queryParam);
        ItemGroup response = check self.clientEp-> get(path, targetType = ItemGroup);
        return response;
    }
    #
    # + item_id - The eBay RESTful identifier of an item (such as a part you want to check). This ID is returned by the Browse and Feed API methods. RESTful Item ID Format: v1|#|# For example: v1|2**********2|0 or v1|1**********2|4**********2 For more information about item ID for RESTful APIs, see the Legacy API compatibility section of the Buy APIs Overview.
    # + xEbayCMarketplaceId - The ID of the eBay marketplace you want to use. Note: This value is case sensitive. For example: &nbsp;&nbsp;X-EBAY-C-MARKETPLACE-ID = EBAY_US For a list of supported sites see, API Restrictions.
    # + return - OK
    remote isolated function checkCompatibility(string item_id, string xEbayCMarketplaceId, CompatibilityPayload payload) returns CompatibilityResponse|error {
        string  path = string `/item/${item_id}/check_compatibility`;
        map<any> headerValues = {"X-EBAY-C-MARKETPLACE-ID": xEbayCMarketplaceId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CompatibilityResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CompatibilityResponse);
        return response;
    }
    #
    # + return - OK
    remote isolated function addItem(AddCartItemInput payload) returns RemoteShopcartResponse|error {
        string  path = string `/shopping_cart/add_item`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RemoteShopcartResponse response = check self.clientEp->post(path, request, targetType=RemoteShopcartResponse);
        return response;
    }
    #
    # + return - OK
    remote isolated function getShoppingCart() returns RemoteShopcartResponse|error {
        string  path = string `/shopping_cart/`;
        RemoteShopcartResponse response = check self.clientEp-> get(path, targetType = RemoteShopcartResponse);
        return response;
    }
    #
    # + return - OK
    remote isolated function removeItem(RemoveCartItemInput payload) returns RemoteShopcartResponse|error {
        string  path = string `/shopping_cart/remove_item`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RemoteShopcartResponse response = check self.clientEp->post(path, request, targetType=RemoteShopcartResponse);
        return response;
    }
    #
    # + return - OK
    remote isolated function updateQuantity(UpdateCartItemInput payload) returns RemoteShopcartResponse|error {
        string  path = string `/shopping_cart/update_quantity`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RemoteShopcartResponse response = check self.clientEp->post(path, request, targetType=RemoteShopcartResponse);
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
