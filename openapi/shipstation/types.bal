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

public type ListTagsresponseArr ListTagsresponse[];

public type ListCarriersresponseArr ListCarriersresponse[];

public type ListPackagesresponseArr ListPackagesresponse[];

public type ListServicesresponseArr ListServicesresponse[];

public type GetRatesresponseArr GetRatesresponse[];

public type ListStoresresponseArr ListStoresresponse[];

public type ListMarketplacesresponseArr ListMarketplacesresponse[];

public type ListWarehousesresponseArr ListWarehousesresponse[];

public type RegisterAccountresponse record {
    string message;
    int sellerId;
    boolean success;
    string apiKey;
    string apiSecret;
};

public type RemoveTagfromOrderresponse record {
    boolean success;
    string message;
};

public type ShipTo2 record {
    string name;
    string company;
    string street1;
    string street2;
    string? street3?;
    string city;
    string state;
    string postalCode;
    string country;
    string phone;
    boolean residential;
    string addressVerified;
};

public type ListOrdersbyTagresponse record {
    # 
    Order2[] orders;
    int total;
    int page;
    int pages;
};

public type Customer record {
    int customerId;
    string createDate;
    string modifyDate?;
    string name;
    string company;
    string street1;
    string street2;
    string city;
    string state;
    string postalCode;
    string countryCode;
    string phone;
    string email;
    string addressVerified;
    # 
    MarketplaceUsername[] marketplaceUsernames;
    # 
    Tag[] tags;
};

public type ShipTo3 record {
    string name;
    string company;
    string street1;
    string street2;
    string? street3?;
    string city;
    string state;
    string postalCode;
    string country;
    string phone;
    boolean residential;
};

public type ShipTo6 record {
    string name;
    string company;
    string street1;
    string street2;
    string? street3?;
    string city;
    string state;
    string postalCode;
    string country;
    string? phone?;
    boolean residential;
    string addressVerified;
};

public type Product record {
    string? aliases?;
    int productId;
    string sku;
    string name;
    int price;
    int defaultCost;
    int length;
    int width;
    int height;
    int weightOz;
    string? internalNotes?;
    string fulfillmentSku;
    string createDate;
    string modifyDate;
    boolean active;
    ProductCategory productCategory;
    string? productType?;
    string warehouseLocation;
    string defaultCarrierCode;
    string defaultServiceCode;
    string defaultPackageCode;
    string defaultIntlCarrierCode;
    string defaultIntlServiceCode;
    string defaultIntlPackageCode;
    string defaultConfirmation;
    string defaultIntlConfirmation;
    string? customsDescription?;
    string? customsValue?;
    string? customsTariffNo?;
    string? customsCountryCode?;
    string? noCustoms?;
    # 
    Tag[] tags;
};

public type RefreshStorerequest record {
    int storeId;
    string refreshDate;
};

public type Item record {
    int orderItemId;
    string lineItemKey;
    string sku;
    string name;
    string? imageUrl?;
    Weight weight;
    int quantity;
    decimal unitPrice;
    string? taxAmount?;
    string? shippingAmount?;
    string warehouseLocation;
    # 
    Option[] options;
    int productId;
    string? fulfillmentSku?;
    boolean adjustment;
    string? upc?;
    string createDate;
    string modifyDate;
};

public type UnassignUserfromOrderrequest record {
    # 
    int[] orderIds;
};

public type CreateShipmentLabelresponse record {
    int shipmentId;
    string? orderId?;
    string? userId?;
    string? customerEmail?;
    string? orderNumber?;
    string createDate;
    string shipDate;
    decimal shipmentCost;
    int insuranceCost;
    string trackingNumber;
    boolean isReturnLabel;
    string? batchNumber?;
    string carrierCode;
    string serviceCode;
    string packageCode;
    string confirmation;
    string? warehouseId?;
    boolean voided;
    string? voidDate?;
    boolean marketplaceNotified;
    string? notifyErrorMessage?;
    string? shipTo?;
    string? weight?;
    string? dimensions?;
    string? insuranceOptions?;
    string? advancedOptions?;
    string? shipmentItems?;
    string labelData;
    string? formData?;
};

public type AddTagtoOrderrequest record {
    int orderId;
    int tagId;
};

public type InternationalOptions1 record {
    string? contents?;
    string? customsItems?;
};

