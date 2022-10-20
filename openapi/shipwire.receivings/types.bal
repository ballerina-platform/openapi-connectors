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

public type DocumentsResource record {
    # Link to dowload a generic label document
    string? genericLabel?;
    # Link to dowload a Shipwire Warehouse Receiving guide
    string? receivingGuide?;
};

# Shipping source information
public type Address record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # Address resource
    AddressResource? 'resource?;
};

public type ReceivinglotcontrolResourceItems record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    ReceivingLotControl? 'resource?;
};

# Specifies shipment tracking details. See `trackings` resource.
public type Trackings record {
    # Trackings resource
    TrackingsResource? 'resource?;
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
};

public type GetAdvanceShipNoticeResponse record {
    # This is the HTTP status code.
    int? status?;
    # This is the HTTP status message.
    string? message?;
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    record {} 'resource?;
};

# Receiving Server Response
public type ReceivingServerResponse record {
    # This is the HTTP status code.
    int? status?;
    # This is the HTTP status message.
    string? message?;
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
};

public type Label record {
    # A unique ID assigned to each shipping label in the shipwire system.
    int? labelId?;
    # This is the receving order ID in the shipwire system on which the hold is applied.
    int? orderId?;
    # This is the receving order ID in the external system on which the hold is applied.
    string? orderExternalId?;
};

# Get instructions recipients details response
public type GetInstructionsRecipientsDetailsResponse record {
    # This is the HTTP status code.
    int? status?;
    # This is the HTTP status message.
    string? message?;
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # GetInstructionsRecipientsDetailsResponse resource
    GetinstructionsrecipientsdetailsresponseResource? 'resource?;
};

# GetLabelsDetailResponse resource
public type GetlabelsdetailresponseResource record {
    # This is an integer that matches the offset given in the request and dictates the number of items to skip while fetching results. For example, there is a preset limit of 20 results per page. If there are 30 total results and offset is set to 20, then the response will show the second "page" of results, with items 21 to 30.
    int? offset?;
    # Total number of available items in the API response.
    int? total?;
    # A link used to fetch the previous set or page of items in the API response.
    string? previous?;
    # A link used to fetch the next set or page of items in the API response.
    string? next?;
    # GetLabelsDetailResponse resource items
    GetlabelsdetailresponseResourceItems[]? items?;
};

# ReceivingExtendedAttributes resource
public type ReceivingextendedattributesResource record {
    # This is an integer that matches the offset given in the request and dictates the number of items to skip while fetching results. For example, there is a preset limit of 20 results per page. If there are 30 total results and offset is set to 20, then the response will show the second "page" of results, with items 21 to 30.
    int? offset?;
    # Total number of available items in the API response.
    int? total?;
    # A link used to fetch the previous set or page of items in the API response.
    string? previous?;
    # A link used to fetch the next set or page of items in the API response.
    string? next?;
    # ReceivingExtendedAttributes resource items
    ReceivingextendedattributesResourceItems[]? items?;
};

# Get items details response
public type GetItemsDetailResponse record {
    # This is the HTTP status code.
    int? status?;
    # This is the HTTP status message.
    string? message?;
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # GetInstructionsRecipientsDetailsResponse resource
    GetinstructionsrecipientsdetailsresponseResource? 'resource?;
};

public type TrackingsResourceItems record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    Tracking? 'resource?;
};

public type ReceivingLotControl record {
    # A unique ID assigned to a particular quantity or lot of material shipped from a siingle merchant.
    string? lotId?;
    # The  quantity of total SKU items belonging to the particular lot.
    int? quantity?;
    # This is the expiry date of the product belonging to the particular lot.
    string? expirationDate?;
};

# ReceivingExtendedAttributes resource items
public type ReceivingextendedattributesResourceItems record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # Extended attributes
    ExtendedAttributes? 'resource?;
};

