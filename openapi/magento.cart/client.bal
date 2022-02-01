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

import ballerina/http;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
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

# This is a generated connector for [Magento REST API v2.2](https://devdocs.magento.com/guides/v2.4/rest/bk-rest.html) OpenAPI specification.
# The Magento B2B Rest API service enables applications to build and manage a customized commerce store. 
@display {label: "Magento Cart", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Follow [this guide](https://devdocs.magento.com/guides/v2.4/get-started/authentication/gs-authentication-token.html) and obtain tokens.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Creates an empty cart and quote for a guest
    #
    # + return - 200 Success. 
    remote isolated function createEmptyCartForGuest() returns int|error {
        string resourcePath = string `/V1/carts/`;
        http:Request request = new;
        //TODO: Update the request as needed;
        int response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Checks gift card balance if added to the cart
    #
    # + return - 200 Success. 
    remote isolated function checkGiftCardAddedToCart(string cartId, string giftCardCode) returns decimal|error {
        string resourcePath = string `/V1/carts/guest-carts/${cartId}/checkGiftCard/${giftCardCode}`;
        decimal response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds gift card to the cart
    #
    # + return - 200 Success. 
    remote isolated function addGiftCardToGuestCart(string cartId, CartidGiftcardsBody payload) returns boolean|error {
        string resourcePath = string `/V1/carts/guest-carts/${cartId}/giftCards`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        boolean response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Removes GiftCard Account entity
    #
    # + return - 200 Success. 
    remote isolated function deleteGiftCardAccountByQuoteId(string cartId, string giftCardCode) returns boolean|error {
        string resourcePath = string `/V1/carts/guest-carts/${cartId}/giftCards/${giftCardCode}`;
        boolean response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Lists active checkout agreements.
    #
    # + return - 200 Success. 
    remote isolated function listsActiveCheckoutAgreements() returns CheckoutAgreementsDataAgreementInterface[]|error {
        string resourcePath = string `/V1/carts/licence`;
        CheckoutAgreementsDataAgreementInterface[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns information for the cart for a specified customer
    #
    # + return - 200 Success. 
    remote isolated function getInformationForCartForSpecifiedCustomer() returns QuoteDataCartInterface|error {
        string resourcePath = string `/V1/carts/mine`;
        QuoteDataCartInterface response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Saves quote
    #
    # + return - 401 Unauthorized 
    remote isolated function saveQuote(CartsMineBody payload) returns http:Response|error {
        string resourcePath = string `/V1/carts/mine`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Creates an empty cart and quote for a specified customer if customer does not have a cart yet.
    #
    # + return - 200 Success. 
    remote isolated function createEmptyCartForCustomerIfNoCart() returns int|error {
        string resourcePath = string `/V1/carts/mine`;
        http:Request request = new;
        //TODO: Update the request as needed;
        int response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Applies store credit
    #
    # + return - 200 Success. 
    remote isolated function applyStoreCreditCustomerBalance() returns boolean|error {
        string resourcePath = string `/V1/carts/mine/balance/apply`;
        http:Request request = new;
        //TODO: Update the request as needed;
        boolean response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Unapplies store credit.
    #
    # + return - 200 Success. 
    remote isolated function unapplyStoreCreditCustomerBalance() returns boolean|error {
        string resourcePath = string `/V1/carts/mine/balance/unapply`;
        http:Request request = new;
        //TODO: Update the request as needed;
        boolean response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Returns the billing address for a specified quote
    #
    # + return - 200 Success. 
    remote isolated function getBillingAddressForSpecifiedQuote() returns QuoteDataAddressInterface|error {
        string resourcePath = string `/V1/carts/mine/billing-address`;
        QuoteDataAddressInterface response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Assigns a specified billing address to a specified cart
    #
    # + return - 200 Success. 
    remote isolated function assignsSpecifiedBillingAddress(MineBillingaddressBody payload) returns int|error {
        string resourcePath = string `/V1/carts/mine/billing-address`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        int response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Checks gift card balance if applied to given cart
    #
    # + return - 200 Success. 
    remote isolated function getGiftCardBalanceIfAppliedGivenCart(string giftCardCode) returns decimal|error {
        string resourcePath = string `/V1/carts/mine/checkGiftCard/${giftCardCode}`;
        decimal response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Saves Checkout Fields
    #
    # + return - 400 Bad Request 
    remote isolated function saveCheckoutFields(MineCheckoutfieldsBody payload) returns http:Response|error {
        string resourcePath = string `/V1/carts/mine/checkout-fields`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Sets shipping/billing methods and additional data for cart and collect totals.
    #
    # + return - 200 Success. 
    remote isolated function setShippingBillingMethodsAndCollectTotal(MineCollecttotalsBody payload) returns QuoteDataTotalsInterface|error {
        string resourcePath = string `/V1/carts/mine/collect-totals`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        QuoteDataTotalsInterface response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Shipping collection point search request
    #
    # + return - 200 Success. 
    remote isolated function saveSearchRequest(CollectionpointSearchrequestBody payload) returns TemandoShippingDataCollectionPointSearchRequestInterface|error {
        string resourcePath = string `/V1/carts/mine/collection-point/search-request`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TemandoShippingDataCollectionPointSearchRequestInterface response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes cart collection point search request
    #
    # + return - 200 Success. 
    remote isolated function deleteCartCollectionPointSearchRequest() returns boolean|error {
        string resourcePath = string `/V1/carts/mine/collection-point/search-request`;
        boolean response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Gets collection points search request
    #
    # + return - 200 Success. 
    remote isolated function getCollectionPointsSearchRequest() returns TemandoShippingDataCollectionPointQuoteCollectionPointInterface[]|error {
        string resourcePath = string `/V1/carts/mine/collection-point/search-result`;
        TemandoShippingDataCollectionPointQuoteCollectionPointInterface[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Selects cart collection point
    #
    # + return - 200 Success. 
    remote isolated function selectCollectionPoint(CollectionpointSelectBody payload) returns boolean|error {
        string resourcePath = string `/V1/carts/mine/collection-point/select`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        boolean response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns information for a coupon in a specified cart
    #
    # + return - 200 Success. 
    remote isolated function getInformationForCoupon() returns string|error {
        string resourcePath = string `/V1/carts/mine/coupons`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a coupon from a specified cart
    #
    # + return - 200 Success. 
    remote isolated function deleteCouponFromCart() returns boolean|error {
        string resourcePath = string `/V1/carts/mine/coupons`;
        boolean response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Adds a coupon by code to a specified cart
    #
    # + couponCode - The coupon code data. 
    # + return - 200 Success. 
    remote isolated function addCouponByCodeToCart(string couponCode) returns boolean|error {
        string resourcePath = string `/V1/carts/mine/coupons/${couponCode}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        boolean response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Handles selected delivery option
    #
    # + return - 401 Unauthorized 
    remote isolated function handleSelectedDeliveryOption(MineDeliveryoptionBody payload) returns http:Response|error {
        string resourcePath = string `/V1/carts/mine/delivery-option`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Estimates shipping by address and return list of available shipping methods
    #
    # + return - 200 Success. 
    remote isolated function estimateShippingByExtendedAddress(MineEstimateshippingmethodsBody payload) returns QuoteDataShippingMethodInterface[]|error {
        string resourcePath = string `/V1/carts/mine/estimate-shipping-methods`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        QuoteDataShippingMethodInterface[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Estimates shipping
    #
    # + return - 200 Success. 
    remote isolated function estimateShippingMethodsByAddressId(MineEstimateshippingmethodsbyaddressidBody payload) returns QuoteDataShippingMethodInterface[]|error {
        string resourcePath = string `/V1/carts/mine/estimate-shipping-methods-by-address-id`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        QuoteDataShippingMethodInterface[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the gift message for a specified order
    #
    # + return - 200 Success. 
    remote isolated function getGiftMessageForSpecifiedOrder() returns GiftMessageDataMessageInterface|error {
        string resourcePath = string `/V1/carts/mine/gift-message`;
        GiftMessageDataMessageInterface response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Sets the gift message for an entire order
    #
    # + return - 200 Success. 
    remote isolated function setGiftMessageForAnOrder(MineGiftmessageBody payload) returns boolean|error {
        string resourcePath = string `/V1/carts/mine/gift-message`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        boolean response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the gift message for a specified item in a specified shopping cart
    #
    # + itemId - The item ID. 
    # + return - 200 Success. 
    remote isolated function getGiftMessageForSpecifiedItem(int itemId) returns GiftMessageDataMessageInterface|error {
        string resourcePath = string `/V1/carts/mine/gift-message/${itemId}`;
        GiftMessageDataMessageInterface response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Sets the gift message for a specified item in a specified shopping cart
    #
    # + itemId - The item ID. 
    # + return - 200 Success. 
    remote isolated function setGiftMessageForSpecifiedItem(int itemId, GiftmessageItemidBody payload) returns boolean|error {
        string resourcePath = string `/V1/carts/mine/gift-message/${itemId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        boolean response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Adds gift card to the cart
    #
    # + return - 200 Success. 
    remote isolated function addGiftCardToCart(MineGiftcardsBody payload) returns boolean|error {
        string resourcePath = string `/V1/carts/mine/giftCards`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        boolean response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Removes GiftCard Account entity
    #
    # + return - 200 Success. 
    remote isolated function removeGiftCardAccountEntity(string giftCardCode) returns boolean|error {
        string resourcePath = string `/V1/carts/mine/giftCards/${giftCardCode}`;
        boolean response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Lists items that are assigned to a specified cart
    #
    # + return - 200 Success. 
    remote isolated function listItemsAssignedToSpecifiedCart() returns QuoteDataCartItemInterface[]|error {
        string resourcePath = string `/V1/carts/mine/items`;
        QuoteDataCartItemInterface[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds/updates the specified cart item
    #
    # + return - 200 Success. 
    remote isolated function addOrUpdateSpecificCartItem(MineItemsBody payload) returns QuoteDataCartItemInterface|error {
        string resourcePath = string `/V1/carts/mine/items`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        QuoteDataCartItemInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Adds/updates the specified cart item
    #
    # + return - 200 Success. 
    remote isolated function addOrUpdateSpecificCartItemByID(string itemId, ItemsItemidBody payload) returns QuoteDataCartItemInterface|error {
        string resourcePath = string `/V1/carts/mine/items/${itemId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        QuoteDataCartItemInterface response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Removes the specified item from the specified cart
    #
    # + itemId - The item ID of the item to be removed. 
    # + return - 200 Success. 
    remote isolated function removesTheSpecifiedItemFromSpecifiedCart(int itemId) returns boolean|error {
        string resourcePath = string `/V1/carts/mine/items/${itemId}`;
        boolean response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Places an order for a specified cart
    #
    # + return - 200 Success. 
    remote isolated function placeAnOrderForSpecifiedCart(MineOrderBody payload) returns int|error {
        string resourcePath = string `/V1/carts/mine/order`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        int response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Gets payment information
    #
    # + return - 200 Success. 
    remote isolated function getPaymentInformation() returns CheckoutDataPaymentDetailsInterface|error {
        string resourcePath = string `/V1/carts/mine/payment-information`;
        CheckoutDataPaymentDetailsInterface response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Sets payment information and place order for a specified cart
    #
    # + return - 200 Success. 
    remote isolated function savePaymentInformationAndPlaceOrderForSpecifiedCart(MinePaymentinformationBody payload) returns int|error {
        string resourcePath = string `/V1/carts/mine/payment-information`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        int response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Lists available payment methods for a specified shopping cart
    #
    # + return - 200 Success. 
    remote isolated function listAvailablePaymentMethodsForSpecifiedShoppingCart() returns QuoteDataPaymentMethodInterface[]|error {
        string resourcePath = string `/V1/carts/mine/payment-methods`;
        QuoteDataPaymentMethodInterface[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the payment method for a specified shopping cart
    #
    # + return - 200 Success. 
    remote isolated function getThePaymentMethodForSpecifiedShoppingCart() returns QuoteDataPaymentInterface|error {
        string resourcePath = string `/V1/carts/mine/selected-payment-method`;
        QuoteDataPaymentInterface response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a specified payment method to a specified shopping cart
    #
    # + return - 200 Success. 
    remote isolated function addSpecifiedPaymentMethodSpecifiedShoppingCart(MineSelectedpaymentmethodBody payload) returns string|error {
        string resourcePath = string `/V1/carts/mine/selected-payment-method`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Sets payment information for a specified cart
    #
    # + return - 200 Success. 
    remote isolated function setPaymentInformationForSpecifiedCart(MineSetpaymentinformationBody payload) returns int|error {
        string resourcePath = string `/V1/carts/mine/set-payment-information`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        int response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Saves address information
    #
    # + return - 200 Success. 
    remote isolated function saveAddressInformation(MineShippinginformationBody payload) returns CheckoutDataPaymentDetailsInterface|error {
        string resourcePath = string `/V1/carts/mine/shipping-information`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CheckoutDataPaymentDetailsInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Lists applicable shipping methods for a specified quote
    #
    # + return - 200 Success. 
    remote isolated function listApplicableShippingMethodsForSpecifiedQuote() returns QuoteDataShippingMethodInterface[]|error {
        string resourcePath = string `/V1/carts/mine/shipping-methods`;
        QuoteDataShippingMethodInterface[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns quote totals data for a specified cart
    #
    # + return - 200 Success. 
    remote isolated function getQuoteTotalDataForSpecifiedCart() returns QuoteDataTotalsInterface|error {
        string resourcePath = string `/V1/carts/mine/totals`;
        QuoteDataTotalsInterface response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Calculates quote totals based on address and shipping method
    #
    # + return - 200 Success. 
    remote isolated function calculateQuoteTotalBasedOnAddressAndShippingMethod(MineTotalsinformationBody payload) returns QuoteDataTotalsInterface|error {
        string resourcePath = string `/V1/carts/mine/totals-information`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        QuoteDataTotalsInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Enables administrative users to list carts that match specified search criteria
    #
    # + searchcriteriaFiltergroups0Filters0Field - Field 
    # + searchcriteriaFiltergroups0Filters0Value - Value 
    # + searchcriteriaFiltergroups0Filters0Conditiontype - Condition type 
    # + searchcriteriaSortorders0Field - Sorting field. 
    # + searchcriteriaSortorders0Direction - Sorting direction. 
    # + searchcriteriaPagesize - Page size. 
    # + searchcriteriaCurrentpage - Current page. 
    # + return - 200 Success. 
    remote isolated function enablesAdministrativeUsersToListCarts(string? searchcriteriaFiltergroups0Filters0Field = (), string? searchcriteriaFiltergroups0Filters0Value = (), string? searchcriteriaFiltergroups0Filters0Conditiontype = (), string? searchcriteriaSortorders0Field = (), string? searchcriteriaSortorders0Direction = (), int? searchcriteriaPagesize = (), int? searchcriteriaCurrentpage = ()) returns QuoteDataCartSearchResultsInterface|error {
        string resourcePath = string `/V1/carts/search`;
        map<anydata> queryParam = {"searchCriteria[filterGroups][0][filters][0][field]": searchcriteriaFiltergroups0Filters0Field, "searchCriteria[filterGroups][0][filters][0][value]": searchcriteriaFiltergroups0Filters0Value, "searchCriteria[filterGroups][0][filters][0][conditionType]": searchcriteriaFiltergroups0Filters0Conditiontype, "searchCriteria[sortOrders][0][field]": searchcriteriaSortorders0Field, "searchCriteria[sortOrders][0][direction]": searchcriteriaSortorders0Direction, "searchCriteria[pageSize]": searchcriteriaPagesize, "searchCriteria[currentPage]": searchcriteriaCurrentpage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QuoteDataCartSearchResultsInterface response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Enables an administrative user to return information for a specified cart
    #
    # + return - 200 Success. 
    remote isolated function enablesAdministrativeUserToReturnInformation(int cartId) returns QuoteDataCartInterface|error {
        string resourcePath = string `/V1/carts/${cartId}`;
        QuoteDataCartInterface response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Assigns a specified customer to a specified shopping cart
    #
    # + cartId - The cart ID. 
    # + return - 200 Success. 
    remote isolated function assignSpecifiedCustomerToShoppingCart(int cartId, CartsCartidBody payload) returns boolean|error {
        string resourcePath = string `/V1/carts/${cartId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        boolean response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Returns the billing address for a specified quote
    #
    # + cartId - The cart ID. 
    # + return - 200 Success. 
    remote isolated function quoteBillingAddressForSpecifiedQuote(int cartId) returns QuoteDataAddressInterface|error {
        string resourcePath = string `/V1/carts/${cartId}/billing-address`;
        QuoteDataAddressInterface response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Assigns a specified billing address to a specified cart
    #
    # + cartId - The cart ID. 
    # + return - 200 Success. 
    remote isolated function assignBillingAddressToSpecifiedCartByID(int cartId, CartidBillingaddressBody payload) returns int|error {
        string resourcePath = string `/V1/carts/${cartId}/billing-address`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        int response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns information for a coupon in a specified cart
    #
    # + cartId - The cart ID. 
    # + return - 200 Success. 
    remote isolated function getInformationForCouponInSpecifiedCart(int cartId) returns string|error {
        string resourcePath = string `/V1/carts/${cartId}/coupons`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a coupon from a specified cart
    #
    # + cartId - The cart ID. 
    # + return - 200 Success. 
    remote isolated function deleteCouponFromASpecCartByID(int cartId) returns boolean|error {
        string resourcePath = string `/V1/carts/${cartId}/coupons`;
        boolean response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Adds a coupon by code to a specified cart
    #
    # + cartId - The cart ID. 
    # + couponCode - The coupon code data. 
    # + return - 200 Success. 
    remote isolated function addQuoteCouponByCodeToSpecifiedCartByID(int cartId, string couponCode) returns boolean|error {
        string resourcePath = string `/V1/carts/${cartId}/coupons/${couponCode}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        boolean response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Estimates shipping by address and return list of available shipping methods
    #
    # + return - 200 Success. 
    remote isolated function estimateShippingByAddressByCartID(string cartId, CartidEstimateshippingmethodsBody payload) returns QuoteDataShippingMethodInterface[]|error {
        string resourcePath = string `/V1/carts/${cartId}/estimate-shipping-methods`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        QuoteDataShippingMethodInterface[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Estimates shipping
    #
    # + cartId - The shopping cart ID. 
    # + return - 200 Success. 
    remote isolated function estimateShippingMethodsByAddressIdAndCartID(int cartId, CartidEstimateshippingmethodsbyaddressidBody payload) returns QuoteDataShippingMethodInterface[]|error {
        string resourcePath = string `/V1/carts/${cartId}/estimate-shipping-methods-by-address-id`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        QuoteDataShippingMethodInterface[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the gift message for a specified order
    #
    # + cartId - The shopping cart ID. 
    # + return - 200 Success. 
    remote isolated function getGiftMessageForSpecificOrderByCartID(int cartId) returns GiftMessageDataMessageInterface|error {
        string resourcePath = string `/V1/carts/${cartId}/gift-message`;
        GiftMessageDataMessageInterface response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Sets the gift message for an entire order
    #
    # + cartId - The cart ID. 
    # + return - 200 Success. 
    remote isolated function setGiftMessageForEntireOrderByCartID(int cartId, CartidGiftmessageBody payload) returns boolean|error {
        string resourcePath = string `/V1/carts/${cartId}/gift-message`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        boolean response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the gift message for a specified item in a specified shopping cart
    #
    # + cartId - The shopping cart ID. 
    # + itemId - The item ID. 
    # + return - 200 Success. 
    remote isolated function getGiftMessageForSpecificItemOfSpecShopping(int cartId, int itemId) returns GiftMessageDataMessageInterface|error {
        string resourcePath = string `/V1/carts/${cartId}/gift-message/${itemId}`;
        GiftMessageDataMessageInterface response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Sets the gift message for a specified item in a specified shopping cart
    #
    # + cartId - The cart ID. 
    # + itemId - The item ID. 
    # + return - 200 Success. 
    remote isolated function setGiftMessageForSpecItemInASpecShopping(int cartId, int itemId, GiftmessageItemidBody2 payload) returns boolean|error {
        string resourcePath = string `/V1/carts/${cartId}/gift-message/${itemId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        boolean response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Removes GiftCard Account entity
    #
    # + return - 200 Success. 
    remote isolated function removeGiftCardAccountEntityByCartID(int cartId, string giftCardCode) returns boolean|error {
        string resourcePath = string `/V1/carts/${cartId}/giftCards/${giftCardCode}`;
        boolean response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Lists items that are assigned to a specified cart
    #
    # + cartId - The cart ID. 
    # + return - 200 Success. 
    remote isolated function listItemsAssignedToSpecificCart(int cartId) returns QuoteDataCartItemInterface[]|error {
        string resourcePath = string `/V1/carts/${cartId}/items`;
        QuoteDataCartItemInterface[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds/updates the specified cart item
    #
    # + return - 200 Success. 
    remote isolated function addOrUpdateTheSpecificCartItem(string cartId, string itemId, ItemsItemidBody2 payload) returns QuoteDataCartItemInterface|error {
        string resourcePath = string `/V1/carts/${cartId}/items/${itemId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        QuoteDataCartItemInterface response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Removes the specified item from the specified cart
    #
    # + cartId - The cart ID. 
    # + itemId - The item ID of the item to be removed. 
    # + return - 200 Success. 
    remote isolated function removesSpecificItemFromSpecifiedCart(int cartId, int itemId) returns boolean|error {
        string resourcePath = string `/V1/carts/${cartId}/items/${itemId}`;
        boolean response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Places an order for a specified cart
    #
    # + cartId - The cart ID. 
    # + return - 200 Success. 
    remote isolated function placesAnOrderForSpecifiedCart(int cartId, CartidOrderBody payload) returns int|error {
        string resourcePath = string `/V1/carts/${cartId}/order`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        int response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Lists available payment methods for a specified shopping cart
    #
    # + cartId - The cart ID. 
    # + return - 200 Success. 
    remote isolated function listAvailablePaymentMethodsForShoppingCart(int cartId) returns QuoteDataPaymentMethodInterface[]|error {
        string resourcePath = string `/V1/carts/${cartId}/payment-methods`;
        QuoteDataPaymentMethodInterface[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the payment method for a specified shopping cart
    #
    # + cartId - The cart ID. 
    # + return - 200 Success. 
    remote isolated function getPaymentMethodForSpecifiedShoppingCartByID(int cartId) returns QuoteDataPaymentInterface|error {
        string resourcePath = string `/V1/carts/${cartId}/selected-payment-method`;
        QuoteDataPaymentInterface response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a specified payment method to a specified shopping cart
    #
    # + cartId - The cart ID. 
    # + return - 200 Success. 
    remote isolated function addSpecifiedPaymentMethodToSpecifiedShoppingCart(int cartId, CartidSelectedpaymentmethodBody payload) returns string|error {
        string resourcePath = string `/V1/carts/${cartId}/selected-payment-method`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # checks out Shipping Information By ID
    #
    # + return - 200 Success. 
    remote isolated function checkoutShippingInformationByID(int cartId, CartidShippinginformationBody payload) returns CheckoutDataPaymentDetailsInterface|error {
        string resourcePath = string `/V1/carts/${cartId}/shipping-information`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CheckoutDataPaymentDetailsInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Lists applicable shipping methods for a specified quote
    #
    # + cartId - The shopping cart ID. 
    # + return - 200 Success. 
    remote isolated function getApplicableShippingMethodsForSpecifiedQuote(int cartId) returns QuoteDataShippingMethodInterface[]|error {
        string resourcePath = string `/V1/carts/${cartId}/shipping-methods`;
        QuoteDataShippingMethodInterface[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns quote totals data for a specified cart
    #
    # + cartId - The cart ID. 
    # + return - 200 Success. 
    remote isolated function getQuoteTotalsDataForASpecifiedCart(int cartId) returns QuoteDataTotalsInterface|error {
        string resourcePath = string `/V1/carts/${cartId}/totals`;
        QuoteDataTotalsInterface response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Calculates quote totals based on address and shipping method
    #
    # + return - 200 Success. 
    remote isolated function checkoutTotalsBasedOnAddressAndShippingMethod(int cartId, CartidTotalsinformationBody payload) returns QuoteDataTotalsInterface|error {
        string resourcePath = string `/V1/carts/${cartId}/totals-information`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        QuoteDataTotalsInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns GiftCard Account cards
    #
    # + return - 200 Success. 
    remote isolated function getGiftCardsByQuoteID(int quoteId) returns GiftCardAccountDataGiftCardAccountInterface|error {
        string resourcePath = string `/V1/carts/${quoteId}/giftCards`;
        GiftCardAccountDataGiftCardAccountInterface response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds/updates the specified cart item
    #
    # + return - 200 Success. 
    remote isolated function addOrUpdateTheSpecifiedCartItem(string quoteId, QuoteidItemsBody payload) returns QuoteDataCartItemInterface|error {
        string resourcePath = string `/V1/carts/${quoteId}/items`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        QuoteDataCartItemInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
