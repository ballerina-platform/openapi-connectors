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

# This type is used to define the physical address of an inventory location.
public type Address record {
    # The first line of a street address. This field is required for store inventory locations that will be holding In-Store Pickup inventory. A street address is not required if the inventory location is not holding In-Store Pickup Inventory. This field will be returned if defined for an inventory location. Max length: 128
    string addressLine1?;
    # The second line of a street address. This field can be used for additional address information, such as a suite or apartment number. A street address is not required if the inventory location is not holding In-Store Pickup Inventory. This field will be returned if defined for an inventory location. Max length: 128
    string addressLine2?;
    # The city in which the inventory location resides. This field is required for store inventory locations that will be holding In-Store Pickup inventory. For warehouse locations, this field is technically optional, as a postalCode can be used instead of city/stateOrProvince pair, and then the city is just derived from this postal/zip code. This field is returned if defined for an inventory location. Max length: 128
    string city?;
    # The country in which the address resides, represented as two-letter ISO 3166 country code. For example, US represents the United States, and DE represents Germany. Max length: 2 For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/CountryCodeEnum'>eBay API documentation</a>
    string country?;
    # The county in which the address resides. This field is returned if defined for an inventory location.
    string county?;
    # The postal/zip code of the address. eBay uses postal codes to surface In-Store Pickup items within the vicinity of a buyer's location, and it also user postal codes (origin and destination) to estimate shipping costs when the seller uses calculated shipping. A city/stateOrProvince pair can be used instead of a postalCode value, and then the postal code is just derived from the city and state/province. This field is returned if defined for an inventory location. Max length: 16
    string postalCode?;
    # The state/province in which the inventory location resides. This field is required for store inventory locations that will be holding In-Store Pickup inventory. For warehouse locations, this field is technically optional, as a postalCode can be used instead of city/stateOrProvince pair, and then the state or province is just derived from this postal/zip code. Max length: 128
    string stateOrProvince?;
};

# This type is used by the base request of the bulkPublishOffer method, which is used to publish up to 25 different offers.
public type BulkOffer record {
    # This container is used to pass in an array of offers to publish. Up to 25 offers can be published with one bulkPublishOffer method.
    OfferKeyWithId[] requests?;
};

# This type is used by the base response of the bulkGetInventoryItem method.
public type BulkGetInventoryItemResponse record {
    # This is the base container of the bulkGetInventoryItem response. The results of each attempted inventory item retrieval is captured under this container.
    GetInventoryItemResponse[] responses?;
};

# This type is used to specify the product aspect(s) where individual items of the group vary, as well as a list of the available variations of those aspects.
public type VariesBy record {
    # This container is used if the seller wants to include multiple images to demonstrate how variations within a multiple-variation listing differ. In this string field, the seller will specify the product aspect where the variations of the inventory item group vary, such as color. If Color is specified in this field, Color must also be one of the specifications.name values, and all available colors must appear in the corresponding specifications.values array. If the aspectsImageVariesBy container is used, links to images of each variation should be specified through the imageUrls container of the inventory item group, or the seller can choose to include those links to images in each inventory item record for the inventory items in the group.
    string[] aspectsImageVariesBy?;
    # This container consists of an array of one or more product aspects where each variation differs, and values for each of those product aspects. This container is not immediately required, but will be required before the first offer of the inventory item group is published. If a product aspect is specified in the aspectsImageVariesBy container, this product aspect (along with all variations of that product aspect) must be included in the specifications container. Before offers related to the inventory item group are published, the product aspects and values specified through the specifications container should be in synch with the name-value pairs specified through the product.aspects containers of the inventory items contained in the group. For example, if Color and Size are in this specifications container, each inventory item of the group should also have Color and Size as aspect names in their inventory item records. This container is always returned if one or more offers associated with the inventory item group have been published. For inventory item groups that have yet to have any published offers, this container is only returned if set.
    Specification[] specifications?;
};

# This type is used to define the product details, such as a title, a product description, product aspects/item specifics, and links to images for the product. Optionally, in a createOrReplaceInventoryItem call, a seller can pass in an eBay Product Identifier (ePID) or a Global Trade Item Number (GTIN) value, such as an EAN, an ISBN, a UPC, to identify a product to be matched with a product in the eBay Catalog. The information in this type is also returned in the getInventoryItem, getInventoryItems, and bulkGetInventoryItem calls if defined.
public type Product record {
    # This is an array of item specific pairs that provide more information about the product and might make it easier for buyers to find. To view required/recommended product aspects/item specifics names (and corresponding values) for a specific eBay category, sellers can use the GetCategorySpecifics call of the Trading API. Alternatively, sellers can view similar items on eBay.com in the same category to get an idea of what other sellers are using for product aspects/item specifics. Sellers also have the option of specifying an eBay Product ID (ePID) or optionally, a Global Trade Item Number (GTIN) through the corresponding fields in the product container in an attempt to find a product match in the eBay Catalog. If a match is found based on the ePID or GTIN value, the product aspects that are defined for the eBay Catalog product will automatically get picked up by the newly created/updated inventory item. Below is an example of the proper JSON syntax to use when manually inputting item specifics: &quot;aspects&quot;: {  &quot;Brand&quot;: [&quot;GoPro&quot;],  &quot;Storage Type&quot;: [&quot;Removable&quot;]  } Note that inventory items that will become part of an inventory item group and multiple-variation listing should have the same attributes that are defined for the inventory item group. This container will be returned if one or more item specific pairs are defined for the inventory item. Max Length for Aspect Name: 40 Max Length for Aspect Value: 50
    string[] aspects?;
    # The brand of the product. This field is often paired with the mpn field to identify a specific product by Manufacture Part Number. This field is conditionally required if the eBay category requires a Manufacturer Part Number (MPN) value. If eBay is able to find a product match in the eBay Catalog when an eBay Product ID (ePID) or GTIN value (UPC, ISBN, or EAN) is supplied, all product details of that eBay Catalog product is picked up by the inventory item record (including brand) if the createOrReplaceInventoryItem call is successful. This field is returned if defined for an inventory item. If a brand was passed in as an item specific name-value pair through the aspects array in a createOrReplaceInventoryItem call, this value is also picked up by the brand field. Max Length: 65
    string brand?;
    # The description of the product. The description of an existing inventory item can be added or modified with a createOrReplaceInventoryItem call. The description of an inventory item is automatically populated if the seller specifies an eBay Product ID (ePID) or a Global Trade Item Number (GTIN) and eBay is able to find a matching product in the eBay Catalog. Note that this field is optional but recommended. If a listingDescription field is omitted when creating and publishing a single-variation offer, the text in this field will be used instead. If neither the product.description field for the inventory item nor the listingDescription field for the offer exist, the publishOffer call will fail. If the inventory item will be part of an inventory item group/multiple-variation listing, this field should definitely be used to specify how the corresponding product variation is different (e.g. This is the green, extra-large version of the shirt). However, in the case of an inventory item group, the text in the description field of the inventory item group will become the listing description of the actual eBay listing instead of the text in this field. Basic HTML tags are supported, including the following tags: &lt;b&gt; &lt;strong&gt; &lt;br&gt; &lt;ol&gt; &lt;ul&gt; &lt;li&gt; Table tags including &lt;table&gt;, &lt;tr&gt;, &lt;td&gt;, &lt;th&gt;, &lt;thead&gt;, &lt;tfoot&gt;, &lt;tbody&gt;, &lt;caption&gt;, &lt;colgroup&gt;, and &lt;col&gt;A seller can not use any active content in their listing description. Active content includes animation or video via JavaScript, Flash, plug-ins, or form actions. This field is returned if defined for an inventory item. If one of the GTIN types (e.g. UPC) was passed in when the inventory item was created/modified and a product match was found in the eBay catalog, product description is one of the details that gets picked up from the catalog product. Max Length: 4000
    string description?;
    # The European Article Number/International Article Number (EAN) for the product. Although an ePID value is preferred when trying to find a product match in the eBay Catalog, this field can also be used in an attempt to find a product match in the eBay Catalog. If a product match is found in the eBay Catalog, the inventory item is automatically populated with available product details such as a title, a product description, product aspects (including the specified EAN value), and a link to any stock image that exists for the catalog product. This field is returned if defined for an inventory item. If an EAN was passed in as an item specific name-value pair through the aspects array in a createOrReplaceInventoryItem call, this value is also picked up by the ean field.
    string[] ean?;
    # The eBay Product Identifier (ePID) for the product. This field can be used to directly identify an eBay Catalog product. Based on its specified ePID value, eBay will search for the product in the eBay Catalog, and if a match is found, the inventory item is automatically populated with available product details such as product title, product description, product aspects, and a link to any stock image that exists for the catalog product. In an attempt to find a eBay Catalog product match, an ePID value is always preferred over the other product identifiers, since it is possible that one GTIN value can be associated with multiple eBay Catalog products, and if multiple products are found, product details will not be picked up by the Inventory Item object. This field is returned if defined for an inventory item.
    string epid?;
    # An array of one or more links to images for the product. URLs must use the &quot;HTTPS&quot; protocol. Images can be self-hosted by the seller, or sellers can use the UploadSiteHostedPictures call of the Trading API to upload images to an eBay Picture Server. If successful, the response of the UploadSiteHostedPictures call will contain a full URL to the image on an eBay Picture Server. This is the URL that will be passed in through the imageUrls array. Before an offer can be published, at least one image must exist for the inventory item. Most eBay sites support up to 12 pictures free of charge, and eBay Motors listings can have up to 24 pictures. A link to a stock image for a product may automatically be populated for an inventory item if the seller specifies an eBay Product ID (ePID) or a Global Trade Item Number (GTIN) and eBay is able to find a matching product in the eBay Catalog. This container will always be returned for an inventory item that is part of a published offer since a published offer will always have at least one picture, but this container will only be returned if defined for inventory items that are not a part of a published offer.
    string[] imageUrls?;
    # The International Standard Book Number (ISBN) value for the product. Although an ePID value is preferred when trying to find a product match in the eBay Catalog, this field can also be used in an attempt to find a product match in the eBay Catalog. If a product match is found in the eBay Catalog, the inventory item is automatically populated with available product details such as a title, a product description, product aspects (including the specified ISBN value), and a link to any stock image that exists for the catalog product. This field is returned if defined for an inventory item. If an ISBN was passed in as an item specific name-value pair through the aspects array in a createOrReplaceInventoryItem call, this value is also picked up by the isbn field.
    string[] isbn?;
    # The Manufacturer Part Number (MPN) of a product. This field is paired with the brand field to identify a product. Some eBay categories require MPN values. The GetCategorySpecifics call of the Trading API can be used to see if a category requires an MPN. The MPN value for a product may automatically be populated for an inventory item if the seller specifies an eBay Product ID (ePID) or a Global Trade Item Number (GTIN) and eBay is able to find a matching product in the eBay Catalog. This field is returned if defined for an inventory item. If an MPN was passed in as an item specific name-value pair through the aspects array in a createOrReplaceInventoryItem call, this value is also picked up by the mpn field. Max Length: 65
    string mpn?;
    # A subtitle is an optional listing feature that allows the seller to provide more information about the product, possibly including keywords that may assist with search results. An additional listing fee will be charged to the seller if a subtitle is used. For more information on using listing subtitles on the US site, see the Adding a subtitle to your listings help page. The subtitle of an existing inventory item can added, modified, or removed with a createOrReplaceInventoryItem call. Note that the same subtitle text should be used for each inventory item that will be part of an inventory item group, and ultimately become one product variation within a multiple-variation listing. This field will only be returned if set for an inventory item. Max Length: 55
    string subtitle?;
    # The title of an inventory item can be added or modified with a createOrReplaceInventoryItem call. Although not immediately required, a title will be needed before an offer with the inventory item is published. The title of an inventory item is automatically populated if the seller specifies an eBay Product ID (ePID) or a Global Trade Item Number (GTIN) and eBay is able to find a matching product in the eBay Catalog. If the inventory item will become part of a single-variation offer, and the listing is not a product-based listing, the text in this field will become the actual listing title for the published offer. However, if the inventory item will become part of a multiple-variation offer, the text in title field of the inventory item group entity will actually become the listing title for the published offer instead, although a title can still be provided for the inventory item, and it will actually become the title of the variation. This field will always be returned for an inventory item that is part of a published offer since a published offer will always have a listing title, but this field will only be returned if defined for inventory items that are not a part of a published offer. Max Length: 80
    string title?;
    # The Universal Product Code (UPC) value for the product. Although an ePID value is preferred when trying to find a product match in the eBay Catalog, this field can also be used in an attempt to find a product match in the eBay Catalog. If a product match is found in the eBay Catalog, the inventory item is automatically populated with available product details such as a title, a product description, product aspects (including the specified UPC value), and a link to any stock image that exists for the catalog product. This field is returned if defined for an inventory item. If a UPC was passed in as an item specific name-value pair through the aspects array in a createOrReplaceInventoryItem call, this value is also picked up by the upc field.
    string[] upc?;
};

# This type is used to display the expected listing fees for each unpublished offer specified in the request of the getListingFees call.
public type FeeSummary record {
    # This container is an array of listing fees that can be expected to be applied to an offer on the specified eBay marketplace (marketplaceId value). Many fee types will get returned even when they are 0.0. See the Standard selling fees help page for more information on listing fees.
    Fee[] fees?;
    # This is the unique identifier of the eBay site for which listing fees for the offer are applicable. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:MarketplaceEnum'>eBay API documentation</a>
    string marketplaceId?;
    # This container will contain an array of errors and/or warnings when a call is made, and errors and/or warnings occur.
    Error[] warnings?;
};

# This type is used to enable the use of a sales tax table, to pass in a tax exception category code, or to specify a VAT percentage.
public type Tax record {
    # This field will be included and set to true if the seller would like to reference their account-level Sales Tax Table to calculate sales tax for an order. A seller's Sales Tax Table can be created and managed manually in My eBay's Payment Preferences. This Sales Tax Table contains all tax jurisdictions for the seller's country (individual states and territories in US), and the seller can set the sales tax rate for these individual tax jurisdictions. The Trading API has a SetTaxTable call to add/modify sales tax rates for one or more tax jurisdictions, and a GetTaxTable call that will retrieve all tax jurisdictions and related data, such as the sales tax rate (if defined) and a boolean field to indicate if sales tax is applied to shipping and handling costs. The Account API has a getSalesTaxTable call to retrieve all tax jurisdictions that have a defined sales tax rate, a getSalesTaxTableEntry call to retrieve a sales tax rate for a specific tax jurisdiction, a createSalesTaxTableEntry call to set/modify a sales tax rate for a specific tax jurisdiction, and a deleteSalesTaxTableEntry call to remove a sales tax rate from a specific tax jurisdiction. Note that a seller can enable the use of a sales tax table, but if a sales tax rate is not specified for the buyer's state/tax jurisdiction, sales tax will not be applied to the order. If a thirdPartyTaxCategory value is used, the applyTax field must also be used and set to true This field will be returned if set for the offer. See the Using a tax table help page for more information on setting up and using a sales tax table.
    boolean applyTax?;
    # The tax exception category code. If this field is used, sales tax will also apply to a service/fee, and not just the item price. This is to be used only by sellers who have opted into sales tax being calculated by a sales tax calculation vendor. If you are interested in becoming a tax calculation vendor partner with eBay, contact developer-relations@ebay.com. One supported value for this field is WASTE_RECYCLING_FEE. If this field is used, the applyTax field must also be used and set to true This field will be returned if set for the offer.
    string thirdPartyTaxCategory?;
    # This value is the Value Add Tax (VAT) rate for the item, if any. When a VAT percentage is specified, the item's VAT information appears on the listing's View Item page. In addition, the seller can choose to print an invoice that includes the item's net price, VAT percent, VAT amount, and total price. Since VAT rates vary depending on the item and on the user's country of residence, a seller is responsible for entering the correct VAT rate; it is not calculated by eBay. To use VAT, a seller must be a business seller with a VAT-ID registered with eBay, and must be listing the item on a VAT-enabled site. Max applicable length is 6 characters, including the decimal (e.g., 12.345). The scale is 3 decimal places. (If you pass in 12.3456, eBay may round up the value to 12.346). This field will be returned if set for the offer.
    decimal vatPercentage?;
};