# Extended attributes
public type ExtendedAttributes record {
    # Name of the extended attribute i.e. any additional information as per the customer request to be added in the receiving order. (e.g. return instructions)
    string? name?;
    # Value of the extended attribute which depends on the customer request. (e.g. For return instructions the value can be mail in or store)
    string? value?;
    # Data type of the extended attribute value i.e. a string or integer
    string? 'type?;
};

public type AdvanceShippingModel record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    AdvanceshippingmodelResource? 'resource?;
};

# GetHoldDetailsResponse resource
public type GetholddetailsresponseResource record {
    # This is an integer that matches the offset given in the request and dictates the number of items to skip while fetching results. For example, there is a preset limit of 20 results per page. If there are 30 total results and offset is set to 20, then the response will show the second "page" of results, with items 21 to 30. type: integer example: 0 total: description: Total number of available items in the API response. type: integer example: 1 previous: description: A link used to fetch the previous set or page of items in the API response. type: string example: null next: description: A link used to fetch the next set or page of items in the API response. type: string example: null items: type: array items: type: object properties: resourceLocation: example: null type: string resource: allOf: - $ref: 
    record {} offset?;
};

# Mark the receiving as completed
public type MarkTheReceivingCompletedResponse record {
    # This is the HTTP status code.
    int? status?;
    # This is the HTTP status message.
    string? message?;
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
};

public type InstructionsRecipient record {
    # Email address of individual responsible for processing order/inventory at receiving facility.
    string? email?;
    # Name of individual responsible for processing order/inventory at receiving facility.
    string? name?;
    # May be used to provide instructions to recipient on how to process and store received inventory.
    string? note?;
};

public type LabelsResourceItems record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    Label? 'resource?;
};

# Address resource
public type AddressResource record {
    # Email address of the shipper. i.e. the merchant sending inventory to the Shipwire warehouse.
    string? email?;
    # Name of the shipper.
    string? name?;
    # This is the first line of the address of the shipper.
    string? address1?;
    # This is the second line of the address of the shipper.
    string? address2?;
    # This is the third line of the address of the shipper.
    string? address3?;
    # City from where the inventory is shipped.
    string? city?;
    # State from where the inventory is shipped.
    string? state?;
    # Postal code of the area from where the inventory is shipped.
    string? postalCode?;
    # Country from where the inventory is shipped.
    string? country?;
    # Contact phone number of the shipper for any communication.
    string? phone?;
};

# Specifies goods details. See `shipment` resource.
public type Shipments record {
    # Shipments resource
    ShipmentsResource? 'resource?;
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
};

# ReceivingItem extended attributes
public type ReceivingitemExtendedattributes record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # ReceivingExtendedAttributes resource
    ReceivingextendedattributesResource? 'resource?;
};

# Get receiving extended attributes response
public type GetReceivingExtendedAttributesResponse record {
    # This is the HTTP status code.
    int? status?;
    # This is the HTTP status message.
    string? message?;
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # GetInstructionsRecipientsDetailsResponse resource
    GetinstructionsrecipientsdetailsresponseResource? 'resource?;
};

public type ReceivingholdsResource record {
    # This is an integer that matches the offset given in the request and dictates the number of items to skip while fetching results. For example, there is a preset limit of 20 results per page. If there are 30 total results and offset is set to 20, then the response will show the second "page" of results, with items 21 to 30.
    int? offset?;
    # Total number of available items in the API response.
    int? total?;
    # A link used to fetch the previous set or page of items in the API response.
    string? previous?;
    # A link used to fetch the next set or page of items in the API response.
    string? next?;
    ReceivingholdsResourceItems[]? items?;
};

# Get shipment details response
public type GetShipmentDetailsResponse record {
    # This is the HTTP status code.
    int? status?;
    # This is the HTTP status message.
    string? message?;
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # GetShipmentDetailsResponse resource
    GetshipmentdetailsresponseResource? 'resource?;
};

