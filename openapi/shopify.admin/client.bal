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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `X-Shopify-Access-Token`
    string xShopifyAccessToken;
|};

# This is a generated connector for [Shopify Admin API v2021-10](https://shopify.dev/api/admin-rest) OpenAPI specification.
# The Admin API lets you build apps and integrations that extend and enhance the Shopify admin.
# As the primary way that apps and services interact with Shopify, the Admin API allows you to add your own features to the Shopify user experience. 
# Read and write Shopify store information, including products, inventory, orders, shipping, and more.
@display {label: "Shopify Admin", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Shopify account](https://www.shopify.com) and obtain tokens by following [this guide](https://shopify.dev/apps/auth/oauth).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, http:ClientConfiguration clientConfig =  {}) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Retrieves a list of customers.
    #
    # + ids - Restrict results to customers specified by a comma-separated list of IDs. 
    # + sinceId - Restrict results to those after the specified ID. 
    # + createdAtMin - Show customers created after a specified date.(format: 2014-04-25T16:15:47-04:00) 
    # + createdAtMax - Show customers created before a specified date.(format: 2014-04-25T16:15:47-04:00) 
    # + updatedAtMin - Show customers last updated after a specified date.(format: 2014-04-25T16:15:47-04:00) 
    # + updatedAtMax - Show customers last updated before a specified date.(format: 2014-04-25T16:15:47-04:00) 
    # + 'limit - The maximum number of results to show.(default: 50, maximum: 250) 
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - List of customers 
    remote isolated function getCustomers(string? ids = (), string? sinceId = (), string? createdAtMin = (), string? createdAtMax = (), string? updatedAtMin = (), string? updatedAtMax = (), int? 'limit = (), string? fields = ()) returns CustomerList|error {
        string resourcePath = string `/admin/api/2021-10/customers.json`;
        map<anydata> queryParam = {"ids": ids, "since_id": sinceId, "created_at_min": createdAtMin, "created_at_max": createdAtMax, "updated_at_min": updatedAtMin, "updated_at_max": updatedAtMax, "limit": 'limit, "fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CustomerList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates a customer.
    #
    # + payload - The Customer object to be created. 
    # + return - Created customer 
    remote isolated function createCustomer(CreateCustomer payload) returns CustomerObject|error {
        string resourcePath = string `/admin/api/2021-10/customers.json`;
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerObject response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieves a single customer.
    #
    # + customerId - Customer ID 
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - Requested customer 
    remote isolated function getCustomer(string customerId, string? fields = ()) returns CustomerObject|error {
        string resourcePath = string `/admin/api/2021-10/customers/${customerId}.json`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CustomerObject response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Updates a customer.
    #
    # + customerId - Customer ID 
    # + payload - The Customer object to be updated. 
    # + return - Updated customer 
    remote isolated function updateCustomer(string customerId, UpdateCustomer payload) returns CustomerObject|error {
        string resourcePath = string `/admin/api/2021-10/customers/${customerId}.json`;
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerObject response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Searches for customers that match a supplied query.
    #
    # + query - Text to search for in the shop's customer data. 
    # + 'order - Set the field and direction by which to order results. (default: last_order_date DESC) 
    # + 'limit - The maximum number of results to show. (default: 50, maximum: 250) 
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + return - List of customers 
    remote isolated function searchCustomers(string? query = (), string? 'order = (), int? 'limit = (), string? fields = ()) returns CustomerList|error {
        string resourcePath = string `/admin/api/2021-10/customers/search.json`;
        map<anydata> queryParam = {"query": query, "order": 'order, "limit": 'limit, "fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CustomerList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieves a list of products.
    #
    # + ids - Return only products specified by a comma-separated list of product IDs. 
    # + 'limit - Return up to this many results per page. (default: 50, maximum: 250) 
    # + sinceId - Restrict results to after the specified ID. 
    # + title - Filter results by product title. 
    # + vendor - Filter results by product vendor. 
    # + 'handle - Filter results by product handle. 
    # + productType - Filter results by product type. 
    # + status - Return products by their status. (default: active) active: Show only active products. archived: Show only archived products. draft: Show only draft products. 
    # + collectionId - Filter results by product collection ID. 
    # + createdAtMin - Show products created after date. (format: 2014-04-25T16:15:47-04:00) 
    # + createdAtMax - Show products created before date. (format: 2014-04-25T16:15:47-04:00) 
    # + updatedAtMin - Show products last updated after date. (format: 2014-04-25T16:15:47-04:00) 
    # + updatedAtMax - Show products last updated before date. (format: 2014-04-25T16:15:47-04:00) 
    # + publishedAtMin - Show products published after date. (format: 2014-04-25T16:15:47-04:00) 
    # + publishedAtMax - Show products published before date. (format: 2014-04-25T16:15:47-04:00) 
    # + publishedStatus - Return products by their published status (default: any) published: Show only published products. unpublished: Show only unpublished products. any: Show all products. 
    # + fields - Show only certain fields, specified by a comma-separated list of field names. 
    # + presentmentCurrencies - Return presentment prices in only certain currencies, specified by a comma-separated list of ISO 4217 currency codes. 
    # + return - List of products 
    remote isolated function getProducts(string? ids = (), int? 'limit = (), string? sinceId = (), string? title = (), string? vendor = (), string? 'handle = (), string? productType = (), string? status = (), string? collectionId = (), string? createdAtMin = (), string? createdAtMax = (), string? updatedAtMin = (), string? updatedAtMax = (), string? publishedAtMin = (), string? publishedAtMax = (), string? publishedStatus = (), string? fields = (), string? presentmentCurrencies = ()) returns ProductList|error {
        string resourcePath = string `/admin/api/2021-10/products.json`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "since_id": sinceId, "title": title, "vendor": vendor, "handle": 'handle, "product_type": productType, "status": status, "collection_id": collectionId, "created_at_min": createdAtMin, "created_at_max": createdAtMax, "updated_at_min": updatedAtMin, "updated_at_max": updatedAtMax, "published_at_min": publishedAtMin, "published_at_max": publishedAtMax, "published_status": publishedStatus, "fields": fields, "presentment_currencies": presentmentCurrencies};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProductList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates a new product.
    #
    # + payload - The Product object to be created. 
    # + return - Created product 
    remote isolated function createProduct(CreateProduct payload) returns ProductObject|error {
        string resourcePath = string `/admin/api/2021-10/products.json`;
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductObject response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieves a single product.
    #
    # + productId - Product ID 
    # + fields - A comma-separated list of fields to include in the response. 
    # + return - Requested product 
    remote isolated function getProduct(string productId, string? fields = ()) returns ProductObject|error {
        string resourcePath = string `/admin/api/2021-10/products/${productId}.json`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProductObject response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Updates a product and its variants and images.
    #
    # + productId - Product ID 
    # + payload - The Product object to be updated. 
    # + return - Updated product 
    remote isolated function updateProduct(string productId, UpdateProduct payload) returns ProductObject|error {
        string resourcePath = string `/admin/api/2021-10/products/${productId}.json`;
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductObject response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieves a list of product variants.
    #
    # + productId - Product ID 
    # + fields - A comma-separated list of fields to include in the response 
    # + 'limit - Return up to this many results per page 
    # + presentmentCurrencies - Return presentment prices in only certain currencies, specified by a comma-separated list of ISO 4217 currency codes. 
    # + sinceId - Restrict results to after the specified ID 
    # + return - List of product variants 
    remote isolated function getProductVariants(string productId, string? fields = (), int? 'limit = (), string? presentmentCurrencies = (), string? sinceId = ()) returns ProductVariantList|error {
        string resourcePath = string `/admin/api/2021-10/products/${productId}/variants.json`;
        map<anydata> queryParam = {"fields": fields, "limit": 'limit, "presentment_currencies": presentmentCurrencies, "since_id": sinceId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProductVariantList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates a new product variant.
    #
    # + productId - Product ID 
    # + payload - The Product variant object to be created. 
    # + return - Created product variant 
    remote isolated function createProductVariant(string productId, CreateProductVariant payload) returns ProductVariantObject|error {
        string resourcePath = string `/admin/api/2021-10/products/${productId}/variants.json`;
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductVariantObject response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieves a single product variant by ID.
    #
    # + variantId - Variant ID 
    # + fields - A comma-separated list of fields to include in the response 
    # + return - Requested product variant 
    remote isolated function getProductVariant(string variantId, string? fields = ()) returns ProductVariantObject|error {
        string resourcePath = string `/admin/api/2021-10/variants/${variantId}.json`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProductVariantObject response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Updates an existing product variant.
    #
    # + variantId - Variant ID 
    # + payload - The Product variant object to be updated. 
    # + return - Updated product variant 
    remote isolated function updateProductVariant(string variantId, UpdateProductVariant payload) returns ProductVariantObject|error {
        string resourcePath = string `/admin/api/2021-10/variants/${variantId}.json`;
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductVariantObject response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieves a list of orders that meet the specified criteria.
    #
    # + ids - Retrieve only orders specified by a comma-separated list of order IDs. 
    # + 'limit - The maximum number of results to show on a page. (default: 50, maximum: 250) 
    # + sinceId - Show orders after the specified ID. 
    # + createdAtMin - Show orders created at or after date (format: 2014-04-25T16:15:47-04:00). 
    # + createdAtMax - Show orders created at or before date (format: 2014-04-25T16:15:47-04:00). 
    # + updatedAtMin - Show orders last updated at or after date (format: 2014-04-25T16:15:47-04:00). 
    # + updatedAtMax - Show orders last updated at or before date (format: 2014-04-25T16:15:47-04:00). 
    # + processedAtMin - Show orders imported at or after date (format: 2014-04-25T16:15:47-04:00). 
    # + processedAtMax - Show orders imported at or before date (format: 2014-04-25T16:15:47-04:00). 
    # + attributionAppId - Show orders attributed to a certain app, specified by the app ID. Set as current to show orders for the app currently consuming the API. 
    # + status - Filter orders by their status. default: open) open: Show only open orders. closed: Show only closed orders. cancelled: Show only canceled orders. any: Show orders of any status, including archived orders. 
    # + financialStatus - Filter orders by their financial status. (default: any) authorized: Show only authorized orders pending: Show only pending orders paid: Show only paid orders partially_paid: Show only partially paid orders refunded: Show only refunded orders voided: Show only voided orders partially_refunded: Show only partially refunded orders any: Show orders of any financial status. unpaid: Show authorized and partially paid orders. 
    # + fulfillmentStatus - Filter orders by their fulfillment status. (default: any) shipped: Show orders that have been shipped. Returns orders with fulfillment_status of fulfilled. partial: Show partially shipped orders. unshipped: Show orders that have not yet been shipped. Returns orders with fulfillment_status of null. any: Show orders of any fulfillment status. unfulfilled: Returns orders with fulfillment_status of null or partial. 
    # + fields - Retrieve only certain fields, specified by a comma-separated list of fields names. 
    # + return - List of orders 
    remote isolated function getOrders(string? ids = (), int? 'limit = (), int? sinceId = (), string? createdAtMin = (), string? createdAtMax = (), string? updatedAtMin = (), string? updatedAtMax = (), string? processedAtMin = (), string? processedAtMax = (), string? attributionAppId = (), string? status = (), string? financialStatus = (), string? fulfillmentStatus = (), string? fields = ()) returns OrderList|error {
        string resourcePath = string `/admin/api/2021-10/orders.json`;
        map<anydata> queryParam = {"ids": ids, "limit": 'limit, "since_id": sinceId, "created_at_min": createdAtMin, "created_at_max": createdAtMax, "updated_at_min": updatedAtMin, "updated_at_max": updatedAtMax, "processed_at_min": processedAtMin, "processed_at_max": processedAtMax, "attribution_app_id": attributionAppId, "status": status, "financial_status": financialStatus, "fulfillment_status": fulfillmentStatus, "fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OrderList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates an order. By default, product inventory is not claimed.
    #
    # + payload - The Order object to be created. 
    # + return - Created order 
    remote isolated function createOrder(CreateOrder payload) returns OrderObject|error {
        string resourcePath = string `/admin/api/2021-10/orders.json`;
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrderObject response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieves a specific order.
    #
    # + orderId - Order ID 
    # + fields - A comma-separated list of fields to include in the response. 
    # + return - Requested order 
    remote isolated function getOrder(string orderId, string? fields = ()) returns OrderObject|error {
        string resourcePath = string `/admin/api/2021-10/orders/${orderId}.json`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OrderObject response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Updates an existing order.
    #
    # + orderId - Order ID 
    # + payload - The Order object to be updated. 
    # + return - Updated order 
    remote isolated function updateOrder(string orderId, UpdateOrder payload) returns OrderObject|error {
        string resourcePath = string `/admin/api/2021-10/orders/${orderId}.json`;
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrderObject response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieves fulfillments associated with an order.
    #
    # + orderId - Order ID 
    # + createdAtMax - Show fulfillments created before date (format: 2014-04-25T16:15:47-04:00). 
    # + createdAtMin - Show fulfillments created after date (format: 2014-04-25T16:15:47-04:00). 
    # + fields - A comma-separated list of fields to include in the response. 
    # + 'limit - Limit the amount of results. (default: 50, maximum: 250) 
    # + sinceId - Restrict results to after the specified ID. 
    # + updatedAtMax - Show fulfillments last updated before date (format: 2014-04-25T16:15:47-04:00). 
    # + updatedAtMin - Show fulfillments last updated after date (format: 2014-04-25T16:15:47-04:00). 
    # + return - List of order fulfillments 
    remote isolated function getOrderFulfillments(string orderId, string? createdAtMax = (), string? createdAtMin = (), string? fields = (), int? 'limit = (), string? sinceId = (), string? updatedAtMax = (), string? updatedAtMin = ()) returns OrderFulfillmentsList|error {
        string resourcePath = string `/admin/api/2021-10/orders/${orderId}/fulfillments.json`;
        map<anydata> queryParam = {"created_at_max": createdAtMax, "created_at_min": createdAtMin, "fields": fields, "limit": 'limit, "since_id": sinceId, "updated_at_max": updatedAtMax, "updated_at_min": updatedAtMin};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OrderFulfillmentsList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a fulfillment for the specified order and line items. The fulfillment's status depends on the line items in the order: If the line items in the fulfillment use a manual or custom fulfillment service, then the status of the returned fulfillment will be set immediately. If the line items use an external fulfillment service, then they will be queued for fulfillment and the status will be set to pending until the external fulfillment service has been invoked. A fulfillment might then transition to open, which implies it is being processed by the service, before transitioning to success when the items have shipped. If you don't specify line item IDs, then all unfulfilled and partially fulfilled line items for the order will be fulfilled. However, if an order is refunded or if any of its individual line items are refunded, then the order can't be fulfilled. All line items being fulfilled must have the same fulfillment service. Note If you are using this endpoint with a Partner development store or a trial store, then you can create no more than 5 new fulfillments per minute. About tracking urls If you're creating a fulfillment for a supported carrier, then you can send the tracking_company and tracking_numbers fields, and Shopify will generate the tracking_url for you. If you're creating a fulfillment for an unsupported carrier (not in the tracking_company list), then send the tracking_company, tracking_numbers, and tracking_urls fields. Note If you send an unsupported carrier without a tracking URL, then Shopify will still try to generate a valid tracking URL by using pattern matching on the tracking number. However, Shopify does not validate the tracking URL, so you should make sure that your tracking URL is correct for the order and fulfillment.
    #
    # + orderId - Order ID 
    # + payload - The Order fulfillment object to be created. 
    # + return - Created order fulfillment 
    remote isolated function createOrderFulfillment(string orderId, CreateOrderFulfillment payload) returns OrderFulfillmentObject|error {
        string resourcePath = string `/admin/api/2021-10/orders/${orderId}/fulfillments.json`;
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrderFulfillmentObject response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Creates a draft order.
    #
    # + customerId - Used to load the customer. When a customer is loaded, the customer’s email address is also associated. 
    # + useCustomerDefaultAddress - An optional boolean that you can send as part of a draft order object to load customer shipping information. Valid values: true or false. 
    # + payload - The Draft order object to be created. 
    # + return - Created draft order. 
    remote isolated function createDraftOrder(CreateDraftOrder payload, string? customerId = (), boolean? useCustomerDefaultAddress = ()) returns DraftOrderObject|error {
        string resourcePath = string `/admin/api/2021-10/draft_orders.json`;
        map<anydata> queryParam = {"customer_id": customerId, "use_customer_default_address": useCustomerDefaultAddress};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DraftOrderObject response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Creates a transaction for an order.
    #
    # + orderId - Order ID 
    # + 'source - The origin of the transaction. Set to external to create a cash transaction for the associated order. 
    # + payload - The Transaction object to be created. 
    # + return - Created transaction. 
    remote isolated function createTransactionForOrder(string orderId, CreateTransaction payload, string? 'source = ()) returns TransactionObject|error {
        string resourcePath = string `/admin/api/2021-10/orders/${orderId}/transactions.json`;
        map<anydata> queryParam = {"source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TransactionObject response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Creates a refund.
    #
    # + orderId - Order ID 
    # + payload - The Refund object to be created. 
    # + return - Created refund. 
    remote isolated function createRefundForOrder(string orderId, CreateRefund payload) returns RefundObject|error {
        string resourcePath = string `/admin/api/2021-10/orders/${orderId}/refunds.json`;
        map<any> headerValues = {"X-Shopify-Access-Token": self.apiKeyConfig.xShopifyAccessToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RefundObject response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
}
