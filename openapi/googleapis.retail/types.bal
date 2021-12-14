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

# A transaction represents the entire purchase transaction.
public type GoogleCloudRetailV2PurchaseTransaction record {
    # All the costs associated with the products. These can be manufacturing costs, shipping expenses not borne by the end user, or any other costs, such that: * Profit = revenue - tax - cost
    float cost?;
    # Required. Currency code. Use three-character ISO-4217 code.
    string currencyCode?;
    # The transaction ID with a length limit of 128 characters.
    string id?;
    # Required. Total non-zero revenue or grand total associated with the transaction. This value include shipping, tax, or other adjustments to total revenue that you want to include as part of your revenue calculations.
    float revenue?;
    # All the taxes associated with the transaction.
    float tax?;
};

# A facet result.
public type GoogleCloudRetailV2SearchResponseFacet record {
    # Whether the facet is dynamically generated.
    boolean dynamicFacet?;
    # The key for this facet. E.g., "colorFamilies" or "price" or "attributes.attr1".
    string 'key?;
    # The facet values for this field.
    GoogleCloudRetailV2SearchResponseFacetFacetValue[] values?;
};

# Response of the SetInventoryRequest. Currently empty because there is no meaningful response populated from the SetInventory method.
public type GoogleCloudRetailV2betaSetInventoryResponse record {
};

# A summary of import result. The UserEventImportSummary summarizes the import status for user events.
public type GoogleCloudRetailV2UserEventImportSummary record {
    # Count of user events imported with complete existing catalog information.
    string joinedEventsCount?;
    # Count of user events imported, but with catalog information not found in the imported catalog.
    string unjoinedEventsCount?;
};

# Response of the RemoveFulfillmentPlacesRequest. Currently empty because there is no meaningful response populated from the RemoveFulfillmentPlaces method.
public type GoogleCloudRetailV2betaRemoveFulfillmentPlacesResponse record {
};

# BigQuery source import data from.
public type GoogleCloudRetailV2BigQuerySource record {
    # The schema to use when parsing the data from the source. Supported values for product imports: * `product` (default): One JSON Product per line. Each product must have a valid Product.id. * `product_merchant_center`: See [Importing catalog data from Merchant Center](https://cloud.google.com/retail/recommendations-ai/docs/upload-catalog#mc). Supported values for user events imports: * `user_event` (default): One JSON UserEvent per line. * `user_event_ga360`: Using https://support.google.com/analytics/answer/3437719.
    string dataSchema?;
    # Required. The BigQuery data set to copy the data from with a length limit of 1,024 characters.
    string datasetId?;
    # Intermediate Cloud Storage directory used for the import with a length limit of 2,000 characters. Can be specified if one wants to have the BigQuery export to a specific Cloud Storage directory.
    string gcsStagingDir?;
    # Represents a whole or partial calendar date, such as a birthday. The time of day and time zone are either specified elsewhere or are insignificant. The date is relative to the Gregorian Calendar. This can represent one of the following: * A full date, with non-zero year, month, and day values * A month and day value, with a zero year, such as an anniversary * A year on its own, with zero month and day values * A year and month value, with a zero day, such as a credit card expiration date Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
    GoogleTypeDate partitionDate?;
    # The project ID (can be project # or ID) that the BigQuery source is in with a length limit of 128 characters. If not specified, inherits the project ID from the parent request.
    string projectId?;
    # Required. The BigQuery table to copy the data from with a length limit of 1,024 characters.
    string tableId?;
};

# Response of the ImportCompletionDataRequest. If the long running operation is done, this message is returned by the google.longrunning.Operations.response field if the operation is successful.
public type GoogleCloudRetailV2alphaImportCompletionDataResponse record {
    # A sample of errors encountered while processing the request.
    GoogleRpcStatus[] errorSamples?;
};

# The input config source for products.
public type GoogleCloudRetailV2ProductInputConfig record {
    # BigQuery source import data from.
    GoogleCloudRetailV2BigQuerySource bigQuerySource?;
    # Google Cloud Storage location for input content. format.
    GoogleCloudRetailV2GcsSource gcsSource?;
    # The inline source for the input config for ImportProducts method.
    GoogleCloudRetailV2ProductInlineSource productInlineSource?;
};

# A summary of import result. The UserEventImportSummary summarizes the import status for user events.
public type GoogleCloudRetailV2alphaUserEventImportSummary record {
    # Count of user events imported with complete existing catalog information.
    string joinedEventsCount?;
    # Count of user events imported, but with catalog information not found in the imported catalog.
    string unjoinedEventsCount?;
};

# Metadata related to the progress of the AddFulfillmentPlaces operation. Currently empty because there is no meaningful metadata populated from the AddFulfillmentPlaces method.
public type GoogleCloudRetailV2betaAddFulfillmentPlacesMetadata record {
};

# Response of the SetInventoryRequest. Currently empty because there is no meaningful response populated from the SetInventory method.
public type GoogleCloudRetailV2SetInventoryResponse record {
};

# Request message for AddFulfillmentPlaces method.
public type GoogleCloudRetailV2AddFulfillmentPlacesRequest record {
    # The time when the fulfillment updates are issued, used to prevent out-of-order updates on fulfillment information. If not provided, the internal system time will be used.
    string addTime?;
    # If set to true, and the Product is not found, the fulfillment information will still be processed and retained for at most 1 day and processed once the Product is created. If set to false, an INVALID_ARGUMENT error is returned if the Product is not found.
    boolean allowMissing?;
    # Required. The IDs for this type, such as the store IDs for "pickup-in-store" or the region IDs for "same-day-delivery" to be added for this type. Duplicate IDs will be automatically ignored. At least 1 value is required, and a maximum of 2000 values are allowed. Each value must be a string with a length limit of 10 characters, matching the pattern [a-zA-Z0-9_-]+, such as "store1" or "REGION-2". Otherwise, an INVALID_ARGUMENT error is returned. If the total number of place IDs exceeds 2000 for this type after adding, then the update will be rejected.
    string[] placeIds?;
    # Required. The fulfillment type, including commonly used types (such as pickup in store and same day delivery), and custom types. Supported values: * "pickup-in-store" * "ship-to-store" * "same-day-delivery" * "next-day-delivery" * "custom-type-1" * "custom-type-2" * "custom-type-3" * "custom-type-4" * "custom-type-5" If this field is set to an invalid value other than these, an INVALID_ARGUMENT error is returned. This field directly corresponds to Product.fulfillment_info.type.
    string 'type?;
};

# Metadata related to the progress of the SetInventory operation. Currently empty because there is no meaningful metadata populated from the SetInventory method.
public type GoogleCloudRetailV2alphaSetInventoryMetadata record {
};

# Request message for RemoveFulfillmentPlaces method.
public type GoogleCloudRetailV2RemoveFulfillmentPlacesRequest record {
    # If set to true, and the Product is not found, the fulfillment information will still be processed and retained for at most 1 day and processed once the Product is created. If set to false, an INVALID_ARGUMENT error is returned if the Product is not found.
    boolean allowMissing?;
    # Required. The IDs for this type, such as the store IDs for "pickup-in-store" or the region IDs for "same-day-delivery", to be removed for this type. At least 1 value is required, and a maximum of 2000 values are allowed. Each value must be a string with a length limit of 10 characters, matching the pattern [a-zA-Z0-9_-]+, such as "store1" or "REGION-2". Otherwise, an INVALID_ARGUMENT error is returned.
    string[] placeIds?;
    # The time when the fulfillment updates are issued, used to prevent out-of-order updates on fulfillment information. If not provided, the internal system time will be used.
    string removeTime?;
    # Required. The fulfillment type, including commonly used types (such as pickup in store and same day delivery), and custom types. Supported values: * "pickup-in-store" * "ship-to-store" * "same-day-delivery" * "next-day-delivery" * "custom-type-1" * "custom-type-2" * "custom-type-3" * "custom-type-4" * "custom-type-5" If this field is set to an invalid value other than these, an INVALID_ARGUMENT error is returned. This field directly corresponds to Product.fulfillment_info.type.
    string 'type?;
};

# Metadata related to the progress of the RemoveFulfillmentPlaces operation. Currently empty because there is no meaningful metadata populated from the RemoveFulfillmentPlaces method.
public type GoogleCloudRetailV2alphaRemoveFulfillmentPlacesMetadata record {
};

# Metadata for RejoinUserEvents method.
public type GoogleCloudRetailV2betaRejoinUserEventsMetadata record {
};

# Metadata related to the progress of the Purge operation. This will be returned by the google.longrunning.Operation.metadata field.
public type GoogleCloudRetailV2PurgeMetadata record {
};

# The inline source for the input config for ImportProducts method.
public type GoogleCloudRetailV2ProductInlineSource record {
    # Required. A list of products to update/create. Each product must have a valid Product.id. Recommended max of 100 items.
    GoogleCloudRetailV2Product[] products?;
};

# Promotion information.
public type GoogleCloudRetailV2Promotion record {
    # ID of the promotion. For example, "free gift". The value value must be a UTF-8 encoded string with a length limit of 128 characters, and match the pattern: a-zA-Z*. For example, id0LikeThis or ID_1_LIKE_THIS. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center property [promotion](https://support.google.com/merchants/answer/7050148).
    string promotionId?;
};

# Resource that represents completion results.
public type GoogleCloudRetailV2CompleteQueryResponseCompletionResult record {
    # Additional custom attributes ingested through BigQuery.
    record {} attributes?;
    # The suggestion for the query.
    string suggestion?;
};

# The specifications of dynamically generated facets.
public type GoogleCloudRetailV2SearchRequestDynamicFacetSpec record {
    # Mode of the DynamicFacet feature. Defaults to Mode.DISABLED if it's unset.
    string mode?;
};

# Response of the auto-complete query.
public type GoogleCloudRetailV2CompleteQueryResponse record {
    # A unique complete token. This should be included in the SearchRequest resulting from this completion, which enables accurate attribution of complete model performance.
    string attributionToken?;
    # Results of the matching suggestions. The result list is ordered and the first result is top suggestion.
    GoogleCloudRetailV2CompleteQueryResponseCompletionResult[] completionResults?;
    # Matched recent searches of this user. The maximum number of recent searches is 10. This field is a restricted feature. Contact Retail Search support team if you are interested in enabling it. This feature is only available when CompleteQueryRequest.visitor_id field is set and UserEvent is imported. The recent searches satisfy the follow rules: * They are ordered from latest to oldest. * They are matched with CompleteQueryRequest.query case insensitively. * They are transformed to lower cases. * They are UTF-8 safe. Recent searches are deduplicated. More recent searches will be reserved when duplication happens.
    GoogleCloudRetailV2CompleteQueryResponseRecentSearchResult[] recentSearchResults?;
};

# Metadata related to the progress of the AddFulfillmentPlaces operation. Currently empty because there is no meaningful metadata populated from the AddFulfillmentPlaces method.
public type GoogleCloudRetailV2alphaAddFulfillmentPlacesMetadata record {
};

# Configuration of destination for Export related errors.
public type GoogleCloudRetailV2alphaExportErrorsConfig record {
    # Google Cloud Storage path for import errors. This must be an empty, existing Cloud Storage bucket. Export errors will be written to a file in this bucket, one per line, as a JSON-encoded `google.rpc.Status` message.
    string gcsPrefix?;
};