# Shipment
public type Shipment record {
    # A unique ID assigned to the shipment (container) in the shipwire system.
    int? shipmentId?;
    # Type of the shipment (container) based on the contents stored in it (e.g. a box, parcel, etc.)
    string? 'type?;
    # This is the height of the shipment (container) based on its Unit of Measurement
    decimal? height?;
    # This is the length of the shipment (container) based on its Unit of Measurement
    decimal? length?;
    # This is the weight of the shipment (container) based on its Unit of Measurement
    decimal? weight?;
    # This is the width of the shipment (container) based on its Unit of Measurement
    decimal? width?;
};

public type Labels record {
    LabelsResource? 'resource?;
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
};

# Shipments resource
public type ShipmentsResource record {
    # This is an integer that matches the offset given in the request and dictates the number of items to skip while fetching results. For example, there is a preset limit of 20 results per page. If there are 30 total results and offset is set to 20, then the response will show the second "page" of results, with items 21 to 30.
    int? offset?;
    # Total number of available items in the API response.
    int? total?;
    # A link used to fetch the previous set or page of items in the API response.
    string? previous?;
    # A link used to fetch the next set or page of items in the API response.
    string? next?;
    # Shipments resource items
    ShipmentsResourceItems[]? items?;
};

public type PostListOfAdvanceShipNoticesResponse record {
    *ReceivingServerResponse;
    # ReceivingItems resource
    ReceivingitemsResource? 'resource?;
};

# Item being shipped to Shipwire
public type ReceivingItem record {
    # SKU (Stock Keeping Unit) is a unique name for your product and is required for both physical and virtual products in inventory.
    string? sku?;
    # The  quantity of total SKU items belonging to the particular lot.
    int? quantity?;
    # A unique auto-generated ID assigned to each new line item added to the Shipwire Platform.
    int? id?;
    # A unique auto-generated ID assigned to each new product added to the Shipwire Product Catalog.
    int? productId?;
    # A unique user-provided identifier for a product in an external system.
    string? productExternalId?;
    # This is the receving order ID in the shipwire system on which the hold is applied.
    int? orderId?;
    # This is the receving order ID in the external system on which the hold is applied.
    string? orderExternalId?;
    # The total number of SKU items expected to be received at the warehouse as per the order.
    int? expected?;
    # The number of pending SKU items expected to be received at the warehouse.
    int? pending?;
    # The number of SKU items ready for fulfillment in the warehouse.
    int? good?;
    # The number of SKU items currently under review within the warehouse. (i.e. items being reviewed to determine if they are in sellable condition or damaged, etc.)
    int? inReview?;
    # The number of SKU items found to be damaged (during receiving or otherwise) within the warehouse and unavailable for fulfillment.
    int? damaged?;
    # ReceivingItem lotControl
    ReceivingitemLotcontrol? lotControl?;
    # ReceivingItem extended attributes
    ReceivingitemExtendedattributes? extendedAttributes?;
};

# GetLabelsDetailResponse resource items
public type GetlabelsdetailresponseResourceItems record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # Resource
    record {} 'resource?;
};

public type LabelsResource record {
    # This is an integer that matches the offset given in the request and dictates the number of items to skip while fetching results. For example, there is a preset limit of 20 results per page. If there are 30 total results and offset is set to 20, then the response will show the second "page" of results, with items 21 to 30.
    int? offset?;
    # Total number of available items in the API response.
    int? total?;
    # A link used to fetch the previous set or page of items in the API response.
    string? previous?;
    # A link used to fetch the next set or page of items in the API response.
    string? next?;
    LabelsResourceItems[]? items?;
};

public type ReceivingholdsResourceItems record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # Holds that apply to this advance ship notice
    ReceivingHold? 'resource?;
};

# List of contacts and instructions to send to each of them
public type InstructionsRecipients record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # Object
    record {} 'resource?;
};

public type ReceivingitemsResourceItems record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # Item being shipped to Shipwire
    ReceivingItem? 'resource?;
};

public type Documents record {
    # A URL for downloading the generic label format that the warehouse generates for each customer.
    string? resourceLocation?;
    DocumentsResource? 'resource?;
};

