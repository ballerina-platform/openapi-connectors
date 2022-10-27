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

# This is a generated connector for [eBay Account API v1.6.3](https://developer.ebay.com/api-docs/sell/account/overview.html)   OpenAPI Specification. The Account API provide capability to access configure their eBay seller accounts, including the seller''s policies  (the Fulfillment Policy, Payment Policy, and Return Policy), opt in and out of eBay seller programs, configure sales tax tables,  and get account information. 
@display {label: "eBay Account", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. Create a [developer account](https://developer.ebay.com/api-docs/static/creating-edp-account.html)  and obtain tokens following [this guide](https://developer.ebay.com/api-docs/static/oauth-tokens.html).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.ebay.com/sell/account/v1") returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # This method retrieves all the fulfillment policies configured for the marketplace you specify using the marketplace_id query parameter. Marketplaces and locales Get the correct policies for a marketplace that supports multiple locales using the Content-Language request header. For example, get the policies for the French locale of the Canadian marketplace by specifying fr-CA for the Content-Language header. Likewise, target the Dutch locale of the Belgium marketplace by setting Content-Language: nl-BE. For details on header values, see HTTP request headers.
    #
    # + marketplaceId - This query parameter specifies the eBay marketplace of the policies you want to retrieve. For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/sell/account/types/ba:MarketplaceIdEnum 
    # + return - Success 
    remote isolated function getFulfillmentPolicies(string marketplaceId) returns FulfillmentPolicyResponse|error {
        string resourcePath = string `/fulfillment_policy`;
        map<anydata> queryParam = {"marketplace_id": marketplaceId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FulfillmentPolicyResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method creates a new fulfillment policy where the policy encapsulates seller's terms for fulfilling item purchases. Fulfillment policies include the shipment options that the seller offers to buyers. Each policy targets a marketplaceId and categoryTypes.name combination and you can create multiple policies for each combination. Be aware that some marketplaces require a specific fulfillment policy for vehicle listings. A successful request returns the URI to the new policy in the Location response header and the ID for the new policy is returned in the response payload. Tip: For details on creating and using the business policies supported by the Account API, see eBay business policies. Marketplaces and locales Policy instructions can be localized by providing a locale in the Accept-Language HTTP request header. For example, the following setting displays field values from the request body in German: Accept-Language: de-DE. Target the specific locale of a marketplace that supports multiple locales using the Content-Language request header. For example, target the French locale of the Canadian marketplace by specifying the fr-CA locale for Content-Language. Likewise, target the Dutch locale of the Belgium marketplace by setting Content-Language: nl-BE. Tip: For details on headers, see HTTP request headers.
    #
    # + payload - Request to create a seller account fulfillment policy. 
    # + return - Created 
    remote isolated function createFulfillmentPolicy(FulfillmentPolicyRequest payload) returns SetFulfillmentPolicyResponse|error {
        string resourcePath = string `/fulfillment_policy`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SetFulfillmentPolicyResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # This method retrieves the complete details of a fulfillment policy. Supply the ID of the policy you want to retrieve using the fulfillmentPolicyId path parameter.
    #
    # + fulfillmentPolicyId - This path parameter specifies the ID of the fulfillment policy you want to retrieve. 
    # + return - Success 
    remote isolated function getFulfillmentPolicy(string fulfillmentPolicyId) returns FulfillmentPolicy|error {
        string resourcePath = string `/fulfillment_policy/${getEncodedUri(fulfillmentPolicyId)}`;
        FulfillmentPolicy response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method updates an existing fulfillment policy. Specify the policy you want to update using the fulfillment_policy_id path parameter. Supply a complete policy payload with the updates you want to make; this call overwrites the existing policy with the new details specified in the payload.
    #
    # + fulfillmentPolicyId - This path parameter specifies the ID of the fulfillment policy you want to update. 
    # + payload - Fulfillment policy request 
    # + return - OK 
    remote isolated function updateFulfillmentPolicy(string fulfillmentPolicyId, FulfillmentPolicyRequest payload) returns SetFulfillmentPolicyResponse|error {
        string resourcePath = string `/fulfillment_policy/${getEncodedUri(fulfillmentPolicyId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SetFulfillmentPolicyResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # This method deletes a fulfillment policy. Supply the ID of the policy you want to delete in the fulfillmentPolicyId path parameter. Note that you cannot delete the default fulfillment policy.
    #
    # + fulfillmentPolicyId - This path parameter specifies the ID of the fulfillment policy to delete. 
    # + return - No Content 
    remote isolated function deleteFulfillmentPolicy(string fulfillmentPolicyId) returns http:Response|error {
        string resourcePath = string `/fulfillment_policy/${getEncodedUri(fulfillmentPolicyId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # This method retrieves the complete details for a single fulfillment policy. In the request, supply both the policy name and its associated marketplace_id as query parameters. Marketplaces and locales Get the correct policy for a marketplace that supports multiple locales using the Content-Language request header. For example, get a policy for the French locale of the Canadian marketplace by specifying fr-CA for the Content-Language header. Likewise, target the Dutch locale of the Belgium marketplace by setting Content-Language: nl-BE. For details on header values, see HTTP request headers.
    #
    # + marketplaceId - This query parameter specifies the eBay marketplace of the policy you want to retrieve. For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/sell/account/types/ba:MarketplaceIdEnum 
    # + name - This query parameter specifies the user-defined name of the fulfillment policy you want to retrieve. 
    # + return - Success 
    remote isolated function getFulfillmentPolicyByName(string marketplaceId, string name) returns FulfillmentPolicy|error {
        string resourcePath = string `/fulfillment_policy/get_by_policy_name`;
        map<anydata> queryParam = {"marketplace_id": marketplaceId, "name": name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FulfillmentPolicy response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method retrieves all the payment policies configured for the marketplace you specify using the marketplace_id query parameter. Marketplaces and locales Get the correct policies for a marketplace that supports multiple locales using the Content-Language request header. For example, get the policies for the French locale of the Canadian marketplace by specifying fr-CA for the Content-Language header. Likewise, target the Dutch locale of the Belgium marketplace by setting Content-Language: nl-BE. For details on header values, see HTTP request headers.
    #
    # + marketplaceId - This query parameter specifies the eBay marketplace of the policies you want to retrieve. For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/sell/account/types/ba:MarketplaceIdEnum 
    # + return - Success 
    remote isolated function getPaymentPolicies(string marketplaceId) returns PaymentPolicyResponse|error {
        string resourcePath = string `/payment_policy`;
        map<anydata> queryParam = {"marketplace_id": marketplaceId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PaymentPolicyResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method creates a new payment policy where the policy encapsulates seller's terms for purchase payments. Each policy targets a marketplaceId and categoryTypes.name combination and you can create multiple policies for each combination. Be aware that some marketplaces require a specific payment policy for vehicle listings. A successful request returns the URI to the new policy in the Location response header and the ID for the new policy is returned in the response payload. Tip: For details on creating and using the business policies supported by the Account API, see eBay business policies. Marketplaces and locales Policy instructions can be localized by providing a locale in the Accept-Language HTTP request header. For example, the following setting displays field values from the request body in German: Accept-Language: de-DE. Target the specific locale of a marketplace that supports multiple locales using the Content-Language request header. For example, target the French locale of the Canadian marketplace by specifying the fr-CA locale for Content-Language. Likewise, target the Dutch locale of the Belgium marketplace by setting Content-Language: nl-BE. Tip: For details on headers, see HTTP request headers.
    #
    # + payload - Payment policy request 
    # + return - Created 
    remote isolated function createPaymentPolicy(PaymentPolicyRequest payload) returns SetPaymentPolicyResponse|error {
        string resourcePath = string `/payment_policy`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SetPaymentPolicyResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # This method retrieves the complete details of a payment policy. Supply the ID of the policy you want to retrieve using the paymentPolicyId path parameter.
    #
    # + paymentPolicyId - This path parameter specifies the ID of the payment policy you want to retrieve. 
    # + return - Success 
    remote isolated function getPaymentPolicy(string paymentPolicyId) returns PaymentPolicy|error {
        string resourcePath = string `/payment_policy/${getEncodedUri(paymentPolicyId)}`;
        PaymentPolicy response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method updates an existing payment policy. Specify the policy you want to update using the payment_policy_id path parameter. Supply a complete policy payload with the updates you want to make; this call overwrites the existing policy with the new details specified in the payload.
    #
    # + paymentPolicyId - This path parameter specifies the ID of the payment policy you want to update. 
    # + payload - Payment policy request 
    # + return - OK 
    remote isolated function updatePaymentPolicy(string paymentPolicyId, PaymentPolicyRequest payload) returns SetPaymentPolicyResponse|error {
        string resourcePath = string `/payment_policy/${getEncodedUri(paymentPolicyId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SetPaymentPolicyResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # This method deletes a payment policy. Supply the ID of the policy you want to delete in the paymentPolicyId path parameter. Note that you cannot delete the default payment policy.
    #
    # + paymentPolicyId - This path parameter specifies the ID of the payment policy you want to delete. 
    # + return - No Content 
    remote isolated function deletePaymentPolicy(string paymentPolicyId) returns http:Response|error {
        string resourcePath = string `/payment_policy/${getEncodedUri(paymentPolicyId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # This method retrieves the complete details of a single payment policy. Supply both the policy name and its associated marketplace_id in the request query parameters. Marketplaces and locales Get the correct policy for a marketplace that supports multiple locales using the Content-Language request header. For example, get a policy for the French locale of the Canadian marketplace by specifying fr-CA for the Content-Language header. Likewise, target the Dutch locale of the Belgium marketplace by setting Content-Language: nl-BE. For details on header values, see HTTP request headers.
    #
    # + marketplaceId - This query parameter specifies the eBay marketplace of the policy you want to retrieve. For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/sell/account/types/ba:MarketplaceIdEnum 
    # + name - This query parameter specifies the user-defined name of the payment policy you want to retrieve. 
    # + return - Success 
    remote isolated function getPaymentPolicyByName(string marketplaceId, string name) returns PaymentPolicy|error {
        string resourcePath = string `/payment_policy/get_by_policy_name`;
        map<anydata> queryParam = {"marketplace_id": marketplaceId, "name": name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PaymentPolicy response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method returns whether or not the user is opted-in to the specified payments program. Sellers opt-in to payments programs by marketplace and you use the marketplace_id path parameter to specify the marketplace of the status flag you want returned. Note: Currently, the only supported payments program is eBay Payments. For details, see: Managed Payments on eBay Payments Terms of Use
    #
    # + marketplaceId - This path parameter specifies the eBay marketplace of the payments program for which you want to retrieve the seller's status. 
    # + paymentsProgramType - This path parameter specifies the payments program whose status is returned by the call. Currently the only supported payments program is EBAY_PAYMENTS. For details on the program, see Payments Terms of Use. 
    # + return - Success 
    remote isolated function getPaymentsProgram(string marketplaceId, string paymentsProgramType) returns PaymentsProgramResponse|error {
        string resourcePath = string `/payments_program/${getEncodedUri(marketplaceId)}/${getEncodedUri(paymentsProgramType)}`;
        PaymentsProgramResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method retrieves a seller's onboarding status of eBay managed payments for a specified marketplace. The overall onboarding status of the seller and the status of each onboarding step is returned. Presently, the only supported payments program type is EBAY_PAYMENTS. See Managed Payments on eBay and Payments Terms of Use. Note: Managed payments availability: eBay managed payments is presently available in the US and Germany, and will roll out to Canada, UK, and Australia in July 2020.
    #
    # + marketplaceId - The eBay marketplace ID associated with the onboarding status to retrieve. Only enums for marketplaces that support or will soon support eBay managed payments are allowed. Error 20408 is returned for any other eBay marketplace. No response payload is returned with this error. 
    # + paymentsProgramType - The type of payments program whose status is returned by the call. Presently, the only supported payments program is EBAY_PAYMENTS. For details on the program, see Payments Terms of Use. 
    # + return - Success 
    remote isolated function getPaymentsProgramOnboarding(string marketplaceId, string paymentsProgramType) returns PaymentsProgramOnboardingResponse|error {
        string resourcePath = string `/payments_program/${getEncodedUri(marketplaceId)}/${getEncodedUri(paymentsProgramType)}/onboarding`;
        PaymentsProgramOnboardingResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method retrieves the seller's current set of privileges. The call returns whether or not the seller's eBay registration has been completed, as well as the details of their site-wide sellingLimt (the amount and quantity they can sell on a given day).
    #
    # + return - Success 
    remote isolated function getPrivileges() returns SellingPrivileges|error {
        string resourcePath = string `/privilege`;
        SellingPrivileges response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method gets a list of the seller programs that the seller has opted-in to.
    #
    # + return - Success 
    remote isolated function getOptedInPrograms() returns Programs|error {
        string resourcePath = string `/program/get_opted_in_programs`;
        Programs response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method opts the seller in to an eBay seller program. Refer to the Account API overview for information about available eBay seller programs. Note: It can take up to 24-hours for eBay to process your request to opt-in to a Seller Program. Use the getOptedInPrograms call to check the status of your request after the processing period has passed.
    #
    # + payload - Program being opted-in to. 
    # + return - Success 
    remote isolated function optInToProgram(Program payload) returns json|error {
        string resourcePath = string `/program/opt_in`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # This method opts the seller out of a seller program to which you have previously opted-in to. Get a list of the seller programs you have opted-in to using the getOptedInPrograms call.
    #
    # + payload - Program being opted-out of. 
    # + return - Success 
    remote isolated function optOutOfProgram(Program payload) returns json|error {
        string resourcePath = string `/program/opt_out`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # This method retrieves a seller's shipping rate tables for the country specified in the country_code query parameter. If you call this method without specifying a country code, the call returns all the seller's shipping rate tables. The method's response includes a rateTableId for each table defined by the seller. Use a table's ID value in a fulfillment policy to specify the shipping rate table to use for that policy's DOMESTIC or INTERNATIONAL shipping option (make sure the locality of the rate table matches the optionType of the shipping option). This call currently supports getting rate tables related to the following marketplaces: EBAY_AU EBAY_CA EBAY_DE EBAY_ES EBAY_FR EBAY_GB EBAY_IT EBAY_US Note: Rate tables created with the Trading API might not have been assigned a rateTableId at the time of their creation. This method can assign and return rateTableId values for rate tables with missing IDs if you make a request using the country_code where the seller has defined rate tables. Sellers can define up to 40 shipping rate tables for their account, which lets them set up different rate tables for each of the marketplaces they sell into. Go to My eBay &gt; Account &gt; Site Preferences to create and maintain the rate tables. For more, see Using shipping rate tables. If you're using the Trading API, use the rate table ID values in the RateTableDetails container of the Add/Revise/Relist calls. If the locality for a rate table is set to DOMESTIC, pass the ID value in the RateTableDetails.DomesticRateTableId field. Otherwise, if locality is INTERNATIONAL, pass the ID value in RateTableDetails.InternationalRateTableId.
    #
    # + countryCode - This query parameter specifies the two-letter ISO 3166 code of country for which you want shipping-rate table information. If you do not specify a county code, the request returns all the seller-defined rate tables. For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/sell/account/types/ba:CountryCodeEnum 
    # + return - Success 
    remote isolated function getRateTables(string? countryCode = ()) returns RateTableResponse|error {
        string resourcePath = string `/rate_table`;
        map<anydata> queryParam = {"country_code": countryCode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RateTableResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method retrieves all the return policies configured for the marketplace you specify using the marketplace_id query parameter. Marketplaces and locales Get the correct policies for a marketplace that supports multiple locales using the Content-Language request header. For example, get the policies for the French locale of the Canadian marketplace by specifying fr-CA for the Content-Language header. Likewise, target the Dutch locale of the Belgium marketplace by setting Content-Language: nl-BE. For details on header values, see HTTP request headers.
    #
    # + marketplaceId - This query parameter specifies the ID of the eBay marketplace of the policy you want to retrieve. For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/sell/account/types/ba:MarketplaceIdEnum 
    # + return - Success 
    remote isolated function getReturnPolicies(string marketplaceId) returns ReturnPolicyResponse|error {
        string resourcePath = string `/return_policy`;
        map<anydata> queryParam = {"marketplace_id": marketplaceId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ReturnPolicyResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method creates a new return policy where the policy encapsulates seller's terms for returning items. Use the Metadata API method getReturnPolicies to determine which categories require you to supply a return policy for the marketplace(s) into which you list. Each policy targets a marketplaceId and categoryTypes.name combination and you can create multiple policies for each combination. A successful request returns the URI to the new policy in the Location response header and the ID for the new policy is returned in the response payload. Tip: For details on creating and using the business policies supported by the Account API, see eBay business policies. Marketplaces and locales Policy instructions can be localized by providing a locale in the Accept-Language HTTP request header. For example, the following setting displays field values from the request body in German: Accept-Language: de-DE. Target the specific locale of a marketplace that supports multiple locales using the Content-Language request header. For example, target the French locale of the Canadian marketplace by specifying the fr-CA locale for Content-Language. Likewise, target the Dutch locale of the Belgium marketplace by setting Content-Language: nl-BE. Tip: For details on headers, see HTTP request headers.
    #
    # + payload - Return policy request 
    # + return - Created 
    remote isolated function createReturnPolicy(ReturnPolicyRequest payload) returns SetReturnPolicyResponse|error {
        string resourcePath = string `/return_policy`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SetReturnPolicyResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # This method retrieves the complete details of the return policy specified by the returnPolicyId path parameter.
    #
    # + returnPolicyId - This path parameter specifies the of the return policy you want to retrieve. 
    # + return - Success 
    remote isolated function getReturnPolicy(string returnPolicyId) returns ReturnPolicy|error {
        string resourcePath = string `/return_policy/${getEncodedUri(returnPolicyId)}`;
        ReturnPolicy response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method updates an existing return policy. Specify the policy you want to update using the return_policy_id path parameter. Supply a complete policy payload with the updates you want to make; this call overwrites the existing policy with the new details specified in the payload.
    #
    # + returnPolicyId - This path parameter specifies the ID of the return policy you want to update. 
    # + payload - Container for a return policy request. 
    # + return - OK 
    remote isolated function updateReturnPolicy(string returnPolicyId, ReturnPolicyRequest payload) returns SetReturnPolicyResponse|error {
        string resourcePath = string `/return_policy/${getEncodedUri(returnPolicyId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SetReturnPolicyResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # This method deletes a return policy. Supply the ID of the policy you want to delete in the returnPolicyId path parameter. Note that you cannot delete the default return policy.
    #
    # + returnPolicyId - This path parameter specifies the ID of the return policy you want to delete. 
    # + return - No Content 
    remote isolated function deleteReturnPolicy(string returnPolicyId) returns http:Response|error {
        string resourcePath = string `/return_policy/${getEncodedUri(returnPolicyId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # This method retrieves the complete details of a single return policy. Supply both the policy name and its associated marketplace_id in the request query parameters. Marketplaces and locales Get the correct policy for a marketplace that supports multiple locales using the Content-Language request header. For example, get a policy for the French locale of the Canadian marketplace by specifying fr-CA for the Content-Language header. Likewise, target the Dutch locale of the Belgium marketplace by setting Content-Language: nl-BE. For details on header values, see HTTP request headers.
    #
    # + marketplaceId - This query parameter specifies the ID of the eBay marketplace of the policy you want to retrieve. For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/sell/account/types/ba:MarketplaceIdEnum 
    # + name - This query parameter specifies the user-defined name of the return policy you want to retrieve. 
    # + return - Success 
    remote isolated function getReturnPolicyByName(string marketplaceId, string name) returns ReturnPolicy|error {
        string resourcePath = string `/return_policy/get_by_policy_name`;
        map<anydata> queryParam = {"marketplace_id": marketplaceId, "name": name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ReturnPolicy response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This call gets the current tax table entry for a specific tax jurisdiction. Specify the jurisdiction to retrieve using the countryCode and jurisdictionId path parameters.
    #
    # + countryCode - This path parameter specifies the two-letter ISO 3166 code for the country whose tax table you want to retrieve. 
    # + jurisdictionId - This path parameter specifies the ID of the sales tax jurisdiction for the tax table entry you want to retrieve. 
    # + return - Success 
    remote isolated function getSalesTax(string countryCode, string jurisdictionId) returns SalesTax|error? {
        string resourcePath = string `/sales_tax/${getEncodedUri(countryCode)}/${getEncodedUri(jurisdictionId)}`;
        SalesTax? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method creates or updates a sales tax table entry for a jurisdiction. Specify the tax table entry you want to configure using the two path parameters: countryCode and jurisdictionId. A tax table entry for a jurisdiction is comprised of two fields: one for the jurisdiction's sales-tax rate and another that's a boolean value indicating whether or not shipping and handling are taxed in the jurisdiction. You can set up tax tables for countries that support different tax jurisdictions. Currently, only Canada, India, and the US support separate tax jurisdictions. If you sell into any of these countries, you can set up tax tables for any of the country's jurisdictions. Retrieve valid jurisdiction IDs using getSalesTaxJurisdictions in the Metadata API. For details on using this call, see Establishing sales-tax tables. Important! Starting in January 2019, eBay will begin to calculate, collect, and remit sales tax on behalf of sellers for items shipped to customers. This feature is rolling out on specific dates to specific US states as defined on the following page: eBay sales tax collection. Once eBay starts to collect sales tax for a state, no action is required on the seller's part and there will be no charges or fees for eBay automatically calculating, collecting and remitting sales tax. The sales-tax collection process will apply to all the sales in the states that support this feature, whether the seller is located in or outside of the United States. When a buyer purchases an item on eBay, and the ship-to address is one of the states where eBay collects the sales tax, eBay will calculate and add the applicable sales tax at checkout. The buyer will pay both the cost of the item along with the sales tax. eBay will collect and remit the tax.
    #
    # + countryCode - This path parameter specifies the two-letter ISO 3166 code for the country for which you want to create tax table entry. 
    # + jurisdictionId - This path parameter specifies the ID of the sales-tax jurisdiction for the table entry you want to create. 
    # + payload - A container that describes the how the sales tax is calculated. 
    # + return - No Content 
    remote isolated function createOrReplaceSalesTax(string countryCode, string jurisdictionId, SalesTaxBase payload) returns http:Response|error {
        string resourcePath = string `/sales_tax/${getEncodedUri(countryCode)}/${getEncodedUri(jurisdictionId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # This call deletes a tax table entry for a jurisdiction. Specify the jurisdiction to delete using the countryCode and jurisdictionId path parameters.
    #
    # + countryCode - This path parameter specifies the two-letter ISO 3166 code for the country whose tax table entry you want to delete. 
    # + jurisdictionId - This path parameter specifies the ID of the sales tax jurisdiction whose table entry you want to delete. 
    # + return - Success 
    remote isolated function deleteSalesTax(string countryCode, string jurisdictionId) returns http:Response|error {
        string resourcePath = string `/sales_tax/${getEncodedUri(countryCode)}/${getEncodedUri(jurisdictionId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Use this call to retrieve a sales tax table that the seller established for a specific country. Specify the tax table to retrieve using the country_code query parameter.
    #
    # + countryCode - This path parameter specifies the two-letter ISO 3166 code for the country whose tax table you want to retrieve. For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/sell/account/types/ba:CountryCodeEnum 
    # + return - Success 
    remote isolated function getSalesTaxes(string countryCode) returns SalesTaxes|error {
        string resourcePath = string `/sales_tax`;
        map<anydata> queryParam = {"country_code": countryCode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SalesTaxes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This method is used by sellers onboarded for eBay managed payments, or sellers who are currently going through, or who are eligible for onboarding for eBay managed payments. With this method, a seller can discover if there are any action items in regards to providing more documentation and/or information about themselves, their company, or the bank account they are or will be using for seller payouts. These 'action items' are also know as 'Know Your Customer' (or KYC) checks. This method does not require any parameters other than the OAuth user token associated with the seller's account. If the managed payments seller does not currently have any pending 'KYC' action items, only a 204 No Content HTTP status code is returned, and no response payload. Note: This method is not applicable for sellers who are not eligible for eBay managed payments. For sellers who sell on one or more eBay marketplaces that currently support managed payments, they can check on their managed payments onboarding status by using the getPaymentsProgramOnboarding method.
    #
    # + return - OK 
    remote isolated function getKYC() returns KycResponse|error? {
        string resourcePath = string `/kyc`;
        KycResponse? response = check self.clientEp->get(resourcePath);
        return response;
    }
}