# The rating of a Product.
public type GoogleCloudRetailV2Rating record {
    # The average rating of the Product. The rating is scaled at 1-5. Otherwise, an INVALID_ARGUMENT error is returned.
    float averageRating?;
    # The total number of ratings. This value is independent of the value of rating_histogram. This value must be nonnegative. Otherwise, an INVALID_ARGUMENT error is returned.
    int ratingCount?;
    # List of rating counts per rating value (index = rating - 1). The list is empty if there is no rating. If the list is non-empty, its size is always 5. Otherwise, an INVALID_ARGUMENT error is returned. For example, [41, 14, 13, 47, 303]. It means that the Product got 41 ratings with 1 star, 14 ratings with 2 star, and so on.
    int[] ratingHistogram?;
};

# Specifies how a facet is computed.
public type GoogleCloudRetailV2SearchRequestFacetSpecFacetKey record {
    # Only get facet values that contains the given strings. For example, suppose "categories" has three values "Women > Shoe", "Women > Dress" and "Men > Shoe". If set "contains" to "Shoe", the "categories" facet will give only "Women > Shoe" and "Men > Shoe". Only supported on textual fields. Maximum is 10.
    string[] contains?;
    # Set only if values should be bucketized into intervals. Must be set for facets with numerical values. Must not be set for facet with text values. Maximum number of intervals is 30.
    GoogleCloudRetailV2Interval[] intervals?;
    # Required. Supported textual and numerical facet keys in Product object, over which the facet values are computed. Facet key is case-sensitive. Allowed facet keys when FacetKey.query is not specified: * textual_field = * "brands" * "categories" * "genders" * "ageGroups" * "availability" * "colorFamilies" * "colors" * "sizes" * "materials" * "patterns" * "conditions" * "attributes.key" * "pickupInStore" * "shipToStore" * "sameDayDelivery" * "nextDayDelivery" * "customFulfillment1" * "customFulfillment2" * "customFulfillment3" * "customFulfillment4" * "customFulfillment5" * numerical_field = * "price" * "discount" * "rating" * "ratingCount" * "attributes.key"
    string 'key?;
    # The order in which Facet.values are returned. Allowed values are: * "count desc", which means order by Facet.FacetValue.count descending. * "value desc", which means order by Facet.FacetValue.value descending. Only applies to textual facets. If not set, textual values are sorted in [natural order](https://en.wikipedia.org/wiki/Natural_sort_order); numerical intervals are sorted in the order given by FacetSpec.FacetKey.intervals; FulfillmentInfo.place_ids are sorted in the order given by FacetSpec.FacetKey.restricted_values.
    string orderBy?;
    # Only get facet values that start with the given string prefix. For example, suppose "categories" has three values "Women > Shoe", "Women > Dress" and "Men > Shoe". If set "prefixes" to "Women", the "categories" facet will give only "Women > Shoe" and "Women > Dress". Only supported on textual fields. Maximum is 10.
    string[] prefixes?;
    # The query that is used to compute facet for the given facet key. When provided, it will override the default behavior of facet computation. The query syntax is the same as a filter expression. See SearchRequest.filter for detail syntax and limitations. Notice that there is no limitation on FacetKey.key when query is specified. In the response, FacetValue.value will be always "1" and FacetValue.count will be the number of results that matches the query. For example, you can set a customized facet for "shipToStore", where FacetKey.key is "customizedShipToStore", and FacetKey.query is "availability: ANY(\"IN_STOCK\") AND shipToStore: ANY(\"123\")". Then the facet will count the products that are both in stock and ship to store "123".
    string query?;
    # Only get facet for the given restricted values. For example, when using "pickupInStore" as key and set restricted values to ["store123", "store456"], only facets for "store123" and "store456" are returned. Only supported on textual fields and fulfillments. Maximum is 20. Must be set for the fulfillment facet keys: * pickupInStore * shipToStore * sameDayDelivery * nextDayDelivery * customFulfillment1 * customFulfillment2 * customFulfillment3 * customFulfillment4 * customFulfillment5
    string[] restrictedValues?;
};

# Boost applies to products which match a condition.
public type GoogleCloudRetailV2SearchRequestBoostSpecConditionBoostSpec record {
    # Strength of the condition boost, which should be in [-1, 1]. Negative boost means demotion. Default is 0.0. Setting to 1.0 gives the item a big promotion. However, it does not necessarily mean that the boosted item will be the top result at all times, nor that other items will be excluded. Results could still be shown even when none of them matches the condition. And results that are significantly more relevant to the search query can still trump your heavily favored but irrelevant items. Setting to -1.0 gives the item a big demotion. However, results that are deeply relevant might still be shown. The item will have an upstream battle to get a fairly high ranking, but it is not blocked out completely. Setting to 0.0 means no boost applied. The boosting condition is ignored.
    float boost?;
    # An expression which specifies a boost condition. The syntax and supported fields are the same as a filter expression. See SearchRequest.filter for detail syntax and limitations. Examples: * To boost products with product ID "product_1" or "product_2", and color "Red" or "Blue": * (id: ANY("product_1", "product_2")) AND (colorFamilies: ANY("Red","Blue"))
    string condition?;
};

# Response of the RemoveFulfillmentPlacesRequest. Currently empty because there is no meaningful response populated from the AddFulfillmentPlaces method.
public type GoogleCloudRetailV2alphaAddFulfillmentPlacesResponse record {
};

# Metadata for RejoinUserEvents method.
public type GoogleCloudRetailV2RejoinUserEventsMetadata record {
};

# Response message for RejoinUserEvents method.
public type GoogleCloudRetailV2alphaRejoinUserEventsResponse record {
    # Number of user events that were joined with latest product catalog.
    string rejoinedUserEventsCount?;
};

# An error log which is reported to the Error Reporting system. This proto a superset of google.devtools.clouderrorreporting.v1beta1.ReportedErrorEvent.
public type GoogleCloudRetailLoggingErrorLog record {
    # A description of the context in which an error occurred.
    GoogleCloudRetailLoggingErrorContext context?;
    # The error payload that is populated on LRO import APIs. Including: "google.cloud.retail.v2.ProductService.ImportProducts" "google.cloud.retail.v2.EventService.ImportUserEvents"
    GoogleCloudRetailLoggingImportErrorContext importPayload?;
    # A message describing the error.
    string message?;
    # The API request payload, represented as a protocol buffer. Most API request types are supported. For example: "type.googleapis.com/google.cloud.retail.v2.ProductService.CreateProductRequest" "type.googleapis.com/google.cloud.retail.v2.UserEventService.WriteUserEventRequest"
    record {} requestPayload?;
    # The API response payload, represented as a protocol buffer. This is used to log some "soft errors", where the response is valid but we consider there are some quality issues like unjoined events. The following API responses are supported and no PII is included: "google.cloud.retail.v2.PredictionService.Predict" "google.cloud.retail.v2.UserEventService.WriteUserEvent" "google.cloud.retail.v2.UserEventService.CollectUserEvent"
    record {} responsePayload?;
    # Describes a running service that sends errors.
    GoogleCloudRetailLoggingServiceContext serviceContext?;
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    GoogleRpcStatus status?;
};

# Response of the ImportUserEventsRequest. If the long running operation was successful, then this message is returned by the google.longrunning.Operations.response field if the operation was successful.
public type GoogleCloudRetailV2alphaImportUserEventsResponse record {
    # A sample of errors encountered while processing the request.
    GoogleRpcStatus[] errorSamples?;
    # Configuration of destination for Import related errors.
    GoogleCloudRetailV2alphaImportErrorsConfig errorsConfig?;
    # A summary of import result. The UserEventImportSummary summarizes the import status for user events.
    GoogleCloudRetailV2alphaUserEventImportSummary importSummary?;
};

# Message that represents an arbitrary HTTP body. It should only be used for payload formats that can't be represented as JSON, such as raw binary or an HTML page. This message can be used both in streaming and non-streaming API methods in the request as well as the response. It can be used as a top-level request field, which is convenient if one wants to extract parameters from either the URL or HTTP template into the request fields and also want access to the raw HTTP body. Example: message GetResourceRequest { // A unique request id. string request_id = 1; // The raw HTTP body is bound to this field. google.api.HttpBody http_body = 2; } service ResourceService { rpc GetResource(GetResourceRequest) returns (google.api.HttpBody); rpc UpdateResource(google.api.HttpBody) returns (google.protobuf.Empty); } Example with streaming methods: service CaldavService { rpc GetCalendar(stream google.api.HttpBody) returns (stream google.api.HttpBody); rpc UpdateCalendar(stream google.api.HttpBody) returns (stream google.api.HttpBody); } Use of this type only changes how the request and response bodies are handled, all other features will continue to work unchanged.
public type GoogleApiHttpBody record {
    # The HTTP Content-Type header value specifying the content type of the body.
    string contentType?;
    # The HTTP request/response body as raw binary.
    string data?;
    # Application specific response metadata. Must be set in the first response for streaming APIs.
    record {}[] extensions?;
};

# Request message for Predict method.
public type GoogleCloudRetailV2PredictRequest record {
    # Filter for restricting prediction results with a length limit of 5,000 characters. Accepts values for tags and the `filterOutOfStockItems` flag. * Tag expressions. Restricts predictions to products that match all of the specified tags. Boolean operators `OR` and `NOT` are supported if the expression is enclosed in parentheses, and must be separated from the tag values by a space. `-"tagA"` is also supported and is equivalent to `NOT "tagA"`. Tag values must be double quoted UTF-8 encoded strings with a size limit of 1,000 characters. Note: "Recently viewed" models don't support tag filtering at the moment. * filterOutOfStockItems. Restricts predictions to products that do not have a stockState value of OUT_OF_STOCK. Examples: * tag=("Red" OR "Blue") tag="New-Arrival" tag=(NOT "promotional") * filterOutOfStockItems tag=(-"promotional") * filterOutOfStockItems If your filter blocks all prediction results, nothing will be returned. If you want generic (unfiltered) popular products to be returned instead, set `strictFiltering` to false in `PredictRequest.params`.
    string filter?;
    # The labels applied to a resource must meet the following requirements: * Each resource can have multiple labels, up to a maximum of 64. * Each label must be a key-value pair. * Keys have a minimum length of 1 character and a maximum length of 63 characters, and cannot be empty. Values can be empty, and have a maximum length of 63 characters. * Keys and values can contain only lowercase letters, numeric characters, underscores, and dashes. All characters must use UTF-8 encoding, and international characters are allowed. * The key portion of a label must be unique. However, you can use the same key with multiple resources. * Keys must start with a lowercase letter or international character. See [Google Cloud Document](https://cloud.google.com/resource-manager/docs/creating-managing-labels#requirements) for more details.
    record {} labels?;
    # Maximum number of results to return per page. Set this property to the number of prediction results needed. If zero, the service will choose a reasonable default. The maximum allowed value is 100. Values above 100 will be coerced to 100.
    int pageSize?;
    # The previous PredictResponse.next_page_token.
    string pageToken?;
    # Additional domain specific parameters for the predictions. Allowed values: * `returnProduct`: Boolean. If set to true, the associated product object will be returned in the `results.metadata` field in the prediction response. * `returnScore`: Boolean. If set to true, the prediction 'score' corresponding to each returned product will be set in the `results.metadata` field in the prediction response. The given 'score' indicates the probability of an product being clicked/purchased given the user's context and history. * `strictFiltering`: Boolean. True by default. If set to false, the service will return generic (unfiltered) popular products instead of empty if your filter blocks all prediction results. * `priceRerankLevel`: String. Default empty. If set to be non-empty, then it needs to be one of {'no-price-reranking', 'low-price-reranking', 'medium-price-reranking', 'high-price-reranking'}. This gives request-level control and adjusts prediction results based on product price. * `diversityLevel`: String. Default empty. If set to be non-empty, then it needs to be one of {'no-diversity', 'low-diversity', 'medium-diversity', 'high-diversity', 'auto-diversity'}. This gives request-level control and adjusts prediction results based on product category.
    record {} params?;
    # UserEvent captures all metadata information Retail API needs to know about how end users interact with customers' website.
    GoogleCloudRetailV2UserEvent userEvent?;
    # Use validate only mode for this prediction query. If set to true, a dummy model will be used that returns arbitrary products. Note that the validate only mode should only be used for testing the API, or if the model is not ready.
    boolean validateOnly?;
};