public type ReceivingHolds record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    ReceivingholdsResource? 'resource?;
};

public type GetinstructionsrecipientsdetailsresponseResourceItems record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    record {} 'resource?;
};

# Specify the warehouse where items are being shipped
public type Options record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # Options resource
    OptionsResource? 'resource?;
};

public type Tracking record {
    # This is the unquie ID generated in the shipwire system for each tracking record.
    int? id?;
    # This is the receving order ID in the shipwire system on which the hold is applied.
    int? orderId?;
    # This is the receving order ID in the external system on which the hold is applied.
    string? orderExternalId?;
    # This is reference tracking number provided by the carrier for tracking purposes.
    string? tracking?;
    # This is the unique ID of the carrier used to deliver the order to the warehouse.
    string? carrier?;
    # Name of person from the carrier company who can be contacted for any communication.
    string? contact?;
    # Phone number of the contact person from the carrier company for any communication.
    string? phone?;
    # A URL that gives more information about the tracking record.
    string? url?;
    # Summary added to the tracking record for tracking purposes.
    string? summary?;
    # Date on which the summary is added to the tracking record.
    string? summaryDate?;
    string? trackedDate?;
    # Date on which the the inventory is received against the tracking record.
    string? delivered1Date?;
    # Date the order's associated shipping carrier scans the label when it receives the order.
    string? firstScanDate?;
    # Date on which the shipping labels are created for the tracking record.
    string? labelCreationDate?;
};

public type GetListOfAdvanceShipNoticesResponse record {
    *ReceivingServerResponse;
    record {} 'resource?;
};

# Shipments resource items
public type ShipmentsResourceItems record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # Shipment
    Shipment? 'resource?;
};

# Get labels details response
public type GetLabelsDetailResponse record {
    # This is the HTTP status code.
    int? status?;
    # This is the HTTP status message.
    string? message?;
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # GetLabelsDetailResponse resource
    GetlabelsdetailresponseResource? 'resource?;
};

public type CancelAReceivingOrderResponse record {
    # This is the HTTP status code.
    int? status?;
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # This is the HTTP status message.
    string? message?;
};

# GetInstructionsRecipientsDetailsResponse resource
public type GetinstructionsrecipientsdetailsresponseResource record {
    # This is an integer that matches the offset given in the request and dictates the number of items to skip while fetching results. For example, there is a preset limit of 20 results per page. If there are 30 total results and offset is set to 20, then the response will show the second "page" of results, with items 21 to 30.
    int? offset?;
    # Total number of available items in the API response.
    int? total?;
    # A link used to fetch the previous set or page of items in the API response.
    string? previous?;
    # A link used to fetch the next set or page of items in the API response.
    string? next?;
    # GetInstructionsRecipientsDetailsResponse resource items
    GetinstructionsrecipientsdetailsresponseResourceItems[]? items?;
};

# GetTrackingsDetailResponse resource
public type GettrackingsdetailresponseResource record {
    # This is an integer that matches the offset given in the request and dictates the number of items to skip while fetching results. For example, there is a preset limit of 20 results per page. If there are 30 total results and offset is set to 20, then the response will show the second "page" of results, with items 21 to 30.
    int? offset?;
    # Total number of available items in the API response.
    int? total?;
    # A link used to fetch the previous set or page of items in the API response.
    string? previous?;
    # A link used to fetch the next set or page of items in the API response.
    string? next?;
    # GetTrackingsDetailResponse resource items
    GettrackingsdetailresponseResourceItems[]? items?;
};

# Events registered to this advance ship notice
public type Events record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # Events resource
    EventsResource? 'resource?;
};