# This type is used by the listing container in the getOffer and getOffers calls to provide the eBay listing ID, the listing status, and quantity sold for the offer. The listing container is only returned for published offers, and is not returned for unpublished offers.
public type ListingDetails record {
    # The unique identifier of the eBay listing that is associated with the published offer.
    string listingId?;
    # The enumeration value returned in this field indicates the status of the listing that is associated with the published offer. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:ListingStatusEnum'>eBay API documentation</a>
    string listingStatus?;
    # This integer value indicates the quantity of the product that has been sold for the published offer.
    int soldQuantity?;
};

# This type is used to indicate the quantities of the inventory items that are reserved for the different listing formats of the SKU offers.
public type FormatAllocation record {
    # This integer value indicates the quantity of the inventory item that is reserved for the published auction format offers of the SKU.
    int auction?;
    # This integer value indicates the quantity of the inventory item that is available for the fixed-price offers of the SKU.
    int fixedPrice?;
};

# This type is used to set the available quantity of the inventory item at one or more warehouse locations.
public type AvailabilityDistribution record {
    # This type is used to indicate the fulfillment time for an In-Store Pickup order, or for an order than will be shipped to the buyer.
    TimeDuration fulfillmentTime?;
    # The unique identifier of an inventory location where quantity is available for the inventory item. This field is conditionally required to identify the inventory location that has quantity of the inventory item.
    string merchantLocationKey?;
    # The integer value passed into this field indicates the quantity of the inventory item that is available at this inventory location. This field is conditionally required.
    int quantity?;
};

# This type is used to specify the details of a motor vehicle that is compatible with the inventory item specified through the SKU value in the call URI.
public type ProductFamilyProperties record {
    # This field indicates the specifications of the engine, including its size, block type, and fuel type. An example is 2.7L V6 gas DOHC naturally aspirated. This field is conditionally required, but should be supplied if known/applicable.
    string engine?;
    # This field indicates the make of the vehicle (e.g. Toyota). This field is always required to identify a motor vehicle.
    string make?;
    # This field indicates the model of the vehicle (e.g. Camry). This field is always required to identify a motor vehicle.
    string model?;
    # This field indicates the trim of the vehicle (e.g. 2-door Coupe). This field is conditionally required, but should be supplied if known/applicable.
    string trim?;
    # This field indicates the year of the vehicle (e.g. 2016). This field is always required to identify a motor vehicle.
    string year?;
};

# This type is used to show the version number and instance of the service or API.
public type Version record {
    # This type is used to show the version number and instance of the service or API.
    Version instance?;
    # The version number of the service or API.
    string 'version?;
};

# This type is used by the base request of the bulkCreateOffer method, which is used to create up to 25 new offers.
public type BulkEbayOfferDetailsWithKeys record {
    # The details of each offer that is being created is passed in under this container. Up to 25 offers can be created with one bulkCreateOffer call.
    EbayOfferDetailsWithKeys[] requests?;
};

# The base request of the bulkCreateOrReplaceInventoryItem method.
public type BulkInventoryItem record {
    # The details of each inventory item that is being created or updated is passed in under this container. Up to 25 inventory item records can be created and/or updated with one bulkCreateOrReplaceInventoryItem call.
    InventoryItemWithSkuLocale[] requests?;
};

# This type provides details of an offer, and is used by the base request payload of the createOffer and bulkCreateOffer methods.
public type EbayOfferDetailsWithKeys record {
    # This integer value sets the quantity of the inventory item (specified by the sku value) that will be available for purchase by buyers shopping on the eBay site specified in the marketplaceId field. Quantity must be set to 1 or more in order for the inventory item to be purchasable, but this field is not necessarily required, even for published offers, if the general quantity of the inventory item has already been set in the inventory item record. For auction listings, this value must be 1.
    int availableQuantity?;
    # The unique identifier of the eBay category that the product will be listed under. This field is not immediately required upon creating an offer, but will be required before publishing the offer. Sellers can use the getCategorySuggestions method of the Taxonomy API to retrieve suggested category ID values. The seller passes in a query string like &quot;iPhone 6&quot;, and category ID values for suggested categories are returned in the response.
    string categoryId?;
    # This type is used to identify the charitable organization associated with the listing, and the percentage of the sale proceeds that the charitable organization will receive for each sale generated by the listing. In order to receive a percentage of the sales proceeds, the charitable organization must be registered with the PayPal Giving Fund, which is a partner of eBay for Charity.
    Charity charity?;
    # This enumerated value indicates the listing format of the offer. Supported values are FIXED_PRICE and AUCTION. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:FormatTypeEnum'>eBay API documentation</a>
    string format?;
    # This field is included and set to true if the seller wishes to create a private listing. Sellers may want to use this option when they believe that a listing's potential bidders/buyers would not want their obfuscated user IDs (and feedback scores) exposed to other users.
    boolean hideBuyerDetails?;
    # This field indicates whether or not eBay product catalog details are applied to a listing. A value of true indicates the listing corresponds to the eBay product associated with the provided product identifier. The product identifier is provided in createOrReplaceInventoryItem. Default: true Note: Though the includeCatalogProductDetails parameter is not required to be submitted in the request, the parameter defaults to true if omitted.
    boolean includeCatalogProductDetails?;
    # The text in this field is (published offers), or will become (unpublished offers) the description of the eBay listing. This field is not immediately required for an unpublished offer, but will be required before publishing the offer. Note that if the listingDescription field was omitted in the createOffer call for the offer, the offer entity should have picked up the text provided in the product.description field of the inventory item record, or if the inventory item is part of a group, the offer entity should have picked up the text provided in the description field of the inventory item group record. HTML tags and markup can be used in listing descriptions, but each character counts toward the max length limit. Note: To ensure that their short listing description is optimized when viewed on mobile devices, sellers should strongly consider using eBay's View Item description summary feature when listing their items. Keep in mind that the 'short' listing description is what prospective buyers first see when they view the listing on a mobile device. The 'full' listing description is also available to mobile users when they click on the short listing description, but the full description is not automatically optimized for viewing in mobile devices, and many users won't even drill down to the full description. Using HTML div and span tag attributes, this feature allows sellers to customize and fully control the short listing description that is displayed to prospective buyers when viewing the listing on a mobile device. The short listing description on mobile devices is limited to 800 characters, and whenever the full listing description (provided in this field, in UI, or seller tool) exceeds this limit, eBay uses a special algorithm to derive the best possible short listing description within the 800-character limit. However, due to some short listing description content being removed, it is definitely not ideal for the seller, and could lead to a bad buyer experience and possibly to a Significantly not as described (SNAD) case, since the buyer may not get complete details on the item when viewing the short listing description. See the eBay help page for more details on using the HTML div and span tags. Max length: 500000 (which includes HTML markup/tags)
    string listingDescription?;
    # This field indicates the number of days that the listing will be active. For fixed-price listings, this value must be set to GTC, but auction listings support different listing durations. The GTC (Good 'Til Cancelled) listings are automatically renewed each calendar month until the seller decides to end the listing. Note: If the listing duration expires for an auction offer without a winning bidder, the listing then becomes available as a fixed-price offer and listing duration will be GTC. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:ListingDurationEnum'>eBay API documentation</a>
    string listingDuration?;
    # This type is used to identify the payment, return, and fulfillment listing policies that will be, or are associated with the listing. Every published offer must have a payment, return, and fulfillment listing policy associated with it. This type is also used to override the shipping costs of one or more shipping service options that are associated with the fulfillment policy, to enable eBay Plus eligibility for a listing, or to enable the Best Offer feature on the listing.
    ListingPolicies listingPolicies?;
    # This field can be used if the seller wants to specify a time in the future that the listing will become active on eBay. The timestamp supplied in this field should be in UTC format, and it should be far enough in the future so that the seller will have enought time to publish the listing with the publishOffer method. This field is optional. If this field is not provided, the listing starts immediately after a successful publishOffer method.
    string listingStartDate?;
    # This field is only applicable if the listing is a lot listing. A lot listing is a listing that has multiple quantity of the same item, such as four identical tires being sold as a single offer, or it can be a mixed lot of similar items, such as used clothing items or an assortment of baseball cards. Whether the lot listing involved identical items or a mixed lot, the integer value passed into this field is the total number of items in the lot. Lots can be used for auction and fixed-price listings.
    int lotSize?;
    # This enumeration value is the unique identifier of the eBay site for which the offer will be made available. See MarketplaceEnum for the list of supported enumeration values. This field is required. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:MarketplaceEnum'>eBay API documentation</a>
    string marketplaceId?;
    # The unique identifier of a merchant's inventory location (where the inventory item in the offer is located). A merchantLocationKey value is established when the merchant creates an inventory location using the createInventoryLocation call. To get more information about inventory locations, the getInventoryLocation call can be used. This field is not initially required upon first creating an offer, but will become required before an offer can be published. Max length: 36
    string merchantLocationKey?;
    # This type is used to specify the listing price for the product and settings for the Minimum Advertised Price and Strikethrough Pricing features. The price field must be supplied before an offer is published, but a seller may create an offer without supplying a price initially. The Minimum Advertised Price feature is only available on the US site. Strikethrough Pricing is available on the US, eBay Motors, UK, Germany, Canada (English and French), France, Italy, and Spain sites.
    PricingSummary pricingSummary?;
    # This field is only applicable and set if the seller wishes to set a restriction on the purchase quantity per seller. If this field is set by the seller for the offer, then each distinct buyer may purchase up to, but not exceed the quantity specified for this field. So, if this field's value is 5, each buyer may purchase between one to five of these products, and the purchases can occur in one multiple-quantity purchase, or over multiple transactions. If a buyer attempts to purchase one or more of these products, and the cumulative quantity will take the buyer beyond the quantity limit, that buyer will be blocked from that purchase.
    int quantityLimitPerBuyer?;
    # The unique identifier for a secondary category. This field is applicable if the seller decides to list the item under two categories. Sellers can use the getCategorySuggestions method of the Taxonomy API to retrieve suggested category ID values. A fee may be charged when adding a secondary category to a listing. Note: You cannot list US eBay Motors vehicles in two categories. However, you can list Parts &amp; Accessories in two categories.
    string secondaryCategoryId?;
    # This is the seller-defined SKU value of the product that will be listed on the eBay site (specified in the marketplaceId field). Only one offer (in unpublished or published state) may exist for each sku/marketplaceId/format combination. This field is required. Max Length: 50
    string sku?;
    # This container is used if the seller would like to place the inventory item into one or two eBay store categories that the seller has set up for their eBay store. The string value(s) passed in to this container will be the full path(s) to the eBay store categories, as shown below: &quot;storeCategoryNames&quot;: [  &quot;/Fashion/Men/Shirts&quot;,  &quot;/Fashion/Men/Accessories&quot; ],
    string[] storeCategoryNames?;
    # This type is used to enable the use of a sales tax table, to pass in a tax exception category code, or to specify a VAT percentage.
    Tax tax?;
};

# This type is used to identify the payment, return, and fulfillment listing policies that will be, or are associated with the listing. Every published offer must have a payment, return, and fulfillment listing policy associated with it. This type is also used to override the shipping costs of one or more shipping service options that are associated with the fulfillment policy, to enable eBay Plus eligibility for a listing, or to enable the Best Offer feature on the listing.
public type ListingPolicies record {
    # This type is used by the bestOfferTerms container, which is used if the seller would like to support the Best Offer feature on their listing.
    BestOffer bestOfferTerms?;
    # This field is included in an offer and set to true if a Top-Rated seller is opted in to the eBay Plus program. With the eBay Plus program, qualified sellers must commit to next-day delivery of the item, and the buyers must have an eBay Plus subscription to be eligible to receive the benefits of this program, which are free, next-day delivery, as well as free returns. Currently, this program is only available on the Germany and Australian sites. This field will be returned in the getOffer and getOffers calls if set for the offer.
    boolean eBayPlusIfEligible?;
    # This unique identifier indicates the fulfillment listing policy that will be used once an offer is published and converted to an eBay listing. This fulfillment listing policy will set all fulfillment-related settings for the eBay listing. Listing policies are not immediately required for offers, but are required before an offer can be published. The seller should review the fulfillment listing policy before assigning it to the offer to make sure it is compatible with the inventory item and the offer settings. The seller may also want to review the shipping service costs in the fulfillment policy, and that seller might decide to override the shipping costs for one or more shipping service options by using the shippingCostOverrides container. Listing policies can be created and managed in My eBay or with the Account API. To get a list of all return policies associated with a seller's account on a specific eBay Marketplace, use the Account API's getFulfillmentPolicies call. There are also calls in the Account API to retrieve a fulfillment policy by policy ID or policy name. This field will be returned in the getOffer and getOffers calls if set for the offer.
    string fulfillmentPolicyId?;
    # This unique identifier indicates the payment listing policy that will be used once an offer is published and converted to an eBay listing. This payment listing policy will set all payment-related settings for the eBay listing. Listing policies are not immediately required for offers, but are required before an offer can be published. The seller should review the payment listing policy before assigning it to the offer, as the following must be true for the payment listing policy to be compatible with the offer: The marketplaceId value should reflect where the offer is being published The immediatePay field value must be set to true since Inventory API offers only support immediate payment The only specified payment method should be 'PayPal', since immediate payment requires 'PayPal'Listing policies can be created and managed in My eBay or with the Account API. To get a list of all payment policies associated with a seller's account on a specific eBay Marketplace, use the Account API's getPaymentPolicies call. There are also calls in the Account API to retrieve a payment policy by policy ID or policy name. This field will be returned in the getOffer and getOffers calls if set for the offer.
    string paymentPolicyId?;
    # This unique identifier indicates the return listing policy that will be used once an offer is published and converted to an eBay listing. This return listing policy will set all return policy settings for the eBay listing. Listing policies are not immediately required for offers, but are required before an offer can be published. The seller should review the return listing policy before assigning it to the offer to make sure it is compatible with the inventory item and the offer settings. Listing policies can be created and managed in My eBay or with the Account API. To get a list of all return policies associated with a seller's account on a specific eBay Marketplace, use the Account API's getReturnPolicies call. There are also calls in the Account API to retrieve a return policy by policy ID or policy name. This field will be returned in the getOffer and getOffers calls if set for the offer.
    string returnPolicyId?;
    # This container is used if the seller wishes to override the shipping costs or surcharge for one or more domestic or international shipping service options defined in the fulfillment listing policy. To override the costs of a specific domestic or international shipping service option, the seller must know the priority/order of that shipping service in the fulfillment listing policy. The name of a shipping service option can be found in the shippingOptions.shippingServices.shippingServiceCode field of the fulfillment policy, and the priority/order of that shipping service option is found in the shippingOptions.shippingServices.sortOrderId field. Both of these values can be retrieved by searching for that fulfillment policy with the getFulfillmentPolicies or getFulfillmentPolicyByName calls of the Account API. The shippingCostOverrides.priority value should match the shippingOptions.shippingServices.sortOrderId in order to override the shipping costs for that shipping service option. The seller must also ensure that the shippingServiceType value is set to DOMESTIC to override a domestic shipping service option, or to INTERNATIONAL to override an international shipping service option. A separate ShippingCostOverrides node is needed for each shipping service option whose costs are being overridden. All defined fields of the shippingCostOverrides container should be included, even if the shipping costs and surcharge values are not changing. The shippingCostOverrides container is returned in the getOffer and getOffers calls if one or more shipping cost overrides are being applied to the fulfillment policy.
    ShippingCostOverride[] shippingCostOverrides?;
};