# Represents a whole or partial calendar date, such as a birthday. The time of day and time zone are either specified elsewhere or are insignificant. The date is relative to the Gregorian Calendar. This can represent one of the following: * A full date, with non-zero year, month, and day values * A month and day value, with a zero year, such as an anniversary * A year on its own, with zero month and day values * A year and month value, with a zero day, such as a credit card expiration date Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
public type GoogleTypeDate record {
    # Day of a month. Must be from 1 to 31 and valid for the year and month, or 0 to specify a year by itself or a year and month where the day isn't significant.
    int day?;
    # Month of a year. Must be from 1 to 12, or 0 to specify a year without a month and day.
    int month?;
    # Year of the date. Must be from 1 to 9999, or 0 to specify a date without a year.
    int year?;
};

# Response of the ImportProductsRequest. If the long running operation is done, then this message is returned by the google.longrunning.Operations.response field if the operation was successful.
public type GoogleCloudRetailV2betaImportProductsResponse record {
    # A sample of errors encountered while processing the request.
    GoogleRpcStatus[] errorSamples?;
    # Configuration of destination for Import related errors.
    GoogleCloudRetailV2betaImportErrorsConfig errorsConfig?;
};

# Response of the ExportUserEventsRequest. If the long running operation was successful, then this message is returned by the google.longrunning.Operations.response field if the operation was successful.
public type GoogleCloudRetailV2betaExportUserEventsResponse record {
    # A sample of errors encountered while processing the request.
    GoogleRpcStatus[] errorSamples?;
    # Configuration of destination for Export related errors.
    GoogleCloudRetailV2betaExportErrorsConfig errorsConfig?;
};

# Request message for Import methods.
public type GoogleCloudRetailV2ImportProductsRequest record {
    # Configuration of destination for Import related errors.
    GoogleCloudRetailV2ImportErrorsConfig errorsConfig?;
    # The input config source for products.
    GoogleCloudRetailV2ProductInputConfig inputConfig?;
    # Pub/Sub topic for receiving notification. If this field is set, when the import is finished, a notification will be sent to specified Pub/Sub topic. The message data will be JSON string of a Operation. Format of the Pub/Sub topic is `projects/{project}/topics/{topic}`. Only supported when ImportProductsRequest.reconciliation_mode is set to `FULL`.
    string notificationPubsubTopic?;
    # The mode of reconciliation between existing products and the products to be imported. Defaults to ReconciliationMode.INCREMENTAL.
    string reconciliationMode?;
    # Unique identifier provided by client, within the ancestor dataset scope. Ensures idempotency and used for request deduplication. Server-generated if unspecified. Up to 128 characters long and must match the pattern: "[a-zA-Z0-9_]+". This is returned as Operation.name in ImportMetadata. Only supported when ImportProductsRequest.reconciliation_mode is set to `FULL`.
    string requestId?;
    # Indicates which fields in the provided imported 'products' to update. If not set, will by default update all fields.
    string updateMask?;
};

# Request message for SearchService.Search method.
public type GoogleCloudRetailV2SearchRequest record {
    # Boost specification to boost certain items.
    GoogleCloudRetailV2SearchRequestBoostSpec boostSpec?;
    # The branch resource name, such as `projects/*/locations/global/catalogs/default_catalog/branches/0`. Use "default_branch" as the branch ID or leave this field empty, to search products under the default branch.
    string branch?;
    # The filter applied to every search request when quality improvement such as query expansion is needed. For example, if a query does not have enough results, an expanded query with SearchRequest.canonical_filter will be returned as a supplement of the original query. This field is strongly recommended to achieve high search quality. See SearchRequest.filter for more details about filter syntax.
    string canonicalFilter?;
    # The specifications of dynamically generated facets.
    GoogleCloudRetailV2SearchRequestDynamicFacetSpec dynamicFacetSpec?;
    # Facet specifications for faceted search. If empty, no facets are returned. A maximum of 100 values are allowed. Otherwise, an INVALID_ARGUMENT error is returned.
    GoogleCloudRetailV2SearchRequestFacetSpec[] facetSpecs?;
    # The filter syntax consists of an expression language for constructing a predicate from one or more fields of the products being filtered. Filter expression is case-sensitive. See more details at this [user guide](/retail/private/docs/filter-and-order#filter). If this field is unrecognizable, an INVALID_ARGUMENT is returned.
    string filter?;
    # A 0-indexed integer that specifies the current offset (that is, starting result location, amongst the Products deemed by the API as relevant) in search results. This field is only considered if page_token is unset. If this field is negative, an INVALID_ARGUMENT is returned.
    int offset?;
    # The order in which products are returned. Products can be ordered by a field in an Product object. Leave it unset if ordered by relevance. OrderBy expression is case-sensitive. See more details at this [user guide](/retail/private/docs/filter-and-order#order). If this field is unrecognizable, an INVALID_ARGUMENT is returned.
    string orderBy?;
    # The categories associated with a category page. Required for category navigation queries to achieve good search quality. The format should be the same as UserEvent.page_categories; To represent full path of category, use '>' sign to separate different hierarchies. If '>' is part of the category name, please replace it with other character(s). Category pages include special pages such as sales or promotions. For instance, a special sale page may have the category hierarchy: "pageCategories" : ["Sales > 2017 Black Friday Deals"].
    string[] pageCategories?;
    # Maximum number of Products to return. If unspecified, defaults to a reasonable value. The maximum allowed value is 120. Values above 120 will be coerced to 120. If this field is negative, an INVALID_ARGUMENT is returned.
    int pageSize?;
    # A page token SearchResponse.next_page_token, received from a previous SearchService.Search call. Provide this to retrieve the subsequent page. When paginating, all other parameters provided to SearchService.Search must match the call that provided the page token. Otherwise, an INVALID_ARGUMENT error is returned.
    string pageToken?;
    # Raw search query.
    string query?;
    # Specification to determine under which conditions query expansion should occur.
    GoogleCloudRetailV2SearchRequestQueryExpansionSpec queryExpansionSpec?;
    # Information of an end user.
    GoogleCloudRetailV2UserInfo userInfo?;
    # The keys to fetch and rollup the matching variant Products attributes. The attributes from all the matching variant Products are merged and de-duplicated. Notice that rollup variant Products attributes will lead to extra query latency. Maximum number of keys is 10. For FulfillmentInfo, a fulfillment type and a fulfillment ID must be provided in the format of "fulfillmentType.fulfillmentId". E.g., in "pickupInStore.store123", "pickupInStore" is fulfillment type and "store123" is the store ID. Supported keys are: * colorFamilies * price * originalPrice * discount * attributes.key, where key is any key in the Product.attributes map. * pickupInStore.id, where id is any FulfillmentInfo.place_ids for FulfillmentInfo.type "pickup-in-store". * shipToStore.id, where id is any FulfillmentInfo.place_ids for FulfillmentInfo.type "ship-to-store". * sameDayDelivery.id, where id is any FulfillmentInfo.place_ids for FulfillmentInfo.type "same-day-delivery". * nextDayDelivery.id, where id is any FulfillmentInfo.place_ids for FulfillmentInfo.type "next-day-delivery". * customFulfillment1.id, where id is any FulfillmentInfo.place_ids for FulfillmentInfo.type "custom-type-1". * customFulfillment2.id, where id is any FulfillmentInfo.place_ids for FulfillmentInfo.type "custom-type-2". * customFulfillment3.id, where id is any FulfillmentInfo.place_ids for FulfillmentInfo.type "custom-type-3". * customFulfillment4.id, where id is any FulfillmentInfo.place_ids for FulfillmentInfo.type "custom-type-4". * customFulfillment5.id, where id is any FulfillmentInfo.place_ids for FulfillmentInfo.type "custom-type-5". If this field is set to an invalid value other than these, an INVALID_ARGUMENT error is returned.
    string[] variantRollupKeys?;
    # Required. A unique identifier for tracking visitors. For example, this could be implemented with an HTTP cookie, which should be able to uniquely identify a visitor on a single device. This unique identifier should not change if the visitor logs in or out of the website. The field must be a UTF-8 encoded string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT error is returned.
    string visitorId?;
};

# Information of an end user.
public type GoogleCloudRetailV2UserInfo record {
    # True if the request is made directly from the end user, in which case the ip_address and user_agent can be populated from the HTTP request. This flag should be set only if the API request is made directly from the end user such as a mobile app (and not if a gateway or a server is processing and pushing the user events). This should not be set when using the JavaScript tag in UserEventService.CollectUserEvent.
    boolean directUserRequest?;
    # The end user's IP address. Required for getting SearchResponse.sponsored_results. This field is used to extract location information for personalization. This field must be either an IPv4 address (e.g. "104.133.9.80") or an IPv6 address (e.g. "2001:0db8:85a3:0000:0000:8a2e:0370:7334"). Otherwise, an INVALID_ARGUMENT error is returned. This should not be set when using the JavaScript tag in UserEventService.CollectUserEvent or if direct_user_request is set.
    string ipAddress?;
    # User agent as included in the HTTP header. Required for getting SearchResponse.sponsored_results. The field must be a UTF-8 encoded string with a length limit of 1,000 characters. Otherwise, an INVALID_ARGUMENT error is returned. This should not be set when using the client side event reporting with GTM or JavaScript tag in UserEventService.CollectUserEvent or if direct_user_request is set.
    string userAgent?;
    # Highly recommended for logged-in users. Unique identifier for logged-in user, such as a user name. The field must be a UTF-8 encoded string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT error is returned.
    string userId?;
};

