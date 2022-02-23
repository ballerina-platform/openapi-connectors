// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

public type ShoppingListSetStoreAction record {
    *ShoppingListUpdateAction;
    string action?;
    StoreResourceIdentifier store?;
};

public type TypeChangeEnumValueOrderAction record {
    *TypeUpdateAction;
    string action?;
    string fieldName?;
    string[] keys?;
};

public type CartAddShoppingListAction record {
    *CartUpdateAction;
    string action?;
    ShoppingListResourceIdentifier shoppingList?;
    ChannelResourceIdentifier supplyChannel?;
    ChannelResourceIdentifier distributionChannel?;
};

public type ProductSetAssetTagsAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    boolean staged?;
    string assetId?;
    string assetKey?;
    string[] tags?;
};

public type ProductSetKeyAction record {
    *ProductUpdateAction;
    string action?;
    string 'key?;
};

public type ProductDiscountPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    ProductDiscount[] results?;
};

public type ZoneRateDraft record {
    ZoneResourceIdentifier zone?;
    ShippingRateDraft[] shippingRates?;
};

public type GraphQLErrorLocation record {
    int line?;
    int column?;
};

public type ProductTypeDraft record {
    string 'key?;
    string name?;
    string description?;
    AttributeDefinitionDraft[] attributes?;
};

public type AttributeDateType record {
    *AttributeType;
    string name?;
};

public type CurrencyCode string;

public type CartDiscountChangeSortOrderAction record {
    *CartDiscountUpdateAction;
    string action?;
    string sortOrder?;
};

public type Suggestion record {
    string text?;
};

public type OrderEditAppliedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    OrderEditReference edit?;
    OrderEditApplied result?;
};

public type CartValueTier record {
    *ShippingRatePriceTier;
    ShippingRateTierType 'type?;
    int minimumCentAmount?;
    Money price?;
    boolean isMatching?;
};

public type CartSetCustomFieldAction record {
    *CartUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type IronMqDestination record {
    *Destination;
    string 'type?;
    string uri?;
};

public type MyCustomerSetCustomTypeAction record {
    *MyCustomerUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type ShippingMethodUpdateAction record {
    string action?;
};

public type ResourceTypeId string;

public type CartSetShippingAddressCustomTypeAction record {
    *CartUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type InventoryEntryCreatedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    InventoryEntry inventoryEntry?;
};

public type StoreUpdateAction record {
    string action?;
};

public type TaxMode string;

public type PaymentInfo record {
    PaymentReference[] payments?;
};

public type ParcelItemsUpdatedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string parcelId?;
    string deliveryId?;
    DeliveryItem[] items?;
    DeliveryItem[] oldItems?;
};

public type ProductRemoveFromCategoryAction record {
    *ProductUpdateAction;
    string action?;
    CategoryResourceIdentifier category?;
    boolean staged?;
};

public type QueryPredicate string;

public type CartScoreTier record {
    *ShippingRatePriceTier;
    ShippingRateTierType 'type?;
    float score?;
    Money price?;
    PriceFunction priceFunction?;
    boolean isMatching?;
};

public type CustomFieldNumberType record {
    *FieldType;
    string name?;
};

public type DiscountedLineItemPortion record {
    CartDiscountReference discount?;
    TypedMoney discountedAmount?;
};

public type CartSetCustomLineItemTaxRateAction record {
    *CartUpdateAction;
    string action?;
    string customLineItemId?;
    ExternalTaxRateDraft externalTaxRate?;
};

public type PaymentStatusInterfaceCodeSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string paymentId?;
    string interfaceCode?;
};

public type ProductDiscountChangePredicateAction record {
    *ProductDiscountUpdateAction;
    string action?;
    string predicate?;
};

public type CustomerGroupPagedQueryResponse record {
    int 'limit?;
    int offset?;
    int count?;
    int total?;
    CustomerGroup[] results?;
};

public type ApiClientDraft record {
    string name?;
    string scope?;
    int deleteDaysAfterCreation?;
};

public type MyCustomerSetSalutationAction record {
    *MyCustomerUpdateAction;
    string action?;
    string salutation?;
};

public type CategoryRemoveAssetAction record {
    *CategoryUpdateAction;
    string action?;
    string assetId?;
    string assetKey?;
};

public type DiscountCodeState string;

public type CategorySetDescriptionAction record {
    *CategoryUpdateAction;
    string action?;
    LocalizedString description?;
};

public type ProductPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    Product[] results?;
};

public type ShippingMethodChangeNameAction record {
    *ShippingMethodUpdateAction;
    string action?;
    string name?;
};

public type CartUpdateItemShippingAddressAction record {
    *CartUpdateAction;
    string action?;
    BaseAddress address?;
};

public type SearchIndexingConfigurationValues record {
    SearchIndexingConfigurationStatus status?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
};

public type ProjectNotConfiguredForLanguagesError record {
    *ErrorObject;
    string code?;
    string message?;
    string[] languages?;
};

public type DiscountedLineItemPriceDraft record {
    Money value?;
    DiscountedLineItemPortion[] includedDiscounts?;
};

public type DeliveryAddedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    Delivery delivery?;
};

public type CustomObjectDraft record {
    string container?;
    string 'key?;
    string|record {}|string[]|decimal|int|boolean value?;
    int 'version?;
};

public type DiscountCodeSetValidUntilAction record {
    *DiscountCodeUpdateAction;
    string action?;
    string validUntil?;
};

public type NoMatchingProductDiscountFoundError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type CustomerChangeEmailAction record {
    *CustomerUpdateAction;
    string action?;
    string email?;
};

public type MyShoppingListSetLineItemCustomFieldAction record {
    *MyShoppingListUpdateAction;
    string action?;
    string lineItemId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type CustomerRemoveAddressAction record {
    *CustomerUpdateAction;
    string action?;
    string addressId?;
    string addressKey?;
};

public type ShippingRateDraft record {
    Money price?;
    Money freeAbove?;
    ShippingRatePriceTier[] tiers?;
};

public type ChannelSetCustomFieldAction record {
    *ChannelUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type CustomerSetDefaultBillingAddressAction record {
    *CustomerUpdateAction;
    string action?;
    string addressId?;
    string addressKey?;
};

public type StagedOrderSetCustomFieldAction record {
    *StagedOrderUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type TaxedPrice record {
    TypedMoney totalNet?;
    TypedMoney totalGross?;
    TaxPortion[] taxPortions?;
};

public type ShippingInfoImportDraft record {
    string shippingMethodName?;
    Money price?;
    ShippingRateDraft shippingRate?;
    TaxRate taxRate?;
    TaxCategoryResourceIdentifier taxCategory?;
    ShippingMethodResourceIdentifier shippingMethod?;
    Delivery[] deliveries?;
    DiscountedLineItemPriceDraft discountedPrice?;
    ShippingMethodState shippingMethodState?;
};

public type MyCartSetLineItemDistributionChannelAction record {
    *MyCartUpdateAction;
    string action?;
    string lineItemId?;
    ChannelResourceIdentifier distributionChannel?;
};

public type InvalidInputError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type CustomLineItemStateTransitionMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string customLineItemId?;
    string transitionDate?;
    int quantity?;
    StateReference fromState?;
    StateReference toState?;
};

public type StoreProductSelectionsChangedMessagePayload record {
    *MessagePayload;
    string 'type?;
    ProductSelectionSetting[] addedProductSelections?;
    ProductSelectionSetting[] removedProductSelections?;
    ProductSelectionSetting[] updatedProductSelections?;
};

public type ProductSetMetaKeywordsAction record {
    *ProductUpdateAction;
    string action?;
    LocalizedString metaKeywords?;
    boolean staged?;
};

public type OrderSearchQuery string;

public type ChannelSetRolesAction record {
    *ChannelUpdateAction;
    string action?;
    ChannelRoleEnum[] roles?;
};

public type CartDiscountChangeIsActiveAction record {
    *CartDiscountUpdateAction;
    string action?;
    boolean isActive?;
};

public type ShippingMethodResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type CustomFieldLocalizedEnumType record {
    *FieldType;
    string name?;
    CustomFieldLocalizedEnumValue[] values?;
};

public type OrderStateTransitionMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    StateReference state?;
    StateReference oldState?;
    boolean force?;
};

public type TypeChangeKeyAction record {
    *TypeUpdateAction;
    string action?;
    string 'key?;
};

public type CategorySlugChangedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    LocalizedString slug?;
    LocalizedString oldSlug?;
};

public type CustomerCreatedMessagePayload record {
    *MessagePayload;
    string 'type?;
    Customer customer?;
};

public type DiscountCode record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    LocalizedString name?;
    LocalizedString description?;
    string code?;
    CartDiscountReference[] cartDiscounts?;
    string cartPredicate?;
    boolean isActive?;
    Reference[] references?;
    int maxApplications?;
    int maxApplicationsPerCustomer?;
    CustomFields custom?;
    string[] groups?;
    string validFrom?;
    string validUntil?;
    int applicationVersion?;
};

public type ShoppingListSetAnonymousIdAction record {
    *ShoppingListUpdateAction;
    string action?;
    string anonymousId?;
};

public type OrderSetCustomLineItemShippingDetailsAction record {
    *OrderUpdateAction;
    string action?;
    string customLineItemId?;
    ItemShippingDetailsDraft shippingDetails?;
};

public type OutOfStockError record {
    *ErrorObject;
    string code?;
    string message?;
    string[] lineItems?;
    string[] skus?;
};

public type StoreRemoveDistributionChannelAction record {
    *StoreUpdateAction;
    string action?;
    ChannelResourceIdentifier distributionChannel?;
};

public type StagedOrderSetParcelCustomTypeAction record {
    *StagedOrderUpdateAction;
    string action?;
    string parcelId?;
    TypeResourceIdentifier 'type?;
    record {} fields?;
};

public type ProductPriceDiscountsSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    ProductPriceDiscountsSetUpdatedPrice[] updatedPrices?;
};

public type ProjectChangeOrderSearchStatusAction record {
    *ProjectUpdateAction;
    string action?;
    OrderSearchStatus status?;
};

public type ChannelSetAddressAction record {
    *ChannelUpdateAction;
    string action?;
    BaseAddress address?;
};

public type OrderLineItemDiscountSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    string lineItemId?;
    DiscountedLineItemPriceForQuantity[] discountedPricePerQuantity?;
    Money totalPrice?;
    TaxedItemPrice taxedPrice?;
};

public type MyCustomerChangeAddressAction record {
    *MyCustomerUpdateAction;
    string action?;
    string addressId?;
    string addressKey?;
    BaseAddress address?;
};

public type OrderCustomerGroupSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    CustomerGroupReference customerGroup?;
    CustomerGroupReference oldCustomerGroup?;
};

public type CategorySetCustomTypeAction record {
    *CategoryUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type CustomerUpdate record {
    int 'version?;
    CustomerUpdateAction[] actions?;
};

public type OrderSetDeliveryAddressCustomFieldAction record {
    *OrderUpdateAction;
    string action?;
    string deliveryId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type CategoryResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type ResourceUpdatedDelivery record {
    *SubscriptionDelivery;
    string projectKey?;
    string notificationType?;
    Reference 'resource?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    int 'version?;
    int oldVersion?;
    string modifiedAt?;
};

public type ProductDiscountSetKeyAction record {
    *ProductDiscountUpdateAction;
    string action?;
    string 'key?;
};

public type AttributeLocalizedEnumType record {
    *AttributeType;
    string name?;
    AttributeLocalizedEnumValue[] values?;
};

public type ReviewUpdateAction record {
    string action?;
};

public type StagedOrderSetReturnInfoAction record {
    *StagedOrderUpdateAction;
    string action?;
    ReturnInfoDraft[] items?;
};

public type SubscriptionChangeDestinationAction record {
    *SubscriptionUpdateAction;
    string action?;
    Destination destination?;
};

public type LineItemMode string;

public type CategorySetMetaKeywordsAction record {
    *CategoryUpdateAction;
    string action?;
    LocalizedString metaKeywords?;
};

public type ProductSetDescriptionAction record {
    *ProductUpdateAction;
    string action?;
    LocalizedString description?;
    boolean staged?;
};

public type CartDiscountSetValidFromAction record {
    *CartDiscountUpdateAction;
    string action?;
    string validFrom?;
};

public type ProductDiscountReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    ProductDiscount obj?;
};

public type PaymentSetTransactionCustomFieldAction record {
    *PaymentUpdateAction;
    string action?;
    string transactionId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type CustomLineItemReturnItem record {
    *ReturnItem;
    string id?;
    int quantity?;
    string 'type?;
    string comment?;
    ReturnShipmentState shipmentState?;
    ReturnPaymentState paymentState?;
    CustomFields custom?;
    string lastModifiedAt?;
    string createdAt?;
    string customLineItemId?;
};

public type StagedOrderSetParcelItemsAction record {
    *StagedOrderUpdateAction;
    string action?;
    string parcelId?;
    DeliveryItem[] items?;
};

public type CartAddCustomLineItemAction record {
    *CartUpdateAction;
    string action?;
    Money money?;
    LocalizedString name?;
    int quantity?;
    string slug?;
    TaxCategoryResourceIdentifier taxCategory?;
    CustomFieldsDraft custom?;
    ExternalTaxRateDraft externalTaxRate?;
};

public type CustomObjectReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    CustomObject obj?;
};

public type OrderReturnShipmentStateChangedMessagePayload record {
    *MessagePayload;
    string 'type?;
    string returnItemId?;
    ReturnShipmentState returnShipmentState?;
};

public type OrderUpdateAction record {
    string action?;
};

public type StateReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    State obj?;
};

public type OrderSetCustomerIdAction record {
    *OrderUpdateAction;
    string action?;
    string customerId?;
};

public type CustomFieldEnumType record {
    *FieldType;
    string name?;
    CustomFieldEnumValue[] values?;
};

public type ProductTypeChangePlainEnumValueLabelAction record {
    *ProductTypeUpdateAction;
    string action?;
    string attributeName?;
    AttributePlainEnumValue newValue?;
};

public type ShippingMethodSetLocalizedDescriptionAction record {
    *ShippingMethodUpdateAction;
    string action?;
    LocalizedString localizedDescription?;
};

public type OrderReturnShipmentStateChangedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string returnItemId?;
    ReturnShipmentState returnShipmentState?;
};

public type StagedOrderChangeShipmentStateAction record {
    *StagedOrderUpdateAction;
    string action?;
    ShipmentState shipmentState?;
};

public type CustomerEmailVerify record {
    int 'version?;
    string tokenValue?;
};

public type CustomFieldLocalizedStringType record {
    *FieldType;
    string name?;
};

public type State record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string 'key?;
    StateTypeEnum 'type?;
    LocalizedString name?;
    LocalizedString description?;
    boolean initial?;
    boolean builtIn?;
    StateRoleEnum[] roles?;
    StateReference[] transitions?;
};

public type CartSetCustomerIdAction record {
    *CartUpdateAction;
    string action?;
    string customerId?;
};

public type ProductPublishScope string;

public type ExtensionUpdateActionsFailedError record {
    *ErrorObject;
    string code?;
    string message?;
    LocalizedString localizedMessage?;
    record {} extensionExtraInfo?;
    ErrorByExtension errorByExtension?;
};

public type ExtensionInput record {
    ExtensionAction action?;
    Reference 'resource?;
};

public type CustomerAddBillingAddressIdAction record {
    *CustomerUpdateAction;
    string action?;
    string addressId?;
    string addressKey?;
};

public type ProductChangeMasterVariantAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    boolean staged?;
};

public type TransactionType string;

public type ProductUnpublishAction record {
    *ProductUpdateAction;
    string action?;
};

public type MyCartSetDeleteDaysAfterLastModificationAction record {
    *MyCartUpdateAction;
    string action?;
    int deleteDaysAfterLastModification?;
};

public type StateAddRolesAction record {
    *StateUpdateAction;
    string action?;
    StateRoleEnum[] roles?;
};

public type ZoneSetKeyAction record {
    *ZoneUpdateAction;
    string action?;
    string 'key?;
};

public type CartDiscountValueAbsolute record {
    *CartDiscountValue;
    string 'type?;
    TypedMoney[] money?;
};

public type OrderSetParcelCustomTypeAction record {
    *OrderUpdateAction;
    string action?;
    string parcelId?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type OrderSetShippingAddressCustomTypeAction record {
    *OrderUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type OrderShippingAddressSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    Address address?;
    Address oldAddress?;
};

public type CustomerAddAddressAction record {
    *CustomerUpdateAction;
    string action?;
    BaseAddress address?;
};

public type CartDiscountReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    CartDiscount obj?;
};

public type DiscountCodeSetDescriptionAction record {
    *DiscountCodeUpdateAction;
    string action?;
    LocalizedString description?;
};

public type CartRemovePaymentAction record {
    *CartUpdateAction;
    string action?;
    PaymentResourceIdentifier payment?;
};

public type OrderLineItemDistributionChannelSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string lineItemId?;
    ChannelReference distributionChannel?;
};

public type CartsConfiguration record {
    boolean countryTaxRateFallbackEnabled?;
    int deleteDaysAfterLastModification?;
};

public type CartDraft record {
    CurrencyCode currency?;
    string 'key?;
    string customerId?;
    string customerEmail?;
    CustomerGroupResourceIdentifier customerGroup?;
    string anonymousId?;
    StoreResourceIdentifier store?;
    string country?;
    InventoryMode inventoryMode?;
    TaxMode taxMode?;
    RoundingMode taxRoundingMode?;
    TaxCalculationMode taxCalculationMode?;
    LineItemDraft[] lineItems?;
    CustomLineItemDraft[] customLineItems?;
    BaseAddress shippingAddress?;
    BaseAddress billingAddress?;
    ShippingMethodResourceIdentifier shippingMethod?;
    ExternalTaxRateDraft externalTaxRateForShippingMethod?;
    CustomFieldsDraft custom?;
    string locale?;
    int deleteDaysAfterLastModification?;
    CartOrigin origin?;
    ShippingRateInputDraft shippingRateInput?;
    BaseAddress[] itemShippingAddresses?;
    string[] discountCodes?;
};

public type OrderTransitionCustomLineItemStateAction record {
    *OrderUpdateAction;
    string action?;
    string customLineItemId?;
    int quantity?;
    StateResourceIdentifier fromState?;
    StateResourceIdentifier toState?;
    string actualTransitionDate?;
};

public type CustomerGroupSetCustomFieldAction record {
    *CustomerGroupUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type DeliveryAddressSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    string deliveryId?;
    Address address?;
    Address oldAddress?;
};

public type CartDiscountSetValidFromAndUntilAction record {
    *CartDiscountUpdateAction;
    string action?;
    string validFrom?;
    string validUntil?;
};

public type CustomerGroupChangeNameAction record {
    *CustomerGroupUpdateAction;
    string action?;
    string name?;
};

public type ChannelChangeKeyAction record {
    *ChannelUpdateAction;
    string action?;
    string 'key?;
};

public type ProductChangePriceAction record {
    *ProductUpdateAction;
    string action?;
    string priceId?;
    PriceDraft price?;
    boolean staged?;
};

public type GraphQLVariablesMap record {
};

public type ProductDiscountValueExternalDraft record {
    *ProductDiscountValueDraft;
    string 'type?;
};

public type PaymentStatusStateTransitionMessagePayload record {
    *MessagePayload;
    string 'type?;
    StateReference state?;
    boolean force?;
};

public type CustomTokenizer record {
    *SuggestTokenizer;
    string 'type?;
    string[] inputs?;
};

public type ResourceCreatedDelivery record {
    *SubscriptionDelivery;
    string projectKey?;
    string notificationType?;
    Reference 'resource?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    int 'version?;
    string modifiedAt?;
};

public type ProductTypeChangeNameAction record {
    *ProductTypeUpdateAction;
    string action?;
    string name?;
};

public type SubscriptionSetChangesAction record {
    *SubscriptionUpdateAction;
    string action?;
    ChangeSubscription[] changes?;
};

public type MatchingPriceNotFoundError record {
    *ErrorObject;
    string code?;
    string message?;
    string productId?;
    int variantId?;
    string currency?;
    string country?;
    CustomerGroupReference customerGroup?;
    ChannelReference 'channel?;
};

public type ExternalLineItemTotalPrice record {
    Money price?;
    Money totalPrice?;
};

public type CartSetAnonymousIdAction record {
    *CartUpdateAction;
    string action?;
    string anonymousId?;
};

public type OrderSetDeliveryAddressAction record {
    *OrderUpdateAction;
    string action?;
    string deliveryId?;
    BaseAddress address?;
};

public type DiscountCodeUpdateAction record {
    string action?;
};

public type OrderChangePaymentStateAction record {
    *OrderUpdateAction;
    string action?;
    PaymentState paymentState?;
};

public type ProductSelectionResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type ChannelDraft record {
    string 'key?;
    ChannelRoleEnum[] roles?;
    LocalizedString name?;
    LocalizedString description?;
    BaseAddress address?;
    CustomFieldsDraft custom?;
    GeoJson geoLocation?;
};

public type MyShoppingListChangeTextLineItemNameAction record {
    *MyShoppingListUpdateAction;
    string action?;
    string textLineItemId?;
    LocalizedString name?;
};

public type OrderSetDeliveryCustomFieldAction record {
    *OrderUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type PaymentStatusInterfaceCodeSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    string paymentId?;
    string interfaceCode?;
};

public type ZonePagedQueryResponse record {
    int 'limit?;
    int offset?;
    int count?;
    int total?;
    Zone[] results?;
};

public type MyShoppingListAddLineItemAction record {
    *MyShoppingListUpdateAction;
    string action?;
    string sku?;
    string productId?;
    int variantId?;
    int quantity?;
    string addedAt?;
    CustomFieldsDraft custom?;
};

public type ProductProjection record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    string 'key?;
    ProductTypeReference productType?;
    LocalizedString name?;
    LocalizedString description?;
    LocalizedString slug?;
    CategoryReference[] categories?;
    CategoryOrderHints categoryOrderHints?;
    LocalizedString metaTitle?;
    LocalizedString metaDescription?;
    LocalizedString metaKeywords?;
    SearchKeywords searchKeywords?;
    boolean hasStagedChanges?;
    boolean published?;
    ProductVariant masterVariant?;
    ProductVariant[] variants?;
    TaxCategoryReference taxCategory?;
    StateReference state?;
    ReviewRatingStatistics reviewRatingStatistics?;
};

public type TaxCategoryPagedQueryResponse record {
    int 'limit?;
    int offset?;
    int count?;
    int total?;
    TaxCategory[] results?;
};

public type InvalidCredentialsError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type ProductPriceExternalDiscountSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    int variantId?;
    string variantKey?;
    string sku?;
    string priceId?;
    DiscountedPrice discounted?;
    boolean staged?;
};