# This type is used by the base response payload for the getListingFees call.
public type FeesSummaryResponse record {
    # This container consists of an array of one or more listing fees that the seller can expect to pay for unpublished offers specified in the call request. Many fee types will get returned even when they are 0.0.
    FeeSummary[] feeSummaries?;
};

# This type provides details of an offer, and is used by the base request payload of the updateOffer call. Every field that is currently set with the unpublished/published offer must also be passed into the updateOffer call, even those fields whose values are not changing. Note that for published offers, a successful updateOffer call will actually update the active eBay listing with whatever changes were made.
public type EbayOfferDetailsWithId record {
    # This integer value sets the quantity of the inventory item that will be available through the offer. Quantity must be set to 1 or more in order for the inventory item to be purchasable. This value should not be more than the quantity that is specified for the inventory item record. For auction listings, this value must be 1. If this field exists for the current unpublished or published offer, it should be provided again in the updateOffer call, even if the value is not changing. If this particular field is omitted in an updateOffer call, the general available quantity set for the inventory item record may be used instead, and this may not be accurate if the inventory item is being sold across multiple marketplaces.
    int availableQuantity?;
    # The unique identifier of the eBay category that the inventory item is/will be listed under. This field is not immediately required for an unpublished offer, but will be required before publishing the offer. Sellers can use the getCategorySuggestions method of the Taxonomy API to retrieve suggested category ID values. The seller passes in a query string like &quot;iPhone 6&quot;, and category ID values for suggested categories are returned in the response. If this field exists for the current unpublished offer, it should be provided again in the updateOffer call, even if the eBay category is not changing. For a published offer (aka active eBay listing), this field must be provided or an error may occur. The eBay category of an active eBay listing cannot be changed once the listing has one or more sales, or if the listing is scheduled to end in less than 12 hours.
    string categoryId?;
    # This type is used to identify the charitable organization associated with the listing, and the percentage of the sale proceeds that the charitable organization will receive for each sale generated by the listing. In order to receive a percentage of the sales proceeds, the charitable organization must be registered with the PayPal Giving Fund, which is a partner of eBay for Charity.
    Charity charity?;
    # This field is included and set to true if the seller wishes to update a published or unpublished offer with the private listing feature. Alternatively, the seller could also remove the private listing feature (if already set for a published or unpublished offer) by including this field and setting it to false. Sellers may want to use this option when they believe that a listing's potential bidders/buyers would not want their obfuscated user IDs (and feedback scores) exposed to other users.
    boolean hideBuyerDetails?;
    # This field indicates whether or not eBay product catalog details are applied to a listing. A value of true indicates the listing corresponds to the eBay product associated with the provided product identifier. The product identifier is provided in createOrReplaceInventoryItem. Note: Though the includeCatalogProductDetails parameter is not required to be submitted in the request, the parameter defaults to 'true' if omitted.
    boolean includeCatalogProductDetails?;
    # The text in this field is (published offers), or will become (unpublished offers) the description of the eBay listing. This field is not immediately required for an unpublished offer, but will be required before publishing the offer. Note that if the listingDescription field was omitted in the createOffer call for the offer, the offer entity should have picked up the text provided in the product.description field of the inventory item record, or if the inventory item is part of a group, the offer entity should have picked up the text provided in the description field of the inventory item group record. HTML tags and markup can be used in listing descriptions, but each character counts toward the max length limit. Note: To ensure that their short listing description is optimized when viewed on mobile devices, sellers should strongly consider using eBay's View Item description summary feature when listing their items. Keep in mind that the 'short' listing description is what prospective buyers first see when they view the listing on a mobile device. The 'full' listing description is also available to mobile users when they click on the short listing description, but the full description is not automatically optimized for viewing in mobile devices, and many users won't even drill down to the full description. Using HTML div and span tag attributes, this feature allows sellers to customize and fully control the short listing description that is displayed to prospective buyers when viewing the listing on a mobile device. The short listing description on mobile devices is limited to 800 characters, and whenever the full listing description (provided in this field, in UI, or seller tool) exceeds this limit, eBay uses a special algorithm to derive the best possible short listing description within the 800-character limit. However, due to some short listing description content being removed, it is definitely not ideal for the seller, and could lead to a bad buyer experience and possibly to a Significantly not as described (SNAD) case, since the buyer may not get complete details on the item when viewing the short listing description. See the eBay help page for more details on using the HTML div and span tags. If this field exists for the current unpublished offer, it should be provided again in the updateOffer call, even if the text is not changing. For a published offer (aka active eBay listing), this field must be provided or an error may occur. Max length: 500000 (which includes HTML markup/tags)
    string listingDescription?;
    # This field indicates the number of days that the listing will be active. For fixed-price listings, this value must be set to GTC, but auction listings support different listing durations. The GTC (Good 'Til Cancelled) listings are automatically renewed each calendar month until the seller decides to end the listing. Note: If the listing duration expires for an auction offer without a winning bidder, the listing then becomes available as a fixed-price offer and listing duration will be GTC. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:ListingDurationEnum'>eBay API documentation</a>
    string listingDuration?;
    # This type is used to identify the payment, return, and fulfillment listing policies that will be, or are associated with the listing. Every published offer must have a payment, return, and fulfillment listing policy associated with it. This type is also used to override the shipping costs of one or more shipping service options that are associated with the fulfillment policy, to enable eBay Plus eligibility for a listing, or to enable the Best Offer feature on the listing.
    ListingPolicies listingPolicies?;
    # This field can be used with an unpublished offer if the seller wants to specify a time in the future that the listing will become active on eBay. The timestamp supplied in this field should be in UTC format, and it should be far enough in the future so that the seller will have enough time to publish the listing with the publishOffer method. This field is optional, and it doesn't apply to offers where the corresponding listing is already active. If this field is not provided, the listing starts immediately after a successful publishOffer method.
    string listingStartDate?;
    # This field is only applicable if the listing is a lot listing. A lot listing is a listing that has multiple quantity of the same item, such as four identical tires being sold as a single offer, or it can be a mixed lot of similar items, such as used clothing items or an assortment of baseball cards. Whether the lot listing involved identical items or a mixed lot, the integer value passed into this field is the total number of items in the lot. Lots can be used for auction and fixed-price listings.
    int lotSize?;
    # The unique identifier of a merchant's inventory location (where the inventory item in the offer is located). A merchantLocationKey value is established when the merchant creates an inventory location using the createInventoryLocation call. To get more information about inventory locations, the getInventoryLocation call can be used. This field is not initially required upon first creating an offer, but will become required before an offer can be published. Max length: 36
    string merchantLocationKey?;
    # This type is used to specify the listing price for the product and settings for the Minimum Advertised Price and Strikethrough Pricing features. The price field must be supplied before an offer is published, but a seller may create an offer without supplying a price initially. The Minimum Advertised Price feature is only available on the US site. Strikethrough Pricing is available on the US, eBay Motors, UK, Germany, Canada (English and French), France, Italy, and Spain sites.
    PricingSummary pricingSummary?;
    # This field is only applicable and set if the seller wishes to set a restriction on the purchase quantity per seller. If this field is set by the seller for the offer, then each distinct buyer may purchase up to, but not exceeding the quantity specified for this field. So, if this field's value is 5, each buyer may purchase between one to five of these products, and the purchases can occur in one multiple-quantity purchase, or over multiple transactions. If a buyer attempts to purchase one or more of these products, and the cumulative quantity will take the buyer beyond the quantity limit, that buyer will be blocked from that purchase. If this field currently exists for an unpublished or published offer, it should be provided again in an updateOffer call, even if the value is not changing.
    int quantityLimitPerBuyer?;
    # The unique identifier for a secondary category. This field is applicable if the seller decides to list the item under two categories. Sellers can use the getCategorySuggestions method of the Taxonomy API to retrieve suggested category ID values. A fee may be charged when adding a secondary category to a listing. Note: You cannot list US eBay Motors vehicles in two categories. However, you can list Parts &amp; Accessories in two categories.
    string secondaryCategoryId?;
    # This container is used if the seller would like to place the inventory item into one or two store categories that the seller has set up for their eBay store. The string value(s) passed in to this container will be the full path(s) to the store categories, as shown below: &quot;storeCategoryNames&quot;: [  &quot;/Fashion/Men/Shirts&quot;,  &quot;/Fashion/Men/Accessories&quot; ], If this field currently exists for an unpublished or published offer, it should be provided again in an updateOffer call, even if the eBay categories are not changing.
    string[] storeCategoryNames?;
    # This type is used to enable the use of a sales tax table, to pass in a tax exception category code, or to specify a VAT percentage.
    Tax tax?;
};

# This type is used to specify the quantity of the inventory item that is available for purchase if the item will be shipped to the buyer, and the quantity of the inventory item that is available for In-Store Pickup at one or more of the merchant's physical stores. In-Store Pickup is only available to large merchants selling on the US, UK, Germany, and Australia sites.
public type Availability record {
    # This container consists of an array of one or more of the merchant's physical store locations where the inventory item is available for In-Store Pickup orders. The merchant's location, the quantity available, and the fulfillment time (how soon the item will be ready for pickup after the order takes place) are all in this container. In-Store Pickup is only available to large merchants selling on the US, UK, Germany, and Australia sites.
    PickupAtLocationAvailability[] pickupAtLocationAvailability?;
    # This type is used to specify the total 'ship-to-home' quantity of the inventory item that will be available for purchase through one or more published offers.
    ShipToLocationAvailability shipToLocationAvailability?;
};

# This type is used by the response payload of the bulkMigrateListings call.
public type BulkMigrateListingResponse record {
    # This is the base container of the response payload of the bulkMigrateListings call. The results of each attempted listing migration is captured under this container.
    MigrateListingResponse[] responses?;
};

# This type is used by the compatibilityProperties container to identify a motor vehicle using name/value pairs.
public type NameValueList record {
    # This string value identifies the motor vehicle aspect, such as 'make', 'model', 'year', 'trim', and 'engine'. Typically, the make, model, and year of the motor vehicle are always required, with the trim and engine being necessary sometimes, but it will be dependent on the part or accessory, and on the vehicle class.
    string name?;
    # This string value identifies the motor vehicle aspect specified in the corresponding name field. For example, if the name field is 'make', this field may be 'Toyota', or if the name field is 'model', this field may be 'Camry'.
    string value?;
};

# This type is used by the createInventoryLocation call to provide an full or partial address of an inventory location.
public type LocationDetails record {
    # This type is used to define the physical address of an inventory location.
    Address address?;
    # This type is used to express the Global Positioning System (GPS) latitude and longitude coordinates of an inventory location.
    GeoCoordinates geoCoordinates?;
};

# This type is used to specify/indicate the quantity of the inventory item that is available for an In-Store Pickup order at the merchant's physical store (specified by the merchantLocationKey field).
public type PickupAtLocationAvailability record {
    # The enumeration value in this field indicates the availability status of the inventory item at the merchant's physical store specified by the pickupAtLocationAvailability.merchantLocationKey field. This field is required if the pickupAtLocationAvailability container is used, and is always returned with the pickupAtLocationAvailability container. See AvailabilityTypeEnum for more information about how/when you use each enumeration value. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:AvailabilityTypeEnum'>eBay API documentation</a>
    string availabilityType?;
    # This type is used to indicate the fulfillment time for an In-Store Pickup order, or for an order than will be shipped to the buyer.
    TimeDuration fulfillmentTime?;
    # The unique identifier of a merchant's store where the In-Store Pickup inventory item is currently located, or where inventory will be sent to. If the merchant's store is currently awaiting for inventory, the availabilityType value should be SHIP_TO_STORE. This field is required if the pickupAtLocationAvailability container is used, and is always returned with the pickupAtLocationAvailability container. Max length: 36
    string merchantLocationKey?;
    # This integer value indicates the quantity of the inventory item that is available for In-Store Pickup at the store identified by the merchantLocationKey value. The value of quantity should be an integer value greater than 0, unless the inventory item is out of stock. This field is required if the pickupAtLocationAvailability container is used, and is always returned with the pickupAtLocationAvailability container.
    int quantity?;
};

# This type is used by the base container of the bulkMigrateListings request payload.
public type BulkMigrateListing record {
    # This is the base container of the bulkMigrateListings request payload. One to five eBay listings will be included under this container.
    MigrateListing[] requests?;
};

# This type is used to indicate the parameter field/value that caused an issue with the call request.
public type ErrorParameter record {
    # This type contains the name and value of an input parameter that contributed to a specific error or warning condition.
    string name?;
    # This is the actual value that was passed in for the element specified in the name field.
    string value?;
};

# This type is used by the base response of the getOffers call, and it is an array of one or more of the seller's offers, along with pagination data.
public type Offers record {
    # This is the URL to the current page of offers.
    string href?;
    # This integer value is the number of offers that will be displayed on each results page.
    int 'limit?;
    # This is the URL to the next page of offers. This field will only be returned if there are additional offers to view.
    string next?;
    # This container is an array of one or more of the seller's offers for the SKU value that is passed in through the required sku query parameter. Note: Currently, the Inventory API does not support the same SKU across multiple eBay marketplaces, so the getOffers call will only return one offer. Max Occurs: 25
    EbayOfferDetailsWithAll[] offers?;
    # This is the URL to the previous page of offers. This field will only be returned if there are previous offers to view.
    string prev?;
    # This integer value indicates the number of offers being displayed on the current page of results. This number will generally be the same as the limit value if there are additional pages of results to view. Note: Currently, the Inventory API does not support the same SKU across multiple eBay marketplaces, so the Get Offers call will only return one offer, so this value should always be 1.
    int size?;
    # This integer value is the total number of offers that exist for the specified SKU value. Based on this number and on the limit value, the seller may have to toggle through multiple pages to view all offers. Note: Currently, the Inventory API does not support the same SKU across multiple eBay marketplaces, so the Get Offers call will only return one offer, so this value should always be 1.
    int total?;
};

# This type is use by the base response payload of the bulkUpdatePriceQuantity call. The bulkUpdatePriceQuantity call response will return an HTTP status code, offer ID, and SKU value for each offer/inventory item being updated, as well as an errors and/or warnings container if any errors or warnings are triggered while trying to update those offers/inventory items.
public type BulkPriceQuantityResponse record {
    # This container will return an HTTP status code, offer ID, and SKU value for each offer/inventory item being updated, as well as an errors and/or warnings container if any errors or warnings are triggered while trying to update those offers/inventory items.
    PriceQuantityResponse[] responses?;
};

# This type is used to specify the weight (and the unit used to measure that weight) of a shipping package. The weight container is conditionally required if the seller will be offering calculated shipping rates to determine shipping cost, or is using flat-rate costs, but charging a weight surcharge. See the Calculated shipping help page for more information on calculated shipping.
public type Weight record {
    # The unit of measurement used to specify the weight of a shipping package. Both the unit and value fields are required if the weight container is used. If the English system of measurement is being used, the applicable values for weight units are POUND and OUNCE. If the metric system of measurement is being used, the applicable values for weight units are KILOGRAM and GRAM. The metric system is used by most countries outside of the US. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:WeightUnitOfMeasureEnum'>eBay API documentation</a>
    string unit?;
    # The actual weight (in the measurement unit specified in the unit field) of the shipping package. Both the unit and value fields are required if the weight container is used. If a shipping package weighed 20.5 ounces, the container would look as follows: &quot;weight&quot;: {  &quot;value&quot;: 20.5,  &quot;unit&quot;: &quot;OUNCE&quot;  }
    decimal value?;
};