# Represents the search results.
public type GoogleCloudRetailV2SearchResponseSearchResult record {
    # Product.id of the searched Product.
    string id?;
    # The count of matched variant Products.
    int matchingVariantCount?;
    # If a variant Product matches the search query, this map indicates which Product fields are matched. The key is the Product.name, the value is a field mask of the matched Product fields. If matched attributes cannot be determined, this map will be empty. For example, a key "sku1" with field mask "products.color_info" indicates there is a match between "sku1" ColorInfo and the query.
    record {} matchingVariantFields?;
    # Product captures all metadata information of items to be recommended or searched.
    GoogleCloudRetailV2Product product?;
    # The rollup matching variant Product attributes. The key is one of the SearchRequest.variant_rollup_keys. The values are the merged and de-duplicated Product attributes. Notice that the rollup values are respect filter. For example, when filtering by "colorFamilies:ANY(\"red\")" and rollup "colorFamilies", only "red" is returned. For textual and numerical attributes, the rollup values is a list of string or double values with type google.protobuf.ListValue. For example, if there are two variants with colors "red" and "blue", the rollup values are { key: "colorFamilies" value { list_value { values { string_value: "red" } values { string_value: "blue" } } } } For FulfillmentInfo, the rollup values is a double value with type google.protobuf.Value. For example, `{key: "pickupInStore.store1" value { number_value: 10 }}` means a there are 10 variants in this product are available in the store "store1".
    record {} variantRollupValues?;
};

# Response of the ExportProductsRequest. If the long running operation is done, then this message is returned by the google.longrunning.Operations.response field if the operation was successful.
public type GoogleCloudRetailV2alphaExportProductsResponse record {
    # A sample of errors encountered while processing the request.
    GoogleRpcStatus[] errorSamples?;
    # Configuration of destination for Export related errors.
    GoogleCloudRetailV2alphaExportErrorsConfig errorsConfig?;
};

# Detailed completion information including completion attribution token and clicked completion info.
public type GoogleCloudRetailV2CompletionDetail record {
    # Completion attribution token in CompleteQueryResponse.attribution_token.
    string completionAttributionToken?;
    # End user selected CompleteQueryResponse.CompletionResult.suggestion position, starting from 0.
    int selectedPosition?;
    # End user selected CompleteQueryResponse.CompletionResult.suggestion.
    string selectedSuggestion?;
};

# The response message for Operations.ListOperations.
public type GoogleLongrunningListOperationsResponse record {
    # The standard List next-page token.
    string nextPageToken?;
    # A list of operations that matches the specified filter in the request.
    GoogleLongrunningOperation[] operations?;
};

# UserEvent captures all metadata information Retail API needs to know about how end users interact with customers' website.
public type GoogleCloudRetailV2UserEvent record {
    # Extra user event features to include in the recommendation model. The key must be a UTF-8 encoded string with a length limit of 5,000 characters. Otherwise, an INVALID_ARGUMENT error is returned. For product recommendation, an example of extra user information is traffic_channel, i.e. how user arrives at the site. Users can arrive at the site by coming to the site directly, or coming through Google search, and etc.
    record {} attributes?;
    # Highly recommended for user events that are the result of PredictionService.Predict. This field enables accurate attribution of recommendation model performance. The value must be a valid PredictResponse.attribution_token for user events that are the result of PredictionService.Predict. The value must be a valid SearchResponse.attribution_token for user events that are the result of SearchService.Search. This token enables us to accurately attribute page view or purchase back to the event and the particular predict response containing this clicked/purchased product. If user clicks on product K in the recommendation results, pass PredictResponse.attribution_token as a URL parameter to product K's page. When recording events on product K's page, log the PredictResponse.attribution_token to this field.
    string attributionToken?;
    # The id or name of the associated shopping cart. This id is used to associate multiple items added or present in the cart before purchase. This can only be set for `add-to-cart`, `purchase-complete`, or `shopping-cart-page-view` events.
    string cartId?;
    # Detailed completion information including completion attribution token and clicked completion info.
    GoogleCloudRetailV2CompletionDetail completionDetail?;
    # Only required for UserEventService.ImportUserEvents method. Timestamp of when the user event happened.
    string eventTime?;
    # Required. User event type. Allowed values are: * `add-to-cart`: Products being added to cart. * `category-page-view`: Special pages such as sale or promotion pages viewed. * `completion`: Completion query result showed/clicked. * `detail-page-view`: Products detail page viewed. * `home-page-view`: Homepage viewed. * `promotion-offered`: Promotion is offered to a user. * `promotion-not-offered`: Promotion is not offered to a user. * `purchase-complete`: User finishing a purchase. * `search`: Product search. * `shopping-cart-page-view`: User viewing a shopping cart.
    string eventType?;
    # A list of identifiers for the independent experiment groups this user event belongs to. This is used to distinguish between user events associated with different experiment setups (e.g. using Retail API, using different recommendation models).
    string[] experimentIds?;
    # The filter syntax consists of an expression language for constructing a predicate from one or more fields of the products being filtered. See SearchRequest.filter for definition and syntax. The value must be a UTF-8 encoded string with a length limit of 1,000 characters. Otherwise, an INVALID_ARGUMENT error is returned.
    string filter?;
    # An integer that specifies the current offset for pagination (the 0-indexed starting location, amongst the products deemed by the API as relevant). See SearchRequest.offset for definition. If this field is negative, an INVALID_ARGUMENT is returned. This can only be set for `search` events. Other event types should not set this field. Otherwise, an INVALID_ARGUMENT error is returned.
    int offset?;
    # The order in which products are returned. See SearchRequest.order_by for definition and syntax. The value must be a UTF-8 encoded string with a length limit of 1,000 characters. Otherwise, an INVALID_ARGUMENT error is returned. This can only be set for `search` events. Other event types should not set this field. Otherwise, an INVALID_ARGUMENT error is returned.
    string orderBy?;
    # The categories associated with a category page. To represent full path of category, use '>' sign to separate different hierarchies. If '>' is part of the category name, please replace it with other character(s). Category pages include special pages such as sales or promotions. For instance, a special sale page may have the category hierarchy: "pageCategories" : ["Sales > 2017 Black Friday Deals"]. Required for `category-page-view` events. At least one of search_query or page_categories is required for `search` events. Other event types should not set this field. Otherwise, an INVALID_ARGUMENT error is returned.
    string[] pageCategories?;
    # A unique id of a web page view. This should be kept the same for all user events triggered from the same pageview. For example, an item detail page view could trigger multiple events as the user is browsing the page. The `pageViewId` property should be kept the same for all these events so that they can be grouped together properly. When using the client side event reporting with JavaScript pixel and Google Tag Manager, this value is filled in automatically.
    string pageViewId?;
    # The main product details related to the event. This field is required for the following event types: * `add-to-cart` * `detail-page-view` * `purchase-complete` In a `search` event, this field represents the products returned to the end user on the current page (the end user may have not finished broswing the whole page yet). When a new page is returned to the end user, after pagination/filtering/ordering even for the same query, a new `search` event with different product_details is desired. The end user may have not finished broswing the whole page yet.
    GoogleCloudRetailV2ProductDetail[] productDetails?;
    # A transaction represents the entire purchase transaction.
    GoogleCloudRetailV2PurchaseTransaction purchaseTransaction?;
    # The referrer URL of the current page. When using the client side event reporting with JavaScript pixel and Google Tag Manager, this value is filled in automatically.
    string referrerUri?;
    # The user's search query. See SearchRequest.query for definition. The value must be a UTF-8 encoded string with a length limit of 5,000 characters. Otherwise, an INVALID_ARGUMENT error is returned. At least one of search_query or page_categories is required for `search` events. Other event types should not set this field. Otherwise, an INVALID_ARGUMENT error is returned.
    string searchQuery?;
    # A unique identifier for tracking a visitor session with a length limit of 128 bytes. A session is an aggregation of an end user behavior in a time span. A general guideline to populate the sesion_id: 1. If user has no activity for 30 min, a new session_id should be assigned. 2. The session_id should be unique across users, suggest use uuid or add visitor_id as prefix.
    string sessionId?;
    # Complete URL (window.location.href) of the user's current page. When using the client side event reporting with JavaScript pixel and Google Tag Manager, this value is filled in automatically. Maximum length 5,000 characters.
    string uri?;
    # Information of an end user.
    GoogleCloudRetailV2UserInfo userInfo?;
    # Required. A unique identifier for tracking visitors. For example, this could be implemented with an HTTP cookie, which should be able to uniquely identify a visitor on a single device. This unique identifier should not change if the visitor log in/out of the website. The field must be a UTF-8 encoded string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT error is returned. The field should not contain PII or user-data. We recommend to use Google Analystics [Client ID](https://developers.google.com/analytics/devguides/collection/analyticsjs/field-reference#clientId) for this field.
    string visitorId?;
};

# Response of the RemoveFulfillmentPlacesRequest. Currently empty because there is no meaningful response populated from the RemoveFulfillmentPlaces method.
public type GoogleCloudRetailV2RemoveFulfillmentPlacesResponse record {
};

# Response message for SearchService.Search method.
public type GoogleCloudRetailV2SearchResponse record {
    # A unique search token. This should be included in the UserEvent logs resulting from this search, which enables accurate attribution of search model performance.
    string attributionToken?;
    # If spell correction applies, the corrected query. Otherwise, empty.
    string correctedQuery?;
    # Results of facets requested by user.
    GoogleCloudRetailV2SearchResponseFacet[] facets?;
    # A token that can be sent as SearchRequest.page_token to retrieve the next page. If this field is omitted, there are no subsequent pages.
    string nextPageToken?;
    # Information describing query expansion including whether expansion has occurred.
    GoogleCloudRetailV2SearchResponseQueryExpansionInfo queryExpansionInfo?;
    # The URI of a customer-defined redirect page. If redirect action is triggered, no search will be performed, and only redirect_uri and attribution_token will be set in the response.
    string redirectUri?;
    # A list of matched items. The order represents the ranking.
    GoogleCloudRetailV2SearchResponseSearchResult[] results?;
    # The estimated total count of matched items irrespective of pagination. The count of results returned by pagination may be less than the total_size that matches.
    int totalSize?;
};

# Response of the PurgeUserEventsRequest. If the long running operation is successfully done, then this message is returned by the google.longrunning.Operations.response field.
public type GoogleCloudRetailV2alphaPurgeUserEventsResponse record {
    # The total count of events purged as a result of the operation.
    string purgedEventsCount?;
};

# Metadata related to the progress of the Import operation. This will be returned by the google.longrunning.Operation.metadata field.
public type GoogleCloudRetailV2ImportMetadata record {
    # Operation create time.
    string createTime?;
    # Count of entries that encountered errors while processing.
    string failureCount?;
    # Pub/Sub topic for receiving notification. If this field is set, when the import is finished, a notification will be sent to specified Pub/Sub topic. The message data will be JSON string of a Operation. Format of the Pub/Sub topic is `projects/{project}/topics/{topic}`.
    string notificationPubsubTopic?;
    # Id of the request / operation. This is parroting back the requestId that was passed in the request.
    string requestId?;
    # Count of entries that were processed successfully.
    string successCount?;
    # Operation last update time. If the operation is done, this is also the finish time.
    string updateTime?;
};

# The catalog configuration.
public type GoogleCloudRetailV2Catalog record {
    # Required. Immutable. The catalog display name. This field must be a UTF-8 encoded string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT error is returned.
    string displayName?;
    # Required. Immutable. The fully qualified resource name of the catalog.
    string name?;
    # Configures what level the product should be uploaded with regards to how users will be send events and how predictions will be made.
    GoogleCloudRetailV2ProductLevelConfig productLevelConfig?;
};

# Response of the RemoveFulfillmentPlacesRequest. Currently empty because there is no meaningful response populated from the AddFulfillmentPlaces method.
public type GoogleCloudRetailV2betaAddFulfillmentPlacesResponse record {
};