public type ReviewSetCustomTypeAction record {
    *ReviewUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type ProductDiscountSetValidFromAndUntilAction record {
    *ProductDiscountUpdateAction;
    string action?;
    string validFrom?;
    string validUntil?;
};

public type Asset record {
    string id?;
    AssetSource[] sources?;
    LocalizedString name?;
    LocalizedString description?;
    string[] tags?;
    CustomFields custom?;
    string 'key?;
};

public type DiscountCodeNonApplicableError record {
    *ErrorObject;
    string code?;
    string message?;
    string discountCode?;
    string reason?;
    string dicountCodeId?;
    string validFrom?;
    string validUntil?;
    string validityCheckTime?;
};

public type DiscountCodeSetMaxApplicationsPerCustomerAction record {
    *DiscountCodeUpdateAction;
    string action?;
    int maxApplicationsPerCustomer?;
};

public type InventoryEntryUpdate record {
    int 'version?;
    InventoryEntryUpdateAction[] actions?;
};

public type StagedOrderSetLineItemPriceAction record {
    *StagedOrderUpdateAction;
    string action?;
    string lineItemId?;
    Money externalPrice?;
};

public type StagedOrderSetLineItemShippingDetailsAction record {
    *StagedOrderUpdateAction;
    string action?;
    string lineItemId?;
    ItemShippingDetailsDraft shippingDetails?;
};

public type ProjectChangeShoppingListsConfigurationAction record {
    *ProjectUpdateAction;
    string action?;
    ShoppingListsConfiguration shoppingListsConfiguration?;
};

public type PaymentSetMethodInfoInterfaceAction record {
    *PaymentUpdateAction;
    string action?;
    string interface?;
};

public type ProductsInStorePagedQueryResponse record {
    int 'limit?;
    int offset?;
    int count?;
    int total?;
    ProductSelectionAssignment[] results?;
};

public type ShoppingListsConfiguration record {
    int deleteDaysAfterLastModification?;
};

public type StateSetRolesAction record {
    *StateUpdateAction;
    string action?;
    StateRoleEnum[] roles?;
};

public type MyOrderFromCartDraft record {
    string id?;
    int 'version?;
};

public type ZoneRemoveLocationAction record {
    *ZoneUpdateAction;
    string action?;
    Location location?;
};

public type MyCustomerRemoveAddressAction record {
    *MyCustomerUpdateAction;
    string action?;
    string addressId?;
    string addressKey?;
};

public type DeliveryAddedMessagePayload record {
    *MessagePayload;
    string 'type?;
    Delivery delivery?;
};

public type OrderCustomLineItemDiscountSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    string customLineItemId?;
    DiscountedLineItemPriceForQuantity[] discountedPricePerQuantity?;
    TaxedItemPrice taxedPrice?;
};

public type TaxCategoryAddTaxRateAction record {
    *TaxCategoryUpdateAction;
    string action?;
    TaxRateDraft taxRate?;
};

public type MyCartChangeLineItemQuantityAction record {
    *MyCartUpdateAction;
    string action?;
    string lineItemId?;
    int quantity?;
    Money externalPrice?;
    ExternalLineItemTotalPrice externalTotalPrice?;
};

public type MyPaymentChangeAmountPlannedAction record {
    *MyPaymentUpdateAction;
    string action?;
    Money amount?;
};

public type ProductPriceDiscountsSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    ProductPriceDiscountsSetUpdatedPrice[] updatedPrices?;
};

public type ReferencedResourceNotFoundError record {
    *ErrorObject;
    string code?;
    string message?;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type CartSetLineItemTaxRateAction record {
    *CartUpdateAction;
    string action?;
    string lineItemId?;
    ExternalTaxRateDraft externalTaxRate?;
};

public type StagedOrderTransitionLineItemStateAction record {
    *StagedOrderUpdateAction;
    string action?;
    string lineItemId?;
    int quantity?;
    StateResourceIdentifier fromState?;
    StateResourceIdentifier toState?;
    string actualTransitionDate?;
};

public type CategorySetAssetCustomFieldAction record {
    *CategoryUpdateAction;
    string action?;
    string assetId?;
    string assetKey?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type TypeAddEnumValueAction record {
    *TypeUpdateAction;
    string action?;
    string fieldName?;
    CustomFieldEnumValue value?;
};

public type OrderState string;

public type StagedOrderSetLocaleAction record {
    *StagedOrderUpdateAction;
    string action?;
    string locale?;
};

public type OrderTransitionStateAction record {
    *OrderUpdateAction;
    string action?;
    StateResourceIdentifier state?;
    boolean force?;
};

public type ProductLegacySetSkuAction record {
    *ProductUpdateAction;
    string action?;
    string sku?;
    int variantId?;
};

public type OrderSearchSorting string;

public type ProductTypeRemoveAttributeDefinitionAction record {
    *ProductTypeUpdateAction;
    string action?;
    string name?;
};

public type ExtensionChangeDestinationAction record {
    *ExtensionUpdateAction;
    string action?;
    ExtensionDestination destination?;
};

public type StoreProductSelectionsChangedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    ProductSelectionSetting[] addedProductSelections?;
    ProductSelectionSetting[] removedProductSelections?;
    ProductSelectionSetting[] updatedProductSelections?;
};

public type ReviewCreatedMessagePayload record {
    *MessagePayload;
    string 'type?;
    Review review?;
};

public type SyntaxErrorError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type CustomerEmailVerifiedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
};

public type CartDiscount record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    LocalizedString name?;
    string 'key?;
    LocalizedString description?;
    CartDiscountValue value?;
    string cartPredicate?;
    CartDiscountTarget target?;
    string sortOrder?;
    boolean isActive?;
    string validFrom?;
    string validUntil?;
    boolean requiresDiscountCode?;
    Reference[] references?;
    StackingMode stackingMode?;
    CustomFields custom?;
};

public type MyCartUpdate record {
    int 'version?;
    MyCartUpdateAction[] actions?;
};

public type ParcelAddedToDeliveryMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    Delivery delivery?;
    Parcel parcel?;
};

public type InternalConstraintViolatedError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type ProductTypeSetInputTipAction record {
    *ProductTypeUpdateAction;
    string action?;
    string attributeName?;
    LocalizedString inputTip?;
};

public type OrderEditSetCommentAction record {
    *OrderEditUpdateAction;
    string action?;
    string comment?;
};

public type SubscriptionUpdateAction record {
    string action?;
};

public type AttributeDateTimeType record {
    *AttributeType;
    string name?;
};

public type DiscountCodeSetCartPredicateAction record {
    *DiscountCodeUpdateAction;
    string action?;
    string cartPredicate?;
};

public type ShippingMethodRemoveShippingRateAction record {
    *ShippingMethodUpdateAction;
    string action?;
    ZoneResourceIdentifier zone?;
    ShippingRateDraft shippingRate?;
};

public type ProductSetAssetDescriptionAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    boolean staged?;
    string assetId?;
    string assetKey?;
    LocalizedString description?;
};

public type DeliveryCloudEventsFormat record {
    *DeliveryFormat;
    string 'type?;
    string cloudEventsVersion?;
};

public type CustomFieldMoneyType record {
    *FieldType;
    string name?;
};

public type PaymentCreatedMessagePayload record {
    *MessagePayload;
    string 'type?;
    Payment payment?;
};

public type ProjectChangeProductSearchIndexingEnabledAction record {
    *ProjectUpdateAction;
    string action?;
    boolean enabled?;
};

public type CustomerAddressAddedMessagePayload record {
    *MessagePayload;
    string 'type?;
    Address address?;
};

public type OrderRemovePaymentAction record {
    *OrderUpdateAction;
    string action?;
    PaymentResourceIdentifier payment?;
};

public type StoreUpdate record {
    int 'version?;
    StoreUpdateAction[] actions?;
};

public type CustomerSetVatIdAction record {
    *CustomerUpdateAction;
    string action?;
    string vatId?;
};

public type MyPaymentDraft record {
    Money amountPlanned?;
    PaymentMethodInfo paymentMethodInfo?;
    CustomFieldsDraft custom?;
    MyTransactionDraft 'transaction?;
};

public type CategoryDraft record {
    LocalizedString name?;
    LocalizedString slug?;
    LocalizedString description?;
    CategoryResourceIdentifier parent?;
    string orderHint?;
    string externalId?;
    LocalizedString metaTitle?;
    LocalizedString metaDescription?;
    LocalizedString metaKeywords?;
    CustomFieldsDraft custom?;
    AssetDraft[] assets?;
    string 'key?;
};

public type CustomerAddressChangedMessagePayload record {
    *MessagePayload;
    string 'type?;
    Address address?;
};

public type CustomerChangePassword record {
    string id?;
    int 'version?;
    string currentPassword?;
    string newPassword?;
};

public type OrderShippingRateInputSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    ShippingRateInput shippingRateInput?;
    ShippingRateInput oldShippingRateInput?;
};

public type ProjectChangeNameAction record {
    *ProjectUpdateAction;
    string action?;
    string name?;
};

public type ReviewStateTransitionMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    StateReference oldState?;
    StateReference newState?;
    boolean oldIncludedInStatistics?;
    boolean newIncludedInStatistics?;
    Reference target?;
    boolean force?;
};

public type MyCustomerSetCustomFieldAction record {
    *MyCustomerUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type ProductSelectionSetting record {
    ProductSelectionReference productSelection?;
    boolean active?;
};

public type StagedOrderAddItemShippingAddressAction record {
    *StagedOrderUpdateAction;
    string action?;
    BaseAddress address?;
};

public type KeyReference record {
    ReferenceTypeId typeId?;
    string 'key?;
};

public type TypeChangeNameAction record {
    *TypeUpdateAction;
    string action?;
    LocalizedString name?;
};

public type SearchIndexingConfiguration record {
    SearchIndexingConfigurationValues products?;
    SearchIndexingConfigurationValues orders?;
};

public type StorePagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    Store[] results?;
};

public type CustomerDateOfBirthSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    string dateOfBirth?;
};

public type StagedOrderSetLineItemDistributionChannelAction record {
    *StagedOrderUpdateAction;
    string action?;
    string lineItemId?;
    ChannelResourceIdentifier distributionChannel?;
};

public type DeliveryRemovedMessagePayload record {
    *MessagePayload;
    string 'type?;
    Delivery delivery?;
};

public type TaxCalculationMode string;

public type SearchDeactivatedError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type ProductAddedToCategoryMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    CategoryReference category?;
    boolean staged?;
};

public type MyShoppingListSetDescriptionAction record {
    *MyShoppingListUpdateAction;
    string action?;
    LocalizedString description?;
};

public type OrderShippingInfoSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    ShippingInfo shippingInfo?;
    ShippingInfo oldShippingInfo?;
};

public type SuggestionResult record {
};

public type ShoppingListSetCustomFieldAction record {
    *ShoppingListUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type ProductDiscountValueAbsoluteDraft record {
    *ProductDiscountValueDraft;
    string 'type?;
    Money[] money?;
};

public type MultiBuyCustomLineItemsTarget record {
    *CartDiscountTarget;
    string 'type?;
    string predicate?;
    int triggerQuantity?;
    int discountedQuantity?;
    int maxOccurrence?;
    SelectionMode selectionMode?;
};

public type Sort string;

public type ShippingInfo record {
    string shippingMethodName?;
    TypedMoney price?;
    ShippingRate shippingRate?;
    TaxedItemPrice taxedPrice?;
    TaxRate taxRate?;
    TaxCategoryReference taxCategory?;
    ShippingMethodReference shippingMethod?;
    Delivery[] deliveries?;
    DiscountedLineItemPrice discountedPrice?;
    ShippingMethodState shippingMethodState?;
};

public type CartSetCustomTypeAction record {
    *CartUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type ExtensionTrigger record {
    ExtensionResourceTypeId resourceTypeId?;
    ExtensionAction[] actions?;
};

public type StagedOrderAddCustomLineItemAction record {
    *StagedOrderUpdateAction;
    string action?;
    Money money?;
    LocalizedString name?;
    float quantity?;
    string slug?;
    TaxCategoryResourceIdentifier taxCategory?;
    CustomFieldsDraft custom?;
    ExternalTaxRateDraft externalTaxRate?;
};

public type ShoppingListSetCustomerAction record {
    *ShoppingListUpdateAction;
    string action?;
    CustomerResourceIdentifier customer?;
};

public type ExternalTaxRateDraft record {
    string name?;
    float amount?;
    string country?;
    string state?;
    SubRate[] subRates?;
    boolean includedInPrice?;
};

public type StagedOrderSetCustomLineItemTaxAmountAction record {
    *StagedOrderUpdateAction;
    string action?;
    string customLineItemId?;
    ExternalTaxAmountDraft externalTaxAmount?;
};

public type CartDiscountChangeStackingModeAction record {
    *CartDiscountUpdateAction;
    string action?;
    StackingMode stackingMode?;
};

public type PriceTierDraft record {
    int minimumQuantity?;
    Money value?;
};

public type MaxResourceLimitExceededError record {
    *ErrorObject;
    string code?;
    string message?;
    ReferenceTypeId exceededResource?;
};

public type MyShoppingListSetLineItemCustomTypeAction record {
    *MyShoppingListUpdateAction;
    string action?;
    string lineItemId?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type StagedOrderSetParcelMeasurementsAction record {
    *StagedOrderUpdateAction;
    string action?;
    string parcelId?;
    ParcelMeasurements measurements?;
};

public type CustomerResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type MyCustomerRemoveBillingAddressIdAction record {
    *MyCustomerUpdateAction;
    string action?;
    string addressId?;
    string addressKey?;
};

public type ProductDiscountUpdate record {
    int 'version?;
    ProductDiscountUpdateAction[] actions?;
};

public type CustomerGroupUpdate record {
    int 'version?;
    CustomerGroupUpdateAction[] actions?;
};

public type CustomerSetStoresAction record {
    *CustomerUpdateAction;
    string action?;
    StoreResourceIdentifier[] stores?;
};

public type ShoppingListChangeNameAction record {
    *ShoppingListUpdateAction;
    string action?;
    LocalizedString name?;
};

public type MyCustomerSetDateOfBirthAction record {
    *MyCustomerUpdateAction;
    string action?;
    string dateOfBirth?;
};

public type TypeAddLocalizedEnumValueAction record {
    *TypeUpdateAction;
    string action?;
    string fieldName?;
    CustomFieldLocalizedEnumValue value?;
};

public type SubscriptionSetKeyAction record {
    *SubscriptionUpdateAction;
    string action?;
    string 'key?;
};

public type Transaction record {
    string id?;
    string timestamp?;
    TransactionType 'type?;
    TypedMoney amount?;
    string interactionId?;
    TransactionState state?;
    CustomFields custom?;
};

public type PaymentSetAmountPaidAction record {
    *PaymentUpdateAction;
    string action?;
    Money amount?;
};

public type AssignedProductReference record {
    ProductReference product?;
};

public type StagedOrderSetShippingMethodTaxRateAction record {
    *StagedOrderUpdateAction;
    string action?;
    ExternalTaxRateDraft externalTaxRate?;
};

public type ProductSelectionChangeNameAction record {
    *ProductSelectionUpdateAction;
    string action?;
    LocalizedString name?;
};

public type TypeUpdateAction record {
    string action?;
};

public type OverCapacityError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type CartSetCountryAction record {
    *CartUpdateAction;
    string action?;
    CountryCode country?;
};

public type ShippingRate record {
    TypedMoney price?;
    TypedMoney freeAbove?;
    boolean isMatching?;
    ShippingRatePriceTier[] tiers?;
};

public type CartSetCartTotalTaxAction record {
    *CartUpdateAction;
    string action?;
    Money externalTotalGross?;
    TaxPortionDraft[] externalTaxPortions?;
};

public type ProductRemoveAssetAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    boolean staged?;
    string assetId?;
    string assetKey?;
};

public type CustomerPasswordUpdatedMessagePayload record {
    *MessagePayload;
    string 'type?;
    boolean reset?;
};

public type StagedOrderChangeTaxRoundingModeAction record {
    *StagedOrderUpdateAction;
    string action?;
    RoundingMode taxRoundingMode?;
};

public type BadGatewayError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type PaymentState string;

public type ShippingRatePriceTier record {
    ShippingRateTierType 'type?;
};

public type GeoJson record {
    string 'type?;
};

public type SubscriptionUpdate record {
    int 'version?;
    SubscriptionUpdateAction[] actions?;
};

public type StagedOrderUpdateItemShippingAddressAction record {
    *StagedOrderUpdateAction;
    string action?;
    BaseAddress address?;
};

public type WeakPasswordError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type OrderSetReturnPaymentStateAction record {
    *OrderUpdateAction;
    string action?;
    string returnItemId?;
    ReturnPaymentState paymentState?;
};

public type OrderPagedSearchResponse record {
    int total?;
    int offset?;
    int 'limit?;
    Hit[] hits?;
};

public type CustomerFirstNameSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    string firstName?;
};

public type StagedOrderAddParcelToDeliveryAction record {
    *StagedOrderUpdateAction;
    string action?;
    string deliveryId?;
    ParcelMeasurements measurements?;
    TrackingData trackingData?;
    DeliveryItem[] items?;
};

public type ParcelRemovedFromDeliveryMessagePayload record {
    *MessagePayload;
    string 'type?;
    string deliveryId?;
    Parcel parcel?;
};

public type ProductSetMetaDescriptionAction record {
    *ProductUpdateAction;
    string action?;
    LocalizedString metaDescription?;
    boolean staged?;
};

public type OrderReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    Order obj?;
};

public type SearchFacetPathNotFoundError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type EditPreviewFailedError record {
    *ErrorObject;
    string code?;
    string message?;
    OrderEditPreviewFailure result?;
};

public type ShoppingListChangeLineItemQuantityAction record {
    *ShoppingListUpdateAction;
    string action?;
    string lineItemId?;
    int quantity?;
};

public type ProductSelectionProductAddedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    ProductReference product?;
};

public type ShoppingListPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    ShoppingList[] results?;
};

public type CategorySetAssetDescriptionAction record {
    *CategoryUpdateAction;
    string action?;
    string assetId?;
    string assetKey?;
    LocalizedString description?;
};

public type MyCustomerChangeEmailAction record {
    *MyCustomerUpdateAction;
    string action?;
    string email?;
};

public type ParcelMeasurementsUpdatedMessagePayload record {
    *MessagePayload;
    string 'type?;
    string deliveryId?;
    string parcelId?;
    ParcelMeasurements measurements?;
};

public type TaxCategoryUpdateAction record {
    string action?;
};

public type ClientLogging record {
    string clientId?;
    string externalUserId?;
    CustomerReference customer?;
    string anonymousId?;
};

public type StoreSetNameAction record {
    *StoreUpdateAction;
    string action?;
    LocalizedString name?;
};

public type ProjectUpdateAction record {
    string action?;
};

public type TaxCategorySetKeyAction record {
    *TaxCategoryUpdateAction;
    string action?;
    string 'key?;
};

public type TypeUpdate record {
    int 'version?;
    TypeUpdateAction[] actions?;
};

public type CartReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    Cart obj?;
};

public type StateRoleEnum string;

public type ProductSelectionType record {
    ProductSelectionTypeEnum 'type?;
};

public type TypedMoneyDraft record {
    *Money;
    int centAmount?;
    CurrencyCode currencyCode?;
    MoneyType 'type?;
    int fractionDigits?;
};

public type CustomerSetKeyAction record {
    *CustomerUpdateAction;
    string action?;
    string 'key?;
};

public type ProductAddVariantAction record {
    *ProductUpdateAction;
    string action?;
    string sku?;
    string 'key?;
    PriceDraft[] prices?;
    Image[] images?;
    Attribute[] attributes?;
    boolean staged?;
    Asset[] assets?;
};

public type CartSetDeliveryAddressCustomTypeAction record {
    *CartUpdateAction;
    string action?;
    string deliveryId?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type InvalidTokenError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type ProductTypeSetKeyAction record {
    *ProductTypeUpdateAction;
    string action?;
    string 'key?;
};

public type ProjectSetExternalOAuthAction record {
    *ProjectUpdateAction;
    string action?;
    ExternalOAuth externalOAuth?;
};

public type ProductTypeAddLocalizedEnumValueAction record {
    *ProductTypeUpdateAction;
    string action?;
    string attributeName?;
    AttributeLocalizedEnumValue value?;
};

public type CustomerSetFirstNameAction record {
    *CustomerUpdateAction;
    string action?;
    string firstName?;
};

public type ProductDiscountSetValidUntilAction record {
    *ProductDiscountUpdateAction;
    string action?;
    string validUntil?;
};

public type ParcelTrackingDataUpdatedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string deliveryId?;
    string parcelId?;
    TrackingData trackingData?;
};

public type DuplicatePriceScopeError record {
    *ErrorObject;
    string code?;
    string message?;
    Price[] conflictingPrices?;
};

public type OrderLineItemAddedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    LineItem lineItem?;
    int addedQuantity?;
};

public type OrderSetDeliveryAddressCustomTypeAction record {
    *OrderUpdateAction;
    string action?;
    string deliveryId?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type StagedOrderSetLineItemCustomTypeAction record {
    *StagedOrderUpdateAction;
    string action?;
    string lineItemId?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type InventoryEntrySetCustomTypeAction record {
    *InventoryEntryUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type FacetResultTerm record {
    string|record {}|string[]|decimal|int|boolean term?;
    int count?;
    int productCount?;
};

public type ProductVariantDraft record {
    string sku?;
    string 'key?;
    PriceDraft[] prices?;
    Attribute[] attributes?;
    Image[] images?;
    AssetDraft[] assets?;
};

public type ProductSetImageLabelAction record {
    *ProductUpdateAction;
    string action?;
    string sku?;
    int variantId?;
    string imageUrl?;
    string label?;
    boolean staged?;
};

public type AttributeDefinitionTypeConflictError record {
    *ErrorObject;
    string code?;
    string message?;
    string conflictingProductTypeId?;
    string conflictingProductTypeName?;
    string conflictingAttributeName?;
};

public type ReviewSetKeyAction record {
    *ReviewUpdateAction;
    string action?;
    string 'key?;
};

public type InsufficientScopeError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type InventoryEntryChangeQuantityAction record {
    *InventoryEntryUpdateAction;
    string action?;
    int quantity?;
};

public type CustomerTitleSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    string title?;
};

public type SemanticErrorError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type AttributeEnumType record {
    *AttributeType;
    string name?;
    AttributePlainEnumValue[] values?;
};

public type ParcelDraft record {
    ParcelMeasurements measurements?;
    TrackingData trackingData?;
    DeliveryItem[] items?;
    CustomFieldsDraft custom?;
};

public type PriceTier record {
    int minimumQuantity?;
    TypedMoney value?;
};

public type AttributeLocalizableTextType record {
    *AttributeType;
    string name?;
};

public type MyShoppingListChangeTextLineItemsOrderAction record {
    *MyShoppingListUpdateAction;
    string action?;
    string[] textLineItemOrder?;
};

public type SyncInfo record {
    ChannelReference 'channel?;
    string externalId?;
    string syncedAt?;
};

public type ProductDiscountMatchQuery record {
    string productId?;
    int variantId?;
    boolean staged?;
    QueryPrice price?;
};

public type StoreRemoveProductSelectionAction record {
    *StoreUpdateAction;
    string action?;
    ResourceIdentifier productSelection?;
};

public type CartDiscountValueRelative record {
    *CartDiscountValue;
    string 'type?;
    int permyriad?;
};

public type OrderSetParcelTrackingDataAction record {
    *OrderUpdateAction;
    string action?;
    string parcelId?;
    TrackingData trackingData?;
};

public type ProductSelectionDraft record {
    string 'key?;
    LocalizedString name?;
};

public type CustomerDraft record {
    string customerNumber?;
    string email?;
    string password?;
    string firstName?;
    string lastName?;
    string middleName?;
    string title?;
    string anonymousCartId?;
    CartResourceIdentifier anonymousCart?;
    string anonymousId?;
    string dateOfBirth?;
    string companyName?;
    string vatId?;
    BaseAddress[] addresses?;
    int defaultShippingAddress?;
    int[] shippingAddresses?;
    int defaultBillingAddress?;
    int[] billingAddresses?;
    boolean isEmailVerified?;
    string externalId?;
    CustomerGroupResourceIdentifier customerGroup?;
    CustomFieldsDraft custom?;
    string locale?;
    string salutation?;
    string 'key?;
    StoreResourceIdentifier[] stores?;
};

public type AddressDraft record {
    *BaseAddress;
    string id?;
    string 'key?;
    string title?;
    string salutation?;
    string firstName?;
    string lastName?;
    string streetName?;
    string streetNumber?;
    string additionalStreetInfo?;
    string postalCode?;
    string city?;
    string region?;
    string state?;
    CountryCode country?;
    string company?;
    string department?;
    string building?;
    string apartment?;
    string pOBox?;
    string phone?;
    string mobile?;
    string email?;
    string fax?;
    string additionalAddressInfo?;
    string externalId?;
    CustomFieldsDraft custom?;
};

public type StateChangeTypeAction record {
    *StateUpdateAction;
    string action?;
    StateTypeEnum 'type?;
};

public type ShippingRateInputDraft record {
    string 'type?;
};

public type Parcel record {
    string id?;
    string createdAt?;
    ParcelMeasurements measurements?;
    TrackingData trackingData?;
    DeliveryItem[] items?;
    CustomFields custom?;
};

public type OrderReturnInfoAddedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    ReturnInfo returnInfo?;
};

public type ProductType record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string 'key?;
    string name?;
    string description?;
    AttributeDefinition[] attributes?;
};

