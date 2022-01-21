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
@display {label: "Stripe", iconPath: "icon.png"}
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
        return;
    }
    # <p>Returns a list of your coupons.</p>
    #
    # + created - A filter on the list, based on the object `created` field. The value can be a string with an integer Unix timestamp, or it can be a dictionary with a number of different query options. 
    # + endingBefore - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. 
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. 
    # + startingAfter - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. 
    # + return - Successful response. 
    remote isolated function listCoupons(CreatedDetails? created = (), string? endingBefore = (), int? 'limit = (), string? startingAfter = ()) returns InlineResponse200|error {
        string resourcePath = string `/v1/coupons`;
        map<anydata> queryParam = {"created": created, "ending_before": endingBefore, "limit": 'limit, "starting_after": startingAfter};
        map<Encoding> queryParamEncoding = {"created": {style: DEEPOBJECT, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # <p>Retrieves the coupon with the given ID.</p>
    #
    # + coupon - Coupon Id 
    # + return - Successful response. 
    remote isolated function getCoupon(string coupon) returns Coupon|error {
        string resourcePath = string `/v1/coupons/${coupon}`;
        Coupon response = check self.clientEp->get(resourcePath);
        return response;
    }
    # <p>Creates a new customer object.</p>
    #
    # + payload - Customer details 
    # + return - Successful response. 
    remote isolated function createCustomer(V1CustomersBody payload) returns Customer|error {
        string resourcePath = string `/v1/customers`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"address": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "invoice_settings": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "preferred_locales": {style: DEEPOBJECT, explode: true}, "shipping": {style: DEEPOBJECT, explode: true}, "tax": {style: DEEPOBJECT, explode: true}, "tax_id_data": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Retrieves the details of an existing customer. You need only supply the unique customer identifier that was returned upon customer creation.</p>
    #
    # + customer - Customer Id 
    # + expand - Specifies which fields in the response should be expanded. 
    # + return - Successful response. 
    remote isolated function getCustomer(string customer, string[]? expand = ()) returns InlineResponse2001|error {
        string resourcePath = string `/v1/customers/${customer}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v1/customers/${customer}`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"address": {style: DEEPOBJECT, explode: true}, "bank_account": {style: DEEPOBJECT, explode: true}, "card": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "invoice_settings": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "preferred_locales": {style: DEEPOBJECT, explode: true}, "shipping": {style: DEEPOBJECT, explode: true}, "tax": {style: DEEPOBJECT, explode: true}, "trial_end": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Customer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Permanently deletes a customer. It cannot be undone. Also immediately cancels any active subscriptions on the customer.</p>
    #
    # + customer - Customer Id 
    # + return - Successful response. 
    remote isolated function deleteCustomer(string customer) returns DeletedCustomer|error {
        string resourcePath = string `/v1/customers/${customer}`;
        DeletedCustomer response = check self.clientEp->delete(resourcePath);
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
        string resourcePath = string `/v1/invoices`;
        map<anydata> queryParam = {"collection_method": collectionMethod, "created": created, "customer": customer, "due_date": dueDate, "ending_before": endingBefore, "expand": expand, "limit": 'limit, "starting_after": startingAfter, "status": status, "subscription": subscription};
        map<Encoding> queryParamEncoding = {"created": {style: DEEPOBJECT, explode: true}, "due_date": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InvoicesList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # <p>This endpoint creates a draft invoice for a given customer. The draft invoice created pulls in all pending invoice items on that customer, including prorations. The invoice remains a draft until you <a href="#finalize_invoice">finalize</a> the invoice, which allows you to <a href="#pay_invoice">pay</a> or <a href="#send_invoice">send</a> the invoice to your customers.</p>
    #
    # + payload - Invoice details 
    # + return - Successful response. 
    remote isolated function createInvoice(V1InvoicesBody payload) returns Invoice|error {
        string resourcePath = string `/v1/invoices`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"account_tax_ids": {style: DEEPOBJECT, explode: true}, "automatic_tax": {style: DEEPOBJECT, explode: true}, "custom_fields": {style: DEEPOBJECT, explode: true}, "default_tax_rates": {style: DEEPOBJECT, explode: true}, "discounts": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "payment_settings": {style: DEEPOBJECT, explode: true}, "transfer_data": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Invoice response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Retrieves the invoice with the given ID.</p>
    #
    # + expand - Specifies which fields in the response should be expanded. 
    # + invoice - Invoice Id 
    # + return - Successful response. 
    remote isolated function getInvoice(string invoice, string[]? expand = ()) returns Invoice|error {
        string resourcePath = string `/v1/invoices/${invoice}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Invoice response = check self.clientEp->get(resourcePath);
        return response;
    }
    # <p>Draft invoices are fully editable. Once an invoice is <a href="/docs/billing/invoices/workflow#finalized">finalized</a>,
    # monetary values, as well as <code>collection_method</code>, become uneditable.</p>
    # 
    # <p>If you would like to stop the Stripe Billing engine from automatically finalizing, reattempting payments on,
    # sending reminders for, or <a href="/docs/billing/invoices/reconciliation">automatically reconciling</a> invoices, pass
    # <code>auto_advance=false</code>.</p>
    #
    # + invoice - Invoice Id 
    # + payload - Invoice details 
    # + return - Successful response. 
    remote isolated function updateInvoice(string invoice, InvoicesInvoiceBody payload) returns Invoice|error {
        string resourcePath = string `/v1/invoices/${invoice}`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"account_tax_ids": {style: DEEPOBJECT, explode: true}, "automatic_tax": {style: DEEPOBJECT, explode: true}, "custom_fields": {style: DEEPOBJECT, explode: true}, "default_tax_rates": {style: DEEPOBJECT, explode: true}, "discounts": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "on_behalf_of": {style: DEEPOBJECT, explode: true}, "payment_settings": {style: DEEPOBJECT, explode: true}, "transfer_data": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Invoice response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Permanently deletes a one-off invoice draft. This cannot be undone. Attempts to delete invoices that are no longer in a draft state will fail; once an invoice has been finalized or if an invoice is for a subscription, it must be <a href="#void_invoice">voided</a>.</p>
    #
    # + invoice - Invoice Id 
    # + return - Successful response. 
    remote isolated function deleteInvoice(string invoice) returns DeletedInvoice|error {
        string resourcePath = string `/v1/invoices/${invoice}`;
        DeletedInvoice response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # <p>Stripe automatically creates and then attempts to collect payment on invoices for customers on subscriptions according to your <a href="https://dashboard.stripe.com/account/billing/automatic">subscriptions settings</a>. However, if you’d like to attempt payment on an invoice out of the normal collection schedule or for some other reason, you can do so.</p>
    #
    # + invoice - Invoice Id 
    # + payload - Invoice payment details 
    # + return - Successful response. 
    remote isolated function payInvoice(string invoice, InvoicePayBody payload) returns Invoice|error {
        string resourcePath = string `/v1/invoices/${invoice}/pay`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Invoice response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Stripe will automatically send invoices to customers according to your <a href="https://dashboard.stripe.com/account/billing/automatic">subscriptions settings</a>. However, if you’d like to manually send an invoice to your customer out of the normal schedule, you can do so. When sending invoices that have already been paid, there will be no reference to the payment in the email.</p>
    # 
    # <p>Requests made in test-mode result in no emails being sent, despite sending an <code>invoice.sent</code> event.</p>
    #
    # + invoice - Invoice Id 
    # + payload - Invoice details 
    # + return - Successful response. 
    remote isolated function sendInvoice(string invoice, InvoiceSendBody payload) returns Invoice|error {
        string resourcePath = string `/v1/invoices/${invoice}/send`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Invoice response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Mark a finalized invoice as void. This cannot be undone. Voiding an invoice is similar to <a href="#delete_invoice">deletion</a>, however it only applies to finalized invoices and maintains a papertrail where the invoice can still be found.</p>
    #
    # + invoice - Invoice Id 
    # + payload - Invoice details 
    # + return - Successful response. 
    remote isolated function voidInvoice(string invoice, InvoiceVoidBody payload) returns Invoice|error {
        string resourcePath = string `/v1/invoices/${invoice}/void`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Invoice response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Marking an invoice as uncollectible is useful for keeping track of bad debts that can be written off for accounting purposes.</p>
    #
    # + invoice - Invoice Id 
    # + payload - Invoice details 
    # + return - Successful response. 
    remote isolated function markInvoiceUncollectable(string invoice, InvoiceMarkUncollectibleBody payload) returns Invoice|error {
        string resourcePath = string `/v1/invoices/${invoice}/mark_uncollectible`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Invoice response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>When retrieving an invoice, you’ll get a <strong>lines</strong> property containing the total count of line items and the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.</p>
    #
    # + endingBefore - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. 
    # + invoice - Invoice Id 
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. 
    # + startingAfter - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. 
    # + return - Successful response. 
    remote isolated function getInvoicesInvoiceLines(string invoice, string? endingBefore = (), int? 'limit = (), string? startingAfter = ()) returns InvoiceLinesList|error {
        string resourcePath = string `/v1/invoices/${invoice}/lines`;
        map<anydata> queryParam = {"ending_before": endingBefore, "limit": 'limit, "starting_after": startingAfter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InvoiceLinesList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # <p>At any time, you can preview the upcoming invoice for a customer. This will show you all the charges that are pending, including subscription renewal charges, invoice item charges, etc. It will also show you any discounts that are applicable to the invoice.</p>
    # 
    # <p>Note that when you are viewing an upcoming invoice, you are simply viewing a preview – the invoice has not yet been created. As such, the upcoming invoice will not show up in invoice listing calls, and you cannot use the API to pay or edit the invoice. If you want to change the amount that your customer will be billed, you can add, remove, or update pending invoice items, or update the customer’s discount.</p>
    # 
    # <p>You can preview the effects of updating a subscription, including a preview of what proration will take place. To ensure that the actual proration is calculated exactly the same as the previewed proration, you should pass a <code>proration_date</code> parameter when doing the actual subscription update. The value passed in should be the same as the <code>subscription_proration_date</code> returned on the upcoming invoice resource. The recommended way to get only the prorations being previewed is to consider only proration line items where <code>period[start]</code> is equal to the <code>subscription_proration_date</code> on the upcoming invoice resource.</p>
    #
    # + automaticTax - Settings for automatic tax lookup for this invoice preview. 
    # + coupon - The code of the coupon to apply. If `subscription` or `subscription_items` is provided, the invoice returned will preview updating or creating a subscription with that coupon. Otherwise, it will preview applying that coupon to the customer for the next upcoming invoice from among the customer's subscriptions. The invoice can be previewed without a coupon by passing this value as an empty string. 
    # + customer - The identifier of the customer whose upcoming invoice you'd like to retrieve. 
    # + customerDetails - Details about the customer you want to invoice or overrides for an existing customer. 
    # + discounts - The coupons to redeem into discounts for the invoice preview. If not specified, inherits the discount from the customer or subscription. Pass an empty string to avoid inheriting any discounts. To preview the upcoming invoice for a subscription that hasn't been created, use `coupon` instead. 
    # + invoiceItems - List of invoice items to add or update in the upcoming invoice preview. 
    # + schedule - The identifier of the unstarted schedule whose upcoming invoice you'd like to retrieve. Cannot be used with subscription or subscription fields. 
    # + subscription - The identifier of the subscription for which you'd like to retrieve the upcoming invoice. If not provided, but a `subscription_items` is provided, you will preview creating a subscription with those items. If neither `subscription` nor `subscription_items` is provided, you will retrieve the next upcoming invoice from among the customer's subscriptions. 
    # + subscriptionBillingCycleAnchor - For new subscriptions, a future timestamp to anchor the subscription's [billing cycle](https://stripe.com/docs/subscriptions/billing-cycle). This is used to determine the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices. For existing subscriptions, the value can only be set to `now` or `unchanged`. 
    # + subscriptionCancelAt - Timestamp indicating when the subscription should be scheduled to cancel. Will prorate if within the current period and prorations have been enabled using `proration_behavior`. 
    # + subscriptionCancelAtPeriodEnd - Boolean indicating whether this subscription should cancel at the end of the current period. 
    # + subscriptionCancelNow - This simulates the subscription being canceled or expired immediately. 
    # + subscriptionDefaultTaxRates - If provided, the invoice returned will preview updating or creating a subscription with these default tax rates. The default tax rates will apply to any line item that does not have `tax_rates` set. 
    # + subscriptionItems - A list of up to 20 subscription items, each with an attached price. 
    # + subscriptionProrationBehavior - Determines how to handle [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) when the billing cycle changes (e.g., when switching plans, resetting `billing_cycle_anchor=now`, or starting a trial), or if an item's `quantity` changes. Valid values are `create_prorations`, `none`, or `always_invoice`. Passing `create_prorations` will cause proration invoice items to be created when applicable. These proration items will only be invoiced immediately under [certain conditions](https://stripe.com/docs/subscriptions/upgrading-downgrading#immediate-payment). In order to always invoice immediately for prorations, pass `always_invoice`. Prorations can be disabled by passing `none`. 
    # + subscriptionProrationDate - If previewing an update to a subscription, and doing proration, `subscription_proration_date` forces the proration to be calculated as though the update was done at the specified time. The time given must be within the current subscription period, and cannot be before the subscription was on its current plan. If set, `subscription`, and one of `subscription_items`, or `subscription_trial_end` are required. Also, `subscription_proration_behavior` cannot be set to 'none'. 
    # + subscriptionStartDate - Date a subscription is intended to start (can be future or past) 
    # + subscriptionTrialEnd - If provided, the invoice returned will preview updating or creating a subscription with that trial end. If set, one of `subscription_items` or `subscription` is required. 
    # + subscriptionTrialFromPlan - Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting `subscription_trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to `true` together with `subscription_trial_end` is not allowed. 
    # + return - Successful response. 
    remote isolated function getInvoicesUpcoming(AutomaticTaxParam1? automaticTax = (), string? coupon = (), string? customer = (), CustomerDetailsParam? customerDetails = (), Discounts? discounts = (), InvoiceItemPreviewParams[]? invoiceItems = (), string? schedule = (), string? subscription = (), SubscriptionBillingCycleAnchor? subscriptionBillingCycleAnchor = (), SubscriptionCancelAt? subscriptionCancelAt = (), boolean? subscriptionCancelAtPeriodEnd = (), boolean? subscriptionCancelNow = (), SubscriptionDefaultTaxRates? subscriptionDefaultTaxRates = (), GetInvoicesUpcomingRequestBody[]? subscriptionItems = (), string? subscriptionProrationBehavior = (), int? subscriptionProrationDate = (), int? subscriptionStartDate = (), SubscriptionTrialEnd? subscriptionTrialEnd = (), boolean? subscriptionTrialFromPlan = ()) returns Invoice|error {
        string resourcePath = string `/v1/invoices/upcoming`;
        map<anydata> queryParam = {"automatic_tax": automaticTax, "coupon": coupon, "customer": customer, "customer_details": customerDetails, "discounts": discounts, "invoice_items": invoiceItems, "schedule": schedule, "subscription": subscription, "subscription_billing_cycle_anchor": subscriptionBillingCycleAnchor, "subscription_cancel_at": subscriptionCancelAt, "subscription_cancel_at_period_end": subscriptionCancelAtPeriodEnd, "subscription_cancel_now": subscriptionCancelNow, "subscription_default_tax_rates": subscriptionDefaultTaxRates, "subscription_items": subscriptionItems, "subscription_proration_behavior": subscriptionProrationBehavior, "subscription_proration_date": subscriptionProrationDate, "subscription_start_date": subscriptionStartDate, "subscription_trial_end": subscriptionTrialEnd, "subscription_trial_from_plan": subscriptionTrialFromPlan};
        map<Encoding> queryParamEncoding = {"automatic_tax": {style: DEEPOBJECT, explode: true}, "customer_details": {style: DEEPOBJECT, explode: true}, "discounts": {style: DEEPOBJECT, explode: true}, "invoice_items": {style: DEEPOBJECT, explode: true}, "subscription_billing_cycle_anchor": {style: DEEPOBJECT, explode: true}, "subscription_cancel_at": {style: DEEPOBJECT, explode: true}, "subscription_default_tax_rates": {style: DEEPOBJECT, explode: true}, "subscription_items": {style: DEEPOBJECT, explode: true}, "subscription_trial_end": {style: DEEPOBJECT, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Invoice response = check self.clientEp->get(resourcePath);
        return response;
    }
    # <p>When retrieving an upcoming invoice, you’ll get a <strong>lines</strong> property containing the total count of line items and the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.</p>
    #
    # + automaticTax - Settings for automatic tax lookup for this invoice preview. 
    # + coupon - The code of the coupon to apply. If `subscription` or `subscription_items` is provided, the invoice returned will preview updating or creating a subscription with that coupon. Otherwise, it will preview applying that coupon to the customer for the next upcoming invoice from among the customer's subscriptions. The invoice can be previewed without a coupon by passing this value as an empty string. 
    # + customer - The identifier of the customer whose upcoming invoice you'd like to retrieve. 
    # + customerDetails - Details about the customer you want to invoice or overrides for an existing customer. 
    # + discounts - The coupons to redeem into discounts for the invoice preview. If not specified, inherits the discount from the customer or subscription. Pass an empty string to avoid inheriting any discounts. To preview the upcoming invoice for a subscription that hasn't been created, use `coupon` instead. 
    # + endingBefore - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. 
    # + invoiceItems - List of invoice items to add or update in the upcoming invoice preview. 
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. 
    # + schedule - The identifier of the unstarted schedule whose upcoming invoice you'd like to retrieve. Cannot be used with subscription or subscription fields. 
    # + startingAfter - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. 
    # + subscription - The identifier of the subscription for which you'd like to retrieve the upcoming invoice. If not provided, but a `subscription_items` is provided, you will preview creating a subscription with those items. If neither `subscription` nor `subscription_items` is provided, you will retrieve the next upcoming invoice from among the customer's subscriptions. 
    # + subscriptionBillingCycleAnchor - For new subscriptions, a future timestamp to anchor the subscription's [billing cycle](https://stripe.com/docs/subscriptions/billing-cycle). This is used to determine the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices. For existing subscriptions, the value can only be set to `now` or `unchanged`. 
    # + subscriptionCancelAt - Timestamp indicating when the subscription should be scheduled to cancel. Will prorate if within the current period and prorations have been enabled using `proration_behavior`. 
    # + subscriptionCancelAtPeriodEnd - Boolean indicating whether this subscription should cancel at the end of the current period. 
    # + subscriptionCancelNow - This simulates the subscription being canceled or expired immediately. 
    # + subscriptionDefaultTaxRates - If provided, the invoice returned will preview updating or creating a subscription with these default tax rates. The default tax rates will apply to any line item that does not have `tax_rates` set. 
    # + subscriptionItems - A list of up to 20 subscription items, each with an attached price. 
    # + subscriptionProrationBehavior - Determines how to handle [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) when the billing cycle changes (e.g., when switching plans, resetting `billing_cycle_anchor=now`, or starting a trial), or if an item's `quantity` changes. Valid values are `create_prorations`, `none`, or `always_invoice`. Passing `create_prorations` will cause proration invoice items to be created when applicable. These proration items will only be invoiced immediately under [certain conditions](https://stripe.com/docs/subscriptions/upgrading-downgrading#immediate-payment). In order to always invoice immediately for prorations, pass `always_invoice`. Prorations can be disabled by passing `none`. 
    # + subscriptionProrationDate - If previewing an update to a subscription, and doing proration, `subscription_proration_date` forces the proration to be calculated as though the update was done at the specified time. The time given must be within the current subscription period, and cannot be before the subscription was on its current plan. If set, `subscription`, and one of `subscription_items`, or `subscription_trial_end` are required. Also, `subscription_proration_behavior` cannot be set to 'none'. 
    # + subscriptionStartDate - Date a subscription is intended to start (can be future or past) 
    # + subscriptionTrialEnd - If provided, the invoice returned will preview updating or creating a subscription with that trial end. If set, one of `subscription_items` or `subscription` is required. 
    # + subscriptionTrialFromPlan - Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting `subscription_trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to `true` together with `subscription_trial_end` is not allowed. 
    # + return - Successful response. 
    remote isolated function getInvoicesUpcomingLines(AutomaticTaxParam2? automaticTax = (), string? coupon = (), string? customer = (), CustomerDetailsParam1? customerDetails = (), Discounts1? discounts = (), string? endingBefore = (), InvoiceItemPreviewParams[]? invoiceItems = (), int? 'limit = (), string? schedule = (), string? startingAfter = (), string? subscription = (), SubscriptionBillingCycleAnchor1? subscriptionBillingCycleAnchor = (), SubscriptionCancelAt1? subscriptionCancelAt = (), boolean? subscriptionCancelAtPeriodEnd = (), boolean? subscriptionCancelNow = (), SubscriptionDefaultTaxRates1? subscriptionDefaultTaxRates = (), GetInvoicesUpcomingRequestBody[]? subscriptionItems = (), string? subscriptionProrationBehavior = (), int? subscriptionProrationDate = (), int? subscriptionStartDate = (), SubscriptionTrialEnd1? subscriptionTrialEnd = (), boolean? subscriptionTrialFromPlan = ()) returns InvoiceLinesList|error {
        string resourcePath = string `/v1/invoices/upcoming/lines`;
        map<anydata> queryParam = {"automatic_tax": automaticTax, "coupon": coupon, "customer": customer, "customer_details": customerDetails, "discounts": discounts, "ending_before": endingBefore, "invoice_items": invoiceItems, "limit": 'limit, "schedule": schedule, "starting_after": startingAfter, "subscription": subscription, "subscription_billing_cycle_anchor": subscriptionBillingCycleAnchor, "subscription_cancel_at": subscriptionCancelAt, "subscription_cancel_at_period_end": subscriptionCancelAtPeriodEnd, "subscription_cancel_now": subscriptionCancelNow, "subscription_default_tax_rates": subscriptionDefaultTaxRates, "subscription_items": subscriptionItems, "subscription_proration_behavior": subscriptionProrationBehavior, "subscription_proration_date": subscriptionProrationDate, "subscription_start_date": subscriptionStartDate, "subscription_trial_end": subscriptionTrialEnd, "subscription_trial_from_plan": subscriptionTrialFromPlan};
        map<Encoding> queryParamEncoding = {"automatic_tax": {style: DEEPOBJECT, explode: true}, "customer_details": {style: DEEPOBJECT, explode: true}, "discounts": {style: DEEPOBJECT, explode: true}, "invoice_items": {style: DEEPOBJECT, explode: true}, "subscription_billing_cycle_anchor": {style: DEEPOBJECT, explode: true}, "subscription_cancel_at": {style: DEEPOBJECT, explode: true}, "subscription_default_tax_rates": {style: DEEPOBJECT, explode: true}, "subscription_items": {style: DEEPOBJECT, explode: true}, "subscription_trial_end": {style: DEEPOBJECT, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InvoiceLinesList response = check self.clientEp->get(resourcePath);
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
        string resourcePath = string `/v1/payment_methods`;
        map<anydata> queryParam = {"customer": customer, "ending_before": endingBefore, "expand": expand, "limit": 'limit, "starting_after": startingAfter, "type": 'type};
        map<Encoding> queryParamEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PaymentFlowsPaymentMethodList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # <p>Creates a PaymentMethod object. Read the <a href="/docs/stripe-js/reference#stripe-create-payment-method">Stripe.js reference</a> to learn how to create PaymentMethods via Stripe.js.</p>
    # 
    # <p>Instead of creating a PaymentMethod directly, we recommend using the <a href="/docs/payments/accept-a-payment">PaymentIntents</a> API to accept a payment immediately or the <a href="/docs/payments/save-and-reuse">SetupIntent</a> API to collect payment method details ahead of a future payment.</p>
    #
    # + payload - Payment method details 
    # + return - Successful response. 
    remote isolated function createPaymentMethod(V1PaymentMethodsBody payload) returns PaymentMethod|error {
        string resourcePath = string `/v1/payment_methods`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"acss_debit": {style: DEEPOBJECT, explode: true}, "afterpay_clearpay": {style: DEEPOBJECT, explode: true}, "alipay": {style: DEEPOBJECT, explode: true}, "au_becs_debit": {style: DEEPOBJECT, explode: true}, "bacs_debit": {style: DEEPOBJECT, explode: true}, "bancontact": {style: DEEPOBJECT, explode: true}, "billing_details": {style: DEEPOBJECT, explode: true}, "boleto": {style: DEEPOBJECT, explode: true}, "card": {style: DEEPOBJECT, explode: true}, "eps": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "fpx": {style: DEEPOBJECT, explode: true}, "giropay": {style: DEEPOBJECT, explode: true}, "grabpay": {style: DEEPOBJECT, explode: true}, "ideal": {style: DEEPOBJECT, explode: true}, "interac_present": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "oxxo": {style: DEEPOBJECT, explode: true}, "p24": {style: DEEPOBJECT, explode: true}, "sepa_debit": {style: DEEPOBJECT, explode: true}, "sofort": {style: DEEPOBJECT, explode: true}, "wechat_pay": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        PaymentMethod response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Retrieves a PaymentMethod object.</p>
    #
    # + expand - Specifies which fields in the response should be expanded. 
    # + paymentMethod - Payment method Id 
    # + return - Successful response. 
    remote isolated function getPaymentMethod(string paymentMethod, string[]? expand = ()) returns PaymentMethod|error {
        string resourcePath = string `/v1/payment_methods/${paymentMethod}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PaymentMethod response = check self.clientEp->get(resourcePath);
        return response;
    }
    # <p>Updates a PaymentMethod object. A PaymentMethod must be attached a customer to be updated.</p>
    #
    # + paymentMethod - Payment method Id 
    # + payload - Payment method details 
    # + return - Successful response. 
    remote isolated function updatePaymentMethod(string paymentMethod, PaymentMethodsPaymentMethodBody payload) returns PaymentMethod|error {
        string resourcePath = string `/v1/payment_methods/${paymentMethod}`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"billing_details": {style: DEEPOBJECT, explode: true}, "card": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        PaymentMethod response = check self.clientEp->post(resourcePath, request);
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
        string resourcePath = string `/v1/payment_methods/${paymentMethod}/attach`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        PaymentMethod response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Detaches a PaymentMethod object from a Customer.</p>
    #
    # + paymentMethod - Payment method Id 
    # + payload - Additional details 
    # + return - Successful response. 
    remote isolated function detachPaymentMethodfromCustomer(string paymentMethod, PaymentMethodDetachBody payload) returns PaymentMethod|error {
        string resourcePath = string `/v1/payment_methods/${paymentMethod}/detach`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        PaymentMethod response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Creates a new price for an existing product. The price can be recurring or one-time.</p>
    #
    # + payload - Price details 
    # + return - Successful response. 
    remote isolated function createPrice(V1PricesBody payload) returns Price|error {
        string resourcePath = string `/v1/prices`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "product_data": {style: DEEPOBJECT, explode: true}, "recurring": {style: DEEPOBJECT, explode: true}, "tiers": {style: DEEPOBJECT, explode: true}, "transform_quantity": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Price response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Updates the specified price by setting the values of the parameters passed. Any parameters not provided are left unchanged.</p>
    #
    # + price - Price Id 
    # + payload - Price details 
    # + return - Successful response. 
    remote isolated function updatePrice(string price, PricesPriceBody payload) returns Price|error {
        string resourcePath = string `/v1/prices/${price}`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Price response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Creates a new product object.</p>
    #
    # + payload - Product details 
    # + return - Successful response. 
    remote isolated function createProduct(V1ProductsBody payload) returns Product|error {
        string resourcePath = string `/v1/products`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}, "images": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "package_dimensions": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Product response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Updates the specific product by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>
    #
    # + id - Product Id 
    # + payload - Product details 
    # + return - Successful response. 
    remote isolated function updateProduct(string id, ProductsIdBody payload) returns Product|error {
        string resourcePath = string `/v1/products/${id}`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}, "images": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "package_dimensions": {style: DEEPOBJECT, explode: true}, "tax_code": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Product response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Updates the plan or quantity of an item on a current subscription.</p>
    #
    # + item - Subscription item Id 
    # + payload - Subscription item details 
    # + return - Successful response. 
    remote isolated function updateSubscriptionItem(string item, SubscriptionItemsItemBody payload) returns SubscriptionItem|error {
        string resourcePath = string `/v1/subscription_items/${item}`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"billing_thresholds": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "price_data": {style: DEEPOBJECT, explode: true}, "tax_rates": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        SubscriptionItem response = check self.clientEp->post(resourcePath, request);
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
        string resourcePath = string `/v1/subscription_items/${subscriptionItem}/usage_records`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        UsageRecord response = check self.clientEp->post(resourcePath, request);
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
    remote isolated function listSubscriptions(string? collectionMethod = (), Created1? created = (), CurrentPeriodEnd? currentPeriodEnd = (), CurrentPeriodStart? currentPeriodStart = (), string? customer = (), string? endingBefore = (), string[]? expand = (), int? 'limit = (), string? price = (), string? startingAfter = (), string? status = ()) returns InlineResponse2002|error {
        string resourcePath = string `/v1/subscriptions`;
        map<anydata> queryParam = {"collection_method": collectionMethod, "created": created, "current_period_end": currentPeriodEnd, "current_period_start": currentPeriodStart, "customer": customer, "ending_before": endingBefore, "expand": expand, "limit": 'limit, "price": price, "starting_after": startingAfter, "status": status};
        map<Encoding> queryParamEncoding = {"created": {style: DEEPOBJECT, explode: true}, "current_period_end": {style: DEEPOBJECT, explode: true}, "current_period_start": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # <p>Creates a new subscription on an existing customer. Each customer can have up to 500 active or scheduled subscriptions.</p>
    #
    # + payload - Subscription details 
    # + return - Successful response. 
    remote isolated function createSubscriptions(V1SubscriptionsBody payload) returns Subscription|error {
        string resourcePath = string `/v1/subscriptions`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"add_invoice_items": {style: DEEPOBJECT, explode: true}, "automatic_tax": {style: DEEPOBJECT, explode: true}, "billing_thresholds": {style: DEEPOBJECT, explode: true}, "default_tax_rates": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "items": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "payment_settings": {style: DEEPOBJECT, explode: true}, "pending_invoice_item_interval": {style: DEEPOBJECT, explode: true}, "transfer_data": {style: DEEPOBJECT, explode: true}, "trial_end": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Subscription response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Retrieves the subscription with the given ID.</p>
    #
    # + expand - Specifies which fields in the response should be expanded. 
    # + subscriptionExposedId - Subscription Id 
    # + return - Successful response. 
    remote isolated function getSubscription(string subscriptionExposedId, string[]? expand = ()) returns Subscription|error {
        string resourcePath = string `/v1/subscriptions/${subscriptionExposedId}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Subscription response = check self.clientEp->get(resourcePath);
        return response;
    }
    # <p>Updates an existing subscription on a customer to match the specified parameters. When changing plans or quantities, we will optionally prorate the price we charge next month to make up for any price changes. To preview how the proration will be calculated, use the <a href="#upcoming_invoice">upcoming invoice</a> endpoint.</p>
    #
    # + subscriptionExposedId - Subscription Id 
    # + payload - Subscription details 
    # + return - Successful response. 
    remote isolated function updateSubscription(string subscriptionExposedId, SubscriptionsSubscriptionExposedIdBody payload) returns Subscription|error {
        string resourcePath = string `/v1/subscriptions/${subscriptionExposedId}`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"add_invoice_items": {style: DEEPOBJECT, explode: true}, "automatic_tax": {style: DEEPOBJECT, explode: true}, "billing_thresholds": {style: DEEPOBJECT, explode: true}, "cancel_at": {style: DEEPOBJECT, explode: true}, "default_tax_rates": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "items": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "pause_collection": {style: DEEPOBJECT, explode: true}, "payment_settings": {style: DEEPOBJECT, explode: true}, "pending_invoice_item_interval": {style: DEEPOBJECT, explode: true}, "transfer_data": {style: DEEPOBJECT, explode: true}, "trial_end": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Subscription response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Cancels a customer’s subscription immediately. The customer will not be charged again for the subscription.</p>
    # 
    # <p>Note, however, that any pending invoice items that you’ve created will still be charged for at the end of the period, unless manually <a href="#delete_invoiceitem">deleted</a>. If you’ve set the subscription to cancel at the end of the period, any pending prorations will also be left in place and collected at the end of the period. But if the subscription is set to cancel immediately, pending prorations will be removed.</p>
    # 
    # <p>By default, upon subscription cancellation, Stripe will stop automatic collection of all finalized invoices for the customer. This is intended to prevent unexpected payment attempts after the customer has canceled a subscription. However, you can resume automatic collection of the invoices manually after subscription cancellation to have us proceed. Or, you could check for unpaid invoices before allowing the customer to cancel the subscription at all.</p>
    #
    # + subscriptionExposedId - subscription Id 
    # + invoiceNow - Will generate a final invoice that invoices for any un-invoiced metered usage and new/pending proration invoice items. 
    # + prorate - Will generate a proration invoice item that credits remaining unused time until the subscription period end. 
    # + return - Successful response. 
    remote isolated function deleteSubscription(string subscriptionExposedId, boolean? invoiceNow = (), boolean? prorate = ()) returns Subscription|error {
        string resourcePath = string `/v1/subscriptions/${subscriptionExposedId}`;
        map<anydata> queryParam = {"invoice_now": invoiceNow, "prorate": prorate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Subscription response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # <p>Retrieves the list of your subscription schedules.</p>
    #
    # + canceledAt - Only return subscription schedules that were created canceled the given date interval. 
    # + completedAt - Only return subscription schedules that completed during the given date interval. 
    # + created - Only return subscription schedules that were created during the given date interval. 
    # + customer - Only return subscription schedules for the given customer. 
    # + endingBefore - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. 
    # + 'limit - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10. 
    # + releasedAt - Only return subscription schedules that were released during the given date interval. 
    # + scheduled - Only return subscription schedules that have not started yet. 
    # + startingAfter - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. 
    # + return - Successful response. 
    remote isolated function listSubscriptionSchedules(CreatedDetails? canceledAt = (), CreatedDetails? completedAt = (), CreatedDetails? created = (), string? customer = (), string? endingBefore = (), int? 'limit = (), CreatedDetails? releasedAt = (), boolean? scheduled = (), string? startingAfter = ()) returns InlineResponse2003|error {
        string resourcePath = string `/v1/subscription_schedules`;
        map<anydata> queryParam = {"canceled_at": canceledAt, "completed_at": completedAt, "created": created, "customer": customer, "ending_before": endingBefore, "limit": 'limit, "released_at": releasedAt, "scheduled": scheduled, "starting_after": startingAfter};
        map<Encoding> queryParamEncoding = {"canceled_at": {style: DEEPOBJECT, explode: true}, "completed_at": {style: DEEPOBJECT, explode: true}, "created": {style: DEEPOBJECT, explode: true}, "released_at": {style: DEEPOBJECT, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # <p>Creates a new subscription schedule object. Each customer can have up to 500 active or scheduled subscriptions.</p>
    #
    # + payload - Subscription details 
    # + return - Successful response. 
    remote isolated function createSubscriptionSchedule(V1SubscriptionSchedulesBody payload) returns SubscriptionSchedule|error {
        string resourcePath = string `/v1/subscription_schedules`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"default_settings": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "phases": {style: DEEPOBJECT, explode: true}, "start_date": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        SubscriptionSchedule response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Retrieves the details of an existing subscription schedule. You only need to supply the unique subscription schedule identifier that was returned upon subscription schedule creation.</p>
    #
    # + schedule - Subscription schedule Id 
    # + return - Successful response. 
    remote isolated function getSubscriptionSchedule(string schedule) returns SubscriptionSchedule|error {
        string resourcePath = string `/v1/subscription_schedules/${schedule}`;
        SubscriptionSchedule response = check self.clientEp->get(resourcePath);
        return response;
    }
    # <p>Updates an existing subscription schedule.</p>
    #
    # + schedule - Subscription schedule Id 
    # + payload - Subscription schedule details 
    # + return - Successful response. 
    remote isolated function updateSubscriptionSchedule(string schedule, SubscriptionSchedulesScheduleBody payload) returns SubscriptionSchedule|error {
        string resourcePath = string `/v1/subscription_schedules/${schedule}`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"default_settings": {style: DEEPOBJECT, explode: true}, "expand": {style: DEEPOBJECT, explode: true}, "metadata": {style: DEEPOBJECT, explode: true}, "phases": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        SubscriptionSchedule response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Cancels a subscription schedule and its associated subscription immediately (if the subscription schedule has an active subscription). A subscription schedule can only be canceled if its status is <code>not_started</code> or <code>active</code>.</p>
    #
    # + schedule - Subscription schedule Id 
    # + payload - Subscription schedule details 
    # + return - Successful response. 
    remote isolated function cancelSubscriptionSchedule(string schedule, ScheduleCancelBody payload) returns SubscriptionSchedule|error {
        string resourcePath = string `/v1/subscription_schedules/${schedule}/cancel`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        SubscriptionSchedule response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # <p>Releases the subscription schedule immediately, which will stop scheduling of its phases, but leave any existing subscription in place. A schedule can only be released if its status is <code>not_started</code> or <code>active</code>. If the subscription schedule is currently associated with a subscription, releasing it will remove its <code>subscription</code> property and set the subscription’s ID to the <code>released_subscription</code> property.</p>
    #
    # + schedule - Subscription schedule Id 
    # + payload - Subscription schedule details 
    # + return - Successful response. 
    remote isolated function releaseSubscriptionSchedule(string schedule, ScheduleReleaseBody payload) returns SubscriptionSchedule|error {
        string resourcePath = string `/v1/subscription_schedules/${schedule}/release`;
        http:Request request = new;
        map<Encoding> requestBodyEncoding = {"expand": {style: DEEPOBJECT, explode: true}};
        string encodedRequestBody = createFormURLEncodedRequestBody(payload, requestBodyEncoding);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        SubscriptionSchedule response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
