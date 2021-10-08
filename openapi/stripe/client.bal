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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|http:CredentialsConfig auth;
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

# This is a generated connector for [Stripe API v1](https://stripe.com/docs/api) OpenAPI Specification.
# Stripe offers payment processing software and application programming interfaces for e-commerce websites and mobile applications. 
# The Stripe API is organized around REST. Our API has predictable resource-oriented URLs, accepts form-encoded request bodies, returns JSON-encoded responses, and uses standard HTTP response codes, authentication, and verbs.
@display {label: "Stripe", iconPath: "resources/stripe.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Stripe](https://dashboard.stripe.com/login) account and obtain API Key following [this guide](https://stripe.com/docs/api/authentication). 
    # Provide obtained API Key as the token at connector initialization. Configure required permissions when generating the API Key.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.stripe.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # <p>Returns a list of your coupons.</p>
    #
    # + created - A filter on the list, based on the object `created` field. The value can be a string with an integer Unix timestamp, or it can be a dictionary with a number of different query options. 
    # + endingBefore - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. 
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. 
    # + startingAfter - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. 
    # + return - Successful response. 
    remote isolated function listCoupons(CreatedDetails? created = (), string? endingBefore = (), int? 'limit = (), string? startingAfter = ()) returns InlineResponse2007|error {
        string path = string `/v1/coupons`;
        map<anydata> queryParam = {"created": created, "ending_before": endingBefore, "limit": 'limit, "starting_after": startingAfter};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2007 response = check self.clientEp->get(path, targetType = InlineResponse2007);
        return response;
    }
    # <p>Retrieves the coupon with the given ID.</p>
    #
    # + return - Successful response. 
    remote isolated function getCoupon(string coupon) returns Coupon|error {
        string path = string `/v1/coupons/${coupon}`;
        Coupon response = check self.clientEp->get(path, targetType = Coupon);
        return response;
    }
    # <p>Creates a new customer object.</p>
    #
    # + payload - Customer details 
    # + return - Successful response. 
    remote isolated function createCustomer(V1CustomersBody payload) returns Customer|error {
        string path = string `/v1/customers`;
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        map<Encoding> requestBodyEncoding = {"address": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "invoice_settings": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "preferred_locales": {style: DEEPOBJECT, explode: true}, "shipping": {style: DEEPOBJECT, explode: true}, "tax": {style: DEEPOBJECT, explode: true}, "tax_id_data": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody);
        Customer response = check self.clientEp->post(path, request, targetType = Customer);
        return response;
    }
    # <p>Retrieves the details of an existing customer. You need only supply the unique customer identifier that was returned upon customer creation.</p>
    #
    # + customer - Customer Id 
    # + expand - Specifies which fields in the response should be expanded. 
    # + return - Successful response. 
    remote isolated function getCustomer(string customer, string[]? expand = ()) returns InlineResponse2009|error {
        string path = string `/v1/customers/${customer}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2009 response = check self.clientEp->get(path, targetType = InlineResponse2009);
        return response;
    }
    # <p>Updates the specified customer by setting the values of the parameters passed. Any parameters not provided will be left unchanged. For example, if you pass the <strong>source</strong> parameter, that becomes the customer’s active source (e.g., a card) to be used for all charges in the future. When you update a customer to a new valid card source by passing the <strong>source</strong> parameter: for each of the customer’s current subscriptions, if the subscription bills automatically and is in the <code>past_due</code> state, then the latest open invoice for the subscription with automatic collection enabled will be retried. This retry will not count as an automatic retry, and will not affect the next regularly scheduled payment for the invoice. Changing the <strong>default_source</strong> for a customer will not trigger this behavior.</p>
    # 
    # <p>This request accepts mostly the same arguments as the customer creation call.</p>
    #
    # + customer - Customer Id 
    # + payload - Customer details 
    # + return - Successful response. 
    remote isolated function updateCustomer(string customer, CustomersCustomerBody payload) returns Customer|error {
        string path = string `/v1/customers/${customer}`;
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        map<Encoding> requestBodyEncoding = {"address": {style: DEEPOBJECT, explode: true}, "bank_account": {style: DEEPOBJECT, explode: true}, "card": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "invoice_settings": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "preferred_locales": {style: DEEPOBJECT, explode: true}, "shipping": {style: DEEPOBJECT, explode: true}, "tax": {style: DEEPOBJECT, explode: true}, "trial_end": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody);
        Customer response = check self.clientEp->post(path, request, targetType = Customer);
        return response;
    }
    # <p>Permanently deletes a customer. It cannot be undone. Also immediately cancels any active subscriptions on the customer.</p>
    #
    # + customer - Customer Id 
    # + return - Successful response. 
    remote isolated function deleteCustomer(string customer) returns DeletedCustomer|error {
        string path = string `/v1/customers/${customer}`;
        DeletedCustomer response = check self.clientEp->delete(path, targetType = DeletedCustomer);
        return response;
    }
    # <p>You can list all invoices, or list the invoices for a specific customer. The invoices are returned sorted by creation date, with the most recently created invoices appearing first.</p>
    #
    # + collectionMethod - The collection method of the invoice to retrieve. Either `charge_automatically` or `send_invoice`. 
    # + created - A filter on the list based on the object created field. The value can be a string with an integer Unix timestamp, or it can be a dictionary 
    # + customer - Only return invoices for the customer specified by this customer ID. 
    # + dueDate - A filter on the list based on the object due_date field. The value can be an integer Unix timestamp, or it can be a dictionary 
    # + endingBefore - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. 
    # + expand - Specifies which fields in the response should be expanded. 
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. 
    # + startingAfter - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. 
    # + status - The status of the invoice, one of `draft`, `open`, `paid`, `uncollectible`, or `void`. [Learn more](https://stripe.com/docs/billing/invoices/workflow#workflow-overview) 
    # + subscription - Only return invoices for the subscription specified by this subscription ID. 
    # + return - Successful response. 
    remote isolated function listInvoices(string? collectionMethod = (), Created? created = (), string? customer = (), DueDate? dueDate = (), string? endingBefore = (), string[]? expand = (), int? 'limit = (), string? startingAfter = (), string? status = (), string? subscription = ()) returns InvoicesList|error {
        string path = string `/v1/invoices`;
        map<anydata> queryParam = {"collection_method": collectionMethod, "created": created, "customer": customer, "due_date": dueDate, "ending_before": endingBefore, "expand": expand, "limit": 'limit, "starting_after": startingAfter, "status": status, "subscription": subscription};
        map<Encoding> queryParamEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        InvoicesList response = check self.clientEp->get(path, targetType = InvoicesList);
        return response;
    }
    # <p>Retrieves the invoice with the given ID.</p>
    #
    # + expand - Specifies which fields in the response should be expanded. 
    # + invoice - Invoice Id 
    # + return - Successful response. 
    remote isolated function getInvoice(string invoice, string[]? expand = ()) returns Invoice|error {
        string path = string `/v1/invoices/${invoice}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        Invoice response = check self.clientEp->get(path, targetType = Invoice);
        return response;
    }
    # <p>Returns a list of PaymentMethods for a given Customer</p>
    #
    # + customer - The ID of the customer whose PaymentMethods will be retrieved. 
    # + endingBefore - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. 
    # + expand - Specifies which fields in the response should be expanded. 
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. 
    # + startingAfter - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. 
    # + 'type - A required filter on the list, based on the object `type` field. 
    # + return - Successful response. 
    remote isolated function listPaymentMethods(string customer, string 'type, string? endingBefore = (), string[]? expand = (), int? 'limit = (), string? startingAfter = ()) returns PaymentFlowsPaymentMethodList|error {
        string path = string `/v1/payment_methods`;
        map<anydata> queryParam = {"customer": customer, "ending_before": endingBefore, "expand": expand, "limit": 'limit, "starting_after": startingAfter, "type": 'type};
        map<Encoding> queryParamEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        PaymentFlowsPaymentMethodList response = check self.clientEp->get(path, targetType = PaymentFlowsPaymentMethodList);
        return response;
    }
    # <p>Creates a PaymentMethod object. Read the <a href="/docs/stripe-js/reference#stripe-create-payment-method">Stripe.js reference</a> to learn how to create PaymentMethods via Stripe.js.</p>
    # 
    # <p>Instead of creating a PaymentMethod directly, we recommend using the <a href="/docs/payments/accept-a-payment">PaymentIntents</a> API to accept a payment immediately or the <a href="/docs/payments/save-and-reuse">SetupIntent</a> API to collect payment method details ahead of a future payment.</p>
    #
    # + payload - Payment method details 
    # + return - Successful response. 
    remote isolated function createPaymentMethod(V1PaymentMethodsBody payload) returns PaymentMethod|error {
        string path = string `/v1/payment_methods`;
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        map<Encoding> requestBodyEncoding = {"acss_debit": {style: DEEPOBJECT, explode: true}, "afterpay_clearpay": {style: DEEPOBJECT, explode: true}, "alipay": {style: DEEPOBJECT, explode: true}, "au_becs_debit": {style: DEEPOBJECT, explode: true}, "bacs_debit": {style: DEEPOBJECT, explode: true}, "bancontact": {style: DEEPOBJECT, explode: true}, "billing_details": {style: DEEPOBJECT, explode: true}, "boleto": {style: DEEPOBJECT, explode: true}, "card": {style: DEEPOBJECT, explode: true}, "eps": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "fpx": {style: DEEPOBJECT, explode: true}, "giropay": {style: DEEPOBJECT, explode: true}, "grabpay": {style: DEEPOBJECT, explode: true}, "ideal": {style: DEEPOBJECT, explode: true}, "interac_present": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "oxxo": {style: DEEPOBJECT, explode: true}, "p24": {style: DEEPOBJECT, explode: true}, "sepa_debit": {style: DEEPOBJECT, explode: true}, "sofort": {style: DEEPOBJECT, explode: true}, "wechat_pay": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody);
        PaymentMethod response = check self.clientEp->post(path, request, targetType = PaymentMethod);
        return response;
    }
    # <p>Retrieves a PaymentMethod object.</p>
    #
    # + expand - Specifies which fields in the response should be expanded. 
    # + paymentMethod - Payment method Id 
    # + return - Successful response. 
    remote isolated function getPaymentMethod(string paymentMethod, string[]? expand = ()) returns PaymentMethod|error {
        string path = string `/v1/payment_methods/${paymentMethod}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        PaymentMethod response = check self.clientEp->get(path, targetType = PaymentMethod);
        return response;
    }
    # <p>Updates a PaymentMethod object. A PaymentMethod must be attached a customer to be updated.</p>
    #
    # + paymentMethod - Payment method Id 
    # + payload - Payment method details 
    # + return - Successful response. 
    remote isolated function updatePaymentMethod(string paymentMethod, PaymentMethodsPaymentMethodBody payload) returns PaymentMethod|error {
        string path = string `/v1/payment_methods/${paymentMethod}`;
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        map<Encoding> requestBodyEncoding = {"billing_details": {style: DEEPOBJECT, explode: true}, "card": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody);
        PaymentMethod response = check self.clientEp->post(path, request, targetType = PaymentMethod);
        return response;
    }
    # <p>Attaches a PaymentMethod object to a Customer.</p>
    # 
    # <p>To attach a new PaymentMethod to a customer for future payments, we recommend you use a <a href="/docs/api/setup_intents">SetupIntent</a>
    # or a PaymentIntent with <a href="/docs/api/payment_intents/create#create_payment_intent-setup_future_usage">setup_future_usage</a>.
    # These approaches will perform any necessary steps to ensure that the PaymentMethod can be used in a future payment. Using the
    # <code>/v1/payment_methods/:id/attach</code> endpoint does not ensure that future payments can be made with the attached PaymentMethod.
    # See <a href="/docs/payments/payment-intents#future-usage">Optimizing cards for future payments</a> for more information about setting up future payments.</p>
    # 
    # <p>To use this PaymentMethod as the default for invoice or subscription payments,
    # set <a href="/docs/api/customers/update#update_customer-invoice_settings-default_payment_method"><code>invoice_settings.default_payment_method</code></a>,
    # on the Customer to the PaymentMethod’s ID.</p>
    #
    # + paymentMethod - Payment method Id 
    # + payload - The ID of the customer to which to attach the PaymentMethod 
    # + return - Successful response. 
    remote isolated function attachPaymentMethodtoCustomer(string paymentMethod, PaymentMethodAttachBody payload) returns PaymentMethod|error {
        string path = string `/v1/payment_methods/${paymentMethod}/attach`;
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        PaymentMethod response = check self.clientEp->post(path, request, targetType = PaymentMethod);
        return response;
    }
    # <p>Detaches a PaymentMethod object from a Customer.</p>
    #
    # + paymentMethod - Payment method Id 
    # + payload - Additional details 
    # + return - Successful response. 
    remote isolated function detachPaymentMethodfromCustomer(string paymentMethod, PaymentMethodDetachBody payload) returns PaymentMethod|error {
        string path = string `/v1/payment_methods/${paymentMethod}/detach`;
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody);
        PaymentMethod response = check self.clientEp->post(path, request, targetType = PaymentMethod);
        return response;
    }
    # <p>Creates a new price for an existing product. The price can be recurring or one-time.</p>
    #
    # + payload - Price details 
    # + return - Successful response. 
    remote isolated function createPrice(V1PricesBody payload) returns Price|error {
        string path = string `/v1/prices`;
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "product_data": {style: DEEPOBJECT, explode: true}, "recurring": {style: DEEPOBJECT, explode: true}, "tiers": {style: DEEPOBJECT, explode: true}, "transform_quantity": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody);
        Price response = check self.clientEp->post(path, request, targetType = Price);
        return response;
    }
    # <p>Updates the specified price by setting the values of the parameters passed. Any parameters not provided are left unchanged.</p>
    #
    # + price - Price Id 
    # + payload - Price details 
    # + return - Successful response. 
    remote isolated function updatePrice(string price, PricesPriceBody payload) returns Price|error {
        string path = string `/v1/prices/${price}`;
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody);
        Price response = check self.clientEp->post(path, request, targetType = Price);
        return response;
    }
    # <p>Creates a new product object.</p>
    #
    # + payload - Product details 
    # + return - Successful response. 
    remote isolated function createProduct(V1ProductsBody payload) returns Product|error {
        string path = string `/v1/products`;
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}, "images": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "package_dimensions": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody);
        Product response = check self.clientEp->post(path, request, targetType = Product);
        return response;
    }
    # <p>Updates the specific product by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>
    #
    # + id - Product Id 
    # + payload - Product details 
    # + return - Successful response. 
    remote isolated function updateProduct(string id, ProductsIdBody payload) returns Product|error {
        string path = string `/v1/products/${id}`;
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}, "images": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "package_dimensions": {style: DEEPOBJECT, explode: true}, "tax_code": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody);
        Product response = check self.clientEp->post(path, request, targetType = Product);
        return response;
    }
    # <p>Updates the plan or quantity of an item on a current subscription.</p>
    #
    # + item - Subscription item Id 
    # + payload - Subscription item details 
    # + return - Successful response. 
    remote isolated function updateSubscriptionItem(string item, SubscriptionItemsItemBody payload) returns SubscriptionItem|error {
        string path = string `/v1/subscription_items/${item}`;
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        map<Encoding> requestBodyEncoding = {"billing_thresholds": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "price_data": {style: DEEPOBJECT, explode: true}, "tax_rates": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody);
        SubscriptionItem response = check self.clientEp->post(path, request, targetType = SubscriptionItem);
        return response;
    }
    # <p>Creates a usage record for a specified subscription item and date, and fills it with a quantity.</p>
    # 
    # <p>Usage records provide <code>quantity</code> information that Stripe uses to track how much a customer is using your service. With usage information and the pricing model set up by the <a href="https://stripe.com/docs/billing/subscriptions/metered-billing">metered billing</a> plan, Stripe helps you send accurate invoices to your customers.</p>
    # 
    # <p>The default calculation for usage is to add up all the <code>quantity</code> values of the usage records within a billing period. You can change this default behavior with the billing plan’s <code>aggregate_usage</code> <a href="/docs/api/plans/create#create_plan-aggregate_usage">parameter</a>. When there is more than one usage record with the same timestamp, Stripe adds the <code>quantity</code> values together. In most cases, this is the desired resolution, however, you can change this behavior with the <code>action</code> parameter.</p>
    # 
    # <p>The default pricing model for metered billing is <a href="/docs/api/plans/object#plan_object-billing_scheme">per-unit pricing</a>. For finer granularity, you can configure metered billing to have a <a href="https://stripe.com/docs/billing/subscriptions/tiers">tiered pricing</a> model.</p>
    #
    # + subscriptionItem - Subscription item Id 
    # + payload - Usage record details 
    # + return - Successful response. 
    remote isolated function createSubscriptionItemUsageRecord(string subscriptionItem, SubscriptionItemUsageRecordsBody payload) returns UsageRecord|error {
        string path = string `/v1/subscription_items/${subscriptionItem}/usage_records`;
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody);
        UsageRecord response = check self.clientEp->post(path, request, targetType = UsageRecord);
        return response;
    }
    # <p>By default, returns a list of subscriptions that have not been canceled. In order to list canceled subscriptions, specify <code>status=canceled</code>.</p>
    #
    # + collectionMethod - The collection method of the subscriptions to retrieve. Either `charge_automatically` or `send_invoice`. 
    # + created - Time at which the object was created. Measured in seconds since the Unix epoch 
    # + currentPeriodEnd - A filter on the list based on the object current_period_end field. The value can be a string with an integer Unix timestamp, or it can be a dictionary 
    # + currentPeriodStart - A filter on the list based on the object current_period_start field. The value can be a string with an integer Unix timestamp, or it can be a dictionary 
    # + customer - The ID of the customer whose subscriptions will be retrieved. 
    # + endingBefore - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. 
    # + expand - Specifies which fields in the response should be expanded. 
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. 
    # + price - Filter for subscriptions that contain this recurring price ID. 
    # + startingAfter - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. 
    # + status - The status of the subscriptions to retrieve. Passing in a value of `canceled` will return all canceled subscriptions, including those belonging to deleted customers. Pass `ended` to find subscriptions that are canceled and subscriptions that are expired due to [incomplete payment](https://stripe.com/docs/billing/subscriptions/overview#subscription-statuses). Passing in a value of `all` will return subscriptions of all statuses. If no value is supplied, all subscriptions that have not been canceled are returned. 
    # + return - Successful response. 
    remote isolated function listSubscriptions(string? collectionMethod = (), Created1? created = (), CurrentPeriodEnd? currentPeriodEnd = (), CurrentPeriodStart? currentPeriodStart = (), string? customer = (), string? endingBefore = (), string[]? expand = (), int? 'limit = (), string? price = (), string? startingAfter = (), string? status = ()) returns InlineResponse20041|error {
        string path = string `/v1/subscriptions`;
        map<anydata> queryParam = {"collection_method": collectionMethod, "created": created, "current_period_end": currentPeriodEnd, "current_period_start": currentPeriodStart, "customer": customer, "ending_before": endingBefore, "expand": expand, "limit": 'limit, "price": price, "starting_after": startingAfter, "status": status};
        map<Encoding> queryParamEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20041 response = check self.clientEp->get(path, targetType = InlineResponse20041);
        return response;
    }
    # <p>Creates a new subscription on an existing customer. Each customer can have up to 500 active or scheduled subscriptions.</p>
    #
    # + payload - Subscription details 
    # + return - Successful response. 
    remote isolated function createSubscriptions(V1SubscriptionsBody payload) returns Subscription|error {
        string path = string `/v1/subscriptions`;
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        map<Encoding> requestBodyEncoding = {"add_invoice_items": {style: DEEPOBJECT, explode: true}, "automatic_tax": {style: DEEPOBJECT, explode: true}, "billing_thresholds": {style: DEEPOBJECT, explode: true}, "default_tax_rates": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "items": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "payment_settings": {style: DEEPOBJECT, explode: true}, "pending_invoice_item_interval": {style: DEEPOBJECT, explode: true}, "transfer_data": {style: DEEPOBJECT, explode: true}, "trial_end": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody);
        Subscription response = check self.clientEp->post(path, request, targetType = Subscription);
        return response;
    }
    # <p>Retrieves the subscription with the given ID.</p>
    #
    # + expand - Specifies which fields in the response should be expanded. 
    # + subscriptionExposedId - Subscription Id 
    # + return - Successful response. 
    remote isolated function getSubscription(string subscriptionExposedId, string[]? expand = ()) returns Subscription|error {
        string path = string `/v1/subscriptions/${subscriptionExposedId}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        Subscription response = check self.clientEp->get(path, targetType = Subscription);
        return response;
    }
    # <p>Updates an existing subscription on a customer to match the specified parameters. When changing plans or quantities, we will optionally prorate the price we charge next month to make up for any price changes. To preview how the proration will be calculated, use the <a href="#upcoming_invoice">upcoming invoice</a> endpoint.</p>
    #
    # + subscriptionExposedId - Subscription Id 
    # + payload - Subscription details 
    # + return - Successful response. 
    remote isolated function updateSubscription(string subscriptionExposedId, SubscriptionsSubscriptionExposedIdBody2 payload) returns Subscription|error {
        string path = string `/v1/subscriptions/${subscriptionExposedId}`;
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        map<Encoding> requestBodyEncoding = {"add_invoice_items": {style: DEEPOBJECT, explode: true}, "automatic_tax": {style: DEEPOBJECT, explode: true}, "billing_thresholds": {style: DEEPOBJECT, explode: true}, "cancel_at": {style: DEEPOBJECT, explode: true}, "default_tax_rates": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "items": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "pause_collection": {style: DEEPOBJECT, explode: true}, "payment_settings": {style: DEEPOBJECT, explode: true}, "pending_invoice_item_interval": {style: DEEPOBJECT, explode: true}, "transfer_data": {style: DEEPOBJECT, explode: true}, "trial_end": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody);
        Subscription response = check self.clientEp->post(path, request, targetType = Subscription);
        return response;
    }
    # <p>Cancels a customer’s subscription immediately. The customer will not be charged again for the subscription.</p>
    # 
    # <p>Note, however, that any pending invoice items that you’ve created will still be charged for at the end of the period, unless manually <a href="#delete_invoiceitem">deleted</a>. If you’ve set the subscription to cancel at the end of the period, any pending prorations will also be left in place and collected at the end of the period. But if the subscription is set to cancel immediately, pending prorations will be removed.</p>
    # 
    # <p>By default, upon subscription cancellation, Stripe will stop automatic collection of all finalized invoices for the customer. This is intended to prevent unexpected payment attempts after the customer has canceled a subscription. However, you can resume automatic collection of the invoices manually after subscription cancellation to have us proceed. Or, you could check for unpaid invoices before allowing the customer to cancel the subscription at all.</p>
    #
    # + subscriptionExposedId - subscription Id 
    # + payload - Subscription cancelation details 
    # + return - Successful response. 
    remote isolated function deleteSubscription(string subscriptionExposedId, SubscriptionsSubscriptionExposedIdBody3 payload) returns Subscription|error {
        string path = string `/v1/subscriptions/${subscriptionExposedId}`;
        http:Request request = new;
        check request.setContentType("application/x-www-form-urlencoded");
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody);
        Subscription response = check self.clientEp->delete(path, request, targetType = Subscription);
        return response;
    }
}
