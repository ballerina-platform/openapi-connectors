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
    string refreshUrl = "https://accounts.google.com/o/oauth2/token";
|};

# Response to an async batch file annotation request.
public type GoogleCloudVisionV1p4beta1AsyncBatchAnnotateFilesResponse record {
    # The list of file annotation responses, one for each request in AsyncBatchAnnotateFilesRequest.
    GoogleCloudVisionV1p4beta1AsyncAnnotateFileResponse[] responses?;
};

# Response message for the `ImportProductSets` method. This message is returned by the google.longrunning.Operations.GetOperation method in the returned google.longrunning.Operation.response field.
public type ImportProductSetsResponse record {
    # The list of reference_images that are imported successfully.
    ReferenceImage[] referenceImages?;
    # The rpc status for each ImportProductSet request, including both successes and errors. The number of statuses here matches the number of lines in the csv file, and statuses[i] stores the success or failure status of processing the i-th line of the csv, starting from line 0.
    Status[] statuses?;
};

# Request message for the `ImportProductSets` method.
public type ImportProductSetsRequest record {
    # The input content for the `ImportProductSets` method.
    ImportProductSetsInputConfig inputConfig?;
};

# Detected page from OCR.
public type GoogleCloudVisionV1p1beta1Page record {
    # List of blocks of text, images etc on this page.
    GoogleCloudVisionV1p1beta1Block[] blocks?;
    # Confidence of the OCR results on the page. Range [0, 1].
    float confidence?;
    # Page height. For PDFs the unit is points. For images (including TIFFs) the unit is pixels.
    int height?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p1beta1TextAnnotationTextProperty property?;
    # Page width. For PDFs the unit is points. For images (including TIFFs) the unit is pixels.
    int width?;
};

# The Google Cloud Storage location where the input will be read from.
public type GoogleCloudVisionV1p2beta1GcsSource record {
    # Google Cloud Storage URI for the input file. This must only be a Google Cloud Storage object. Wildcards are not currently supported.
    string uri?;
};

# A Product contains ReferenceImages.
public type Product record {
    # User-provided metadata to be stored with this product. Must be at most 4096 characters long.
    string description?;
    # The user-provided name for this Product. Must not be empty. Must be at most 4096 characters long.
    string displayName?;
    # The resource name of the product. Format is: `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID`. This field is ignored when creating a product.
    string name?;
    # Immutable. The category for the product identified by the reference image. This should be one of "homegoods-v2", "apparel-v2", "toys-v2", "packagedgoods-v1" or "general-v1". The legacy categories "homegoods", "apparel", and "toys" are still supported, but these should not be used for new products.
    string productCategory?;
    # Key-value pairs that can be attached to a product. At query time, constraints can be specified based on the product_labels. Note that integer values can be provided as strings, e.g. "1199". Only strings with integer values can match a range-based restriction which is to be supported soon. Multiple values can be assigned to the same key. One product may have up to 500 product_labels. Notice that the total number of distinct product_labels over all products in one ProductSet cannot exceed 1M, otherwise the product search pipeline will refuse to work for that ProductSet.
    KeyValue[] productLabels?;
};

# The type of Google Cloud Vision API detection to perform, and the maximum number of results to return for that type. Multiple `Feature` objects can be specified in the `features` list.
public type Feature record {
    # Maximum number of results of this type. Does not apply to `TEXT_DETECTION`, `DOCUMENT_TEXT_DETECTION`, or `CROP_HINTS`.
    int maxResults?;
    # Model to use for the feature. Supported values: "builtin/stable" (the default if unset) and "builtin/latest".
    string model?;
    # The feature type.
    string 'type?;
};

# A face annotation object contains the results of face detection.
public type GoogleCloudVisionV1p3beta1FaceAnnotation record {
    # Anger likelihood.
    string angerLikelihood?;
    # Blurred likelihood.
    string blurredLikelihood?;
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p3beta1BoundingPoly boundingPoly?;
    # Detection confidence. Range [0, 1].
    float detectionConfidence?;
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p3beta1BoundingPoly fdBoundingPoly?;
    # Headwear likelihood.
    string headwearLikelihood?;
    # Joy likelihood.
    string joyLikelihood?;
    # Face landmarking confidence. Range [0, 1].
    float landmarkingConfidence?;
    # Detected face landmarks.
    GoogleCloudVisionV1p3beta1FaceAnnotationLandmark[] landmarks?;
    # Yaw angle, which indicates the leftward/rightward angle that the face is pointing relative to the vertical plane perpendicular to the image. Range [-180,180].
    float panAngle?;
    # Roll angle, which indicates the amount of clockwise/anti-clockwise rotation of the face relative to the image vertical about the axis perpendicular to the face. Range [-180,180].
    float rollAngle?;
    # Sorrow likelihood.
    string sorrowLikelihood?;
    # Surprise likelihood.
    string surpriseLikelihood?;
    # Pitch angle, which indicates the upwards/downwards angle that the face is pointing relative to the image's horizontal plane. Range [-180,180].
    float tiltAngle?;
    # Under-exposed likelihood.
    string underExposedLikelihood?;
};

# The desired input location and metadata.
public type GoogleCloudVisionV1p3beta1InputConfig record {
    # File content, represented as a stream of bytes. Note: As with all `bytes` fields, protobuffers use a pure binary representation, whereas JSON representations use base64. Currently, this field only works for BatchAnnotateFiles requests. It does not work for AsyncBatchAnnotateFiles requests.
    string content?;
    # The Google Cloud Storage location where the input will be read from.
    GoogleCloudVisionV1p3beta1GcsSource gcsSource?;
    # The type of the file. Currently only "application/pdf", "image/tiff" and "image/gif" are supported. Wildcards are not supported.
    string mimeType?;
};

# The desired input location and metadata.
public type InputConfig record {
    # File content, represented as a stream of bytes. Note: As with all `bytes` fields, protobuffers use a pure binary representation, whereas JSON representations use base64. Currently, this field only works for BatchAnnotateFiles requests. It does not work for AsyncBatchAnnotateFiles requests.
    string content?;
    # The Google Cloud Storage location where the input will be read from.
    GcsSource gcsSource?;
    # The type of the file. Currently only "application/pdf", "image/tiff" and "image/gif" are supported. Wildcards are not supported.
    string mimeType?;
};

# An object that represents a latitude/longitude pair. This is expressed as a pair of doubles to represent degrees latitude and degrees longitude. Unless specified otherwise, this object must conform to the WGS84 standard. Values must be within normalized ranges.
public type LatLng record {
    # The latitude in degrees. It must be in the range [-90.0, +90.0].
    decimal latitude?;
    # The longitude in degrees. It must be in the range [-180.0, +180.0].
    decimal longitude?;
};

# Set of detected entity features.
public type EntityAnnotation record {
    # A bounding polygon for the detected image annotation.
    BoundingPoly boundingPoly?;
    # **Deprecated. Use `score` instead.** The accuracy of the entity detection in an image. For example, for an image in which the "Eiffel Tower" entity is detected, this field represents the confidence that there is a tower in the query image. Range [0, 1].
    float confidence?;
    # Entity textual description, expressed in its `locale` language.
    string description?;
    # The language code for the locale in which the entity textual `description` is expressed.
    string locale?;
    # The location information for the detected entity. Multiple `LocationInfo` elements can be present because one location may indicate the location of the scene in the image, and another location may indicate the location of the place where the image was taken. Location information is usually present for landmarks.
    LocationInfo[] locations?;
    # Opaque entity ID. Some IDs may be available in [Google Knowledge Graph Search API](https://developers.google.com/knowledge-graph/).
    string mid?;
    # Some entities may have optional user-supplied `Property` (name/value) fields, such a score or string that qualifies the entity.
    Property[] properties?;
    # Overall score of the result. Range [0, 1].
    float score?;
    # The relevancy of the ICA (Image Content Annotation) label to the image. For example, the relevancy of "tower" is likely higher to an image containing the detected "Eiffel Tower" than to an image containing a detected distant towering building, even though the confidence that there is a tower in each image may be the same. Range [0, 1].
    float topicality?;
};

# Set of detected entity features.
public type GoogleCloudVisionV1p4beta1EntityAnnotation record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p4beta1BoundingPoly boundingPoly?;
    # **Deprecated. Use `score` instead.** The accuracy of the entity detection in an image. For example, for an image in which the "Eiffel Tower" entity is detected, this field represents the confidence that there is a tower in the query image. Range [0, 1].
    float confidence?;
    # Entity textual description, expressed in its `locale` language.
    string description?;
    # The language code for the locale in which the entity textual `description` is expressed.
    string locale?;
    # The location information for the detected entity. Multiple `LocationInfo` elements can be present because one location may indicate the location of the scene in the image, and another location may indicate the location of the place where the image was taken. Location information is usually present for landmarks.
    GoogleCloudVisionV1p4beta1LocationInfo[] locations?;
    # Opaque entity ID. Some IDs may be available in [Google Knowledge Graph Search API](https://developers.google.com/knowledge-graph/).
    string mid?;
    # Some entities may have optional user-supplied `Property` (name/value) fields, such a score or string that qualifies the entity.
    GoogleCloudVisionV1p4beta1Property[] properties?;
    # Overall score of the result. Range [0, 1].
    float score?;
    # The relevancy of the ICA (Image Content Annotation) label to the image. For example, the relevancy of "tower" is likely higher to an image containing the detected "Eiffel Tower" than to an image containing a detected distant towering building, even though the confidence that there is a tower in each image may be the same. Range [0, 1].
    float topicality?;
};

# Set of dominant colors and their corresponding scores.
public type GoogleCloudVisionV1p1beta1DominantColorsAnnotation record {
    # RGB color values with their score and pixel fraction.
    GoogleCloudVisionV1p1beta1ColorInfo[] colors?;
};

# Information about a product.
public type GoogleCloudVisionV1p4beta1ProductSearchResultsResult record {
    # The resource name of the image from the product that is the closest match to the query.
    string image?;
    # A Product contains ReferenceImages.
    GoogleCloudVisionV1p4beta1Product product?;
    # A confidence level on the match, ranging from 0 (no confidence) to 1 (full confidence).
    float score?;
};

# The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
public type Status record {
    # The status code, which should be an enum value of google.rpc.Code.
    int code?;
    # A list of messages that carry the error details. There is a common set of message types for APIs to use.
    record {}[] details?;
    # A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.
    string message?;
};

# A word representation.
public type GoogleCloudVisionV1p3beta1Word record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p3beta1BoundingPoly boundingBox?;
    # Confidence of the OCR results for the word. Range [0, 1].
    float confidence?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p3beta1TextAnnotationTextProperty property?;
    # List of symbols in the word. The order of the symbols follows the natural reading order.
    GoogleCloudVisionV1p3beta1Symbol[] symbols?;
};

# Structural unit of text representing a number of words in certain order.
public type GoogleCloudVisionV1p2beta1Paragraph record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p2beta1BoundingPoly boundingBox?;
    # Confidence of the OCR results for the paragraph. Range [0, 1].
    float confidence?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p2beta1TextAnnotationTextProperty property?;
    # List of all words in this paragraph.
    GoogleCloudVisionV1p2beta1Word[] words?;
};

# A bounding polygon for the detected image annotation.
public type GoogleCloudVisionV1p2beta1BoundingPoly record {
    # The bounding polygon normalized vertices.
    GoogleCloudVisionV1p2beta1NormalizedVertex[] normalizedVertices?;
    # The bounding polygon vertices.
    GoogleCloudVisionV1p2beta1Vertex[] vertices?;
};

# Response to an async batch file annotation request.
public type GoogleCloudVisionV1p3beta1AsyncBatchAnnotateFilesResponse record {
    # The list of file annotation responses, one for each request in AsyncBatchAnnotateFilesRequest.
    GoogleCloudVisionV1p3beta1AsyncAnnotateFileResponse[] responses?;
};

# A face-specific landmark (for example, a face feature).
public type Landmark record {
    # A 3D position in the image, used primarily for Face detection landmarks. A valid Position must have both x and y coordinates. The position coordinates are in the same scale as the original image.
    Position position?;
    # Face landmark type.
    string 'type?;
};

# Detected entity location information.
public type GoogleCloudVisionV1p2beta1LocationInfo record {
    # An object that represents a latitude/longitude pair. This is expressed as a pair of doubles to represent degrees latitude and degrees longitude. Unless specified otherwise, this object must conform to the WGS84 standard. Values must be within normalized ranges.
    LatLng latLng?;
};

# Relevant information for the image from the Internet.
public type GoogleCloudVisionV1p1beta1WebDetection record {
    # The service's best guess as to the topic of the request image. Inferred from similar images on the open web.
    GoogleCloudVisionV1p1beta1WebDetectionWebLabel[] bestGuessLabels?;
    # Fully matching images from the Internet. Can include resized copies of the query image.
    GoogleCloudVisionV1p1beta1WebDetectionWebImage[] fullMatchingImages?;
    # Web pages containing the matching images from the Internet.
    GoogleCloudVisionV1p1beta1WebDetectionWebPage[] pagesWithMatchingImages?;
    # Partial matching images from the Internet. Those images are similar enough to share some key-point features. For example an original image will likely have partial matching for its crops.
    GoogleCloudVisionV1p1beta1WebDetectionWebImage[] partialMatchingImages?;
    # The visually similar image results.
    GoogleCloudVisionV1p1beta1WebDetectionWebImage[] visuallySimilarImages?;
    # Deduced entities from similar images on the Internet.
    GoogleCloudVisionV1p1beta1WebDetectionWebEntity[] webEntities?;
};

# The response for a single offline file annotation request.
public type GoogleCloudVisionV1p3beta1AsyncAnnotateFileResponse record {
    # The desired output location and metadata.
    GoogleCloudVisionV1p3beta1OutputConfig outputConfig?;
};

# Information about the products similar to a single product in a query image.
public type GoogleCloudVisionV1p2beta1ProductSearchResultsGroupedResult record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p2beta1BoundingPoly boundingPoly?;
    # List of generic predictions for the object in the bounding box.
    GoogleCloudVisionV1p2beta1ProductSearchResultsObjectAnnotation[] objectAnnotations?;
    # List of results, one for each product match.
    GoogleCloudVisionV1p2beta1ProductSearchResultsResult[] results?;
};

# Single crop hint that is used to generate a new crop when serving an image.
public type GoogleCloudVisionV1p4beta1CropHint record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p4beta1BoundingPoly boundingPoly?;
    # Confidence of this being a salient region. Range [0, 1].
    float confidence?;
    # Fraction of importance of this salient region with respect to the original image.
    float importanceFraction?;
};

# Prediction for what the object in the bounding box is.
public type GoogleCloudVisionV1p3beta1ProductSearchResultsObjectAnnotation record {
    # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
    # Object ID that should align with EntityAnnotation mid.
    string mid?;
    # Object name, expressed in its `language_code` language.
    string name?;
    # Score of the result. Range [0, 1].
    float score?;
};

# Set of detected entity features.
public type GoogleCloudVisionV1p3beta1EntityAnnotation record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p3beta1BoundingPoly boundingPoly?;
    # **Deprecated. Use `score` instead.** The accuracy of the entity detection in an image. For example, for an image in which the "Eiffel Tower" entity is detected, this field represents the confidence that there is a tower in the query image. Range [0, 1].
    float confidence?;
    # Entity textual description, expressed in its `locale` language.
    string description?;
    # The language code for the locale in which the entity textual `description` is expressed.
    string locale?;
    # The location information for the detected entity. Multiple `LocationInfo` elements can be present because one location may indicate the location of the scene in the image, and another location may indicate the location of the place where the image was taken. Location information is usually present for landmarks.
    GoogleCloudVisionV1p3beta1LocationInfo[] locations?;
    # Opaque entity ID. Some IDs may be available in [Google Knowledge Graph Search API](https://developers.google.com/knowledge-graph/).
    string mid?;
    # Some entities may have optional user-supplied `Property` (name/value) fields, such a score or string that qualifies the entity.
    GoogleCloudVisionV1p3beta1Property[] properties?;
    # Overall score of the result. Range [0, 1].
    float score?;
    # The relevancy of the ICA (Image Content Annotation) label to the image. For example, the relevancy of "tower" is likely higher to an image containing the detected "Eiffel Tower" than to an image containing a detected distant towering building, even though the confidence that there is a tower in each image may be the same. Range [0, 1].
    float topicality?;
};

# Stores image properties, such as dominant colors.
public type ImageProperties record {
    # Set of dominant colors and their corresponding scores.
    DominantColorsAnnotation dominantColors?;
};

# The desired output location and metadata.
public type GoogleCloudVisionV1p1beta1OutputConfig record {
    # The max number of response protos to put into each output JSON file on Google Cloud Storage. The valid range is [1, 100]. If not specified, the default value is 20. For example, for one pdf file with 100 pages, 100 response protos will be generated. If `batch_size` = 20, then 5 json files each containing 20 response protos will be written under the prefix `gcs_destination`.`uri`. Currently, batch_size only applies to GcsDestination, with potential future support for other output configurations.
    int batchSize?;
    # The Google Cloud Storage location where the output will be written to.
    GoogleCloudVisionV1p1beta1GcsDestination gcsDestination?;
};

# If an image was produced from a file (e.g. a PDF), this message gives information about the source of that image.
public type ImageAnnotationContext record {
    # If the file was a PDF or TIFF, this field gives the page number within the file used to produce the image.
    int pageNumber?;
    # The URI of the file used to produce the image.
    string uri?;
};

# Set of features pertaining to the image, computed by computer vision methods over safe-search verticals (for example, adult, spoof, medical, violence).
public type GoogleCloudVisionV1p4beta1SafeSearchAnnotation record {
    # Represents the adult content likelihood for the image. Adult content may contain elements such as nudity, pornographic images or cartoons, or sexual activities.
    string adult?;
    # Likelihood that this is a medical image.
    string medical?;
    # Likelihood that the request image contains racy content. Racy content may include (but is not limited to) skimpy or sheer clothing, strategically covered nudity, lewd or provocative poses, or close-ups of sensitive body areas.
    string racy?;
    # Spoof likelihood. The likelihood that an modification was made to the image's canonical version to make it appear funny or offensive.
    string spoof?;
    # Likelihood that this image contains violent content.
    string violence?;
};

# Prediction for what the object in the bounding box is.
public type GoogleCloudVisionV1p2beta1ProductSearchResultsObjectAnnotation record {
    # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
    # Object ID that should align with EntityAnnotation mid.
    string mid?;
    # Object name, expressed in its `language_code` language.
    string name?;
    # Score of the result. Range [0, 1].
    float score?;
};

# The Google Cloud Storage location for a csv file which preserves a list of ImportProductSetRequests in each line.
public type ImportProductSetsGcsSource record {
    # The Google Cloud Storage URI of the input csv file. The URI must start with `gs://`. The format of the input csv file should be one image per line. In each line, there are 8 columns. 1. image-uri 2. image-id 3. product-set-id 4. product-id 5. product-category 6. product-display-name 7. labels 8. bounding-poly The `image-uri`, `product-set-id`, `product-id`, and `product-category` columns are required. All other columns are optional. If the `ProductSet` or `Product` specified by the `product-set-id` and `product-id` values does not exist, then the system will create a new `ProductSet` or `Product` for the image. In this case, the `product-display-name` column refers to display_name, the `product-category` column refers to product_category, and the `labels` column refers to product_labels. The `image-id` column is optional but must be unique if provided. If it is empty, the system will automatically assign a unique id to the image. The `product-display-name` column is optional. If it is empty, the system sets the display_name field for the product to a space (" "). You can update the `display_name` later by using the API. If a `Product` with the specified `product-id` already exists, then the system ignores the `product-display-name`, `product-category`, and `labels` columns. The `labels` column (optional) is a line containing a list of comma-separated key-value pairs, in the following format: "key_1=value_1,key_2=value_2,...,key_n=value_n" The `bounding-poly` column (optional) identifies one region of interest from the image in the same manner as `CreateReferenceImage`. If you do not specify the `bounding-poly` column, then the system will try to detect regions of interest automatically. At most one `bounding-poly` column is allowed per line. If the image contains multiple regions of interest, add a line to the CSV file that includes the same product information, and the `bounding-poly` values for each region of interest. The `bounding-poly` column must contain an even number of comma-separated numbers, in the format "p1_x,p1_y,p2_x,p2_y,...,pn_x,pn_y". Use non-negative integers for absolute bounding polygons, and float values in [0, 1] for normalized bounding polygons. The system will resize the image if the image resolution is too large to process (larger than 20MP).
    string csvFileUri?;
};