public type InternationalOptions4 record {
    string contents;
    # 
    CustomsItem[] customsItems;
    string nonDelivery;
};

public type ShipFrom record {
    string name;
    string company;
    string street1;
    string street2;
    string? street3?;
    string city;
    string state;
    string postalCode;
    string country;
    string? phone?;
    boolean residential;
};

public type HoldOrderUntilrequest record {
    int orderId;
    string holdUntilDate;
};

public type UpdateProductresponse record {
    boolean success;
    string message;
};

public type StatusMapping record {
    string orderStatus;
    string statusKey;
};

public type CreateLabelforOrderrequest record {
    int orderId;
    string carrierCode;
    string serviceCode;
    string packageCode;
    string? confirmation?;
    string shipDate;
    Weight weight;
    string? dimensions?;
    string? insuranceOptions?;
    string? internationalOptions?;
    string? advancedOptions?;
    boolean testLabel;
};

public type ListUsersresponse record {
    string userId;
    string userName;
    string name;
};

public type Fulfillment record {
    int fulfillmentId;
    int orderId;
    string orderNumber;
    string userId;
    string customerEmail;
    string trackingNumber;
    string createDate;
    string shipDate;
    string? voidDate?;
    string? deliveryDate?;
    string carrierCode;
    string? fulfillmentProviderCode?;
    string? fulfillmentServiceCode?;
    int fulfillmentFee;
    boolean voidRequested;
    boolean voided;
    boolean marketplaceNotified;
    string? notifyErrorMessage?;
    ShipTo shipTo;
};

public type CreateWarehouserequest record {
    string warehouseName;
    OriginAddress3 originAddress;
    string? returnAddress?;
    boolean isDefault;
};

public type SubscribetoWebhookrequest record {
    string target_url;
    string event;
    string? store_id?;
    string friendly_name;
};

public type InternationalOptions record {
    string? contents?;
    string? customsItems?;
    string? nonDelivery?;
};

public type MarkanOrderasShippedrequest record {
    int orderId;
    string carrierCode;
    string shipDate;
    string trackingNumber;
    boolean notifyCustomer;
    boolean notifySalesChannel;
};

public type UpdateStoreresponse record {
    int storeId;
    string storeName;
    int marketplaceId;
    string marketplaceName;
    string? accountName?;
    string? email?;
    string integrationUrl;
    boolean active;
    string companyName;
    string phone;
    string publicEmail;
    string website;
    string refreshDate;
    string lastRefreshAttempt;
    string createDate;
    string modifyDate;
    boolean autoRefresh;
    # 
    StatusMapping[] statusMappings;
};

public type ShipTo9 record {
    string name;
    string company;
    string street1;
    string street2;
    string? street3?;
    string city;
    string state;
    string postalCode;
    string country;
    string phone;
    string? residential?;
};

public type ReactivateStoreresponse record {
    string success;
    string message;
};

public type ReturnAddress3 record {
    string name;
    string company;
    string street1;
    string street2;
    string street3;
    string city;
    string state;
    string postalCode;
    string country;
    string phone;
    string? residential?;
};

public type AddFundsresponse record {
    string name;
    string code;
    string accountNumber;
    boolean requiresFundedAccount;
    decimal balance;
};

public type SortBy string;

public type InsuranceOptions record {
    string provider;
    boolean insureShipment;
    int insuredValue;
};

public type CustomsItem record {
    int customsItemId;
    string description;
    int quantity;
    int value;
    string? harmonizedTariffCode?;
    string countryOfOrigin;
};

public type OriginAddress record {
    string name;
    string company;
    string street1;
    string? street2?;
    string? street3?;
    string city;
    string state;
    string postalCode;
    string country;
    string phone;
    boolean residential;
    string? addressVerified?;
};

public type ListServicesresponse record {
    string carrierCode;
    string code;
    string name;
    boolean domestic;
    boolean international;
};

public type OriginAddress3 record {
    string name;
    string company;
    string street1;
    string? street2?;
    string? street3?;
    string city;
    string state;
    string postalCode;
    string country;
    string phone;
    boolean residential;
};

public type OriginAddress4 record {
    string name;
    string company;
    string street1;
    string street2;
    string street3;
    string city;
    string state;
    string postalCode;
    string country;
    string phone;
    boolean residential;
};