# This resource represents a long-running operation that is the result of a network API call.
public type GoogleLongrunningOperation record {
    # If the value is `false`, it means the operation is still in progress. If `true`, the operation is completed, and either `error` or `response` is available.
    boolean done?;
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    GoogleRpcStatus _error?;
    # Service-specific metadata associated with the operation. It typically contains progress information and common metadata such as create time. Some services might not provide such metadata. Any method that returns a long-running operation should document the metadata type, if any.
    record {} metadata?;
    # The server-assigned name, which is only unique within the same service that originally returns it. If you use the default HTTP mapping, the `name` should be a resource name ending with `operations/{unique_id}`.
    string name?;
    # The normal response of the operation in case of success. If the original method returns no data on success, such as `Delete`, the response is `google.protobuf.Empty`. If the original method is standard `Get`/`Create`/`Update`, the response should be the resource. For other methods, the response should have the type `XxxResponse`, where `Xxx` is the original method name. For example, if the original method name is `TakeSnapshot()`, the inferred response type is `TakeSnapshotResponse`.
    record {} response?;
};

# A custom attribute that is not explicitly modeled in Product.
public type GoogleCloudRetailV2CustomAttribute record {
    # If true, custom attribute values are indexed, so that it can be filtered, faceted or boosted in SearchService.Search. This field is ignored in a UserEvent. See SearchRequest.filter, SearchRequest.facet_specs and SearchRequest.boost_spec for more details.
    boolean indexable?;
    # The numerical values of this custom attribute. For example, `[2.3, 15.4]` when the key is "lengths_cm". At most 400 values are allowed.Otherwise, an INVALID_ARGUMENT error is returned. Exactly one of text or numbers should be set. Otherwise, an INVALID_ARGUMENT error is returned.
    float[] numbers?;
    # If true, custom attribute values are searchable by text queries in SearchService.Search. This field is ignored in a UserEvent. Only set if type text is set. Otherwise, a INVALID_ARGUMENT error is returned.
    boolean searchable?;
    # The textual values of this custom attribute. For example, `["yellow", "green"]` when the key is "color". At most 400 values are allowed. Empty values are not allowed. Each value must be a UTF-8 encoded string with a length limit of 256 characters. Otherwise, an INVALID_ARGUMENT error is returned. Exactly one of text or numbers should be set. Otherwise, an INVALID_ARGUMENT error is returned.
    string[] text?;
};

# Configures what level the product should be uploaded with regards to how users will be send events and how predictions will be made.
public type GoogleCloudRetailV2ProductLevelConfig record {
    # The type of Products allowed to be ingested into the catalog. Acceptable values are: * `primary` (default): You can only ingest Product.Type.PRIMARY Products. This means Product.primary_product_id can only be empty or set to the same value as Product.id. * `variant`: You can only ingest Product.Type.VARIANT Products. This means Product.primary_product_id cannot be empty. If this field is set to an invalid value other than these, an INVALID_ARGUMENT error is returned. If this field is `variant` and merchant_center_product_id_field is `itemGroupId`, an INVALID_ARGUMENT error is returned. See [Using product levels](https://cloud.google.com/retail/recommendations-ai/docs/catalog#product-levels) for more details.
    string ingestionProductType?;
    # Which field of [Merchant Center Product](/bigquery-transfer/docs/merchant-center-products-schema) should be imported as Product.id. Acceptable values are: * `offerId` (default): Import `offerId` as the product ID. * `itemGroupId`: Import `itemGroupId` as the product ID. Notice that Retail API will choose one item from the ones with the same `itemGroupId`, and use it to represent the item group. If this field is set to an invalid value other than these, an INVALID_ARGUMENT error is returned. If this field is `itemGroupId` and ingestion_product_type is `variant`, an INVALID_ARGUMENT error is returned. See [Using product levels](https://cloud.google.com/retail/recommendations-ai/docs/catalog#product-levels) for more details.
    string merchantCenterProductIdField?;
};

# An intended audience of the Product for whom it's sold.
public type GoogleCloudRetailV2Audience record {
    # The age groups of the audience. Strongly encouraged to use the standard values: "newborn" (up to 3 months old), "infant" (3–12 months old), "toddler" (1–5 years old), "kids" (5–13 years old), "adult" (typically teens or older). At most 5 values are allowed. Each value must be a UTF-8 encoded string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center property [age_group](https://support.google.com/merchants/answer/6324463). Schema.org property [Product.audience.suggestedMinAge](https://schema.org/suggestedMinAge) and [Product.audience.suggestedMaxAge](https://schema.org/suggestedMaxAge).
    string[] ageGroups?;
    # The genders of the audience. Strongly encouraged to use the standard values: "male", "female", "unisex". At most 5 values are allowed. Each value must be a UTF-8 encoded string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center property [gender](https://support.google.com/merchants/answer/6324479). Schema.org property [Product.audience.suggestedGender](https://schema.org/suggestedGender).
    string[] genders?;
};

# The input config source for completion data.
public type GoogleCloudRetailV2CompletionDataInputConfig record {
    # BigQuery source import data from.
    GoogleCloudRetailV2BigQuerySource bigQuerySource?;
};

# Metadata related to the progress of the Export operation. This will be returned by the google.longrunning.Operation.metadata field.
public type GoogleCloudRetailV2alphaExportMetadata record {
    # Operation create time.
    string createTime?;
    # Operation last update time. If the operation is done, this is also the finish time.
    string updateTime?;
};

# A facet value which contains value names and their count.
public type GoogleCloudRetailV2SearchResponseFacetFacetValue record {
    # Number of items that have this facet value.
    string count?;
    # A floating point interval.
    GoogleCloudRetailV2Interval interval?;
    # Text value of a facet, such as "Black" for facet "colorFamilies".
    string value?;
};

# The inline source for the input config for ImportUserEvents method.
public type GoogleCloudRetailV2UserEventInlineSource record {
    # Required. A list of user events to import. Recommended max of 10k items.
    GoogleCloudRetailV2UserEvent[] userEvents?;
};

# Response for CatalogService.ListCatalogs method.
public type GoogleCloudRetailV2ListCatalogsResponse record {
    # All the customer's Catalogs.
    GoogleCloudRetailV2Catalog[] catalogs?;
    # A token that can be sent as ListCatalogsRequest.page_token to retrieve the next page. If this field is omitted, there are no subsequent pages.
    string nextPageToken?;
};

# Configuration of destination for Import related errors.
public type GoogleCloudRetailV2ImportErrorsConfig record {
    # Google Cloud Storage path for import errors. This must be an empty, existing Cloud Storage bucket. Import errors will be written to a file in this bucket, one per line, as a JSON-encoded `google.rpc.Status` message.
    string gcsPrefix?;
};

# Metadata related to the progress of the RemoveFulfillmentPlaces operation. Currently empty because there is no meaningful metadata populated from the RemoveFulfillmentPlaces method.
public type GoogleCloudRetailV2betaRemoveFulfillmentPlacesMetadata record {
};

# Configuration of destination for Import related errors.
public type GoogleCloudRetailV2alphaImportErrorsConfig record {
    # Google Cloud Storage path for import errors. This must be an empty, existing Cloud Storage bucket. Import errors will be written to a file in this bucket, one per line, as a JSON-encoded `google.rpc.Status` message.
    string gcsPrefix?;
};

# Response of the PurgeUserEventsRequest. If the long running operation is successfully done, then this message is returned by the google.longrunning.Operations.response field.
public type GoogleCloudRetailV2betaPurgeUserEventsResponse record {
    # The total count of events purged as a result of the operation.
    string purgedEventsCount?;
};

# Information describing query expansion including whether expansion has occurred.
public type GoogleCloudRetailV2SearchResponseQueryExpansionInfo record {
    # Bool describing whether query expansion has occurred.
    boolean expandedQuery?;
    # Number of pinned results. This field will only be set when expansion happens and SearchRequest.query_expansion_spec.pin_unexpanded_results is set to true.
    string pinnedResultCount?;
};

# Indicates a location in the source code of the service for which errors are reported.
public type GoogleCloudRetailLoggingSourceLocation record {
    # Human-readable name of a function or method. For example, "google.cloud.retail.v2.UserEventService.ImportUserEvents".
    string functionName?;
};

# A floating point interval.
public type GoogleCloudRetailV2Interval record {
    # Exclusive upper bound.
    float exclusiveMaximum?;
    # Exclusive lower bound.
    float exclusiveMinimum?;
    # Inclusive upper bound.
    float maximum?;
    # Inclusive lower bound.
    float minimum?;
};

# Recent search of this user.
public type GoogleCloudRetailV2CompleteQueryResponseRecentSearchResult record {
    # The recent search query.
    string recentSearch?;
};

# The input config source for user events.
public type GoogleCloudRetailV2UserEventInputConfig record {
    # BigQuery source import data from.
    GoogleCloudRetailV2BigQuerySource bigQuerySource?;
    # Google Cloud Storage location for input content. format.
    GoogleCloudRetailV2GcsSource gcsSource?;
    # The inline source for the input config for ImportUserEvents method.
    GoogleCloudRetailV2UserEventInlineSource userEventInlineSource?;
};

# Response message of CatalogService.GetDefaultBranch.
public type GoogleCloudRetailV2GetDefaultBranchResponse record {
    # Full resource name of the branch id currently set as default branch.
    string branch?;
    # This corresponds to SetDefaultBranchRequest.note field, when this branch was set as default.
    string note?;
    # The time when this branch is set to default.
    string setTime?;
};