# Response to a batch image annotation request.
public type BatchAnnotateImagesResponse record {
    # Individual responses to image annotation requests within the batch.
    AnnotateImageResponse[] responses?;
};

# If an image was produced from a file (e.g. a PDF), this message gives information about the source of that image.
public type GoogleCloudVisionV1p4beta1ImageAnnotationContext record {
    # If the file was a PDF or TIFF, this field gives the page number within the file used to produce the image.
    int pageNumber?;
    # The URI of the file used to produce the image.
    string uri?;
};

# Entity deduced from similar images on the Internet.
public type GoogleCloudVisionV1p1beta1WebDetectionWebEntity record {
    # Canonical description of the entity, in English.
    string description?;
    # Opaque entity ID.
    string entityId?;
    # Overall relevancy score for the entity. Not normalized and not comparable across different image queries.
    float score?;
};

# Metadata for web pages.
public type GoogleCloudVisionV1p2beta1WebDetectionWebPage record {
    # Fully matching images on the page. Can include resized copies of the query image.
    GoogleCloudVisionV1p2beta1WebDetectionWebImage[] fullMatchingImages?;
    # Title for the web page, may contain HTML markups.
    string pageTitle?;
    # Partial matching images on the page. Those images are similar enough to share some key-point features. For example an original image will likely have partial matching for its crops.
    GoogleCloudVisionV1p2beta1WebDetectionWebImage[] partialMatchingImages?;
    # (Deprecated) Overall relevancy score for the web page.
    float score?;
    # The result web page URL.
    string url?;
};

# Set of dominant colors and their corresponding scores.
public type GoogleCloudVisionV1p3beta1DominantColorsAnnotation record {
    # RGB color values with their score and pixel fraction.
    GoogleCloudVisionV1p3beta1ColorInfo[] colors?;
};

# Response to an async batch file annotation request.
public type GoogleCloudVisionV1p2beta1AsyncBatchAnnotateFilesResponse record {
    # The list of file annotation responses, one for each request in AsyncBatchAnnotateFilesRequest.
    GoogleCloudVisionV1p2beta1AsyncAnnotateFileResponse[] responses?;
};

# A Celebrity is a group of Faces with an identity.
public type GoogleCloudVisionV1p4beta1Celebrity record {
    # The Celebrity's description.
    string description?;
    # The Celebrity's display name.
    string displayName?;
    # The resource name of the preloaded Celebrity. Has the format `builtin/{mid}`.
    string name?;
};

# A bounding polygon for the detected image annotation.
public type GoogleCloudVisionV1p1beta1BoundingPoly record {
    # The bounding polygon normalized vertices.
    GoogleCloudVisionV1p1beta1NormalizedVertex[] normalizedVertices?;
    # The bounding polygon vertices.
    GoogleCloudVisionV1p1beta1Vertex[] vertices?;
};

# Structural unit of text representing a number of words in certain order.
public type GoogleCloudVisionV1p1beta1Paragraph record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p1beta1BoundingPoly boundingBox?;
    # Confidence of the OCR results for the paragraph. Range [0, 1].
    float confidence?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p1beta1TextAnnotationTextProperty property?;
    # List of all words in this paragraph.
    GoogleCloudVisionV1p1beta1Word[] words?;
};

# A ProductSet contains Products. A ProductSet can contain a maximum of 1 million reference images. If the limit is exceeded, periodic indexing will fail.
public type ProductSet record {
    # The user-provided name for this ProductSet. Must not be empty. Must be at most 4096 characters long.
    string displayName?;
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status indexError?;
    # Output only. The time at which this ProductSet was last indexed. Query results will reflect all updates before this time. If this ProductSet has never been indexed, this timestamp is the default value "1970-01-01T00:00:00Z". This field is ignored when creating a ProductSet.
    string indexTime?;
    # The resource name of the ProductSet. Format is: `projects/PROJECT_ID/locations/LOC_ID/productSets/PRODUCT_SET_ID`. This field is ignored when creating a ProductSet.
    string name?;
};

# A vertex represents a 2D point in the image. NOTE: the normalized vertex coordinates are relative to the original image and range from 0 to 1.
public type GoogleCloudVisionV1p1beta1NormalizedVertex record {
    # X coordinate.
    float x?;
    # Y coordinate.
    float y?;
};

# Set of detected objects with bounding boxes.
public type GoogleCloudVisionV1p3beta1LocalizedObjectAnnotation record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p3beta1BoundingPoly boundingPoly?;
    # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
    # Object ID that should align with EntityAnnotation mid.
    string mid?;
    # Object name, expressed in its `language_code` language.
    string name?;
    # Score of the result. Range [0, 1].
    float score?;
};

# TextAnnotation contains a structured representation of OCR extracted text. The hierarchy of an OCR extracted text structure is like this: TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol Each structural component, starting from Page, may further have their own properties. Properties describe detected languages, breaks etc.. Please refer to the TextAnnotation.TextProperty message definition below for more detail.
public type GoogleCloudVisionV1p4beta1TextAnnotation record {
    # List of pages detected by OCR.
    GoogleCloudVisionV1p4beta1Page[] pages?;
    # UTF-8 text detected on the pages.
    string text?;
};

# Multiple image annotation requests are batched into a single service call.
public type BatchAnnotateImagesRequest record {
    # Optional. Target project and location to make a call. Format: `projects/{project-id}/locations/{location-id}`. If no parent is specified, a region will be chosen automatically. Supported location-ids: `us`: USA country only, `asia`: East asia areas, like Japan, Taiwan, `eu`: The European Union. Example: `projects/project-A/locations/eu`.
    string parent?;
    # Required. Individual image annotation requests for this batch.
    AnnotateImageRequest[] requests?;
};

# TextAnnotation contains a structured representation of OCR extracted text. The hierarchy of an OCR extracted text structure is like this: TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol Each structural component, starting from Page, may further have their own properties. Properties describe detected languages, breaks etc.. Please refer to the TextAnnotation.TextProperty message definition below for more detail.
public type GoogleCloudVisionV1p1beta1TextAnnotation record {
    # List of pages detected by OCR.
    GoogleCloudVisionV1p1beta1Page[] pages?;
    # UTF-8 text detected on the pages.
    string text?;
};

# A 3D position in the image, used primarily for Face detection landmarks. A valid Position must have both x and y coordinates. The position coordinates are in the same scale as the original image.
public type GoogleCloudVisionV1p3beta1Position record {
    # X coordinate.
    float x?;
    # Y coordinate.
    float y?;
    # Z coordinate (or depth).
    float z?;
};

# Set of detected objects with bounding boxes.
public type GoogleCloudVisionV1p2beta1LocalizedObjectAnnotation record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p2beta1BoundingPoly boundingPoly?;
    # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
    # Object ID that should align with EntityAnnotation mid.
    string mid?;
    # Object name, expressed in its `language_code` language.
    string name?;
    # Score of the result. Range [0, 1].
    float score?;
};

# Label to provide extra metadata for the web detection.
public type GoogleCloudVisionV1p2beta1WebDetectionWebLabel record {
    # Label for extra metadata.
    string label?;
    # The BCP-47 language code for `label`, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
};

# The Google Cloud Storage location where the output will be written to.
public type GoogleCloudVisionV1p4beta1GcsDestination record {
    # Google Cloud Storage URI prefix where the results will be stored. Results will be in JSON format and preceded by its corresponding input URI prefix. This field can either represent a gcs file prefix or gcs directory. In either case, the uri should be unique because in order to get all of the output files, you will need to do a wildcard gcs search on the uri prefix you provide. Examples: * File Prefix: gs://bucket-name/here/filenameprefix The output files will be created in gs://bucket-name/here/ and the names of the output files will begin with "filenameprefix". * Directory Prefix: gs://bucket-name/some/location/ The output files will be created in gs://bucket-name/some/location/ and the names of the output files could be anything because there was no filename prefix specified. If multiple outputs, each response is still AnnotateFileResponse, each of which contains some subset of the full list of AnnotateImageResponse. Multiple outputs can happen if, for example, the output JSON is too large and overflows into multiple sharded files.
    string uri?;
};

# A bounding polygon for the detected image annotation.
public type BoundingPoly record {
    # The bounding polygon normalized vertices.
    NormalizedVertex[] normalizedVertices?;
    # The bounding polygon vertices.
    Vertex[] vertices?;
};

# Label to provide extra metadata for the web detection.
public type GoogleCloudVisionV1p4beta1WebDetectionWebLabel record {
    # Label for extra metadata.
    string label?;
    # The BCP-47 language code for `label`, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
};

# Set of crop hints that are used to generate new crops when serving images.
public type GoogleCloudVisionV1p3beta1CropHintsAnnotation record {
    # Crop hint results.
    GoogleCloudVisionV1p3beta1CropHint[] cropHints?;
};

# Detected entity location information.
public type LocationInfo record {
    # An object that represents a latitude/longitude pair. This is expressed as a pair of doubles to represent degrees latitude and degrees longitude. Unless specified otherwise, this object must conform to the WGS84 standard. Values must be within normalized ranges.
    LatLng latLng?;
};

# Response message for the `ListReferenceImages` method.
public type ListReferenceImagesResponse record {
    # The next_page_token returned from a previous List request, if any.
    string nextPageToken?;
    # The maximum number of items to return. Default 10, maximum 100.
    int pageSize?;
    # The list of reference images.
    ReferenceImage[] referenceImages?;
};

# The Google Cloud Storage location where the output will be written to.
public type GoogleCloudVisionV1p1beta1GcsDestination record {
    # Google Cloud Storage URI prefix where the results will be stored. Results will be in JSON format and preceded by its corresponding input URI prefix. This field can either represent a gcs file prefix or gcs directory. In either case, the uri should be unique because in order to get all of the output files, you will need to do a wildcard gcs search on the uri prefix you provide. Examples: * File Prefix: gs://bucket-name/here/filenameprefix The output files will be created in gs://bucket-name/here/ and the names of the output files will begin with "filenameprefix". * Directory Prefix: gs://bucket-name/some/location/ The output files will be created in gs://bucket-name/some/location/ and the names of the output files could be anything because there was no filename prefix specified. If multiple outputs, each response is still AnnotateFileResponse, each of which contains some subset of the full list of AnnotateImageResponse. Multiple outputs can happen if, for example, the output JSON is too large and overflows into multiple sharded files.
    string uri?;
};

# A vertex represents a 2D point in the image. NOTE: the normalized vertex coordinates are relative to the original image and range from 0 to 1.
public type GoogleCloudVisionV1p2beta1NormalizedVertex record {
    # X coordinate.
    float x?;
    # Y coordinate.
    float y?;
};

# Information about the products similar to a single product in a query image.
public type GoogleCloudVisionV1p1beta1ProductSearchResultsGroupedResult record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p1beta1BoundingPoly boundingPoly?;
    # List of generic predictions for the object in the bounding box.
    GoogleCloudVisionV1p1beta1ProductSearchResultsObjectAnnotation[] objectAnnotations?;
    # List of results, one for each product match.
    GoogleCloudVisionV1p1beta1ProductSearchResultsResult[] results?;
};

# Response to an image annotation request.
public type AnnotateImageResponse record {
    # If an image was produced from a file (e.g. a PDF), this message gives information about the source of that image.
    ImageAnnotationContext context?;
    # Set of crop hints that are used to generate new crops when serving images.
    CropHintsAnnotation cropHintsAnnotation?;
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status 'error?;
    # If present, face detection has completed successfully.
    FaceAnnotation[] faceAnnotations?;
    # TextAnnotation contains a structured representation of OCR extracted text. The hierarchy of an OCR extracted text structure is like this: TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol Each structural component, starting from Page, may further have their own properties. Properties describe detected languages, breaks etc.. Please refer to the TextAnnotation.TextProperty message definition below for more detail.
    TextAnnotation fullTextAnnotation?;
    # Stores image properties, such as dominant colors.
    ImageProperties imagePropertiesAnnotation?;
    # If present, label detection has completed successfully.
    EntityAnnotation[] labelAnnotations?;
    # If present, landmark detection has completed successfully.
    EntityAnnotation[] landmarkAnnotations?;
    # If present, localized object detection has completed successfully. This will be sorted descending by confidence score.
    LocalizedObjectAnnotation[] localizedObjectAnnotations?;
    # If present, logo detection has completed successfully.
    EntityAnnotation[] logoAnnotations?;
    # Results for a product search request.
    ProductSearchResults productSearchResults?;
    # Set of features pertaining to the image, computed by computer vision methods over safe-search verticals (for example, adult, spoof, medical, violence).
    SafeSearchAnnotation safeSearchAnnotation?;
    # If present, text (OCR) detection has completed successfully.
    EntityAnnotation[] textAnnotations?;
    # Relevant information for the image from the Internet.
    WebDetection webDetection?;
};

# A product label represented as a key-value pair.
public type GoogleCloudVisionV1p3beta1ProductKeyValue record {
    # The key of the label attached to the product. Cannot be empty and cannot exceed 128 bytes.
    string 'key?;
    # The value of the label attached to the product. Cannot be empty and cannot exceed 128 bytes.
    string value?;
};

# The Google Cloud Storage location where the output will be written to.
public type GoogleCloudVisionV1p2beta1GcsDestination record {
    # Google Cloud Storage URI prefix where the results will be stored. Results will be in JSON format and preceded by its corresponding input URI prefix. This field can either represent a gcs file prefix or gcs directory. In either case, the uri should be unique because in order to get all of the output files, you will need to do a wildcard gcs search on the uri prefix you provide. Examples: * File Prefix: gs://bucket-name/here/filenameprefix The output files will be created in gs://bucket-name/here/ and the names of the output files will begin with "filenameprefix". * Directory Prefix: gs://bucket-name/some/location/ The output files will be created in gs://bucket-name/some/location/ and the names of the output files could be anything because there was no filename prefix specified. If multiple outputs, each response is still AnnotateFileResponse, each of which contains some subset of the full list of AnnotateImageResponse. Multiple outputs can happen if, for example, the output JSON is too large and overflows into multiple sharded files.
    string uri?;
};

# Detected entity location information.
public type GoogleCloudVisionV1p1beta1LocationInfo record {
    # An object that represents a latitude/longitude pair. This is expressed as a pair of doubles to represent degrees latitude and degrees longitude. Unless specified otherwise, this object must conform to the WGS84 standard. Values must be within normalized ranges.
    LatLng latLng?;
};

# Entity deduced from similar images on the Internet.
public type GoogleCloudVisionV1p4beta1WebDetectionWebEntity record {
    # Canonical description of the entity, in English.
    string description?;
    # Opaque entity ID.
    string entityId?;
    # Overall relevancy score for the entity. Not normalized and not comparable across different image queries.
    float score?;
};

# A `ReferenceImage` represents a product image and its associated metadata, such as bounding boxes.
public type GoogleCloudVisionV1p3beta1ReferenceImage record {
    # Optional. Bounding polygons around the areas of interest in the reference image. If this field is empty, the system will try to detect regions of interest. At most 10 bounding polygons will be used. The provided shape is converted into a non-rotated rectangle. Once converted, the small edge of the rectangle must be greater than or equal to 300 pixels. The aspect ratio must be 1:4 or less (i.e. 1:3 is ok; 1:5 is not).
    GoogleCloudVisionV1p3beta1BoundingPoly[] boundingPolys?;
    # The resource name of the reference image. Format is: `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID/referenceImages/IMAGE_ID`. This field is ignored when creating a reference image.
    string name?;
    # Required. The Google Cloud Storage URI of the reference image. The URI must start with `gs://`.
    string uri?;
};

# Relevant information for the image from the Internet.
public type GoogleCloudVisionV1p2beta1WebDetection record {
    # The service's best guess as to the topic of the request image. Inferred from similar images on the open web.
    GoogleCloudVisionV1p2beta1WebDetectionWebLabel[] bestGuessLabels?;
    # Fully matching images from the Internet. Can include resized copies of the query image.
    GoogleCloudVisionV1p2beta1WebDetectionWebImage[] fullMatchingImages?;
    # Web pages containing the matching images from the Internet.
    GoogleCloudVisionV1p2beta1WebDetectionWebPage[] pagesWithMatchingImages?;
    # Partial matching images from the Internet. Those images are similar enough to share some key-point features. For example an original image will likely have partial matching for its crops.
    GoogleCloudVisionV1p2beta1WebDetectionWebImage[] partialMatchingImages?;
    # The visually similar image results.
    GoogleCloudVisionV1p2beta1WebDetectionWebImage[] visuallySimilarImages?;
    # Deduced entities from similar images on the Internet.
    GoogleCloudVisionV1p2beta1WebDetectionWebEntity[] webEntities?;
};

# A product label represented as a key-value pair.
public type GoogleCloudVisionV1p1beta1ProductKeyValue record {
    # The key of the label attached to the product. Cannot be empty and cannot exceed 128 bytes.
    string 'key?;
    # The value of the label attached to the product. Cannot be empty and cannot exceed 128 bytes.
    string value?;
};

# Detected language for a structural component.
public type GoogleCloudVisionV1p1beta1TextAnnotationDetectedLanguage record {
    # Confidence of detected language. Range [0, 1].
    float confidence?;
    # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
};

# Contains metadata for the BatchAnnotateImages operation.
public type GoogleCloudVisionV1p1beta1OperationMetadata record {
    # The time when the batch request was received.
    string createTime?;
    # Current state of the batch operation.
    string state?;
    # The time when the operation result was last updated.
    string updateTime?;
};

# Parameters for text detections. This is used to control TEXT_DETECTION and DOCUMENT_TEXT_DETECTION features.
public type TextDetectionParams record {
    # By default, Cloud Vision API only includes confidence score for DOCUMENT_TEXT_DETECTION result. Set the flag to true to include confidence score for TEXT_DETECTION as well.
    boolean enableTextDetectionConfidenceScore?;
};

# Structural unit of text representing a number of words in certain order.
public type GoogleCloudVisionV1p3beta1Paragraph record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p3beta1BoundingPoly boundingBox?;
    # Confidence of the OCR results for the paragraph. Range [0, 1].
    float confidence?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p3beta1TextAnnotationTextProperty property?;
    # List of all words in this paragraph.
    GoogleCloudVisionV1p3beta1Word[] words?;
};

# A single symbol representation.
public type GoogleCloudVisionV1p1beta1Symbol record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p1beta1BoundingPoly boundingBox?;
    # Confidence of the OCR results for the symbol. Range [0, 1].
    float confidence?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p1beta1TextAnnotationTextProperty property?;
    # The actual UTF-8 representation of the symbol.
    string text?;
};

# Detected page from OCR.
public type Page record {
    # List of blocks of text, images etc on this page.
    Block[] blocks?;
    # Confidence of the OCR results on the page. Range [0, 1].
    float confidence?;
    # Page height. For PDFs the unit is points. For images (including TIFFs) the unit is pixels.
    int height?;
    # Additional information detected on the structural component.
    TextProperty property?;
    # Page width. For PDFs the unit is points. For images (including TIFFs) the unit is pixels.
    int width?;
};

# Request message for the `RemoveProductFromProductSet` method.
public type RemoveProductFromProductSetRequest record {
    # Required. The resource name for the Product to be removed from this ProductSet. Format is: `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID`
    string product?;
};