public type OrderStatus string;

public type GetCarrierresponse record {
    string name;
    string code;
    string accountNumber;
    boolean requiresFundedAccount;
    decimal balance;
    string? nickname?;
    int shippingProviderId;
    boolean primary;
};

public type Item6 record {
    int orderItemId;
    string lineItemKey;
    string sku;
    string name;
    string? imageUrl?;
    Weight weight;
    int quantity;
    decimal unitPrice;
    decimal taxAmount;
    int shippingAmount;
    string warehouseLocation;
    # 
    Option[] options;
    int productId;
    string? fulfillmentSku?;
    boolean adjustment;
    string upc;
    string createDate;
    string modifyDate;
};

public type UpdateWarehouserequest record {
    int warehouseId;
    string warehouseName;
    OriginAddress originAddress;
    ReturnAddress returnAddress;
    string createDate;
    boolean isDefault;
};

public type Item4 record {
    int orderItemId;
    string? lineItemKey?;
    string sku;
    string name;
    string? imageUrl?;
    Weight weight;
    int quantity;
    decimal unitPrice;
    string? taxAmount?;
    string? shippingAmount?;
    string warehouseLocation;
    # 
    Option[] options;
    int productId;
    string fulfillmentSku;
    boolean adjustment;
    string? upc?;
    string createDate;
    string modifyDate;
};

public type DeactivateStorerequest record {
    string storeId;
};

public type ShipTo11 record {
    string name;
    string company;
    string street1;
    string street2;
    string? street3?;
    string city;
    string state;
    string postalCode;
    string country;
    string? phone?;
    boolean residential;
};

public type CreateLabelforOrderresponse record {
    int shipmentId;
    decimal shipmentCost;
    int insuranceCost;
    string trackingNumber;
    string labelData;
    string? formData?;
};

public type SortDir string;

public type Item1 record {
    string lineItemKey;
    string sku;
    string name;
    string? imageUrl?;
    Weight weight;
    int quantity;
    decimal unitPrice;
    decimal taxAmount;
    decimal shippingAmount;
    string warehouseLocation;
    # 
    Option[] options;
    int productId;
    string? fulfillmentSku?;
    boolean adjustment;
    string upc;
};

public type UpdateWarehouseresponse record {
    int warehouseId;
    string warehouseName;
    OriginAddress originAddress;
    ReturnAddress returnAddress;
    string createDate;
    boolean isDefault;
};

public type Item2 record {
    int orderItemId;
    string lineItemKey;
    string sku;
    string name;
    string? imageUrl?;
    Weight weight;
    int quantity;
    decimal unitPrice;
    decimal taxAmount;
    int shippingAmount;
    string warehouseLocation;
    # 
    Option[] options;
    string? productId?;
    string? fulfillmentSku?;
    boolean adjustment;
    string upc;
    string createDate;
    string modifyDate;
};

public type Dimensions record {
    string units;
    int length;
    int width;
    int height;
};

public type RemoveTagfromOrderrequest record {
    int orderId;
    int tagId;
};

public type CreateOrUpdateMultipleOrdersrequest record {
    string orderNumber;
    string orderKey;
    string orderDate;
    string paymentDate;
    string shipByDate;
    string orderStatus;
    int customerId;
    string customerUsername;
    string customerEmail;
    BillTo1 billTo;
    ShipTo3 shipTo;
    # 
    Item1[] items;
    decimal amountPaid;
    int taxAmount;
    int shippingAmount;
    string customerNotes;
    string internalNotes;
    boolean gift;
    string giftMessage;
    string paymentMethod;
    string requestedShippingService;
    string carrierCode;
    string serviceCode;
    string packageCode;
    string confirmation;
    string shipDate;
    Weight weight;
    Dimensions dimensions;
    InsuranceOptions insuranceOptions;
    InternationalOptions1 internationalOptions;
    AdvancedOptions advancedOptions;
    # 
    int[] tagIds;
};

public type ShipmentItem record {
    int orderItemId;
    string? lineItemKey?;
    string sku;
    string name;
    string? imageUrl?;
    string? weight?;
    int quantity;
    int unitPrice;
    string? warehouseLocation?;
    string? options?;
    int productId;
    string? fulfillmentSku?;
};