# This type is used to define/modify each inventory item record that is being created and/or updated with the bulkCreateOrReplaceInventoryItem method. Up to 25 inventory item records can be created and/or updated with one call.
public type InventoryItemWithSkuLocale record {
    # This type is used to specify the quantity of the inventory item that is available for purchase if the item will be shipped to the buyer, and the quantity of the inventory item that is available for In-Store Pickup at one or more of the merchant's physical stores. In-Store Pickup is only available to large merchants selling on the US, UK, Germany, and Australia sites.
    Availability availability?;
    # This enumeration value indicates the condition of the item. Supported item condition values will vary by eBay site and category. To see which item condition values that a particular eBay category supports, use the getItemConditionPolicies method of the Metadata API. This method returns condition ID values that map to the enumeration values defined in the ConditionEnum type. The Item condition ID and name values topic in the Selling Integration Guide has a table that maps condition ID values to ConditionEnum values. The getItemConditionPolicies call reference page has more information. A condition value is optional up until the seller is ready to publish an offer with the SKU, at which time it becomes required for most eBay categories. Note: The 'Manufacturer Refurbished' item condition is no longer a valid item condition on any eBay marketplace, and to reflect this change, the MANUFACTURER_REFURBISHED value is no longer applicable, and should not be used. With Version 1.13.0, the CERTIFIED_REFURBISHED enumeration value has been introduced, and CR-eligible sellers should make a note to start using CERTIFIED_REFURBISHED from this point forward. For the time being, if the MANUFACTURER_REFURBISHED enum is used for any of the SKUs in a bulkCreateOrReplaceInventoryItem method, it will be accepted but automatically converted by eBay to CERTIFIED_REFURBISHED. To list an item as 'Certified Refurbished', a seller must be pre-qualified by eBay for this feature. Any seller who is not eligible for this feature will be blocked if they try to create a new listing or revise an existing listing with this item condition. Any seller that is interested in eligibility requirements to list with 'Certified Refurbished' should see the Certified refurbished program page in Seller Center. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:ConditionEnum'>eBay API documentation</a>
    string condition?;
    # This string field is used by the seller to more clearly describe the condition of a used inventory item, or an inventory item whose condition value is not NEW, LIKE_NEW, NEW_OTHER, or NEW_WITH_DEFECTS. The conditionDescription field is available for all eBay categories. If the conditionDescription field is used with an item in one of the new conditions (mentioned in previous paragraph), eBay will simply ignore this field if included, and eBay will return a warning message to the user. This field should only be used to further clarify the condition of the used item. It should not be used for branding, promotions, shipping, returns, payment or other information unrelated to the condition of the used item. Make sure that the condition value, condition description, listing description, and the item's pictures do not contradict one another. This field is not always required, but is required if an inventory item is being updated and a condition description already exists for that inventory item. This field is returned in the getInventoryItem, bulkGetInventoryItem, and getInventoryItems calls if a condition description was provided for a used inventory item. Max Length: 1000.
    string conditionDescription?;
    # This field is for future use only. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:LocaleEnum'>eBay API documentation</a>
    string locale?;
    # This type is used to indicate the package type, weight, and dimensions of the shipping package. Package weight and dimensions are required when calculated shipping rates are used, and weight alone is required when flat-rate shipping is used, but with a weight surcharge. See the Calculated shipping help page for more information on calculated shipping.
    PackageWeightAndSize packageWeightAndSize?;
    # This type is used to define the product details, such as a title, a product description, product aspects/item specifics, and links to images for the product. Optionally, in a createOrReplaceInventoryItem call, a seller can pass in an eBay Product Identifier (ePID) or a Global Trade Item Number (GTIN) value, such as an EAN, an ISBN, a UPC, to identify a product to be matched with a product in the eBay Catalog. The information in this type is also returned in the getInventoryItem, getInventoryItems, and bulkGetInventoryItem calls if defined.
    Product product?;
    # This is the seller-defined SKU value of the product that will be listed on the eBay site (specified in the marketplaceId field). Only one offer (in unpublished or published state) may exist for each sku/marketplaceId/format combination. This field is required. Max Length: 50
    string sku?;
};

# This type is used to specify the total 'ship-to-home' quantity of the inventory items that will be available for purchase through one or more published offers.
public type ShipToLocationAvailabilityWithAll record {
    # This type is used to indicate the quantities of the inventory items that are reserved for the different listing formats of the SKU offers.
    FormatAllocation allocationByFormat?;
    # This container is used to set the available quantity of the inventory item at one or more warehouse locations. This container will be returned if the available quantity is set for one or more inventory locations.
    AvailabilityDistribution[] availabilityDistributions?;
    # This container is used to set the total 'ship-to-home' quantity of the inventory item that will be available for purchase through one or more published offers. This container is not immediately required, but 'ship-to-home' quantity must be set before an offer of the inventory item can be published. If an existing inventory item is being updated, and the 'ship-to-home' quantity already exists for the inventory item record, this container should be included again, even if the value is not changing, or the available quantity data will be lost.
    int quantity?;
};

# This type is used to express the Global Positioning System (GPS) latitude and longitude coordinates of an inventory location.
public type GeoCoordinates record {
    # The latitude (North-South) component of the geographic coordinate. This field is required if a geoCoordinates container is used. This field is returned if geographical coordinates are set for the inventory location.
    decimal latitude?;
    # The longitude (East-West) component of the geographic coordinate. This field is required if a geoCoordinates container is used. This field is returned if geographical coordinates are set for the inventory location.
    decimal longitude?;
};

# This type is used by the offers container in a Bulk Update Price and Quantity call to update the current price and/or quantity of one or more offers associated with a specific inventory item.
public type OfferPriceQuantity record {
    # This field is used if the seller wants to modify the current quantity of the inventory item that will be available for purchase in the offer (identified by the corresponding offerId value). Either the availableQuantity field or the price container is required, but not necessarily both.
    int availableQuantity?;
    # This field is the unique identifier of the offer. If an offers container is used to update one or more offers associated to a specific inventory item, the offerId value is required in order to identify the offer to update with a modified price and/or quantity. The seller can run a getOffers call (passing in the correct SKU value as a query parameter) to retrieve offerId values for offers associated with the SKU.
    string offerId?;
    # This type is used to express a dollar value and the applicable currency.
    Amount price?;
};

# This type is used by the base response of the bulkPublishOffer method.
public type BulkPublishResponse record {
    # A node is returned under the responses container to indicate the success or failure of each offer that the seller was attempting to publish.
    OfferResponseWithListingId[] responses?;
};

# This type is used by the createInventoryLocation call to provide details on the inventory location, including the location's name, physical address, operating hours, special hours, phone number and other details of an inventory location.
public type InventoryLocationFull record {
    # This type is used by the createInventoryLocation call to provide an full or partial address of an inventory location.
    LocationDetails location?;
    # This text field is used by the merchant to provide additional information about an inventory location. Max length: 256
    string locationAdditionalInformation?;
    # This text field is generally used by the merchant to provide special pickup instructions for a store inventory location. Although this field is optional, it is recommended that merchants provide this field to create a pleasant and easy pickup experience for In-Store Pickup and Click and Collect orders. If this field is not included in the call request payload, eBay will use the default pickup instructions contained in the merchant's profile (if available).
    string locationInstructions?;
    # This container is used to define the function of the inventory location. Typically, an inventory location will serve as a store or a warehouse, but in some cases, an inventory location may be both. If this container is omitted, the location type of the inventory location will default to WAREHOUSE. See StoreTypeEnum for the supported values. Default: WAREHOUSE
    string[] locationTypes?;
    # This text field is used by the merchant to provide the Website address (URL) associated with the inventory location. Max length: 512
    string locationWebUrl?;
    # This field is used to indicate whether the inventory location will be enabled (inventory can be loaded to location) or disabled (inventory can not be loaded to location). If this field is omitted, a successful createInventoryLocation call will automatically enable the inventory location. A merchant may want to create a new inventory location but leave it as disabled if the inventory location is not yet ready for active inventory. Once the inventory location is ready, the merchant can use the enableInventoryLocation call to enable an inventory location that is in a disabled state. See StatusEnum for the supported values. Default: ENABLED For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/api:StatusEnum'>eBay API documentation</a>
    string merchantLocationStatus?;
    # The name of the inventory location. This name should be a human-friendly name as it will be displayed in In-Store Pickup and Click and Collect listings. A name is not required for warehouse inventory locations. For store inventory locations, this field is not immediately required, but will be required before an offer enabled with the In-Store Pickup or Click and Collect capability can be published. So, if the seller omits this field in a createInventoryLocation call, it becomes required for an updateInventoryLocation call. Max length: 1000
    string name?;
    # Although not technically required, this container is highly recommended to be used to specify operating hours for a store inventory location. This container is used to express the regular operating hours for a store location during each day of the week. A dayOfWeekEnum field and an intervals container will be needed for each day of the week that the store location is open.
    OperatingHours[] operatingHours?;
    # Although not technically required, this field is highly recommended to be used to specify the phone number for a store inventory location. Max length: 36
    string phone?;
    # This container is used to express the special operating hours for a store inventory location on a specific date, such as a holiday. The special hours specified for the specific date will override the normal operating hours for that particular day of the week.
    SpecialHours[] specialHours?;
};

# This type is used to specify the listing price for the product and settings for the Minimum Advertised Price and Strikethrough Pricing features. The price field must be supplied before an offer is published, but a seller may create an offer without supplying a price initially. The Minimum Advertised Price feature is only available on the US site. Strikethrough Pricing is available on the US, eBay Motors, UK, Germany, Canada (English and French), France, Italy, and Spain sites.
public type PricingSummary record {
    # This type is used to express a dollar value and the applicable currency.
    Amount auctionReservePrice?;
    # This type is used to express a dollar value and the applicable currency.
    Amount auctionStartPrice?;
    # This type is used to express a dollar value and the applicable currency.
    Amount minimumAdvertisedPrice?;
    # This field is needed if the Strikethrough Pricing (STP) feature will be used in the offer. This field indicates that the product was sold for the price in the originalRetailPrice field on an eBay site, or sold for that price by a third-party retailer. When using the createOffer or updateOffer calls, the seller will pass in a value of ON_EBAY to indicate that the product was sold for the originalRetailPrice on an eBay site, or the seller will pass in a value of OFF_EBAY to indicate that the product was sold for the originalRetailPrice through a third-party retailer. This field and the originalRetailPrice field are only applicable if the seller and listing are eligible to use the Strikethrough Pricing feature, a feature which is limited to the US (core site and Motors), UK, Germany, Canada (English and French versions), France, Italy, and Spain sites. This field will be returned if set for the offer. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:SoldOnEnum'>eBay API documentation</a>
    string originallySoldForRetailPriceOn?;
    # This type is used to express a dollar value and the applicable currency.
    Amount originalRetailPrice?;
    # This type is used to express a dollar value and the applicable currency.
    Amount price?;
    # This field is needed if the Minimum Advertised Price (MAP) feature will be used in the offer. This field is only applicable if an eligible US seller is using the Minimum Advertised Price (MAP) feature and a minimumAdvertisedPrice has been specified. The value set in this field will determine whether the MAP price is shown to a prospective buyer prior to checkout through a pop-up window accessed from the View Item page, or if the MAP price is not shown until the checkout flow after the buyer has already committed to buying the item. To show the MAP price prior to checkout, the seller will set this value to PRE_CHECKOUT. To show the MAP price after the buyer already commits to buy the item, the seller will set this value to DURING_CHECKOUT. This field will be ignored if the seller and/or the listing is not eligible for the MAP feature. This field will be returned if set for the offer. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:MinimumAdvertisedPriceHandlingEnum'>eBay API documentation</a>
    string pricingVisibility?;
};

# This type is used by the inventoryItems container that is returned in the response of the bulkMigrateListing call. Up to five sku/offerId pairs may be returned under the inventoryItems container, dependent on how many eBay listings the seller is attempting to migrate to the inventory model.
public type InventoryItemListing record {
    # Upon a successful migration of a listing, eBay auto-generates this unique identifier, and this offer ID value will be used to retrieve and manage the newly-created offer object. This value will only be generated and returned if the eBay listing is migrated successfully.
    string offerId?;
    # This is the seller-defined SKU value associated with the item(s) in a listing. This same SKU value will be used to retrieve and manage the newly-created inventory item object if the listing migration is successful. This SKU value will get returned even if the migration is not successful.
    string sku?;
};

# The base response of the withdrawOffer call.
public type WithdrawResponse record {
    # The unique identifier of the eBay listing associated with the offer that was withdrawn. This field will not be returned if the eBay listing was not successfully ended.
    string listingId?;
    # This container will be returned if there were one or more warnings associated with the attempt to withdraw the offer.
    Error[] warnings?;
};

public type InventoryItemWithSkuLocaleGroupid record {
    # This type is used to specify the quantity of the inventory items that are available for purchase if the items will be shipped to the buyer, and the quantity of the inventory items that are available for In-Store Pickup at one or more of the merchant's physical stores. In-Store Pickup is only available to large merchants selling on the US, UK, Germany, and Australia sites.
    AvailabilityWithAll availability?;
    # This enumeration value indicates the condition of the item. Supported item condition values will vary by eBay site and category. Since the condition of an inventory item must be specified before being published in an offer, this field is always returned in the 'Get' calls for SKUs that are part of a published offer. If a SKU is not part of a published offer, this field will only be returned if set for the inventory item. Note: The 'Manufacturer Refurbished' item condition is no longer a valid item condition on any eBay marketplace, and to reflect this change, the MANUFACTURER_REFURBISHED value has essentially been replaced with the CERTIFIED_REFURBISHED enumeration value with Version 1.13.0. For any existing inventory items that have MANUFACTURER_REFURBISHED set as their condition value, eBay will automatically convert the condition of these inventory items to CERTIFIED_REFURBISHED, so it is not necessary for the developer to update these inventory items with a 'create or replace' call. To list an item as 'Certified Refurbished', a seller must be pre-qualified by eBay for this feature. Any seller who is not eligible for this feature will be blocked if they try to create a new listing or revise an existing listing with this item condition. Any seller that is interested in eligibility requirements to list with 'Certified Refurbished' should see the Certified refurbished program page in Seller Center. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:ConditionEnum'>eBay API documentation</a>
    string condition?;
    # This string field is used by the seller to more clearly describe the condition of used items, or items that are not 'Brand New', 'New with tags', or 'New in box'. The ConditionDescription field is available for all categories. If the ConditionDescription field is used with an item in a new condition (Condition IDs 1000-1499), eBay will simply ignore this field if included, and eBay will return a warning message to the user. This field should only be used to further clarify the condition of the used item. It should not be used for branding, promotions, shipping, returns, payment or other information unrelated to the condition of the item. Make sure that the condition value, condition description, listing description, and the item's pictures do not contradict one another. Max length/: 1000.
    string conditionDescription?;
    # This array is returned if the inventory item is associated with any inventory item group(s). The value(s) returned in this array are the unique identifier(s) of the inventory item group(s). This array is not returned if the inventory item is not associated with any inventory item groups.
    string[] groupIds?;
    # This array is returned if the inventory item is associated with any inventory item group(s). The value(s) returned in this array are the unique identifier(s) of the inventory item's variation in a multiple-variation listing. This array is not returned if the inventory item is not associated with any inventory item groups.
    string[] inventoryItemGroupKeys?;
    # This field is for future use only. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:LocaleEnum'>eBay API documentation</a>
    string locale?;
    # This type is used to indicate the package type, weight, and dimensions of the shipping package. Package weight and dimensions are required when calculated shipping rates are used, and weight alone is required when flat-rate shipping is used, but with a weight surcharge. See the Calculated shipping help page for more information on calculated shipping.
    PackageWeightAndSize packageWeightAndSize?;
    # This type is used to define the product details, such as a title, a product description, product aspects/item specifics, and links to images for the product. Optionally, in a createOrReplaceInventoryItem call, a seller can pass in an eBay Product Identifier (ePID) or a Global Trade Item Number (GTIN) value, such as an EAN, an ISBN, a UPC, to identify a product to be matched with a product in the eBay Catalog. The information in this type is also returned in the getInventoryItem, getInventoryItems, and bulkGetInventoryItem calls if defined.
    Product product?;
    # The seller-defined Stock-Keeping Unit (SKU) of the inventory item. The seller should have a unique SKU value for every product that they sell.
    string sku?;
};

