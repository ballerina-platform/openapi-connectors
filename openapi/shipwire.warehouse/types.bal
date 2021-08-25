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

public type ResourceinwarehouseresponseResource record {
    ResourceinwarehouseresponseResourceValues values?;
};

public type ContainerDimensions record {
    # This is the length of the container based on its Unit of Measurement (lengthUnit)
    float length?;
    # This is the width of the container based on its Unit of Measurement (widthUnit)
    float width?;
    # This is the width of the container based on its Unit of Measurement (widthUnit)
    float height?;
    # This is the weight of the container based on its Unit of Measurement (weightUnit)
    float weight?;
    # This is the maximum weight that the container can hold based on its Unit of Measurement (maxWeightUnit)
    float maxWeight?;
    # This is the Unit of Measurement for Container length (e.g. inches)
    string lengthUnit?;
    # This is the Unit of Measurement for Container width (e.g. inches)
    string widthUnit?;
    # This is the Unit of Measurement for Container height (e.g. inches)
    string heightUnit?;
    # This is the Unit of Measurement for Container weight (e.g. pounds)
    string weightUnit?;
    # This is the Unit of Measurement for Container's max weight (e.g. pounds)
    string maxWeightUnit?;
};

# Carrier properties for container
public type GetCarrierProperties record {
    # A string consisting of carrier code and service level.
    string code?;
    # This is the service level code associated with the carrier. There are multiple levels for one type of service. Each level has a specific code. (e.g. For FDX the codes are 1D, 2D, GD, etc.)
    string serviceLevelCode?;
    # Name of the carrier
    string name?;
    # A boolean that indicates the carrier is a freight carrier. The value "1" (True) means this carrier supports heavy weight orders or large items.
    int isFreightCarrier?;
    # A boolean that indicates whether or not the carrier is restricted. The value "1" (True) means this carrier is not available for general use. If required, contact customer care for possible enablement.
    int isRestrictedCarrier?;
    # A boolean that indicates the carrier uses a national government postal service, either for aggregated or for last mile delivery.
    int isPostalCarrier?;
    # A boolean that indicates if the carrier supports US territories. (e.g. Puerto Rico, Guam, etc.)
    int isTerritorySupported?;
    # A boolean that indicates if the carrier supports PO box delivery.
    int isPoBoxSupported?;
    # A boolean that indicates the carrier supports delivery to military addresses (APO, FPO).
    int isApoFpoSupported?;
    # A boolean that indicates the carrier requires pickup. A "0" (False) value would mean that the carrier supports delivery to doorstep. This feature is related to third party carriers.
    int isPickupRequired?;
    # A boolean that indicates the carrier requires a signature upon delivery of the order.
    int isSignatureRequired?;
    # A boolean that indicates the carrier is self-insured for damages that occur to an order while in transit.
    int isSelfInsured?;
    # A boolean that indicates the carrier can transport orders that include dangerous goods. (e.g. chemicals, etc.)
    int isDangerousGoodsSupported?;
    # A boolean that indicates orders transported by the carrier will receive a tracking ID so that it can be tracked after leaving the warehouse through to delivery.
    int isTrackable?;
    # A boolean that indicates the carrier provides special services specific to the handling of media. (e.g. books, videotapes, DVDs, CDs, printed music and other sound recordings)
    int isMediaSupported?;
    # The minimum number of days the carrier takes for shipping the order.
    int minimumShippingDays?;
    # The maximum number of days the carrier takes for shipping the order.
    int maximumShippingDays?;
};

public type CostValues record {
    # This is the cost value for the container. During cartonization (choosing packaging) phase for an order, Shipwire will first consider containers with a lower cost, even if chosing one will end up making the shipping cost comparatively higher. E.g. Shipwire will chose a container 1 with a $0 cost over a container 2 with a $1 cost, even if the shipping cost for using an overly large container 1 is $10 higher than for using a container 2.
    string costValue?;
    # This is the retail value for the container. Container retail value will be added to the shipping quote for the customer. If a merchant doesn't plan to charge customers for cartons/boxes, the container retail value should be set to $0.
    string retailValue?;
    # This is the currency used in determining cost value for the container.
    string costValueCurrency?;
    # This is the currency used in determining retail value for the container.
    string retailValueCurrency?;
};