# The desired output location and metadata.
public type GoogleCloudVisionV1p4beta1OutputConfig record {
    # The max number of response protos to put into each output JSON file on Google Cloud Storage. The valid range is [1, 100]. If not specified, the default value is 20. For example, for one pdf file with 100 pages, 100 response protos will be generated. If `batch_size` = 20, then 5 json files each containing 20 response protos will be written under the prefix `gcs_destination`.`uri`. Currently, batch_size only applies to GcsDestination, with potential future support for other output configurations.
    int batchSize?;
    # The Google Cloud Storage location where the output will be written to.
    GoogleCloudVisionV1p4beta1GcsDestination gcsDestination?;
};

# A word representation.
public type GoogleCloudVisionV1p1beta1Word record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p1beta1BoundingPoly boundingBox?;
    # Confidence of the OCR results for the word. Range [0, 1].
    float confidence?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p1beta1TextAnnotationTextProperty property?;
    # List of symbols in the word. The order of the symbols follows the natural reading order.
    GoogleCloudVisionV1p1beta1Symbol[] symbols?;
};

# Request for performing Google Cloud Vision API tasks over a user-provided image, with user-requested features, and with context information.
public type AnnotateImageRequest record {
    # Requested features.
    Feature[] features?;
    # Client image to perform Google Cloud Vision API tasks over.
    Image image?;
    # Image context and/or feature-specific parameters.
    ImageContext imageContext?;
};

# Contains metadata for the BatchAnnotateImages operation.
public type GoogleCloudVisionV1p2beta1OperationMetadata record {
    # The time when the batch request was received.
    string createTime?;
    # Current state of the batch operation.
    string state?;
    # The time when the operation result was last updated.
    string updateTime?;
};

# Response to an async batch file annotation request.
public type GoogleCloudVisionV1p1beta1AsyncBatchAnnotateFilesResponse record {
    # The list of file annotation responses, one for each request in AsyncBatchAnnotateFilesRequest.
    GoogleCloudVisionV1p1beta1AsyncAnnotateFileResponse[] responses?;
};

# Response to a single file annotation request. A file may contain one or more images, which individually have their own responses.
public type AnnotateFileResponse record {
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status 'error?;
    # The desired input location and metadata.
    InputConfig inputConfig?;
    # Individual responses to images found within the file. This field will be empty if the `error` field is set.
    AnnotateImageResponse[] responses?;
    # This field gives the total number of pages in the file.
    int totalPages?;
};

# A request to annotate one single file, e.g. a PDF, TIFF or GIF file.
public type AnnotateFileRequest record {
    # Required. Requested features.
    Feature[] features?;
    # Image context and/or feature-specific parameters.
    ImageContext imageContext?;
    # The desired input location and metadata.
    InputConfig inputConfig?;
    # Pages of the file to perform image annotation. Pages starts from 1, we assume the first page of the file is page 1. At most 5 pages are supported per request. Pages can be negative. Page 1 means the first page. Page 2 means the second page. Page -1 means the last page. Page -2 means the second to the last page. If the file is GIF instead of PDF or TIFF, page refers to GIF frames. If this field is empty, by default the service performs image annotation for the first 5 pages of the file.
    int[] pages?;
};

# Response to an image annotation request.
public type GoogleCloudVisionV1p1beta1AnnotateImageResponse record {
    # If an image was produced from a file (e.g. a PDF), this message gives information about the source of that image.
    GoogleCloudVisionV1p1beta1ImageAnnotationContext context?;
    # Set of crop hints that are used to generate new crops when serving images.
    GoogleCloudVisionV1p1beta1CropHintsAnnotation cropHintsAnnotation?;
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status 'error?;
    # If present, face detection has completed successfully.
    GoogleCloudVisionV1p1beta1FaceAnnotation[] faceAnnotations?;
    # TextAnnotation contains a structured representation of OCR extracted text. The hierarchy of an OCR extracted text structure is like this: TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol Each structural component, starting from Page, may further have their own properties. Properties describe detected languages, breaks etc.. Please refer to the TextAnnotation.TextProperty message definition below for more detail.
    GoogleCloudVisionV1p1beta1TextAnnotation fullTextAnnotation?;
    # Stores image properties, such as dominant colors.
    GoogleCloudVisionV1p1beta1ImageProperties imagePropertiesAnnotation?;
    # If present, label detection has completed successfully.
    GoogleCloudVisionV1p1beta1EntityAnnotation[] labelAnnotations?;
    # If present, landmark detection has completed successfully.
    GoogleCloudVisionV1p1beta1EntityAnnotation[] landmarkAnnotations?;
    # If present, localized object detection has completed successfully. This will be sorted descending by confidence score.
    GoogleCloudVisionV1p1beta1LocalizedObjectAnnotation[] localizedObjectAnnotations?;
    # If present, logo detection has completed successfully.
    GoogleCloudVisionV1p1beta1EntityAnnotation[] logoAnnotations?;
    # Results for a product search request.
    GoogleCloudVisionV1p1beta1ProductSearchResults productSearchResults?;
    # Set of features pertaining to the image, computed by computer vision methods over safe-search verticals (for example, adult, spoof, medical, violence).
    GoogleCloudVisionV1p1beta1SafeSearchAnnotation safeSearchAnnotation?;
    # If present, text (OCR) detection has completed successfully.
    GoogleCloudVisionV1p1beta1EntityAnnotation[] textAnnotations?;
    # Relevant information for the image from the Internet.
    GoogleCloudVisionV1p1beta1WebDetection webDetection?;
};

# A product label represented as a key-value pair.
public type GoogleCloudVisionV1p2beta1ProductKeyValue record {
    # The key of the label attached to the product. Cannot be empty and cannot exceed 128 bytes.
    string 'key?;
    # The value of the label attached to the product. Cannot be empty and cannot exceed 128 bytes.
    string value?;
};

# Detected start or end of a structural component.
public type GoogleCloudVisionV1p1beta1TextAnnotationDetectedBreak record {
    # True if break prepends the element.
    boolean isPrefix?;
    # Detected break type.
    string 'type?;
};

# Detected entity location information.
public type GoogleCloudVisionV1p3beta1LocationInfo record {
    # An object that represents a latitude/longitude pair. This is expressed as a pair of doubles to represent degrees latitude and degrees longitude. Unless specified otherwise, this object must conform to the WGS84 standard. Values must be within normalized ranges.
    LatLng latLng?;
};

# Information about a face's identity.
public type GoogleCloudVisionV1p4beta1FaceRecognitionResult record {
    # A Celebrity is a group of Faces with an identity.
    GoogleCloudVisionV1p4beta1Celebrity celebrity?;
    # Recognition confidence. Range [0, 1].
    float confidence?;
};

# Detected page from OCR.
public type GoogleCloudVisionV1p4beta1Page record {
    # List of blocks of text, images etc on this page.
    GoogleCloudVisionV1p4beta1Block[] blocks?;
    # Confidence of the OCR results on the page. Range [0, 1].
    float confidence?;
    # Page height. For PDFs the unit is points. For images (including TIFFs) the unit is pixels.
    int height?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p4beta1TextAnnotationTextProperty property?;
    # Page width. For PDFs the unit is points. For images (including TIFFs) the unit is pixels.
    int width?;
};

# Response to an image annotation request.
public type GoogleCloudVisionV1p3beta1AnnotateImageResponse record {
    # If an image was produced from a file (e.g. a PDF), this message gives information about the source of that image.
    GoogleCloudVisionV1p3beta1ImageAnnotationContext context?;
    # Set of crop hints that are used to generate new crops when serving images.
    GoogleCloudVisionV1p3beta1CropHintsAnnotation cropHintsAnnotation?;
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status 'error?;
    # If present, face detection has completed successfully.
    GoogleCloudVisionV1p3beta1FaceAnnotation[] faceAnnotations?;
    # TextAnnotation contains a structured representation of OCR extracted text. The hierarchy of an OCR extracted text structure is like this: TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol Each structural component, starting from Page, may further have their own properties. Properties describe detected languages, breaks etc.. Please refer to the TextAnnotation.TextProperty message definition below for more detail.
    GoogleCloudVisionV1p3beta1TextAnnotation fullTextAnnotation?;
    # Stores image properties, such as dominant colors.
    GoogleCloudVisionV1p3beta1ImageProperties imagePropertiesAnnotation?;
    # If present, label detection has completed successfully.
    GoogleCloudVisionV1p3beta1EntityAnnotation[] labelAnnotations?;
    # If present, landmark detection has completed successfully.
    GoogleCloudVisionV1p3beta1EntityAnnotation[] landmarkAnnotations?;
    # If present, localized object detection has completed successfully. This will be sorted descending by confidence score.
    GoogleCloudVisionV1p3beta1LocalizedObjectAnnotation[] localizedObjectAnnotations?;
    # If present, logo detection has completed successfully.
    GoogleCloudVisionV1p3beta1EntityAnnotation[] logoAnnotations?;
    # Results for a product search request.
    GoogleCloudVisionV1p3beta1ProductSearchResults productSearchResults?;
    # Set of features pertaining to the image, computed by computer vision methods over safe-search verticals (for example, adult, spoof, medical, violence).
    GoogleCloudVisionV1p3beta1SafeSearchAnnotation safeSearchAnnotation?;
    # If present, text (OCR) detection has completed successfully.
    GoogleCloudVisionV1p3beta1EntityAnnotation[] textAnnotations?;
    # Relevant information for the image from the Internet.
    GoogleCloudVisionV1p3beta1WebDetection webDetection?;
};

# Represents a color in the RGBA color space. This representation is designed for simplicity of conversion to/from color representations in various languages over compactness. For example, the fields of this representation can be trivially provided to the constructor of `java.awt.Color` in Java; it can also be trivially provided to UIColor's `+colorWithRed:green:blue:alpha` method in iOS; and, with just a little work, it can be easily formatted into a CSS `rgba()` string in JavaScript. This reference page doesn't carry information about the absolute color space that should be used to interpret the RGB value (e.g. sRGB, Adobe RGB, DCI-P3, BT.2020, etc.). By default, applications should assume the sRGB color space. When color equality needs to be decided, implementations, unless documented otherwise, treat two colors as equal if all their red, green, blue, and alpha values each differ by at most 1e-5. Example (Java): import com.google.type.Color; // ... public static java.awt.Color fromProto(Color protocolor) { float alpha = protocolor.hasAlpha() ? protocolor.getAlpha().getValue() : 1.0; return new java.awt.Color( protocolor.getRed(), protocolor.getGreen(), protocolor.getBlue(), alpha); } public static Color toProto(java.awt.Color color) { float red = (float) color.getRed(); float green = (float) color.getGreen(); float blue = (float) color.getBlue(); float denominator = 255.0; Color.Builder resultBuilder = Color .newBuilder() .setRed(red / denominator) .setGreen(green / denominator) .setBlue(blue / denominator); int alpha = color.getAlpha(); if (alpha != 255) { result.setAlpha( FloatValue .newBuilder() .setValue(((float) alpha) / denominator) .build()); } return resultBuilder.build(); } // ... Example (iOS / Obj-C): // ... static UIColor* fromProto(Color* protocolor) { float red = [protocolor red]; float green = [protocolor green]; float blue = [protocolor blue]; FloatValue* alpha_wrapper = [protocolor alpha]; float alpha = 1.0; if (alpha_wrapper != nil) { alpha = [alpha_wrapper value]; } return [UIColor colorWithRed:red green:green blue:blue alpha:alpha]; } static Color* toProto(UIColor* color) { CGFloat red, green, blue, alpha; if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) { return nil; } Color* result = [[Color alloc] init]; [result setRed:red]; [result setGreen:green]; [result setBlue:blue]; if (alpha <= 0.9999) { [result setAlpha:floatWrapperWithValue(alpha)]; } [result autorelease]; return result; } // ... Example (JavaScript): // ... var protoToCssColor = function(rgb_color) { var redFrac = rgb_color.red || 0.0; var greenFrac = rgb_color.green || 0.0; var blueFrac = rgb_color.blue || 0.0; var red = Math.floor(redFrac * 255); var green = Math.floor(greenFrac * 255); var blue = Math.floor(blueFrac * 255); if (!('alpha' in rgb_color)) { return rgbToCssColor(red, green, blue); } var alphaFrac = rgb_color.alpha.value || 0.0; var rgbParams = [red, green, blue].join(','); return ['rgba(', rgbParams, ',', alphaFrac, ')'].join(''); }; var rgbToCssColor = function(red, green, blue) { var rgbNumber = new Number((red << 16) | (green << 8) | blue); var hexString = rgbNumber.toString(16); var missingZeros = 6 - hexString.length; var resultBuilder = ['#']; for (var i = 0; i < missingZeros; i++) { resultBuilder.push('0'); } resultBuilder.push(hexString); return resultBuilder.join(''); }; // ...
public type Color record {
    # The fraction of this color that should be applied to the pixel. That is, the final pixel color is defined by the equation: `pixel color = alpha * (this color) + (1.0 - alpha) * (background color)` This means that a value of 1.0 corresponds to a solid color, whereas a value of 0.0 corresponds to a completely transparent color. This uses a wrapper message rather than a simple float scalar so that it is possible to distinguish between a default value and the value being unset. If omitted, this color object is rendered as a solid color (as if the alpha value had been explicitly given a value of 1.0).
    float alpha?;
    # The amount of blue in the color as a value in the interval [0, 1].
    float blue?;
    # The amount of green in the color as a value in the interval [0, 1].
    float green?;
    # The amount of red in the color as a value in the interval [0, 1].
    float red?;
};

# A vertex represents a 2D point in the image. NOTE: the normalized vertex coordinates are relative to the original image and range from 0 to 1.
public type GoogleCloudVisionV1p4beta1NormalizedVertex record {
    # X coordinate.
    float x?;
    # Y coordinate.
    float y?;
};

# Response message for the `ListProductsInProductSet` method.
public type ListProductsInProductSetResponse record {
    # Token to retrieve the next page of results, or empty if there are no more results in the list.
    string nextPageToken?;
    # The list of Products.
    Product[] products?;
};

# Response to a single file annotation request. A file may contain one or more images, which individually have their own responses.
public type GoogleCloudVisionV1p3beta1AnnotateFileResponse record {
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status 'error?;
    # The desired input location and metadata.
    GoogleCloudVisionV1p3beta1InputConfig inputConfig?;
    # Individual responses to images found within the file. This field will be empty if the `error` field is set.
    GoogleCloudVisionV1p3beta1AnnotateImageResponse[] responses?;
    # This field gives the total number of pages in the file.
    int totalPages?;
};

# Parameters for a product search request.
public type ProductSearchParams record {
    # A bounding polygon for the detected image annotation.
    BoundingPoly boundingPoly?;
    # The filtering expression. This can be used to restrict search results based on Product labels. We currently support an AND of OR of key-value expressions, where each expression within an OR must have the same key. An '=' should be used to connect the key and value. For example, "(color = red OR color = blue) AND brand = Google" is acceptable, but "(color = red OR brand = Google)" is not acceptable. "color: red" is not acceptable because it uses a ':' instead of an '='.
    string filter?;
    # The list of product categories to search in. Currently, we only consider the first category, and either "homegoods-v2", "apparel-v2", "toys-v2", "packagedgoods-v1", or "general-v1" should be specified. The legacy categories "homegoods", "apparel", and "toys" are still supported but will be deprecated. For new products, please use "homegoods-v2", "apparel-v2", or "toys-v2" for better product search accuracy. It is recommended to migrate existing products to these categories as well.
    string[] productCategories?;
    # The resource name of a ProductSet to be searched for similar images. Format is: `projects/PROJECT_ID/locations/LOC_ID/productSets/PRODUCT_SET_ID`.
    string productSet?;
};

# Set of dominant colors and their corresponding scores.
public type GoogleCloudVisionV1p4beta1DominantColorsAnnotation record {
    # RGB color values with their score and pixel fraction.
    GoogleCloudVisionV1p4beta1ColorInfo[] colors?;
};

# Set of crop hints that are used to generate new crops when serving images.
public type GoogleCloudVisionV1p2beta1CropHintsAnnotation record {
    # Crop hint results.
    GoogleCloudVisionV1p2beta1CropHint[] cropHints?;
};

# An offline file annotation request.
public type AsyncAnnotateFileRequest record {
    # Required. Requested features.
    Feature[] features?;
    # Image context and/or feature-specific parameters.
    ImageContext imageContext?;
    # The desired input location and metadata.
    InputConfig inputConfig?;
    # The desired output location and metadata.
    OutputConfig outputConfig?;
};

# The Google Cloud Storage location where the output will be written to.
public type GcsDestination record {
    # Google Cloud Storage URI prefix where the results will be stored. Results will be in JSON format and preceded by its corresponding input URI prefix. This field can either represent a gcs file prefix or gcs directory. In either case, the uri should be unique because in order to get all of the output files, you will need to do a wildcard gcs search on the uri prefix you provide. Examples: * File Prefix: gs://bucket-name/here/filenameprefix The output files will be created in gs://bucket-name/here/ and the names of the output files will begin with "filenameprefix". * Directory Prefix: gs://bucket-name/some/location/ The output files will be created in gs://bucket-name/some/location/ and the names of the output files could be anything because there was no filename prefix specified. If multiple outputs, each response is still AnnotateFileResponse, each of which contains some subset of the full list of AnnotateImageResponse. Multiple outputs can happen if, for example, the output JSON is too large and overflows into multiple sharded files.
    string uri?;
};

# The desired input location and metadata.
public type GoogleCloudVisionV1p2beta1InputConfig record {
    # File content, represented as a stream of bytes. Note: As with all `bytes` fields, protobuffers use a pure binary representation, whereas JSON representations use base64. Currently, this field only works for BatchAnnotateFiles requests. It does not work for AsyncBatchAnnotateFiles requests.
    string content?;
    # The Google Cloud Storage location where the input will be read from.
    GoogleCloudVisionV1p2beta1GcsSource gcsSource?;
    # The type of the file. Currently only "application/pdf", "image/tiff" and "image/gif" are supported. Wildcards are not supported.
    string mimeType?;
};

# Metadata for online images.
public type GoogleCloudVisionV1p3beta1WebDetectionWebImage record {
    # (Deprecated) Overall relevancy score for the image.
    float score?;
    # The result image URL.
    string url?;
};

# Metadata for the batch operations such as the current state. This is included in the `metadata` field of the `Operation` returned by the `GetOperation` call of the `google::longrunning::Operations` service.
public type GoogleCloudVisionV1p3beta1BatchOperationMetadata record {
    # The time when the batch request is finished and google.longrunning.Operation.done is set to true.
    string endTime?;
    # The current state of the batch operation.
    string state?;
    # The time when the batch request was submitted to the server.
    string submitTime?;
};

# Single crop hint that is used to generate a new crop when serving an image.
public type GoogleCloudVisionV1p3beta1CropHint record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p3beta1BoundingPoly boundingPoly?;
    # Confidence of this being a salient region. Range [0, 1].
    float confidence?;
    # Fraction of importance of this salient region with respect to the original image.
    float importanceFraction?;
};

# Set of features pertaining to the image, computed by computer vision methods over safe-search verticals (for example, adult, spoof, medical, violence).
public type GoogleCloudVisionV1p3beta1SafeSearchAnnotation record {
    # Represents the adult content likelihood for the image. Adult content may contain elements such as nudity, pornographic images or cartoons, or sexual activities.
    string adult?;
    # Likelihood that this is a medical image.
    string medical?;
    # Likelihood that the request image contains racy content. Racy content may include (but is not limited to) skimpy or sheer clothing, strategically covered nudity, lewd or provocative poses, or close-ups of sensitive body areas.
    string racy?;
    # Spoof likelihood. The likelihood that an modification was made to the image's canonical version to make it appear funny or offensive.
    string spoof?;
    # Likelihood that this image contains violent content.
    string violence?;
};