public type Project record {
    int 'version?;
    string 'key?;
    string name?;
    CountryCode[] countries?;
    CurrencyCode[] currencies?;
    Locale[] languages?;
    string createdAt?;
    string trialUntil?;
    MessageConfiguration messages?;
    ShippingRateInputType shippingRateInputType?;
    ExternalOAuth externalOAuth?;
    CartsConfiguration carts?;
    SearchIndexingConfiguration searchIndexing?;
    ShoppingListsConfiguration shoppingLists?;
};

public type ShippingRateInputType record {
    ShippingRateTierType 'type?;
};

public type ZoneChangeNameAction record {
    *ZoneUpdateAction;
    string action?;
    string name?;
};

public type CustomerReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    Customer obj?;
};

public type ProductDiscountValueRelative record {
    *ProductDiscountValue;
    string 'type?;
    int permyriad?;
};

public type MyCartUpdateAction record {
    string action?;
};

public type StagedOrderTransitionCustomLineItemStateAction record {
    *StagedOrderUpdateAction;
    string action?;
    string customLineItemId?;
    int quantity?;
    StateResourceIdentifier fromState?;
    StateResourceIdentifier toState?;
    string actualTransitionDate?;
};

public type TaxedItemPrice record {
    TypedMoney totalNet?;
    TypedMoney totalGross?;
};

public type OrderPaymentAddedMessagePayload record {
    *MessagePayload;
    string 'type?;
    PaymentReference payment?;
};

public type ItemState record {
    float quantity?;
    StateReference state?;
};

public type CustomerSetDefaultShippingAddressAction record {
    *CustomerUpdateAction;
    string action?;
    string addressId?;
    string addressKey?;
};

public type ProductChangeAssetNameAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    boolean staged?;
    string assetId?;
    string assetKey?;
    LocalizedString name?;
};

public type ShoppingListLineItemDraft record {
    string addedAt?;
    CustomFieldsDraft custom?;
    string sku?;
    string productId?;
    int quantity?;
    int variantId?;
};

public type StagedOrderSetDeliveryCustomFieldAction record {
    *StagedOrderUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type ProductSelectionUpdateAction record {
    string action?;
};

public type AttributeDefinitionAlreadyExistsError record {
    *ErrorObject;
    string code?;
    string message?;
    string conflictingProductTypeId?;
    string conflictingProductTypeName?;
    string conflictingAttributeName?;
};

public type InventoryEntryCreatedMessagePayload record {
    *MessagePayload;
    string 'type?;
    InventoryEntry inventoryEntry?;
};

public type ProductSelectionProductRemovedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    ProductReference product?;
};

public type Attribute record {
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type OrderPaymentStateChangedMessagePayload record {
    *MessagePayload;
    string 'type?;
    PaymentState paymentState?;
    PaymentState oldPaymentState?;
};

public type CustomerRemoveBillingAddressIdAction record {
    *CustomerUpdateAction;
    string action?;
    string addressId?;
    string addressKey?;
};

public type StagedOrderRemoveCustomLineItemAction record {
    *StagedOrderUpdateAction;
    string action?;
    string customLineItemId?;
};

public type OrderAddItemShippingAddressAction record {
    *OrderUpdateAction;
    string action?;
    BaseAddress address?;
};

public type MyCartSetShippingMethodAction record {
    *MyCartUpdateAction;
    string action?;
    ShippingMethodResourceIdentifier shippingMethod?;
    ExternalTaxRateDraft externalTaxRate?;
};

public type OrderEdit record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string 'key?;
    OrderReference 'resource?;
    StagedOrderUpdateAction[] stagedActions?;
    CustomFields custom?;
    OrderEditResult result?;
    string comment?;
};

public type ProductCreatedMessagePayload record {
    *MessagePayload;
    string 'type?;
    ProductProjection productProjection?;
};

public type SubscriptionPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    Subscription[] results?;
};

public type CustomLineItemImportDraft record {
    LocalizedString name?;
    int quantity?;
    Money money?;
    string slug?;
    ItemState[] state?;
    TaxRate taxRate?;
    TaxCategoryResourceIdentifier taxCategory?;
    CustomFieldsDraft custom?;
    ItemShippingDetailsDraft shippingDetails?;
};

public type StagedOrderRemoveLineItemAction record {
    *StagedOrderUpdateAction;
    string action?;
    string lineItemId?;
    float quantity?;
    Money externalPrice?;
    ExternalLineItemTotalPrice externalTotalPrice?;
    ItemShippingDetailsDraft shippingDetailsToRemove?;
};

public type CustomerGroupReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    CustomerGroup obj?;
};

public type MyCustomerRemoveShippingAddressIdAction record {
    *MyCustomerUpdateAction;
    string action?;
    string addressId?;
    string addressKey?;
};

public type PaymentUpdate record {
    int 'version?;
    PaymentUpdateAction[] actions?;
};

public type TrackingData record {
    string trackingId?;
    string carrier?;
    string provider?;
    string providerTransaction?;
    boolean isReturn?;
};

public type CartDiscountShippingCostTarget record {
    *CartDiscountTarget;
    string 'type?;
};

public type TypeReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    Type obj?;
};

public type CustomerSetCustomerGroupAction record {
    *CustomerUpdateAction;
    string action?;
    CustomerGroupResourceIdentifier customerGroup?;
};

public type OrderUpdateItemShippingAddressAction record {
    *OrderUpdateAction;
    string action?;
    BaseAddress address?;
};

public type ProjectChangeCurrenciesAction record {
    *ProjectUpdateAction;
    string action?;
    CurrencyCode[] currencies?;
};

public type ShippingMethodSetLocalizedNameAction record {
    *ShippingMethodUpdateAction;
    string action?;
    LocalizedString localizedName?;
};

public type ShoppingListChangeTextLineItemNameAction record {
    *ShoppingListUpdateAction;
    string action?;
    string textLineItemId?;
    LocalizedString name?;
};

public type OrderCustomerSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    CustomerReference customer?;
    CustomerGroupReference customerGroup?;
    CustomerReference oldCustomer?;
    CustomerGroupReference oldCustomerGroup?;
};

public type StoreCreatedMessagePayload record {
    *MessagePayload;
    string 'type?;
    LocalizedString name?;
    string[] languages?;
    ChannelReference[] distributionChannels?;
    ChannelReference[] supplyChannels?;
    ProductSelectionSetting[] productSelections?;
    CustomFields custom?;
};

public type CartSetItemShippingAddressCustomFieldAction record {
    *CartUpdateAction;
    string action?;
    string addressKey?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type ChannelAddRolesAction record {
    *ChannelUpdateAction;
    string action?;
    ChannelRoleEnum[] roles?;
};

public type OrderSearchRequest record {
    OrderSearchQuery query?;
    OrderSearchSorting sort?;
    int 'limit?;
    int offset?;
};

public type OrderCreatedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    Order 'order?;
};

public type ReferenceTypeId string;

public type DiscountedPriceDraft record {
    Money value?;
    ProductDiscountReference discount?;
};

public type DiscountCodePagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    DiscountCode[] results?;
};

public type DuplicateVariantValuesError record {
    *ErrorObject;
    string code?;
    string message?;
    VariantValues variantValues?;
};

public type VariantValues record {
    string sku?;
    PriceDraft[] prices?;
    Attribute[] attributes?;
};

public type MyShoppingListSetCustomTypeAction record {
    *MyShoppingListUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type ProductSelectionSettingDraft record {
    ProductSelectionResourceIdentifier productSelection?;
    boolean active?;
};

public type StoreSetLanguagesAction record {
    *StoreUpdateAction;
    string action?;
    string[] languages?;
};

public type OrderEditUpdate record {
    int 'version?;
    OrderEditUpdateAction[] actions?;
    boolean dryRun?;
};

public type TypeChangeLabelAction record {
    *TypeUpdateAction;
    string action?;
    string fieldName?;
    LocalizedString label?;
};

public type InventoryEntrySetRestockableInDaysAction record {
    *InventoryEntryUpdateAction;
    string action?;
    int restockableInDays?;
};

public type CartChangeTaxCalculationModeAction record {
    *CartUpdateAction;
    string action?;
    TaxCalculationMode taxCalculationMode?;
};

public type QueryPrice record {
    string id?;
    Money value?;
    CountryCode country?;
    CustomerGroupReference customerGroup?;
    ChannelReference 'channel?;
    string validFrom?;
    string validUntil?;
    DiscountedPriceDraft discounted?;
    CustomFields custom?;
    PriceTierDraft[] tiers?;
};

public type TypedMoney record {
    MoneyType 'type?;
    int fractionDigits?;
    int centAmount?;
    CurrencyCode currencyCode?;
};

public type AnonymousCartSignInMode string;

public type CustomFieldsDraft record {
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type CustomerRemoveStoreAction record {
    *CustomerUpdateAction;
    string action?;
    StoreResourceIdentifier store?;
};

public type OrderEditSetCustomTypeAction record {
    *OrderEditUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    record {} fields?;
};

public type CartSetLineItemSupplyChannelAction record {
    *CartUpdateAction;
    string action?;
    string lineItemId?;
    ChannelResourceIdentifier supplyChannel?;
};

public type AttributeValue string|record {}|string[]|decimal|int|boolean;

public type ProductUpdate record {
    int 'version?;
    ProductUpdateAction[] actions?;
};

public type ReviewSetTextAction record {
    *ReviewUpdateAction;
    string action?;
    string text?;
};

public type CustomerEmailChangedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string email?;
};

public type OrderSetDeliveryItemsAction record {
    *OrderUpdateAction;
    string action?;
    string deliveryId?;
    DeliveryItem[] items?;
};

public type ProductTypeChangeLocalizedEnumValueLabelAction record {
    *ProductTypeUpdateAction;
    string action?;
    string attributeName?;
    AttributeLocalizedEnumValue newValue?;
};

public type SubscriptionDraft record {
    ChangeSubscription[] changes?;
    Destination destination?;
    string 'key?;
    MessageSubscription[] messages?;
    DeliveryFormat format?;
};

public type OrderSetLineItemCustomTypeAction record {
    *OrderUpdateAction;
    string action?;
    string lineItemId?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type TypeDraft record {
    string 'key?;
    LocalizedString name?;
    LocalizedString description?;
    ResourceTypeId[] resourceTypeIds?;
    FieldDefinition[] fieldDefinitions?;
};

public type NotEnabledError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type GraphQLRequest record {
    string query?;
    string operationName?;
    GraphQLVariablesMap variables?;
};

public type QueryTimedOutError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type CartDiscountChangeTargetAction record {
    *CartDiscountUpdateAction;
    string action?;
    CartDiscountTarget target?;
};

public type CategorySetAssetTagsAction record {
    *CategoryUpdateAction;
    string action?;
    string assetId?;
    string assetKey?;
    string[] tags?;
};

public type CartAddPaymentAction record {
    *CartUpdateAction;
    string action?;
    PaymentResourceIdentifier payment?;
};

public type ProjectChangeCartsConfigurationAction record {
    *ProjectUpdateAction;
    string action?;
    CartsConfiguration cartsConfiguration?;
};

public type ShippingMethodAddZoneAction record {
    *ShippingMethodUpdateAction;
    string action?;
    ZoneResourceIdentifier zone?;
};

public type StagedOrderImportCustomLineItemStateAction record {
    *StagedOrderUpdateAction;
    string action?;
    string customLineItemId?;
    ItemState[] state?;
};

public type ExtensionResourceTypeId string;

public type OrderSetReturnItemCustomFieldAction record {
    *OrderUpdateAction;
    string action?;
    string returnItemId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type CartDiscountUpdate record {
    int 'version?;
    CartDiscountUpdateAction[] actions?;
};

public type CustomerLastNameSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string lastName?;
};

public type CartDiscountDraft record {
    LocalizedString name?;
    string 'key?;
    LocalizedString description?;
    CartDiscountValueDraft value?;
    string cartPredicate?;
    CartDiscountTarget target?;
    string sortOrder?;
    boolean isActive?;
    string validFrom?;
    string validUntil?;
    boolean requiresDiscountCode?;
    StackingMode stackingMode?;
    CustomFieldsDraft custom?;
};

public type CategoryUpdate record {
    int 'version?;
    CategoryUpdateAction[] actions?;
};

public type DiscountedLineItemPrice record {
    TypedMoney value?;
    DiscountedLineItemPortion[] includedDiscounts?;
};

public type OrderEditUpdateAction record {
    string action?;
};

public type OrderSetShippingAddressAction record {
    *OrderUpdateAction;
    string action?;
    BaseAddress address?;
};

public type ProductDiscount record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    LocalizedString name?;
    string 'key?;
    LocalizedString description?;
    ProductDiscountValue value?;
    string predicate?;
    string sortOrder?;
    boolean isActive?;
    Reference[] references?;
    string validFrom?;
    string validUntil?;
};

public type FacetResultRange record {
    float 'from?;
    string fromStr?;
    float to?;
    string toStr?;
    int count?;
    int productCount?;
    float total?;
    float min?;
    float max?;
    float mean?;
};

public type ProductChangeNameAction record {
    *ProductUpdateAction;
    string action?;
    LocalizedString name?;
    boolean staged?;
};

public type ProductRemovePriceAction record {
    *ProductUpdateAction;
    string action?;
    string priceId?;
    boolean staged?;
};

public type ApiClientPagedQueryResponse record {
    int 'limit?;
    int offset?;
    int count?;
    int total?;
    ApiClient[] results?;
};

public type CartSetCustomLineItemCustomTypeAction record {
    *CartUpdateAction;
    string action?;
    string customLineItemId?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type ParcelMeasurementsUpdatedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string deliveryId?;
    string parcelId?;
    ParcelMeasurements measurements?;
};

public type SubscriptionHealthStatus string;

public type OrderLineItemRemovedMessagePayload record {
    *MessagePayload;
    string 'type?;
    string lineItemId?;
    int removedQuantity?;
    int newQuantity?;
    ItemState[] newState?;
    TypedMoney newTotalPrice?;
    TaxedItemPrice newTaxedPrice?;
    Price newPrice?;
    ItemShippingDetails newShippingDetail?;
};

public type DiscountedLineItemPriceForQuantity record {
    float quantity?;
    DiscountedLineItemPrice discountedPrice?;
};

public type TaxPortion record {
    string name?;
    float rate?;
    TypedMoney amount?;
};

public type CustomerPasswordUpdatedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    boolean reset?;
};

public type AzureEventGridDestination record {
    *Destination;
    string 'type?;
    string uri?;
    string accessKey?;
};

public type ShippingRateTierType string;

public type MoneyType string;

public type StateChangeKeyAction record {
    *StateUpdateAction;
    string action?;
    string 'key?;
};

public type ShippingMethodState string;

public type CustomerAddressAddedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    Address address?;
};

public type TermFacetResultType string;

public type ShippingMethodDoesNotMatchCartError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type OrderSetBillingAddressCustomTypeAction record {
    *OrderUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type StoreDeletedMessagePayload record {
    *MessagePayload;
    string 'type?;
};

public type StagedOrderSetCustomerGroupAction record {
    *StagedOrderUpdateAction;
    string action?;
    CustomerGroupResourceIdentifier customerGroup?;
};

public type MyCartSetLocaleAction record {
    *MyCartUpdateAction;
    string action?;
    string locale?;
};

public type ReviewSetCustomFieldAction record {
    *ReviewUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type OrderSetReturnInfoAction record {
    *OrderUpdateAction;
    string action?;
    ReturnInfoDraft[] items?;
};

public type Review record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string 'key?;
    string uniquenessValue?;
    string locale?;
    string authorName?;
    string title?;
    string text?;
    string|record {}|string[]|decimal|int|boolean target?;
    boolean includedInStatistics?;
    int rating?;
    StateReference state?;
    CustomerReference customer?;
    CustomFields custom?;
};

public type StagedOrderChangeOrderStateAction record {
    *StagedOrderUpdateAction;
    string action?;
    OrderState orderState?;
};

public type ReturnItemDraft record {
    int quantity?;
    string lineItemId?;
    string customLineItemId?;
    string comment?;
    ReturnShipmentState shipmentState?;
    CustomFieldsDraft custom?;
};

public type PaymentSetAnonymousIdAction record {
    *PaymentUpdateAction;
    string action?;
    string anonymousId?;
};

public type FeatureRemovedError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type ParcelItemsUpdatedMessagePayload record {
    *MessagePayload;
    string 'type?;
    string parcelId?;
    string deliveryId?;
    DeliveryItem[] items?;
    DeliveryItem[] oldItems?;
};

public type OrderUpdateSyncInfoAction record {
    *OrderUpdateAction;
    string action?;
    ChannelResourceIdentifier 'channel?;
    string externalId?;
    string syncedAt?;
};

public type ProductSlugChangedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    LocalizedString slug?;
    LocalizedString oldSlug?;
};

public type PaymentTransactionStateChangedMessagePayload record {
    *MessagePayload;
    string 'type?;
    string transactionId?;
    TransactionState state?;
};

public type StagedOrderTransitionStateAction record {
    *StagedOrderUpdateAction;
    string action?;
    StateResourceIdentifier state?;
    boolean force?;
};

public type ProductDraft record {
    ProductTypeResourceIdentifier productType?;
    LocalizedString name?;
    LocalizedString slug?;
    string 'key?;
    LocalizedString description?;
    CategoryResourceIdentifier[] categories?;
    CategoryOrderHints categoryOrderHints?;
    LocalizedString metaTitle?;
    LocalizedString metaDescription?;
    LocalizedString metaKeywords?;
    ProductVariantDraft masterVariant?;
    ProductVariantDraft[] variants?;
    TaxCategoryResourceIdentifier taxCategory?;
    SearchKeywords searchKeywords?;
    StateResourceIdentifier state?;
    boolean publish?;
};

public type CartDiscountUpdateAction record {
    string action?;
};

public type DiscountCodeSetValidFromAndUntilAction record {
    *DiscountCodeUpdateAction;
    string action?;
    string validFrom?;
    string validUntil?;
};

public type MyCustomerDraft record {
    string email?;
    string password?;
    string firstName?;
    string lastName?;
    string middleName?;
    string title?;
    string dateOfBirth?;
    string companyName?;
    string vatId?;
    BaseAddress[] addresses?;
    int defaultShippingAddress?;
    int defaultBillingAddress?;
    CustomFields custom?;
    string locale?;
    StoreResourceIdentifier[] stores?;
};

public type ReviewPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    Review[] results?;
};

public type CartChangeLineItemQuantityAction record {
    *CartUpdateAction;
    string action?;
    string lineItemId?;
    int quantity?;
    Money externalPrice?;
    ExternalLineItemTotalPrice externalTotalPrice?;
};

public type StoreAddProductSelectionAction record {
    *StoreUpdateAction;
    string action?;
    ProductSelectionSettingDraft productSelection?;
};

public type PaymentSetStatusInterfaceCodeAction record {
    *PaymentUpdateAction;
    string action?;
    string interfaceCode?;
};

public type ContainerAndKey record {
    string 'key?;
    string container?;
};

public type ProductSelectionReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    ProductSelection obj?;
};

public type ShippingRateInput record {
    string 'type?;
};

public type CustomerAddStoreAction record {
    *CustomerUpdateAction;
    string action?;
    StoreResourceIdentifier store?;
};

public type TaxCategorySetDescriptionAction record {
    *TaxCategoryUpdateAction;
    string action?;
    string description?;
};

public type ZoneAddLocationAction record {
    *ZoneUpdateAction;
    string action?;
    Location location?;
};

public type CartClassificationType record {
    *ShippingRateInputType;
    ShippingRateTierType 'type?;
    CustomFieldLocalizedEnumValue[] values?;
};

public type TaxCategoryReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    TaxCategory obj?;
};

public type StateUpdateAction record {
    string action?;
};

public type ProductDiscountChangeValueAction record {
    *ProductDiscountUpdateAction;
    string action?;
    ProductDiscountValueDraft value?;
};

public type ProjectSetShippingRateInputTypeAction record {
    *ProjectUpdateAction;
    string action?;
    ShippingRateInputType shippingRateInputType?;
};

public type ChannelUpdateAction record {
    string action?;
};

public type OrderSetCustomTypeAction record {
    *OrderUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type StoreSetDistributionChannelsAction record {
    *StoreUpdateAction;
    string action?;
    ChannelResourceIdentifier[] distributionChannels?;
};

public type MyCartRemovePaymentAction record {
    *MyCartUpdateAction;
    string action?;
    PaymentResourceIdentifier payment?;
};

public type ProductSetProductPriceCustomFieldAction record {
    *ProductUpdateAction;
    string action?;
    string priceId?;
    boolean staged?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type ShippingMethodChangeTaxCategoryAction record {
    *ShippingMethodUpdateAction;
    string action?;
    TaxCategoryResourceIdentifier taxCategory?;
};

public type ProductTransitionStateAction record {
    *ProductUpdateAction;
    string action?;
    StateResourceIdentifier state?;
    boolean force?;
};

public type ReviewSetCustomerAction record {
    *ReviewUpdateAction;
    string action?;
    CustomerResourceIdentifier customer?;
};

public type CustomFieldSetType record {
    *FieldType;
    string name?;
    FieldType elementType?;
};

public type CategorySetMetaDescriptionAction record {
    *CategoryUpdateAction;
    string action?;
    LocalizedString metaDescription?;
};

public type CartChangeTaxModeAction record {
    *CartUpdateAction;
    string action?;
    TaxMode taxMode?;
};

public type CustomerSetAddressCustomTypeAction record {
    *CustomerUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
    string addressId?;
};

public type DiscountCodeReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    DiscountCode obj?;
};

public type TransactionState string;

public type ProductTypeChangePlainEnumValueOrderAction record {
    *ProductTypeUpdateAction;
    string action?;
    string attributeName?;
    AttributePlainEnumValue[] values?;
};

public type CustomerSetSalutationAction record {
    *CustomerUpdateAction;
    string action?;
    string salutation?;
};

public type ReviewReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    Review obj?;
};

public type ShoppingListRemoveTextLineItemAction record {
    *ShoppingListUpdateAction;
    string action?;
    string textLineItemId?;
    int quantity?;
};