# Product captures all metadata information of items to be recommended or searched.
public type GoogleCloudRetailV2Product record {
    # Highly encouraged. Extra product attributes to be included. For example, for products, this could include the store name, vendor, style, color, etc. These are very strong signals for recommendation model, thus we highly recommend providing the attributes here. Features that can take on one of a limited number of possible values. Two types of features can be set are: Textual features. some examples would be the brand/maker of a product, or country of a customer. Numerical features. Some examples would be the height/weight of a product, or age of a customer. For example: `{ "vendor": {"text": ["vendor123", "vendor456"]}, "lengths_cm": {"numbers":[2.3, 15.4]}, "heights_cm": {"numbers":[8.1, 6.4]} }`. This field needs to pass all below criteria, otherwise an INVALID_ARGUMENT error is returned: * Max entries count: 200. * The key must be a UTF-8 encoded string with a length limit of 128 characters. * For indexable attribute, the key must match the pattern: a-zA-Z0-9*. For example, key0LikeThis or KEY_1_LIKE_THIS.
    record {} attributes?;
    # An intended audience of the Product for whom it's sold.
    GoogleCloudRetailV2Audience audience?;
    # The online availability of the Product. Default to Availability.IN_STOCK. Google Merchant Center Property [availability](https://support.google.com/merchants/answer/6324448). Schema.org Property [Offer.availability](https://schema.org/availability).
    string availability?;
    # The available quantity of the item.
    int availableQuantity?;
    # The timestamp when this Product becomes available for SearchService.Search.
    string availableTime?;
    # The brands of the product. A maximum of 30 brands are allowed. Each brand must be a UTF-8 encoded string with a length limit of 1,000 characters. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center property [brand](https://support.google.com/merchants/answer/6324351). Schema.org property [Product.brand](https://schema.org/brand).
    string[] brands?;
    # Product categories. This field is repeated for supporting one product belonging to several parallel categories. Strongly recommended using the full path for better search / recommendation quality. To represent full path of category, use '>' sign to separate different hierarchies. If '>' is part of the category name, please replace it with other character(s). For example, if a shoes product belongs to both ["Shoes & Accessories" -> "Shoes"] and ["Sports & Fitness" -> "Athletic Clothing" -> "Shoes"], it could be represented as: "categories": [ "Shoes & Accessories > Shoes", "Sports & Fitness > Athletic Clothing > Shoes" ] Must be set for Type.PRIMARY Product otherwise an INVALID_ARGUMENT error is returned. At most 250 values are allowed per Product. Empty values are not allowed. Each value must be a UTF-8 encoded string with a length limit of 5,000 characters. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center property google_product_category. Schema.org property [Product.category] (https://schema.org/category). [mc_google_product_category]: https://support.google.com/merchants/answer/6324436
    string[] categories?;
    # The id of the collection members when type is Type.COLLECTION. Should not set it for other types. A maximum of 1000 values are allowed. Otherwise, an INVALID_ARGUMENT error is return.
    string[] collectionMemberIds?;
    # The color information of a Product.
    GoogleCloudRetailV2ColorInfo colorInfo?;
    # The condition of the product. Strongly encouraged to use the standard values: "new", "refurbished", "used". A maximum of 5 values are allowed per Product. Each value must be a UTF-8 encoded string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center property [condition](https://support.google.com/merchants/answer/6324469). Schema.org property [Offer.itemCondition](https://schema.org/itemCondition).
    string[] conditions?;
    # Product description. This field must be a UTF-8 encoded string with a length limit of 5,000 characters. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center property [description](https://support.google.com/merchants/answer/6324468). schema.org property [Product.description](https://schema.org/description).
    string description?;
    # The timestamp when this product becomes unavailable for SearchService.Search. If it is set, the Product is not available for SearchService.Search after expire_time. However, the product can still be retrieved by ProductService.GetProduct and ProductService.ListProducts. Google Merchant Center property [expiration_date](https://support.google.com/merchants/answer/6324499).
    string expireTime?;
    # Fulfillment information, such as the store IDs for in-store pickup or region IDs for different shipping methods. All the elements must have distinct FulfillmentInfo.type. Otherwise, an INVALID_ARGUMENT error is returned.
    GoogleCloudRetailV2FulfillmentInfo[] fulfillmentInfo?;
    # The Global Trade Item Number (GTIN) of the product. This field must be a UTF-8 encoded string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT error is returned. This field must be a Unigram. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center property [gtin](https://support.google.com/merchants/answer/6324461). Schema.org property [Product.isbn](https://schema.org/isbn) or [Product.gtin8](https://schema.org/gtin8) or [Product.gtin12](https://schema.org/gtin12) or [Product.gtin13](https://schema.org/gtin13) or [Product.gtin14](https://schema.org/gtin14). If the value is not a valid GTIN, an INVALID_ARGUMENT error is returned.
    string gtin?;
    # Immutable. Product identifier, which is the final component of name. For example, this field is "id_1", if name is `projects/*/locations/global/catalogs/default_catalog/branches/default_branch/products/id_1`. This field must be a UTF-8 encoded string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center property [id](https://support.google.com/merchants/answer/6324405). Schema.org Property [Product.sku](https://schema.org/sku).
    string id?;
    # Product images for the product.Highly recommended to put the main image to the first. A maximum of 300 images are allowed. Google Merchant Center property [image_link](https://support.google.com/merchants/answer/6324350). Schema.org property [Product.image](https://schema.org/image).
    GoogleCloudRetailV2Image[] images?;
    # Language of the title/description and other string attributes. Use language tags defined by BCP 47. For product prediction, this field is ignored and the model automatically detects the text language. The Product can include text in different languages, but duplicating Products to provide text in multiple languages can result in degraded model performance. For product search this field is in use. It defaults to "en-US" if unset.
    string languageCode?;
    # The material of the product. For example, "leather", "wooden". A maximum of 20 values are allowed. Each value must be a UTF-8 encoded string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center property [material](https://support.google.com/merchants/answer/6324410). Schema.org property [Product.material](https://schema.org/material).
    string[] materials?;
    # Immutable. Full resource name of the product, such as `projects/*/locations/global/catalogs/default_catalog/branches/default_branch/products/product_id`. The branch ID must be "default_branch".
    string name?;
    # The pattern or graphic print of the product. For example, "striped", "polka dot", "paisley". A maximum of 20 values are allowed per Product. Each value must be a UTF-8 encoded string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center property [pattern](https://support.google.com/merchants/answer/6324483). Schema.org property [Product.pattern](https://schema.org/pattern).
    string[] patterns?;
    # The price information of a Product.
    GoogleCloudRetailV2PriceInfo priceInfo?;
    # Variant group identifier. Must be an id, with the same parent branch with this product. Otherwise, an error is thrown. For Type.PRIMARY Products, this field can only be empty or set to the same value as id. For VARIANT Products, this field cannot be empty. A maximum of 2,000 products are allowed to share the same Type.PRIMARY Product. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center Property [item_group_id](https://support.google.com/merchants/answer/6324507). Schema.org Property [Product.inProductGroupWithID](https://schema.org/inProductGroupWithID). This field must be enabled before it can be used. [Learn more](/recommendations-ai/docs/catalog#item-group-id).
    string primaryProductId?;
    # The promotions applied to the product. A maximum of 10 values are allowed per Product.
    GoogleCloudRetailV2Promotion[] promotions?;
    # The timestamp when the product is published by the retailer for the first time, which indicates the freshness of the products. Note that this field is different from available_time, given it purely describes product freshness regardless of when it is available on search and recommendation.
    string publishTime?;
    # The rating of a Product.
    GoogleCloudRetailV2Rating rating?;
    # Indicates which fields in the Products are returned in SearchResponse. Supported fields for all types: * audience * availability * brands * color_info * conditions * gtin * materials * name * patterns * price_info * rating * sizes * title * uri Supported fields only for Type.PRIMARY and Type.COLLECTION: * categories * description * images Supported fields only for Type.VARIANT: * Only the first image in images To mark attributes as retrievable, include paths of the form "attributes.key" where "key" is the key of a custom attribute, as specified in attributes. For Type.PRIMARY and Type.COLLECTION, the following fields are always returned in SearchResponse by default: * name For Type.VARIANT, the following fields are always returned in by default: * name * color_info Maximum number of paths is 30. Otherwise, an INVALID_ARGUMENT error is returned. Note: Returning more fields in SearchResponse may increase response payload size and serving latency.
    string retrievableFields?;
    # The size of the product. To represent different size systems or size types, consider using this format: [[[size_system:]size_type:]size_value]. For example, in "US:MENS:M", "US" represents size system; "MENS" represents size type; "M" represents size value. In "GIRLS:27", size system is empty; "GIRLS" represents size type; "27" represents size value. In "32 inches", both size system and size type are empty, while size value is "32 inches". A maximum of 20 values are allowed per Product. Each value must be a UTF-8 encoded string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center property [size](https://support.google.com/merchants/answer/6324492), [size_type](https://support.google.com/merchants/answer/6324497) and [size_system](https://support.google.com/merchants/answer/6324502). Schema.org property [Product.size](https://schema.org/size).
    string[] sizes?;
    # Custom tags associated with the product. At most 250 values are allowed per Product. This value must be a UTF-8 encoded string with a length limit of 1,000 characters. Otherwise, an INVALID_ARGUMENT error is returned. This tag can be used for filtering recommendation results by passing the tag as part of the PredictRequest.filter. Google Merchant Center property [custom_label_0–4](https://support.google.com/merchants/answer/6324473).
    string[] tags?;
    # Required. Product title. This field must be a UTF-8 encoded string with a length limit of 1,000 characters. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center property [title](https://support.google.com/merchants/answer/6324415). Schema.org property [Product.name](https://schema.org/name).
    string title?;
    # Input only. The TTL (time to live) of the product. If it is set, expire_time is set as current timestamp plus ttl. The derived expire_time is returned in the output and ttl is left blank when retrieving the Product. If it is set, the product is not available for SearchService.Search after current timestamp plus ttl. However, the product can still be retrieved by ProductService.GetProduct and ProductService.ListProducts.
    string ttl?;
    # Immutable. The type of the product. Default to Catalog.product_level_config.ingestion_product_type if unset.
    string 'type?;
    # Canonical URL directly linking to the product detail page. It is strongly recommended to provide a valid uri for the product, otherwise the service performance could be significantly degraded. This field must be a UTF-8 encoded string with a length limit of 5,000 characters. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center property [link](https://support.google.com/merchants/answer/6324416). Schema.org property [Offer.url](https://schema.org/url).
    string uri?;
    # Output only. Product variants grouped together on primary product which share similar product attributes. It's automatically grouped by primary_product_id for all the product variants. Only populated for Type.PRIMARY Products. Note: This field is OUTPUT_ONLY for ProductService.GetProduct. Do not set this field in API requests.
    GoogleCloudRetailV2Product[] variants?;
};

# A facet specification to perform faceted search.
public type GoogleCloudRetailV2SearchRequestFacetSpec record {
    # Enables dynamic position for this facet. If set to true, the position of this facet among all facets in the response is determined by Google Retail Search. It will be ordered together with dynamic facets if dynamic facets is enabled. If set to false, the position of this facet in the response will be the same as in the request, and it will be ranked before the facets with dynamic position enable and all dynamic facets. For example, you may always want to have rating facet returned in the response, but it's not necessarily to always display the rating facet at the top. In that case, you can set enable_dynamic_position to true so that the position of rating facet in response will be determined by Google Retail Search. Another example, assuming you have the following facets in the request: * "rating", enable_dynamic_position = true * "price", enable_dynamic_position = false * "brands", enable_dynamic_position = false And also you have a dynamic facets enable, which will generate a facet 'gender'. Then the final order of the facets in the response can be ("price", "brands", "rating", "gender") or ("price", "brands", "gender", "rating") depends on how Google Retail Search orders "gender" and "rating" facets. However, notice that "price" and "brands" will always be ranked at 1st and 2nd position since their enable_dynamic_position are false.
    boolean enableDynamicPosition?;
    # List of keys to exclude when faceting. By default, FacetKey.key is not excluded from the filter unless it is listed in this field. For example, suppose there are 100 products with color facet "Red" and 200 products with color facet "Blue". A query containing the filter "colorFamilies:ANY("Red")" and have "colorFamilies" as FacetKey.key will by default return the "Red" with count 100. If this field contains "colorFamilies", then the query returns both the "Red" with count 100 and "Blue" with count 200, because the "colorFamilies" key is now excluded from the filter. A maximum of 100 values are allowed. Otherwise, an INVALID_ARGUMENT error is returned.
    string[] excludedFilterKeys?;
    # Specifies how a facet is computed.
    GoogleCloudRetailV2SearchRequestFacetSpecFacetKey facetKey?;
    # Maximum of facet values that should be returned for this facet. If unspecified, defaults to 20. The maximum allowed value is 300. Values above 300 will be coerced to 300. If this field is negative, an INVALID_ARGUMENT is returned.
    int 'limit?;
};