# Holds that apply to this advance ship notice
public type ReceivingHold record {
    # This is the unique ID assigned to a particular hold in the shipwire system.
    int? id?;
    # This is the receving order ID in the shipwire system on which the hold is applied.
    int? orderId?;
    # This is the receving order ID in the external system on which the hold is applied.
    string? externalOrderId?;
    # This is the type of hold due to which the order is stuck. (e.g. customer, admin, etc.)
    string? 'type?;
    # This is the description given for the hold in the Shipwire system.
    string? description?;
    # This is the date on which the hold is applied to the order.
    string? appliedDate?;
    # This is the date on which the hold is removed from the order.
    string? clearedDate?;
};

# ReceivingItems resource
public type ReceivingitemsResource record {
    # This is an integer that matches the offset given in the request and dictates the number of items to skip while fetching results. For example, there is a preset limit of 20 results per page. If there are 30 total results and offset is set to 20, then the response will show the second "page" of results, with items 21 to 30.
    int? offset?;
    # Total number of available items in the API response.
    int? total?;
    # A link used to fetch the previous set or page of items in the API response.
    string? previous?;
    # A link used to fetch the next set or page of items in the API response.
    string? next?;
    # ReceivingItems resource items
    ReceivingitemsResourceItems[]? items?;
};

# Options resource
public type OptionsResource record {
    # A unique user-provided identifier for a Shipwire Anywhere warehouse in an external system.
    string? warehouseExternalId?;
    # A unique identifier for a Shipwire or Shipwire Anywhere warehouse.
    int? warehouseId?;
    # This is the place where the warehouse is located.
    string? warehouseRegion?;
    # A boolean which indicates whether or not the warehouse sends ASN related emails on events such as creation, delivery. The value '1' (True) means that the emails will not be sent.
    int? doNotSendEmail?;
};

# ReceivingLotControl resource
public type ReceivinglotcontrolResource record {
    # This is an integer that matches the offset given in the request and dictates the number of items to skip while fetching results. For example, there is a preset limit of 20 results per page. If there are 30 total results and offset is set to 20, then the response will show the second "page" of results, with items 21 to 30.
    int? offset?;
    # Total number of available items in the API response.
    int? total?;
    # A link used to fetch the previous set or page of items in the API response.
    string? previous?;
    # A link used to fetch the next set or page of items in the API response.
    string? next?;
    # ReceivingLotControl resource items
    ReceivinglotcontrolResourceItems[]? items?;
};

# Get trackings details response
public type GetTrackingsDetailResponse record {
    # This is the HTTP status code.
    int? status?;
    # This is the HTTP status message.
    string? message?;
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # GetTrackingsDetailResponse resource
    GettrackingsdetailresponseResource? 'resource?;
};

# GetShipmentDetailsResponse resource
public type GetshipmentdetailsresponseResource record {
    # This is an integer that matches the offset given in the request and dictates the number of items to skip while fetching results. For example, there is a preset limit of 20 results per page. If there are 30 total results and offset is set to 20, then the response will show the second "page" of results, with items 21 to 30.
    int? offset?;
    # Total number of available items in the API response.
    int? total?;
    # A link used to fetch the previous set or page of items in the API response.
    string? previous?;
    # A link used to fetch the next set or page of items in the API response.
    string? next?;
    # GetShipmentDetailsResponse resource items
    GetshipmentdetailsresponseResourceItems[]? items?;
};

# Item being shipped to Shipwire
public type CreateReceivingItem record {
    # SKU (Stock Keeping Unit) is a unique name for your product and is required for both physical and virtual products in inventory.
    string? sku?;
    # The  quantity of total SKU items belonging to the particular lot.
    int? quantity?;
    # A unique auto-generated ID assigned to each new line item added to the Shipwire Platform.
    int? id?;
    # A unique auto-generated ID assigned to each new product added to the Shipwire Product Catalog.
    int? productId?;
    # A unique user-provided identifier for a product in an external system.
    string? productExternalId?;
    # This is the receving order ID in the shipwire system on which the hold is applied.
    int? orderId?;
    # This is the receving order ID in the external system on which the hold is applied.
    string? orderExternalId?;
    # The total number of SKU items expected to be received at the warehouse as per the order.
    int? expected?;
    # The number of pending SKU items expected to be received at the warehouse.
    int? pending?;
    # The number of SKU items ready for fulfillment in the warehouse.
    int? good?;
    # The number of SKU items currently under review within the warehouse. (i.e. items being reviewed to determine if they are in sellable condition or damaged, etc.)
    int? inReview?;
    # The number of SKU items found to be damaged (during receiving or otherwise) within the warehouse and unavailable for fulfillment.
    int? damaged?;
};