# This type is used to identify a motor vehicle that is compatible with the corresponding inventory item (the SKU that is passed in as part of the call URI). The motor vehicle can be identified through an eBay Product ID or a K-Type value. The gtin field (for inputting Global Trade Item Numbers) is for future use only. If a motor vehicle is found in the eBay product catalog, the motor vehicle properties (engine, make, model, trim, and year) will automatically get picked up for that motor vehicle. Note: Currently, parts compatibility is only applicable for motor vehicles, but it is possible that the Product Compatibility feature is expanded to other (non-vehicle) products in the future.
public type ProductIdentifier record {
    # This field can be used if the seller already knows the eBay catalog product ID (ePID) associated with the motor vehicle that is to be added to the compatible product list. If this eBay catalog product ID is found in the eBay product catalog, the motor vehicle properties (e.g. make, model, year, engine, and trim) will automatically get picked up for that motor vehicle.
    string epid?;
    # This field can be used if the seller knows the Global Trade Item Number for the motor vehicle that is to be added to the compatible product list. If this GTIN value is found in the eBay product catalog, the motor vehicle properties (e.g. make, model, year, engine, and trim will automatically get picked up for that motor vehicle. Note: This field is for future use.
    string gtin?;
    # This field can be used if the seller knows the K Type Number for the motor vehicle that is to be added to the compatible product list. If this K Type value is found in the eBay product catalog, the motor vehicle properties (e.g. make, model, year, engine, and trim) will automatically get picked up for that motor vehicle. Only the DE, UK, and AU sites support the use of K Type Numbers.
    string ktype?;
};

# This type is used by the createOrReplaceProductCompatibility call to associate compatible vehicles to an inventory item. This type is also the base response of the getProductCompatibility call.
public type Compatibility record {
    # This container consists of an array of motor vehicles (make, model, year, trim, engine) that are compatible with the motor vehicle part or accessory specified by the sku value.
    CompatibleProduct[] compatibleProducts?;
    # This is the seller-defined SKU value of the inventory item that will be associated with the compatible vehicles. This field is not applicable to the createOrReplaceProductCompatibility call, but it is always returned with the getProductCompatibility call. For the createOrReplaceProductCompatibility call, the SKU value for the inventory item is actually passed in as part of the call URI, and not in the request payload.
    string sku?;
};

# This type is used to identify the charitable organization associated with the listing, and the percentage of the sale proceeds that the charitable organization will receive for each sale generated by the listing. In order to receive a percentage of the sales proceeds, the charitable organization must be registered with the PayPal Giving Fund, which is a partner of eBay for Charity.
public type Charity record {
    # The eBay-assigned unique identifier of the charitable organization that will receive a percentage of the sales proceeds. The charitable organization must be reqistered with the PayPal Giving Fund in order to receive sales proceeds through eBay listings. This field is conditionally required if a seller is planning on donating a percentage of the sale proceeds to a charitable organization. The eBay-assigned unique identifier of a charitable organization can be found using the GetCharities call of the Trading API. In the GetCharities call response, this unique identifier is shown in the id attribute of the Charity container.
    string charityId?;
    # This field is the percentage of the purchase price that the charitable organization (identified in the charityId field) will receive for each sale that the listing generates. This field is conditionally required if a seller is planning on donating a percentage of the sale proceeds to a charitable organization. This numeric value can range from 10 to 100, and in any 5 (percent) increments in between this range (e.g. 10, 15, 20...95,... 100). The seller would pass in 10 for 10 percent, 15 for 15 percent, 20 for 20 percent, and so on, all the way to 100 for 100 percent.
    string donationPercentage?;
};

# This type is used by the base response of the bulkCreateOffer method.
public type BulkOfferResponse record {
    OfferSkuResponse[] responses?;
};

# This type is used by the intervals container to define the opening and closing times of a store's working day. Local time (in Military format) is used, with the following format: hh:mm:ss.
public type Interval record {
    # The close value is actually the time that the store closes. Local time (in Military format) is used. So, if a store closed at 8 PM local time, the close time would look like the following: 20:00:00. This field is conditionally required if the intervals container is used to specify working hours or special hours for a store. This field is returned if set for the store location.
    string close?;
    # The open value is actually the time that the store opens. Local time (in Military format) is used. So, if a store opens at 9 AM local time, the close time would look like the following: 09:00:00. This field is conditionally required if the intervals container is used to specify working hours or special hours for a store. This field is returned if set for the store location.
    string open?;
};

# This type is used to provide detailed information about an inventory item.
public type InventoryItem record {
    # This type is used to specify the quantity of the inventory item that is available for purchase if the item will be shipped to the buyer, and the quantity of the inventory item that is available for In-Store Pickup at one or more of the merchant's physical stores. In-Store Pickup is only available to large merchants selling on the US, UK, Germany, and Australia sites.
    Availability availability?;
    # This enumeration value indicates the condition of the item. Supported item condition values will vary by eBay site and category. To see which item condition values that a particular eBay category supports, use the getItemConditionPolicies method of the Metadata API. This method returns condition ID values that map to the enumeration values defined in the ConditionEnum type. The Item condition ID and name values topic in the Selling Integration Guide has a table that maps condition ID values to ConditionEnum values. The getItemConditionPolicies call reference page has more information. A condition value is optional up until the seller is ready to publish an offer with the SKU, at which time it becomes required for most eBay categories. Note: The 'Manufacturer Refurbished' item condition is no longer a valid item condition on any eBay marketplace, and to reflect this change, the MANUFACTURER_REFURBISHED value is no longer applicable, and should not be used. With Version 1.13.0, the CERTIFIED_REFURBISHED enumeration value has been introduced, and CR-eligible sellers should make a note to start using CERTIFIED_REFURBISHED from this point forward. For the time being, if the MANUFACTURER_REFURBISHED enum is used in a createOrReplaceInventoryItem method, it will be accepted but automatically converted by eBay to CERTIFIED_REFURBISHED. In the future, the MANUFACTURER_REFURBISHED may start triggering an error if used. To list an item as 'Certified Refurbished', a seller must be pre-qualified by eBay for this feature. Any seller who is not eligible for this feature will be blocked if they try to create a new listing or revise an existing listing with this item condition. Any seller that is interested in eligibility requirements to list with 'Certified Refurbished' should see the Certified refurbished program page in Seller Center. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:ConditionEnum'>eBay API documentation</a>
    string condition?;
    # This string field is used by the seller to more clearly describe the condition of a used inventory item, or an inventory item whose condition value is not NEW, LIKE_NEW, NEW_OTHER, or NEW_WITH_DEFECTS. The conditionDescription field is available for all eBay categories. If the conditionDescription field is used with an item in one of the new conditions (mentioned in previous paragraph), eBay will simply ignore this field if included, and eBay will return a warning message to the user. This field should only be used to further clarify the condition of the used item. It should not be used for branding, promotions, shipping, returns, payment or other information unrelated to the condition of the used item. Make sure that the condition value, condition description, listing description, and the item's pictures do not contradict one another. This field is not always required, but is required if an inventory item is being updated and a condition description already exists for that inventory item. This field is returned in the getInventoryItem and getInventoryItems calls if a condition description was provided for a used inventory item. Max Length: 1000.
    string conditionDescription?;
    # This type is used to indicate the package type, weight, and dimensions of the shipping package. Package weight and dimensions are required when calculated shipping rates are used, and weight alone is required when flat-rate shipping is used, but with a weight surcharge. See the Calculated shipping help page for more information on calculated shipping.
    PackageWeightAndSize packageWeightAndSize?;
    # This type is used to define the product details, such as a title, a product description, product aspects/item specifics, and links to images for the product. Optionally, in a createOrReplaceInventoryItem call, a seller can pass in an eBay Product Identifier (ePID) or a Global Trade Item Number (GTIN) value, such as an EAN, an ISBN, a UPC, to identify a product to be matched with a product in the eBay Catalog. The information in this type is also returned in the getInventoryItem, getInventoryItems, and bulkGetInventoryItem calls if defined.
    Product product?;
};

# This type is used by the base response of the bulkCreateOrReplaceInventoryItem method.
public type BulkInventoryItemResponse record {
    # This is the base container of the bulkCreateOrReplaceInventoryItem response. The results of each attempted inventory item creation/update is captured under this container.
    InventoryItemResponse[] responses?;
};

# This type is used to display the result for each offer and/or inventory item that the seller attempted to update with a bulkUpdatePriceQuantity call. If any errors or warnings occur, the error/warning data is returned at the offer/inventory item level.
public type PriceQuantityResponse record {
    # This array will be returned if there were one or more errors associated with the update to the offer or inventory item record.
    Error[] errors?;
    # The unique identifier of the offer that was updated. This field will not be returned in situations where the seller is only updating the total 'ship-to-home' quantity of an inventory item record.
    string offerId?;
    # This is the seller-defined SKU value of the product. This field is returned whether the seller attempted to update an offer with the SKU value or just attempted to update the total 'ship-to-home' quantity of an inventory item record. Max Length: 50
    string sku?;
    # The value returned in this container will indicate the status of the attempt to update the price and/or quantity of the offer (specified in the corresponding offerId field) or the attempt to update the total 'ship-to-home' quantity of an inventory item (specified in the corresponding sku field). For a completely successful update of an offer or inventory item record, a value of 200 will appear in this field. A user can view the HTTP status codes section for information on other status codes that may be returned with the bulkUpdatePriceQuantity method.
    int statusCode?;
    # This array will be returned if there were one or more warnings associated with the update to the offer or inventory item record.
    Error[] warnings?;
};

# This type is used by the response payload of the createOffer and updateOffer calls. The offerId field contains the unique identifier for the offer if the offer is successfully created by the createOffer call. The warnings field contains any errors and/or warnings that may have been triggered by the call. Note: The offerId value is only returned with a successful createOffer call. This field will not be returned in the updateOffer response.
public type OfferResponse record {
    # The unique identifier of the offer that was just created with a createOffer call. It is not returned if the createOffer call fails to create an offer. This identifier will be needed for many offer-related calls. Note: The offerId value is only returned with a successful createOffer call. This field will not be returned in the updateOffer response.
    string offerId?;
    # This container will contain an array of errors and/or warnings when a call is made, and errors and/or warnings occur.
    Error[] warnings?;
};

# The seller-defined Stock-Keeping Unit (SKU) of each inventory item that the user wants to retrieve is passed in the request of the bulkGetInventoryItem method.
public type GetInventoryItem record {
    # An array of SKU values are passed in under the sku container to retrieve up to 25 inventory item records.
    string sku?;
};

# This type is used by the base response of the getInventoryLocation and getInventoryLocations calls. These responses provide details about inventory location(s) defined for the merchant's account.
public type InventoryLocationResponse record {
    # A complex type that is used to provide the physical address of a location, and it geo-coordinates.
    Location location?;
    # This text field provides additional information about an inventory location. This field is returned if it is set for the inventory location. Max length: 256
    string locationAdditionalInformation?;
    # This text field is used by the merchant to provide special pickup instructions for the store location. This field can help create a pleasant and easy pickup experience for In-Store Pickup and Click and Collect orders. If this field was not set up through a createInventoryLocation or a updateInventoryLocation call, eBay will use the default pickup instructions contained in the merchant's profile. Max length: 1000
    string locationInstructions?;
    # This container defines the function of the inventory location. Typically, an inventory location will serve as a store or a warehouse, but in some cases, an inventory location may be both. The location type of an inventory location defaults to WAREHOUSE if a location type is not specified when a merchant creates an inventory location.
    string[] locationTypes?;
    # This text field shows the Website address (URL) associated with the inventory location. This field is returned if defined for the inventory location. Max length: 512
    string locationWebUrl?;
    # The unique identifier of the inventory location. This identifier is set up by the merchant when the inventory location is first created with the createInventoryLocation call. Once this value is set for an inventory location, it cannot be modified. Max length: 36
    string merchantLocationKey?;
    # This field indicates whether the inventory location is enabled (inventory can be loaded to location) or disabled (inventory can not be loaded to location). The merchant can use the enableInventoryLocation call to enable an inventory location in disabled status, or the disableInventoryLocation call to disable an inventory location in enabled status. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/api:StatusEnum'>eBay API documentation</a>
    string merchantLocationStatus?;
    # The name of the inventory location. This name should be a human-friendly name as it will be displayed in In-Store Pickup and Click and Collect listings. For store inventory locations, this field is not required for the createInventoryLocation call, but a store inventory location must have a defined name value before an In-Store Pickup and Click and Collect enabled offer is published. So, if the seller omits this field in the createInventoryLocation call, it will have to be added later through a updateInventoryLocation call. Max length: 1000
    string name?;
    # This container shows the regular operating hours for a store location during the days of the week. A dayOfWeekEnum field and an intervals container is shown for each day of the week that the store location is open.
    OperatingHours[] operatingHours?;
    # The phone number for an inventory location. This field will typically only be set and returned for store locations. Max length: 36
    string phone?;
    # This container shows the special operating hours for a store location on a specific date or dates.
    SpecialHours[] specialHours?;
};

# This type is used by the base response payload for the getInventoryLocations call.
public type LocationResponse record {
    # The URI of the current page of results from the result set.
    string href?;
    # The number of items returned on a single page from the result set.
    int 'limit?;
    # The URI for the following page of results. This value is returned only if there is an additional page of results to display from the result set. Max length: 2048
    string next?;
    # The number of results skipped in the result set before listing the first returned result. This value is set in the request with the offset query parameter. Note: The items in a paginated result set use a zero-based list where the first item in the list has an offset of 0.
    int offset?;
    # The URI for the preceding page of results. This value is returned only if there is a previous page of results to display from the result set. Max length: 2048
    string prev?;
    # The total number of items retrieved in the result set. If no items are found, this field is returned with a value of 0.
    int total?;
    # An array of one or more of the merchant's inventory locations.
    InventoryLocationResponse[] locations?;
};

# This type is used to express the regular operating hours of a merchant's store during the days of the week.
public type OperatingHours record {
    # A dayOfWeekEnum value is required for each day of the week that the store location has regular operating hours. This field is returned if operating hours are defined for the store location. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/api:DayOfWeekEnum'>eBay API documentation</a>
    string dayOfWeekEnum?;
    # This container is used to define the opening and closing times of a store's working day (defined in the dayOfWeekEnum field). An intervals container is needed for each day of the week that the store location is open. If a store location closes for lunch (or any other period during the day) and then reopens, multiple open and close pairs are needed This container is returned if operating hours are defined for the store location.
    Interval[] intervals?;
};

# This type is used to update the total &quot;ship-to-home&quot; quantity for one or more inventory items and/or to update the price and/or quantity of one or more specific offers associated with one or more inventory items.
public type PriceQuantity record {
    # This container is needed if the seller is updating the price and/or quantity of one or more published offers, and a successful call will actually update the active eBay listing with the revised price and/or available quantity. This call is not designed to work with unpublished offers. For unpublished offers, the seller should use the updateOffer call to update the available quantity and/or price. If the seller is also using the shipToLocationAvailability container and sku field to update the total 'ship-to-home' quantity of the inventory item, the SKU value associated with the corresponding offerId value(s) must be the same as the corresponding sku value that is passed in, or an error will occur. A separate (OfferPriceQuantity) node is required for each offer being updated.
    OfferPriceQuantity[] offers?;
    # This type is used to specify the total 'ship-to-home' quantity of the inventory item that will be available for purchase through one or more published offers.
    ShipToLocationAvailability shipToLocationAvailability?;
    # This is the seller-defined SKU value of the inventory item whose total 'ship-to-home' quantity will be updated. This field is only required when the seller is updating the total quantity of an inventory item using the shipToLocationAvailability container. If the seller is updating the price and/or quantity of one or more specific offers, one or more offerId values are used instead, and the sku value is not needed. If the seller wants to update the price and/or quantity of one or more offers, and also wants to update the total 'ship-to-home' quantity of the corresponding inventory item, the SKU value associated with the offerId value(s) must be the same as the corresponding sku value that is passed in, or an error will occur. Max Length: 50
    string sku?;
};