# Additional information detected on the structural component.
public type GoogleCloudVisionV1p1beta1TextAnnotationTextProperty record {
    # Detected start or end of a structural component.
    GoogleCloudVisionV1p1beta1TextAnnotationDetectedBreak detectedBreak?;
    # A list of detected languages together with confidence.
    GoogleCloudVisionV1p1beta1TextAnnotationDetectedLanguage[] detectedLanguages?;
};

# The response for a single offline file annotation request.
public type AsyncAnnotateFileResponse record {
    # The desired output location and metadata.
    OutputConfig outputConfig?;
};

# A word representation.
public type GoogleCloudVisionV1p2beta1Word record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p2beta1BoundingPoly boundingBox?;
    # Confidence of the OCR results for the word. Range [0, 1].
    float confidence?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p2beta1TextAnnotationTextProperty property?;
    # List of symbols in the word. The order of the symbols follows the natural reading order.
    GoogleCloudVisionV1p2beta1Symbol[] symbols?;
};

# Set of features pertaining to the image, computed by computer vision methods over safe-search verticals (for example, adult, spoof, medical, violence).
public type GoogleCloudVisionV1p1beta1SafeSearchAnnotation record {
    # Represents the adult content likelihood for the image. Adult content may contain elements such as nudity, pornographic images or cartoons, or sexual activities.
    string adult?;
    # Likelihood that this is a medical image.
    string medical?;
    # Likelihood that the request image contains racy content. Racy content may include (but is not limited to) skimpy or sheer clothing, strategically covered nudity, lewd or provocative poses, or close-ups of sensitive body areas.
    string racy?;
    # Spoof likelihood. The likelihood that an modification was made to the image's canonical version to make it appear funny or offensive.
    string spoof?;
    # Likelihood that this image contains violent content.
    string violence?;
};

# The response for a single offline file annotation request.
public type GoogleCloudVisionV1p2beta1AsyncAnnotateFileResponse record {
    # The desired output location and metadata.
    GoogleCloudVisionV1p2beta1OutputConfig outputConfig?;
};

# Detected start or end of a structural component.
public type GoogleCloudVisionV1p3beta1TextAnnotationDetectedBreak record {
    # True if break prepends the element.
    boolean isPrefix?;
    # Detected break type.
    string 'type?;
};

# Set of detected entity features.
public type GoogleCloudVisionV1p2beta1EntityAnnotation record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p2beta1BoundingPoly boundingPoly?;
    # **Deprecated. Use `score` instead.** The accuracy of the entity detection in an image. For example, for an image in which the "Eiffel Tower" entity is detected, this field represents the confidence that there is a tower in the query image. Range [0, 1].
    float confidence?;
    # Entity textual description, expressed in its `locale` language.
    string description?;
    # The language code for the locale in which the entity textual `description` is expressed.
    string locale?;
    # The location information for the detected entity. Multiple `LocationInfo` elements can be present because one location may indicate the location of the scene in the image, and another location may indicate the location of the place where the image was taken. Location information is usually present for landmarks.
    GoogleCloudVisionV1p2beta1LocationInfo[] locations?;
    # Opaque entity ID. Some IDs may be available in [Google Knowledge Graph Search API](https://developers.google.com/knowledge-graph/).
    string mid?;
    # Some entities may have optional user-supplied `Property` (name/value) fields, such a score or string that qualifies the entity.
    GoogleCloudVisionV1p2beta1Property[] properties?;
    # Overall score of the result. Range [0, 1].
    float score?;
    # The relevancy of the ICA (Image Content Annotation) label to the image. For example, the relevancy of "tower" is likely higher to an image containing the detected "Eiffel Tower" than to an image containing a detected distant towering building, even though the confidence that there is a tower in each image may be the same. Range [0, 1].
    float topicality?;
};

# A generic empty message that you can re-use to avoid defining duplicated empty messages in your APIs. A typical example is to use it as the request or the response type of an API method. For instance: service Foo { rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty); } The JSON representation for `Empty` is empty JSON object `{}`.
public type Empty record {
};

# Additional information detected on the structural component.
public type GoogleCloudVisionV1p4beta1TextAnnotationTextProperty record {
    # Detected start or end of a structural component.
    GoogleCloudVisionV1p4beta1TextAnnotationDetectedBreak detectedBreak?;
    # A list of detected languages together with confidence.
    GoogleCloudVisionV1p4beta1TextAnnotationDetectedLanguage[] detectedLanguages?;
};

# Response to an image annotation request.
public type GoogleCloudVisionV1p4beta1AnnotateImageResponse record {
    # If an image was produced from a file (e.g. a PDF), this message gives information about the source of that image.
    GoogleCloudVisionV1p4beta1ImageAnnotationContext context?;
    # Set of crop hints that are used to generate new crops when serving images.
    GoogleCloudVisionV1p4beta1CropHintsAnnotation cropHintsAnnotation?;
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status 'error?;
    # If present, face detection has completed successfully.
    GoogleCloudVisionV1p4beta1FaceAnnotation[] faceAnnotations?;
    # TextAnnotation contains a structured representation of OCR extracted text. The hierarchy of an OCR extracted text structure is like this: TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol Each structural component, starting from Page, may further have their own properties. Properties describe detected languages, breaks etc.. Please refer to the TextAnnotation.TextProperty message definition below for more detail.
    GoogleCloudVisionV1p4beta1TextAnnotation fullTextAnnotation?;
    # Stores image properties, such as dominant colors.
    GoogleCloudVisionV1p4beta1ImageProperties imagePropertiesAnnotation?;
    # If present, label detection has completed successfully.
    GoogleCloudVisionV1p4beta1EntityAnnotation[] labelAnnotations?;
    # If present, landmark detection has completed successfully.
    GoogleCloudVisionV1p4beta1EntityAnnotation[] landmarkAnnotations?;
    # If present, localized object detection has completed successfully. This will be sorted descending by confidence score.
    GoogleCloudVisionV1p4beta1LocalizedObjectAnnotation[] localizedObjectAnnotations?;
    # If present, logo detection has completed successfully.
    GoogleCloudVisionV1p4beta1EntityAnnotation[] logoAnnotations?;
    # Results for a product search request.
    GoogleCloudVisionV1p4beta1ProductSearchResults productSearchResults?;
    # Set of features pertaining to the image, computed by computer vision methods over safe-search verticals (for example, adult, spoof, medical, violence).
    GoogleCloudVisionV1p4beta1SafeSearchAnnotation safeSearchAnnotation?;
    # If present, text (OCR) detection has completed successfully.
    GoogleCloudVisionV1p4beta1EntityAnnotation[] textAnnotations?;
    # Relevant information for the image from the Internet.
    GoogleCloudVisionV1p4beta1WebDetection webDetection?;
};

# A `Property` consists of a user-supplied name/value pair.
public type GoogleCloudVisionV1p2beta1Property record {
    # Name of the property.
    string name?;
    # Value of numeric properties.
    string uint64Value?;
    # Value of the property.
    string value?;
};

# Relevant information for the image from the Internet.
public type GoogleCloudVisionV1p4beta1WebDetection record {
    # The service's best guess as to the topic of the request image. Inferred from similar images on the open web.
    GoogleCloudVisionV1p4beta1WebDetectionWebLabel[] bestGuessLabels?;
    # Fully matching images from the Internet. Can include resized copies of the query image.
    GoogleCloudVisionV1p4beta1WebDetectionWebImage[] fullMatchingImages?;
    # Web pages containing the matching images from the Internet.
    GoogleCloudVisionV1p4beta1WebDetectionWebPage[] pagesWithMatchingImages?;
    # Partial matching images from the Internet. Those images are similar enough to share some key-point features. For example an original image will likely have partial matching for its crops.
    GoogleCloudVisionV1p4beta1WebDetectionWebImage[] partialMatchingImages?;
    # The visually similar image results.
    GoogleCloudVisionV1p4beta1WebDetectionWebImage[] visuallySimilarImages?;
    # Deduced entities from similar images on the Internet.
    GoogleCloudVisionV1p4beta1WebDetectionWebEntity[] webEntities?;
};

# Additional information detected on the structural component.
public type TextProperty record {
    # Detected start or end of a structural component.
    DetectedBreak detectedBreak?;
    # A list of detected languages together with confidence.
    DetectedLanguage[] detectedLanguages?;
};

# Metadata for web pages.
public type GoogleCloudVisionV1p4beta1WebDetectionWebPage record {
    # Fully matching images on the page. Can include resized copies of the query image.
    GoogleCloudVisionV1p4beta1WebDetectionWebImage[] fullMatchingImages?;
    # Title for the web page, may contain HTML markups.
    string pageTitle?;
    # Partial matching images on the page. Those images are similar enough to share some key-point features. For example an original image will likely have partial matching for its crops.
    GoogleCloudVisionV1p4beta1WebDetectionWebImage[] partialMatchingImages?;
    # (Deprecated) Overall relevancy score for the web page.
    float score?;
    # The result web page URL.
    string url?;
};

# A single symbol representation.
public type GoogleCloudVisionV1p3beta1Symbol record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p3beta1BoundingPoly boundingBox?;
    # Confidence of the OCR results for the symbol. Range [0, 1].
    float confidence?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p3beta1TextAnnotationTextProperty property?;
    # The actual UTF-8 representation of the symbol.
    string text?;
};

# Set of features pertaining to the image, computed by computer vision methods over safe-search verticals (for example, adult, spoof, medical, violence).
public type SafeSearchAnnotation record {
    # Represents the adult content likelihood for the image. Adult content may contain elements such as nudity, pornographic images or cartoons, or sexual activities.
    string adult?;
    # Likelihood that this is a medical image.
    string medical?;
    # Likelihood that the request image contains racy content. Racy content may include (but is not limited to) skimpy or sheer clothing, strategically covered nudity, lewd or provocative poses, or close-ups of sensitive body areas.
    string racy?;
    # Spoof likelihood. The likelihood that an modification was made to the image's canonical version to make it appear funny or offensive.
    string spoof?;
    # Likelihood that this image contains violent content.
    string violence?;
};

# Response message for the `ImportProductSets` method. This message is returned by the google.longrunning.Operations.GetOperation method in the returned google.longrunning.Operation.response field.
public type GoogleCloudVisionV1p4beta1ImportProductSetsResponse record {
    # The list of reference_images that are imported successfully.
    GoogleCloudVisionV1p4beta1ReferenceImage[] referenceImages?;
    # The rpc status for each ImportProductSet request, including both successes and errors. The number of statuses here matches the number of lines in the csv file, and statuses[i] stores the success or failure status of processing the i-th line of the csv, starting from line 0.
    Status[] statuses?;
};

# Additional information detected on the structural component.
public type GoogleCloudVisionV1p3beta1TextAnnotationTextProperty record {
    # Detected start or end of a structural component.
    GoogleCloudVisionV1p3beta1TextAnnotationDetectedBreak detectedBreak?;
    # A list of detected languages together with confidence.
    GoogleCloudVisionV1p3beta1TextAnnotationDetectedLanguage[] detectedLanguages?;
};

# Response message for the `ListProductSets` method.
public type ListProductSetsResponse record {
    # Token to retrieve the next page of results, or empty if there are no more results in the list.
    string nextPageToken?;
    # List of ProductSets.
    ProductSet[] productSets?;
};

# Results for a product search request.
public type GoogleCloudVisionV1p2beta1ProductSearchResults record {
    # Timestamp of the index which provided these results. Products added to the product set and products removed from the product set after this time are not reflected in the current results.
    string indexTime?;
    # List of results grouped by products detected in the query image. Each entry corresponds to one bounding polygon in the query image, and contains the matching products specific to that region. There may be duplicate product matches in the union of all the per-product results.
    GoogleCloudVisionV1p2beta1ProductSearchResultsGroupedResult[] productGroupedResults?;
    # List of results, one for each product match.
    GoogleCloudVisionV1p2beta1ProductSearchResultsResult[] results?;
};

# Request message for the `AddProductToProductSet` method.
public type AddProductToProductSetRequest record {
    # Required. The resource name for the Product to be added to this ProductSet. Format is: `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID`
    string product?;
};

# A 3D position in the image, used primarily for Face detection landmarks. A valid Position must have both x and y coordinates. The position coordinates are in the same scale as the original image.
public type GoogleCloudVisionV1p4beta1Position record {
    # X coordinate.
    float x?;
    # Y coordinate.
    float y?;
    # Z coordinate (or depth).
    float z?;
};

# Structural unit of text representing a number of words in certain order.
public type Paragraph record {
    # A bounding polygon for the detected image annotation.
    BoundingPoly boundingBox?;
    # Confidence of the OCR results for the paragraph. Range [0, 1].
    float confidence?;
    # Additional information detected on the structural component.
    TextProperty property?;
    # List of all words in this paragraph.
    Word[] words?;
};

# A list of file annotation responses.
public type BatchAnnotateFilesResponse record {
    # The list of file annotation responses, each response corresponding to each AnnotateFileRequest in BatchAnnotateFilesRequest.
    AnnotateFileResponse[] responses?;
};

# Structural unit of text representing a number of words in certain order.
public type GoogleCloudVisionV1p4beta1Paragraph record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p4beta1BoundingPoly boundingBox?;
    # Confidence of the OCR results for the paragraph. Range [0, 1].
    float confidence?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p4beta1TextAnnotationTextProperty property?;
    # List of all words in this paragraph.
    GoogleCloudVisionV1p4beta1Word[] words?;
};

# Additional information detected on the structural component.
public type GoogleCloudVisionV1p2beta1TextAnnotationTextProperty record {
    # Detected start or end of a structural component.
    GoogleCloudVisionV1p2beta1TextAnnotationDetectedBreak detectedBreak?;
    # A list of detected languages together with confidence.
    GoogleCloudVisionV1p2beta1TextAnnotationDetectedLanguage[] detectedLanguages?;
};

# Results for a product search request.
public type GoogleCloudVisionV1p4beta1ProductSearchResults record {
    # Timestamp of the index which provided these results. Products added to the product set and products removed from the product set after this time are not reflected in the current results.
    string indexTime?;
    # List of results grouped by products detected in the query image. Each entry corresponds to one bounding polygon in the query image, and contains the matching products specific to that region. There may be duplicate product matches in the union of all the per-product results.
    GoogleCloudVisionV1p4beta1ProductSearchResultsGroupedResult[] productGroupedResults?;
    # List of results, one for each product match.
    GoogleCloudVisionV1p4beta1ProductSearchResultsResult[] results?;
};

# Detected start or end of a structural component.
public type GoogleCloudVisionV1p2beta1TextAnnotationDetectedBreak record {
    # True if break prepends the element.
    boolean isPrefix?;
    # Detected break type.
    string 'type?;
};

# A vertex represents a 2D point in the image. NOTE: the vertex coordinates are in the same scale as the original image.
public type GoogleCloudVisionV1p1beta1Vertex record {
    # X coordinate.
    int x?;
    # Y coordinate.
    int y?;
};

# Multiple async file annotation requests are batched into a single service call.
public type AsyncBatchAnnotateFilesRequest record {
    # Optional. Target project and location to make a call. Format: `projects/{project-id}/locations/{location-id}`. If no parent is specified, a region will be chosen automatically. Supported location-ids: `us`: USA country only, `asia`: East asia areas, like Japan, Taiwan, `eu`: The European Union. Example: `projects/project-A/locations/eu`.
    string parent?;
    # Required. Individual async file annotation requests for this batch.
    AsyncAnnotateFileRequest[] requests?;
};

# A word representation.
public type Word record {
    # A bounding polygon for the detected image annotation.
    BoundingPoly boundingBox?;
    # Confidence of the OCR results for the word. Range [0, 1].
    float confidence?;
    # Additional information detected on the structural component.
    TextProperty property?;
    # List of symbols in the word. The order of the symbols follows the natural reading order.
    Symbol[] symbols?;
};

# Information about a product.
public type GoogleCloudVisionV1p1beta1ProductSearchResultsResult record {
    # The resource name of the image from the product that is the closest match to the query.
    string image?;
    # A Product contains ReferenceImages.
    GoogleCloudVisionV1p1beta1Product product?;
    # A confidence level on the match, ranging from 0 (no confidence) to 1 (full confidence).
    float score?;
};

# Metadata for the batch operations such as the current state. This is included in the `metadata` field of the `Operation` returned by the `GetOperation` call of the `google::longrunning::Operations` service.
public type BatchOperationMetadata record {
    # The time when the batch request is finished and google.longrunning.Operation.done is set to true.
    string endTime?;
    # The current state of the batch operation.
    string state?;
    # The time when the batch request was submitted to the server.
    string submitTime?;
};

# Entity deduced from similar images on the Internet.
public type WebEntity record {
    # Canonical description of the entity, in English.
    string description?;
    # Opaque entity ID.
    string entityId?;
    # Overall relevancy score for the entity. Not normalized and not comparable across different image queries.
    float score?;
};

# Set of detected objects with bounding boxes.
public type GoogleCloudVisionV1p1beta1LocalizedObjectAnnotation record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p1beta1BoundingPoly boundingPoly?;
    # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
    # Object ID that should align with EntityAnnotation mid.
    string mid?;
    # Object name, expressed in its `language_code` language.
    string name?;
    # Score of the result. Range [0, 1].
    float score?;
};

# Results for a product search request.
public type ProductSearchResults record {
    # Timestamp of the index which provided these results. Products added to the product set and products removed from the product set after this time are not reflected in the current results.
    string indexTime?;
    # List of results grouped by products detected in the query image. Each entry corresponds to one bounding polygon in the query image, and contains the matching products specific to that region. There may be duplicate product matches in the union of all the per-product results.
    GroupedResult[] productGroupedResults?;
    # List of results, one for each product match.
    Result[] results?;
};

# Client image to perform Google Cloud Vision API tasks over.
public type Image record {
    # Image content, represented as a stream of bytes. Note: As with all `bytes` fields, protobuffers use a pure binary representation, whereas JSON representations use base64. Currently, this field only works for BatchAnnotateImages requests. It does not work for AsyncBatchAnnotateImages requests.
    string content?;
    # External image source (Google Cloud Storage or web URL image location).
    ImageSource 'source?;
};

# Response to a single file annotation request. A file may contain one or more images, which individually have their own responses.
public type GoogleCloudVisionV1p1beta1AnnotateFileResponse record {
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status 'error?;
    # The desired input location and metadata.
    GoogleCloudVisionV1p1beta1InputConfig inputConfig?;
    # Individual responses to images found within the file. This field will be empty if the `error` field is set.
    GoogleCloudVisionV1p1beta1AnnotateImageResponse[] responses?;
    # This field gives the total number of pages in the file.
    int totalPages?;
};

# Detected entity location information.
public type GoogleCloudVisionV1p4beta1LocationInfo record {
    # An object that represents a latitude/longitude pair. This is expressed as a pair of doubles to represent degrees latitude and degrees longitude. Unless specified otherwise, this object must conform to the WGS84 standard. Values must be within normalized ranges.
    LatLng latLng?;
};

# Prediction for what the object in the bounding box is.
public type ObjectAnnotation record {
    # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
    # Object ID that should align with EntityAnnotation mid.
    string mid?;
    # Object name, expressed in its `language_code` language.
    string name?;
    # Score of the result. Range [0, 1].
    float score?;
};

# A bounding polygon for the detected image annotation.
public type GoogleCloudVisionV1p4beta1BoundingPoly record {
    # The bounding polygon normalized vertices.
    GoogleCloudVisionV1p4beta1NormalizedVertex[] normalizedVertices?;
    # The bounding polygon vertices.
    GoogleCloudVisionV1p4beta1Vertex[] vertices?;
};

# Set of crop hints that are used to generate new crops when serving images.
public type CropHintsAnnotation record {
    # Crop hint results.
    CropHint[] cropHints?;
};

# A `Property` consists of a user-supplied name/value pair.
public type GoogleCloudVisionV1p1beta1Property record {
    # Name of the property.
    string name?;
    # Value of numeric properties.
    string uint64Value?;
    # Value of the property.
    string value?;
};