public type CustomerAddressRemovedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    Address address?;
};

public type InvalidCurrentPasswordError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type ExtensionChangeTriggersAction record {
    *ExtensionUpdateAction;
    string action?;
    ExtensionTrigger[] triggers?;
};

public type CartSetShippingAddressAction record {
    *CartUpdateAction;
    string action?;
    BaseAddress address?;
};

public type AttributeConstraintEnumDraft string;

public type AttributeLocalizedEnumValue record {
    string 'key?;
    LocalizedString label?;
};

public type CartUpdate record {
    int 'version?;
    CartUpdateAction[] actions?;
};

public type SearchIndexingConfigurationStatus string;

public type MyPaymentSetTransactionCustomFieldAction record {
    *MyPaymentUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type AttributeNameDoesNotExistError record {
    *ErrorObject;
    string code?;
    string message?;
    string invalidAttributeName?;
};

public type LanguageUsedInStoresError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type CartResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type StoreSetProductSelectionsAction record {
    *StoreUpdateAction;
    string action?;
    ProductSelectionSettingDraft[] productSelections?;
};

public type OrderSetCustomerEmailAction record {
    *OrderUpdateAction;
    string action?;
    string email?;
};

public type CartRemoveCustomLineItemAction record {
    *CartUpdateAction;
    string action?;
    string customLineItemId?;
};

public type CartSetShippingMethodAction record {
    *CartUpdateAction;
    string action?;
    ShippingMethodResourceIdentifier shippingMethod?;
    ExternalTaxRateDraft externalTaxRate?;
};

public type Subscription record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    ChangeSubscription[] changes?;
    Destination destination?;
    string 'key?;
    MessageSubscription[] messages?;
    DeliveryFormat format?;
    SubscriptionHealthStatus status?;
};

public type CustomFieldDateTimeType record {
    *FieldType;
    string name?;
};

public type ShoppingListAddLineItemAction record {
    *ShoppingListUpdateAction;
    string action?;
    string sku?;
    string productId?;
    int variantId?;
    int quantity?;
    string addedAt?;
    CustomFieldsDraft custom?;
};

public type CartSetShippingAddressCustomFieldAction record {
    *CartUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type LineItemPriceMode string;

public type CategorySlugChangedMessagePayload record {
    *MessagePayload;
    string 'type?;
    LocalizedString slug?;
    LocalizedString oldSlug?;
};

public type MyCartUpdateItemShippingAddressAction record {
    *MyCartUpdateAction;
    string action?;
    BaseAddress address?;
};

public type StoreCreatedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    LocalizedString name?;
    string[] languages?;
    ChannelReference[] distributionChannels?;
    ChannelReference[] supplyChannels?;
    ProductSelectionSetting[] productSelections?;
    CustomFields custom?;
};

public type ProductDiscountValueDraft record {
    string 'type?;
};

public type CustomLineItemStateTransitionMessagePayload record {
    *MessagePayload;
    string 'type?;
    string customLineItemId?;
    string transitionDate?;
    int quantity?;
    StateReference fromState?;
    StateReference toState?;
};

public type ResourceNotFoundError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type PaymentSetTransactionCustomTypeAction record {
    *PaymentUpdateAction;
    string action?;
    string transactionId?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type CartChangeTaxRoundingModeAction record {
    *CartUpdateAction;
    string action?;
    RoundingMode taxRoundingMode?;
};

public type CartSetLineItemShippingDetailsAction record {
    *CartUpdateAction;
    string action?;
    string lineItemId?;
    ItemShippingDetailsDraft shippingDetails?;
};

public type ShoppingListStoreSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    StoreKeyReference store?;
};

public type OrderSetItemShippingAddressCustomTypeAction record {
    *OrderUpdateAction;
    string action?;
    string addressKey?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type ProductTypeResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type CartSetBillingAddressCustomFieldAction record {
    *CartUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type ProductStateTransitionMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    StateReference state?;
    boolean force?;
};

public type StagedOrderChangeLineItemQuantityAction record {
    *StagedOrderUpdateAction;
    string action?;
    string lineItemId?;
    float quantity?;
    Money externalPrice?;
    ExternalLineItemTotalPrice externalTotalPrice?;
};

public type GeoJsonPoint record {
    *GeoJson;
    string 'type?;
    float[] coordinates?;
};

public type QueryComplexityLimitExceededError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type ReturnInfoDraft record {
    ReturnItemDraft[] items?;
    string returnTrackingId?;
    string returnDate?;
};

public type InvalidSubjectError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type CartChangeCustomLineItemMoneyAction record {
    *CartUpdateAction;
    string action?;
    string customLineItemId?;
    Money money?;
};

public type StagedOrderAddDeliveryAction record {
    *StagedOrderUpdateAction;
    string action?;
    DeliveryItem[] items?;
    BaseAddress address?;
    ParcelDraft[] parcels?;
    CustomFields custom?;
};

public type StatePagedQueryResponse record {
    int 'limit?;
    int offset?;
    int count?;
    int total?;
    State[] results?;
};

public type ProductRemovedFromCategoryMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    CategoryReference category?;
    boolean staged?;
};

public type InventoryEntryRemoveQuantityAction record {
    *InventoryEntryUpdateAction;
    string action?;
    int quantity?;
};

public type CustomerTitleSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string title?;
};

public type ProductSelectionTypeEnum string;

public type PriceChangedError record {
    *ErrorObject;
    string code?;
    string message?;
    string[] lineItems?;
    boolean shipping?;
};

public type ProductSetAssetKeyAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    boolean staged?;
    string assetId?;
    string assetKey?;
};

public type CustomerSetLastNameAction record {
    *CustomerUpdateAction;
    string action?;
    string lastName?;
};

public type MyCartSetCustomFieldAction record {
    *MyCartUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type PaymentResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type MultiBuyLineItemsTarget record {
    *CartDiscountTarget;
    string 'type?;
    string predicate?;
    int triggerQuantity?;
    int discountedQuantity?;
    int maxOccurrence?;
    SelectionMode selectionMode?;
};

public type CustomFieldTimeType record {
    *FieldType;
    string name?;
};

public type InventoryEntrySetCustomFieldAction record {
    *InventoryEntryUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type CategoryCreatedMessagePayload record {
    *MessagePayload;
    string 'type?;
    Category category?;
};

public type OrderCustomerGroupSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    CustomerGroupReference customerGroup?;
    CustomerGroupReference oldCustomerGroup?;
};

public type CustomerPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    Customer[] results?;
};

public type StagedOrderUpdateSyncInfoAction record {
    *StagedOrderUpdateAction;
    string action?;
    ChannelResourceIdentifier 'channel?;
    string externalId?;
    string syncedAt?;
};

public type AttributeTextType record {
    *AttributeType;
    string name?;
};

public type CustomerEmailVerifiedMessagePayload record {
    *MessagePayload;
    string 'type?;
};

public type ProductSelectionAssignment record {
    ProductReference product?;
    ProductSelectionReference productSelection?;
};

public type FieldContainer record {
};

public type ProductData record {
    LocalizedString name?;
    CategoryReference[] categories?;
    CategoryOrderHints categoryOrderHints?;
    LocalizedString description?;
    LocalizedString slug?;
    LocalizedString metaTitle?;
    LocalizedString metaDescription?;
    LocalizedString metaKeywords?;
    ProductVariant masterVariant?;
    ProductVariant[] variants?;
    SearchKeywords searchKeywords?;
};

public type PaymentStatusDraft record {
    string interfaceCode?;
    string interfaceText?;
    StateResourceIdentifier state?;
};

public type TypeChangeEnumValueLabelAction record {
    *TypeUpdateAction;
    string action?;
    string fieldName?;
    CustomFieldEnumValue value?;
};

public type OrderPaymentAddedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    PaymentReference payment?;
};

public type OrderRemoveDeliveryAction record {
    *OrderUpdateAction;
    string action?;
    string deliveryId?;
};

public type CustomerGroupSetCustomTypeAction record {
    *CustomerGroupUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type ShoppingListUpdateAction record {
    string action?;
};

public type TaxRateDraft record {
    string name?;
    float amount?;
    boolean includedInPrice?;
    CountryCode country?;
    string state?;
    SubRate[] subRates?;
};

public type CartValueType record {
    *ShippingRateInputType;
    ShippingRateTierType 'type?;
};

public type ChannelChangeDescriptionAction record {
    *ChannelUpdateAction;
    string action?;
    LocalizedString description?;
};

public type PaymentMethodInfo record {
    string paymentInterface?;
    string method?;
    LocalizedString name?;
};

public type CartAddLineItemAction record {
    *CartUpdateAction;
    string action?;
    CustomFieldsDraft custom?;
    ChannelResourceIdentifier distributionChannel?;
    ExternalTaxRateDraft externalTaxRate?;
    string productId?;
    int variantId?;
    string sku?;
    int quantity?;
    ChannelResourceIdentifier supplyChannel?;
    Money externalPrice?;
    ExternalLineItemTotalPrice externalTotalPrice?;
    ItemShippingDetailsDraft shippingDetails?;
};

public type MyPaymentSetMethodInfoMethodAction record {
    *MyPaymentUpdateAction;
    string action?;
    string method?;
};

public type ProductSelectionUpdate record {
    int 'version?;
    ProductSelectionUpdateAction[] actions?;
};

public type Hit record {
    string id?;
    int 'version?;
    float relevance?;
};

public type Type record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string 'key?;
    LocalizedString name?;
    LocalizedString description?;
    ResourceTypeId[] resourceTypeIds?;
    FieldDefinition[] fieldDefinitions?;
};

public type MyCartRemoveDiscountCodeAction record {
    *MyCartUpdateAction;
    string action?;
    DiscountCodeReference discountCode?;
};

public type ProductSetAssetCustomTypeAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    boolean staged?;
    string assetId?;
    string assetKey?;
    TypeResourceIdentifier 'type?;
    record {} fields?;
};

public type OrderChangeShipmentStateAction record {
    *OrderUpdateAction;
    string action?;
    ShipmentState shipmentState?;
};

public type OrderSetShippingAddressCustomFieldAction record {
    *OrderUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type StagedOrderSetCustomShippingMethodAction record {
    *StagedOrderUpdateAction;
    string action?;
    string shippingMethodName?;
    ShippingRateDraft shippingRate?;
    TaxCategoryResourceIdentifier taxCategory?;
    ExternalTaxRateDraft externalTaxRate?;
};

public type CartSetShippingRateInputAction record {
    *CartUpdateAction;
    string action?;
    ShippingRateInputDraft shippingRateInput?;
};

public type ParcelRemovedFromDeliveryMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string deliveryId?;
    Parcel parcel?;
};

public type InventoryEntryResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type CustomerGroupUpdateAction record {
    string action?;
};

public type DiscountCodeChangeIsActiveAction record {
    *DiscountCodeUpdateAction;
    string action?;
    boolean isActive?;
};

public type ProductTypeChangeDescriptionAction record {
    *ProductTypeUpdateAction;
    string action?;
    string description?;
};

public type RoundingMode string;

public type StagedOrderSetCustomLineItemCustomFieldAction record {
    *StagedOrderUpdateAction;
    string action?;
    string customLineItemId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type FieldDefinition record {
    FieldType 'type?;
    string name?;
    LocalizedString label?;
    boolean required?;
    TypeTextInputHint inputHint?;
};

public type CartDiscountChangeRequiresDiscountCodeAction record {
    *CartDiscountUpdateAction;
    string action?;
    boolean requiresDiscountCode?;
};

public type StagedOrderSetLineItemTaxAmountAction record {
    *StagedOrderUpdateAction;
    string action?;
    string lineItemId?;
    ExternalTaxAmountDraft externalTaxAmount?;
};

public type Update record {
    int 'version?;
    UpdateAction[] actions?;
};

public type OrderLineItemAddedMessagePayload record {
    *MessagePayload;
    string 'type?;
    LineItem lineItem?;
    int addedQuantity?;
};

public type MyCustomerChangePassword record {
    int 'version?;
    string currentPassword?;
    string newPassword?;
};

public type AccessDeniedError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type ReviewCreatedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    Review review?;
};

public type StagedOrderSetDeliveryCustomTypeAction record {
    *StagedOrderUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    record {} fields?;
};

public type ChannelRemoveRolesAction record {
    *ChannelUpdateAction;
    string action?;
    ChannelRoleEnum[] roles?;
};

public type ZoneSetDescriptionAction record {
    *ZoneUpdateAction;
    string action?;
    string description?;
};

public type ProductSelectionDeletedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    LocalizedString name?;
};

public type MyCartSetCountryAction record {
    *MyCartUpdateAction;
    string action?;
    CountryCode country?;
};

public type SearchExecutionFailureError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type PaymentTransitionStateAction record {
    *PaymentUpdateAction;
    string action?;
    StateResourceIdentifier state?;
    boolean force?;
};

public type OrderResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type MyCartSetBillingAddressAction record {
    *MyCartUpdateAction;
    string action?;
    BaseAddress address?;
};

public type Order record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string completedAt?;
    string orderNumber?;
    string customerId?;
    string customerEmail?;
    string anonymousId?;
    StoreKeyReference store?;
    LineItem[] lineItems?;
    CustomLineItem[] customLineItems?;
    TypedMoney totalPrice?;
    TaxedPrice taxedPrice?;
    Address shippingAddress?;
    Address billingAddress?;
    TaxMode taxMode?;
    RoundingMode taxRoundingMode?;
    CustomerGroupReference customerGroup?;
    string country?;
    OrderState orderState?;
    StateReference state?;
    ShipmentState shipmentState?;
    PaymentState paymentState?;
    ShippingInfo shippingInfo?;
    SyncInfo[] syncInfo?;
    ReturnInfo[] returnInfo?;
    DiscountCodeInfo[] discountCodes?;
    int lastMessageSequenceNumber?;
    CartReference cart?;
    CustomFields custom?;
    PaymentInfo paymentInfo?;
    string locale?;
    InventoryMode inventoryMode?;
    CartOrigin origin?;
    TaxCalculationMode taxCalculationMode?;
    ShippingRateInput shippingRateInput?;
    Address[] itemShippingAddresses?;
    CartDiscountReference[] refusedGifts?;
};

public type CartChangeCustomLineItemQuantityAction record {
    *CartUpdateAction;
    string action?;
    string customLineItemId?;
    int quantity?;
};

public type OrderEditAddStagedActionAction record {
    *OrderEditUpdateAction;
    string action?;
    StagedOrderUpdateAction stagedAction?;
};

public type Channel record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string 'key?;
    ChannelRoleEnum[] roles?;
    LocalizedString name?;
    LocalizedString description?;
    Address address?;
    ReviewRatingStatistics reviewRatingStatistics?;
    CustomFields custom?;
    GeoJson geoLocation?;
};

public type CustomerToken record {
    string id?;
    string createdAt?;
    string lastModifiedAt?;
    string customerId?;
    string expiresAt?;
    string value?;
};

public type MyCustomerSetDefaultShippingAddressAction record {
    *MyCustomerUpdateAction;
    string action?;
    string addressId?;
    string addressKey?;
};

public type StagedOrderSetShippingAddressCustomFieldAction record {
    *StagedOrderUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type StagedOrderAddPaymentAction record {
    *StagedOrderUpdateAction;
    string action?;
    PaymentResourceIdentifier payment?;
};

public type ClassificationShippingRateInput record {
    *ShippingRateInput;
    string 'type?;
    string 'key?;
    LocalizedString label?;
};

public type CartDiscountValueFixedDraft record {
    *CartDiscountValueDraft;
    string 'type?;
    Money[] money?;
};

public type DeliveryItemsUpdatedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string deliveryId?;
    DeliveryItem[] items?;
    DeliveryItem[] oldItems?;
};

public type ProductSetMetaTitleAction record {
    *ProductUpdateAction;
    string action?;
    LocalizedString metaTitle?;
    boolean staged?;
};

public type PaymentSetKeyAction record {
    *PaymentUpdateAction;
    string action?;
    string 'key?;
};

public type CustomFields record {
    TypeReference 'type?;
    FieldContainer fields?;
};

public type StagedOrderSetItemShippingAddressCustomTypeAction record {
    *StagedOrderUpdateAction;
    string action?;
    string addressKey?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type OrderSetBillingAddressCustomFieldAction record {
    *OrderUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type StagedOrderSetShippingMethodAction record {
    *StagedOrderUpdateAction;
    string action?;
    ShippingMethodResourceIdentifier shippingMethod?;
    ExternalTaxRateDraft externalTaxRate?;
};

public type MyPaymentSetMethodInfoInterfaceAction record {
    *MyPaymentUpdateAction;
    string action?;
    string interface?;
};

public type ShipmentState string;

public type ItemShippingDetails record {
    ItemShippingTarget[] targets?;
    boolean valid?;
};

public type CartSetItemShippingAddressCustomTypeAction record {
    *CartUpdateAction;
    string action?;
    string addressKey?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type Message record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
};

public type ExtensionSetKeyAction record {
    *ExtensionUpdateAction;
    string action?;
    string 'key?;
};

public type OrderAddDeliveryAction record {
    *OrderUpdateAction;
    string action?;
    DeliveryItem[] items?;
    BaseAddress address?;
    ParcelDraft[] parcels?;
    CustomFields custom?;
};

public type InventoryEntryAddQuantityAction record {
    *InventoryEntryUpdateAction;
    string action?;
    int quantity?;
};

public type ProjectChangeMessagesConfigurationAction record {
    *ProjectUpdateAction;
    string action?;
    MessageConfigurationDraft messagesConfiguration?;
};

public type CartDiscountSetCustomTypeAction record {
    *CartDiscountUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    record {} fields?;
};

public type ProductImageAddedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    int variantId?;
    Image image?;
    boolean staged?;
};

public type AttributeDefinition record {
    AttributeType 'type?;
    string name?;
    LocalizedString label?;
    boolean isRequired?;
    AttributeConstraintEnum attributeConstraint?;
    LocalizedString inputTip?;
    TextInputHint inputHint?;
    boolean isSearchable?;
};

public type ProductAddedToCategoryMessagePayload record {
    *MessagePayload;
    string 'type?;
    CategoryReference category?;
    boolean staged?;
};

public type ProductSelection record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string 'key?;
    LocalizedString name?;
    int productCount?;
    ProductSelectionTypeEnum 'type?;
};

public type CartDiscountSetValidUntilAction record {
    *CartDiscountUpdateAction;
    string action?;
    string validUntil?;
};

public type ExternalTaxAmountDraft record {
    Money totalGross?;
    ExternalTaxRateDraft taxRate?;
};

public type OrderAddReturnInfoAction record {
    *OrderUpdateAction;
    string action?;
    string returnTrackingId?;
    ReturnItemDraft[] items?;
    string returnDate?;
};

public type OrderCustomerSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    CustomerReference customer?;
    CustomerGroupReference customerGroup?;
    CustomerReference oldCustomer?;
    CustomerGroupReference oldCustomerGroup?;
};

public type MyCartAddItemShippingAddressAction record {
    *MyCartUpdateAction;
    string action?;
    BaseAddress address?;
};

public type OrderDiscountCodeAddedMessagePayload record {
    *MessagePayload;
    string 'type?;
    DiscountCodeReference discountCode?;
};

public type ProductSetProductVariantKeyAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    string 'key?;
    boolean staged?;
};

public type StoreAddDistributionChannelAction record {
    *StoreUpdateAction;
    string action?;
    ChannelResourceIdentifier distributionChannel?;
};

public type OrderCustomerEmailSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    string email?;
    string oldEmail?;
};

public type LineItemStateTransitionMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string lineItemId?;
    string transitionDate?;
    int quantity?;
    StateReference fromState?;
    StateReference toState?;
};

public type OrderDiscountCodeStateSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    DiscountCodeReference discountCode?;
    DiscountCodeState state?;
    DiscountCodeState oldState?;
};

public type StagedOrderSetReturnPaymentStateAction record {
    *StagedOrderUpdateAction;
    string action?;
    string returnItemId?;
    ReturnPaymentState paymentState?;
};

public type WhitespaceTokenizer record {
    *SuggestTokenizer;
    string 'type?;
};

public type ExternalOAuth record {
    string url?;
    string authorizationHeader?;
};

public type ProductUnpublishedMessagePayload record {
    *MessagePayload;
    string 'type?;
};

public type ProductImageAddedMessagePayload record {
    *MessagePayload;
    string 'type?;
    int variantId?;
    Image image?;
    boolean staged?;
};

public type BaseResource record {
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
};

public type StagedOrderRemoveDeliveryAction record {
    *StagedOrderUpdateAction;
    string action?;
    string deliveryId?;
};

public type ProductTypeUpdate record {
    int 'version?;
    ProductTypeUpdateAction[] actions?;
};

public type TypePagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    Type[] results?;
};

public type CartDiscountValueRelativeDraft record {
    *CartDiscountValueDraft;
    string 'type?;
    int permyriad?;
};

public type LineItem record {
    string id?;
    string productId?;
    string productKey?;
    LocalizedString name?;
    LocalizedString productSlug?;
    ProductTypeReference productType?;
    ProductVariant variant?;
    Price price?;
    TaxedItemPrice taxedPrice?;
    TypedMoney totalPrice?;
    int quantity?;
    string addedAt?;
    ItemState[] state?;
    TaxRate taxRate?;
    ChannelReference supplyChannel?;
    ChannelReference distributionChannel?;
    DiscountedLineItemPriceForQuantity[] discountedPricePerQuantity?;
    LineItemPriceMode priceMode?;
    LineItemMode lineItemMode?;
    CustomFields custom?;
    ItemShippingDetails shippingDetails?;
    string lastModifiedAt?;
};

public type StagedOrderRemoveParcelFromDeliveryAction record {
    *StagedOrderUpdateAction;
    string action?;
    string parcelId?;
};

public type OrderEditResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type ShoppingListChangeLineItemsOrderAction record {
    *ShoppingListUpdateAction;
    string action?;
    string[] lineItemOrder?;
};

public type StagedOrderSetShippingRateInputAction record {
    *StagedOrderUpdateAction;
    string action?;
    ShippingRateInputDraft shippingRateInput?;
};

public type RangeFacetResult record {
    *FacetResult;
    FacetTypes 'type?;
    FacetResultRange[] ranges?;
};

public type TaxCategoryRemoveTaxRateAction record {
    *TaxCategoryUpdateAction;
    string action?;
    string taxRateId?;
};

public type ReviewDraft record {
    string 'key?;
    string uniquenessValue?;
    string locale?;
    string authorName?;
    string title?;
    string text?;
    string|record {}|string[]|decimal|int|boolean target?;
    StateResourceIdentifier state?;
    int rating?;
    CustomerResourceIdentifier customer?;
    CustomFieldsDraft custom?;
};

public type ProductRemovedFromCategoryMessagePayload record {
    *MessagePayload;
    string 'type?;
    CategoryReference category?;
    boolean staged?;
};

public type StagedOrderSetReturnItemCustomTypeAction record {
    *StagedOrderUpdateAction;
    string action?;
    string returnItemId?;
    TypeResourceIdentifier 'type?;
    record {} fields?;
};

public type ChannelUpdate record {
    int 'version?;
    ChannelUpdateAction[] actions?;
};

public type InvalidItemShippingDetailsError record {
    *ErrorObject;
    string code?;
    string message?;
    string subject?;
    string itemId?;
};

public type EnumKeyDoesNotExistError record {
    *ErrorObject;
    string code?;
    string message?;
    string conflictingEnumKey?;
    string conflictingAttributeName?;
};