# This is the base response of the createOrReplaceInventoryItem, createOrReplaceInventoryItemGroup, and createOrReplaceProductCompatibility calls. A response payload will only be returned for these three calls if one or more errors or warnings occur with the call.
public type BaseResponse record {
    # This container will be returned in a call response payload if one or more warnings or errors are triggered when an Inventory API call is made. This container will contain detailed information about the error or warning.
    Error[] warnings?;
};

# This type is used to express the special operating hours of a store location on a specific date. A specialHours container is needed when the store's opening hours on a specific date are different than the normal operating hours on that particular day of the week.
public type SpecialHours record {
    # A date value is required for each specific date that the store location has special operating hours. The timestamp is formatted as an ISO 8601 string, which is based on the 24-hour Coordinated Universal Time (UTC) clock. Format: [YYYY]-[MM]-[DD]T[hh]:[mm]:[ss].[sss]Z Example: 2018-08-04T07:09:00.000Z This field is returned if set for the store location.
    string date?;
    # This container is used to define the opening and closing times of a store on a specific date (defined in the date field). An intervals container is needed for each specific date that the store has special operating hours. These special operating hours on the specific date override the normal operating hours for the specific day of the week. If a store location closes for lunch (or any other period during the day) and then reopens, multiple open and close pairs are needed. This container is returned if set for the store location.
    Interval[] intervals?;
};

# This type is used to specify the quantity of the inventory items that are available for purchase if the items will be shipped to the buyer, and the quantity of the inventory items that are available for In-Store Pickup at one or more of the merchant's physical stores. In-Store Pickup is only available to large merchants selling on the US, UK, Germany, and Australia sites.
public type AvailabilityWithAll record {
    # This container consists of an array of one or more of the merchant's physical stores where the inventory item is available for in-store pickup. The store ID, the quantity available, and the fulfillment time (how soon the item will be ready for pickup after the order occurs) are all returned in this container.
    PickupAtLocationAvailability[] pickupAtLocationAvailability?;
    # This type is used to specify the total 'ship-to-home' quantity of the inventory items that will be available for purchase through one or more published offers.
    ShipToLocationAvailabilityWithAll shipToLocationAvailability?;
};

# This type is used to indicate the fulfillment time for an In-Store Pickup order, or for an order than will be shipped to the buyer.
public type TimeDuration record {
    # This enumeration value indicates the time unit used to specify the fulfillment time, such as HOUR or BUSINESS_DAY. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:TimeDurationUnitEnum'>eBay API documentation</a>
    string unit?;
    # The integer value in this field, along with the time unit in the unit field, will indicate the fulfillment time. For In-Store Pickup orders, this value will indicate how soon after an In-Store Pickup purchase can the buyer pick up the item at the designated store location. If the value of this field is 4, and the value of the unit field is HOUR, then the fulfillment time for the In-Store Pickup order is four hours, which means that the buyer will be able to pick up the item at the store four hours after the transaction took place. For standard orders that will be shipped, this value will indicate the expected fulfillment time if the inventory item is shipped from the inventory location. If the value of this field is 4, and the value of the unit field is BUSINESS_DAY, then the estimated delivery date after purchase is 4 business days.
    int value?;
};

# This type is used by the bestOfferTerms container, which is used if the seller would like to support the Best Offer feature on their listing.
public type BestOffer record {
    # This type is used to express a dollar value and the applicable currency.
    Amount autoAcceptPrice?;
    # This type is used to express a dollar value and the applicable currency.
    Amount autoDeclinePrice?;
    # This field indicates whether or not the Best Offer feature is enabled for the listing. A seller can enable the Best Offer feature for a listing as long as the category supports the Best Offer feature. The seller includes this field and sets its value to true to enable Best Offer feature.
    boolean bestOfferEnabled?;
};

# This type is used by the base request payload of the bulkUpdatePriceQuantity call. The bulkUpdatePriceQuantity call allows the seller to update the total 'ship-to-home' quantity of one or more inventory items (up to 25) and/or to update the price and/or quantity of one or more specific published offers.
public type BulkPriceQuantity record {
    # This container is used by the seller to update the total 'ship-to-home' quantity of one or more inventory items (up to 25) and/or to update the price and/or quantity of one or more specific published offers.
    PriceQuantity[] requests?;
};

# This type is used by the base request of the WithdrawByInventoryItemGroup method, which is used to end a multiple-variation listing.
public type WithdrawByInventoryItemGroupRequest record {
    # This is the unique identifier of the inventory item group. This identifier is automatically generated by eBay once an inventory item group is created. This field is required.
    string inventoryItemGroupKey?;
    # This is the unique identifier of the eBay site for which the offer will be made available. The marketPlaceId enumeration values are found in MarketplaceIdEnum. This field is required. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:MarketplaceEnum'>eBay API documentation</a>
    string marketplaceId?;
};

# This type is used by the response of the bulkGetInventoryItem method to give the status of each inventory item record that the user tried to retrieve.
public type GetInventoryItemResponse record {
    # This container will be returned if there were one or more errors associated with retrieving the inventory item record.
    Error[] errors?;
    # This type is used to provide details about each retrieved inventory item record.
    InventoryItemWithSkuLocaleGroupKeys inventoryItem?;
    # The seller-defined Stock-Keeping Unit (SKU) of the inventory item. The seller should have a unique SKU value for every product that they sell.
    string sku?;
    # The HTTP status code returned in this field indicates the success or failure of retrieving the inventory item record for the inventory item specified in the sku field. See the HTTP status codes table to see which each status code indicates.
    int statusCode?;
    # This container will be returned if there were one or more warnings associated with retrieving the inventory item record.
    Error[] warnings?;
};

# This type is used by the getListingFees call to indicate the unpublished offer(s) for which expected listing fees will be retrieved. The user passes in one or more offerId values (a maximum of 250). See the Standard selling fees help page for more information on listing fees.
public type OfferKeyWithId record {
    # The unique identifier of an unpublished offer for which expected listing fees will be retrieved. One to 250 offerId values can be passed in to the offers container for one getListingFees call. Errors will occur if offerId values representing published offers are passed in.
    string offerId?;
};

# This type is used to indicate the package type, weight, and dimensions of the shipping package. Package weight and dimensions are required when calculated shipping rates are used, and weight alone is required when flat-rate shipping is used, but with a weight surcharge. See the Calculated shipping help page for more information on calculated shipping.
public type PackageWeightAndSize record {
    # This type is used to specify the dimensions (and the unit used to measure those dimensions) of a shipping package. The dimensions container is conditionally required if the seller will be offering calculated shipping rates to determine shipping cost. See the Calculated shipping help page for more information on calculated shipping.
    Dimension dimensions?;
    # This enumeration value indicates the type of shipping package used to ship the inventory item. The supported values for this field can be found in the PackageTypeEnum type. This field will be returned if the package type is set for the inventory item. Note: You can use the GeteBayDetails Trading API call to retrieve a list of supported package types for a specific marketplace. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:PackageTypeEnum'>eBay API documentation</a>
    string packageType?;
    # This type is used to specify the weight (and the unit used to measure that weight) of a shipping package. The weight container is conditionally required if the seller will be offering calculated shipping rates to determine shipping cost, or is using flat-rate costs, but charging a weight surcharge. See the Calculated shipping help page for more information on calculated shipping.
    Weight weight?;
};

# This type is used by the base response payload of the publishOffer and publishOfferByInventoryItemGroup calls.
public type PublishResponse record {
    # The unique identifier of the newly created eBay listing. This field is returned if the single offer (if publishOffer call was used) or group of offers in an inventory item group (if publishOfferByInventoryItemGroup call was used) was successfully converted into an eBay listing.
    string listingId?;
    # This container will contain an array of errors and/or warnings if any occur when a publishOffer or publishOfferByInventoryItemGroup call is made.
    Error[] warnings?;
};

# This type is used if the seller wants to override the shipping costs or surcharge associated with a specific domestic or international shipping service option defined in the fulfillment listing policy that is being applied toward the offer. The shipping-related costs that can be overridden include the shipping cost to ship one item, the shipping cost to ship each additional item (if multiple quantity are purchased), and the shipping surcharge applied to the shipping service option.
public type ShippingCostOverride record {
    # This type is used to express a dollar value and the applicable currency.
    Amount additionalShippingCost?;
    # The integer value input into this field, along with the shippingServiceType value, sets which domestic or international shipping service option in the fulfillment policy will be modified with updated shipping costs. Specifically, the shippingCostOverrides.shippingServiceType value in a createOffer or updateOffer call must match the shippingOptions.optionType value in a fulfillment listing policy, and the shippingCostOverrides.priority value in a createOffer or updateOffer call must match the shippingOptions.shippingServices.sortOrderId value in a fulfillment listing policy. This field is always required when overriding the shipping costs of a shipping service option, and will be always be returned for each shipping service option whose costs are being overridden.
    int priority?;
    # This type is used to express a dollar value and the applicable currency.
    Amount shippingCost?;
    # This enumerated value indicates whether the shipping service specified in the priority field is a domestic or an international shipping service option. To override the shipping costs for a specific domestic shipping service in the fulfillment listing policy, this field should be set to DOMESTIC, and to override the shipping costs for each international shipping service, this field should be set to INTERNATIONAL. This value, along with priority value, sets which domestic or international shipping service option in the fulfillment policy that will be modified with updated shipping costs. Specifically, the shippingCostOverrides.shippingServiceType value in a createOffer or updateOffer call must match the shippingOptions.optionType value in a fulfillment listing policy, and the shippingCostOverrides.priority value in a createOffer or updateOffer call must match the shippingOptions.shippingServices.sortOrderId value in a fulfillment listing policy. This field is always required when overriding the shipping costs of a shipping service option, and will be always be returned for each shipping service option whose costs are being overridden. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:ShippingServiceTypeEnum'>eBay API documentation</a>
    string shippingServiceType?;
    # This type is used to express a dollar value and the applicable currency.
    Amount surcharge?;
};

# This type is used to express a dollar value and the applicable currency.
public type Amount record {
    # A three-digit string value respresenting the type of currency being used. Both the value and currency fields are required/always returned when expressing prices. See the CurrencyCodeEnum type for the full list of currencies and their corresponding three-digit string values.
    string currency?;
    # A string representation of a dollar value expressed in the currency specified in the currency field. Both the value and currency fields are required/always returned when expressing prices.
    string value?;
};

# This type is used to express expected listing fees that the seller may incur for one or more unpublished offers, as well as any eBay-related promotional discounts being applied toward a specific fee. These fees are the expected cumulative fees per eBay marketplace (which is indicated in the marketplaceId field).
public type Fee record {
    # This type is used to express a dollar value and the applicable currency.
    Amount amount?;
    # The value returned in this field indicates the type of listing fee that the seller may incur if one or more unpublished offers (offers are specified in the call request) are published on the marketplace specified in the marketplaceId field. Applicable listing fees will often include things such as InsertionFee or SubtitleFee, but many fee types will get returned even when they are 0.0. See the Standard selling fees help page for more information on listing fees.
    string feeType?;
    # This type is used to express a dollar value and the applicable currency.
    Amount promotionalDiscount?;
};

# This type is used to specify/indicate the motor vehicles that are compatible with the corresponding inventory item.
public type CompatibleProduct record {
    # This container consists of an array of motor vehicles that are compatible with the motor vehicle part or accessory specified by the SKU value in the call URI. Each motor vehicle is defined through a separate set of name/value pairs. In the name field, the vehicle aspect (such as 'make', 'model', 'year', 'trim', or 'engine') will be identified, and the value field will be used to identify the value of each aspect. The getCompatibilityProperties method of the Taxonomy API can be used to retrieve applicable vehicle aspect names for a specified category, and the getCompatibilityPropertyValues method of the Taxonomy API can be used to retrieve possible values for these same vehicle aspect names. Below is an example of identifying one motor vehicle using the compatibilityProperties container: &quot;compatibilityProperties&quot; : [ &nbsp;&nbsp;{ &nbsp;&nbsp;&nbsp;&quot;name&quot; : &quot;make&quot;, &nbsp;&nbsp;&nbsp;&quot;value&quot; : &quot;Subaru&quot; &nbsp;&nbsp;}, &nbsp;&nbsp;{ &nbsp;&nbsp;&nbsp;&quot;name&quot; : &quot;model&quot;, &nbsp;&nbsp;&nbsp;&quot;value&quot; : &quot;GL&quot; &nbsp;&nbsp;}, &nbsp;&nbsp;{ &nbsp;&nbsp;&nbsp;&quot;name&quot; : &quot;year&quot;, &nbsp;&nbsp;&nbsp;&quot;value&quot; : &quot;1983&quot; &nbsp;&nbsp;}, &nbsp;&nbsp;{ &nbsp;&nbsp;&nbsp;&quot;name&quot; : &quot;trim&quot;, &nbsp;&nbsp;&nbsp;&quot;value&quot; : &quot;Base Wagon 4-Door&quot; &nbsp;&nbsp;}, &nbsp;&nbsp;{ &nbsp;&nbsp;&nbsp;&quot;name&quot; : &quot;engine&quot;, &nbsp;&nbsp;&nbsp;&quot;value&quot; : &quot;1.8L Turbocharged&quot; &nbsp;&nbsp;} ] Typically, the make, model, and year of the motor vehicle are always required, with the trim and engine being necessary sometimes, but it will be dependent on the part or accessory, and on the vehicle class. Note: The productFamilyProperties container is in the process of being deprecated and will no longer be supported in February of 2021, so if you are a new user of createOrReplaceProductCompatibility, you should use the compatibilityProperties container instead, and if you are already integrated and using the productFamilyProperties container, you should make plans to migrate to compatibilityProperties. The productFamilyProperties and compatibilityProperties containers may not be used together or the call will fail.
    NameValueList[] compatibilityProperties?;
    # This field is optionally used by the seller to input any notes pertaining to the compatible vehicle list being defined. The seller might use this field to specify the placement of the part on a vehicle or other applicable information. This field will only be returned if specified by the seller. Max Length: 500
    string notes?;
    # This type is used to specify the details of a motor vehicle that is compatible with the inventory item specified through the SKU value in the call URI.
    ProductFamilyProperties productFamilyProperties?;
    # This type is used to identify a motor vehicle that is compatible with the corresponding inventory item (the SKU that is passed in as part of the call URI). The motor vehicle can be identified through an eBay Product ID or a K-Type value. The gtin field (for inputting Global Trade Item Numbers) is for future use only. If a motor vehicle is found in the eBay product catalog, the motor vehicle properties (engine, make, model, trim, and year) will automatically get picked up for that motor vehicle. Note: Currently, parts compatibility is only applicable for motor vehicles, but it is possible that the Product Compatibility feature is expanded to other (non-vehicle) products in the future.
    ProductIdentifier productIdentifier?;
};

# This type is used to express detailed information on errors and warnings that may occur with a call request.
public type Error record {
    # This string value indicates the error category. There are three categories of errors: request errors, application errors, and system errors.
    string category?;
    # The name of the domain in which the error or warning occurred.
    string domain?;
    # A unique code that identifies the particular error or warning that occurred. Your application can use error codes as identifiers in your customized error-handling algorithms.
    int errorId?;
    # An array of one or more reference IDs which identify the specific request element(s) most closely associated to the error or warning, if any.
    string[] inputRefIds?;
    # A detailed description of the condition that caused the error or warning, and information on what to do to correct the problem.
    string longMessage?;
    # A description of the condition that caused the error or warning.
    string message?;
    # An array of one or more reference IDs which identify the specific response element(s) most closely associated to the error or warning, if any.
    string[] outputRefIds?;
    # Various warning and error messages return one or more variables that contain contextual information about the error or waring. This is often the field or value that triggered the error or warning.
    ErrorParameter[] parameters?;
    # The name of the subdomain in which the error or warning occurred.
    string subdomain?;
};