public type AddTagtoOrderresponse record {
    boolean success;
    string message;
};

public type GetOrderresponse record {
    int orderId;
    string orderNumber;
    string orderKey;
    string orderDate;
    string createDate;
    string modifyDate;
    string paymentDate;
    string shipByDate;
    string orderStatus;
    int customerId;
    string customerUsername;
    string customerEmail;
    BillTo billTo;
    ShipTo2 shipTo;
    # 
    Item[] items;
    decimal orderTotal;
    decimal amountPaid;
    int taxAmount;
    int shippingAmount;
    string customerNotes;
    string internalNotes;
    boolean gift;
    string giftMessage;
    string paymentMethod;
    string requestedShippingService;
    string carrierCode;
    string serviceCode;
    string packageCode;
    string confirmation;
    string shipDate;
    string? holdUntilDate?;
    Weight weight;
    Dimensions dimensions;
    InsuranceOptions insuranceOptions;
    InternationalOptions internationalOptions;
    AdvancedOptions advancedOptions;
    string? tagIds?;
    string? userId?;
    boolean externallyFulfilled;
    string? externallyFulfilledBy?;
};

public type ListTagsresponse record {
    int tagId;
    string name;
    string color;
};

public type DeleteOrderresponse record {
    boolean success;
    string message;
};

public type ShipTo record {
    string name;
    string? company?;
    string street1;
    string? street2?;
    string? street3?;
    string city;
    string state;
    string postalCode;
    string country;
    string phone;
    string? residential?;
    string? addressVerified?;
};

public type Webhook record {
    boolean IsLabelAPIHook;
    int WebHookID;
    int SellerID;
    int StoreID;
    string HookType;
    string MessageFormat;
    string Url;
    string Name;
    string? BulkCopyBatchID?;
    string? BulkCopyRecordID?;
    boolean Active;
    # 
    string[] WebhookLogs;
    string? Seller?;
    string? Store?;
};

public type Tag record {
    int tagId;
    string name;
};

public type RegisterAccountrequest record {
    string firstName;
    string lastName;
    string email;
    string password;
    string companyName?;
    string addr1?;
    string addr2?;
    string city?;
    string state?;
    string zip?;
    string countryCode?;
    string phone?;
};

public type ListMarketplacesresponse record {
    string name;
    int marketplaceId;
    boolean canRefresh;
    boolean supportsCustomMappings;
    boolean supportsCustomStatuses;
    boolean canConfirmShipments;
};

public type ListPackagesresponse record {
    string carrierCode;
    string code;
    string name;
    boolean domestic;
    boolean international;
};

public type DeactivateStoreresponse record {
    string success;
    string message;
};

public type Order2 record {
    int orderId;
    string orderNumber;
    string orderKey;
    string orderDate;
    string createDate;
    string modifyDate;
    string paymentDate;
    string shipByDate;
    string orderStatus;
    int customerId;
    string customerUsername;
    string customerEmail;
    BillTo billTo;
    ShipTo2 shipTo;
    # 
    Item6[] items;
    decimal orderTotal;
    decimal amountPaid;
    int taxAmount;
    int shippingAmount;
    string customerNotes;
    string internalNotes;
    boolean gift;
    string giftMessage;
    string paymentMethod;
    string requestedShippingService;
    string carrierCode;
    string serviceCode;
    string packageCode;
    string confirmation;
    string shipDate;
    string? holdUntilDate?;
    Weight weight;
    Dimensions dimensions;
    InsuranceOptions insuranceOptions;
    InternationalOptions internationalOptions;
    AdvancedOptions advancedOptions;
    # 
    int[] tagIds;
    string userId;
    boolean externallyFulfilled;
    string? externallyFulfilledBy?;
};

public type SubscribetoWebhookresponse record {
    int id;
};

public type ListCarriersresponse record {
    string name;
    string code;
    string accountNumber;
    boolean requiresFundedAccount;
    decimal balance;
    string? nickname?;
    int shippingProviderId;
    boolean primary;
};