# Logical element on the page.
public type GoogleCloudVisionV1p2beta1Block record {
    # Detected block type (text, image etc) for this block.
    string blockType?;
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p2beta1BoundingPoly boundingBox?;
    # Confidence of the OCR results on the block. Range [0, 1].
    float confidence?;
    # List of paragraphs in this block (if this blocks is of type text).
    GoogleCloudVisionV1p2beta1Paragraph[] paragraphs?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p2beta1TextAnnotationTextProperty property?;
};

# A vertex represents a 2D point in the image. NOTE: the vertex coordinates are in the same scale as the original image.
public type GoogleCloudVisionV1p3beta1Vertex record {
    # X coordinate.
    int x?;
    # Y coordinate.
    int y?;
};

# A word representation.
public type GoogleCloudVisionV1p4beta1Word record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p4beta1BoundingPoly boundingBox?;
    # Confidence of the OCR results for the word. Range [0, 1].
    float confidence?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p4beta1TextAnnotationTextProperty property?;
    # List of symbols in the word. The order of the symbols follows the natural reading order.
    GoogleCloudVisionV1p4beta1Symbol[] symbols?;
};

# If an image was produced from a file (e.g. a PDF), this message gives information about the source of that image.
public type GoogleCloudVisionV1p2beta1ImageAnnotationContext record {
    # If the file was a PDF or TIFF, this field gives the page number within the file used to produce the image.
    int pageNumber?;
    # The URI of the file used to produce the image.
    string uri?;
};

# The input content for the `ImportProductSets` method.
public type ImportProductSetsInputConfig record {
    # The Google Cloud Storage location for a csv file which preserves a list of ImportProductSetRequests in each line.
    ImportProductSetsGcsSource gcsSource?;
};

# The desired output location and metadata.
public type GoogleCloudVisionV1p3beta1OutputConfig record {
    # The max number of response protos to put into each output JSON file on Google Cloud Storage. The valid range is [1, 100]. If not specified, the default value is 20. For example, for one pdf file with 100 pages, 100 response protos will be generated. If `batch_size` = 20, then 5 json files each containing 20 response protos will be written under the prefix `gcs_destination`.`uri`. Currently, batch_size only applies to GcsDestination, with potential future support for other output configurations.
    int batchSize?;
    # The Google Cloud Storage location where the output will be written to.
    GoogleCloudVisionV1p3beta1GcsDestination gcsDestination?;
};

# Detected language for a structural component.
public type GoogleCloudVisionV1p4beta1TextAnnotationDetectedLanguage record {
    # Confidence of detected language. Range [0, 1].
    float confidence?;
    # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
};

# Detected start or end of a structural component.
public type GoogleCloudVisionV1p4beta1TextAnnotationDetectedBreak record {
    # True if break prepends the element.
    boolean isPrefix?;
    # Detected break type.
    string 'type?;
};

# A 3D position in the image, used primarily for Face detection landmarks. A valid Position must have both x and y coordinates. The position coordinates are in the same scale as the original image.
public type Position record {
    # X coordinate.
    float x?;
    # Y coordinate.
    float y?;
    # Z coordinate (or depth).
    float z?;
};

# Detected language for a structural component.
public type DetectedLanguage record {
    # Confidence of detected language. Range [0, 1].
    float confidence?;
    # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
};

# A face-specific landmark (for example, a face feature).
public type GoogleCloudVisionV1p1beta1FaceAnnotationLandmark record {
    # A 3D position in the image, used primarily for Face detection landmarks. A valid Position must have both x and y coordinates. The position coordinates are in the same scale as the original image.
    GoogleCloudVisionV1p1beta1Position position?;
    # Face landmark type.
    string 'type?;
};

# Metadata for online images.
public type GoogleCloudVisionV1p1beta1WebDetectionWebImage record {
    # (Deprecated) Overall relevancy score for the image.
    float score?;
    # The result image URL.
    string url?;
};

# Relevant information for the image from the Internet.
public type GoogleCloudVisionV1p3beta1WebDetection record {
    # The service's best guess as to the topic of the request image. Inferred from similar images on the open web.
    GoogleCloudVisionV1p3beta1WebDetectionWebLabel[] bestGuessLabels?;
    # Fully matching images from the Internet. Can include resized copies of the query image.
    GoogleCloudVisionV1p3beta1WebDetectionWebImage[] fullMatchingImages?;
    # Web pages containing the matching images from the Internet.
    GoogleCloudVisionV1p3beta1WebDetectionWebPage[] pagesWithMatchingImages?;
    # Partial matching images from the Internet. Those images are similar enough to share some key-point features. For example an original image will likely have partial matching for its crops.
    GoogleCloudVisionV1p3beta1WebDetectionWebImage[] partialMatchingImages?;
    # The visually similar image results.
    GoogleCloudVisionV1p3beta1WebDetectionWebImage[] visuallySimilarImages?;
    # Deduced entities from similar images on the Internet.
    GoogleCloudVisionV1p3beta1WebDetectionWebEntity[] webEntities?;
};

# A list of file annotation responses.
public type GoogleCloudVisionV1p4beta1BatchAnnotateFilesResponse record {
    # The list of file annotation responses, each response corresponding to each AnnotateFileRequest in BatchAnnotateFilesRequest.
    GoogleCloudVisionV1p4beta1AnnotateFileResponse[] responses?;
};

# Detected start or end of a structural component.
public type DetectedBreak record {
    # True if break prepends the element.
    boolean isPrefix?;
    # Detected break type.
    string 'type?;
};

# Metadata for online images.
public type GoogleCloudVisionV1p4beta1WebDetectionWebImage record {
    # (Deprecated) Overall relevancy score for the image.
    float score?;
    # The result image URL.
    string url?;
};

# Single crop hint that is used to generate a new crop when serving an image.
public type GoogleCloudVisionV1p1beta1CropHint record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p1beta1BoundingPoly boundingPoly?;
    # Confidence of this being a salient region. Range [0, 1].
    float confidence?;
    # Fraction of importance of this salient region with respect to the original image.
    float importanceFraction?;
};

# Response to an image annotation request.
public type GoogleCloudVisionV1p2beta1AnnotateImageResponse record {
    # If an image was produced from a file (e.g. a PDF), this message gives information about the source of that image.
    GoogleCloudVisionV1p2beta1ImageAnnotationContext context?;
    # Set of crop hints that are used to generate new crops when serving images.
    GoogleCloudVisionV1p2beta1CropHintsAnnotation cropHintsAnnotation?;
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status 'error?;
    # If present, face detection has completed successfully.
    GoogleCloudVisionV1p2beta1FaceAnnotation[] faceAnnotations?;
    # TextAnnotation contains a structured representation of OCR extracted text. The hierarchy of an OCR extracted text structure is like this: TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol Each structural component, starting from Page, may further have their own properties. Properties describe detected languages, breaks etc.. Please refer to the TextAnnotation.TextProperty message definition below for more detail.
    GoogleCloudVisionV1p2beta1TextAnnotation fullTextAnnotation?;
    # Stores image properties, such as dominant colors.
    GoogleCloudVisionV1p2beta1ImageProperties imagePropertiesAnnotation?;
    # If present, label detection has completed successfully.
    GoogleCloudVisionV1p2beta1EntityAnnotation[] labelAnnotations?;
    # If present, landmark detection has completed successfully.
    GoogleCloudVisionV1p2beta1EntityAnnotation[] landmarkAnnotations?;
    # If present, localized object detection has completed successfully. This will be sorted descending by confidence score.
    GoogleCloudVisionV1p2beta1LocalizedObjectAnnotation[] localizedObjectAnnotations?;
    # If present, logo detection has completed successfully.
    GoogleCloudVisionV1p2beta1EntityAnnotation[] logoAnnotations?;
    # Results for a product search request.
    GoogleCloudVisionV1p2beta1ProductSearchResults productSearchResults?;
    # Set of features pertaining to the image, computed by computer vision methods over safe-search verticals (for example, adult, spoof, medical, violence).
    GoogleCloudVisionV1p2beta1SafeSearchAnnotation safeSearchAnnotation?;
    # If present, text (OCR) detection has completed successfully.
    GoogleCloudVisionV1p2beta1EntityAnnotation[] textAnnotations?;
    # Relevant information for the image from the Internet.
    GoogleCloudVisionV1p2beta1WebDetection webDetection?;
};

# Response to a single file annotation request. A file may contain one or more images, which individually have their own responses.
public type GoogleCloudVisionV1p4beta1AnnotateFileResponse record {
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status 'error?;
    # The desired input location and metadata.
    GoogleCloudVisionV1p4beta1InputConfig inputConfig?;
    # Individual responses to images found within the file. This field will be empty if the `error` field is set.
    GoogleCloudVisionV1p4beta1AnnotateImageResponse[] responses?;
    # This field gives the total number of pages in the file.
    int totalPages?;
};

# Set of detected objects with bounding boxes.
public type GoogleCloudVisionV1p4beta1LocalizedObjectAnnotation record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p4beta1BoundingPoly boundingPoly?;
    # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
    # Object ID that should align with EntityAnnotation mid.
    string mid?;
    # Object name, expressed in its `language_code` language.
    string name?;
    # Score of the result. Range [0, 1].
    float score?;
};

# Logical element on the page.
public type GoogleCloudVisionV1p3beta1Block record {
    # Detected block type (text, image etc) for this block.
    string blockType?;
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p3beta1BoundingPoly boundingBox?;
    # Confidence of the OCR results on the block. Range [0, 1].
    float confidence?;
    # List of paragraphs in this block (if this blocks is of type text).
    GoogleCloudVisionV1p3beta1Paragraph[] paragraphs?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p3beta1TextAnnotationTextProperty property?;
};

# A face-specific landmark (for example, a face feature).
public type GoogleCloudVisionV1p4beta1FaceAnnotationLandmark record {
    # A 3D position in the image, used primarily for Face detection landmarks. A valid Position must have both x and y coordinates. The position coordinates are in the same scale as the original image.
    GoogleCloudVisionV1p4beta1Position position?;
    # Face landmark type.
    string 'type?;
};

# Color information consists of RGB channels, score, and the fraction of the image that the color occupies in the image.
public type GoogleCloudVisionV1p1beta1ColorInfo record {
    # Represents a color in the RGBA color space. This representation is designed for simplicity of conversion to/from color representations in various languages over compactness. For example, the fields of this representation can be trivially provided to the constructor of `java.awt.Color` in Java; it can also be trivially provided to UIColor's `+colorWithRed:green:blue:alpha` method in iOS; and, with just a little work, it can be easily formatted into a CSS `rgba()` string in JavaScript. This reference page doesn't carry information about the absolute color space that should be used to interpret the RGB value (e.g. sRGB, Adobe RGB, DCI-P3, BT.2020, etc.). By default, applications should assume the sRGB color space. When color equality needs to be decided, implementations, unless documented otherwise, treat two colors as equal if all their red, green, blue, and alpha values each differ by at most 1e-5. Example (Java): import com.google.type.Color; // ... public static java.awt.Color fromProto(Color protocolor) { float alpha = protocolor.hasAlpha() ? protocolor.getAlpha().getValue() : 1.0; return new java.awt.Color( protocolor.getRed(), protocolor.getGreen(), protocolor.getBlue(), alpha); } public static Color toProto(java.awt.Color color) { float red = (float) color.getRed(); float green = (float) color.getGreen(); float blue = (float) color.getBlue(); float denominator = 255.0; Color.Builder resultBuilder = Color .newBuilder() .setRed(red / denominator) .setGreen(green / denominator) .setBlue(blue / denominator); int alpha = color.getAlpha(); if (alpha != 255) { result.setAlpha( FloatValue .newBuilder() .setValue(((float) alpha) / denominator) .build()); } return resultBuilder.build(); } // ... Example (iOS / Obj-C): // ... static UIColor* fromProto(Color* protocolor) { float red = [protocolor red]; float green = [protocolor green]; float blue = [protocolor blue]; FloatValue* alpha_wrapper = [protocolor alpha]; float alpha = 1.0; if (alpha_wrapper != nil) { alpha = [alpha_wrapper value]; } return [UIColor colorWithRed:red green:green blue:blue alpha:alpha]; } static Color* toProto(UIColor* color) { CGFloat red, green, blue, alpha; if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) { return nil; } Color* result = [[Color alloc] init]; [result setRed:red]; [result setGreen:green]; [result setBlue:blue]; if (alpha <= 0.9999) { [result setAlpha:floatWrapperWithValue(alpha)]; } [result autorelease]; return result; } // ... Example (JavaScript): // ... var protoToCssColor = function(rgb_color) { var redFrac = rgb_color.red || 0.0; var greenFrac = rgb_color.green || 0.0; var blueFrac = rgb_color.blue || 0.0; var red = Math.floor(redFrac * 255); var green = Math.floor(greenFrac * 255); var blue = Math.floor(blueFrac * 255); if (!('alpha' in rgb_color)) { return rgbToCssColor(red, green, blue); } var alphaFrac = rgb_color.alpha.value || 0.0; var rgbParams = [red, green, blue].join(','); return ['rgba(', rgbParams, ',', alphaFrac, ')'].join(''); }; var rgbToCssColor = function(red, green, blue) { var rgbNumber = new Number((red << 16) | (green << 8) | blue); var hexString = rgbNumber.toString(16); var missingZeros = 6 - hexString.length; var resultBuilder = ['#']; for (var i = 0; i < missingZeros; i++) { resultBuilder.push('0'); } resultBuilder.push(hexString); return resultBuilder.join(''); }; // ...
    Color color?;
    # The fraction of pixels the color occupies in the image. Value in range [0, 1].
    float pixelFraction?;
    # Image-specific score for this color. Value in range [0, 1].
    float score?;
};

# A `ReferenceImage` represents a product image and its associated metadata, such as bounding boxes.
public type ReferenceImage record {
    # Optional. Bounding polygons around the areas of interest in the reference image. If this field is empty, the system will try to detect regions of interest. At most 10 bounding polygons will be used. The provided shape is converted into a non-rotated rectangle. Once converted, the small edge of the rectangle must be greater than or equal to 300 pixels. The aspect ratio must be 1:4 or less (i.e. 1:3 is ok; 1:5 is not).
    BoundingPoly[] boundingPolys?;
    # The resource name of the reference image. Format is: `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID/referenceImages/IMAGE_ID`. This field is ignored when creating a reference image.
    string name?;
    # Required. The Google Cloud Storage URI of the reference image. The URI must start with `gs://`.
    string uri?;
};

# A vertex represents a 2D point in the image. NOTE: the vertex coordinates are in the same scale as the original image.
public type Vertex record {
    # X coordinate.
    int x?;
    # Y coordinate.
    int y?;
};

# A Product contains ReferenceImages.
public type GoogleCloudVisionV1p1beta1Product record {
    # User-provided metadata to be stored with this product. Must be at most 4096 characters long.
    string description?;
    # The user-provided name for this Product. Must not be empty. Must be at most 4096 characters long.
    string displayName?;
    # The resource name of the product. Format is: `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID`. This field is ignored when creating a product.
    string name?;
    # Immutable. The category for the product identified by the reference image. This should be one of "homegoods-v2", "apparel-v2", "toys-v2", "packagedgoods-v1" or "general-v1". The legacy categories "homegoods", "apparel", and "toys" are still supported, but these should not be used for new products.
    string productCategory?;
    # Key-value pairs that can be attached to a product. At query time, constraints can be specified based on the product_labels. Note that integer values can be provided as strings, e.g. "1199". Only strings with integer values can match a range-based restriction which is to be supported soon. Multiple values can be assigned to the same key. One product may have up to 500 product_labels. Notice that the total number of distinct product_labels over all products in one ProductSet cannot exceed 1M, otherwise the product search pipeline will refuse to work for that ProductSet.
    GoogleCloudVisionV1p1beta1ProductKeyValue[] productLabels?;
};

# A Product contains ReferenceImages.
public type GoogleCloudVisionV1p3beta1Product record {
    # User-provided metadata to be stored with this product. Must be at most 4096 characters long.
    string description?;
    # The user-provided name for this Product. Must not be empty. Must be at most 4096 characters long.
    string displayName?;
    # The resource name of the product. Format is: `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID`. This field is ignored when creating a product.
    string name?;
    # Immutable. The category for the product identified by the reference image. This should be one of "homegoods-v2", "apparel-v2", "toys-v2", "packagedgoods-v1" or "general-v1". The legacy categories "homegoods", "apparel", and "toys" are still supported, but these should not be used for new products.
    string productCategory?;
    # Key-value pairs that can be attached to a product. At query time, constraints can be specified based on the product_labels. Note that integer values can be provided as strings, e.g. "1199". Only strings with integer values can match a range-based restriction which is to be supported soon. Multiple values can be assigned to the same key. One product may have up to 500 product_labels. Notice that the total number of distinct product_labels over all products in one ProductSet cannot exceed 1M, otherwise the product search pipeline will refuse to work for that ProductSet.
    GoogleCloudVisionV1p3beta1ProductKeyValue[] productLabels?;
};

# A product label represented as a key-value pair.
public type KeyValue record {
    # The key of the label attached to the product. Cannot be empty and cannot exceed 128 bytes.
    string 'key?;
    # The value of the label attached to the product. Cannot be empty and cannot exceed 128 bytes.
    string value?;
};

# Detected language for a structural component.
public type GoogleCloudVisionV1p3beta1TextAnnotationDetectedLanguage record {
    # Confidence of detected language. Range [0, 1].
    float confidence?;
    # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
};

# The Google Cloud Storage location where the input will be read from.
public type GoogleCloudVisionV1p4beta1GcsSource record {
    # Google Cloud Storage URI for the input file. This must only be a Google Cloud Storage object. Wildcards are not currently supported.
    string uri?;
};

# A Product contains ReferenceImages.
public type GoogleCloudVisionV1p4beta1Product record {
    # User-provided metadata to be stored with this product. Must be at most 4096 characters long.
    string description?;
    # The user-provided name for this Product. Must not be empty. Must be at most 4096 characters long.
    string displayName?;
    # The resource name of the product. Format is: `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID`. This field is ignored when creating a product.
    string name?;
    # Immutable. The category for the product identified by the reference image. This should be one of "homegoods-v2", "apparel-v2", "toys-v2", "packagedgoods-v1" or "general-v1". The legacy categories "homegoods", "apparel", and "toys" are still supported, but these should not be used for new products.
    string productCategory?;
    # Key-value pairs that can be attached to a product. At query time, constraints can be specified based on the product_labels. Note that integer values can be provided as strings, e.g. "1199". Only strings with integer values can match a range-based restriction which is to be supported soon. Multiple values can be assigned to the same key. One product may have up to 500 product_labels. Notice that the total number of distinct product_labels over all products in one ProductSet cannot exceed 1M, otherwise the product search pipeline will refuse to work for that ProductSet.
    GoogleCloudVisionV1p4beta1ProductKeyValue[] productLabels?;
};

# Metadata for online images.
public type WebImage record {
    # (Deprecated) Overall relevancy score for the image.
    float score?;
    # The result image URL.
    string url?;
};

# A product label represented as a key-value pair.
public type GoogleCloudVisionV1p4beta1ProductKeyValue record {
    # The key of the label attached to the product. Cannot be empty and cannot exceed 128 bytes.
    string 'key?;
    # The value of the label attached to the product. Cannot be empty and cannot exceed 128 bytes.
    string value?;
};

# Detected page from OCR.
public type GoogleCloudVisionV1p2beta1Page record {
    # List of blocks of text, images etc on this page.
    GoogleCloudVisionV1p2beta1Block[] blocks?;
    # Confidence of the OCR results on the page. Range [0, 1].
    float confidence?;
    # Page height. For PDFs the unit is points. For images (including TIFFs) the unit is pixels.
    int height?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p2beta1TextAnnotationTextProperty property?;
    # Page width. For PDFs the unit is points. For images (including TIFFs) the unit is pixels.
    int width?;
};

