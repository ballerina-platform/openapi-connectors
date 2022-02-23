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
    http:CredentialsConfig auth;
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

# This is a generated connector for [ShipStation API v1.0](https://www.shipstation.com/docs/api/) OpenAPI specification.
# ShipStation strives to streamline shipping for online sellers, no matter where they sell their products online.
@display {label: "ShipStation", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [ShipStation account](https://www.shipstation.com/step1/) and obtain tokens by following [this guide](https://www.shipstation.com/docs/api/requirements/#authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://ssapi.shipstation.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Creates a new ShipStation account and generates an apiKey and apiSecret to be used by the newly created account.
    #
    remote isolated function registerAccount(string contentType, RegisterAccountrequest payload) returns RegisterAccountresponse|error {
        string resourcePath = string `/accounts/registeraccount`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RegisterAccountresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Lists all tags defined for this account.
    #
    remote isolated function listTags() returns ListTagsresponse[]|error {
        string resourcePath = string `/accounts/listtags`;
        ListTagsresponse[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lists all shipping providers connected to this account.
    #
    remote isolated function listCarriers() returns ListCarriersresponse[]|error {
        string resourcePath = string `/carriers`;
        ListCarriersresponse[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves the shipping carrier account details for the specified carrierCode. Use this method to determine a carrier's account balance.
    #
    # + carrierCode - The code for the carrier account to retrieve. 
    remote isolated function getCarrier(string carrierCode) returns GetCarrierresponse|error {
        string resourcePath = string `/carriers/getcarrier`;
        map<anydata> queryParam = {"carrierCode": carrierCode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GetCarrierresponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds funds to a carrier account using the payment information on file.
    #
    remote isolated function addFunds(AddFundsrequest payload) returns AddFundsresponse|error {
        string resourcePath = string `/carriers/addfunds`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AddFundsresponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves a list of packages for the specified carrier
    #
    # + carrierCode - The carrier's code 
    remote isolated function listPackages(string carrierCode) returns ListPackagesresponse[]|error {
        string resourcePath = string `/carriers/listpackages`;
        map<anydata> queryParam = {"carrierCode": carrierCode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListPackagesresponse[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves the list of available shipping services provided by the specified carrier
    #
    # + carrierCode - The carrier's code 
    remote isolated function listServices(string carrierCode) returns ListServicesresponse[]|error {
        string resourcePath = string `/carriers/listservices`;
        map<anydata> queryParam = {"carrierCode": carrierCode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListServicesresponse[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Customer
    #
    # + customerId - The system generated identifier for the Customer. 
    remote isolated function getCustomer(int customerId) returns GetCustomerresponse|error {
        string resourcePath = string `/customers/${customerId}`;
        GetCustomerresponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Obtains a list of customers that match the specified criteria.
    #
    # + stateCode - Returns customers that reside in the specified stateCode. 
    # + countryCode - Returns customers that reside in the specified countryCode. 
    # + marketplaceId - Returns customers that purchased items from the specified marketplaceId. 
    # + tagId - Returns customers that have been tagged with the specified tagId. 
    # + sortBy - Sorts the order of the response based off the specified value. 
    # + sortDir - Sets the direction of the sort order. 
    # + page - Page number. 
    # + pageSize - Requested page size. Max value is 500. 
    remote isolated function listCustomers(string? stateCode = (), string? countryCode = (), int? marketplaceId = (), int? tagId = (), SortBy? sortBy = (), SortDir? sortDir = (), int? page = (), int? pageSize = ()) returns ListCustomersResponse|error {
        string resourcePath = string `/customers`;
        map<anydata> queryParam = {"stateCode": stateCode, "countryCode": countryCode, "marketplaceId": marketplaceId, "tagId": tagId, "sortBy": sortBy, "sortDir": sortDir, "page": page, "pageSize": pageSize};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListCustomersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Obtains a list of fulfillments that match the specified criteria.  Please note the following:
    # - Orders that have been marked as shipped either through the UI or the API will appear in the response as they are considered fulfillments.
    # All of the available filters are optional.  They do not need to be included in the URL.  If you do include them, here's what the URL may look like:
    # Url format with filters:
    # ```
    # fulfillments?fulfillmentId={fulfillmentId}
    # &orderId={orderId}
    # &orderNumber={orderNumber}
    # &trackingNumber={trackingNumber}
    # &recipientName={recipientName}
    # &createDateStart={createDateStart}
    # &createDateEnd={createDateEnd}
    # &shipDateStart={shipDateStart}
    # &shipDateEnd={shipDateEnd}
    # &sortBy={sortBy}
    # &sortDir={sortDir}
    # &page={page}
    # &pageSize={pageSize}
    # ```
    #
    # + fulfillmentId - Returns the fulfillment with the specified fulfillment ID. 
    # + orderId - Returns fulfillments whose orders have the specified order ID. 
    # + orderNumber - Returns fulfillments whose orders have the specified order number. 
    # + trackingNumber - Returns fulfillments with the specified tracking number. 
    # + recipientName - Returns fulfillments shipped to the specified recipient name. 
    # + createDateStart - Returns fulfillments created on or after the specified ``createDate`` 
    # + createDateEnd - Returns fulfillments created on or before the specified ``createDate`` 
    # + shipDateStart - Returns fulfillments with the ``shipDate`` on or after the specified date 
    # + shipDateEnd - Returns fulfillments with the ``shipDate`` on or before the specified date 
    # + sortBy - Sort the responses by a set value.  The response will be sorted based off the ascending dates (oldest to most current.)  If left empty, the response will be sorted by ascending ``createDate``. 
    # + sortDir - Sets the direction of the sort order. 
    # + page - page number. 
    # + pageSize - page size. 
    remote isolated function listFulfillments(int? fulfillmentId = (), int? orderId = (), string? orderNumber = (), string? trackingNumber = (), string? recipientName = (), string? createDateStart = (), string? createDateEnd = (), string? shipDateStart = (), string? shipDateEnd = (), SortBy1? sortBy = (), SortDir? sortDir = (), int? page = (), int? pageSize = ()) returns ListFulfillmentsResponse|error {
        string resourcePath = string `/fulfillments`;
        map<anydata> queryParam = {"fulfillmentId": fulfillmentId, "orderId": orderId, "orderNumber": orderNumber, "trackingNumber": trackingNumber, "recipientName": recipientName, "createDateStart": createDateStart, "createDateEnd": createDateEnd, "shipDateStart": shipDateStart, "shipDateEnd": shipDateEnd, "sortBy": sortBy, "sortDir": sortDir, "page": page, "pageSize": pageSize};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListFulfillmentsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a single order from the database.
    #
    # + orderId - The system generated identifier for the order. 
    remote isolated function getOrder(int orderId) returns GetOrderresponse|error {
        string resourcePath = string `/orders/${orderId}`;
        GetOrderresponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Removes order from ShipStation's UI. Note this is a "soft" delete action so the order will still exist in the database, but will be set to ``inactive``
    #
    # + orderId - The system generated identifier for the order. 
    remote isolated function deleteOrder(int orderId) returns DeleteOrderresponse|error {
        string resourcePath = string `/orders/${orderId}`;
        DeleteOrderresponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Adds a tag to an order
    #
    remote isolated function addTagToOrder(string contentType, AddTagtoOrderrequest payload) returns AddTagtoOrderresponse|error {
        string resourcePath = string `/orders/addtag`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AddTagtoOrderresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Assigns a user to an order
    #
    remote isolated function assignUserToOrder(string contentType, AssignUsertoOrderrequest payload) returns AssignUsertoOrderresponse|error {
        string resourcePath = string `/orders/assignuser`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AssignUsertoOrderresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Creates a shipping label for a given order.
    #
    remote isolated function createLabelForOrder(string contentType, CreateLabelforOrderrequest payload) returns CreateLabelforOrderresponse|error {
        string resourcePath = string `/orders/createlabelfororder`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateLabelforOrderresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create a new order or update an existing order. If the orderKey is specified, ShipStation will attempt to locate the order with the specified orderKey. If found, the existing order with that key will be updated. If the orderKey is not found, a new order will be created with that orderKey.
    #
    remote isolated function createUpdateorder(string contentType, CreateOrUpdateOrderrequest payload) returns CreateOrUpdateOrderresponse|error {
        string resourcePath = string `/orders/createorder`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateOrUpdateOrderresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create or update multiple orders in one request. If the orderKey is specified, ShipStation will attempt to locate the order with the specified orderKey. If found, the existing order with that key will be updated. If the orderKey is not found, a new order will be created with that orderKey.
    #
    remote isolated function createUpdatemultipleorders(string contentType, CreateOrUpdateMultipleOrdersrequest[] payload) returns CreateOrUpdateMultipleOrdersresponse|error {
        string resourcePath = string `/orders/createorders`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateOrUpdateMultipleOrdersresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Change the status of the given order to On Hold until the date specified, when the status will automatically change to Awaiting Shipment.
    #
    remote isolated function holdOrderUntil(string contentType, HoldOrderUntilrequest payload) returns HoldOrderUntilresponse|error {
        string resourcePath = string `/orders/holduntil`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        HoldOrderUntilresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List orders.
    #
    # + customerName - Returns orders that match the specified name. 
    # + itemKeyword - Returns orders that contain items that match the specified keyword. Fields searched are Sku, Description, and Options 
    # + createDateStart - Returns orders that were created in ShipStation after the specified date 
    # + createDateEnd - Returns orders that were created in ShipStation before the specified date 
    # + modifyDateStart - Returns orders that were modified after the specified date 
    # + modifyDateEnd - Returns orders that were modified before the specified date 
    # + orderDateStart - Returns orders greater than the specified date 
    # + orderDateEnd - Returns orders less than or equal to the specified date 
    # + orderNumber - Filter by order number, performs a "starts with" search. 
    # + orderStatus - Filter by order status.  If left empty, orders of all statuses are returned. 
    # + paymentDateStart - Returns orders that were paid after the specified date 
    # + paymentDateEnd - Returns orders that were paid before the specified date 
    # + storeId - Filters orders to a single store. Call List Stores to obtain a list of store Ids. 
    # + sortBy - Sort the responses by a set value.  The response will be sorted based off the ascending dates (oldest to most current.)  If left empty, the response will be sorted by ascending ``orderId``. 
    # + sortDir - Sets the direction of the sort order. 
    # + page - Page number 
    # + pageSize - Requested page size. Max value is 500. 
    remote isolated function listOrders(string? customerName = (), string? itemKeyword = (), string? createDateStart = (), string? createDateEnd = (), string? modifyDateStart = (), string? modifyDateEnd = (), string? orderDateStart = (), string? orderDateEnd = (), string? orderNumber = (), OrderStatus? orderStatus = (), string? paymentDateStart = (), string? paymentDateEnd = (), int? storeId = (), SortBy2? sortBy = (), SortDir? sortDir = (), string? page = (), string? pageSize = ()) returns ListOrdersResponse|error {
        string resourcePath = string `/orders`;
        map<anydata> queryParam = {"customerName": customerName, "itemKeyword": itemKeyword, "createDateStart": createDateStart, "createDateEnd": createDateEnd, "modifyDateStart": modifyDateStart, "modifyDateEnd": modifyDateEnd, "orderDateStart": orderDateStart, "orderDateEnd": orderDateEnd, "orderNumber": orderNumber, "orderStatus": orderStatus, "paymentDateStart": paymentDateStart, "paymentDateEnd": paymentDateEnd, "storeId": storeId, "sortBy": sortBy, "sortDir": sortDir, "page": page, "pageSize": pageSize};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListOrdersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lists all orders that match the specified status and tag ID
    #
    # + orderStatus - The order's status. 
    # + tagId - ID of the tag. Call Accounts/ListTags to obtain a list of tags for this account. 
    # + page - Page number 
    # + pageSize - Requested page size. Max value is 500. 
    remote isolated function listOrdersByTag(OrderStatus? orderStatus = (), int? tagId = (), string? page = (), string? pageSize = ()) returns ListOrdersbyTagresponse|error {
        string resourcePath = string `/orders/listbytag`;
        map<anydata> queryParam = {"orderStatus": orderStatus, "tagId": tagId, "page": page, "pageSize": pageSize};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListOrdersbyTagresponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Marks an order as shipped without creating a label in ShipStation.
    #
    remote isolated function markAnOrderAsShipped(string contentType, MarkanOrderasShippedrequest payload) returns MarkanOrderasShippedresponse|error {
        string resourcePath = string `/orders/markasshipped`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MarkanOrderasShippedresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Removes a tag from the specified order.
    #
    remote isolated function removeTagFromOrder(string contentType, RemoveTagfromOrderrequest payload) returns RemoveTagfromOrderresponse|error {
        string resourcePath = string `/orders/removetag`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RemoveTagfromOrderresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Change the status of the given order from On Hold to Awaiting Shipment
    #
    remote isolated function restoreOrderFromOnHold(string contentType, RestoreOrderfromOnHoldrequest payload) returns RestoreOrderfromOnHoldresponse|error {
        string resourcePath = string `/orders/restorefromhold`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RestoreOrderfromOnHoldresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Unassigns a user from an order.
    #
    remote isolated function unassignUserFromOrder(string contentType, UnassignUserfromOrderrequest payload) returns UnassignUserfromOrderresponse|error {
        string resourcePath = string `/orders/unassignuser`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UnassignUserfromOrderresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get product
    #
    # + productId - The system generated identifier for the Product. 
    remote isolated function getProduct(int productId) returns GetProductresponse|error {
        string resourcePath = string `/products/${productId}`;
        GetProductresponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing product.
    #
    # + productId - The system generated identifier for the Product. 
    remote isolated function updateProduct(int productId, string contentType, UpdateProductrequest payload) returns UpdateProductresponse|error {
        string resourcePath = string `/products/${productId}`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateProductresponse response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List products.
    #
    # + sku - Returns products that match the specified SKU. 
    # + name - Returns products that match the specified product name. 
    # + productCategoryId - Returns products that match the specified productCategoryId. 
    # + productTypeId - Returns products that match the specified productTypeId. 
    # + tagId - Returns products that match the specified tagId. 
    # + startDate - Returns products that were created after the specified date. 
    # + endDate - Returns products that were created before the specified date. 
    # + sortBy - Sorts the order of the response based off the specified value. 
    # + sortDir - Sets the direction of the sort order. 
    # + page - Page number. 
    # + pageSize - Requested page size. Max value is 500. 
    # + showInactive - Specifies whether the list should include inactive products. 
    remote isolated function listProducts(string? sku = (), string? name = (), string? productCategoryId = (), string? productTypeId = (), string? tagId = (), string? startDate = (), string? endDate = (), SortBy3? sortBy = (), SortDir? sortDir = (), string? page = (), string? pageSize = (), string? showInactive = ()) returns ListProductsResponse|error {
        string resourcePath = string `/products`;
        map<anydata> queryParam = {"sku": sku, "name": name, "productCategoryId": productCategoryId, "productTypeId": productTypeId, "tagId": tagId, "startDate": startDate, "endDate": endDate, "sortBy": sortBy, "sortDir": sortDir, "page": page, "pageSize": pageSize, "showInactive": showInactive};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListProductsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List shipments.
    #
    # + recipientName - Returns shipments shipped to the specified recipient name. 
    # + recipientCountryCode - Returns shipments shipped to the specified country code. 
    # + orderNumber - Returns shipments whose orders have the specified order number. 
    # + orderId - Returns shipments whose orders have the specified order ID. 
    # + carrierCode - Returns shipments shipped with the specified carrier. 
    # + serviceCode - Returns shipments shipped with the specified shipping service. 
    # + trackingNumber - Returns shipments with the specified tracking number. 
    # + createDateStart - Returns shipments created on or after the specified ``createDate`` 
    # + createDateEnd - Returns shipments created on or before the specified ``createDate`` 
    # + shipDateStart - Returns shipments with the ``shipDate`` on or after the specified date 
    # + shipDateEnd - Returns shipments with the ``shipDate`` on or before the specified date 
    # + voidDateStart - Returns shipments voided on or after the specified date 
    # + voidDateEnd - Returns shipments voided on or before the specified date 
    # + storeId - Returns shipments whose orders belong to the specified store ID. 
    # + includeShipmentItems - Specifies whether to include shipment items with results Default value: false. 
    # + sortBy - Sort the responses by a set value.  The response will be sorted based off the ascending dates (oldest to most current.)  If left empty, the response will be sorted by ascending ``createDate``. 
    # + sortDir - Sets the direction of the sort order. 
    # + page - page number. 
    # + pageSize - page size. 
    remote isolated function listShipments(string? recipientName = (), string? recipientCountryCode = (), string? orderNumber = (), int? orderId = (), string? carrierCode = (), string? serviceCode = (), string? trackingNumber = (), string? createDateStart = (), string? createDateEnd = (), string? shipDateStart = (), string? shipDateEnd = (), string? voidDateStart = (), string? voidDateEnd = (), int? storeId = (), boolean? includeShipmentItems = (), SortBy1? sortBy = (), SortDir? sortDir = (), int? page = (), int? pageSize = ()) returns ListShipmentsResponse|error {
        string resourcePath = string `/shipments`;
        map<anydata> queryParam = {"recipientName": recipientName, "recipientCountryCode": recipientCountryCode, "orderNumber": orderNumber, "orderId": orderId, "carrierCode": carrierCode, "serviceCode": serviceCode, "trackingNumber": trackingNumber, "createDateStart": createDateStart, "createDateEnd": createDateEnd, "shipDateStart": shipDateStart, "shipDateEnd": shipDateEnd, "voidDateStart": voidDateStart, "voidDateEnd": voidDateEnd, "storeId": storeId, "includeShipmentItems": includeShipmentItems, "sortBy": sortBy, "sortDir": sortDir, "page": page, "pageSize": pageSize};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListShipmentsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a shipment label
    #
    remote isolated function createShipmentLabel(string contentType, CreateShipmentLabelrequest payload) returns CreateShipmentLabelresponse|error {
        string resourcePath = string `/shipments/createlabel`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateShipmentLabelresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieves shipping rates for the specified shipping details.
    #
    remote isolated function getRates(string contentType, GetRatesrequest payload) returns GetRatesresponse[]|error {
        string resourcePath = string `/shipments/getrates`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetRatesresponse[] response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Voids the specified label by shipmentId.
    #
    remote isolated function voidLabel(string contentType, VoidLabelrequest payload) returns VoidLabelresponse|error {
        string resourcePath = string `/shipments/voidlabel`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        VoidLabelresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get store
    #
    # + storeId - A unique ID generated by ShipStation and assigned to each store. 
    remote isolated function getStore(int storeId) returns GetStoreresponse|error {
        string resourcePath = string `/stores/${storeId}`;
        GetStoreresponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update store
    #
    # + storeId - A unique ID generated by ShipStation and assigned to each store. 
    remote isolated function updateStore(int storeId, string contentType, UpdateStorerequest payload) returns UpdateStoreresponse|error {
        string resourcePath = string `/stores/${storeId}`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateStoreresponse response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieves the refresh status of a given store.
    #
    # + storeId - Specifies the store whose status will be retrieved. 
    remote isolated function getStoreRefreshStatus(int? storeId = ()) returns GetStoreRefreshStatusresponse|error {
        string resourcePath = string `/stores/getrefreshstatus`;
        map<anydata> queryParam = {"storeId": storeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GetStoreRefreshStatusresponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Refresh store
    #
    # + storeId - Specifies the store which will get refreshed.  If the storeId is not specified, a store refresh will be initiated for all refreshable stores on that account. 
    # + refreshDate - Specifies the starting date for new order imports.  If the refreshDate is not specified, ShipStation will use the last recorded refreshDate for that store. 
    remote isolated function refreshStore(string contentType, RefreshStorerequest payload, int? storeId = (), string? refreshDate = ()) returns RefreshStoreresponse|error {
        string resourcePath = string `/stores/refreshstore`;
        map<anydata> queryParam = {"storeId": storeId, "refreshDate": refreshDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RefreshStoreresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve the list of installed stores on the account.
    #
    # + showInactive - Determines whether inactive stores will be returned in the list of stores. 
    # + marketplaceId - Returns stores of this marketplace type. 
    remote isolated function listStores(boolean? showInactive = (), int? marketplaceId = ()) returns ListStoresresponse[]|error {
        string resourcePath = string `/stores`;
        map<anydata> queryParam = {"showInactive": showInactive, "marketplaceId": marketplaceId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListStoresresponse[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lists the marketplaces that can be integrated with ShipStation.
    #
    remote isolated function listMarketplaces() returns ListMarketplacesresponse[]|error {
        string resourcePath = string `/stores/marketplaces`;
        ListMarketplacesresponse[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deactivate store
    #
    remote isolated function deactivateStore(string contentType, DeactivateStorerequest payload) returns DeactivateStoreresponse|error {
        string resourcePath = string `/stores/deactivate`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeactivateStoreresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Reactivate store
    #
    remote isolated function reactivateStore(string contentType, ReactivateStorerequest payload) returns ReactivateStoreresponse|error {
        string resourcePath = string `/stores/reactivate`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ReactivateStoreresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List users
    #
    # + showInactive - Determines whether inactive users will be returned in the response. 
    remote isolated function listUsers(boolean? showInactive = ()) returns ListUsersresponse|error {
        string resourcePath = string `/users`;
        map<anydata> queryParam = {"showInactive": showInactive};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListUsersresponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of active Ship From Locations (formerly known as warehouses) on the ShipStation account. Warehouses are now called "Ship From Locations" in the UI.
    #
    # + warehouseId - A unique ID generated by ShipStation and assigned to each Ship From Location (formerly known as warehouse). 
    remote isolated function getWarehouse(int warehouseId) returns GetWarehouseresponse|error {
        string resourcePath = string `/warehouses/${warehouseId}`;
        GetWarehouseresponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing Ship From Location (formerly known as warehouse).
    #
    # + warehouseId - A unique ID generated by ShipStation and assigned to each Ship From Location (formerly known as warehouse). 
    remote isolated function updateWarehouse(string contentType, int warehouseId, UpdateWarehouserequest payload) returns UpdateWarehouseresponse|error {
        string resourcePath = string `/warehouses/${warehouseId}`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateWarehouseresponse response = check self.clientEp->put(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete warehouse
    #
    # + warehouseId - A unique ID generated by ShipStation and assigned to each Ship From Location (formerly known as warehouse). 
    remote isolated function deleteWarehouse(int warehouseId) returns DeleteWarehouseresponse|error {
        string resourcePath = string `/warehouses/${warehouseId}`;
        DeleteWarehouseresponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Create warehouse
    #
    remote isolated function createWarehouse(string contentType, CreateWarehouserequest payload) returns CreateWarehouseresponse|error {
        string resourcePath = string `/warehouses/createwarehouse`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateWarehouseresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieves a list of your Ship From Locations (formerly known as warehouses).
    #
    remote isolated function listWarehouses() returns ListWarehousesresponse[]|error {
        string resourcePath = string `/warehouses`;
        ListWarehousesresponse[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a list of registered webhooks for the account
    #
    remote isolated function listWebhooks() returns ListWebhooksresponse|error {
        string resourcePath = string `/webhooks`;
        ListWebhooksresponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Subscribe to webhook
    #
    remote isolated function subscribeToWebhook(string contentType, SubscribetoWebhookrequest payload) returns SubscribetoWebhookresponse|error {
        string resourcePath = string `/webhooks/subscribe`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SubscribetoWebhookresponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Unsubscribe to Webhook
    #
    # + webhookId - A unique ID generated by ShipStation and assigned to each webhook. 
    remote isolated function unsubscribeToWebhook(int webhookId, string contentType) returns http:Response|error {
        string resourcePath = string `/webhooks/${webhookId}`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
}