public type CreateOrUpdateOrderresponse record {
    int orderId;
    string orderNumber;
    string orderKey;
    string orderDate;
    string createDate;
    string modifyDate;
    string paymentDate;
    string shipByDate;
    string orderStatus;
    string? customerId?;
    string customerUsername;
    string customerEmail;
    BillTo billTo;
    ShipTo2 shipTo;
    # 
    Item2[] items;
    decimal orderTotal;
    decimal amountPaid;
    int taxAmount;
    int shippingAmount;
    string customerNotes;
    string internalNotes;
    boolean gift;
    string giftMessage;
    string paymentMethod;
    string requestedShippingService;
    string carrierCode;
    string serviceCode;
    string packageCode;
    string confirmation;
    string shipDate;
    string? holdUntilDate?;
    Weight weight;
    Dimensions dimensions;
    InsuranceOptions insuranceOptions;
    InternationalOptions internationalOptions;
    AdvancedOptions advancedOptions;
    string? tagIds?;
    string? userId?;
    boolean externallyFulfilled;
    string? externallyFulfilledBy?;
};

public type AdvancedOptions4 record {
    int warehouseId;
    boolean nonMachinable;
    boolean saturdayDelivery;
    boolean containsAlcohol;
    boolean mergedOrSplit;
    # 
    string[] mergedIds;
    string? parentId?;
    int storeId;
    string customField1;
    string customField2;
    string? customField3?;
    string? 'source?;
    string? billToParty?;
    string? billToAccount?;
    string? billToPostalCode?;
    string? billToCountryCode?;
};

public type GetWarehouseresponse record {
    int warehouseId;
    string warehouseName;
    OriginAddress originAddress;
    ReturnAddress returnAddress;
    string createDate;
    boolean isDefault;
};

public type Result record {
    int orderId;
    string orderNumber;
    string orderKey;
    boolean success;
    string? errorMessage?;
};

public type AdvancedOptions record {
    int warehouseId;
    boolean nonMachinable;
    boolean saturdayDelivery;
    boolean containsAlcohol;
    boolean mergedOrSplit;
    # 
    string[] mergedIds;
    string? parentId?;
    int storeId;
    string customField1;
    string customField2;
    string customField3;
    string 'source;
    string? billToParty?;
    string? billToAccount?;
    string? billToPostalCode?;
    string? billToCountryCode?;
};

public type CreateOrUpdateMultipleOrdersresponse record {
    boolean hasErrors;
    # 
    Result[] results;
};

public type SortBy3 string;

public type SortBy2 string;

public type SortBy1 string;

public type BillTo record {
    string name;
    string? company?;
    string? street1?;
    string? street2?;
    string? street3?;
    string? city?;
    string? state?;
    string? postalCode?;
    string? country?;
    string? phone?;
    string? residential?;
    string? addressVerified?;
};

public type AssignUsertoOrderrequest record {
    # 
    int[] orderIds;
    string userId;
};

public type ReactivateStorerequest record {
    string storeId;
};

public type GetStoreresponse record {
    int storeId;
    string storeName;
    int marketplaceId;
    string marketplaceName;
    string? accountName?;
    string? email?;
    string integrationUrl;
    boolean active;
    string companyName;
    string phone;
    string publicEmail;
    string website;
    string refreshDate;
    string lastRefreshAttempt;
    string createDate;
    string modifyDate;
    boolean autoRefresh;
    # 
    StatusMapping[] statusMappings;
};

public type Order record {
    int orderId;
    string orderNumber;
    string orderKey;
    string orderDate;
    string createDate;
    string modifyDate;
    string paymentDate;
    string shipByDate;
    string orderStatus;
    int customerId;
    string customerUsername;
    string customerEmail;
    BillTo billTo;
    ShipTo6 shipTo;
    # 
    Item4[] items;
    decimal orderTotal;
    decimal amountPaid;
    decimal taxAmount;
    int shippingAmount;
    string customerNotes;
    string internalNotes;
    boolean gift;
    string? giftMessage?;
    string? paymentMethod?;
    string requestedShippingService;
    string carrierCode;
    string serviceCode;
    string packageCode;
    string confirmation;
    string shipDate;
    string? holdUntilDate?;
    Weight weight;
    Dimensions dimensions;
    InsuranceOptions4 insuranceOptions;
    InternationalOptions4 internationalOptions;
    AdvancedOptions4 advancedOptions;
    string? tagIds?;
    string? userId?;
    boolean externallyFulfilled;
    string? externallyFulfilledBy?;
};