public type PaymentSetCustomTypeAction record {
    *PaymentUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type InvalidOperationError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type OrderBillingAddressSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    Address address?;
    Address oldAddress?;
};

public type Customer record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string customerNumber?;
    string email?;
    string password?;
    string firstName?;
    string lastName?;
    string middleName?;
    string title?;
    string dateOfBirth?;
    string companyName?;
    string vatId?;
    Address[] addresses?;
    string defaultShippingAddressId?;
    string[] shippingAddressIds?;
    string defaultBillingAddressId?;
    string[] billingAddressIds?;
    boolean isEmailVerified?;
    string externalId?;
    CustomerGroupReference customerGroup?;
    CustomFields custom?;
    string locale?;
    string salutation?;
    string 'key?;
    StoreKeyReference[] stores?;
};

public type CartSetCustomerGroupAction record {
    *CartUpdateAction;
    string action?;
    CustomerGroupResourceIdentifier customerGroup?;
};

public type Product record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string 'key?;
    ProductTypeReference productType?;
    ProductCatalogData masterData?;
    TaxCategoryReference taxCategory?;
    StateReference state?;
    ReviewRatingStatistics reviewRatingStatistics?;
};

public type ShoppingListAddTextLineItemAction record {
    *ShoppingListUpdateAction;
    string action?;
    LocalizedString name?;
    LocalizedString description?;
    int quantity?;
    string addedAt?;
    CustomFieldsDraft custom?;
};

public type Store record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string 'key?;
    LocalizedString name?;
    string[] languages?;
    ChannelReference[] distributionChannels?;
    ChannelReference[] supplyChannels?;
    ProductSelectionSetting[] productSelections?;
    CustomFields custom?;
};

public type DiscountCodeChangeGroupsAction record {
    *DiscountCodeUpdateAction;
    string action?;
    string[] groups?;
};

public type CustomerDeletedMessagePayload record {
    *MessagePayload;
    string 'type?;
};

public type PayloadNotIncluded record {
    string reason?;
    string payloadType?;
};

public type CartSetLocaleAction record {
    *CartUpdateAction;
    string action?;
    string locale?;
};

public type ResourceIdentifier record {
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type CartDiscountLineItemsTarget record {
    *CartDiscountTarget;
    string 'type?;
    string predicate?;
};

public type ChannelRoleEnum string;

public type DuplicateFieldWithConflictingResourceError record {
    *ErrorObject;
    string code?;
    string message?;
    string 'field?;
    string|record {}|string[]|decimal|int|boolean duplicateValue?;
    Reference conflictingResource?;
};

public type MyCartRemoveItemShippingAddressAction record {
    *MyCartUpdateAction;
    string action?;
    string addressKey?;
};

public type ShippingMethodSetCustomTypeAction record {
    *ShippingMethodUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type CartSetShippingMethodTaxRateAction record {
    *CartUpdateAction;
    string action?;
    ExternalTaxRateDraft externalTaxRate?;
};

public type ProductDiscountDraft record {
    LocalizedString name?;
    string 'key?;
    LocalizedString description?;
    ProductDiscountValueDraft value?;
    string predicate?;
    string sortOrder?;
    boolean isActive?;
    string validFrom?;
    string validUntil?;
};

public type OrderSetDeliveryCustomTypeAction record {
    *OrderUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type OrderShippingInfoSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    ShippingInfo shippingInfo?;
    ShippingInfo oldShippingInfo?;
};

public type ProductSelectionProductPagedQueryResponse record {
    int 'limit?;
    int offset?;
    int count?;
    int total?;
    AssignedProductReference[] results?;
};

public type Expansion string;

public type TaxedPriceDraft record {
    Money totalNet?;
    Money totalGross?;
    TaxPortionDraft[] taxPortions?;
};

public type TaxCategoryResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type AttributeConstraintEnum string;

public type ConcurrentModificationError record {
    *ErrorObject;
    string code?;
    string message?;
    int currentVersion?;
};

public type StateRemoveRolesAction record {
    *StateUpdateAction;
    string action?;
    StateRoleEnum[] roles?;
};

public type MyCustomerSetVatIdAction record {
    *MyCustomerUpdateAction;
    string action?;
    string vatId?;
};

public type ProductVariantChannelAvailability record {
    boolean isOnStock?;
    int restockableInDays?;
    int availableQuantity?;
};

public type DiscountCodeSetMaxApplicationsAction record {
    *DiscountCodeUpdateAction;
    string action?;
    int maxApplications?;
};

public type MyShoppingListSetTextLineItemCustomTypeAction record {
    *MyShoppingListUpdateAction;
    string action?;
    string textLineItemId?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type TaxCategoryUpdate record {
    int 'version?;
    TaxCategoryUpdateAction[] actions?;
};

public type CartUpdateAction record {
    string action?;
};

public type StagedOrderSetShippingAddressAndCustomShippingMethodAction record {
    *StagedOrderUpdateAction;
    string action?;
    BaseAddress address?;
    string shippingMethodName?;
    ShippingRateDraft shippingRate?;
    TaxCategoryResourceIdentifier taxCategory?;
    ExternalTaxRateDraft externalTaxRate?;
};

public type ProductAddAssetAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    boolean staged?;
    AssetDraft asset?;
    int position?;
};

public type CustomFieldReferenceType record {
    *FieldType;
    string name?;
    ReferenceTypeId referenceTypeId?;
};

public type CategoryUpdateAction record {
    string action?;
};

public type CartDiscountCustomLineItemsTarget record {
    *CartDiscountTarget;
    string 'type?;
    string predicate?;
};

public type ZoneResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type OrderSetLineItemShippingDetailsAction record {
    *OrderUpdateAction;
    string action?;
    string lineItemId?;
    ItemShippingDetailsDraft shippingDetails?;
};

public type StagedOrderAddReturnInfoAction record {
    *StagedOrderUpdateAction;
    string action?;
    string returnTrackingId?;
    ReturnItemDraft[] items?;
    string returnDate?;
};

public type StateResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type CartSetBillingAddressAction record {
    *CartUpdateAction;
    string action?;
    BaseAddress address?;
};

public type LastModifiedBy record {
    *ClientLogging;
    string clientId?;
    string externalUserId?;
    CustomerReference customer?;
    string anonymousId?;
};

public type ProductPublishedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string[] removedImageUrls?;
    ProductProjection productProjection?;
    ProductPublishScope scope?;
};

public type CartPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    Cart[] results?;
};

public type CustomerResetPassword record {
    string tokenValue?;
    string newPassword?;
    int 'version?;
};

public type InventoryEntry record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string sku?;
    ChannelReference supplyChannel?;
    int quantityOnStock?;
    int availableQuantity?;
    int restockableInDays?;
    string expectedDelivery?;
    CustomFields custom?;
};

public type ProjectChangeLanguagesAction record {
    *ProjectUpdateAction;
    string action?;
    Locale[] languages?;
};

public type StagedOrderChangeCustomLineItemMoneyAction record {
    *StagedOrderUpdateAction;
    string action?;
    string customLineItemId?;
    Money money?;
};

public type ProductSelectionPagedQueryResponse record {
    int 'limit?;
    int offset?;
    int count?;
    int total?;
    ProductSelection[] results?;
};

public type DuplicateAttributeValueError record {
    *ErrorObject;
    string code?;
    string message?;
    Attribute attribute?;
};

public type InventoryMode string;

public type StagedOrderSetDeliveryAddressCustomTypeAction record {
    *StagedOrderUpdateAction;
    string action?;
    string deliveryId?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type MyShoppingListSetCustomFieldAction record {
    *MyShoppingListUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type ClassificationShippingRateInputDraft record {
    *ShippingRateInputDraft;
    string 'type?;
    string 'key?;
};

public type CustomerAddressChangedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    Address address?;
};

public type OrderReturnInfoSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    ReturnInfo[] returnInfo?;
};

public type GraphQLError record {
    string message?;
    GraphQLErrorLocation[] locations?;
    (string|record {}|string[]|decimal|int|boolean)[] path?;
};

public type MissingRoleOnChannelError record {
    *ErrorObject;
    string code?;
    string message?;
    ChannelResourceIdentifier 'channel?;
    ChannelRoleEnum missingRole?;
};

public type CartSetLineItemTaxAmountAction record {
    *CartUpdateAction;
    string action?;
    string lineItemId?;
    ExternalTaxAmountDraft externalTaxAmount?;
};

public type MyCustomerSetLastNameAction record {
    *MyCustomerUpdateAction;
    string action?;
    string lastName?;
};

public type CentPrecisionMoney record {
    *TypedMoney;
    MoneyType 'type?;
    int fractionDigits?;
    int centAmount?;
    CurrencyCode currencyCode?;
};

public type DiscountedPrice record {
    TypedMoney value?;
    ProductDiscountReference discount?;
};

public type PaymentAddInterfaceInteractionAction record {
    *PaymentUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type TaxCategory record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string name?;
    string description?;
    TaxRate[] rates?;
    string 'key?;
};

public type CustomFieldEnumValue record {
    string 'key?;
    string label?;
};

public type ChannelSetAddressCustomTypeAction record {
    *ChannelUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type CustomerGroupDraft record {
    string 'key?;
    string groupName?;
    CustomFieldsDraft custom?;
};

public type MyCustomerSetTitleAction record {
    *MyCustomerUpdateAction;
    string action?;
    string title?;
};

public type OrderEditSetKeyAction record {
    *OrderEditUpdateAction;
    string action?;
    string 'key?;
};

public type ProductTypeRemoveEnumValuesAction record {
    *ProductTypeUpdateAction;
    string action?;
    string attributeName?;
    string[] keys?;
};

public type MyCustomerSetDefaultBillingAddressAction record {
    *MyCustomerUpdateAction;
    string action?;
    string addressId?;
    string addressKey?;
};

public type ProjectChangeMessagesEnabledAction record {
    *ProjectUpdateAction;
    string action?;
    boolean messagesEnabled?;
};

public type CategoryChangeParentAction record {
    *CategoryUpdateAction;
    string action?;
    CategoryResourceIdentifier parent?;
};

public type ErrorResponse record {
    int statusCode?;
    string message?;
    string _error?;
    string error_description?;
    ErrorObject[] errors?;
};

public type MyShoppingListUpdateAction record {
    string action?;
};

public type MessageSubscription record {
    string resourceTypeId?;
    string[] types?;
};

public type ParcelTrackingDataUpdatedMessagePayload record {
    *MessagePayload;
    string 'type?;
    string deliveryId?;
    string parcelId?;
    TrackingData trackingData?;
};

public type CartSetCustomShippingMethodAction record {
    *CartUpdateAction;
    string action?;
    string shippingMethodName?;
    ShippingRateDraft shippingRate?;
    TaxCategoryResourceIdentifier taxCategory?;
    ExternalTaxRateDraft externalTaxRate?;
};

public type DuplicateEnumValuesError record {
    *ErrorObject;
    string code?;
    string message?;
    string[] duplicates?;
};

public type StagedOrderSetCustomLineItemTaxRateAction record {
    *StagedOrderUpdateAction;
    string action?;
    string customLineItemId?;
    ExternalTaxRateDraft externalTaxRate?;
};

public type StateDraft record {
    string 'key?;
    StateTypeEnum 'type?;
    LocalizedString name?;
    LocalizedString description?;
    boolean initial?;
    StateRoleEnum[] roles?;
    StateResourceIdentifier[] transitions?;
};

public type ProductUnpublishedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
};

public type PaymentAddTransactionAction record {
    *PaymentUpdateAction;
    string action?;
    TransactionDraft 'transaction?;
};

public type CustomerSetExternalIdAction record {
    *CustomerUpdateAction;
    string action?;
    string externalId?;
};

public type ShoppingListChangeTextLineItemsOrderAction record {
    *ShoppingListUpdateAction;
    string action?;
    string[] textLineItemOrder?;
};

public type CustomerDeletedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
};

public type OrderStateChangedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    OrderState orderState?;
    OrderState oldOrderState?;
};

public type ProductChangeSlugAction record {
    *ProductUpdateAction;
    string action?;
    LocalizedString slug?;
    boolean staged?;
};

public type ShippingMethod record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string 'key?;
    string name?;
    LocalizedString localizedName?;
    string description?;
    LocalizedString localizedDescription?;
    TaxCategoryReference taxCategory?;
    ZoneRate[] zoneRates?;
    boolean isDefault?;
    string predicate?;
    CustomFields custom?;
};

public type MyShoppingListChangeLineItemQuantityAction record {
    *MyShoppingListUpdateAction;
    string action?;
    string lineItemId?;
    int quantity?;
};

public type CustomerGroupSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    CustomerGroupReference customerGroup?;
};

public type TypeChangeFieldDefinitionOrderAction record {
    *TypeUpdateAction;
    string action?;
    string[] fieldNames?;
};

public type LineItemStateTransitionMessagePayload record {
    *MessagePayload;
    string 'type?;
    string lineItemId?;
    string transitionDate?;
    int quantity?;
    StateReference fromState?;
    StateReference toState?;
};

public type ProductRemoveImageAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    string imageUrl?;
    boolean staged?;
};

public type CartSetCustomerEmailAction record {
    *CartUpdateAction;
    string action?;
    string email?;
};

public type ProductVariantAvailability record {
    boolean isOnStock?;
    int restockableInDays?;
    int availableQuantity?;
    ProductVariantChannelAvailabilityMap channels?;
};

public type MessageConfigurationDraft record {
    boolean enabled?;
    int deleteDaysAfterCreation?;
};

public type MyCustomerSetLocaleAction record {
    *MyCustomerUpdateAction;
    string action?;
    string locale?;
};

public type MyShoppingListChangeNameAction record {
    *MyShoppingListUpdateAction;
    string action?;
    LocalizedString name?;
};

public type PaymentInteractionAddedMessagePayload record {
    *MessagePayload;
    string 'type?;
    CustomFields interaction?;
};

public type OrderSetItemShippingAddressCustomFieldAction record {
    *OrderUpdateAction;
    string action?;
    string addressKey?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type ScoreShippingRateInputDraft record {
    *ShippingRateInputDraft;
    string 'type?;
    float score?;
};

public type MyCustomerUpdate record {
    int 'version?;
    MyCustomerUpdateAction[] actions?;
};

public type ProductTypeChangeIsSearchableAction record {
    *ProductTypeUpdateAction;
    string action?;
    string attributeName?;
    boolean isSearchable?;
};

public type ReturnInfo record {
    ReturnItem[] items?;
    string returnTrackingId?;
    string returnDate?;
};

public type TermFacetResult record {
    *FacetResult;
    FacetTypes 'type?;
    TermFacetResultType dataType?;
    int missing?;
    int total?;
    int other?;
    FacetResultTerm[] terms?;
};

public type ZoneRate record {
    ZoneReference zone?;
    ShippingRate[] shippingRates?;
};

public type ProductVariantAddedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    ProductVariant variant?;
    boolean staged?;
};

public type CustomerEmailChangedMessagePayload record {
    *MessagePayload;
    string 'type?;
    string email?;
};

public type OrderAddPaymentAction record {
    *OrderUpdateAction;
    string action?;
    PaymentResourceIdentifier payment?;
};

public type UserProvidedIdentifiers record {
    string 'key?;
    string externalId?;
    string orderNumber?;
    string customerNumber?;
    string sku?;
    LocalizedString slug?;
    ContainerAndKey containerAndKey?;
};

public type ProductSetAttributeAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
    boolean staged?;
};

public type ReviewSetLocaleAction record {
    *ReviewUpdateAction;
    string action?;
    string locale?;
};

public type ReviewTransitionStateAction record {
    *ReviewUpdateAction;
    string action?;
    StateResourceIdentifier state?;
    boolean force?;
};

public type ApiClient record {
    string id?;
    string name?;
    string scope?;
    string secret?;
    string lastUsedAt?;
    string deleteAt?;
    string createdAt?;
};

public type CartAddItemShippingAddressAction record {
    *CartUpdateAction;
    string action?;
    BaseAddress address?;
};

public type InventoryEntryDraft record {
    string sku?;
    ChannelResourceIdentifier supplyChannel?;
    int quantityOnStock?;
    int restockableInDays?;
    string expectedDelivery?;
    CustomFieldsDraft custom?;
};

public type CategoryCreatedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    Category category?;
};

public type CustomerCreatedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    Customer customer?;
};

public type InventoryEntryQuantitySetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    int oldQuantityOnStock?;
    int newQuantityOnStock?;
    int oldAvailableQuantity?;
    int newAvailableQuantity?;
    ChannelReference supplyChannel?;
};

public type ReviewSetTitleAction record {
    *ReviewUpdateAction;
    string action?;
    string title?;
};

public type TypeAddFieldDefinitionAction record {
    *TypeUpdateAction;
    string action?;
    FieldDefinition fieldDefinition?;
};

public type CustomerSetDateOfBirthAction record {
    *CustomerUpdateAction;
    string action?;
    string dateOfBirth?;
};

public type SelectionMode string;

public type ExternalOAuthFailedError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type StoreRemoveSupplyChannelAction record {
    *StoreUpdateAction;
    string action?;
    ChannelResourceIdentifier supplyChannel?;
};

public type MyPayment record {
    string id?;
    int 'version?;
    CustomerReference customer?;
    string anonymousId?;
    TypedMoney amountPlanned?;
    PaymentMethodInfo paymentMethodInfo?;
    Transaction[] transactions?;
    CustomFields custom?;
};

public type LineItemReturnItem record {
    *ReturnItem;
    string id?;
    int quantity?;
    string 'type?;
    string comment?;
    ReturnShipmentState shipmentState?;
    ReturnPaymentState paymentState?;
    CustomFields custom?;
    string lastModifiedAt?;
    string createdAt?;
    string lineItemId?;
};

public type ShoppingListSetSlugAction record {
    *ShoppingListUpdateAction;
    string action?;
    LocalizedString slug?;
};

public type CartDiscountSetKeyAction record {
    *CartDiscountUpdateAction;
    string action?;
    string 'key?;
};

public type LineItemDraft record {
    string productId?;
    int variantId?;
    string sku?;
    int quantity?;
    string addedAt?;
    ChannelResourceIdentifier supplyChannel?;
    ChannelResourceIdentifier distributionChannel?;
    ExternalTaxRateDraft externalTaxRate?;
    CustomFieldsDraft custom?;
    Money externalPrice?;
    ExternalLineItemTotalPrice externalTotalPrice?;
    ItemShippingDetailsDraft shippingDetails?;
};

public type CartSetDeliveryAddressCustomFieldAction record {
    *CartUpdateAction;
    string action?;
    string deliveryId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type MyCartAddDiscountCodeAction record {
    *MyCartUpdateAction;
    string action?;
    string code?;
};

public type CategoryOrderHints record {
};

public type Money record {
    int centAmount?;
    CurrencyCode currencyCode?;
};

public type MessageConfiguration record {
    boolean enabled?;
    int deleteDaysAfterCreation?;
};

public type MyCartRecalculateAction record {
    *MyCartUpdateAction;
    string action?;
    boolean updateProductData?;
};

public type ProductVariantAddedMessagePayload record {
    *MessagePayload;
    string 'type?;
    ProductVariant variant?;
    boolean staged?;
};

public type ProductSelectionSetKeyAction record {
    *ProductSelectionUpdateAction;
    string action?;
    string 'key?;
};

public type CartSetCustomLineItemTaxAmountAction record {
    *CartUpdateAction;
    string action?;
    string customLineItemId?;
    ExternalTaxAmountDraft externalTaxAmount?;
};

public type ReviewStateTransitionMessagePayload record {
    *MessagePayload;
    string 'type?;
    StateReference oldState?;
    StateReference newState?;
    boolean oldIncludedInStatistics?;
    boolean newIncludedInStatistics?;
    Reference target?;
    boolean force?;
};

public type ProductDiscountValueRelativeDraft record {
    *ProductDiscountValueDraft;
    string 'type?;
    int permyriad?;
};

public type CartDiscountValueGiftLineItemDraft record {
    *CartDiscountValueDraft;
    string 'type?;
    ProductResourceIdentifier product?;
    int variantId?;
    ChannelResourceIdentifier supplyChannel?;
    ChannelResourceIdentifier distributionChannel?;
};

public type TaxRate record {
    string id?;
    string name?;
    float amount?;
    boolean includedInPrice?;
    CountryCode country?;
    string state?;
    SubRate[] subRates?;
};

public type StoreAddSupplyChannelAction record {
    *StoreUpdateAction;
    string action?;
    ChannelResourceIdentifier supplyChannel?;
};

public type OrderShipmentStateChangedMessagePayload record {
    *MessagePayload;
    string 'type?;
    ShipmentState shipmentState?;
    ShipmentState oldShipmentState?;
};

public type CustomLineItem record {
    string id?;
    LocalizedString name?;
    TypedMoney money?;
    TaxedItemPrice taxedPrice?;
    TypedMoney totalPrice?;
    string slug?;
    int quantity?;
    ItemState[] state?;
    TaxCategoryReference taxCategory?;
    TaxRate taxRate?;
    DiscountedLineItemPriceForQuantity[] discountedPricePerQuantity?;
    CustomFields custom?;
    ItemShippingDetails shippingDetails?;
};

public type ZoneDraft record {
    string 'key?;
    string name?;
    string description?;
    Location[] locations?;
};

public type OrderBillingAddressSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    Address address?;
    Address oldAddress?;
};

public type CartSetCustomLineItemShippingDetailsAction record {
    *CartUpdateAction;
    string action?;
    string customLineItemId?;
    ItemShippingDetailsDraft shippingDetails?;
};

public type StoreReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    Store obj?;
};

public type MyCartChangeTaxModeAction record {
    *MyCartUpdateAction;
    string action?;
    TaxMode taxMode?;
};

public type ProductTypeChangeLocalizedEnumValueOrderAction record {
    *ProductTypeUpdateAction;
    string action?;
    string attributeName?;
    AttributeLocalizedEnumValue[] values?;
};

public type MyPaymentUpdate record {
    int 'version?;
    MyPaymentUpdateAction[] actions?;
};

public type CartSetShippingMethodTaxAmountAction record {
    *CartUpdateAction;
    string action?;
    ExternalTaxAmountDraft externalTaxAmount?;
};

public type StagedOrderRemoveDiscountCodeAction record {
    *StagedOrderUpdateAction;
    string action?;
    DiscountCodeReference discountCode?;
};

public type DiscountCodeSetValidFromAction record {
    *DiscountCodeUpdateAction;
    string action?;
    string validFrom?;
};

public type TypeChangeLocalizedEnumValueOrderAction record {
    *TypeUpdateAction;
    string action?;
    string fieldName?;
    string[] keys?;
};

public type ShoppingListResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type StagedOrderSetShippingAddressAndShippingMethodAction record {
    *StagedOrderUpdateAction;
    string action?;
    BaseAddress address?;
    ShippingMethodResourceIdentifier shippingMethod?;
    ExternalTaxRateDraft externalTaxRate?;
};

public type AttributeMoneyType record {
    *AttributeType;
    string name?;
};

public type AssetDraft record {
    AssetSource[] sources?;
    LocalizedString name?;
    LocalizedString description?;
    string[] tags?;
    CustomFieldsDraft custom?;
    string 'key?;
};

public type ProductDiscountValueAbsolute record {
    *ProductDiscountValue;
    string 'type?;
    TypedMoney[] money?;
};

public type ShippingMethodDraft record {
    string 'key?;
    string name?;
    LocalizedString localizedName?;
    string description?;
    LocalizedString localizedDescription?;
    TaxCategoryResourceIdentifier taxCategory?;
    ZoneRateDraft[] zoneRates?;
    boolean isDefault?;
    string predicate?;
    CustomFieldsDraft custom?;
};