# This type is used by the bulkCreateOffer response to show the status of each offer that the seller attempted to create with the bulkCreateOffer method. For each offer that is created successfully, the returned statusCode value should be 200, and a unique offerId should be created for each offer. If any issues occur with the creation of any offers, errors and/or warnings containers will be returned.
public type OfferSkuResponse record {
    # This container will be returned at the offer level, and will contain one or more errors if any occurred with the attempted creation of the corresponding offer.
    Error[] errors?;
    # This enumeration value indicates the listing format of the offer. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:FormatTypeEnum'>eBay API documentation</a>
    string format?;
    # This enumeration value is the unique identifier of the eBay marketplace for which the offer will be made available. This enumeration value should be the same for all offers since the bulkCreateOffer method can only be used to create offers for one eBay marketplace at a time. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:MarketplaceEnum'>eBay API documentation</a>
    string marketplaceId?;
    # The unique identifier of the newly-created offer. This identifier should be automatically created by eBay if the creation of the offer was successful. It is not returned if the creation of the offer was not successful. In which case, the user may want to scan the corresponding errors and/or warnings container to see what the issue may be.
    string offerId?;
    # The seller-defined Stock-Keeping Unit (SKU) of the inventory item. The sku value is required for each product offer that the seller is trying to create, and it is always returned to identified the product that is associated with the offer.
    string sku?;
    # The integer value returned in this field is the http status code. If an offer is created successfully, the value returned in this field should be 200. A user can view the HTTP status codes section for information on other status codes that may be returned with the bulkCreateOffer method.
    int statusCode?;
    # This container will be returned at the offer level, and will contain one or more warnings if any occurred with the attempted creation of the corresponding offer. Note that it is possible that an offer can be created successfully even if one or more warnings are triggered.
    Error[] warnings?;
};

# This type is used to specify product aspects for which variations within an inventory item group vary, and the order in which they appear in the listing. For example, t-shirts in an inventory item group may be available in multiple sizes and colors.
public type Specification record {
    # This is the name of product variation aspect. Typically, for clothing, typical aspect names are &quot;Size&quot; and &quot;Color&quot;. Product variation aspects are not required immediately upon creating an inventory item group, but these aspects will be required before a multiple-variation listing containing this inventory item group is published. For each product variation aspect that is specified through the specifications container, one name value is required and two or more variations of this aspect are required through the values array. Note: Each member of the inventory item group should have these same aspect names specified through the product.aspects container when the inventory item is created with the createOrReplaceInventoryItem or bulkCreateOrReplaceInventoryItem call. Max Length: 40
    string name?;
    # This is an array of values pertaining to the corresponding product variation aspect (specified in the name field). Below is a sample of how these values will appear under a specifications container: &quot;specifications&quot;: [{  &quot;name&quot;: &quot;Size&quot;,  &quot;values&quot;: [&quot;Small&quot;,  &quot;Medium&quot;,  &quot;Large&quot;]  },  {  &quot;name&quot;: &quot;Color&quot;,  &quot;values&quot;: [&quot;Blue&quot;,  &quot;White&quot;,  &quot;Red&quot;]  }] Note: Each member of the inventory item group should have these same aspect names, and each individual inventory item should have each variation of the product aspect values specified through the product.aspects container when the inventory item is created with the createOrReplaceInventoryItem or bulkCreateOrReplaceInventoryItem call. Max Length: 50
    string[] values?;
};

# This type is used to specify the dimensions (and the unit used to measure those dimensions) of a shipping package. The dimensions container is conditionally required if the seller will be offering calculated shipping rates to determine shipping cost. See the Calculated shipping help page for more information on calculated shipping.
public type Dimension record {
    # The actual height (in the measurement unit specified in the unit field) of the shipping package. All fields of the dimensions container are required if package dimensions are specified. If a shipping package measured 21.5 inches in length, 15.0 inches in width, and 12.0 inches in height, the dimensions container would look as follows: &quot;dimensions&quot;: {  &quot;length&quot;: 21.5,  &quot;width&quot;: 15.0,  &quot;height&quot;: 12.0,  &quot;unit&quot;: &quot;INCH&quot;  }
    decimal height?;
    # The actual length (in the measurement unit specified in the unit field) of the shipping package. All fields of the dimensions container are required if package dimensions are specified. If a shipping package measured 21.5 inches in length, 15.0 inches in width, and 12.0 inches in height, the dimensions container would look as follows: &quot;dimensions&quot;: {  &quot;length&quot;: 21.5,  &quot;width&quot;: 15.0,  &quot;height&quot;: 12.0,  &quot;unit&quot;: &quot;INCH&quot;  }
    decimal length?;
    # The unit of measurement used to specify the dimensions of a shipping package. All fields of the dimensions container are required if package dimensions are specified. If the English system of measurement is being used, the applicable values for dimension units are FEET and INCH. If the metric system of measurement is being used, the applicable values for weight units are METER and CENTIMETER. The metric system is used by most countries outside of the US. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:LengthUnitOfMeasureEnum'>eBay API documentation</a>
    string unit?;
    # The actual width (in the measurement unit specified in the unit field) of the shipping package. All fields of the dimensions container are required if package dimensions are specified. If a shipping package measured 21.5 inches in length, 15.0 inches in width, and 12.0 inches in height, the dimensions container would look as follows: &quot;dimensions&quot;: {  &quot;length&quot;: 21.5,  &quot;width&quot;: 15.0,  &quot;height&quot;: 12.0,  &quot;unit&quot;: &quot;INCH&quot;  }
    decimal width?;
};

# This type provides details of an offer, and is used by the response payloads of the getOffer and the getOffers calls.
public type EbayOfferDetailsWithAll record {
    # This integer value indicates the quantity of the inventory item (specified by the sku value) that will be available for purchase by buyers shopping on the eBay site specified in the marketplaceId field. For unpublished offers where the available quantity has yet to be set, the availableQuantity value is set to 0.
    int availableQuantity?;
    # The unique identifier of the primary eBay category that the inventory item is listed under. This field is always returned for published offers, but is only returned if set for unpublished offers.
    string categoryId?;
    # This type is used to identify the charitable organization associated with the listing, and the percentage of the sale proceeds that the charitable organization will receive for each sale generated by the listing. In order to receive a percentage of the sales proceeds, the charitable organization must be registered with the PayPal Giving Fund, which is a partner of eBay for Charity.
    Charity charity?;
    # This enumerated value indicates the listing format of the offer. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:FormatTypeEnum'>eBay API documentation</a>
    string format?;
    # This field is returned as true if the private listing feature has been enabled for the offer. Sellers may want to use this feature when they believe that a listing's potential bidders/buyers would not want their obfuscated user IDs (and feedback scores) exposed to other users. This field is always returned even if not explicitly set in the offer. It defaults to false, so will get returned as false if seller does not set this feature with a 'Create' or 'Update' offer method.
    boolean hideBuyerDetails?;
    # This field indicates whether or not eBay product catalog details are applied to a listing. A value of true indicates the listing corresponds to the eBay product associated with the provided product identifier. The product identifier is provided in createOrReplaceInventoryItem. Note: Though the includeCatalogProductDetails parameter is not required to be submitted in the request, the parameter defaults to 'true' if omitted.
    boolean includeCatalogProductDetails?;
    # This type is used by the listing container in the getOffer and getOffers calls to provide the eBay listing ID, the listing status, and quantity sold for the offer. The listing container is only returned for published offers, and is not returned for unpublished offers.
    ListingDetails listing?;
    # The description of the eBay listing that is part of the unpublished or published offer. This field is always returned for published offers, but is only returned if set for unpublished offers. Max Length: 500000 (which includes HTML markup/tags)
    string listingDescription?;
    # This field indicates the number of days that the listing will be active. This field is returned for both auction and fixed-price listings; however, the value returned for fixed-price listings will always be GTC. The GTC (Good 'Til Cancelled) listings are automatically renewed each calendar month until the seller decides to end the listing. Note: If the listing duration expires for an auction offer, the listing then becomes available as a fixed-price offer and will be GTC. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:ListingDurationEnum'>eBay API documentation</a>
    string listingDuration?;
    # This type is used to identify the payment, return, and fulfillment listing policies that will be, or are associated with the listing. Every published offer must have a payment, return, and fulfillment listing policy associated with it. This type is also used to override the shipping costs of one or more shipping service options that are associated with the fulfillment policy, to enable eBay Plus eligibility for a listing, or to enable the Best Offer feature on the listing.
    ListingPolicies listingPolicies?;
    # This timestamp is the date/time that the seller set for the scheduled listing. With the scheduled listing feature, the seller can set a time in the future that the listing will become active, instead of the listing becoming active immediately after a publishOffer call. Scheduled listings do not always start at the exact date/time specified by the seller, but the date/time of the timestamp returned in getOffer/getOffers will be the same as the timestamp passed into a 'Create' or 'Update' offer call. This field is returned if set for an offer.
    string listingStartDate?;
    # This field is only applicable and returned if the listing is a lot listing. A lot listing is a listing that has multiple quantity of the same product. An example would be a set of four identical car tires. The integer value in this field is the number of identical items being sold through the lot listing.
    int lotSize?;
    # This enumeration value is the unique identifier of the eBay site on which the offer is available, or will be made available. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:MarketplaceEnum'>eBay API documentation</a>
    string marketplaceId?;
    # The unique identifier of the inventory location. This identifier is set up by the merchant when the inventory location is first created with the createInventoryLocation call. Once this value is set for an inventory location, it can not be modified. To get more information about this inventory location, the getInventoryLocation call can be used, passing in this value at the end of the call URI. This field is always returned for published offers, but is only returned if set for unpublished offers. Max length: 36
    string merchantLocationKey?;
    # The unique identifier of the offer. This identifier is used in many offer-related calls, and it is also used in the bulkUpdatePriceQuantity call.
    string offerId?;
    # This type is used to specify the listing price for the product and settings for the Minimum Advertised Price and Strikethrough Pricing features. The price field must be supplied before an offer is published, but a seller may create an offer without supplying a price initially. The Minimum Advertised Price feature is only available on the US site. Strikethrough Pricing is available on the US, eBay Motors, UK, Germany, Canada (English and French), France, Italy, and Spain sites.
    PricingSummary pricingSummary?;
    # This field is only applicable and set if the seller wishes to set a restriction on the purchase quantity of an inventory item per seller. If this field is set by the seller for the offer, then each distinct buyer may purchase up to, but not exceed the quantity in this field. So, if this field's value is 5, each buyer may purchase a quantity of the inventory item between one and five, and the purchases can occur in one multiple-quantity purchase, or over multiple transactions. If a buyer attempts to purchase one or more of these products, and the cumulative quantity will take the buyer beyond the quantity limit, that buyer will be blocked from that purchase.
    int quantityLimitPerBuyer?;
    # The unique identifier for a secondary category. This field is applicable if the seller decides to list the item under two categories. Sellers can use the getCategorySuggestions method of the Taxonomy API to retrieve suggested category ID values. A fee may be charged when adding a secondary category to a listing. Note: You cannot list US eBay Motors vehicles in two categories. However, you can list Parts &amp; Accessories in two categories.
    string secondaryCategoryId?;
    # This is the seller-defined SKU value of the product in the offer. Max Length: 50
    string sku?;
    # The enumeration value in this field specifies the status of the offer - either PUBLISHED or UNPUBLISHED. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:OfferStatusEnum'>eBay API documentation</a>
    string status?;
    # This container is returned if the seller chose to place the inventory item into one or two eBay store categories that the seller has set up for their eBay store. The string value(s) in this container will be the full path(s) to the eBay store categories, as shown below: &quot;storeCategoryNames&quot;: [  &quot;/Fashion/Men/Shirts&quot;,  &quot;/Fashion/Men/Accessories&quot; ],
    string[] storeCategoryNames?;
    # This type is used to enable the use of a sales tax table, to pass in a tax exception category code, or to specify a VAT percentage.
    Tax tax?;
};

# This type is used to display the results of each listing that the seller attempted to migrate.
public type MigrateListingResponse record {
    # If one or more errors occur with the attempt to migrate the listing, this container will be returned with detailed information on each error.
    Error[] errors?;
    # This field will only be returned for a multiple-variation listing that the seller attempted to migrate. Its value is auto-generated by eBay. For a multiple-variation listing that is successfully migrated to the new Inventory model, eBay automatically creates an inventory item group object for the listing, and the seller will be able to retrieve and manage that new inventory item group object by using the value in this field.
    string inventoryItemGroupKey?;
    # This container exists of an array of SKU values and offer IDs. For single-variation listings, this will only be one SKU value and one offer ID (if listing was successfully migrated), but multiple SKU values and offer IDs will be returned for multiple-variation listings.
    InventoryItemListing[] inventoryItems?;
    # The unique identifier of the eBay listing that the seller attempted to migrate.
    string listingId?;
    # This is the unique identifier of the eBay Marketplace where the listing resides. The value fo the eBay US site will be EBAY_US. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:MarketplaceEnum'>eBay API documentation</a>
    string marketplaceId?;
    # This field is returned for each listing that the seller attempted to migrate. See the HTTP status codes table to see which each status code indicates.
    int statusCode?;
    # If one or more warnings occur with the attempt to migrate the listing, this container will be returned with detailed information on each warning. It is possible that a listing can be successfully migrated even if a warning occurs.
    Error[] warnings?;
};

# This type is used by the response of the bulkCreateOrReplaceInventoryItem method to indicate the success or failure of creating and/or updating each inventory item record. The sku value in this type identifies each inventory item record.
public type InventoryItemResponse record {
    # This container will be returned if there were one or more errors associated with the creation or update to the inventory item record.
    Error[] errors?;
    # This field is for future use only. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:LocaleEnum'>eBay API documentation</a>
    string locale?;
    # The seller-defined Stock-Keeping Unit (SKU) of the inventory item. The seller should have a unique SKU value for every product that they sell.
    string sku?;
    # The HTTP status code returned in this field indicates the success or failure of creating or updating the inventory item record for the inventory item indicated in the sku field. See the HTTP status codes table to see which each status code indicates.
    int statusCode?;
    # This container will be returned if there were one or more warnings associated with the creation or update to the inventory item record.
    Error[] warnings?;
};

# This type is used by the request payload of the publishByInventoryItemGroup call. The identifier of the inventory item group to publish and the eBay marketplace where the listing will be published is needed in the request payload.
public type PublishByInventoryItemGroupRequest record {
    # This is the unique identifier of the inventory item group. All unpublished offers associated with this inventory item group will be published as a multiple-variation listing if the publishByInventoryItemGroup call is successful. The inventoryItemGroupKey identifier is automatically generated by eBay once an inventory item group is created. To retrieve an inventoryItemGroupKey value, you can use the getInventoryItem call to retrieve an inventory item that is known to be in the inventory item group to publish, and then look for the inventory item group identifier under the groupIds container in the response of that call.
    string inventoryItemGroupKey?;
    # This is the unique identifier of the eBay site on which the multiple-variation listing will be published. The marketPlaceId enumeration values are found in MarketplaceIdEnum. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:MarketplaceEnum'>eBay API documentation</a>
    string marketplaceId?;
};