# Metadata related to the progress of the RemoveFulfillmentPlaces operation. Currently empty because there is no meaningful metadata populated from the RemoveFulfillmentPlaces method.
public type GoogleCloudRetailV2RemoveFulfillmentPlacesMetadata record {
};

# Response of the ExportProductsRequest. If the long running operation is done, then this message is returned by the google.longrunning.Operations.response field if the operation was successful.
public type GoogleCloudRetailV2betaExportProductsResponse record {
    # A sample of errors encountered while processing the request.
    GoogleRpcStatus[] errorSamples?;
    # Configuration of destination for Export related errors.
    GoogleCloudRetailV2betaExportErrorsConfig errorsConfig?;
};

# Metadata related to the progress of the AddFulfillmentPlaces operation. Currently empty because there is no meaningful metadata populated from the AddFulfillmentPlaces method.
public type GoogleCloudRetailV2AddFulfillmentPlacesMetadata record {
};

# Describes a running service that sends errors.
public type GoogleCloudRetailLoggingServiceContext record {
    # An identifier of the service. For example, "retail.googleapis.com".
    string 'service?;
};

# Response of the ImportCompletionDataRequest. If the long running operation is done, this message is returned by the google.longrunning.Operations.response field if the operation is successful.
public type GoogleCloudRetailV2ImportCompletionDataResponse record {
    # A sample of errors encountered while processing the request.
    GoogleRpcStatus[] errorSamples?;
};

# Specification to determine under which conditions query expansion should occur.
public type GoogleCloudRetailV2SearchRequestQueryExpansionSpec record {
    # The condition under which query expansion should occur. Default to Condition.DISABLED.
    string condition?;
    # Whether to pin unexpanded results. If this field is set to true, unexpanded products are always at the top of the search results, followed by the expanded results.
    boolean pinUnexpandedResults?;
};

# Configuration of destination for Import related errors.
public type GoogleCloudRetailV2betaImportErrorsConfig record {
    # Google Cloud Storage path for import errors. This must be an empty, existing Cloud Storage bucket. Import errors will be written to a file in this bucket, one per line, as a JSON-encoded `google.rpc.Status` message.
    string gcsPrefix?;
};

# Metadata related to the progress of the SetInventory operation. Currently empty because there is no meaningful metadata populated from the SetInventory method.
public type GoogleCloudRetailV2SetInventoryMetadata record {
};

# Product thumbnail/detail image.
public type GoogleCloudRetailV2Image record {
    # Height of the image in number of pixels. This field must be nonnegative. Otherwise, an INVALID_ARGUMENT error is returned.
    int height?;
    # Required. URI of the image. This field must be a valid UTF-8 encoded URI with a length limit of 5,000 characters. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center property [image_link](https://support.google.com/merchants/answer/6324350). Schema.org property [Product.image](https://schema.org/image).
    string uri?;
    # Width of the image in number of pixels. This field must be nonnegative. Otherwise, an INVALID_ARGUMENT error is returned.
    int width?;
};

# Request message for RejoinUserEvents method.
public type GoogleCloudRetailV2RejoinUserEventsRequest record {
    # The type of the user event rejoin to define the scope and range of the user events to be rejoined with the latest product catalog. Defaults to USER_EVENT_REJOIN_SCOPE_UNSPECIFIED if this field is not set, or set to an invalid integer value.
    string userEventRejoinScope?;
};

# Response of the SetInventoryRequest. Currently empty because there is no meaningful response populated from the SetInventory method.
public type GoogleCloudRetailV2alphaSetInventoryResponse record {
};

# Response of the ImportCompletionDataRequest. If the long running operation is done, this message is returned by the google.longrunning.Operations.response field if the operation is successful.
public type GoogleCloudRetailV2betaImportCompletionDataResponse record {
    # A sample of errors encountered while processing the request.
    GoogleRpcStatus[] errorSamples?;
};

# Request message to set a specified branch as new default_branch.
public type GoogleCloudRetailV2SetDefaultBranchRequest record {
    # The final component of the resource name of a branch. This field must be one of "0", "1" or "2". Otherwise, an INVALID_ARGUMENT error is returned.
    string branchId?;
    # Some note on this request, this can be retrieved by CatalogService.GetDefaultBranch before next valid default branch set occurs. This field must be a UTF-8 encoded string with a length limit of 1,000 characters. Otherwise, an INVALID_ARGUMENT error is returned.
    string note?;
};

# Metadata related to the progress of the Import operation. This will be returned by the google.longrunning.Operation.metadata field.
public type GoogleCloudRetailV2alphaImportMetadata record {
    # Operation create time.
    string createTime?;
    # Count of entries that encountered errors while processing.
    string failureCount?;
    # Pub/Sub topic for receiving notification. If this field is set, when the import is finished, a notification will be sent to specified Pub/Sub topic. The message data will be JSON string of a Operation. Format of the Pub/Sub topic is `projects/{project}/topics/{topic}`.
    string notificationPubsubTopic?;
    # Id of the request / operation. This is parroting back the requestId that was passed in the request.
    string requestId?;
    # Count of entries that were processed successfully.
    string successCount?;
    # Operation last update time. If the operation is done, this is also the finish time.
    string updateTime?;
};

# The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
public type GoogleRpcStatus record {
    # The status code, which should be an enum value of google.rpc.Code.
    int code?;
    # A list of messages that carry the error details. There is a common set of message types for APIs to use.
    record {}[] details?;
    # A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.
    string message?;
};

# Fulfillment information, such as the store IDs for in-store pickup or region IDs for different shipping methods.
public type GoogleCloudRetailV2FulfillmentInfo record {
    # The IDs for this type, such as the store IDs for FulfillmentInfo.type.pickup-in-store or the region IDs for FulfillmentInfo.type.same-day-delivery. A maximum of 2000 values are allowed. Each value must be a string with a length limit of 10 characters, matching the pattern [a-zA-Z0-9_-]+, such as "store1" or "REGION-2". Otherwise, an INVALID_ARGUMENT error is returned.
    string[] placeIds?;
    # The fulfillment type, including commonly used types (such as pickup in store and same day delivery), and custom types. Customers have to map custom types to their display names before rendering UI. Supported values: * "pickup-in-store" * "ship-to-store" * "same-day-delivery" * "next-day-delivery" * "custom-type-1" * "custom-type-2" * "custom-type-3" * "custom-type-4" * "custom-type-5" If this field is set to an invalid value other than these, an INVALID_ARGUMENT error is returned.
    string 'type?;
};

# Response of the PurgeUserEventsRequest. If the long running operation is successfully done, then this message is returned by the google.longrunning.Operations.response field.
public type GoogleCloudRetailV2PurgeUserEventsResponse record {
    # The total count of events purged as a result of the operation.
    string purgedEventsCount?;
};

# Metadata related to the progress of the SetInventory operation. Currently empty because there is no meaningful metadata populated from the SetInventory method.
public type GoogleCloudRetailV2betaSetInventoryMetadata record {
};

# A description of the context in which an error occurred.
public type GoogleCloudRetailLoggingErrorContext record {
    # HTTP request data that is related to a reported error.
    GoogleCloudRetailLoggingHttpRequestContext httpRequest?;
    # Indicates a location in the source code of the service for which errors are reported.
    GoogleCloudRetailLoggingSourceLocation reportLocation?;
};

# Google Cloud Storage location for input content. format.
public type GoogleCloudRetailV2GcsSource record {
    # The schema to use when parsing the data from the source. Supported values for product imports: * `product` (default): One JSON Product per line. Each product must have a valid Product.id. * `product_merchant_center`: See [Importing catalog data from Merchant Center](https://cloud.google.com/retail/recommendations-ai/docs/upload-catalog#mc). Supported values for user events imports: * `user_event` (default): One JSON UserEvent per line. * `user_event_ga360`: Using https://support.google.com/analytics/answer/3437719.
    string dataSchema?;
    # Required. Google Cloud Storage URIs to input files. URI can be up to 2000 characters long. URIs can match the full object path (for example, `gs://bucket/directory/object.json`) or a pattern matching one or more files, such as `gs://bucket/directory/*.json`. A request can contain at most 100 files, and each file can be up to 2 GB. See [Importing product information](https://cloud.google.com/retail/recommendations-ai/docs/upload-catalog) for the expected file format and setup instructions.
    string[] inputUris?;
};

# Metadata related to the progress of the Purge operation. This will be returned by the google.longrunning.Operation.metadata field.
public type GoogleCloudRetailV2betaPurgeMetadata record {
};

# The color information of a Product.
public type GoogleCloudRetailV2ColorInfo record {
    # The standard color families. Strongly recommended to use the following standard color groups: "Red", "Pink", "Orange", "Yellow", "Purple", "Green", "Cyan", "Blue", "Brown", "White", "Gray", "Black" and "Mixed". Normally it is expected to have only 1 color family. May consider using single "Mixed" instead of multiple values. A maximum of 5 values are allowed. Each value must be a UTF-8 encoded string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center property [color](https://support.google.com/merchants/answer/6324487). Schema.org property [Product.color](https://schema.org/color).
    string[] colorFamilies?;
    # The color display names, which may be different from standard color family names, such as the color aliases used in the website frontend. Normally it is expected to have only 1 color. May consider using single "Mixed" instead of multiple values. A maximum of 5 colors are allowed. Each value must be a UTF-8 encoded string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT error is returned. Google Merchant Center property [color](https://support.google.com/merchants/answer/6324487). Schema.org property [Product.color](https://schema.org/color).
    string[] colors?;
};

# The price range of all variant Product having the same Product.primary_product_id.
public type GoogleCloudRetailV2PriceInfoPriceRange record {
    # A floating point interval.
    GoogleCloudRetailV2Interval originalPrice?;
    # A floating point interval.
    GoogleCloudRetailV2Interval price?;
};

# A summary of import result. The UserEventImportSummary summarizes the import status for user events.
public type GoogleCloudRetailV2betaUserEventImportSummary record {
    # Count of user events imported with complete existing catalog information.
    string joinedEventsCount?;
    # Count of user events imported, but with catalog information not found in the imported catalog.
    string unjoinedEventsCount?;
};

# PredictionResult represents the recommendation prediction results.
public type GoogleCloudRetailV2PredictResponsePredictionResult record {
    # ID of the recommended product
    string id?;
    # Additional product metadata / annotations. Possible values: * `product`: JSON representation of the product. Will be set if `returnProduct` is set to true in `PredictRequest.params`. * `score`: Prediction score in double value. Will be set if `returnScore` is set to true in `PredictRequest.params`.
    record {} metadata?;
};

# Request message for PurgeUserEvents method.
public type GoogleCloudRetailV2PurgeUserEventsRequest record {
    # Required. The filter string to specify the events to be deleted with a length limit of 5,000 characters. Empty string filter is not allowed. The eligible fields for filtering are: * `eventType`: Double quoted UserEvent.event_type string. * `eventTime`: in ISO 8601 "zulu" format. * `visitorId`: Double quoted string. Specifying this will delete all events associated with a visitor. * `userId`: Double quoted string. Specifying this will delete all events associated with a user. Examples: * Deleting all events in a time range: `eventTime > "2012-04-23T18:25:43.511Z" eventTime < "2012-04-23T18:30:43.511Z"` * Deleting specific eventType in time range: `eventTime > "2012-04-23T18:25:43.511Z" eventType = "detail-page-view"` * Deleting all events for a specific visitor: `visitorId = "visitor1024"` The filtering fields are assumed to have an implicit AND.
    string filter?;
    # Actually perform the purge. If `force` is set to false, the method will return the expected purge count without deleting any user events.
    boolean force?;
};