public type OrderReturnInfoAddedMessagePayload record {
    *MessagePayload;
    string 'type?;
    ReturnInfo returnInfo?;
};

public type SubRate record {
    string name?;
    float amount?;
};

public type Delivery record {
    string id?;
    string createdAt?;
    DeliveryItem[] items?;
    Parcel[] parcels?;
    Address address?;
    CustomFields custom?;
};

public type TypeRemoveFieldDefinitionAction record {
    *TypeUpdateAction;
    string action?;
    string fieldName?;
};

public type ProductDiscountSetDescriptionAction record {
    *ProductDiscountUpdateAction;
    string action?;
    LocalizedString description?;
};

public type CustomerGroupSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    CustomerGroupReference customerGroup?;
};

public type Address record {
    *BaseAddress;
    string id?;
    string 'key?;
    string title?;
    string salutation?;
    string firstName?;
    string lastName?;
    string streetName?;
    string streetNumber?;
    string additionalStreetInfo?;
    string postalCode?;
    string city?;
    string region?;
    string state?;
    CountryCode country?;
    string company?;
    string department?;
    string building?;
    string apartment?;
    string pOBox?;
    string phone?;
    string mobile?;
    string email?;
    string fax?;
    string additionalAddressInfo?;
    string externalId?;
    CustomFields custom?;
};

public type StateUpdate record {
    int 'version?;
    StateUpdateAction[] actions?;
};

public type StagedOrderSetCountryAction record {
    *StagedOrderUpdateAction;
    string action?;
    string country?;
};

public type TypeChangeLocalizedEnumValueLabelAction record {
    *TypeUpdateAction;
    string action?;
    string fieldName?;
    CustomFieldLocalizedEnumValue value?;
};

public type OrderLineItemDiscountSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string lineItemId?;
    DiscountedLineItemPriceForQuantity[] discountedPricePerQuantity?;
    Money totalPrice?;
    TaxedItemPrice taxedPrice?;
};

public type ProductSelectionDeletedMessagePayload record {
    *MessagePayload;
    string 'type?;
    LocalizedString name?;
};

public type CategoryChangeAssetNameAction record {
    *CategoryUpdateAction;
    string action?;
    string assetId?;
    string assetKey?;
    LocalizedString name?;
};

public type AttributeSetType record {
    *AttributeType;
    string name?;
    AttributeType elementType?;
};

public type Image record {
    string url?;
    ImageDimensions dimensions?;
    string label?;
};

public type PaymentSetAuthorizationAction record {
    *PaymentUpdateAction;
    string action?;
    Money amount?;
    string until?;
};

public type ProductTypeChangeEnumKeyAction record {
    *ProductTypeUpdateAction;
    string action?;
    string attributeName?;
    string 'key?;
    string newKey?;
};

public type ExtensionUpdate record {
    int 'version?;
    ExtensionUpdateAction[] actions?;
};

public type OrderDiscountCodeAddedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    DiscountCodeReference discountCode?;
};

public type FacetResults record {
};

public type CategorySetCustomFieldAction record {
    *CategoryUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type OrderEditAppliedMessagePayload record {
    *MessagePayload;
    string 'type?;
    OrderEditReference edit?;
    OrderEditApplied result?;
};

public type OrderEditNotProcessed record {
    *OrderEditResult;
    string 'type?;
};

public type ShoppingListSetLineItemCustomFieldAction record {
    *ShoppingListUpdateAction;
    string action?;
    string lineItemId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type CustomerSetLocaleAction record {
    *CustomerUpdateAction;
    string action?;
    string locale?;
};

public type ChannelSetGeoLocationAction record {
    *ChannelUpdateAction;
    string action?;
    GeoJson geoLocation?;
};

public type CartDiscountChangeValueAction record {
    *CartDiscountUpdateAction;
    string action?;
    CartDiscountValueDraft value?;
};

public type ProductCreatedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    ProductProjection productProjection?;
};

public type MyCartApplyDeltaToLineItemShippingDetailsTargetsAction record {
    *MyCartUpdateAction;
    string action?;
    string lineItemId?;
    ItemShippingTarget[] targetsDelta?;
};

public type StagedOrderAddLineItemAction record {
    *StagedOrderUpdateAction;
    string action?;
    CustomFieldsDraft custom?;
    ChannelResourceIdentifier distributionChannel?;
    ExternalTaxRateDraft externalTaxRate?;
    string productId?;
    int variantId?;
    string sku?;
    float quantity?;
    string addedAt?;
    ChannelResourceIdentifier supplyChannel?;
    Money externalPrice?;
    ExternalLineItemTotalPrice externalTotalPrice?;
    ItemShippingDetailsDraft shippingDetails?;
};

public type ShippingMethodSetDescriptionAction record {
    *ShippingMethodUpdateAction;
    string action?;
    string description?;
};

public type PaymentSetMethodInfoMethodAction record {
    *PaymentUpdateAction;
    string action?;
    string method?;
};

public type ProductDiscountValue record {
    string 'type?;
};

public type CustomerUpdateAction record {
    string action?;
};

public type ErrorObject record {
    string code?;
    string message?;
};

public type StagedOrderSetShippingAddressCustomTypeAction record {
    *StagedOrderUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type ProductDiscountChangeSortOrderAction record {
    *ProductDiscountUpdateAction;
    string action?;
    string sortOrder?;
};

public type StoreDraft record {
    string 'key?;
    LocalizedString name?;
    string[] languages?;
    ChannelResourceIdentifier[] distributionChannels?;
    ChannelResourceIdentifier[] supplyChannels?;
    ProductSelectionSettingDraft[] productSelections?;
    CustomFieldsDraft custom?;
};

public type CategorySetExternalIdAction record {
    *CategoryUpdateAction;
    string action?;
    string externalId?;
};

public type GraphQLResponse record {
    string|record {}|string[]|decimal|int|boolean data?;
    GraphQLError[] errors?;
};

public type OrderSetReturnShipmentStateAction record {
    *OrderUpdateAction;
    string action?;
    string returnItemId?;
    ReturnShipmentState shipmentState?;
};

public type ExtensionAction string;

public type SubscriptionDelivery record {
    string projectKey?;
    string notificationType?;
    Reference 'resource?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
};

public type MyPaymentPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    MyPayment[] results?;
};

public type TextLineItem record {
    string addedAt?;
    CustomFields custom?;
    LocalizedString description?;
    string id?;
    LocalizedString name?;
    int quantity?;
};

public type CategorySetAssetKeyAction record {
    *CategoryUpdateAction;
    string action?;
    string assetId?;
    string assetKey?;
};

public type StagedOrderSetCustomerEmailAction record {
    *StagedOrderUpdateAction;
    string action?;
    string email?;
};

public type ShoppingListSetTextLineItemDescriptionAction record {
    *ShoppingListUpdateAction;
    string action?;
    string textLineItemId?;
    LocalizedString description?;
};

public type ProductRevertedStagedChangesMessagePayload record {
    *MessagePayload;
    string 'type?;
    string[] removedImageUrls?;
};

public type CartRecalculateAction record {
    *CartUpdateAction;
    string action?;
    boolean updateProductData?;
};

public type ReferenceExistsError record {
    *ErrorObject;
    string code?;
    string message?;
    ReferenceTypeId referencedBy?;
};

public type CategoryChangeSlugAction record {
    *CategoryUpdateAction;
    string action?;
    LocalizedString slug?;
};

public type GoogleCloudPubSubDestination record {
    *Destination;
    string 'type?;
    string projectId?;
    string topic?;
};

public type CartDiscountValueFixed record {
    *CartDiscountValue;
    string 'type?;
    TypedMoney[] money?;
};

public type ProductDiscountChangeNameAction record {
    *ProductDiscountUpdateAction;
    string action?;
    LocalizedString name?;
};

public type StagedOrderSetShippingMethodTaxAmountAction record {
    *StagedOrderUpdateAction;
    string action?;
    ExternalTaxAmountDraft externalTaxAmount?;
};

public type PriceFunction record {
    CurrencyCode currencyCode?;
    string 'function?;
};

public type CartDiscountValue record {
    string 'type?;
};

public type StagedOrderSetCustomerIdAction record {
    *StagedOrderUpdateAction;
    string action?;
    string customerId?;
};

public type ProductSelectionRemoveProductAction record {
    *ProductSelectionUpdateAction;
    string action?;
    ProductResourceIdentifier product?;
};

public type OrderStoreSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    StoreKeyReference store?;
};

public type StoreSetSupplyChannelsAction record {
    *StoreUpdateAction;
    string action?;
    ChannelResourceIdentifier[] supplyChannels?;
};

public type CustomerSetCompanyNameAction record {
    *CustomerUpdateAction;
    string action?;
    string companyName?;
};

public type PaymentSetAmountRefundedAction record {
    *PaymentUpdateAction;
    string action?;
    Money amount?;
};

public type OrderShippingAddressSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    Address address?;
    Address oldAddress?;
};

public type CartAddDiscountCodeAction record {
    *CartUpdateAction;
    string action?;
    string code?;
};

public type ProductAddToCategoryAction record {
    *ProductUpdateAction;
    string action?;
    CategoryResourceIdentifier category?;
    string orderHint?;
    boolean staged?;
};

public type CartDiscountPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    CartDiscount[] results?;
};

public type ShoppingListReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    ShoppingList obj?;
};

public type InvalidJsonInputError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type CartSetLineItemCustomTypeAction record {
    *CartUpdateAction;
    string action?;
    string lineItemId?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type ExtensionHttpDestinationAuthentication record {
    string 'type?;
};

public type MyCartSetCustomTypeAction record {
    *MyCartUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type ShippingMethodPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    ShippingMethod[] results?;
};

public type ChannelSetCustomTypeAction record {
    *ChannelUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type ShoppingListDraft record {
    CustomFieldsDraft custom?;
    CustomerResourceIdentifier customer?;
    int deleteDaysAfterLastModification?;
    LocalizedString description?;
    string 'key?;
    ShoppingListLineItemDraft[] lineItems?;
    LocalizedString name?;
    LocalizedString slug?;
    TextLineItemDraft[] textLineItems?;
    string anonymousId?;
    StoreResourceIdentifier store?;
};

public type PaymentChangeAmountPlannedAction record {
    *PaymentUpdateAction;
    string action?;
    Money amount?;
};

public type PaymentChangeTransactionTimestampAction record {
    *PaymentUpdateAction;
    string action?;
    string transactionId?;
    string timestamp?;
};

public type Locale string;

public type StateTypeEnum string;

public type StagedOrderSetParcelTrackingDataAction record {
    *StagedOrderUpdateAction;
    string action?;
    string parcelId?;
    TrackingData trackingData?;
};

public type AttributeNumberType record {
    *AttributeType;
    string name?;
};

public type MyShoppingListChangeLineItemsOrderAction record {
    *MyShoppingListUpdateAction;
    string action?;
    string[] lineItemOrder?;
};

public type StagedOrderRemovePaymentAction record {
    *StagedOrderUpdateAction;
    string action?;
    PaymentResourceIdentifier payment?;
};

public type ProductTypeChangeAttributeOrderAction record {
    *ProductTypeUpdateAction;
    string action?;
    AttributeDefinition[] attributes?;
};

public type ProductPublishAction record {
    *ProductUpdateAction;
    string action?;
    ProductPublishScope scope?;
};

public type MyTransactionDraft record {
    string timestamp?;
    TransactionType 'type?;
    Money amount?;
    string interactionId?;
    CustomFields custom?;
};

public type ShoppingList record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    CustomFields custom?;
    CustomerReference customer?;
    int deleteDaysAfterLastModification?;
    LocalizedString description?;
    string 'key?;
    ShoppingListLineItem[] lineItems?;
    LocalizedString name?;
    LocalizedString slug?;
    TextLineItem[] textLineItems?;
    string anonymousId?;
    StoreKeyReference store?;
};

public type OrderSetParcelCustomFieldAction record {
    *OrderUpdateAction;
    string action?;
    string parcelId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type ProductTypeChangeInputHintAction record {
    *ProductTypeUpdateAction;
    string action?;
    string attributeName?;
    TextInputHint newValue?;
};

public type CategoryReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    Category obj?;
};

public type StagedOrderAddDiscountCodeAction record {
    *StagedOrderUpdateAction;
    string action?;
    string code?;
};

public type ShippingMethodReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    ShippingMethod obj?;
};

public type ProductProjectionPagedSearchResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    ProductProjection[] results?;
    FacetResults facets?;
};

public type ProductChangeAssetOrderAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    boolean staged?;
    string[] assetOrder?;
};

public type OrderLineItemDistributionChannelSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    string lineItemId?;
    ChannelReference distributionChannel?;
};

public type TextLineItemDraft record {
    string addedAt?;
    CustomFieldsDraft custom?;
    LocalizedString description?;
    LocalizedString name?;
    int quantity?;
};

public type ProductTypeUpdateAction record {
    string action?;
};

public type ProductSelectionProductRemovedMessagePayload record {
    *MessagePayload;
    string 'type?;
    ProductReference product?;
};

public type MessagePagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    Message[] results?;
};

public type ProductTypeAddPlainEnumValueAction record {
    *ProductTypeUpdateAction;
    string action?;
    string attributeName?;
    AttributePlainEnumValue value?;
};

public type CartScoreType record {
    *ShippingRateInputType;
    ShippingRateTierType 'type?;
};

public type CategorySetAssetCustomTypeAction record {
    *CategoryUpdateAction;
    string action?;
    string assetId?;
    string assetKey?;
    TypeResourceIdentifier 'type?;
    record {} fields?;
};

public type PaymentStatus record {
    string interfaceCode?;
    string interfaceText?;
    StateReference state?;
};

public type StagedOrderChangePaymentStateAction record {
    *StagedOrderUpdateAction;
    string action?;
    PaymentState paymentState?;
};

public type PaymentChangeTransactionStateAction record {
    *PaymentUpdateAction;
    string action?;
    string transactionId?;
    TransactionState state?;
};

public type ShippingMethodSetCustomFieldAction record {
    *ShippingMethodUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type SnsDestination record {
    *Destination;
    string 'type?;
    string accessKey?;
    string accessSecret?;
    string topicArn?;
};

public type CartSetLineItemDistributionChannelAction record {
    *CartUpdateAction;
    string action?;
    string lineItemId?;
    ChannelResourceIdentifier distributionChannel?;
};

public type DiscountCodeSetCustomFieldAction record {
    *DiscountCodeUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type TypeChangeInputHintAction record {
    *TypeUpdateAction;
    string action?;
    string fieldName?;
    TypeTextInputHint inputHint?;
};

public type OrderImportCustomLineItemStateAction record {
    *OrderUpdateAction;
    string action?;
    string customLineItemId?;
    ItemState[] state?;
};

public type CartApplyDeltaToLineItemShippingDetailsTargetsAction record {
    *CartUpdateAction;
    string action?;
    string lineItemId?;
    ItemShippingTarget[] targetsDelta?;
};

public type Payment record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    CustomerReference customer?;
    string anonymousId?;
    string externalId?;
    string interfaceId?;
    TypedMoney amountPlanned?;
    TypedMoney amountAuthorized?;
    string authorizedUntil?;
    TypedMoney amountPaid?;
    TypedMoney amountRefunded?;
    PaymentMethodInfo paymentMethodInfo?;
    PaymentStatus paymentStatus?;
    Transaction[] transactions?;
    CustomFields[] interfaceInteractions?;
    CustomFields custom?;
    string 'key?;
};

public type StagedOrderRemoveItemShippingAddressAction record {
    *StagedOrderUpdateAction;
    string action?;
    string addressKey?;
};

public type ProductProjectionPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    ProductProjection[] results?;
};

public type FilteredFacetResult record {
    *FacetResult;
    FacetTypes 'type?;
    int count?;
    int productCount?;
};

public type Price record {
    string id?;
    TypedMoney value?;
    CountryCode country?;
    CustomerGroupReference customerGroup?;
    ChannelReference 'channel?;
    string validFrom?;
    string validUntil?;
    DiscountedPrice discounted?;
    CustomFields custom?;
    PriceTier[] tiers?;
};

public type MessageDelivery record {
    *SubscriptionDelivery;
    string projectKey?;
    string notificationType?;
    Reference 'resource?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    int sequenceNumber?;
    int resourceVersion?;
    PayloadNotIncluded payloadNotIncluded?;
};

public type ParcelAddedToDeliveryMessagePayload record {
    *MessagePayload;
    string 'type?;
    Delivery delivery?;
    Parcel parcel?;
};

public type CustomerSetMiddleNameAction record {
    *CustomerUpdateAction;
    string action?;
    string middleName?;
};

public type AttributeTimeType record {
    *AttributeType;
    string name?;
};

public type ReviewRatingSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    float oldRating?;
    float newRating?;
    boolean includedInStatistics?;
    Reference target?;
};

public type StagedOrderChangeTaxCalculationModeAction record {
    *StagedOrderUpdateAction;
    string action?;
    TaxCalculationMode taxCalculationMode?;
};

public type Destination record {
    string 'type?;
};

public type ShoppingListLineItem record {
    string addedAt?;
    CustomFields custom?;
    string deactivatedAt?;
    string id?;
    LocalizedString name?;
    string productId?;
    LocalizedString productSlug?;
    ProductTypeReference productType?;
    int quantity?;
    ProductVariant variant?;
    int variantId?;
};

public type AnonymousIdAlreadyInUseError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type ProductSelectionAddProductAction record {
    *ProductSelectionUpdateAction;
    string action?;
    ProductResourceIdentifier product?;
};

public type DuplicateFieldError record {
    *ErrorObject;
    string code?;
    string message?;
    string 'field?;
    string|record {}|string[]|decimal|int|boolean duplicateValue?;
    Reference conflictingResource?;
};

public type AttributePlainEnumValue record {
    string 'key?;
    string label?;
};

public type OrderPaymentStateChangedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    PaymentState paymentState?;
    PaymentState oldPaymentState?;
};

public type ShippingMethodSetPredicateAction record {
    *ShippingMethodUpdateAction;
    string action?;
    string predicate?;
};

public type PaymentStatusStateTransitionMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    StateReference state?;
    boolean force?;
};

public type CartRemoveItemShippingAddressAction record {
    *CartUpdateAction;
    string action?;
    string addressKey?;
};

public type OrderSetCustomFieldAction record {
    *OrderUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type ProductSetCategoryOrderHintAction record {
    *ProductUpdateAction;
    string action?;
    string categoryId?;
    string orderHint?;
    boolean staged?;
};

public type CountryCode string;

public type AttributeBooleanType record {
    *AttributeType;
    string name?;
};

public type OrderStateChangedMessagePayload record {
    *MessagePayload;
    string 'type?;
    OrderState orderState?;
    OrderState oldOrderState?;
};

public type PaymentCreatedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    Payment payment?;
};

public type StoreSetCustomFieldAction record {
    *StoreUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type CategoryChangeOrderHintAction record {
    *CategoryUpdateAction;
    string action?;
    string orderHint?;
};

public type PaymentTransactionStateChangedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string transactionId?;
    TransactionState state?;
};

public type ExtensionPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    Extension[] results?;
};

public type InventoryEntryQuantitySetMessagePayload record {
    *MessagePayload;
    string 'type?;
    int oldQuantityOnStock?;
    int newQuantityOnStock?;
    int oldAvailableQuantity?;
    int newAvailableQuantity?;
    ChannelReference supplyChannel?;
};

public type StagedOrderAddShoppingListAction record {
    *StagedOrderUpdateAction;
    string action?;
    ShoppingListResourceIdentifier shoppingList?;
    ChannelResourceIdentifier supplyChannel?;
    ChannelResourceIdentifier distributionChannel?;
};

public type OrderShipmentStateChangedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    ShipmentState shipmentState?;
    ShipmentState oldShipmentState?;
};

public type StagedOrderSetOrderTotalTaxAction record {
    *StagedOrderUpdateAction;
    string action?;
    Money externalTotalGross?;
    TaxPortionDraft[] externalTaxPortions?;
};

public type ChannelPagedQueryResponse record {
    int 'limit?;
    int offset?;
    int count?;
    int total?;
    Channel[] results?;
};

public type OrderEditResult record {
    string 'type?;
};

public type OrderDiscountCodeRemovedMessagePayload record {
    *MessagePayload;
    string 'type?;
    DiscountCodeReference discountCode?;
};

public type OrderRemoveParcelFromDeliveryAction record {
    *OrderUpdateAction;
    string action?;
    string parcelId?;
};

public type ProductSetSearchKeywordsAction record {
    *ProductUpdateAction;
    string action?;
    SearchKeywords searchKeywords?;
    boolean staged?;
};

public type FieldType record {
    string name?;
};

public type ScoreShippingRateInput record {
    *ShippingRateInput;
    string 'type?;
    float score?;
};

public type MyShoppingListSetDeleteDaysAfterLastModificationAction record {
    *MyShoppingListUpdateAction;
    string action?;
    int deleteDaysAfterLastModification?;
};

public type MyCartSetLineItemCustomFieldAction record {
    *MyCartUpdateAction;
    string action?;
    string lineItemId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type OrderImportLineItemStateAction record {
    *OrderUpdateAction;
    string action?;
    string lineItemId?;
    ItemState[] state?;
};

public type ProductDiscountSetValidFromAction record {
    *ProductDiscountUpdateAction;
    string action?;
    string validFrom?;
};

public type StateSetNameAction record {
    *StateUpdateAction;
    string action?;
    LocalizedString name?;
};

public type StagedOrderSetBillingAddressAction record {
    *StagedOrderUpdateAction;
    string action?;
    BaseAddress address?;
};

public type PaymentDraft record {
    CustomerResourceIdentifier customer?;
    string anonymousId?;
    string externalId?;
    string interfaceId?;
    Money amountPlanned?;
    Money amountAuthorized?;
    string authorizedUntil?;
    Money amountPaid?;
    Money amountRefunded?;
    PaymentMethodInfo paymentMethodInfo?;
    PaymentStatusDraft paymentStatus?;
    TransactionDraft[] transactions?;
    CustomFieldsDraft[] interfaceInteractions?;
    CustomFieldsDraft custom?;
    string 'key?;
};

public type ReviewRatingStatistics record {
    float averageRating?;
    float highestRating?;
    float lowestRating?;
    int count?;
    record {} ratingsDistribution?;
};

public type MyPaymentSetCustomFieldAction record {
    *MyPaymentUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type CartDiscountSetDescriptionAction record {
    *CartDiscountUpdateAction;
    string action?;
    LocalizedString description?;
};

public type ProductAddPriceAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    PriceDraft price?;
    boolean staged?;
};

public type ProductTypeReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    ProductType obj?;
};

public type ExtensionSetTimeoutInMsAction record {
    *ExtensionUpdateAction;
    string action?;
    int timeoutInMs?;
};

public type ReturnItem record {
    string id?;
    int quantity?;
    string 'type?;
    string comment?;
    ReturnShipmentState shipmentState?;
    ReturnPaymentState paymentState?;
    CustomFields custom?;
    string lastModifiedAt?;
    string createdAt?;
};

public type ProductDeletedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string[] removedImageUrls?;
    ProductProjection currentProjection?;
};

