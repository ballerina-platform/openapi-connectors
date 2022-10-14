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
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_1_1;
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
    # Proxy server related options
    http:ProxyConfig? proxy = ();
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# This is a generated connector for [Magento REST Asynchronous API v2.2](https://devdocs.magento.com/redoc/2.3/async-admin-rest-api.html) OpenAPI specification.
# The Magento Asynchronous Customer REST API service enables applications to build and manage the Magento e-commerce platform. 
@display {label: "Magento Asynchronous Customer", iconPath: "icon.png"}
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
    # amazon-billing-address/{amazonOrderReferenceId}
    #
    # + return - 202 Accepted. 
    remote isolated function amazonPaymentAddressManagementV1GetBillingAddressPut(string amazonOrderReferenceId, AmazonbillingaddressAmazonorderreferenceidBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/amazon-billing-address/${getEncodedUri(amazonOrderReferenceId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # amazon-shipping-address/{amazonOrderReferenceId}
    #
    # + return - 202 Accepted. 
    remote isolated function amazonPaymentAddressManagementV1GetShippingAddressPut(string amazonOrderReferenceId, AmazonshippingaddressAmazonorderreferenceidBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/amazon-shipping-address/${getEncodedUri(amazonOrderReferenceId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # amazon/order-ref
    #
    # + return - Unexpected error 
    remote isolated function amazonPaymentOrderInformationManagementV1RemoveOrderReferenceDelete() returns http:Response|error {
        string resourcePath = string `/async/V1/amazon/order-ref`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # carts/guest-carts/{cartId}/giftCards
    #
    # + return - 202 Accepted. 
    remote isolated function giftCardAccountGuestGiftCardAccountManagementV1AddGiftCardPost(string cartId, CartidGiftcardsBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/carts/guest-carts/${getEncodedUri(cartId)}/giftCards`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # carts/guest-carts/{cartId}/giftCards/{giftCardCode}
    #
    # + return - 202 Accepted. 
    remote isolated function giftCardAccountGuestGiftCardAccountManagementV1DeleteByQuoteIdDelete(string cartId, string giftCardCode) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/carts/guest-carts/${getEncodedUri(cartId)}/giftCards/${getEncodedUri(giftCardCode)}`;
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # carts/mine
    #
    # + return - 401 Unauthorized 
    remote isolated function quoteCartRepositoryV1SavePut(CartsMineBody payload) returns http:Response|error {
        string resourcePath = string `/async/V1/carts/mine`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # carts/mine/balance/apply
    #
    # + return - 202 Accepted. 
    remote isolated function customerBalanceBalanceManagementV1ApplyPost() returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/carts/mine/balance/apply`;
        http:Request request = new;
        //TODO: Update the request as needed;
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # carts/mine/collect-totals
    #
    # + return - 202 Accepted. 
    remote isolated function quoteCartTotalManagementV1CollectTotalsPut(MineCollecttotalsBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/carts/mine/collect-totals`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # carts/mine/payment-information
    #
    # + return - 202 Accepted. 
    remote isolated function checkoutPaymentInformationManagementV1SavePaymentInformationAndPlaceOrderPost(MinePaymentinformationBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/carts/mine/payment-information`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # carts/mine/set-payment-information
    #
    # + return - 202 Accepted. 
    remote isolated function checkoutPaymentInformationManagementV1SavePaymentInformationPost(MineSetpaymentinformationBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/carts/mine/set-payment-information`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # customers
    #
    # + return - 202 Accepted. 
    remote isolated function customerAccountManagementV1CreateAccountPost(V1CustomersBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/customers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # customers/isEmailAvailable
    #
    # + return - 202 Accepted. 
    remote isolated function customerAccountManagementV1IsEmailAvailablePost(CustomersIsemailavailableBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/customers/isEmailAvailable`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # customers/me/activate
    #
    # + return - 202 Accepted. 
    remote isolated function customerAccountManagementV1ActivateByIdPut(MeActivateBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/customers/me/activate`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # customers/me/password
    #
    # + return - 202 Accepted. 
    remote isolated function customerAccountManagementV1ChangePasswordByIdPut(MePasswordBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/customers/me/password`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # customers/password
    #
    # + return - 202 Accepted. 
    remote isolated function customerAccountManagementV1InitiatePasswordResetPut(CustomersPasswordBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/customers/password`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # customers/resetPassword
    #
    # + return - 202 Accepted. 
    remote isolated function customerAccountManagementV1ResetPasswordPost(CustomersResetpasswordBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/customers/resetPassword`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # giftregistry/mine/estimate-shipping-methods
    #
    # + return - 202 Accepted. 
    remote isolated function giftRegistryShippingMethodManagementV1EstimateByRegistryIdPost(MineEstimateshippingmethodsBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/giftregistry/mine/estimate-shipping-methods`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # guest-carts
    #
    # + return - 202 Accepted. 
    remote isolated function quoteGuestCartManagementV1CreateEmptyCartPost() returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts`;
        http:Request request = new;
        //TODO: Update the request as needed;
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # guest-carts/{cartId}
    #
    # + cartId - The cart ID. 
    # + return - 202 Accepted. 
    remote isolated function quoteGuestCartManagementV1AssignCustomerPut(string cartId, GuestcartsCartidBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts/${getEncodedUri(cartId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # guest-carts/{cartId}/billing-address
    #
    # + cartId - The cart ID. 
    # + return - 202 Accepted. 
    remote isolated function quoteGuestBillingAddressManagementV1AssignPost(string cartId, CartidBillingaddressBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts/${getEncodedUri(cartId)}/billing-address`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # guest-carts/{cartId}/collect-totals
    #
    # + cartId - The cart ID. 
    # + return - 202 Accepted. 
    remote isolated function quoteGuestCartTotalManagementV1CollectTotalsPut(string cartId, CartidCollecttotalsBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts/${getEncodedUri(cartId)}/collect-totals`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # guest-carts/{cartId}/coupons
    #
    # + cartId - The cart ID. 
    # + return - 202 Accepted. 
    remote isolated function quoteGuestCouponManagementV1RemoveDelete(string cartId) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts/${getEncodedUri(cartId)}/coupons`;
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # guest-carts/{cartId}/coupons/{couponCode}
    #
    # + cartId - The cart ID. 
    # + couponCode - The coupon code data. 
    # + return - 202 Accepted. 
    remote isolated function quoteGuestCouponManagementV1SetPut(string cartId, string couponCode) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts/${getEncodedUri(cartId)}/coupons/${getEncodedUri(couponCode)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # guest-carts/{cartId}/estimate-shipping-methods
    #
    # + return - 202 Accepted. 
    remote isolated function quoteGuestShipmentEstimationV1EstimateByExtendedAddressPost(string cartId, CartidEstimateshippingmethodsBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts/${getEncodedUri(cartId)}/estimate-shipping-methods`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # guest-carts/{cartId}/gift-message
    #
    # + cartId - The cart ID. 
    # + return - 202 Accepted. 
    remote isolated function giftMessageGuestCartRepositoryV1SavePost(string cartId, CartidGiftmessageBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts/${getEncodedUri(cartId)}/gift-message`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # guest-carts/{cartId}/gift-message/{itemId}
    #
    # + cartId - The cart ID. 
    # + itemId - The item ID. 
    # + return - 202 Accepted. 
    remote isolated function giftMessageGuestItemRepositoryV1SavePost(string cartId, int itemId, GiftmessageItemidBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts/${getEncodedUri(cartId)}/gift-message/${getEncodedUri(itemId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # guest-carts/{cartId}/items
    #
    # + return - 202 Accepted. 
    remote isolated function quoteGuestCartItemRepositoryV1SavePost(string cartId, CartidItemsBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts/${getEncodedUri(cartId)}/items`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # guest-carts/{cartId}/items/{itemId}
    #
    # + return - 202 Accepted. 
    remote isolated function quoteGuestCartItemRepositoryV1SavePut(string cartId, string itemId, ItemsItemidBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts/${getEncodedUri(cartId)}/items/${getEncodedUri(itemId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # guest-carts/{cartId}/items/{itemId}
    #
    # + cartId - The cart ID. 
    # + itemId - The item ID of the item to be removed. 
    # + return - 202 Accepted. 
    remote isolated function quoteGuestCartItemRepositoryV1DeleteByIdDelete(string cartId, int itemId) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts/${getEncodedUri(cartId)}/items/${getEncodedUri(itemId)}`;
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # guest-carts/{cartId}/order
    #
    # + cartId - The cart ID. 
    # + return - 202 Accepted. 
    remote isolated function quoteGuestCartManagementV1PlaceOrderPut(string cartId, CartidOrderBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts/${getEncodedUri(cartId)}/order`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # guest-carts/{cartId}/payment-information
    #
    # + return - 202 Accepted. 
    remote isolated function checkoutGuestPaymentInformationManagementV1SavePaymentInformationAndPlaceOrderPost(string cartId, CartidPaymentinformationBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts/${getEncodedUri(cartId)}/payment-information`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # guest-carts/{cartId}/selected-payment-method
    #
    # + cartId - The cart ID. 
    # + return - 202 Accepted. 
    remote isolated function quoteGuestPaymentMethodManagementV1SetPut(string cartId, CartidSelectedpaymentmethodBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts/${getEncodedUri(cartId)}/selected-payment-method`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # guest-carts/{cartId}/set-payment-information
    #
    # + return - 202 Accepted. 
    remote isolated function checkoutGuestPaymentInformationManagementV1SavePaymentInformationPost(string cartId, CartidSetpaymentinformationBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts/${getEncodedUri(cartId)}/set-payment-information`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # guest-carts/{cartId}/shipping-information
    #
    # + return - 202 Accepted. 
    remote isolated function checkoutGuestShippingInformationManagementV1SaveAddressInformationPost(string cartId, CartidShippinginformationBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts/${getEncodedUri(cartId)}/shipping-information`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # guest-carts/{cartId}/totals-information
    #
    # + return - 202 Accepted. 
    remote isolated function checkoutGuestTotalsInformationManagementV1CalculatePost(string cartId, CartidTotalsinformationBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-carts/${getEncodedUri(cartId)}/totals-information`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # guest-giftregistry/{cartId}/estimate-shipping-methods
    #
    # + cartId - The shopping cart ID. 
    # + return - 202 Accepted. 
    remote isolated function giftRegistryGuestCartShippingMethodManagementV1EstimateByRegistryIdPost(string cartId, CartidEstimateshippingmethodsBody2 payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/guest-giftregistry/${getEncodedUri(cartId)}/estimate-shipping-methods`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # integration/admin/token
    #
    # + return - 202 Accepted. 
    remote isolated function integrationAdminTokenServiceV1CreateAdminAccessTokenPost(AdminTokenBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/integration/admin/token`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # integration/customer/token
    #
    # + return - 202 Accepted. 
    remote isolated function integrationCustomerTokenServiceV1CreateCustomerAccessTokenPost(CustomerTokenBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/integration/customer/token`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # negotiable-carts/{cartId}/billing-address
    #
    # + cartId - The cart ID. 
    # + return - 202 Accepted. 
    remote isolated function negotiableQuoteBillingAddressManagementV1AssignPost(int cartId, CartidBillingaddressBody2 payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/negotiable-carts/${getEncodedUri(cartId)}/billing-address`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # negotiable-carts/{cartId}/coupons
    #
    # + cartId - The cart ID. 
    # + return - 202 Accepted. 
    remote isolated function negotiableQuoteCouponManagementV1RemoveDelete(int cartId) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/negotiable-carts/${getEncodedUri(cartId)}/coupons`;
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # negotiable-carts/{cartId}/coupons/{couponCode}
    #
    # + cartId - The cart ID. 
    # + couponCode - The coupon code data. 
    # + return - 202 Accepted. 
    remote isolated function negotiableQuoteCouponManagementV1SetPut(int cartId, string couponCode) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/negotiable-carts/${getEncodedUri(cartId)}/coupons/${getEncodedUri(couponCode)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # negotiable-carts/{cartId}/estimate-shipping-methods
    #
    # + return - 202 Accepted. 
    remote isolated function negotiableQuoteShipmentEstimationV1EstimateByExtendedAddressPost(string cartId, CartidEstimateshippingmethodsBody4 payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/negotiable-carts/${getEncodedUri(cartId)}/estimate-shipping-methods`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # negotiable-carts/{cartId}/estimate-shipping-methods-by-address-id
    #
    # + cartId - The shopping cart ID. 
    # + return - 202 Accepted. 
    remote isolated function negotiableQuoteShippingMethodManagementV1EstimateByAddressIdPost(int cartId, CartidEstimateshippingmethodsbyaddressidBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/negotiable-carts/${getEncodedUri(cartId)}/estimate-shipping-methods-by-address-id`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # negotiable-carts/{cartId}/giftCards
    #
    # + return - 202 Accepted. 
    remote isolated function negotiableQuoteGiftCardAccountManagementV1SaveByQuoteIdPost(int cartId, CartidGiftcardsBody2 payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/negotiable-carts/${getEncodedUri(cartId)}/giftCards`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # negotiable-carts/{cartId}/giftCards/{giftCardCode}
    #
    # + return - 202 Accepted. 
    remote isolated function negotiableQuoteGiftCardAccountManagementV1DeleteByQuoteIdDelete(int cartId, string giftCardCode) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/negotiable-carts/${getEncodedUri(cartId)}/giftCards/${getEncodedUri(giftCardCode)}`;
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # negotiable-carts/{cartId}/payment-information
    #
    # + return - 202 Accepted. 
    remote isolated function negotiableQuotePaymentInformationManagementV1SavePaymentInformationAndPlaceOrderPost(int cartId, CartidPaymentinformationBody2 payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/negotiable-carts/${getEncodedUri(cartId)}/payment-information`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # negotiable-carts/{cartId}/set-payment-information
    #
    # + return - 202 Accepted. 
    remote isolated function negotiableQuotePaymentInformationManagementV1SavePaymentInformationPost(int cartId, CartidSetpaymentinformationBody2 payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/negotiable-carts/${getEncodedUri(cartId)}/set-payment-information`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # negotiable-carts/{cartId}/shipping-information
    #
    # + return - 202 Accepted. 
    remote isolated function negotiableQuoteShippingInformationManagementV1SaveAddressInformationPost(int cartId, CartidShippinginformationBody2 payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/negotiable-carts/${getEncodedUri(cartId)}/shipping-information`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # requisition_lists
    #
    # + return - 202 Accepted. 
    remote isolated function requisitionListRequisitionListRepositoryV1SavePost(V1RequisitionListsBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/requisition_lists`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # reward/mine/use-reward
    #
    # + return - 202 Accepted. 
    remote isolated function rewardRewardManagementV1SetPost() returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/reward/mine/use-reward`;
        http:Request request = new;
        //TODO: Update the request as needed;
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # vertex-address-validation/vertex-address
    #
    # + return - 202 Accepted. 
    remote isolated function vertexAddressValidationAddressManagementV1GetValidAddressPost(VertexaddressvalidationVertexaddressBody payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/vertex-address-validation/vertex-address`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # worldpay-guest-carts/{cartId}/payment-information
    #
    # + return - 202 Accepted. 
    remote isolated function worldpayGuestPaymentInformationManagementProxyV1SavePaymentInformationAndPlaceOrderPost(string cartId, CartidPaymentinformationBody4 payload) returns AsynchronousOperationsDataAsyncResponseInterface|error {
        string resourcePath = string `/async/V1/worldpay-guest-carts/${getEncodedUri(cartId)}/payment-information`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AsynchronousOperationsDataAsyncResponseInterface response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