# Metadata for the batch operations such as the current state. This is included in the `metadata` field of the `Operation` returned by the `GetOperation` call of the `google::longrunning::Operations` service.
public type GoogleCloudVisionV1p4beta1BatchOperationMetadata record {
    # The time when the batch request is finished and google.longrunning.Operation.done is set to true.
    string endTime?;
    # The current state of the batch operation.
    string state?;
    # The time when the batch request was submitted to the server.
    string submitTime?;
};

# Entity deduced from similar images on the Internet.
public type GoogleCloudVisionV1p2beta1WebDetectionWebEntity record {
    # Canonical description of the entity, in English.
    string description?;
    # Opaque entity ID.
    string entityId?;
    # Overall relevancy score for the entity. Not normalized and not comparable across different image queries.
    float score?;
};

# Logical element on the page.
public type GoogleCloudVisionV1p4beta1Block record {
    # Detected block type (text, image etc) for this block.
    string blockType?;
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p4beta1BoundingPoly boundingBox?;
    # Confidence of the OCR results on the block. Range [0, 1].
    float confidence?;
    # List of paragraphs in this block (if this blocks is of type text).
    GoogleCloudVisionV1p4beta1Paragraph[] paragraphs?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p4beta1TextAnnotationTextProperty property?;
};

# A face annotation object contains the results of face detection.
public type GoogleCloudVisionV1p4beta1FaceAnnotation record {
    # Anger likelihood.
    string angerLikelihood?;
    # Blurred likelihood.
    string blurredLikelihood?;
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p4beta1BoundingPoly boundingPoly?;
    # Detection confidence. Range [0, 1].
    float detectionConfidence?;
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p4beta1BoundingPoly fdBoundingPoly?;
    # Headwear likelihood.
    string headwearLikelihood?;
    # Joy likelihood.
    string joyLikelihood?;
    # Face landmarking confidence. Range [0, 1].
    float landmarkingConfidence?;
    # Detected face landmarks.
    GoogleCloudVisionV1p4beta1FaceAnnotationLandmark[] landmarks?;
    # Yaw angle, which indicates the leftward/rightward angle that the face is pointing relative to the vertical plane perpendicular to the image. Range [-180,180].
    float panAngle?;
    # Additional recognition information. Only computed if image_context.face_recognition_params is provided, **and** a match is found to a Celebrity in the input CelebritySet. This field is sorted in order of decreasing confidence values.
    GoogleCloudVisionV1p4beta1FaceRecognitionResult[] recognitionResult?;
    # Roll angle, which indicates the amount of clockwise/anti-clockwise rotation of the face relative to the image vertical about the axis perpendicular to the face. Range [-180,180].
    float rollAngle?;
    # Sorrow likelihood.
    string sorrowLikelihood?;
    # Surprise likelihood.
    string surpriseLikelihood?;
    # Pitch angle, which indicates the upwards/downwards angle that the face is pointing relative to the image's horizontal plane. Range [-180,180].
    float tiltAngle?;
    # Under-exposed likelihood.
    string underExposedLikelihood?;
};

# A face annotation object contains the results of face detection.
public type GoogleCloudVisionV1p2beta1FaceAnnotation record {
    # Anger likelihood.
    string angerLikelihood?;
    # Blurred likelihood.
    string blurredLikelihood?;
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p2beta1BoundingPoly boundingPoly?;
    # Detection confidence. Range [0, 1].
    float detectionConfidence?;
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p2beta1BoundingPoly fdBoundingPoly?;
    # Headwear likelihood.
    string headwearLikelihood?;
    # Joy likelihood.
    string joyLikelihood?;
    # Face landmarking confidence. Range [0, 1].
    float landmarkingConfidence?;
    # Detected face landmarks.
    GoogleCloudVisionV1p2beta1FaceAnnotationLandmark[] landmarks?;
    # Yaw angle, which indicates the leftward/rightward angle that the face is pointing relative to the vertical plane perpendicular to the image. Range [-180,180].
    float panAngle?;
    # Roll angle, which indicates the amount of clockwise/anti-clockwise rotation of the face relative to the image vertical about the axis perpendicular to the face. Range [-180,180].
    float rollAngle?;
    # Sorrow likelihood.
    string sorrowLikelihood?;
    # Surprise likelihood.
    string surpriseLikelihood?;
    # Pitch angle, which indicates the upwards/downwards angle that the face is pointing relative to the image's horizontal plane. Range [-180,180].
    float tiltAngle?;
    # Under-exposed likelihood.
    string underExposedLikelihood?;
};

# Response to an async batch image annotation request.
public type GoogleCloudVisionV1p4beta1AsyncBatchAnnotateImagesResponse record {
    # The desired output location and metadata.
    GoogleCloudVisionV1p4beta1OutputConfig outputConfig?;
};

# Config to control which ProductSet contains the Products to be deleted.
public type ProductSetPurgeConfig record {
    # The ProductSet that contains the Products to delete. If a Product is a member of product_set_id in addition to other ProductSets, the Product will still be deleted.
    string productSetId?;
};

# Contains metadata for the BatchAnnotateImages operation.
public type OperationMetadata record {
    # The time when the batch request was received.
    string createTime?;
    # Current state of the batch operation.
    string state?;
    # The time when the operation result was last updated.
    string updateTime?;
};

# TextAnnotation contains a structured representation of OCR extracted text. The hierarchy of an OCR extracted text structure is like this: TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol Each structural component, starting from Page, may further have their own properties. Properties describe detected languages, breaks etc.. Please refer to the TextAnnotation.TextProperty message definition below for more detail.
public type GoogleCloudVisionV1p2beta1TextAnnotation record {
    # List of pages detected by OCR.
    GoogleCloudVisionV1p2beta1Page[] pages?;
    # UTF-8 text detected on the pages.
    string text?;
};

# A `Property` consists of a user-supplied name/value pair.
public type Property record {
    # Name of the property.
    string name?;
    # Value of numeric properties.
    string uint64Value?;
    # Value of the property.
    string value?;
};

# A Product contains ReferenceImages.
public type GoogleCloudVisionV1p2beta1Product record {
    # User-provided metadata to be stored with this product. Must be at most 4096 characters long.
    string description?;
    # The user-provided name for this Product. Must not be empty. Must be at most 4096 characters long.
    string displayName?;
    # The resource name of the product. Format is: `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID`. This field is ignored when creating a product.
    string name?;
    # Immutable. The category for the product identified by the reference image. This should be one of "homegoods-v2", "apparel-v2", "toys-v2", "packagedgoods-v1" or "general-v1". The legacy categories "homegoods", "apparel", and "toys" are still supported, but these should not be used for new products.
    string productCategory?;
    # Key-value pairs that can be attached to a product. At query time, constraints can be specified based on the product_labels. Note that integer values can be provided as strings, e.g. "1199". Only strings with integer values can match a range-based restriction which is to be supported soon. Multiple values can be assigned to the same key. One product may have up to 500 product_labels. Notice that the total number of distinct product_labels over all products in one ProductSet cannot exceed 1M, otherwise the product search pipeline will refuse to work for that ProductSet.
    GoogleCloudVisionV1p2beta1ProductKeyValue[] productLabels?;
};

# Set of crop hints that are used to generate new crops when serving images.
public type GoogleCloudVisionV1p4beta1CropHintsAnnotation record {
    # Crop hint results.
    GoogleCloudVisionV1p4beta1CropHint[] cropHints?;
};

# Logical element on the page.
public type GoogleCloudVisionV1p1beta1Block record {
    # Detected block type (text, image etc) for this block.
    string blockType?;
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p1beta1BoundingPoly boundingBox?;
    # Confidence of the OCR results on the block. Range [0, 1].
    float confidence?;
    # List of paragraphs in this block (if this blocks is of type text).
    GoogleCloudVisionV1p1beta1Paragraph[] paragraphs?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p1beta1TextAnnotationTextProperty property?;
};

# Request for async image annotation for a list of images.
public type AsyncBatchAnnotateImagesRequest record {
    # The desired output location and metadata.
    OutputConfig outputConfig?;
    # Optional. Target project and location to make a call. Format: `projects/{project-id}/locations/{location-id}`. If no parent is specified, a region will be chosen automatically. Supported location-ids: `us`: USA country only, `asia`: East asia areas, like Japan, Taiwan, `eu`: The European Union. Example: `projects/project-A/locations/eu`.
    string parent?;
    # Required. Individual image annotation requests for this batch.
    AnnotateImageRequest[] requests?;
};

# Entity deduced from similar images on the Internet.
public type GoogleCloudVisionV1p3beta1WebDetectionWebEntity record {
    # Canonical description of the entity, in English.
    string description?;
    # Opaque entity ID.
    string entityId?;
    # Overall relevancy score for the entity. Not normalized and not comparable across different image queries.
    float score?;
};

# A 3D position in the image, used primarily for Face detection landmarks. A valid Position must have both x and y coordinates. The position coordinates are in the same scale as the original image.
public type GoogleCloudVisionV1p1beta1Position record {
    # X coordinate.
    float x?;
    # Y coordinate.
    float y?;
    # Z coordinate (or depth).
    float z?;
};

# The response for a single offline file annotation request.
public type GoogleCloudVisionV1p4beta1AsyncAnnotateFileResponse record {
    # The desired output location and metadata.
    GoogleCloudVisionV1p4beta1OutputConfig outputConfig?;
};

# Label to provide extra metadata for the web detection.
public type GoogleCloudVisionV1p1beta1WebDetectionWebLabel record {
    # Label for extra metadata.
    string label?;
    # The BCP-47 language code for `label`, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
};

# Information about the products similar to a single product in a query image.
public type GroupedResult record {
    # A bounding polygon for the detected image annotation.
    BoundingPoly boundingPoly?;
    # List of generic predictions for the object in the bounding box.
    ObjectAnnotation[] objectAnnotations?;
    # List of results, one for each product match.
    Result[] results?;
};

# A vertex represents a 2D point in the image. NOTE: the normalized vertex coordinates are relative to the original image and range from 0 to 1.
public type NormalizedVertex record {
    # X coordinate.
    float x?;
    # Y coordinate.
    float y?;
};

# Metadata for web pages.
public type GoogleCloudVisionV1p1beta1WebDetectionWebPage record {
    # Fully matching images on the page. Can include resized copies of the query image.
    GoogleCloudVisionV1p1beta1WebDetectionWebImage[] fullMatchingImages?;
    # Title for the web page, may contain HTML markups.
    string pageTitle?;
    # Partial matching images on the page. Those images are similar enough to share some key-point features. For example an original image will likely have partial matching for its crops.
    GoogleCloudVisionV1p1beta1WebDetectionWebImage[] partialMatchingImages?;
    # (Deprecated) Overall relevancy score for the web page.
    float score?;
    # The result web page URL.
    string url?;
};

# The Google Cloud Storage location where the output will be written to.
public type GoogleCloudVisionV1p3beta1GcsDestination record {
    # Google Cloud Storage URI prefix where the results will be stored. Results will be in JSON format and preceded by its corresponding input URI prefix. This field can either represent a gcs file prefix or gcs directory. In either case, the uri should be unique because in order to get all of the output files, you will need to do a wildcard gcs search on the uri prefix you provide. Examples: * File Prefix: gs://bucket-name/here/filenameprefix The output files will be created in gs://bucket-name/here/ and the names of the output files will begin with "filenameprefix". * Directory Prefix: gs://bucket-name/some/location/ The output files will be created in gs://bucket-name/some/location/ and the names of the output files could be anything because there was no filename prefix specified. If multiple outputs, each response is still AnnotateFileResponse, each of which contains some subset of the full list of AnnotateImageResponse. Multiple outputs can happen if, for example, the output JSON is too large and overflows into multiple sharded files.
    string uri?;
};

# Response to an async batch image annotation request.
public type AsyncBatchAnnotateImagesResponse record {
    # The desired output location and metadata.
    OutputConfig outputConfig?;
};

# Single crop hint that is used to generate a new crop when serving an image.
public type CropHint record {
    # A bounding polygon for the detected image annotation.
    BoundingPoly boundingPoly?;
    # Confidence of this being a salient region. Range [0, 1].
    float confidence?;
    # Fraction of importance of this salient region with respect to the original image.
    float importanceFraction?;
};

# A `ReferenceImage` represents a product image and its associated metadata, such as bounding boxes.
public type GoogleCloudVisionV1p4beta1ReferenceImage record {
    # Optional. Bounding polygons around the areas of interest in the reference image. If this field is empty, the system will try to detect regions of interest. At most 10 bounding polygons will be used. The provided shape is converted into a non-rotated rectangle. Once converted, the small edge of the rectangle must be greater than or equal to 300 pixels. The aspect ratio must be 1:4 or less (i.e. 1:3 is ok; 1:5 is not).
    GoogleCloudVisionV1p4beta1BoundingPoly[] boundingPolys?;
    # The resource name of the reference image. Format is: `projects/PROJECT_ID/locations/LOC_ID/products/PRODUCT_ID/referenceImages/IMAGE_ID`. This field is ignored when creating a reference image.
    string name?;
    # Required. The Google Cloud Storage URI of the reference image. The URI must start with `gs://`.
    string uri?;
};

# Label to provide extra metadata for the web detection.
public type GoogleCloudVisionV1p3beta1WebDetectionWebLabel record {
    # Label for extra metadata.
    string label?;
    # The BCP-47 language code for `label`, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
};

# Parameters for web detection request.
public type WebDetectionParams record {
    # Whether to include results derived from the geo information in the image.
    boolean includeGeoResults?;
};

# The Google Cloud Storage location where the input will be read from.
public type GcsSource record {
    # Google Cloud Storage URI for the input file. This must only be a Google Cloud Storage object. Wildcards are not currently supported.
    string uri?;
};

# Stores image properties, such as dominant colors.
public type GoogleCloudVisionV1p3beta1ImageProperties record {
    # Set of dominant colors and their corresponding scores.
    GoogleCloudVisionV1p3beta1DominantColorsAnnotation dominantColors?;
};

# Set of features pertaining to the image, computed by computer vision methods over safe-search verticals (for example, adult, spoof, medical, violence).
public type GoogleCloudVisionV1p2beta1SafeSearchAnnotation record {
    # Represents the adult content likelihood for the image. Adult content may contain elements such as nudity, pornographic images or cartoons, or sexual activities.
    string adult?;
    # Likelihood that this is a medical image.
    string medical?;
    # Likelihood that the request image contains racy content. Racy content may include (but is not limited to) skimpy or sheer clothing, strategically covered nudity, lewd or provocative poses, or close-ups of sensitive body areas.
    string racy?;
    # Spoof likelihood. The likelihood that an modification was made to the image's canonical version to make it appear funny or offensive.
    string spoof?;
    # Likelihood that this image contains violent content.
    string violence?;
};

# Stores image properties, such as dominant colors.
public type GoogleCloudVisionV1p4beta1ImageProperties record {
    # Set of dominant colors and their corresponding scores.
    GoogleCloudVisionV1p4beta1DominantColorsAnnotation dominantColors?;
};

# If an image was produced from a file (e.g. a PDF), this message gives information about the source of that image.
public type GoogleCloudVisionV1p3beta1ImageAnnotationContext record {
    # If the file was a PDF or TIFF, this field gives the page number within the file used to produce the image.
    int pageNumber?;
    # The URI of the file used to produce the image.
    string uri?;
};

# Information about a product.
public type Result record {
    # The resource name of the image from the product that is the closest match to the query.
    string image?;
    # A Product contains ReferenceImages.
    Product product?;
    # A confidence level on the match, ranging from 0 (no confidence) to 1 (full confidence).
    float score?;
};

# A `Property` consists of a user-supplied name/value pair.
public type GoogleCloudVisionV1p3beta1Property record {
    # Name of the property.
    string name?;
    # Value of numeric properties.
    string uint64Value?;
    # Value of the property.
    string value?;
};

# A face annotation object contains the results of face detection.
public type GoogleCloudVisionV1p1beta1FaceAnnotation record {
    # Anger likelihood.
    string angerLikelihood?;
    # Blurred likelihood.
    string blurredLikelihood?;
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p1beta1BoundingPoly boundingPoly?;
    # Detection confidence. Range [0, 1].
    float detectionConfidence?;
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p1beta1BoundingPoly fdBoundingPoly?;
    # Headwear likelihood.
    string headwearLikelihood?;
    # Joy likelihood.
    string joyLikelihood?;
    # Face landmarking confidence. Range [0, 1].
    float landmarkingConfidence?;
    # Detected face landmarks.
    GoogleCloudVisionV1p1beta1FaceAnnotationLandmark[] landmarks?;
    # Yaw angle, which indicates the leftward/rightward angle that the face is pointing relative to the vertical plane perpendicular to the image. Range [-180,180].
    float panAngle?;
    # Roll angle, which indicates the amount of clockwise/anti-clockwise rotation of the face relative to the image vertical about the axis perpendicular to the face. Range [-180,180].
    float rollAngle?;
    # Sorrow likelihood.
    string sorrowLikelihood?;
    # Surprise likelihood.
    string surpriseLikelihood?;
    # Pitch angle, which indicates the upwards/downwards angle that the face is pointing relative to the image's horizontal plane. Range [-180,180].
    float tiltAngle?;
    # Under-exposed likelihood.
    string underExposedLikelihood?;
};

# A vertex represents a 2D point in the image. NOTE: the normalized vertex coordinates are relative to the original image and range from 0 to 1.
public type GoogleCloudVisionV1p3beta1NormalizedVertex record {
    # X coordinate.
    float x?;
    # Y coordinate.
    float y?;
};

# Metadata for web pages.
public type GoogleCloudVisionV1p3beta1WebDetectionWebPage record {
    # Fully matching images on the page. Can include resized copies of the query image.
    GoogleCloudVisionV1p3beta1WebDetectionWebImage[] fullMatchingImages?;
    # Title for the web page, may contain HTML markups.
    string pageTitle?;
    # Partial matching images on the page. Those images are similar enough to share some key-point features. For example an original image will likely have partial matching for its crops.
    GoogleCloudVisionV1p3beta1WebDetectionWebImage[] partialMatchingImages?;
    # (Deprecated) Overall relevancy score for the web page.
    float score?;
    # The result web page URL.
    string url?;
};

# The response message for Operations.ListOperations.
public type ListOperationsResponse record {
    # The standard List next-page token.
    string nextPageToken?;
    # A list of operations that matches the specified filter in the request.
    Operation[] operations?;
};