public type MarkanOrderasShippedresponse record {
    int orderId;
    string orderNumber;
};

public type VoidLabelresponse record {
    boolean approved;
    string message;
};

public type UpdateProductrequest record {
    string? aliases?;
    int productId;
    string sku;
    string name;
    int price;
    string? defaultCost?;
    string? length?;
    string? width?;
    string? height?;
    string? weightOz?;
    string? internalNotes?;
    string? fulfillmentSku?;
    boolean active;
    string? productCategory?;
    string? productType?;
    string? warehouseLocation?;
    string? defaultCarrierCode?;
    string? defaultServiceCode?;
    string? defaultPackageCode?;
    string? defaultIntlCarrierCode?;
    string? defaultIntlServiceCode?;
    string? defaultIntlPackageCode?;
    string? defaultConfirmation?;
    string? defaultIntlConfirmation?;
    string? customsDescription?;
    string? customsValue?;
    string? customsTariffNo?;
    string? customsCountryCode?;
    string? noCustoms?;
    string? tags?;
};

public type MarketplaceUsername record {
    int customerUserId;
    int customerId;
    string createDate;
    string modifyDate;
    int marketplaceId;
    string marketplace;
    string username;
};

public type RestoreOrderfromOnHoldresponse record {
    boolean success;
    string message;
};

public type Shipment record {
    int shipmentId;
    int orderId;
    string orderKey?;
    string userId;
    string orderNumber;
    string createDate;
    string shipDate;
    decimal shipmentCost;
    int insuranceCost;
    string trackingNumber;
    boolean isReturnLabel;
    string batchNumber;
    string carrierCode;
    string serviceCode;
    string packageCode;
    string confirmation;
    int warehouseId;
    boolean voided;
    string? voidDate?;
    boolean marketplaceNotified;
    string? notifyErrorMessage?;
    ShipTo9 shipTo;
    Weight weight;
    string? dimensions?;
    InsuranceOptions4 insuranceOptions;
    string? advancedOptions?;
    # 
    ShipmentItem[] shipmentItems;
    string? labelData?;
    string? formData?;
};

public type CreateShipmentLabelrequest record {
    string carrierCode;
    string serviceCode;
    string packageCode;
    string confirmation?;
    string shipDate;
    Weight weight;
    Dimensions dimensions?;
    ShipFrom shipFrom;
    ShipTo11 shipTo;
    string? insuranceOptions?;
    string? internationalOptions?;
    string? advancedOptions?;
    boolean testLabel;
};

public type ListFulfillmentsResponse record {
    # 
    Fulfillment[] fulfillments;
    int total;
    int page;
    int pages;
};

public type Weight record {
    int value;
    string units;
};

public type RestoreOrderfromOnHoldrequest record {
    int orderId;
};

public type InsuranceOptions4 record {
    string? provider?;
    boolean insureShipment;
    int insuredValue;
};

public type ProductCategory record {
    int categoryId;
    string name;
};

public type Option record {
    string name?;
    string value?;
};

public type GetCustomerresponse record {
    int customerId;
    string createDate;
    string modifyDate;
    string name;
    string company;
    string street1;
    string street2;
    string city;
    string state;
    string postalCode;
    string countryCode;
    string phone;
    string email;
    string addressVerified;
    # 
    MarketplaceUsername[] marketplaceUsernames;
    # 
    Tag[] tags;
};

public type GetStoreRefreshStatusresponse record {
    int storeId;
    int refreshStatusId;
    string refreshStatus;
    string lastRefreshAttempt;
    string refreshDate;
};

public type ListWarehousesresponse record {
    int warehouseId;
    string warehouseName;
    OriginAddress4 originAddress;
    ReturnAddress3 returnAddress;
    string createDate;
    boolean isDefault;
};

public type RefreshStoreresponse record {
    boolean success;
    string message;
};

public type DeleteWarehouseresponse record {
    boolean success;
    string message;
};

public type AddFundsrequest record {
    string carrierCode;
    decimal amount;
};

public type BillTo1 record {
    string name;
    string? company?;
    string? street1?;
    string? street2?;
    string? street3?;
    string? city?;
    string? state?;
    string? postalCode?;
    string? country?;
    string? phone?;
    string? residential?;
};

public type UnassignUserfromOrderresponse record {
    boolean success;
    string message;
};

