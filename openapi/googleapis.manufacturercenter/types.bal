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

# The destination status.
public type DestinationStatus record {
    # The name of the destination.
    string destination?;
    # The status of the destination.
    string status?;
};

# A generic empty message that you can re-use to avoid defining duplicated empty messages in your APIs. A typical example is to use it as the request or the response type of an API method. For instance: service Foo { rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty); } The JSON representation for `Empty` is empty JSON object `{}`.
public type Empty record {
};

# A feature description of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#featuredesc.
public type FeatureDescription record {
    # A short description of the feature.
    string headline?;
    # An image.
    Image image?;
    # A detailed description of the feature.
    string text?;
};

# Product issue.
public type Issue record {
    # If present, the attribute that triggered the issue. For more information about attributes, see https://support.google.com/manufacturers/answer/6124116.
    string attribute?;
    # Longer description of the issue focused on how to resolve it.
    string description?;
    # The destination this issue applies to.
    string destination?;
    # What needs to happen to resolve the issue.
    string resolution?;
    # The severity of the issue.
    string severity?;
    # The timestamp when this issue appeared.
    string timestamp?;
    # Short title describing the nature of the issue.
    string title?;
    # The server-generated type of the issue, for example, “INCORRECT_TEXT_FORMATTING”, “IMAGE_NOT_SERVEABLE”, etc.
    string 'type?;
};

# A product detail of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#productdetail.
public type ProductDetail record {
    # The name of the attribute.
    string attributeName?;
    # The value of the attribute.
    string attributeValue?;
    # A short section name that can be reused between multiple product details.
    string sectionName?;
};

# The capacity of a product. For more information, see https://support.google.com/manufacturers/answer/6124116#capacity.
public type Capacity record {
    # The unit of the capacity, i.e., MB, GB, or TB.
    string unit?;
    # The numeric value of the capacity.
    string value?;
};

# A price.
public type Price record {
    # The numeric value of the price.
    string amount?;
    # The currency in which the price is denoted.
    string currency?;
};

# Attributes of the product. For more information, see https://support.google.com/manufacturers/answer/6124116.
public type Attributes record {
    # The additional images of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#addlimage.
    Image[] additionalImageLink?;
    # The target age group of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#agegroup.
    string ageGroup?;
    # The brand name of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#brand.
    string brand?;
    # The capacity of a product. For more information, see https://support.google.com/manufacturers/answer/6124116#capacity.
    Capacity capacity?;
    # The color of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#color.
    string color?;
    # The number of products in a single package. For more information, see https://support.google.com/manufacturers/answer/6124116#count.
    Count count?;
    # The description of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#description.
    string description?;
    # The disclosure date of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#disclosure.
    string disclosureDate?;
    # A list of excluded destinations.
    string[] excludedDestination?;
    # The rich format description of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#featuredesc.
    FeatureDescription[] featureDescription?;
    # The flavor of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#flavor.
    string flavor?;
    # The format of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#format.
    string format?;
    # The target gender of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#gender.
    string gender?;
    # The Global Trade Item Number (GTIN) of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#gtin.
    string[] gtin?;
    # An image.
    Image imageLink?;
    # A list of included destinations.
    string[] includedDestination?;
    # The item group id of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#itemgroupid.
    string itemGroupId?;
    # The material of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#material.
    string material?;
    # The Manufacturer Part Number (MPN) of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#mpn.
    string mpn?;
    # The pattern of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#pattern.
    string pattern?;
    # The details of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#productdetail.
    ProductDetail[] productDetail?;
    # The product highlights. For more information, see https://support.google.com/manufacturers/answer/10066942
    string[] productHighlight?;
    # The name of the group of products related to the product. For more information, see https://support.google.com/manufacturers/answer/6124116#productline.
    string productLine?;
    # The canonical name of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#productname.
    string productName?;
    # The URL of the detail page of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#productpage.
    string productPageUrl?;
    # The type or category of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#producttype.
    string[] productType?;
    # The release date of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#release.
    string releaseDate?;
    # Rich product content. For more information, see https://support.google.com/manufacturers/answer/9389865
    string[] richProductContent?;
    # The scent of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#scent.
    string scent?;
    # The size of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#size.
    string size?;
    # The size system of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#sizesystem.
    string sizeSystem?;
    # The size type of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#sizetype.
    string[] sizeType?;
    # A price.
    Price suggestedRetailPrice?;
    # The target client id. Should only be used in the accounts of the data partners.
    string targetClientId?;
    # The theme of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#theme.
    string theme?;
    # The title of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#title.
    string title?;
    # The videos of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#video.
    string[] videoLink?;
};

public type ListProductsResponse record {
    # The token for the retrieval of the next page of product statuses.
    string nextPageToken?;
    # List of the products.
    Product[] products?;
};

# Product data.
public type Product record {
    # Attributes of the product. For more information, see https://support.google.com/manufacturers/answer/6124116.
    Attributes attributes?;
    # The content language of the product as a two-letter ISO 639-1 language code (for example, en).
    string contentLanguage?;
    # The status of the destinations.
    DestinationStatus[] destinationStatuses?;
    # A server-generated list of issues associated with the product.
    Issue[] issues?;
    # Name in the format `{target_country}:{content_language}:{product_id}`. `target_country` - The target country of the product as a CLDR territory code (for example, US). `content_language` - The content language of the product as a two-letter ISO 639-1 language code (for example, en). `product_id` - The ID of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#id.
    string name?;
    # Parent ID in the format `accounts/{account_id}`. `account_id` - The ID of the Manufacturer Center account.
    string parent?;
    # The ID of the product. For more information, see https://support.google.com/manufacturers/answer/6124116#id.
    string productId?;
    # The target country of the product as a CLDR territory code (for example, US).
    string targetCountry?;
};

# The number of products in a single package. For more information, see https://support.google.com/manufacturers/answer/6124116#count.
public type Count record {
    # The unit in which these products are counted.
    string unit?;
    # The numeric value of the number of products in a package.
    string value?;
};

# An image.
public type Image record {
    # The URL of the image. For crawled images, this is the provided URL. For uploaded images, this is a serving URL from Google if the image has been processed successfully.
    string imageUrl?;
    # The status of the image. @OutputOnly
    string status?;
    # The type of the image, i.e., crawled or uploaded. @OutputOnly
    string 'type?;
};
