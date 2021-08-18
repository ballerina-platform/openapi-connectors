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

import ballerina/http;
import ballerina/url;
import ballerina/lang.'string;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [SamCart API v1.0.0](https://developer.samcart.com/) OpenAPI specification.
# SamCart's Public API is used for accessing the data inside your SamCart marketplace.
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [SamCart account](https://www.samcart.com/) and obtain tokens following [this guide](https://developer.samcart.com/#section/Authentication).
    #
    # + apiKeyConfig - Provide your API key as `sc-api`. Eg: `{"sc-api" : "<API key>"}` 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.samcart.com/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Retrieve all charges
    #
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + testMode - Filter by test mode 
    # + offset - The offset value used to paginate through a list of entries. If the dir query parameter is prev then the offset will be the id of the first record of the data set otherwise the offset will be the id of the last record 
    # + 'limit - An optional limit for the number of entries on a page with a maximum value of 100. Default value is 100 if not provided. 
    # + dir - The direction to paginate the next set of data. If dir is prev the page will return a data set before the offset otherwise the data set will be after the offset. Default value is next if not provided. 
    # + return - Successful operation. Response will return an array of 0 or more charges 
    remote isolated function getCharges(string? createdAtMin = (), string? createdAtMax = (), boolean? testMode = (), int? offset = (), int? 'limit = (), string? dir = ()) returns InlineResponse200|error {
        string  path = string `/charges`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax, "test_mode": testMode, "offset": offset, "limit": 'limit, "dir": dir};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse200);
        return response;
    }
    # Retrieve a charge
    #
    # + id - The SamCart ID for the charge 
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + testMode - Filter by test mode 
    # + return - Successful operation 
    remote isolated function getByChargeId(int id, string? createdAtMin = (), string? createdAtMax = (), boolean? testMode = ()) returns ChargeService|error {
        string  path = string `/charges/${id}`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax, "test_mode": testMode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ChargeService response = check self.clientEp-> get(path, accHeaders, targetType = ChargeService);
        return response;
    }
    # Retrieve all refunds on a charge
    #
    # + id - The SamCart ID for the charge 
    # + return - Successful operation. Response will return an array of 0 or more refunds 
    remote isolated function getMultipleRefundsByChargeId(int id) returns RefundService[]|error {
        string  path = string `/charges/${id}/refunds`;
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        RefundService[] response = check self.clientEp-> get(path, accHeaders, targetType = RefundServiceArr);
        return response;
    }
    # Retrieve a refund on a charge
    #
    # + id - The SamCart ID for the charge 
    # + refundId - The SamCart ID for the refund 
    # + return - Successful operation 
    remote isolated function getRefundByChargeId(int id, int refundId) returns RefundService|error {
        string  path = string `/charges/${id}/refunds/${refundId}`;
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        RefundService response = check self.clientEp-> get(path, accHeaders, targetType = RefundService);
        return response;
    }
    # Retrieve all customers
    #
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + offset - The offset value used to paginate through a list of entries. If the dir query parameter is prev then the offset will be the id of the first record of the data set otherwise the offset will be the id of the last record 
    # + 'limit - An optional limit for the number of entries on a page with a maximum value of 100. Default value is 100 if not provided. 
    # + dir - The direction to paginate the next set of data. If dir is prev the page will return a data set before the offset otherwise the data set will be after the offset. Default value is next if not provided. 
    # + return - Successful operation. Response will return an array of 0 or more customers 
    remote isolated function getCustomers(string? createdAtMin = (), string? createdAtMax = (), int? offset = (), int? 'limit = (), string? dir = ()) returns InlineResponse2001|error {
        string  path = string `/customers`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax, "offset": offset, "limit": 'limit, "dir": dir};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
        return response;
    }
    # Retrieve a customer
    #
    # + id - The SamCart ID for the customer 
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + return - Successful operation 
    remote isolated function getByCustomerId(int id, string? createdAtMin = (), string? createdAtMax = ()) returns CustomerService|error {
        string  path = string `/customers/${id}`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CustomerService response = check self.clientEp-> get(path, accHeaders, targetType = CustomerService);
        return response;
    }
    # Retrieve all addresses for a customer
    #
    # + id - The SamCart ID for the customer 
    # + return - Successful operation. Response will return an array of 0 or more addresses 
    remote isolated function getAddressesByCustomerId(int id) returns AddressService[]|error {
        string  path = string `/customers/${id}/addresses`;
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AddressService[] response = check self.clientEp-> get(path, accHeaders, targetType = AddressServiceArr);
        return response;
    }
    # Retrieve all charges for a customer
    #
    # + id - The SamCart ID for the customer 
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + testMode - Filter by test mode 
    # + return - Successful operation. Response will return an array of 0 or more charges 
    remote isolated function getChargesByCustomerId(int id, string? createdAtMin = (), string? createdAtMax = (), boolean? testMode = ()) returns ChargeService[]|error {
        string  path = string `/customers/${id}/charges`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax, "test_mode": testMode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ChargeService[] response = check self.clientEp-> get(path, accHeaders, targetType = ChargeServiceArr);
        return response;
    }
    # Retrieve all orders for a customer
    #
    # + id - The SamCart ID for the customer 
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + testMode - Filter by test mode 
    # + return - Successful operation. Response will return an array of 0 or more orders 
    remote isolated function getOrdersByCustomerId(int id, string? createdAtMin = (), string? createdAtMax = (), boolean? testMode = ()) returns OrderService[]|error {
        string  path = string `/customers/${id}/orders`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax, "test_mode": testMode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OrderService[] response = check self.clientEp-> get(path, accHeaders, targetType = OrderServiceArr);
        return response;
    }
    # Retrieve all subscriptions for a customer
    #
    # + id - The SamCart ID for the customer 
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + rebillingAtMin - Filter by UTC rebilling date at or after given date 
    # + rebillingAtMax - Filter by UTC rebilling date at or before given date 
    # + canceledAtMin - Filter by UTC canceled date at or after given date 
    # + canceledAtMax - Filter by UTC canceled date at or before given date 
    # + status - Filter subscriptions by status 
    # + 'type - Filter subscriptions by type 
    # + testMode - Filter by test mode 
    # + return - Successful operation. Response will return an array of 0 or more subscriptions 
    remote isolated function getSubscriptionsByCustomerId(int id, string? createdAtMin = (), string? createdAtMax = (), string? rebillingAtMin = (), string? rebillingAtMax = (), string? canceledAtMin = (), string? canceledAtMax = (), string? status = (), string? 'type = (), boolean? testMode = ()) returns SubscriptionService[]|error {
        string  path = string `/customers/${id}/subscriptions`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax, "rebilling_at_min": rebillingAtMin, "rebilling_at_max": rebillingAtMax, "canceled_at_min": canceledAtMin, "canceled_at_max": canceledAtMax, "status": status, "type": 'type, "test_mode": testMode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SubscriptionService[] response = check self.clientEp-> get(path, accHeaders, targetType = SubscriptionServiceArr);
        return response;
    }
    # Retrieve all failed charges
    #
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + testMode - Filter by test mode 
    # + offset - The offset value used to paginate through a list of entries. If the dir query parameter is prev then the offset will be the id of the first record of the data set otherwise the offset will be the id of the last record 
    # + 'limit - An optional limit for the number of entries on a page with a maximum value of 100. Default value is 100 if not provided. 
    # + dir - The direction to paginate the next set of data. If dir is prev the page will return a data set before the offset otherwise the data set will be after the offset. Default value is next if not provided. 
    # + return - Successful operation. Response will return an array of 0 or more failed charges 
    remote isolated function getFailedCharges(string? createdAtMin = (), string? createdAtMax = (), boolean? testMode = (), int? offset = (), int? 'limit = (), string? dir = ()) returns InlineResponse2002|error {
        string  path = string `/failed-charges`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax, "test_mode": testMode, "offset": offset, "limit": 'limit, "dir": dir};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2002);
        return response;
    }
    # Retrieve a failed charge
    #
    # + id - The SamCart ID for the charge 
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + testMode - Filter by test mode 
    # + return - Successful operation 
    remote isolated function getByFailedChargeId(int id, string? createdAtMin = (), string? createdAtMax = (), boolean? testMode = ()) returns FailedChargeService|error {
        string  path = string `/failed-charges/${id}`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax, "test_mode": testMode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FailedChargeService response = check self.clientEp-> get(path, accHeaders, targetType = FailedChargeService);
        return response;
    }
    # Retrieve all orders
    #
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + testMode - Filter by test mode 
    # + offset - The offset value used to paginate through a list of entries. If the dir query parameter is prev then the offset will be the id of the first record of the data set otherwise the offset will be the id of the last record 
    # + 'limit - An optional limit for the number of entries on a page with a maximum value of 100. Default value is 100 if not provided. 
    # + dir - The direction to paginate the next set of data. If dir is prev the page will return a data set before the offset otherwise the data set will be after the offset. Default value is next if not provided. 
    # + return - Successful operation. Response will return an array of 0 or more orders 
    remote isolated function getOrders(string? createdAtMin = (), string? createdAtMax = (), boolean? testMode = (), int? offset = (), int? 'limit = (), string? dir = ()) returns InlineResponse2003|error {
        string  path = string `/orders`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax, "test_mode": testMode, "offset": offset, "limit": 'limit, "dir": dir};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2003 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2003);
        return response;
    }
    # Retrieve an order
    #
    # + id - The SamCart ID for the order 
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + testMode - Filter by test mode 
    # + return - Successful operation 
    remote isolated function getByOrderId(int id, string? createdAtMin = (), string? createdAtMax = (), boolean? testMode = ()) returns OrderService|error {
        string  path = string `/orders/${id}`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax, "test_mode": testMode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        OrderService response = check self.clientEp-> get(path, accHeaders, targetType = OrderService);
        return response;
    }
    # Retrieve all charges on an order
    #
    # + id - The SamCart ID for the order 
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + testMode - Filter by test mode 
    # + return - Successful operation. Response will return an array of 0 or more charges 
    remote isolated function getChargesByOrderId(int id, string? createdAtMin = (), string? createdAtMax = (), boolean? testMode = ()) returns ChargeService[]|error {
        string  path = string `/orders/${id}/charges`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax, "test_mode": testMode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ChargeService[] response = check self.clientEp-> get(path, accHeaders, targetType = ChargeServiceArr);
        return response;
    }
    # Retrieve customer on an order
    #
    # + id - The SamCart ID for the order 
    # + return - Successful operation 
    remote isolated function getCustomerByOrderId(int id) returns CustomerService|error {
        string  path = string `/orders/${id}/customer`;
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CustomerService response = check self.clientEp-> get(path, accHeaders, targetType = CustomerService);
        return response;
    }
    # Retrieve all subscriptions on an order
    #
    # + id - The SamCart ID for the order 
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + rebillingAtMin - Filter by UTC rebilling date at or after given date 
    # + rebillingAtMax - Filter by UTC rebilling date at or before given date 
    # + canceledAtMin - Filter by UTC canceled date at or after given date 
    # + canceledAtMax - Filter by UTC canceled date at or before given date 
    # + testMode - Filter by test mode 
    # + status - Filter subscriptions by status 
    # + 'type - Filter subscriptions by type 
    # + return - Successful operation. Response will return an array of 0 or more subscriptions 
    remote isolated function getSubscriptionsByOrderId(int id, string? createdAtMin = (), string? createdAtMax = (), string? rebillingAtMin = (), string? rebillingAtMax = (), string? canceledAtMin = (), string? canceledAtMax = (), boolean? testMode = (), string? status = (), string? 'type = ()) returns SubscriptionService[]|error {
        string  path = string `/orders/${id}/subscriptions`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax, "rebilling_at_min": rebillingAtMin, "rebilling_at_max": rebillingAtMax, "canceled_at_min": canceledAtMin, "canceled_at_max": canceledAtMax, "test_mode": testMode, "status": status, "type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SubscriptionService[] response = check self.clientEp-> get(path, accHeaders, targetType = SubscriptionServiceArr);
        return response;
    }
    # Retrieve all products
    #
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + status - Filter product by status 
    # + productCategory - Filter product by category 
    # + pricingType - Filter product by pricing type 
    # + offset - The offset value used to paginate through a list of entries. If the dir query parameter is prev then the offset will be the id of the first record of the data set otherwise the offset will be the id of the last record 
    # + 'limit - An optional limit for the number of entries on a page with a maximum value of 100. Default value is 100 if not provided. 
    # + dir - The direction to paginate the next set of data. If dir is prev the page will return a data set before the offset otherwise the data set will be after the offset. Default value is next if not provided. 
    # + return - Successful operation. Response will return an array of 0 or more products 
    remote isolated function getProducts(string? createdAtMin = (), string? createdAtMax = (), string? status = (), string? productCategory = (), string? pricingType = (), int? offset = (), int? 'limit = (), string? dir = ()) returns InlineResponse2004|error {
        string  path = string `/products`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax, "status": status, "product_category": productCategory, "pricing_type": pricingType, "offset": offset, "limit": 'limit, "dir": dir};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2004 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2004);
        return response;
    }
    # Retrieve a product
    #
    # + id - The SamCart ID for the product 
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + status - Filter product by status 
    # + productCategory - Filter product by category 
    # + pricingType - Filter product by pricing type 
    # + return - Successful operation 
    remote isolated function getByProductId(int id, string? createdAtMin = (), string? createdAtMax = (), string? status = (), string? productCategory = (), string? pricingType = ()) returns ProductService|error {
        string  path = string `/products/${id}`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax, "status": status, "product_category": productCategory, "pricing_type": pricingType};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ProductService response = check self.clientEp-> get(path, accHeaders, targetType = ProductService);
        return response;
    }
    # Retrieve all subscriptions
    #
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + rebillingAtMin - Filter by UTC rebilling date at or after given date 
    # + rebillingAtMax - Filter by UTC rebilling date at or before given date 
    # + canceledAtMin - Filter by UTC canceled date at or after given date 
    # + canceledAtMax - Filter by UTC canceled date at or before given date 
    # + testMode - Filter by test mode 
    # + status - Filter subscriptions by status 
    # + 'type - Filter subscriptions by type 
    # + offset - The offset value used to paginate through a list of entries. If the dir query parameter is prev then the offset will be the id of the first record of the data set otherwise the offset will be the id of the last record 
    # + 'limit - An optional limit for the number of entries on a page with a maximum value of 100. Default value is 100 if not provided. 
    # + dir - The direction to paginate the next set of data. If dir is prev the page will return a data set before the offset otherwise the data set will be after the offset. Default value is next if not provided. 
    # + return - Successful operation. Response will return an array of 0 or more subscriptions 
    remote isolated function getSubscriptions(string? createdAtMin = (), string? createdAtMax = (), string? rebillingAtMin = (), string? rebillingAtMax = (), string? canceledAtMin = (), string? canceledAtMax = (), boolean? testMode = (), string? status = (), string? 'type = (), int? offset = (), int? 'limit = (), string? dir = ()) returns InlineResponse2005|error {
        string  path = string `/subscriptions`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax, "rebilling_at_min": rebillingAtMin, "rebilling_at_max": rebillingAtMax, "canceled_at_min": canceledAtMin, "canceled_at_max": canceledAtMax, "test_mode": testMode, "status": status, "type": 'type, "offset": offset, "limit": 'limit, "dir": dir};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2005 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2005);
        return response;
    }
    # Retrieve a subscription
    #
    # + id - The SamCart ID for the subscription 
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + rebillingAtMin - Filter by UTC rebilling date at or after given date 
    # + rebillingAtMax - Filter by UTC rebilling date at or before given date 
    # + canceledAtMin - Filter by UTC canceled date at or after given date 
    # + canceledAtMax - Filter by UTC canceled date at or before given date 
    # + testMode - Filter by test mode 
    # + status - Filter subscriptions by status 
    # + 'type - Filter subscriptions by type 
    # + return - Successful operation 
    remote isolated function getSubscriptionById(int id, string? createdAtMin = (), string? createdAtMax = (), string? rebillingAtMin = (), string? rebillingAtMax = (), string? canceledAtMin = (), string? canceledAtMax = (), boolean? testMode = (), string? status = (), string? 'type = ()) returns SubscriptionService|error {
        string  path = string `/subscriptions/${id}`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax, "rebilling_at_min": rebillingAtMin, "rebilling_at_max": rebillingAtMax, "canceled_at_min": canceledAtMin, "canceled_at_max": canceledAtMax, "test_mode": testMode, "status": status, "type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SubscriptionService response = check self.clientEp-> get(path, accHeaders, targetType = SubscriptionService);
        return response;
    }
    # Retrieve charges on a subscription
    #
    # + id - The SamCart ID for the subscription 
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + testMode - Filter by test mode 
    # + return - Successful operation. Response will return an array of 0 or more charges 
    remote isolated function getChargesBySubscriptionID(int id, string? createdAtMin = (), string? createdAtMax = (), boolean? testMode = ()) returns ChargeService[]|error {
        string  path = string `/subscriptions/${id}/charges`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax, "test_mode": testMode};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ChargeService[] response = check self.clientEp-> get(path, accHeaders, targetType = ChargeServiceArr);
        return response;
    }
    # Retrieve a customer on a subscription
    #
    # + id - The SamCart ID for the subscription 
    # + return - Successful operation 
    remote isolated function getCustomerBySubscriptionID(int id) returns CustomerService|error {
        string  path = string `/subscriptions/${id}/customer`;
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CustomerService response = check self.clientEp-> get(path, accHeaders, targetType = CustomerService);
        return response;
    }
    # Retrieve a subscription's history
    #
    # + id - The SamCart ID for the subscription 
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + return - Successful operation. Response will return an array of 0 or more history entries 
    remote isolated function getHistoriesBySubscriptionID(int id, string? createdAtMin = (), string? createdAtMax = ()) returns SubscriptionHistoryService[]|error {
        string  path = string `/subscriptions/${id}/history`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SubscriptionHistoryService[] response = check self.clientEp-> get(path, accHeaders, targetType = SubscriptionHistoryServiceArr);
        return response;
    }
    # Retrieve a plan for a subscription
    #
    # + id - The SamCart ID for the subscription 
    # + createdAtMin - Filter by UTC created at date at or after given date 
    # + createdAtMax - Filter by UTC created at date at or before given date 
    # + return - Successful operation 
    remote isolated function getPlanBySubscriptionID(int id, string? createdAtMin = (), string? createdAtMax = ()) returns SubscriptionPlanService|error {
        string  path = string `/subscriptions/${id}/plan`;
        map<anydata> queryParam = {"created_at_min": createdAtMin, "created_at_max": createdAtMax};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"sc-api": self.apiKeys["sc-api"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SubscriptionPlanService response = check self.clientEp-> get(path, accHeaders, targetType = SubscriptionPlanService);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map 
# + return - Returns generated Path or error at failure of client initialization 
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}

# Generate header map for given header values.
#
# + headerParam - Headers  map 
# + return - Returns generated map or error at failure of client initialization 
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