# Trackings resource
public type TrackingsResource record {
    # This is an integer that matches the offset given in the request and dictates the number of items to skip while fetching results. For example, there is a preset limit of 20 results per page. If there are 30 total results and offset is set to 20, then the response will show the second "page" of results, with items 21 to 30.
    int? offset?;
    # Total number of available items in the API response.
    int? total?;
    # A link used to fetch the previous set or page of items in the API response.
    string? previous?;
    # A link used to fetch the next set or page of items in the API response.
    string? next?;
    # Trackings resource items
    TrackingsResourceItems[]? items?;
};

# Package routing details
public type Routing record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # Routing resource
    RoutingResource? 'resource?;
};

# Routing resource
public type RoutingResource record {
    # Latitude of the warehouse. This is useful for routing purposes to find the nearest warehouse.
    decimal? originLatitude?;
    # Longitude of the warehouse. This is useful for routing purposes to find the nearest warehouse.
    decimal? originLongitude?;
    # A unique user-provided identifier for a Shipwire Anywhere warehouse in an external system.
    string? warehouseExternalId?;
    # A unique identifier for a Shipwire or Shipwire Anywhere warehouse.
    int? warehouseId?;
    # This is the name of the warehouse.
    string? warehouseName?;
    # This is the place where the warehouse is located.
    string? warehouseRegion?;
};

# Get instructions recipients details response
public type GetHoldDetailsResponse record {
    # This is the HTTP status code.
    int? status?;
    # This is the HTTP status message.
    string? message?;
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # GetHoldDetailsResponse resource
    GetholddetailsresponseResource? 'resource?;
};

public type AdvanceshippingmodelResource record {
    # Unique ID of the Advance Shipping Notice in an external system.
    string? externalId?;
    # Purchase Order number associated with the Advance Shipping Notice.
    string? orderNo?;
    # Unique ID of the Advance Shipping Notice in an Shipwire system.
    int? id?;
    # Transaction ID of the Advance Shipping Notice in Shipwire system.
    string? transactionId?;
    # Date on which the Advance Shipping Notice is expected to arrive at the Shipwire warehouse.
    string? expectedDate?;
    # This determines the medium through which the Advance Shipping Notice is created. If it is created through a shopping cart the commerce name will be Shoppify, Magento. If created through the platform it will be Shippwirewebapp and if created through API it will be Shippwire. If created through Excel sheet it will be Spreadsheet.
    string? commerceName?;
    # Date on which the Advance Shipping Notice was last updated.
    string? lastUpdateDate?;
    # Status of the Advance Shipping Notice. (e.g. completed, held)
    string? status?;
    # A unique ID assigned to each vendor in the Shipwire system. (See the Vendors API.)
    int? vendorId?;
    # A unique user-provided identifier for a vendor in an external system.
    string? vendorExternalId?;
    # Items being shipped to Shipwire
    ReceivingItems? items?;
    ReceivingHolds? holds?;
    # Specifies shipment tracking details. See `trackings` resource.
    Trackings? trackings?;
    # Specifies goods details. See `shipment` resource.
    Shipments? shipments?;
    Labels? labels?;
    # List of contacts and instructions to send to each of them
    InstructionsRecipients? instructionsRecipients?;
    # Specify the warehouse where items are being shipped
    Options? options?;
    # The arrangement type tells Shipwire what further actions to take once the advance ship notice is created.
    Arrangement? arrangement?;
    record {} shipForm?;
    # Package routing details
    Routing? routing?;
    # Events registered to this advance ship notice
    Events? events?;
    Documents? documents?;
    # ReceivingExtendedAttributes resource
    ReceivingextendedattributesResource? extendedAttributes?;
};