# This type is used by the base response payload of getInventoryItems call.
public type InventoryItems record {
    # This is the URL to the current page of inventory items.
    string href?;
    # This container is an array of one or more inventory items, with detailed information on each inventory item.
    InventoryItemWithSkuLocaleGroupid[] inventoryItems?;
    # This integer value is the number of inventory items that will be displayed on each results page.
    int 'limit?;
    # This is the URL to the next page of inventory items. This field will only be returned if there are additional inventory items to view.
    string next?;
    # This is the URL to the previous page of inventory items. This field will only be returned if there are previous inventory items to view.
    string prev?;
    # This integer value indicates the total number of pages of results that are available. This number will depend on the total number of inventory items available for viewing, and on the limit value.
    int size?;
    # This integer value is the total number of inventory items that exist for the seller's account. Based on this number and on the limit value, the seller may have to toggle through multiple pages to view all inventory items.
    int total?;
};

# This type is used by the base request payload of the createOrReplaceInventoryItemGroup call and the base response payload of the getInventoryItemGroup call.
public type InventoryItemGroup record {
    # This container consists of an array of aspects that are shared by all product variations within the inventory item group. Common aspects for the inventory item group are not immediately required upon creating an inventory item group, but these aspects will be required before the first offer of the group is published. Common aspects for a men's t-shirt might be pattern and sleeve length. See the example below to get an idea of the JSON syntax that is used to specify common aspects: &quot;aspects&quot;: {  &quot;pattern&quot;: [&quot;solid&quot;],  &quot;sleeves&quot;: [&quot;short&quot;]  }This container is always returned if one or more offers associated with the inventory item group have been published, and is only returned if set for an inventory item group if that group has yet to have any offers published.
    string[] aspects?;
    # The description of the inventory item group. This description should fully describe the product and the variations of the product that are available in the inventory item group, since this description will ultimately become the listing description once the first offer of the group is published. This field is not initially required when first creating an inventory item group, but will be required before the first offer of the group is published. Note: Since this description will ultimately become the listing description in a multiple-variation listing, the seller should omit the listingDescription field when creating the offers for each variation. If they include the listingDescription field for the individual offer(s) in an item group, the text in that field for a published offer will overwrite the text provided in this description field for the inventory item group. HTML tags and markup can be used in this field, but each character counts toward the max length limit. Note: To ensure that their short listing description is optimized when viewed on mobile devices, sellers should strongly consider using eBay's View Item description summary feature when listing their items. Keep in mind that the 'short' listing description is what prospective buyers first see when they view the listing on a mobile device. The 'full' listing description is also available to mobile users when they click on the short listing description, but the full description is not automatically optimized for viewing in mobile devices, and many users won't even drill down to the full description. Using HTML div and span tag attributes, this feature allows sellers to customize and fully control the short listing description that is displayed to prospective buyers when viewing the listing on a mobile device. The short listing description on mobile devices is limited to 800 characters, and whenever the full listing description (provided in this field, in UI, or seller tool) exceeds this limit, eBay uses a special algorithm to derive the best possible short listing description within the 800-character limit. However, due to some short listing description content being removed, it is definitely not ideal for the seller, and could lead to a bad buyer experience and possibly to a Significantly not as described (SNAD) case, since the buyer may not get complete details on the item when viewing the short listing description. See the eBay help page for more details on using the HTML div and span tags. This field is always returned if one or more offers associated with the inventory item group have been published, and is only returned if set for an inventory item group if that group has yet to have any offers published. Max Length: 500000 (which includes HTML markup/tags)
    string description?;
    # An array of one or more links to images for the inventory item group. URLs must use the &quot;HTTPS&quot; protocol. Images can be self-hosted by the seller, or sellers can use the UploadSiteHostedPictures call of the Trading API to upload images to an eBay Picture Server. If successful, the response of the UploadSiteHostedPictures call will contain a full URL to the image on an eBay Picture Server. This is the URL that will be passed in through the imageUrls array. Before any offer can be published, at least one image must exist for the offer. Links to images can either be passed in through this imageUrls container, or they can be passed in through the product.imageUrls container when creating each inventory item in the group. If the variesBy.aspectsImageVariesBy field is used to specify the main product aspect where the variations vary, the links to the images must be passed in through this imageUrls container, and there should be a picture for each variation. So, if the variesBy.aspectsImageVariesBy field is set to Color, a link should be included to an image demonstrating each available color in the group. Most eBay sites support up to 12 pictures free of charge, and eBay Motors listings can have up to 24 pictures. This container will always be returned for an inventory item group that has at least one published offer since a published offer will always have at least one picture, but this container will only be returned if defined for inventory item groups that have yet to have any published offers.
    string[] imageUrls?;
    # This is the unique identifier of the inventory item group. This identifier is created by the seller when an inventory item group is created. This field is only applicable to the getInventoryItemGroup call and not to the createOrReplaceInventoryItemGroup call. In the createOrReplaceInventoryItemGroup call, the inventoryItemGroupKey value is passed into the end of the call URI instead.
    string inventoryItemGroupKey?;
    # A subtitle is an optional listing feature that allows the seller to provide more information about the product, possibly including keywords that may assist with search results. An additional listing fee will be charged to the seller if a subtitle is used. For more information on using listing subtitles on the US site, see the Adding a subtitle to your listings help page. Note: Since this subtitle will ultimately become the subtitle in a multiple-variation listing, the seller should not include the subtitle field when creating the inventory items that are members of the group. If they do include the subtitle field in an inventory item record, the text in that field will overwrite the text provided in this subtitle field for each inventory item in the group that is published. This field will only be returned if set for an inventory item. Max Length: 55
    string subtitle?;
    # The title of the inventory item group. This title will ultimately become the listing title once the first offer of the group is published. This field is not initially required when first creating an inventory item group, but will be required before the first offer of the group is published. Note: Since this title will ultimately become the listing title in a multiple-variation listing, the seller should omit the title field when creating the inventory items that are members of the group. If they do include the title field in an inventory item record, the text in that field will overwrite the text provided in this title field for each inventory item in the group that is published. This field is always returned if one or more offers associated with the inventory item group have been published, and is only returned if set for an inventory item group if that group has yet to have any offers published. Max Length: 80
    string title?;
    # This required container is used to assign individual inventory items to the inventory item group. Multiple SKU values are passed in to this container. If updating an existing inventory item group, the seller should make sure that all member SKU values are passed in, as long as the seller wants that SKU to remain in the group. It is also possible to add or remove SKUs with a createOrReplaceInventoryItemGroup call. If the seller wants to remove a SKU from the group, that seller will just omit that SKU value from this container to remove that inventory item/SKU from the inventory item group and any published, multiple-variation listing. However, a variation cannot be removed from the group if that variation has one or more sales for that listing. A workaround for this is to set that variation's quantity to 0 and it will be 'grayed out' in the View Item page. This container is always returned.
    string[] variantSKUs?;
    # This type is used to specify the product aspect(s) where individual items of the group vary, as well as a list of the available variations of those aspects.
    VariesBy variesBy?;
};

# This type is used to indicate the status of each offer that the user attempted to publish. If an offer is successfully published, an eBay listing ID (also known as an Item ID) is returned. If there is an issue publishing the offer and creating the new eBay listing, the information about why the listing failed should be returned in the errors and/or warnings containers.
public type OfferResponseWithListingId record {
    # This container will be returned if there were one or more errors associated with publishing the offer.
    Error[] errors?;
    # The unique identifier of the newly-created eBay listing. This field is only returned if the seller successfully published the offer and created the new eBay listing.
    string listingId?;
    # The unique identifier of the offer that the seller published (or attempted to publish).
    string offerId?;
    # The HTTP status code returned in this field indicates the success or failure of publishing the offer specified in the offerId field. See the HTTP status codes table to see which each status code indicates.
    int statusCode?;
    # This container will be returned if there were one or more warnings associated with publishing the offer.
    Error[] warnings?;
};

# This type is used by the base request payload of the getListingFees call.
public type OfferKeysWithId record {
    # This container is used to identify one or more (up to 250)unpublished offers for which expected listing fees will be retrieved. The user passes one or more offerId values (maximum of 250) in to this container to identify the unpublished offers in which to retrieve expected listing fees. This call is only applicable for offers in the unpublished state. The call response gives aggregate fee amounts per eBay marketplace, and does not give fee information at the individual offer level.
    OfferKeyWithId[] offers?;
};

# This type is used to specify one to five eBay listings that will be migrated to the new Inventory model.
public type MigrateListing record {
    # The unique identifier of the eBay listing to migrate to the new Inventory model. In the Trading API, this field is known as the ItemID. Up to five unique eBay listings may be specified here in separate listingId fields. The seller should make sure that each of these listings meet the requirements that are stated at the top of this Call Reference page.
    string listingId?;
};

# This type is used to specify the total 'ship-to-home' quantity of the inventory item that will be available for purchase through one or more published offers.
public type ShipToLocationAvailability record {
    # This container is used to set the available quantity of the inventory item at one or more warehouse locations. This container will be returned if available quantity is set for one or more inventory locations.
    AvailabilityDistribution[] availabilityDistributions?;
    # This container is used to set the total 'ship-to-home' quantity of the inventory item that will be available for purchase through one or more published offers. This container is not immediately required, but 'ship-to-home' quantity must be set before an offer of the inventory item can be published. If an existing inventory item is being updated, and the 'ship-to-home' quantity already exists for the inventory item record, this container should be included again, even if the value is not changing, or the available quantity data will be lost.
    int quantity?;
};

# This type is used by the updateInventoryLocation call to update operating hours, special hours, phone number, and other minor details of an inventory location.
public type InventoryLocation record {
    # This text field is used by the merchant to provide/update additional information about an inventory location. Whatever text is passed in this field will replace the current text string defined for this field. If the text will not change, the same text should be passed in once again. Max length: 256
    string locationAdditionalInformation?;
    # This text field is generally used by the merchant to provide/update special pickup instructions for a store inventory location. Although this field is optional, it is recommended that merchants provide this field to create a pleasant and easy pickup experience for In-Store Pickup and Click and Collect orders. If this field is not included in the call request payload, eBay will use the default pickup instructions contained in the merchant's profile (if available). Whatever text is passed in this field will replace the current text string defined for this field. If the text will not change, the same text should be passed in once again. Max length: 1000
    string locationInstructions?;
    # This text field is used by the merchant to provide/update the Website address (URL) associated with the inventory location. The URL that is passed in this field will replace any other URL that may be defined for this field. Max length: 512
    string locationWebUrl?;
    # This text field is used by the merchant to update the name of the inventory location. This name should be a human-friendly name as it will be in In-Store Pickup and Click and Collect listings. A name is not required for warehouse inventory locations. For store inventory locations, this field is not immediately required, but will be required before an offer enabled with the In-Store Pickup or Click and Collect capability can be published. So, if the seller omitted this field in the createInventoryLocation call, it is required for an updateInventoryLocation call. The name that is passed in this field will replace any other name that may be defined for this field.
    string name?;
    # This container is used to provide/update the regular operating hours for a store location during the days of the week. A dayOfWeekEnum field and an intervals container will be needed for each day of the week that the store location is open. Note that if operating hours are already set for an inventory location for a specific day of the week, whatever is set through an updateInventoryLocation call will override those existing hours.
    OperatingHours[] operatingHours?;
    # This text field is used by the merchant to provide/update the phone number for the inventory location. The phone number that is passed in this field will replace any other phone number that may be defined for this field. Max length: 36
    string phone?;
    # This container is used to provide/update the special operating hours for a store location on a specific date, such as a holiday. The special hours specified for the specific date will override the normal operating hours for that particular day of the week. If special hours have already been set up for an inventory location, specifying special hours through an updateInventoryLocation call will only add to the list, unless the date(s) used are the same special date(s) already set up, in which case, the special hours set up through the updateInventoryLocation call will override the existing special hours.
    SpecialHours[] specialHours?;
};

# This type is used by the base request of the bulkGetInventoryItem method.
public type BulkGetInventoryItem record {
    # The seller passes in multiple SKU values under this container to retrieve multiple inventory item records. Up to 25 inventory item records can be retrieved at one time.
    GetInventoryItem[] requests?;
};

# This type is used to provide details about each retrieved inventory item record.
public type InventoryItemWithSkuLocaleGroupKeys record {
    # This type is used to specify the quantity of the inventory items that are available for purchase if the items will be shipped to the buyer, and the quantity of the inventory items that are available for In-Store Pickup at one or more of the merchant's physical stores. In-Store Pickup is only available to large merchants selling on the US, UK, Germany, and Australia sites.
    AvailabilityWithAll availability?;
    # This enumeration value indicates the condition of the item. Supported item condition values will vary by eBay site and category. Since the condition of an inventory item must be specified before being published in an offer, this field is always returned in the 'Get' calls for SKUs that are part of a published offer. If a SKU is not part of a published offer, this field will only be returned if set for the inventory item. Note: The 'Manufacturer Refurbished' item condition is no longer a valid item condition on any eBay marketplace, and to reflect this change, the MANUFACTURER_REFURBISHED value has essentially been replaced with the CERTIFIED_REFURBISHED enumeration value with Version 1.13.0. For any existing inventory items that have MANUFACTURER_REFURBISHED set as their condition value, eBay will automatically convert the condition of these inventory items to CERTIFIED_REFURBISHED, so it is not necessary for the developer to update these inventory items with a 'create or replace' call. To list an item as 'Certified Refurbished', a seller must be pre-qualified by eBay for this feature. Any seller who is not eligible for this feature will be blocked if they try to create a new listing or revise an existing listing with this item condition. Any seller that is interested in eligibility requirements to list with 'Certified Refurbished' should see the Certified refurbished program page in Seller Center. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:ConditionEnum'>eBay API documentation</a>
    string condition?;
    # This string field is used by the seller to more clearly describe the condition of used items, or items that are not 'Brand New', 'New with tags', or 'New in box'. The ConditionDescription field is available for all categories. If the ConditionDescription field is used with an item in a new condition (Condition IDs 1000-1499), eBay will simply ignore this field if included, and eBay will return a warning message to the user. This field should only be used to further clarify the condition of the used item. It should not be used for branding, promotions, shipping, returns, payment or other information unrelated to the condition of the item. Make sure that the condition value, condition description, listing description, and the item's pictures do not contradict one another.Max length: 1000.
    string conditionDescription?;
    # This array is returned if the inventory item is associated with any inventory item group(s). The value(s) returned in this array are the unique identifier(s) of the inventory item's variation in a multiple-variation listing. This array is not returned if the inventory item is not associated with any inventory item groups.
    string[] inventoryItemGroupKeys?;
    # This field is for future use only. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/inventory/types/slr:LocaleEnum'>eBay API documentation</a>
    string locale?;
    # This type is used to indicate the package type, weight, and dimensions of the shipping package. Package weight and dimensions are required when calculated shipping rates are used, and weight alone is required when flat-rate shipping is used, but with a weight surcharge. See the Calculated shipping help page for more information on calculated shipping.
    PackageWeightAndSize packageWeightAndSize?;
    # This type is used to define the product details, such as a title, a product description, product aspects/item specifics, and links to images for the product. Optionally, in a createOrReplaceInventoryItem call, a seller can pass in an eBay Product Identifier (ePID) or a Global Trade Item Number (GTIN) value, such as an EAN, an ISBN, a UPC, to identify a product to be matched with a product in the eBay Catalog. The information in this type is also returned in the getInventoryItem, getInventoryItems, and bulkGetInventoryItem calls if defined.
    Product product?;
    # The seller-defined Stock-Keeping Unit (SKU) of the inventory item. The seller should have a unique SKU value for every product that they sell.
    string sku?;
};

# A complex type that is used to provide the physical address of a location, and it geo-coordinates.
public type Location record {
    # This type is used to define the physical address of an inventory location.
    Address address?;
    # This type is used to express the Global Positioning System (GPS) latitude and longitude coordinates of an inventory location.
    GeoCoordinates geoCoordinates?;
    # A unique eBay-assigned ID for the location. Note: This field should not be confused with the seller-defined merchantLocationKey value. It is the merchantLocationKey value which is used to identify an inventory location when working with inventory location API calls. The locationId value is only used internally by eBay.
    string locationId?;
};
