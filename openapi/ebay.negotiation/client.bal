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

# This is a generated connector for [eBay Negotiation API v1.1.0](https://developer.ebay.com/api-docs/sell/negotiation/overview.html) OpenAPI Specification
# The Negotiations API provides capability to access sellers to proactively send discount offers to buyers who have shown an "interest" in their listings.  By sending buyers discount offers on listings where they have shown an interest, sellers can increase the velocity of their sales.  There are various ways for a buyer to show interest in a listing. For example, if a buyer adds the listing to their Watch list,  or if they add the listing to their shopping cart and later abandon the cart, they are deemed to have shown an interest in the listing.   In the offers that sellers send, they can discount their listings by either a percentage off the listing price, or they can set a  new discounted price that is lower than the original listing price.  For details about how seller offers work,  see "/api-docs/sell/static/marketing/offers-to-buyers.html" title="Selling Integration Guide">Sending offers to buyers.
@display {label: "eBay Negotiation", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [developer account](https://developer.ebay.com/api-docs/static/creating-edp-account.html)  and obtain tokens following [this guide](https://developer.ebay.com/api-docs/static/oauth-tokens.html).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.ebay.com/sell/negotiation/v1") returns error? {
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
    # This method evaluates a seller's current listings and returns the set of IDs that are eligible for a seller-initiated discount offer to a buyer. A listing ID is returned only when one or more buyers have shown an &quot;interest&quot; in the listing. If any buyers have shown interest in a listing, the seller can initiate a &quot;negotiation&quot; with them by calling sendOfferToInterestedBuyers, which sends all interested buyers a message that offers the listing at a discount. For details about how to create seller offers to buyers, see Sending offers to buyers.
    #
    # + 'limit - This query parameter specifies the maximum number of items to return from the result set on a page in the paginated response. Minimum: 1 &nbsp; &nbsp;Maximum: 200 Default: 10 
    # + offset - This query parameter specifies the number of results to skip in the result set before returning the first result in the paginated response. Combine offset with the limit query parameter to control the items returned in the response. For example, if you supply an offset of 0 and a limit of 10, the first page of the response contains the first 10 results from the complete list of items retrieved by the call. If offset is 10 and limit is 20, the first page of the response contains items 11-30 from the complete result set. Default: 0 
    # + xEbayCMarketplaceId - The eBay marketplace on which you want to search for eligible listings. For a complete list of supported marketplaces, see Negotiation API requirements and restrictions. 
    # + return - Success 
    remote isolated function findEligibleItems(string xEbayCMarketplaceId, string? 'limit = (), string? offset = ()) returns PagedEligibleItemCollection|error? {
        string resourcePath = string `/find_eligible_items`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-EBAY-C-MARKETPLACE-ID": xEbayCMarketplaceId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PagedEligibleItemCollection? response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # This method sends eligible buyers offers to purchase items in a listing at a discount. When a buyer has shown interest in a listing, they become &quot;eligible&quot; to receive a seller-initiated offer to purchase the item(s). Sellers use findEligibleItems to get the set of listings that have interested buyers. If a listing has interested buyers, sellers can use this method (sendOfferToInterestedBuyers) to send an offer to the buyers who are interested in the listing. The offer gives buyers the ability to purchase the associated listings at a discounted price. For details about how to create seller offers to buyers, see Sending offers to buyers.
    #
    # + xEbayCMarketplaceId - The eBay marketplace on which your listings with &quot;eligible&quot; buyers appear. For a complete list of supported marketplaces, see Negotiation API requirements and restrictions. 
    # + payload - Send offer to eligible items request. 
    # + return - Success 
    remote isolated function sendOfferToInterestedBuyers(string xEbayCMarketplaceId, CreateOffersRequest payload) returns SendOfferToInterestedBuyersCollectionResponse|error {
        string resourcePath = string `/send_offer_to_interested_buyers`;
        map<any> headerValues = {"X-EBAY-C-MARKETPLACE-ID": xEbayCMarketplaceId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SendOfferToInterestedBuyersCollectionResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