public type CreateAnAdvanceShipNoticeRequest record {
    # Unique ID of the Advance Shipping Notice in an external system.
    string? externalId?;
    # Purchase Order number associated with the Advance Shipping Notice.
    string? orderNo?;
    # Date on which the Advance Shipping Notice is expected to arrive at the Shipwire warehouse.
    string? expectedDate?;
    # Options resource
    OptionsResource? options;
    # The arrangement type tells Shipwire what further actions to take once the advance ship notice is created.
    Arrangement? arrangement;
    # Shipment
    Shipment? shipments;
    Label? labels?;
    # Specifies shipment tracking details. See `trackings` resource.
    Tracking[]? trackings?;
    # Items being shipped to Shipwire
    CreateReceivingItem[]? items;
    # Address resource
    AddressResource? shipFrom;
    InstructionsRecipient[]? instructionsRecipients?;
    CreateAnAdvanceShipNoticeRequest? extendedAttributes?;
};

public type GettrackingsdetailresponseResourceItems record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    record {} 'resource?;
};

# The arrangement type tells Shipwire what further actions to take once the advance ship notice is created.
public type Arrangement record {
    # Contact name of the person from Shipwire system responsible for coordinating with the carrier or supplier for arranging delivery if needed.
    string? contact?;
    # Contact phone number of the person from Shipwire system responsible for coordinating with the carrier or supplier for arranging delivery if needed.
    string? phone?;
    # Type
    string? 'type?;
};

# ReceivingItem lotControl
public type ReceivingitemLotcontrol record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # ReceivingLotControl resource
    ReceivinglotcontrolResource? 'resource?;
};

public type CancelAReceivingLabelResponse record {
    # This is the HTTP status code.
    int? status?;
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # This is the HTTP status message.
    string? message?;
};

# Events resource
public type EventsResource record {
    # Date on which the Advance Shipping Notice is created by the merchant.
    string? createdDate?;
    # Date on which the inventory is picked up from the Shipper's address.
    string? pickedUpDate?;
    # Date on which the Advance Shipping Notice is submitted to the Shipwire warehouse.
    string? submittedDate?;
    # Date on which the Advance Shipping Notice is processed i.e. the details of inventory are entered in the Warehouse Management System.
    string? processedDate?;
    # Date on which the Advance Shipping Notice is completed by the merchant.
    string? completedDate?;
    # Date on which the inventory is expected to arrive at the Shipwire warehouse.
    string? expectedDate?;
    # Date on which the inventory is received at the Shipwire warehouse.
    string? deliveredDate?;
    # Date on which the Advance Shipping Notice is cancelled due to any reason.
    string? cancelledDate?;
    # Date on which the partial/full inventory is returned to the Shipper's address.
    string? returnedDate?;
    # Date on which the Advance Shipping Notice was last edited by the merchant manually.
    string? lastManualUpdateDate?;
};

# Items being shipped to Shipwire
public type ReceivingItems record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    # ReceivingItems resource
    ReceivingitemsResource? 'resource?;
};

# Receiving Server Pagination Response
public type ReceivingServerPaginationResponse record {
    # This is an integer that matches the offset given in the request and dictates the number of items to skip while fetching results. For example, there is a preset limit of 20 results per page. If there are 30 total results and offset is set to 20, then the response will show the second "page" of results, with items 21 to 30.
    int? offset?;
    # Total number of available items in the API response.
    int? total?;
    # A link used to fetch the previous set or page of items in the API response.
    string? previous?;
    # A link used to fetch the next set or page of items in the API response.
    string? next?;
};

public type GetshipmentdetailsresponseResourceItems record {
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource.
    string? resourceLocation?;
    record {} 'resource?;
};