# Color information consists of RGB channels, score, and the fraction of the image that the color occupies in the image.
public type GoogleCloudVisionV1p2beta1ColorInfo record {
    # Represents a color in the RGBA color space. This representation is designed for simplicity of conversion to/from color representations in various languages over compactness. For example, the fields of this representation can be trivially provided to the constructor of `java.awt.Color` in Java; it can also be trivially provided to UIColor's `+colorWithRed:green:blue:alpha` method in iOS; and, with just a little work, it can be easily formatted into a CSS `rgba()` string in JavaScript. This reference page doesn't carry information about the absolute color space that should be used to interpret the RGB value (e.g. sRGB, Adobe RGB, DCI-P3, BT.2020, etc.). By default, applications should assume the sRGB color space. When color equality needs to be decided, implementations, unless documented otherwise, treat two colors as equal if all their red, green, blue, and alpha values each differ by at most 1e-5. Example (Java): import com.google.type.Color; // ... public static java.awt.Color fromProto(Color protocolor) { float alpha = protocolor.hasAlpha() ? protocolor.getAlpha().getValue() : 1.0; return new java.awt.Color( protocolor.getRed(), protocolor.getGreen(), protocolor.getBlue(), alpha); } public static Color toProto(java.awt.Color color) { float red = (float) color.getRed(); float green = (float) color.getGreen(); float blue = (float) color.getBlue(); float denominator = 255.0; Color.Builder resultBuilder = Color .newBuilder() .setRed(red / denominator) .setGreen(green / denominator) .setBlue(blue / denominator); int alpha = color.getAlpha(); if (alpha != 255) { result.setAlpha( FloatValue .newBuilder() .setValue(((float) alpha) / denominator) .build()); } return resultBuilder.build(); } // ... Example (iOS / Obj-C): // ... static UIColor* fromProto(Color* protocolor) { float red = [protocolor red]; float green = [protocolor green]; float blue = [protocolor blue]; FloatValue* alpha_wrapper = [protocolor alpha]; float alpha = 1.0; if (alpha_wrapper != nil) { alpha = [alpha_wrapper value]; } return [UIColor colorWithRed:red green:green blue:blue alpha:alpha]; } static Color* toProto(UIColor* color) { CGFloat red, green, blue, alpha; if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) { return nil; } Color* result = [[Color alloc] init]; [result setRed:red]; [result setGreen:green]; [result setBlue:blue]; if (alpha <= 0.9999) { [result setAlpha:floatWrapperWithValue(alpha)]; } [result autorelease]; return result; } // ... Example (JavaScript): // ... var protoToCssColor = function(rgb_color) { var redFrac = rgb_color.red || 0.0; var greenFrac = rgb_color.green || 0.0; var blueFrac = rgb_color.blue || 0.0; var red = Math.floor(redFrac * 255); var green = Math.floor(greenFrac * 255); var blue = Math.floor(blueFrac * 255); if (!('alpha' in rgb_color)) { return rgbToCssColor(red, green, blue); } var alphaFrac = rgb_color.alpha.value || 0.0; var rgbParams = [red, green, blue].join(','); return ['rgba(', rgbParams, ',', alphaFrac, ')'].join(''); }; var rgbToCssColor = function(red, green, blue) { var rgbNumber = new Number((red << 16) | (green << 8) | blue); var hexString = rgbNumber.toString(16); var missingZeros = 6 - hexString.length; var resultBuilder = ['#']; for (var i = 0; i < missingZeros; i++) { resultBuilder.push('0'); } resultBuilder.push(hexString); return resultBuilder.join(''); }; // ...
    Color color?;
    # The fraction of pixels the color occupies in the image. Value in range [0, 1].
    float pixelFraction?;
    # Image-specific score for this color. Value in range [0, 1].
    float score?;
};

# TextAnnotation contains a structured representation of OCR extracted text. The hierarchy of an OCR extracted text structure is like this: TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol Each structural component, starting from Page, may further have their own properties. Properties describe detected languages, breaks etc.. Please refer to the TextAnnotation.TextProperty message definition below for more detail.
public type GoogleCloudVisionV1p3beta1TextAnnotation record {
    # List of pages detected by OCR.
    GoogleCloudVisionV1p3beta1Page[] pages?;
    # UTF-8 text detected on the pages.
    string text?;
};

# The request message for Operations.CancelOperation.
public type CancelOperationRequest record {
};

# Set of dominant colors and their corresponding scores.
public type DominantColorsAnnotation record {
    # RGB color values with their score and pixel fraction.
    ColorInfo[] colors?;
};

# A single symbol representation.
public type GoogleCloudVisionV1p4beta1Symbol record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p4beta1BoundingPoly boundingBox?;
    # Confidence of the OCR results for the symbol. Range [0, 1].
    float confidence?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p4beta1TextAnnotationTextProperty property?;
    # The actual UTF-8 representation of the symbol.
    string text?;
};

# Prediction for what the object in the bounding box is.
public type GoogleCloudVisionV1p1beta1ProductSearchResultsObjectAnnotation record {
    # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
    # Object ID that should align with EntityAnnotation mid.
    string mid?;
    # Object name, expressed in its `language_code` language.
    string name?;
    # Score of the result. Range [0, 1].
    float score?;
};

# Contains metadata for the BatchAnnotateImages operation.
public type GoogleCloudVisionV1p3beta1OperationMetadata record {
    # The time when the batch request was received.
    string createTime?;
    # Current state of the batch operation.
    string state?;
    # The time when the operation result was last updated.
    string updateTime?;
};

# Relevant information for the image from the Internet.
public type WebDetection record {
    # The service's best guess as to the topic of the request image. Inferred from similar images on the open web.
    WebLabel[] bestGuessLabels?;
    # Fully matching images from the Internet. Can include resized copies of the query image.
    WebImage[] fullMatchingImages?;
    # Web pages containing the matching images from the Internet.
    WebPage[] pagesWithMatchingImages?;
    # Partial matching images from the Internet. Those images are similar enough to share some key-point features. For example an original image will likely have partial matching for its crops.
    WebImage[] partialMatchingImages?;
    # The visually similar image results.
    WebImage[] visuallySimilarImages?;
    # Deduced entities from similar images on the Internet.
    WebEntity[] webEntities?;
};

# Stores image properties, such as dominant colors.
public type GoogleCloudVisionV1p2beta1ImageProperties record {
    # Set of dominant colors and their corresponding scores.
    GoogleCloudVisionV1p2beta1DominantColorsAnnotation dominantColors?;
};

# Detected page from OCR.
public type GoogleCloudVisionV1p3beta1Page record {
    # List of blocks of text, images etc on this page.
    GoogleCloudVisionV1p3beta1Block[] blocks?;
    # Confidence of the OCR results on the page. Range [0, 1].
    float confidence?;
    # Page height. For PDFs the unit is points. For images (including TIFFs) the unit is pixels.
    int height?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p3beta1TextAnnotationTextProperty property?;
    # Page width. For PDFs the unit is points. For images (including TIFFs) the unit is pixels.
    int width?;
};

# The Google Cloud Storage location where the input will be read from.
public type GoogleCloudVisionV1p3beta1GcsSource record {
    # Google Cloud Storage URI for the input file. This must only be a Google Cloud Storage object. Wildcards are not currently supported.
    string uri?;
};

# Set of detected objects with bounding boxes.
public type LocalizedObjectAnnotation record {
    # A bounding polygon for the detected image annotation.
    BoundingPoly boundingPoly?;
    # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
    # Object ID that should align with EntityAnnotation mid.
    string mid?;
    # Object name, expressed in its `language_code` language.
    string name?;
    # Score of the result. Range [0, 1].
    float score?;
};

# A vertex represents a 2D point in the image. NOTE: the vertex coordinates are in the same scale as the original image.
public type GoogleCloudVisionV1p4beta1Vertex record {
    # X coordinate.
    int x?;
    # Y coordinate.
    int y?;
};

# Information about a product.
public type GoogleCloudVisionV1p3beta1ProductSearchResultsResult record {
    # The resource name of the image from the product that is the closest match to the query.
    string image?;
    # A Product contains ReferenceImages.
    GoogleCloudVisionV1p3beta1Product product?;
    # A confidence level on the match, ranging from 0 (no confidence) to 1 (full confidence).
    float score?;
};

# Information about the products similar to a single product in a query image.
public type GoogleCloudVisionV1p4beta1ProductSearchResultsGroupedResult record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p4beta1BoundingPoly boundingPoly?;
    # List of generic predictions for the object in the bounding box.
    GoogleCloudVisionV1p4beta1ProductSearchResultsObjectAnnotation[] objectAnnotations?;
    # List of results, one for each product match.
    GoogleCloudVisionV1p4beta1ProductSearchResultsResult[] results?;
};

# If an image was produced from a file (e.g. a PDF), this message gives information about the source of that image.
public type GoogleCloudVisionV1p1beta1ImageAnnotationContext record {
    # If the file was a PDF or TIFF, this field gives the page number within the file used to produce the image.
    int pageNumber?;
    # The URI of the file used to produce the image.
    string uri?;
};

# Contains metadata for the BatchAnnotateImages operation.
public type GoogleCloudVisionV1p4beta1OperationMetadata record {
    # The time when the batch request was received.
    string createTime?;
    # Current state of the batch operation.
    string state?;
    # The time when the operation result was last updated.
    string updateTime?;
};

# The desired output location and metadata.
public type OutputConfig record {
    # The max number of response protos to put into each output JSON file on Google Cloud Storage. The valid range is [1, 100]. If not specified, the default value is 20. For example, for one pdf file with 100 pages, 100 response protos will be generated. If `batch_size` = 20, then 5 json files each containing 20 response protos will be written under the prefix `gcs_destination`.`uri`. Currently, batch_size only applies to GcsDestination, with potential future support for other output configurations.
    int batchSize?;
    # The Google Cloud Storage location where the output will be written to.
    GcsDestination gcsDestination?;
};

# Parameters for crop hints annotation request.
public type CropHintsParams record {
    # Aspect ratios in floats, representing the ratio of the width to the height of the image. For example, if the desired aspect ratio is 4/3, the corresponding float value should be 1.33333. If not specified, the best possible crop is returned. The number of provided aspect ratios is limited to a maximum of 16; any aspect ratios provided after the 16th are ignored.
    float[] aspectRatios?;
};

# Prediction for what the object in the bounding box is.
public type GoogleCloudVisionV1p4beta1ProductSearchResultsObjectAnnotation record {
    # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
    # Object ID that should align with EntityAnnotation mid.
    string mid?;
    # Object name, expressed in its `language_code` language.
    string name?;
    # Score of the result. Range [0, 1].
    float score?;
};

# Response to a single file annotation request. A file may contain one or more images, which individually have their own responses.
public type GoogleCloudVisionV1p2beta1AnnotateFileResponse record {
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status 'error?;
    # The desired input location and metadata.
    GoogleCloudVisionV1p2beta1InputConfig inputConfig?;
    # Individual responses to images found within the file. This field will be empty if the `error` field is set.
    GoogleCloudVisionV1p2beta1AnnotateImageResponse[] responses?;
    # This field gives the total number of pages in the file.
    int totalPages?;
};

# Metadata for online images.
public type GoogleCloudVisionV1p2beta1WebDetectionWebImage record {
    # (Deprecated) Overall relevancy score for the image.
    float score?;
    # The result image URL.
    string url?;
};

# Logical element on the page.
public type Block record {
    # Detected block type (text, image etc) for this block.
    string blockType?;
    # A bounding polygon for the detected image annotation.
    BoundingPoly boundingBox?;
    # Confidence of the OCR results on the block. Range [0, 1].
    float confidence?;
    # List of paragraphs in this block (if this blocks is of type text).
    Paragraph[] paragraphs?;
    # Additional information detected on the structural component.
    TextProperty property?;
};

# Information about a product.
public type GoogleCloudVisionV1p2beta1ProductSearchResultsResult record {
    # The resource name of the image from the product that is the closest match to the query.
    string image?;
    # A Product contains ReferenceImages.
    GoogleCloudVisionV1p2beta1Product product?;
    # A confidence level on the match, ranging from 0 (no confidence) to 1 (full confidence).
    float score?;
};

# Single crop hint that is used to generate a new crop when serving an image.
public type GoogleCloudVisionV1p2beta1CropHint record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p2beta1BoundingPoly boundingPoly?;
    # Confidence of this being a salient region. Range [0, 1].
    float confidence?;
    # Fraction of importance of this salient region with respect to the original image.
    float importanceFraction?;
};

# Metadata for web pages.
public type WebPage record {
    # Fully matching images on the page. Can include resized copies of the query image.
    WebImage[] fullMatchingImages?;
    # Title for the web page, may contain HTML markups.
    string pageTitle?;
    # Partial matching images on the page. Those images are similar enough to share some key-point features. For example an original image will likely have partial matching for its crops.
    WebImage[] partialMatchingImages?;
    # (Deprecated) Overall relevancy score for the web page.
    float score?;
    # The result web page URL.
    string url?;
};

# A list of requests to annotate files using the BatchAnnotateFiles API.
public type BatchAnnotateFilesRequest record {
    # Optional. Target project and location to make a call. Format: `projects/{project-id}/locations/{location-id}`. If no parent is specified, a region will be chosen automatically. Supported location-ids: `us`: USA country only, `asia`: East asia areas, like Japan, Taiwan, `eu`: The European Union. Example: `projects/project-A/locations/eu`.
    string parent?;
    # Required. The list of file annotation requests. Right now we support only one AnnotateFileRequest in BatchAnnotateFilesRequest.
    AnnotateFileRequest[] requests?;
};

# A single symbol representation.
public type Symbol record {
    # A bounding polygon for the detected image annotation.
    BoundingPoly boundingBox?;
    # Confidence of the OCR results for the symbol. Range [0, 1].
    float confidence?;
    # Additional information detected on the structural component.
    TextProperty property?;
    # The actual UTF-8 representation of the symbol.
    string text?;
};

# A vertex represents a 2D point in the image. NOTE: the vertex coordinates are in the same scale as the original image.
public type GoogleCloudVisionV1p2beta1Vertex record {
    # X coordinate.
    int x?;
    # Y coordinate.
    int y?;
};

# A face-specific landmark (for example, a face feature).
public type GoogleCloudVisionV1p3beta1FaceAnnotationLandmark record {
    # A 3D position in the image, used primarily for Face detection landmarks. A valid Position must have both x and y coordinates. The position coordinates are in the same scale as the original image.
    GoogleCloudVisionV1p3beta1Position position?;
    # Face landmark type.
    string 'type?;
};

# Set of crop hints that are used to generate new crops when serving images.
public type GoogleCloudVisionV1p1beta1CropHintsAnnotation record {
    # Crop hint results.
    GoogleCloudVisionV1p1beta1CropHint[] cropHints?;
};

# The desired input location and metadata.
public type GoogleCloudVisionV1p4beta1InputConfig record {
    # File content, represented as a stream of bytes. Note: As with all `bytes` fields, protobuffers use a pure binary representation, whereas JSON representations use base64. Currently, this field only works for BatchAnnotateFiles requests. It does not work for AsyncBatchAnnotateFiles requests.
    string content?;
    # The Google Cloud Storage location where the input will be read from.
    GoogleCloudVisionV1p4beta1GcsSource gcsSource?;
    # The type of the file. Currently only "application/pdf", "image/tiff" and "image/gif" are supported. Wildcards are not supported.
    string mimeType?;
};

# This resource represents a long-running operation that is the result of a network API call.
public type Operation record {
    # If the value is `false`, it means the operation is still in progress. If `true`, the operation is completed, and either `error` or `response` is available.
    boolean done?;
    # The `Status` type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of data: error code, error message, and error details. You can find out more about this error model and how to work with it in the [API Design Guide](https://cloud.google.com/apis/design/errors).
    Status 'error?;
    # Service-specific metadata associated with the operation. It typically contains progress information and common metadata such as create time. Some services might not provide such metadata. Any method that returns a long-running operation should document the metadata type, if any.
    record {} metadata?;
    # The server-assigned name, which is only unique within the same service that originally returns it. If you use the default HTTP mapping, the `name` should be a resource name ending with `operations/{unique_id}`.
    string name?;
    # The normal response of the operation in case of success. If the original method returns no data on success, such as `Delete`, the response is `google.protobuf.Empty`. If the original method is standard `Get`/`Create`/`Update`, the response should be the resource. For other methods, the response should have the type `XxxResponse`, where `Xxx` is the original method name. For example, if the original method name is `TakeSnapshot()`, the inferred response type is `TakeSnapshotResponse`.
    record {} response?;
};

# The desired input location and metadata.
public type GoogleCloudVisionV1p1beta1InputConfig record {
    # File content, represented as a stream of bytes. Note: As with all `bytes` fields, protobuffers use a pure binary representation, whereas JSON representations use base64. Currently, this field only works for BatchAnnotateFiles requests. It does not work for AsyncBatchAnnotateFiles requests.
    string content?;
    # The Google Cloud Storage location where the input will be read from.
    GoogleCloudVisionV1p1beta1GcsSource gcsSource?;
    # The type of the file. Currently only "application/pdf", "image/tiff" and "image/gif" are supported. Wildcards are not supported.
    string mimeType?;
};

# Response message for the `ImportProductSets` method. This message is returned by the google.longrunning.Operations.GetOperation method in the returned google.longrunning.Operation.response field.
public type GoogleCloudVisionV1p3beta1ImportProductSetsResponse record {
    # The list of reference_images that are imported successfully.
    GoogleCloudVisionV1p3beta1ReferenceImage[] referenceImages?;
    # The rpc status for each ImportProductSet request, including both successes and errors. The number of statuses here matches the number of lines in the csv file, and statuses[i] stores the success or failure status of processing the i-th line of the csv, starting from line 0.
    Status[] statuses?;
};

# Set of detected entity features.
public type GoogleCloudVisionV1p1beta1EntityAnnotation record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p1beta1BoundingPoly boundingPoly?;
    # **Deprecated. Use `score` instead.** The accuracy of the entity detection in an image. For example, for an image in which the "Eiffel Tower" entity is detected, this field represents the confidence that there is a tower in the query image. Range [0, 1].
    float confidence?;
    # Entity textual description, expressed in its `locale` language.
    string description?;
    # The language code for the locale in which the entity textual `description` is expressed.
    string locale?;
    # The location information for the detected entity. Multiple `LocationInfo` elements can be present because one location may indicate the location of the scene in the image, and another location may indicate the location of the place where the image was taken. Location information is usually present for landmarks.
    GoogleCloudVisionV1p1beta1LocationInfo[] locations?;
    # Opaque entity ID. Some IDs may be available in [Google Knowledge Graph Search API](https://developers.google.com/knowledge-graph/).
    string mid?;
    # Some entities may have optional user-supplied `Property` (name/value) fields, such a score or string that qualifies the entity.
    GoogleCloudVisionV1p1beta1Property[] properties?;
    # Overall score of the result. Range [0, 1].
    float score?;
    # The relevancy of the ICA (Image Content Annotation) label to the image. For example, the relevancy of "tower" is likely higher to an image containing the detected "Eiffel Tower" than to an image containing a detected distant towering building, even though the confidence that there is a tower in each image may be the same. Range [0, 1].
    float topicality?;
};

# Color information consists of RGB channels, score, and the fraction of the image that the color occupies in the image.
public type GoogleCloudVisionV1p4beta1ColorInfo record {
    # Represents a color in the RGBA color space. This representation is designed for simplicity of conversion to/from color representations in various languages over compactness. For example, the fields of this representation can be trivially provided to the constructor of `java.awt.Color` in Java; it can also be trivially provided to UIColor's `+colorWithRed:green:blue:alpha` method in iOS; and, with just a little work, it can be easily formatted into a CSS `rgba()` string in JavaScript. This reference page doesn't carry information about the absolute color space that should be used to interpret the RGB value (e.g. sRGB, Adobe RGB, DCI-P3, BT.2020, etc.). By default, applications should assume the sRGB color space. When color equality needs to be decided, implementations, unless documented otherwise, treat two colors as equal if all their red, green, blue, and alpha values each differ by at most 1e-5. Example (Java): import com.google.type.Color; // ... public static java.awt.Color fromProto(Color protocolor) { float alpha = protocolor.hasAlpha() ? protocolor.getAlpha().getValue() : 1.0; return new java.awt.Color( protocolor.getRed(), protocolor.getGreen(), protocolor.getBlue(), alpha); } public static Color toProto(java.awt.Color color) { float red = (float) color.getRed(); float green = (float) color.getGreen(); float blue = (float) color.getBlue(); float denominator = 255.0; Color.Builder resultBuilder = Color .newBuilder() .setRed(red / denominator) .setGreen(green / denominator) .setBlue(blue / denominator); int alpha = color.getAlpha(); if (alpha != 255) { result.setAlpha( FloatValue .newBuilder() .setValue(((float) alpha) / denominator) .build()); } return resultBuilder.build(); } // ... Example (iOS / Obj-C): // ... static UIColor* fromProto(Color* protocolor) { float red = [protocolor red]; float green = [protocolor green]; float blue = [protocolor blue]; FloatValue* alpha_wrapper = [protocolor alpha]; float alpha = 1.0; if (alpha_wrapper != nil) { alpha = [alpha_wrapper value]; } return [UIColor colorWithRed:red green:green blue:blue alpha:alpha]; } static Color* toProto(UIColor* color) { CGFloat red, green, blue, alpha; if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) { return nil; } Color* result = [[Color alloc] init]; [result setRed:red]; [result setGreen:green]; [result setBlue:blue]; if (alpha <= 0.9999) { [result setAlpha:floatWrapperWithValue(alpha)]; } [result autorelease]; return result; } // ... Example (JavaScript): // ... var protoToCssColor = function(rgb_color) { var redFrac = rgb_color.red || 0.0; var greenFrac = rgb_color.green || 0.0; var blueFrac = rgb_color.blue || 0.0; var red = Math.floor(redFrac * 255); var green = Math.floor(greenFrac * 255); var blue = Math.floor(blueFrac * 255); if (!('alpha' in rgb_color)) { return rgbToCssColor(red, green, blue); } var alphaFrac = rgb_color.alpha.value || 0.0; var rgbParams = [red, green, blue].join(','); return ['rgba(', rgbParams, ',', alphaFrac, ')'].join(''); }; var rgbToCssColor = function(red, green, blue) { var rgbNumber = new Number((red << 16) | (green << 8) | blue); var hexString = rgbNumber.toString(16); var missingZeros = 6 - hexString.length; var resultBuilder = ['#']; for (var i = 0; i < missingZeros; i++) { resultBuilder.push('0'); } resultBuilder.push(hexString); return resultBuilder.join(''); }; // ...
    Color color?;
    # The fraction of pixels the color occupies in the image. Value in range [0, 1].
    float pixelFraction?;
    # Image-specific score for this color. Value in range [0, 1].
    float score?;
};