# Warehouse Resources
public type GetWarehouseResources record {
    # This is an integer that matches the offset given in the request and dictates the number of items to skip while fetching results. For example, there is a preset limit of 20 results per page. If there are 30 total results and offset is set to 20, then the response will show the second "page" of results, with items 21 to 30.
    int offset?;
    # Total number of available items in the API response.
    int total?;
    # A link used to fetch the previous set or page of items in the API response.
    string previous?;
    # A link used to fetch the next set or page of items in the API response.
    string next?;
    # GetWarehouseResources items
    GetwarehouseresourcesItems[] items?;
};

# Create a New Shipwire Anywhere Warehouse
public type CreateANewWarehouseRequest record {
    *PostWarehouseRequest;
};

public type RemoveCarrierRequest record {
    # A string consisting of carrier code and service level.
    string[] carrierCodes;
};

# WarehouseInformation containers
public type WarehouseinformationContainers record {
    # A URL that gives more information about the linked resource. A "null" value would mean that no further information is available for that resource.
    string resourceLocation?;
};

# Sample Post request to create a new warehouse
public type PostWarehouseRequest record {
    # A unique user-provided identifier for the warehouse in an external system.
    string externalId?;
    # Name of the warehouse
    string name;
    # This is the code assigned to the warehouse for easy reference.
    string code?;
    # A unique ID assigned to each vendor in the Shipwire system. (See the Vendors API.)
    int vendorId?;
    # A unique user provided identifier for a vendor in an external system.
    string vendorExternalId?;
    # A boolean which indicates whether or not the warehouse is available to the customer for storage, shipping and receiving inventory.
    int isActive;
    # Address
    record {} address;
    # Latitude of the warehouse. This is useful for routing purposes to find the nearest warehouse.
    float latitude?;
    # Longitude of the warehouse. This is useful for routing purposes to find the nearest warehouse.
    float longitude?;
    # A boolean which indicates whether orders may be routed to this warehouse by our routing engine.
    int isRoutable?;
    # This is the generic format of the label that the warehouse generates for each customer
    string labelFormat;
    # A boolean which indicates whether or not the warehouse can generate shipping labels. These labels are stored on the server and can be given to the customer if required
    int generatesLabels?;
    # This is the unique ID of the Shipwire warehouse used for RMA process and will store returned goods.
    int returnWarehouseId?;
    # This is the external ID of the Shipwire warehouse used for RMA process.
    string returnWarehouseExternalId?;
};

# Get list of containers associated with Warehouse. This contains information for both Shipwire and Shipwire anywhere Warehouse
public type GetContainersAssociatedWithAWarehouseResponse record {
    # This is the HTTP status code.
    int status?;
    # This is the HTTP status message.
    string message?;
    # A URL that gives more information about the linked resource. A "null" value would mean that no further information is available for that resource.
    string resourceLocation?;
    # GetContainersAssociatedWithAWarehouseResponse resource
    GetcontainersassociatedwithawarehouseresponseResource 'resource?;
};

# GetContainersAssociatedWithAWarehouseResponse resource
public type GetcontainersassociatedwithawarehouseresponseResource record {
    # ResourceInWarehouseResponse list
    ResourceInWarehouseResponse[] items?;
};

public type GetAWarehouseResponse record {
    *WarehouseServerResponse;
};

public type GetWarehousesResponse record {
    *WarehouseServerResponse;
};

# Delete Shipwire Anywhere Warehouse from the system
public type RetireAWarehouseResponse record {
    # This is the HTTP status code.
    int status?;
    # This is the HTTP status message.
    string message?;
    # A URL that gives more information about the linked resource. A "null" value would mean that no further information is available for that resource.
    string resourceLocation?;
};

# Carrier Resources
public type CarrierResources record {
    # This is an integer that matches the offset given in the request and dictates the number of items to skip while fetching results. For example, there is a preset limit of 20 results per page. If there are 30 total results and offset is set to 20, then the response will show the second "page" of results, with items 21 to 30.
    int offset?;
    # Total number of available items in the API response.
    int total?;
    # A link used to fetch the previous set or page of items in the API response.
    string previous?;
    # A link used to fetch the next set or page of items in the API response.
    string next?;
    # Items
    record{}[] items?;
};