public type StagedOrderSetBillingAddressCustomFieldAction record {
    *StagedOrderUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type StagedOrderSetLineItemTotalPriceAction record {
    *StagedOrderUpdateAction;
    string action?;
    string lineItemId?;
    ExternalLineItemTotalPrice externalTotalPrice?;
};

public type ReviewResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type StagedOrderChangeTaxModeAction record {
    *StagedOrderUpdateAction;
    string action?;
    TaxMode taxMode?;
};

public type ProductVariantDeletedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    ProductVariant variant?;
    string[] removedImageUrls?;
};

public type StagedOrderSetLineItemTaxRateAction record {
    *StagedOrderUpdateAction;
    string action?;
    string lineItemId?;
    ExternalTaxRateDraft externalTaxRate?;
};

public type OrderSetReturnItemCustomTypeAction record {
    *OrderUpdateAction;
    string action?;
    string returnItemId?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type PaymentSetInterfaceIdAction record {
    *PaymentUpdateAction;
    string action?;
    string interfaceId?;
};

public type StagedOrderSetReturnShipmentStateAction record {
    *StagedOrderUpdateAction;
    string action?;
    string returnItemId?;
    ReturnShipmentState shipmentState?;
};

public type CentPrecisionMoneyDraft record {
    *TypedMoneyDraft;
    int centAmount?;
    CurrencyCode currencyCode?;
    MoneyType 'type?;
    int fractionDigits?;
};

public type DuplicateAttributeValuesError record {
    *ErrorObject;
    string code?;
    string message?;
    Attribute[] attributes?;
};

public type TaxedItemPriceDraft record {
    Money totalNet?;
    Money totalGross?;
};

public type CustomerGroupSetKeyAction record {
    *CustomerGroupUpdateAction;
    string action?;
    string 'key?;
};

public type OrderEditSetStagedActionsAction record {
    *OrderEditUpdateAction;
    string action?;
    StagedOrderUpdateAction[] stagedActions?;
};

public type CartSetLineItemCustomFieldAction record {
    *CartUpdateAction;
    string action?;
    string lineItemId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type MyShoppingListDraft record {
    LocalizedString name?;
    LocalizedString description?;
    ShoppingListLineItemDraft[] lineItems?;
    TextLineItemDraft[] textLineItems?;
    CustomFieldsDraft custom?;
    int deleteDaysAfterLastModification?;
    StoreResourceIdentifier store?;
};

public type PaymentSetMethodInfoNameAction record {
    *PaymentUpdateAction;
    string action?;
    LocalizedString name?;
};

public type MyCartSetShippingAddressAction record {
    *MyCartUpdateAction;
    string action?;
    BaseAddress address?;
};

public type OrderChangeOrderStateAction record {
    *OrderUpdateAction;
    string action?;
    OrderState orderState?;
};

public type OrderSetParcelItemsAction record {
    *OrderUpdateAction;
    string action?;
    string parcelId?;
    DeliveryItem[] items?;
};

public type CreatedBy record {
    *ClientLogging;
    string clientId?;
    string externalUserId?;
    CustomerReference customer?;
    string anonymousId?;
};

public type InventoryEntryDeletedMessagePayload record {
    *MessagePayload;
    string 'type?;
    string sku?;
    ChannelReference supplyChannel?;
};

public type SubscriptionSetMessagesAction record {
    *SubscriptionUpdateAction;
    string action?;
    MessageSubscription[] messages?;
};

public type CartDiscountSetCustomFieldAction record {
    *CartDiscountUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type ReturnPaymentState string;

public type ProductSetPricesAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    PriceDraft[] prices?;
    boolean staged?;
};

public type StagedOrderSetDeliveryAddressCustomFieldAction record {
    *StagedOrderUpdateAction;
    string action?;
    string deliveryId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type ProductTypePagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    ProductType[] results?;
};

public type InventoryEntrySetExpectedDeliveryAction record {
    *InventoryEntryUpdateAction;
    string action?;
    string expectedDelivery?;
};

public type ProductRevertStagedChangesAction record {
    *ProductUpdateAction;
    string action?;
};

public type CustomLineItemDraft record {
    LocalizedString name?;
    int quantity?;
    Money money?;
    string slug?;
    TaxCategoryResourceIdentifier taxCategory?;
    ExternalTaxRateDraft externalTaxRate?;
    CustomFieldsDraft custom?;
    ItemShippingDetailsDraft shippingDetails?;
};

public type DeliveryFormat record {
    string 'type?;
};

public type FacetResult record {
    FacetTypes 'type?;
};

public type ShoppingListSetDescriptionAction record {
    *ShoppingListUpdateAction;
    string action?;
    LocalizedString description?;
};

public type CustomFieldLocalizedEnumValue record {
    string 'key?;
    LocalizedString label?;
};

public type StagedOrderSetShippingAddressAction record {
    *StagedOrderUpdateAction;
    string action?;
    BaseAddress address?;
};

public type CategorySetMetaTitleAction record {
    *CategoryUpdateAction;
    string action?;
    LocalizedString metaTitle?;
};

public type ExtensionAuthorizationHeaderAuthentication record {
    *ExtensionHttpDestinationAuthentication;
    string 'type?;
    string headerValue?;
};

public type ShoppingListChangeTextLineItemQuantityAction record {
    *ShoppingListUpdateAction;
    string action?;
    string textLineItemId?;
    int quantity?;
};

public type EnumValueIsUsedError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type PaymentReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    Payment obj?;
};

public type CartSetKeyAction record {
    *CartUpdateAction;
    string action?;
    string 'key?;
};

public type CartState string;

public type OrderImportDraft record {
    string orderNumber?;
    string customerId?;
    string customerEmail?;
    LineItemImportDraft[] lineItems?;
    CustomLineItemImportDraft[] customLineItems?;
    Money totalPrice?;
    TaxedPriceDraft taxedPrice?;
    BaseAddress shippingAddress?;
    BaseAddress billingAddress?;
    CustomerGroupResourceIdentifier customerGroup?;
    string country?;
    OrderState orderState?;
    ShipmentState shipmentState?;
    PaymentState paymentState?;
    ShippingInfoImportDraft shippingInfo?;
    string completedAt?;
    CustomFieldsDraft custom?;
    InventoryMode inventoryMode?;
    RoundingMode taxRoundingMode?;
    BaseAddress[] itemShippingAddresses?;
    StoreResourceIdentifier store?;
    CartOrigin origin?;
};

public type OrderUpdate record {
    int 'version?;
    OrderUpdateAction[] actions?;
};

public type CategoryAddAssetAction record {
    *CategoryUpdateAction;
    string action?;
    AssetDraft asset?;
    int position?;
};

public type ProductDiscountChangeIsActiveAction record {
    *ProductDiscountUpdateAction;
    string action?;
    boolean isActive?;
};

public type CustomerRemoveShippingAddressIdAction record {
    *CustomerUpdateAction;
    string action?;
    string addressId?;
    string addressKey?;
};

public type ProductRevertStagedVariantChangesAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
};

public type TypeTextInputHint string;

public type CartDiscountResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type StoreDeletedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
};

public type ProductPublishedMessagePayload record {
    *MessagePayload;
    string 'type?;
    string[] removedImageUrls?;
    ProductProjection productProjection?;
    ProductPublishScope scope?;
};

public type UpdateAction record {
    string action?;
};

public type OrderExcerpt record {
    TypedMoney totalPrice?;
    TaxedPrice taxedPrice?;
    int 'version?;
};

public type ProductSetProductPriceCustomTypeAction record {
    *ProductUpdateAction;
    string action?;
    string priceId?;
    boolean staged?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type OrderReturnInfoSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    ReturnInfo[] returnInfo?;
};

public type SearchKeywords record {
};

public type ProductSlugChangedMessagePayload record {
    *MessagePayload;
    string 'type?;
    LocalizedString slug?;
    LocalizedString oldSlug?;
};

public type EnumKeyAlreadyExistsError record {
    *ErrorObject;
    string code?;
    string message?;
    string conflictingEnumKey?;
    string conflictingAttributeName?;
};

public type OrderStoreSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    StoreKeyReference store?;
};

public type ExtensionAWSLambdaDestination record {
    *ExtensionDestination;
    string 'type?;
    string arn?;
    string accessKey?;
    string accessSecret?;
};

public type CartDiscountTarget record {
    string 'type?;
};

public type CartRemoveLineItemAction record {
    *CartUpdateAction;
    string action?;
    string lineItemId?;
    int quantity?;
    Money externalPrice?;
    ExternalLineItemTotalPrice externalTotalPrice?;
    ItemShippingDetailsDraft shippingDetailsToRemove?;
};

public type CartSetCustomLineItemCustomFieldAction record {
    *CartUpdateAction;
    string action?;
    string customLineItemId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type MyShoppingListRemoveLineItemAction record {
    *MyShoppingListUpdateAction;
    string action?;
    string lineItemId?;
    int quantity?;
};

public type EventBridgeDestination record {
    *Destination;
    string 'type?;
    string region?;
    string accountId?;
};

public type MyShoppingListSetTextLineItemDescriptionAction record {
    *MyShoppingListUpdateAction;
    string action?;
    string textLineItemId?;
    LocalizedString description?;
};

public type StagedOrderSetLineItemCustomFieldAction record {
    *StagedOrderUpdateAction;
    string action?;
    string lineItemId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type OrderEditApplied record {
    *OrderEditResult;
    string 'type?;
    string appliedAt?;
    OrderExcerpt excerptBeforeEdit?;
    OrderExcerpt excerptAfterEdit?;
};

public type CategorySetKeyAction record {
    *CategoryUpdateAction;
    string action?;
    string 'key?;
};

public type PaymentPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    Payment[] results?;
};

public type CartDiscountChangeNameAction record {
    *CartDiscountUpdateAction;
    string action?;
    LocalizedString name?;
};

public type StateSetDescriptionAction record {
    *StateUpdateAction;
    string action?;
    LocalizedString description?;
};

public type ExtensionBadResponseError record {
    *ErrorObject;
    string code?;
    string message?;
    LocalizedString localizedMessage?;
    record {} extensionExtraInfo?;
    ErrorByExtension errorByExtension?;
};

public type OrderSetStoreAction record {
    *OrderUpdateAction;
    string action?;
    StoreResourceIdentifier store?;
};

public type AttributeDefinitionDraft record {
    AttributeType 'type?;
    string name?;
    LocalizedString label?;
    boolean isRequired?;
    AttributeConstraintEnum attributeConstraint?;
    LocalizedString inputTip?;
    TextInputHint inputHint?;
    boolean isSearchable?;
};

public type TaxPortionDraft record {
    string name?;
    float rate?;
    Money amount?;
};

public type StagedOrderSetParcelCustomFieldAction record {
    *StagedOrderUpdateAction;
    string action?;
    string parcelId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type SearchKeyword record {
    string text?;
    SuggestTokenizer suggestTokenizer?;
};

public type ExtensionAzureFunctionsAuthentication record {
    *ExtensionHttpDestinationAuthentication;
    string 'type?;
    string 'key?;
};

public type StoreSetCustomTypeAction record {
    *StoreUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    record {} fields?;
};

public type DiscountCodeSetNameAction record {
    *DiscountCodeUpdateAction;
    string action?;
    LocalizedString name?;
};

public type ProductUpdateAction record {
    string action?;
};

public type FacetTypes string;

public type AttributeType record {
    string name?;
};

public type HighPrecisionMoneyDraft record {
    *TypedMoneyDraft;
    int centAmount?;
    CurrencyCode currencyCode?;
    MoneyType 'type?;
    int fractionDigits?;
    int preciseAmount?;
};

public type DeliveryAddressSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string deliveryId?;
    Address address?;
    Address oldAddress?;
};

public type OrderCreatedMessagePayload record {
    *MessagePayload;
    string 'type?;
    Order 'order?;
};

public type OrderDeletedMessagePayload record {
    *MessagePayload;
    string 'type?;
    Order 'order?;
};

public type ProductSetSkuAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    boolean staged?;
};

public type DiscountCodeResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type ProductTypeChangeAttributeOrderByNameAction record {
    *ProductTypeUpdateAction;
    string action?;
    string[] attributeNames?;
};

public type SqsDestination record {
    *Destination;
    string 'type?;
    string accessKey?;
    string accessSecret?;
    string queueUrl?;
    string region?;
};

public type ProductSelectionCreatedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    ProductSelectionType productSelection?;
};

public type CustomFieldBooleanType record {
    *FieldType;
    string name?;
};

public type ProductRevertedStagedChangesMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string[] removedImageUrls?;
};

public type ShoppingListSetDeleteDaysAfterLastModificationAction record {
    *ShoppingListUpdateAction;
    string action?;
    int deleteDaysAfterLastModification?;
};

public type RequiredFieldError record {
    *ErrorObject;
    string code?;
    string message?;
    string 'field?;
};

public type ShippingMethodUpdate record {
    int 'version?;
    ShippingMethodUpdateAction[] actions?;
};

public type StackingMode string;

public type StagedOrderSetReturnItemCustomFieldAction record {
    *StagedOrderUpdateAction;
    string action?;
    string returnItemId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type ScopedPrice record {
    string id?;
    TypedMoney value?;
    TypedMoney currentValue?;
    CountryCode country?;
    CustomerGroupReference customerGroup?;
    ChannelReference 'channel?;
    string validFrom?;
    string validUntil?;
    DiscountedPrice discounted?;
    CustomFields custom?;
};

public type ProductVariantChannelAvailabilityMap record {
};

public type CartSetLineItemPriceAction record {
    *CartUpdateAction;
    string action?;
    string lineItemId?;
    Money externalPrice?;
};

public type ProductVariantDeletedMessagePayload record {
    *MessagePayload;
    string 'type?;
    ProductVariant variant?;
    string[] removedImageUrls?;
};

public type ShoppingListRemoveLineItemAction record {
    *ShoppingListUpdateAction;
    string action?;
    string lineItemId?;
    int quantity?;
};

public type CartDiscountValueAbsoluteDraft record {
    *CartDiscountValueDraft;
    string 'type?;
    Money[] money?;
};

public type CustomerDateOfBirthSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string dateOfBirth?;
};

public type CustomObjectPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    CustomObject[] results?;
};

public type MyCustomerAddShippingAddressIdAction record {
    *MyCustomerUpdateAction;
    string action?;
    string addressId?;
    string addressKey?;
};

public type OrderFromCartDraft record {
    string id?;
    CartResourceIdentifier cart?;
    int 'version?;
    string orderNumber?;
    PaymentState paymentState?;
    ShipmentState shipmentState?;
    OrderState orderState?;
    StateResourceIdentifier state?;
};

public type ProductSetDiscountedPriceAction record {
    *ProductUpdateAction;
    string action?;
    string priceId?;
    boolean staged?;
    DiscountedPriceDraft discounted?;
};

public type ProductVariantImportDraft record {
    int id?;
    string sku?;
    PriceDraft[] prices?;
    Attribute[] attributes?;
    Image[] images?;
};

public type ShippingMethodSetKeyAction record {
    *ShippingMethodUpdateAction;
    string action?;
    string 'key?;
};

public type SearchIndexingInProgressError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type CustomerCreatePasswordResetToken record {
    string email?;
    int ttlMinutes?;
};

public type OrderRemoveItemShippingAddressAction record {
    *OrderUpdateAction;
    string action?;
    string addressKey?;
};

public type ObjectNotFoundError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type ChangeSubscription record {
    string resourceTypeId?;
};

public type ProjectChangeCountriesAction record {
    *ProjectUpdateAction;
    string action?;
    CountryCode[] countries?;
};

public type MyPaymentSetMethodInfoNameAction record {
    *MyPaymentUpdateAction;
    string action?;
    LocalizedString name?;
};

public type ShoppingListSetTextLineItemCustomFieldAction record {
    *ShoppingListUpdateAction;
    string action?;
    string textLineItemId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type AttributeNestedType record {
    *AttributeType;
    string name?;
    ProductTypeReference typeReference?;
};

public type StateChangeInitialAction record {
    *StateUpdateAction;
    string action?;
    boolean initial?;
};

public type CustomerFirstNameSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string firstName?;
};

public type StagedOrderSetBillingAddressCustomTypeAction record {
    *StagedOrderUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type CustomerSetCustomTypeAction record {
    *CustomerUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type ZoneUpdateAction record {
    string action?;
};

public type OrderLineItemRemovedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string lineItemId?;
    int removedQuantity?;
    int newQuantity?;
    ItemState[] newState?;
    TypedMoney newTotalPrice?;
    TaxedItemPrice newTaxedPrice?;
    Price newPrice?;
    ItemShippingDetails newShippingDetail?;
};

public type TypeResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type DiscountCodeDraft record {
    LocalizedString name?;
    LocalizedString description?;
    string code?;
    CartDiscountResourceIdentifier[] cartDiscounts?;
    string cartPredicate?;
    boolean isActive?;
    int maxApplications?;
    int maxApplicationsPerCustomer?;
    CustomFieldsDraft custom?;
    string[] groups?;
    string validFrom?;
    string validUntil?;
};

public type StagedOrderSetCustomTypeAction record {
    *StagedOrderUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type StagedOrderSetCustomLineItemShippingDetailsAction record {
    *StagedOrderUpdateAction;
    string action?;
    string customLineItemId?;
    ItemShippingDetailsDraft shippingDetails?;
};

public type ExtensionDraft record {
    string 'key?;
    ExtensionDestination destination?;
    ExtensionTrigger[] triggers?;
    int timeoutInMs?;
};

public type AssetDimensions record {
    int w?;
    int h?;
};

public type ProductSetAssetSourcesAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    boolean staged?;
    string assetId?;
    string assetKey?;
    AssetSource[] sources?;
};

public type ReviewSetAuthorNameAction record {
    *ReviewUpdateAction;
    string action?;
    string authorName?;
};

public type DeliveryRemovedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    Delivery delivery?;
};

public type OrderSearchStatus string;

public type ChannelReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    Channel obj?;
};

public type DeliveryItemsUpdatedMessagePayload record {
    *MessagePayload;
    string 'type?;
    string deliveryId?;
    DeliveryItem[] items?;
    DeliveryItem[] oldItems?;
};

public type ProductVariant record {
    int id?;
    string sku?;
    string 'key?;
    Price[] prices?;
    Attribute[] attributes?;
    Price price?;
    Image[] images?;
    Asset[] assets?;
    ProductVariantAvailability availability?;
    boolean isMatchingVariant?;
    ScopedPrice scopedPrice?;
    boolean scopedPriceDiscounted?;
};

public type ProductSetTaxCategoryAction record {
    *ProductUpdateAction;
    string action?;
    TaxCategoryResourceIdentifier taxCategory?;
};

public type ItemShippingTarget record {
    string addressKey?;
    float quantity?;
};

public type AssetSource record {
    string uri?;
    string 'key?;
    AssetDimensions dimensions?;
    string contentType?;
};

public type MyCartAddPaymentAction record {
    *MyCartUpdateAction;
    string action?;
    PaymentResourceIdentifier payment?;
};

public type LineItemImportDraft record {
    string productId?;
    LocalizedString name?;
    ProductVariantImportDraft variant?;
    PriceDraft price?;
    int quantity?;
    ItemState[] state?;
    ChannelResourceIdentifier supplyChannel?;
    ChannelResourceIdentifier distributionChannel?;
    TaxRate taxRate?;
    CustomFieldsDraft custom?;
    ItemShippingDetailsDraft shippingDetails?;
};

public type OrderEditSetCustomFieldAction record {
    *OrderEditUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type StagedOrderSetDeliveryAddressAction record {
    *StagedOrderUpdateAction;
    string action?;
    string deliveryId?;
    BaseAddress address?;
};

public type MyCustomerSetCompanyNameAction record {
    *MyCustomerUpdateAction;
    string action?;
    string companyName?;
};

public type ProductRemoveVariantAction record {
    *ProductUpdateAction;
    string action?;
    int id?;
    string sku?;
    boolean staged?;
};

public type ProductReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    Product obj?;
};

public type ItemShippingDetailsDraft record {
    ItemShippingTarget[] targets?;
};

public type CartRemoveDiscountCodeAction record {
    *CartUpdateAction;
    string action?;
    DiscountCodeReference discountCode?;
};

public type ProductTypeChangeLabelAction record {
    *ProductTypeUpdateAction;
    string action?;
    string attributeName?;
    LocalizedString label?;
};

public type OrderPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    Order[] results?;
};

public type ProductSetAssetCustomFieldAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    boolean staged?;
    string assetId?;
    string assetKey?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type OrderSetCustomLineItemCustomTypeAction record {
    *OrderUpdateAction;
    string action?;
    string customLineItemId?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type ProductDeletedMessagePayload record {
    *MessagePayload;
    string 'type?;
    string[] removedImageUrls?;
    ProductProjection currentProjection?;
};

public type Extension record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string 'key?;
    ExtensionDestination destination?;
    ExtensionTrigger[] triggers?;
    int timeoutInMs?;
};

public type OrderEditDraft record {
    string 'key?;
    OrderReference 'resource?;
    StagedOrderUpdateAction[] stagedActions?;
    CustomFieldsDraft custom?;
    string comment?;
    boolean dryRun?;
};

public type ProductAddExternalImageAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    Image image?;
    boolean staged?;
};

public type CustomerSignInResult record {
    Customer customer?;
    Cart cart?;
};

public type ShoppingListSetCustomTypeAction record {
    *ShoppingListUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type TaxCategoryReplaceTaxRateAction record {
    *TaxCategoryUpdateAction;
    string action?;
    string taxRateId?;
    TaxRateDraft taxRate?;
};

public type CustomerSetCustomFieldAction record {
    *CustomerUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type ProductSetAttributeInAllVariantsAction record {
    *ProductUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
    boolean staged?;
};

public type CustomerAddShippingAddressIdAction record {
    *CustomerUpdateAction;
    string action?;
    string addressId?;
    string addressKey?;
};

public type OrderStateTransitionMessagePayload record {
    *MessagePayload;
    string 'type?;
    StateReference state?;
    StateReference oldState?;
    boolean force?;
};

public type ChannelResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type CategoryChangeNameAction record {
    *CategoryUpdateAction;
    string action?;
    LocalizedString name?;
};

public type MyPaymentAddTransactionAction record {
    *MyPaymentUpdateAction;
    string action?;
    TransactionDraft 'transaction?;
};

public type StagedOrderSetCustomLineItemCustomTypeAction record {
    *StagedOrderUpdateAction;
    string action?;
    string customLineItemId?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type DiscountCodeInfo record {
    DiscountCodeReference discountCode?;
    DiscountCodeState state?;
};

public type GeneralError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type MyCustomerSetFirstNameAction record {
    *MyCustomerUpdateAction;
    string action?;
    string firstName?;
};

public type OrderEditPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    OrderEdit[] results?;
};

public type Location record {
    CountryCode country?;
    string state?;
};

public type StoreKeyReference record {
    *KeyReference;
    ReferenceTypeId typeId?;
    string 'key?;
};

public type OrderImportedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    Order 'order?;
};

public type OrderDiscountCodeStateSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    DiscountCodeReference discountCode?;
    DiscountCodeState state?;
    DiscountCodeState oldState?;
};

public type IndividualProductSelectionType record {
    *ProductSelectionType;
    ProductSelectionTypeEnum 'type?;
    LocalizedString name?;
};

public type ProductCatalogData record {
    boolean published?;
    ProductData current?;
    ProductData staged?;
    boolean hasStagedChanges?;
};

public type DeliveryPlatformFormat record {
    *DeliveryFormat;
    string 'type?;
};

public type CustomerCreateEmailToken record {
    string id?;
    int 'version?;
    int ttlMinutes?;
};