# Label to provide extra metadata for the web detection.
public type WebLabel record {
    # Label for extra metadata.
    string label?;
    # The BCP-47 language code for `label`, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
};

# Response to an async batch file annotation request.
public type AsyncBatchAnnotateFilesResponse record {
    # The list of file annotation responses, one for each request in AsyncBatchAnnotateFilesRequest.
    AsyncAnnotateFileResponse[] responses?;
};

# A face annotation object contains the results of face detection.
public type FaceAnnotation record {
    # Anger likelihood.
    string angerLikelihood?;
    # Blurred likelihood.
    string blurredLikelihood?;
    # A bounding polygon for the detected image annotation.
    BoundingPoly boundingPoly?;
    # Detection confidence. Range [0, 1].
    float detectionConfidence?;
    # A bounding polygon for the detected image annotation.
    BoundingPoly fdBoundingPoly?;
    # Headwear likelihood.
    string headwearLikelihood?;
    # Joy likelihood.
    string joyLikelihood?;
    # Face landmarking confidence. Range [0, 1].
    float landmarkingConfidence?;
    # Detected face landmarks.
    Landmark[] landmarks?;
    # Yaw angle, which indicates the leftward/rightward angle that the face is pointing relative to the vertical plane perpendicular to the image. Range [-180,180].
    float panAngle?;
    # Roll angle, which indicates the amount of clockwise/anti-clockwise rotation of the face relative to the image vertical about the axis perpendicular to the face. Range [-180,180].
    float rollAngle?;
    # Sorrow likelihood.
    string sorrowLikelihood?;
    # Surprise likelihood.
    string surpriseLikelihood?;
    # Pitch angle, which indicates the upwards/downwards angle that the face is pointing relative to the image's horizontal plane. Range [-180,180].
    float tiltAngle?;
    # Under-exposed likelihood.
    string underExposedLikelihood?;
};

# Set of dominant colors and their corresponding scores.
public type GoogleCloudVisionV1p2beta1DominantColorsAnnotation record {
    # RGB color values with their score and pixel fraction.
    GoogleCloudVisionV1p2beta1ColorInfo[] colors?;
};

# A `Property` consists of a user-supplied name/value pair.
public type GoogleCloudVisionV1p4beta1Property record {
    # Name of the property.
    string name?;
    # Value of numeric properties.
    string uint64Value?;
    # Value of the property.
    string value?;
};

# Results for a product search request.
public type GoogleCloudVisionV1p1beta1ProductSearchResults record {
    # Timestamp of the index which provided these results. Products added to the product set and products removed from the product set after this time are not reflected in the current results.
    string indexTime?;
    # List of results grouped by products detected in the query image. Each entry corresponds to one bounding polygon in the query image, and contains the matching products specific to that region. There may be duplicate product matches in the union of all the per-product results.
    GoogleCloudVisionV1p1beta1ProductSearchResultsGroupedResult[] productGroupedResults?;
    # List of results, one for each product match.
    GoogleCloudVisionV1p1beta1ProductSearchResultsResult[] results?;
};

# TextAnnotation contains a structured representation of OCR extracted text. The hierarchy of an OCR extracted text structure is like this: TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol Each structural component, starting from Page, may further have their own properties. Properties describe detected languages, breaks etc.. Please refer to the TextAnnotation.TextProperty message definition below for more detail.
public type TextAnnotation record {
    # List of pages detected by OCR.
    Page[] pages?;
    # UTF-8 text detected on the pages.
    string text?;
};

# A face-specific landmark (for example, a face feature).
public type GoogleCloudVisionV1p2beta1FaceAnnotationLandmark record {
    # A 3D position in the image, used primarily for Face detection landmarks. A valid Position must have both x and y coordinates. The position coordinates are in the same scale as the original image.
    GoogleCloudVisionV1p2beta1Position position?;
    # Face landmark type.
    string 'type?;
};

# Stores image properties, such as dominant colors.
public type GoogleCloudVisionV1p1beta1ImageProperties record {
    # Set of dominant colors and their corresponding scores.
    GoogleCloudVisionV1p1beta1DominantColorsAnnotation dominantColors?;
};

# Image context and/or feature-specific parameters.
public type ImageContext record {
    # Parameters for crop hints annotation request.
    CropHintsParams cropHintsParams?;
    # List of languages to use for TEXT_DETECTION. In most cases, an empty value yields the best results since it enables automatic language detection. For languages based on the Latin alphabet, setting `language_hints` is not needed. In rare cases, when the language of the text in the image is known, setting a hint will help get better results (although it will be a significant hindrance if the hint is wrong). Text detection returns an error if one or more of the specified languages is not one of the [supported languages](https://cloud.google.com/vision/docs/languages).
    string[] languageHints?;
    # Rectangle determined by min and max `LatLng` pairs.
    LatLongRect latLongRect?;
    # Parameters for a product search request.
    ProductSearchParams productSearchParams?;
    # Parameters for text detections. This is used to control TEXT_DETECTION and DOCUMENT_TEXT_DETECTION features.
    TextDetectionParams textDetectionParams?;
    # Parameters for web detection request.
    WebDetectionParams webDetectionParams?;
};

# The response for a single offline file annotation request.
public type GoogleCloudVisionV1p1beta1AsyncAnnotateFileResponse record {
    # The desired output location and metadata.
    GoogleCloudVisionV1p1beta1OutputConfig outputConfig?;
};

# A 3D position in the image, used primarily for Face detection landmarks. A valid Position must have both x and y coordinates. The position coordinates are in the same scale as the original image.
public type GoogleCloudVisionV1p2beta1Position record {
    # X coordinate.
    float x?;
    # Y coordinate.
    float y?;
    # Z coordinate (or depth).
    float z?;
};

# Detected language for a structural component.
public type GoogleCloudVisionV1p2beta1TextAnnotationDetectedLanguage record {
    # Confidence of detected language. Range [0, 1].
    float confidence?;
    # The BCP-47 language code, such as "en-US" or "sr-Latn". For more information, see http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
    string languageCode?;
};

# A bounding polygon for the detected image annotation.
public type GoogleCloudVisionV1p3beta1BoundingPoly record {
    # The bounding polygon normalized vertices.
    GoogleCloudVisionV1p3beta1NormalizedVertex[] normalizedVertices?;
    # The bounding polygon vertices.
    GoogleCloudVisionV1p3beta1Vertex[] vertices?;
};

# Response message for the `ListProducts` method.
public type ListProductsResponse record {
    # Token to retrieve the next page of results, or empty if there are no more results in the list.
    string nextPageToken?;
    # List of products.
    Product[] products?;
};

# The desired output location and metadata.
public type GoogleCloudVisionV1p2beta1OutputConfig record {
    # The max number of response protos to put into each output JSON file on Google Cloud Storage. The valid range is [1, 100]. If not specified, the default value is 20. For example, for one pdf file with 100 pages, 100 response protos will be generated. If `batch_size` = 20, then 5 json files each containing 20 response protos will be written under the prefix `gcs_destination`.`uri`. Currently, batch_size only applies to GcsDestination, with potential future support for other output configurations.
    int batchSize?;
    # The Google Cloud Storage location where the output will be written to.
    GoogleCloudVisionV1p2beta1GcsDestination gcsDestination?;
};

# Color information consists of RGB channels, score, and the fraction of the image that the color occupies in the image.
public type ColorInfo record {
    # Represents a color in the RGBA color space. This representation is designed for simplicity of conversion to/from color representations in various languages over compactness. For example, the fields of this representation can be trivially provided to the constructor of `java.awt.Color` in Java; it can also be trivially provided to UIColor's `+colorWithRed:green:blue:alpha` method in iOS; and, with just a little work, it can be easily formatted into a CSS `rgba()` string in JavaScript. This reference page doesn't carry information about the absolute color space that should be used to interpret the RGB value (e.g. sRGB, Adobe RGB, DCI-P3, BT.2020, etc.). By default, applications should assume the sRGB color space. When color equality needs to be decided, implementations, unless documented otherwise, treat two colors as equal if all their red, green, blue, and alpha values each differ by at most 1e-5. Example (Java): import com.google.type.Color; // ... public static java.awt.Color fromProto(Color protocolor) { float alpha = protocolor.hasAlpha() ? protocolor.getAlpha().getValue() : 1.0; return new java.awt.Color( protocolor.getRed(), protocolor.getGreen(), protocolor.getBlue(), alpha); } public static Color toProto(java.awt.Color color) { float red = (float) color.getRed(); float green = (float) color.getGreen(); float blue = (float) color.getBlue(); float denominator = 255.0; Color.Builder resultBuilder = Color .newBuilder() .setRed(red / denominator) .setGreen(green / denominator) .setBlue(blue / denominator); int alpha = color.getAlpha(); if (alpha != 255) { result.setAlpha( FloatValue .newBuilder() .setValue(((float) alpha) / denominator) .build()); } return resultBuilder.build(); } // ... Example (iOS / Obj-C): // ... static UIColor* fromProto(Color* protocolor) { float red = [protocolor red]; float green = [protocolor green]; float blue = [protocolor blue]; FloatValue* alpha_wrapper = [protocolor alpha]; float alpha = 1.0; if (alpha_wrapper != nil) { alpha = [alpha_wrapper value]; } return [UIColor colorWithRed:red green:green blue:blue alpha:alpha]; } static Color* toProto(UIColor* color) { CGFloat red, green, blue, alpha; if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) { return nil; } Color* result = [[Color alloc] init]; [result setRed:red]; [result setGreen:green]; [result setBlue:blue]; if (alpha <= 0.9999) { [result setAlpha:floatWrapperWithValue(alpha)]; } [result autorelease]; return result; } // ... Example (JavaScript): // ... var protoToCssColor = function(rgb_color) { var redFrac = rgb_color.red || 0.0; var greenFrac = rgb_color.green || 0.0; var blueFrac = rgb_color.blue || 0.0; var red = Math.floor(redFrac * 255); var green = Math.floor(greenFrac * 255); var blue = Math.floor(blueFrac * 255); if (!('alpha' in rgb_color)) { return rgbToCssColor(red, green, blue); } var alphaFrac = rgb_color.alpha.value || 0.0; var rgbParams = [red, green, blue].join(','); return ['rgba(', rgbParams, ',', alphaFrac, ')'].join(''); }; var rgbToCssColor = function(red, green, blue) { var rgbNumber = new Number((red << 16) | (green << 8) | blue); var hexString = rgbNumber.toString(16); var missingZeros = 6 - hexString.length; var resultBuilder = ['#']; for (var i = 0; i < missingZeros; i++) { resultBuilder.push('0'); } resultBuilder.push(hexString); return resultBuilder.join(''); }; // ...
    Color color?;
    # The fraction of pixels the color occupies in the image. Value in range [0, 1].
    float pixelFraction?;
    # Image-specific score for this color. Value in range [0, 1].
    float score?;
};

# The Google Cloud Storage location where the input will be read from.
public type GoogleCloudVisionV1p1beta1GcsSource record {
    # Google Cloud Storage URI for the input file. This must only be a Google Cloud Storage object. Wildcards are not currently supported.
    string uri?;
};

# Results for a product search request.
public type GoogleCloudVisionV1p3beta1ProductSearchResults record {
    # Timestamp of the index which provided these results. Products added to the product set and products removed from the product set after this time are not reflected in the current results.
    string indexTime?;
    # List of results grouped by products detected in the query image. Each entry corresponds to one bounding polygon in the query image, and contains the matching products specific to that region. There may be duplicate product matches in the union of all the per-product results.
    GoogleCloudVisionV1p3beta1ProductSearchResultsGroupedResult[] productGroupedResults?;
    # List of results, one for each product match.
    GoogleCloudVisionV1p3beta1ProductSearchResultsResult[] results?;
};

# Rectangle determined by min and max `LatLng` pairs.
public type LatLongRect record {
    # An object that represents a latitude/longitude pair. This is expressed as a pair of doubles to represent degrees latitude and degrees longitude. Unless specified otherwise, this object must conform to the WGS84 standard. Values must be within normalized ranges.
    LatLng maxLatLng?;
    # An object that represents a latitude/longitude pair. This is expressed as a pair of doubles to represent degrees latitude and degrees longitude. Unless specified otherwise, this object must conform to the WGS84 standard. Values must be within normalized ranges.
    LatLng minLatLng?;
};

# Information about the products similar to a single product in a query image.
public type GoogleCloudVisionV1p3beta1ProductSearchResultsGroupedResult record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p3beta1BoundingPoly boundingPoly?;
    # List of generic predictions for the object in the bounding box.
    GoogleCloudVisionV1p3beta1ProductSearchResultsObjectAnnotation[] objectAnnotations?;
    # List of results, one for each product match.
    GoogleCloudVisionV1p3beta1ProductSearchResultsResult[] results?;
};

# Request message for the `PurgeProducts` method.
public type PurgeProductsRequest record {
    # If delete_orphan_products is true, all Products that are not in any ProductSet will be deleted.
    boolean deleteOrphanProducts?;
    # The default value is false. Override this value to true to actually perform the purge.
    boolean force?;
    # Config to control which ProductSet contains the Products to be deleted.
    ProductSetPurgeConfig productSetPurgeConfig?;
};

# Color information consists of RGB channels, score, and the fraction of the image that the color occupies in the image.
public type GoogleCloudVisionV1p3beta1ColorInfo record {
    # Represents a color in the RGBA color space. This representation is designed for simplicity of conversion to/from color representations in various languages over compactness. For example, the fields of this representation can be trivially provided to the constructor of `java.awt.Color` in Java; it can also be trivially provided to UIColor's `+colorWithRed:green:blue:alpha` method in iOS; and, with just a little work, it can be easily formatted into a CSS `rgba()` string in JavaScript. This reference page doesn't carry information about the absolute color space that should be used to interpret the RGB value (e.g. sRGB, Adobe RGB, DCI-P3, BT.2020, etc.). By default, applications should assume the sRGB color space. When color equality needs to be decided, implementations, unless documented otherwise, treat two colors as equal if all their red, green, blue, and alpha values each differ by at most 1e-5. Example (Java): import com.google.type.Color; // ... public static java.awt.Color fromProto(Color protocolor) { float alpha = protocolor.hasAlpha() ? protocolor.getAlpha().getValue() : 1.0; return new java.awt.Color( protocolor.getRed(), protocolor.getGreen(), protocolor.getBlue(), alpha); } public static Color toProto(java.awt.Color color) { float red = (float) color.getRed(); float green = (float) color.getGreen(); float blue = (float) color.getBlue(); float denominator = 255.0; Color.Builder resultBuilder = Color .newBuilder() .setRed(red / denominator) .setGreen(green / denominator) .setBlue(blue / denominator); int alpha = color.getAlpha(); if (alpha != 255) { result.setAlpha( FloatValue .newBuilder() .setValue(((float) alpha) / denominator) .build()); } return resultBuilder.build(); } // ... Example (iOS / Obj-C): // ... static UIColor* fromProto(Color* protocolor) { float red = [protocolor red]; float green = [protocolor green]; float blue = [protocolor blue]; FloatValue* alpha_wrapper = [protocolor alpha]; float alpha = 1.0; if (alpha_wrapper != nil) { alpha = [alpha_wrapper value]; } return [UIColor colorWithRed:red green:green blue:blue alpha:alpha]; } static Color* toProto(UIColor* color) { CGFloat red, green, blue, alpha; if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) { return nil; } Color* result = [[Color alloc] init]; [result setRed:red]; [result setGreen:green]; [result setBlue:blue]; if (alpha <= 0.9999) { [result setAlpha:floatWrapperWithValue(alpha)]; } [result autorelease]; return result; } // ... Example (JavaScript): // ... var protoToCssColor = function(rgb_color) { var redFrac = rgb_color.red || 0.0; var greenFrac = rgb_color.green || 0.0; var blueFrac = rgb_color.blue || 0.0; var red = Math.floor(redFrac * 255); var green = Math.floor(greenFrac * 255); var blue = Math.floor(blueFrac * 255); if (!('alpha' in rgb_color)) { return rgbToCssColor(red, green, blue); } var alphaFrac = rgb_color.alpha.value || 0.0; var rgbParams = [red, green, blue].join(','); return ['rgba(', rgbParams, ',', alphaFrac, ')'].join(''); }; var rgbToCssColor = function(red, green, blue) { var rgbNumber = new Number((red << 16) | (green << 8) | blue); var hexString = rgbNumber.toString(16); var missingZeros = 6 - hexString.length; var resultBuilder = ['#']; for (var i = 0; i < missingZeros; i++) { resultBuilder.push('0'); } resultBuilder.push(hexString); return resultBuilder.join(''); }; // ...
    Color color?;
    # The fraction of pixels the color occupies in the image. Value in range [0, 1].
    float pixelFraction?;
    # Image-specific score for this color. Value in range [0, 1].
    float score?;
};

# External image source (Google Cloud Storage or web URL image location).
public type ImageSource record {
    # **Use `image_uri` instead.** The Google Cloud Storage URI of the form `gs://bucket_name/object_name`. Object versioning is not supported. See [Google Cloud Storage Request URIs](https://cloud.google.com/storage/docs/reference-uris) for more info.
    string gcsImageUri?;
    # The URI of the source image. Can be either: 1. A Google Cloud Storage URI of the form `gs://bucket_name/object_name`. Object versioning is not supported. See [Google Cloud Storage Request URIs](https://cloud.google.com/storage/docs/reference-uris) for more info. 2. A publicly-accessible image HTTP/HTTPS URL. When fetching images from HTTP/HTTPS URLs, Google cannot guarantee that the request will be completed. Your request may fail if the specified host denies the request (e.g. due to request throttling or DOS prevention), or if Google throttles requests to the site for abuse prevention. You should not depend on externally-hosted images for production applications. When both `gcs_image_uri` and `image_uri` are specified, `image_uri` takes precedence.
    string imageUri?;
};

# A single symbol representation.
public type GoogleCloudVisionV1p2beta1Symbol record {
    # A bounding polygon for the detected image annotation.
    GoogleCloudVisionV1p2beta1BoundingPoly boundingBox?;
    # Confidence of the OCR results for the symbol. Range [0, 1].
    float confidence?;
    # Additional information detected on the structural component.
    GoogleCloudVisionV1p2beta1TextAnnotationTextProperty property?;
    # The actual UTF-8 representation of the symbol.
    string text?;
};