public type ResourcedimensionvaluesDimensions record {
    # A URL that gives more information about the linked resource. A "null" value would mean that no further information is available for that resource.
    string resourceLocation?;
    ContainerDimensions 'resource?;
};

# WarehouseInformation address
public type WarehouseinformationAddress record {
    # A URL that gives more information about the linked resource. A "null" value would mean that no further information is available for that resource.
    string resourceLocation?;
    # Shipwire Anywhere Warehouse Address
    WarehouseAddress 'resource?;
};

# Shipwire Anywhere Warehouse Address
public type WarehouseAddress record {
    # This is the first line of the address of the warehouse.
    string address1;
    # This is the second line of the address of the warehouse.
    string address2?;
    # This is the third line of the address of the warehouse.
    string address3?;
    # City where the warehouse is located.
    string city;
    # State where the warehouse is located.
    string state;
    # Postal code of the warehouse
    string postalCode;
    # 2 digit country code of the warehouse
    string country;
    # Name of the continent where the warehouse is located.
    string continent?;
    # Name of the warehouse
    string name;
    # Email address of contact at the warehouse for any communication
    string email?;
    # Contact phone number of the warehouse for any communication
    string phone;
    # Contact fax number of the warehouse for any communication
    string fax?;
};

# Carrier Resource Location
public type CarrierResourceLocation record {
    # A URL that gives more information about the linked resource. A "null" value would mean that no further information is available for that resource.
    string resourceLocation?;
    # Carrier properties for container
    GetCarrierProperties 'resource?;
};

public type RetireAWarehouse404Response record {
    # This is the HTTP status code.
    int? status?;
    # This is the HTTP status message.
    string message?;
    # A URL that gives more information about the linked resource. A "null" value would mean that no further information is available for that resource.
    string resourceLocation?;
};

public type ResourceinwarehouseresponseResourceValues record {
    # A URL that gives more information about the linked resource. A "null" value would mean that no further information is available for that resource.
    string resourceLocation?;
    CostValues 'resource?;
};

public type ResourceInWarehouseResponse record {
    # A URL that gives more information about the linked resource. A "null" value would mean that no further information is available for that resource
    string resourceLocation?;
    ResourceinwarehouseresponseResource 'resource?;
};

public type GetwarehouseresourcesItems record {
    # A URL that gives more information about the linked resource. A "null" value would mean that no further information is available for that resource.
    string resourceLocation?;
    # Warehouse resource information
    WarehouseInformation 'resource?;
};

public type CreateANewWarehouseResponse record {
    *WarehouseServerResponse;
};

# Get Warehouses Response based on the criteria provided in the URL
public type WarehouseServerResponse record {
    # This is the HTTP status code.
    int status?;
    # This is the HTTP status message.
    string message?;
};

# Server Pagination Response
public type WarehouserPaginationResponse record {
    # This is an integer that matches the offset given in the request and dictates the number of items to skip while fetching results. For example, there is a preset limit of 20 results per page. If there are 30 total results and offset is set to 20, then the response will show the second "page" of results, with items 21 to 30.
    int offset?;
    # Total number of available items in the API response.
    int total?;
    # A link used to fetch the previous set or page of items in the API response.
    string previous?;
    # A link used to fetch the next set or page of items in the API response.
    string next?;
};

public type ResourceDimensionValues record {
    # A unique auto-generated ID assigned to each new container added to the Shipwire Platform.
    int id?;
    # A unique user-provided identifier for a container in an external system.
    string externalId?;
    # A unique identifier for the container in the Shipwire system.
    string name?;
    # This is the type of container based on the contents stored in it.
    string 'type?;
    # A boolean which indicates whether or not the warehouse can use the container for a particular customer for packaging.
    int isActive?;
    # A unique identifier for a Shipwire or Shipwire Anywhere warehouse. 
    int warehouseId?;
    # A unique user-provided identifier for a Shipwire Anywhere warehouse in an external system.
    string warehouseExternalId?;
    # Basis is a parameter that is used by Shipwire to prioritize the use of some boxes over the others depending on the product dimensions. The higher the box dimensions are the higher the basis will be. The highest basis for standard boxes is 1025. Pallets have the highest basis where as envelopes have the lowest basis. When setting up a merchant specific box, if you want to use this new box over some of the generic boxes that are bigger in volume, you need to assign a higher basis for the new box to ensure products rate into the box you create.
    float basis?;
    # It indicates that this container is used with a particular carrier service (eg. FDX 1D).
    string serviceSpecificCarrierCode?;
    ResourcedimensionvaluesDimensions dimensions?;
};