# Response message for predict method.
public type GoogleCloudRetailV2PredictResponse record {
    # A unique attribution token. This should be included in the UserEvent logs resulting from this recommendation, which enables accurate attribution of recommendation model performance.
    string attributionToken?;
    # IDs of products in the request that were missing from the inventory.
    string[] missingIds?;
    # A list of recommended products. The order represents the ranking (from the most relevant product to the least).
    GoogleCloudRetailV2PredictResponsePredictionResult[] results?;
    # True if the validateOnly property was set in the request.
    boolean validateOnly?;
};

# Metadata related to the progress of the Import operation. This will be returned by the google.longrunning.Operation.metadata field.
public type GoogleCloudRetailV2betaImportMetadata record {
    # Operation create time.
    string createTime?;
    # Count of entries that encountered errors while processing.
    string failureCount?;
    # Pub/Sub topic for receiving notification. If this field is set, when the import is finished, a notification will be sent to specified Pub/Sub topic. The message data will be JSON string of a Operation. Format of the Pub/Sub topic is `projects/{project}/topics/{topic}`.
    string notificationPubsubTopic?;
    # Id of the request / operation. This is parroting back the requestId that was passed in the request.
    string requestId?;
    # Count of entries that were processed successfully.
    string successCount?;
    # Operation last update time. If the operation is done, this is also the finish time.
    string updateTime?;
};

# Detailed product information associated with a user event.
public type GoogleCloudRetailV2ProductDetail record {
    # Product captures all metadata information of items to be recommended or searched.
    GoogleCloudRetailV2Product product?;
    # Quantity of the product associated with the user event. For example, this field will be 2 if two products are added to the shopping cart for `purchase-complete` event. Required for `add-to-cart` and `purchase-complete` event types.
    int quantity?;
};

# The error payload that is populated on LRO import APIs. Including: "google.cloud.retail.v2.ProductService.ImportProducts" "google.cloud.retail.v2.EventService.ImportUserEvents"
public type GoogleCloudRetailLoggingImportErrorContext record {
    # The detailed content which caused the error on importing a catalog item.
    string catalogItem?;
    # Cloud Storage file path of the import source. Can be set for batch operation error.
    string gcsPath?;
    # Line number of the content in file. Should be empty for permission or batch operation error.
    string lineNumber?;
    # The operation resource name of the LRO.
    string operationName?;
    # The detailed content which caused the error on importing a product.
    string product?;
    # The detailed content which caused the error on importing a user event.
    string userEvent?;
};

# Response message for RejoinUserEvents method.
public type GoogleCloudRetailV2betaRejoinUserEventsResponse record {
    # Number of user events that were joined with latest product catalog.
    string rejoinedUserEventsCount?;
};

# Metadata related to the progress of the Export operation. This will be returned by the google.longrunning.Operation.metadata field.
public type GoogleCloudRetailV2betaExportMetadata record {
    # Operation create time.
    string createTime?;
    # Operation last update time. If the operation is done, this is also the finish time.
    string updateTime?;
};

# Configuration of destination for Export related errors.
public type GoogleCloudRetailV2betaExportErrorsConfig record {
    # Google Cloud Storage path for import errors. This must be an empty, existing Cloud Storage bucket. Export errors will be written to a file in this bucket, one per line, as a JSON-encoded `google.rpc.Status` message.
    string gcsPrefix?;
};

# Response message for RejoinUserEvents method.
public type GoogleCloudRetailV2RejoinUserEventsResponse record {
    # Number of user events that were joined with latest product catalog.
    string rejoinedUserEventsCount?;
};

# Request message for SetInventory method.
public type GoogleCloudRetailV2SetInventoryRequest record {
    # If set to true, and the Product with name Product.name is not found, the inventory update will still be processed and retained for at most 1 day until the Product is created. If set to false, an INVALID_ARGUMENT error is returned if the Product is not found.
    boolean allowMissing?;
    # Product captures all metadata information of items to be recommended or searched.
    GoogleCloudRetailV2Product inventory?;
    # Indicates which inventory fields in the provided Product to update. If not set or set with empty paths, all inventory fields will be updated. If an unsupported or unknown field is provided, an INVALID_ARGUMENT error is returned and the entire update will be ignored.
    string setMask?;
    # The time when the request is issued, used to prevent out-of-order updates on inventory fields with the last update time recorded. If not provided, the internal system time will be used.
    string setTime?;
};

# Response of the RemoveFulfillmentPlacesRequest. Currently empty because there is no meaningful response populated from the AddFulfillmentPlaces method.
public type GoogleCloudRetailV2AddFulfillmentPlacesResponse record {
};

# Metadata related to the progress of the Purge operation. This will be returned by the google.longrunning.Operation.metadata field.
public type GoogleCloudRetailV2alphaPurgeMetadata record {
};

# Request message for the ImportUserEvents request.
public type GoogleCloudRetailV2ImportUserEventsRequest record {
    # Configuration of destination for Import related errors.
    GoogleCloudRetailV2ImportErrorsConfig errorsConfig?;
    # The input config source for user events.
    GoogleCloudRetailV2UserEventInputConfig inputConfig?;
};

# Response of the RemoveFulfillmentPlacesRequest. Currently empty because there is no meaningful response populated from the RemoveFulfillmentPlaces method.
public type GoogleCloudRetailV2alphaRemoveFulfillmentPlacesResponse record {
};

# Request message for ImportCompletionData methods.
public type GoogleCloudRetailV2ImportCompletionDataRequest record {
    # The input config source for completion data.
    GoogleCloudRetailV2CompletionDataInputConfig inputConfig?;
    # Pub/Sub topic for receiving notification. If this field is set, when the import is finished, a notification will be sent to specified Pub/Sub topic. The message data will be JSON string of a Operation. Format of the Pub/Sub topic is `projects/{project}/topics/{topic}`.
    string notificationPubsubTopic?;
};

# Boost specification to boost certain items.
public type GoogleCloudRetailV2SearchRequestBoostSpec record {
    # Condition boost specifications. If a product matches multiple conditions in the specifictions, boost scores from these specifications are all applied and combined in a non-linear way. Maximum number of specifications is 10.
    GoogleCloudRetailV2SearchRequestBoostSpecConditionBoostSpec[] conditionBoostSpecs?;
};

# Response of the ExportUserEventsRequest. If the long running operation was successful, then this message is returned by the google.longrunning.Operations.response field if the operation was successful.
public type GoogleCloudRetailV2alphaExportUserEventsResponse record {
    # A sample of errors encountered while processing the request.
    GoogleRpcStatus[] errorSamples?;
    # Configuration of destination for Export related errors.
    GoogleCloudRetailV2alphaExportErrorsConfig errorsConfig?;
};

# Response of the ImportProductsRequest. If the long running operation is done, then this message is returned by the google.longrunning.Operations.response field if the operation was successful.
public type GoogleCloudRetailV2ImportProductsResponse record {
    # A sample of errors encountered while processing the request.
    GoogleRpcStatus[] errorSamples?;
    # Configuration of destination for Import related errors.
    GoogleCloudRetailV2ImportErrorsConfig errorsConfig?;
};

# The price information of a Product.
public type GoogleCloudRetailV2PriceInfo record {
    # The costs associated with the sale of a particular product. Used for gross profit reporting. * Profit = price - cost Google Merchant Center property [cost_of_goods_sold](https://support.google.com/merchants/answer/9017895).
    float cost?;
    # The 3-letter currency code defined in [ISO 4217](https://www.iso.org/iso-4217-currency-codes.html). If this field is an unrecognizable currency code, an INVALID_ARGUMENT error is returned. The Product.Type.VARIANT Products with the same Product.primary_product_id must share the same currency_code. Otherwise, a FAILED_PRECONDITION error is returned.
    string currencyCode?;
    # Price of the product without any discount. If zero, by default set to be the price.
    float originalPrice?;
    # Price of the product. Google Merchant Center property [price](https://support.google.com/merchants/answer/6324371). Schema.org property [Offer.priceSpecification](https://schema.org/priceSpecification).
    float price?;
    # The timestamp when the price starts to be effective. This can be set as a future timestamp, and the price is only used for search after price_effective_time. If so, the original_price must be set and original_price is used before price_effective_time. Do not set if price is always effective because it will cause additional latency during search.
    string priceEffectiveTime?;
    # The timestamp when the price stops to be effective. The price is used for search before price_expire_time. If this field is set, the original_price must be set and original_price is used after price_expire_time. Do not set if price is always effective because it will cause additional latency during search.
    string priceExpireTime?;
    # The price range of all variant Product having the same Product.primary_product_id.
    GoogleCloudRetailV2PriceInfoPriceRange priceRange?;
};

# HTTP request data that is related to a reported error.
public type GoogleCloudRetailLoggingHttpRequestContext record {
    # The HTTP response status code for the request.
    int responseStatusCode?;
};

# Response of the ImportProductsRequest. If the long running operation is done, then this message is returned by the google.longrunning.Operations.response field if the operation was successful.
public type GoogleCloudRetailV2alphaImportProductsResponse record {
    # A sample of errors encountered while processing the request.
    GoogleRpcStatus[] errorSamples?;
    # Configuration of destination for Import related errors.
    GoogleCloudRetailV2alphaImportErrorsConfig errorsConfig?;
};

# Metadata for RejoinUserEvents method.
public type GoogleCloudRetailV2alphaRejoinUserEventsMetadata record {
};

# Response of the ImportUserEventsRequest. If the long running operation was successful, then this message is returned by the google.longrunning.Operations.response field if the operation was successful.
public type GoogleCloudRetailV2betaImportUserEventsResponse record {
    # A sample of errors encountered while processing the request.
    GoogleRpcStatus[] errorSamples?;
    # Configuration of destination for Import related errors.
    GoogleCloudRetailV2betaImportErrorsConfig errorsConfig?;
    # A summary of import result. The UserEventImportSummary summarizes the import status for user events.
    GoogleCloudRetailV2betaUserEventImportSummary importSummary?;
};

# Response message for ProductService.ListProducts method.
public type GoogleCloudRetailV2ListProductsResponse record {
    # A token that can be sent as ListProductsRequest.page_token to retrieve the next page. If this field is omitted, there are no subsequent pages.
    string nextPageToken?;
    # The Products.
    GoogleCloudRetailV2Product[] products?;
};

# Response of the ImportUserEventsRequest. If the long running operation was successful, then this message is returned by the google.longrunning.Operations.response field if the operation was successful.
public type GoogleCloudRetailV2ImportUserEventsResponse record {
    # A sample of errors encountered while processing the request.
    GoogleRpcStatus[] errorSamples?;
    # Configuration of destination for Import related errors.
    GoogleCloudRetailV2ImportErrorsConfig errorsConfig?;
    # A summary of import result. The UserEventImportSummary summarizes the import status for user events.
    GoogleCloudRetailV2UserEventImportSummary importSummary?;
};