public type CustomerSignin record {
    string email?;
    string password?;
    string anonymousCartId?;
    CartResourceIdentifier anonymousCart?;
    AnonymousCartSignInMode anonymousCartSignInMode?;
    string anonymousId?;
    boolean updateProductData?;
};

public type CartClassificationTier record {
    *ShippingRatePriceTier;
    ShippingRateTierType 'type?;
    string value?;
    Money price?;
    boolean isMatching?;
};

public type ExtensionHttpDestination record {
    *ExtensionDestination;
    string 'type?;
    string url?;
    ExtensionHttpDestinationAuthentication authentication?;
};

public type OrderAddParcelToDeliveryAction record {
    *OrderUpdateAction;
    string action?;
    string deliveryId?;
    ParcelMeasurements measurements?;
    TrackingData trackingData?;
    DeliveryItem[] items?;
};

public type PaymentSetExternalIdAction record {
    *PaymentUpdateAction;
    string action?;
    string externalId?;
};

public type CartDiscountValueDraft record {
    string 'type?;
};

public type ResourceDeletedDelivery record {
    *SubscriptionDelivery;
    string projectKey?;
    string notificationType?;
    Reference 'resource?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    int 'version?;
    string modifiedAt?;
    boolean dataErasure?;
};

public type MyCartSetCustomerEmailAction record {
    *MyCartUpdateAction;
    string action?;
    string email?;
};

public type TransactionDraft record {
    string timestamp?;
    TransactionType 'type?;
    Money amount?;
    string interactionId?;
    TransactionState state?;
    CustomFieldsDraft custom?;
};

public type TextInputHint string;

public type CategorySetAssetSourcesAction record {
    *CategoryUpdateAction;
    string action?;
    string assetId?;
    string assetKey?;
    AssetSource[] sources?;
};

public type ProductTypeAddAttributeDefinitionAction record {
    *ProductTypeUpdateAction;
    string action?;
    AttributeDefinitionDraft attribute?;
};

public type CartDiscountChangeCartPredicateAction record {
    *CartDiscountUpdateAction;
    string action?;
    string cartPredicate?;
};

public type CustomObject record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string container?;
    string 'key?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type PaymentUpdateAction record {
    string action?;
};

public type ShippingMethodRemoveZoneAction record {
    *ShippingMethodUpdateAction;
    string action?;
    ZoneResourceIdentifier zone?;
};

public type StagedOrderSetDeliveryItemsAction record {
    *StagedOrderUpdateAction;
    string action?;
    string deliveryId?;
    DeliveryItem[] items?;
};

public type OrderSetParcelMeasurementsAction record {
    *OrderUpdateAction;
    string action?;
    string parcelId?;
    ParcelMeasurements measurements?;
};

public type MyShoppingListSetTextLineItemCustomFieldAction record {
    *MyShoppingListUpdateAction;
    string action?;
    string textLineItemId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type ProductResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type ProductSelectionCreatedMessagePayload record {
    *MessagePayload;
    string 'type?;
    ProductSelectionType productSelection?;
};

public type InventoryEntryDeletedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string sku?;
    ChannelReference supplyChannel?;
};

public type StagedOrderChangeCustomLineItemQuantityAction record {
    *StagedOrderUpdateAction;
    string action?;
    string customLineItemId?;
    float quantity?;
};

public type DeliveryItem record {
    string id?;
    int quantity?;
};

public type MyCartSetLineItemCustomTypeAction record {
    *MyCartUpdateAction;
    string action?;
    string lineItemId?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type MyShoppingListChangeTextLineItemQuantityAction record {
    *MyShoppingListUpdateAction;
    string action?;
    string textLineItemId?;
    int quantity?;
};

public type ReviewUpdate record {
    int 'version?;
    ReviewUpdateAction[] actions?;
};

public type CustomerGroupResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type TaxCategoryDraft record {
    string name?;
    string description?;
    TaxRateDraft[] rates?;
    string 'key?;
};

public type OrderDeletedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    Order 'order?;
};

public type ProductMoveImageToPositionAction record {
    *ProductUpdateAction;
    string action?;
    int variantId?;
    string sku?;
    string imageUrl?;
    int position?;
    boolean staged?;
};

public type OrderShippingRateInputSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    ShippingRateInput shippingRateInput?;
    ShippingRateInput oldShippingRateInput?;
};

public type StoreChangeProductSelectionAction record {
    *StoreUpdateAction;
    string action?;
    ResourceIdentifier productSelection?;
    boolean active?;
};

public type ChannelSetAddressCustomFieldAction record {
    *ChannelUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type MyCartAddLineItemAction record {
    *MyCartUpdateAction;
    string action?;
    CustomFieldsDraft custom?;
    ChannelResourceIdentifier distributionChannel?;
    ExternalTaxRateDraft externalTaxRate?;
    string productId?;
    int variantId?;
    string sku?;
    int quantity?;
    ChannelResourceIdentifier supplyChannel?;
    Money externalPrice?;
    ExternalLineItemTotalPrice externalTotalPrice?;
    ItemShippingDetailsDraft shippingDetails?;
    string addedAt?;
};

public type PaymentChangeTransactionInteractionIdAction record {
    *PaymentUpdateAction;
    string action?;
    string transactionId?;
    string interactionId?;
};

public type PaymentTransactionAddedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    Transaction 'transaction?;
};

public type ShoppingListSetTextLineItemCustomTypeAction record {
    *ShoppingListUpdateAction;
    string action?;
    string textLineItemId?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type StoreResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type ExtensionDestination record {
    string 'type?;
};

public type StagedOrderSetOrderNumberAction record {
    *StagedOrderUpdateAction;
    string action?;
    string orderNumber?;
};

public type OrderSetLineItemCustomFieldAction record {
    *OrderUpdateAction;
    string action?;
    string lineItemId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type ProjectUpdate record {
    int 'version?;
    ProjectUpdateAction[] actions?;
};

public type InventoryEntryReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    InventoryEntry obj?;
};

public type StagedOrderImportLineItemStateAction record {
    *StagedOrderUpdateAction;
    string action?;
    string lineItemId?;
    ItemState[] state?;
};

public type StagedOrder record {
    *Order;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string completedAt?;
    string orderNumber?;
    string customerId?;
    string customerEmail?;
    string anonymousId?;
    StoreKeyReference store?;
    LineItem[] lineItems?;
    CustomLineItem[] customLineItems?;
    TypedMoney totalPrice?;
    TaxedPrice taxedPrice?;
    Address shippingAddress?;
    Address billingAddress?;
    TaxMode taxMode?;
    RoundingMode taxRoundingMode?;
    CustomerGroupReference customerGroup?;
    string country?;
    OrderState orderState?;
    StateReference state?;
    ShipmentState shipmentState?;
    PaymentState paymentState?;
    ShippingInfo shippingInfo?;
    SyncInfo[] syncInfo?;
    ReturnInfo[] returnInfo?;
    DiscountCodeInfo[] discountCodes?;
    int lastMessageSequenceNumber?;
    CartReference cart?;
    CustomFields custom?;
    PaymentInfo paymentInfo?;
    string locale?;
    InventoryMode inventoryMode?;
    CartOrigin origin?;
    TaxCalculationMode taxCalculationMode?;
    ShippingRateInput shippingRateInput?;
    Address[] itemShippingAddresses?;
    CartDiscountReference[] refusedGifts?;
};

public type PaymentSetStatusInterfaceTextAction record {
    *PaymentUpdateAction;
    string action?;
    string interfaceText?;
};

public type CustomerCompanyNameSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    string companyName?;
};

public type AzureServiceBusDestination record {
    *Destination;
    string 'type?;
    string connectionString?;
};

public type OrderEditApply record {
    int editVersion?;
    int resourceVersion?;
};

public type ChannelChangeNameAction record {
    *ChannelUpdateAction;
    string action?;
    LocalizedString name?;
};

public type CartDiscountValueGiftLineItem record {
    *CartDiscountValue;
    string 'type?;
    ProductReference product?;
    int variantId?;
    ChannelReference supplyChannel?;
    ChannelReference distributionChannel?;
};

public type InventoryPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    InventoryEntry[] results?;
};

public type ReturnShipmentState string;

public type CartSetLineItemTotalPriceAction record {
    *CartUpdateAction;
    string action?;
    string lineItemId?;
    ExternalLineItemTotalPrice externalTotalPrice?;
};

public type Cart record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    string 'key?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string customerId?;
    string customerEmail?;
    string anonymousId?;
    StoreKeyReference store?;
    LineItem[] lineItems?;
    CustomLineItem[] customLineItems?;
    TypedMoney totalPrice?;
    TaxedPrice taxedPrice?;
    CartState cartState?;
    Address shippingAddress?;
    Address billingAddress?;
    InventoryMode inventoryMode?;
    TaxMode taxMode?;
    RoundingMode taxRoundingMode?;
    TaxCalculationMode taxCalculationMode?;
    CustomerGroupReference customerGroup?;
    CountryCode country?;
    ShippingInfo shippingInfo?;
    DiscountCodeInfo[] discountCodes?;
    CustomFields custom?;
    PaymentInfo paymentInfo?;
    string locale?;
    int deleteDaysAfterLastModification?;
    CartDiscountReference[] refusedGifts?;
    CartOrigin origin?;
    ShippingRateInput shippingRateInput?;
    Address[] itemShippingAddresses?;
};

public type MyShoppingListRemoveTextLineItemAction record {
    *MyShoppingListUpdateAction;
    string action?;
    string textLineItemId?;
    int quantity?;
};

public type InventoryEntryUpdateAction record {
    string action?;
};

public type MyCartRemoveLineItemAction record {
    *MyCartUpdateAction;
    string action?;
    string lineItemId?;
    int quantity?;
    Money externalPrice?;
    ExternalLineItemTotalPrice externalTotalPrice?;
    ItemShippingDetailsDraft shippingDetailsToRemove?;
};

public type InventoryEntrySetSupplyChannelAction record {
    *InventoryEntryUpdateAction;
    string action?;
    ChannelResourceIdentifier supplyChannel?;
};

public type Reference record {
    ReferenceTypeId typeId?;
    string id?;
};

public type EnumValuesMustMatchError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type MyLineItemDraft record {
    string productId?;
    int variantId?;
    int quantity?;
    string addedAt?;
    ChannelResourceIdentifier supplyChannel?;
    ChannelResourceIdentifier distributionChannel?;
    CustomFieldsDraft custom?;
    ItemShippingDetailsDraft shippingDetails?;
    string sku?;
};

public type OrderSetBillingAddressAction record {
    *OrderUpdateAction;
    string action?;
    BaseAddress address?;
};

public type PaymentSetCustomerAction record {
    *PaymentUpdateAction;
    string action?;
    CustomerResourceIdentifier customer?;
};

public type PaymentTransactionAddedMessagePayload record {
    *MessagePayload;
    string 'type?;
    Transaction 'transaction?;
};

public type ShoppingListSetKeyAction record {
    *ShoppingListUpdateAction;
    string action?;
    string 'key?;
};

public type ProductDiscountUpdateAction record {
    string action?;
};

public type ResourceSizeLimitExceededError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type PaymentInteractionAddedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    CustomFields interaction?;
};

public type ProductDiscountResourceIdentifier record {
    *ResourceIdentifier;
    ReferenceTypeId typeId?;
    string id?;
    string 'key?;
};

public type OrderSetCustomLineItemCustomFieldAction record {
    *OrderUpdateAction;
    string action?;
    string customLineItemId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type PaymentSetCustomFieldAction record {
    *PaymentUpdateAction;
    string action?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type CustomerSetAddressCustomFieldAction record {
    *CustomerUpdateAction;
    string action?;
    string addressId?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type MyCartSetLineItemSupplyChannelAction record {
    *MyCartUpdateAction;
    string action?;
    string lineItemId?;
    ChannelResourceIdentifier supplyChannel?;
};

public type CartSetBillingAddressCustomTypeAction record {
    *CartUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type ZoneReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    Zone obj?;
};

public type CartOrigin string;

public type ProductStateTransitionMessagePayload record {
    *MessagePayload;
    string 'type?;
    StateReference state?;
    boolean force?;
};

public type CustomFieldDateType record {
    *FieldType;
    string name?;
};

public type ProductPriceExternalDiscountSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    int variantId?;
    string variantKey?;
    string sku?;
    string priceId?;
    DiscountedPrice discounted?;
    boolean staged?;
};

public type ShippingMethodChangeIsDefaultAction record {
    *ShippingMethodUpdateAction;
    string action?;
    boolean isDefault?;
};

public type StateSetTransitionsAction record {
    *StateUpdateAction;
    string action?;
    StateResourceIdentifier[] transitions?;
};

public type OrderImportedMessagePayload record {
    *MessagePayload;
    string 'type?;
    Order 'order?;
};

public type CartSetDeleteDaysAfterLastModificationAction record {
    *CartUpdateAction;
    string action?;
    int deleteDaysAfterLastModification?;
};

public type StagedOrderSetItemShippingAddressCustomFieldAction record {
    *StagedOrderUpdateAction;
    string action?;
    string addressKey?;
    string name?;
    string|record {}|string[]|decimal|int|boolean value?;
};

public type MyCustomerUpdateAction record {
    string action?;
};

public type MyCartSetLineItemShippingDetailsAction record {
    *MyCartUpdateAction;
    string action?;
    string lineItemId?;
    ItemShippingDetailsDraft shippingDetails?;
};

public type SuggestTokenizer record {
    string 'type?;
};

public type CartApplyDeltaToCustomLineItemShippingDetailsTargetsAction record {
    *CartUpdateAction;
    string action?;
    string customLineItemId?;
    ItemShippingTarget[] targetsDelta?;
};

public type CustomerGroup record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string 'key?;
    string name?;
    CustomFields custom?;
};

public type OrderDiscountCodeRemovedMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    DiscountCodeReference discountCode?;
};

public type HighPrecisionMoney record {
    *TypedMoney;
    MoneyType 'type?;
    int fractionDigits?;
    int centAmount?;
    CurrencyCode currencyCode?;
    int preciseAmount?;
};

public type OrderEditPreviewSuccess record {
    *OrderEditResult;
    string 'type?;
    StagedOrder preview?;
    MessagePayload[] messagePayloads?;
};

public type DiscountCodeUpdate record {
    int 'version?;
    DiscountCodeUpdateAction[] actions?;
};

public type DiscountCodeChangeCartDiscountsAction record {
    *DiscountCodeUpdateAction;
    string action?;
    CartDiscountResourceIdentifier[] cartDiscounts?;
};

public type OrderEditPreviewFailure record {
    *OrderEditResult;
    string 'type?;
    ErrorObject[] errors?;
};

public type MyCustomerSetMiddleNameAction record {
    *MyCustomerUpdateAction;
    string action?;
    string middleName?;
};

public type ImageDimensions record {
    int w?;
    int h?;
};

public type CategoryPagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    Category[] results?;
};

public type CustomerAddressRemovedMessagePayload record {
    *MessagePayload;
    string 'type?;
    Address address?;
};

public type MyShoppingListAddTextLineItemAction record {
    *MyShoppingListUpdateAction;
    string action?;
    LocalizedString name?;
    LocalizedString description?;
    int quantity?;
    string addedAt?;
    CustomFieldsDraft custom?;
};

public type ParcelMeasurements record {
    float heightInMillimeter?;
    float lengthInMillimeter?;
    float widthInMillimeter?;
    float weightInGram?;
};

public type PagedQueryResponse record {
    int 'limit?;
    int count?;
    int total?;
    int offset?;
    BaseResource[] results?;
    record {} meta?;
};

public type Category record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    LocalizedString name?;
    LocalizedString slug?;
    LocalizedString description?;
    CategoryReference[] ancestors?;
    CategoryReference parent?;
    string orderHint?;
    string externalId?;
    LocalizedString metaTitle?;
    LocalizedString metaDescription?;
    LocalizedString metaKeywords?;
    CustomFields custom?;
    Asset[] assets?;
    string 'key?;
};

public type MyCustomerAddBillingAddressIdAction record {
    *MyCustomerUpdateAction;
    string action?;
    string addressId?;
    string addressKey?;
};

public type OrderEditReference record {
    *Reference;
    ReferenceTypeId typeId?;
    string id?;
    OrderEdit obj?;
};

public type ShoppingListUpdate record {
    int 'version?;
    ShoppingListUpdateAction[] actions?;
};

public type ReplicaCartDraft record {
    string|record {}|string[]|decimal|int|boolean reference?;
    string 'key?;
};

public type ProductDiscountValueExternal record {
    *ProductDiscountValue;
    string 'type?;
};

public type OrderSetLocaleAction record {
    *OrderUpdateAction;
    string action?;
    string locale?;
};

public type ProductSelectionProductAddedMessagePayload record {
    *MessagePayload;
    string 'type?;
    ProductReference product?;
};

public type CustomerChangeAddressAction record {
    *CustomerUpdateAction;
    string action?;
    string addressId?;
    string addressKey?;
    BaseAddress address?;
};

public type MissingTaxRateForCountryError record {
    *ErrorObject;
    string code?;
    string message?;
    string taxCategoryId?;
    string country?;
    string state?;
};

public type LocalizedString record {
};

public type ProductTypeChangeAttributeConstraintAction record {
    *ProductTypeUpdateAction;
    string action?;
    string attributeName?;
    AttributeConstraintEnumDraft newValue?;
};

public type ZoneUpdate record {
    int 'version?;
    ZoneUpdateAction[] actions?;
};

public type ProductTypeChangeAttributeNameAction record {
    *ProductTypeUpdateAction;
    string action?;
    string attributeName?;
    string newAttributeName?;
};

public type ShoppingListSetLineItemCustomTypeAction record {
    *ShoppingListUpdateAction;
    string action?;
    string lineItemId?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type CustomFieldStringType record {
    *FieldType;
    string name?;
};

public type MyCartDraft record {
    CurrencyCode currency?;
    string customerEmail?;
    string country?;
    InventoryMode inventoryMode?;
    MyLineItemDraft[] lineItems?;
    BaseAddress shippingAddress?;
    BaseAddress billingAddress?;
    ShippingMethodResourceIdentifier shippingMethod?;
    CustomFieldsDraft custom?;
    string locale?;
    TaxMode taxMode?;
    int deleteDaysAfterLastModification?;
    BaseAddress[] itemShippingAddresses?;
    StoreKeyReference store?;
    DiscountCodeInfo[] discountCodes?;
};

public type CategoryChangeAssetOrderAction record {
    *CategoryUpdateAction;
    string action?;
    string[] assetOrder?;
};

public type OrderCustomerEmailSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string email?;
    string oldEmail?;
};

public type OrderCustomLineItemDiscountSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string customLineItemId?;
    DiscountedLineItemPriceForQuantity[] discountedPricePerQuantity?;
    TaxedItemPrice taxedPrice?;
};

public type ReviewRatingSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    float oldRating?;
    float newRating?;
    boolean includedInStatistics?;
    Reference target?;
};

public type TaxCategoryChangeNameAction record {
    *TaxCategoryUpdateAction;
    string action?;
    string name?;
};

public type TypeSetDescriptionAction record {
    *TypeUpdateAction;
    string action?;
    LocalizedString description?;
};

public type CustomerSetCustomerNumberAction record {
    *CustomerUpdateAction;
    string action?;
    string customerNumber?;
};

public type MyPaymentUpdateAction record {
    string action?;
};

public type StagedOrderUpdateAction record {
    string action?;
};

public type OrderTransitionLineItemStateAction record {
    *OrderUpdateAction;
    string action?;
    string lineItemId?;
    int quantity?;
    StateResourceIdentifier fromState?;
    StateResourceIdentifier toState?;
    string actualTransitionDate?;
};

public type MyCustomerAddAddressAction record {
    *MyCustomerUpdateAction;
    string action?;
    BaseAddress address?;
};

public type CustomerCompanyNameSetMessage record {
    *Message;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    int sequenceNumber?;
    Reference 'resource?;
    int resourceVersion?;
    string 'type?;
    UserProvidedIdentifiers resourceUserProvidedIdentifiers?;
    string companyName?;
};

public type CustomerSetTitleAction record {
    *CustomerUpdateAction;
    string action?;
    string title?;
};

public type PendingOperationError record {
    *ErrorObject;
    string code?;
    string message?;
};

public type MessagePayload record {
    string 'type?;
};

public type ProjectChangeCountryTaxRateFallbackEnabledAction record {
    *ProjectUpdateAction;
    string action?;
    boolean countryTaxRateFallbackEnabled?;
};

public type URLEncodedPayload record {
};

public type MyShoppingListUpdate record {
    int 'version?;
    MyShoppingListUpdateAction[] actions?;
};

public type PriceDraft record {
    Money value?;
    CountryCode country?;
    CustomerGroupResourceIdentifier customerGroup?;
    ChannelResourceIdentifier 'channel?;
    string validFrom?;
    string validUntil?;
    CustomFieldsDraft custom?;
    PriceTierDraft[] tiers?;
    DiscountedPriceDraft discounted?;
};

public type ExtensionNoResponseError record {
    *ErrorObject;
    string code?;
    string message?;
    string extensionId?;
    string extensionKey?;
};

public type Zone record {
    *BaseResource;
    string id?;
    int 'version?;
    string createdAt?;
    string lastModifiedAt?;
    LastModifiedBy lastModifiedBy?;
    CreatedBy createdBy?;
    string 'key?;
    string name?;
    string description?;
    Location[] locations?;
};

public type ReviewSetTargetAction record {
    *ReviewUpdateAction;
    string action?;
    string|record {}|string[]|decimal|int|boolean target?;
};

public type BaseAddress record {
    string id?;
    string 'key?;
    string title?;
    string salutation?;
    string firstName?;
    string lastName?;
    string streetName?;
    string streetNumber?;
    string additionalStreetInfo?;
    string postalCode?;
    string city?;
    string region?;
    string state?;
    CountryCode country?;
    string company?;
    string department?;
    string building?;
    string apartment?;
    string pOBox?;
    string phone?;
    string mobile?;
    string email?;
    string fax?;
    string additionalAddressInfo?;
    string externalId?;
};

public type InvalidFieldError record {
    *ErrorObject;
    string code?;
    string message?;
    string 'field?;
    string|record {}|string[]|decimal|int|boolean invalidValue?;
    (string|record {}|string[]|decimal|int|boolean)[] allowedValues?;
};

public type ErrorByExtension record {
    string id?;
    string 'key?;
};

public type ExtensionUpdateAction record {
    string action?;
};

public type DiscountCodeSetCustomTypeAction record {
    *DiscountCodeUpdateAction;
    string action?;
    TypeResourceIdentifier 'type?;
    FieldContainer fields?;
};

public type ShippingMethodAddShippingRateAction record {
    *ShippingMethodUpdateAction;
    string action?;
    ZoneResourceIdentifier zone?;
    ShippingRateDraft shippingRate?;
};

public type ReviewSetRatingAction record {
    *ReviewUpdateAction;
    string action?;
    int rating?;
};

public type CustomerLastNameSetMessagePayload record {
    *MessagePayload;
    string 'type?;
    string lastName?;
};

public type OrderSetOrderNumberAction record {
    *OrderUpdateAction;
    string action?;
    string orderNumber?;
};

public type AttributeReferenceType record {
    *AttributeType;
    string name?;
    ReferenceTypeId referenceTypeId?;
};

public type ProductPriceDiscountsSetUpdatedPrice record {
    int variantId?;
    string variantKey?;
    string sku?;
    string priceId?;
    DiscountedPrice discounted?;
    boolean staged?;
};