# Warehouse resource information
public type WarehouseInformation record {
    # A unique auto-generated ID assigned to each new warehouse added to the Shipwire Platform.
    int id?;
    # A unique user-provided identifier for the warehouse in an external system.
    string externalId?;
    # Name of the warehouse
    string name?;
    # This is the code assigned to the warehouse for easy reference.
    string code?;
    # A unique ID assigned to each vendor in the Shipwire system. (See the Vendors API.)
    int vendorId?;
    # A unique user provided identifier for a vendor in an external system.
    string vendorExternalId?;
    # A boolean which indicates whether or not the warehouse is available to the customer for storage, shipping and receiving inventory.
    int isActive?;
    # WarehouseInformation address
    WarehouseinformationAddress address?;
    # Latitude of the warehouse. This is useful for routing purposes to find the nearest warehouse.
    float latitude?;
    # Longitude of the warehouse. This is useful for routing purposes to find the nearest warehouse.
    float longitude?;
    # A boolean which indicates whether orders may be routed to this warehouse by our routing engine.
    int isRoutable?;
    # A boolean which indicates whether or not the warehouse can generate shipping labels. These labels are stored on the server and can be given to the customer if required
    int generatesLabels?;
    # This is the type of the warehouse. It can be Shipwire or Shipwire Anywhere.
    string 'type?;
    # This is the generic format of the label that the warehouse generates for each customer
    string labelFormat?;
    # This warehouse property ensures all shipping labels generated are a combination of packing list and label.
    boolean combineShippingDocuments?;
    # This is the unique ID of the Shipwire warehouse used for RMA process and will store returned goods.
    string returnWarehouseId?;
    # This is the external ID of the Shipwire warehouse used for RMA process.
    string returnWarehouseExternalId?;
    # A shipwire warehouse ID used to identify a specific physical warehouse that corresponds to a Shipwire Anywhere warehouse and is useful in consolidating inventory. If the SKU item is at a Shipwire warehouse, then this will be "null".
    int physicalWarehouseId?;
    # WarehouseInformation containers
    WarehouseinformationContainers containers?;
    # These are customizations to carrier settings (ex. FDX 1D) specific to a warehouse. May relate to destination/origin country & zip code, max shipment dimensions & carrier capabilities etc.
    string carriers?;
};

# Update Shipwire Warehouse Information
public type UpdateAWarehouseRequest record {
    # A unique user-provided identifier for the warehouse in an external system.
    string externalId?;
    # Name of the warehouse
    string name?;
    # This is the code assigned to the warehouse for easy reference.
    string code?;
    # A unique ID assigned to each vendor in the Shipwire system. (See the Vendors API.)
    int vendorId?;
    # A unique user provided identifier for a vendor in an external system.
    string vendorExternalId?;
    # A boolean which indicates whether or not the warehouse is available to the customer for storage, shipping and receiving inventory.
    int isActive?;
    # Shipwire Anywhere Warehouse Address
    WarehouseAddress address?;
    # Latitude of the warehouse. This is useful for routing purposes to find the nearest warehouse.
    float latitude?;
    # Longitude of the warehouse. This is useful for routing purposes to find the nearest warehouse.
    float longitude?;
    # A boolean which indicates whether orders may be routed to this warehouse by our routing engine.
    int isRoutable?;
    # A boolean which indicates whether or not the warehouse can generate shipping labels. These labels are stored on the server and can be given to the customer if required
    int generatesLabels?;
    # This is the unique ID of the Shipwire warehouse used for RMA process and will store returned goods.
    string returnWarehouseId?;
    # This is the external ID of the Shipwire warehouse used for RMA process.
    string returnWarehouseExternalId?;
};

public type AddCarrierRequest record {
    # A string consisting of carrier code and service level.
    string[] carrierCodes;
};

public type GetCarriersResponse record {
    *WarehouseServerResponse;
};