public type ReturnAddress record {
    string name;
    string company;
    string street1;
    string? street2?;
    string? street3?;
    string city;
    string state;
    string postalCode;
    string country;
    string phone;
    string? residential?;
    string? addressVerified?;
};

public type ListStoresresponse record {
    int storeId;
    string storeName;
    int marketplaceId;
    string marketplaceName;
    string? accountName?;
    string? email?;
    string? integrationUrl?;
    boolean active;
    string companyName;
    string phone;
    string publicEmail;
    string website;
    string refreshDate;
    string lastRefreshAttempt;
    string createDate;
    string modifyDate;
    boolean autoRefresh;
};

public type ListCustomersResponse record {
    # 
    Customer[] customers;
    int total;
    int page;
    int pages;
};

public type UpdateStorerequest record {
    int storeId;
    string storeName;
    int marketplaceId;
    string marketplaceName;
    string? accountName?;
    string? email?;
    string integrationUrl;
    boolean active;
    string companyName;
    string phone;
    string publicEmail;
    string website;
    string refreshDate;
    string lastRefreshAttempt;
    string createDate;
    string modifyDate;
    boolean autoRefresh;
    # 
    StatusMapping[] statusMappings;
};

public type GetProductresponse record {
    string? aliases?;
    int productId;
    string sku;
    string name;
    int price;
    int defaultCost;
    int length;
    int width;
    int height;
    int weightOz;
    string? internalNotes?;
    string fulfillmentSku;
    string createDate;
    string modifyDate;
    boolean active;
    ProductCategory productCategory;
    string? productType?;
    string warehouseLocation;
    string defaultCarrierCode;
    string defaultServiceCode;
    string defaultPackageCode;
    string defaultIntlCarrierCode;
    string defaultIntlServiceCode;
    string defaultIntlPackageCode;
    string defaultConfirmation;
    string defaultIntlConfirmation;
    string? customsDescription?;
    string? customsValue?;
    string? customsTariffNo?;
    string? customsCountryCode?;
    string? noCustoms?;
    # 
    Tag[] tags;
};

public type HoldOrderUntilresponse record {
    boolean success;
    string message;
};

public type ListShipmentsResponse record {
    # 
    Shipment[] shipments;
    int total;
    int page;
    int pages;
};

public type GetRatesresponse record {
    string serviceName;
    string serviceCode;
    decimal shipmentCost;
    decimal otherCost;
};

public type CreateOrUpdateOrderrequest record {
    string orderNumber;
    string orderKey;
    string orderDate;
    string paymentDate;
    string shipByDate;
    string orderStatus;
    int customerId;
    string customerUsername;
    string customerEmail;
    BillTo1 billTo;
    ShipTo3 shipTo;
    # 
    Item1[] items;
    decimal amountPaid;
    int taxAmount;
    int shippingAmount;
    string customerNotes;
    string internalNotes;
    boolean gift;
    string giftMessage;
    string paymentMethod;
    string requestedShippingService;
    string carrierCode;
    string serviceCode;
    string packageCode;
    string confirmation;
    string shipDate;
    Weight weight;
    Dimensions dimensions;
    InsuranceOptions insuranceOptions;
    InternationalOptions1 internationalOptions;
    AdvancedOptions advancedOptions;
    # 
    int[] tagIds;
};

public type ListProductsResponse record {
    # 
    Product[] products;
    int total;
    int page;
    int pages;
};

public type CreateWarehouseresponse record {
    int warehouseId;
    string warehouseName;
    OriginAddress4 originAddress;
    ReturnAddress3 returnAddress;
    string createDate;
    boolean isDefault;
};

public type ListWebhooksresponse record {
    # 
    Webhook[] webhooks;
};

public type VoidLabelrequest record {
    int shipmentId;
};

public type GetRatesrequest record {
    string carrierCode;
    string? serviceCode?;
    string? packageCode?;
    string fromPostalCode;
    string toState;
    string toCountry;
    string toPostalCode;
    string toCity;
    Weight weight;
    Dimensions dimensions;
    string confirmation;
    boolean residential;
};

public type AssignUsertoOrderresponse record {
    boolean success;
    string message;
};

public type ListOrdersResponse record {
    # 
    Order[] orders;
    int total;
    int page;
    int pages;
};
