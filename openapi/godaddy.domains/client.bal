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

# This is a generated connector for [GoDaddy Domains API v1](https://developer.godaddy.com/doc/endpoint/domains) OpenAPI specification. The GoDaddy Domains API provides capability to access GoDaddy operations related to domains.
@display {label: "GoDaddy Domains", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.  Create a [GoDaddy](https://sg.godaddy.com/) and obtain tokens by following [this guide](https://developer.godaddy.com/getstarted).  
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.ote-godaddy.com/") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
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
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Retrieve a list of Domains for the specified Shopper
    #
    # + xShopperId - Shopper ID whose domains are to be retrieved 
    # + statuses - Only include results with `status` value in the specified set 
    # + statusGroups - Only include results with `status` value in any of the specified groups 
    # + 'limit - Maximum number of domains to return 
    # + marker - Marker Domain to use as the offset in results 
    # + includes - Optional details to be included in the response 
    # + modifiedDate - Only include results that have been modified since the specified date 
    # + return - Request was successful 
    remote isolated function listDomains(string? xShopperId = (), string[]? statuses = (), string[]? statusGroups = (), int? 'limit = (), string? marker = (), string[]? includes = (), string? modifiedDate = ()) returns DomainSummary[]|error {
        string resourcePath = string `/v1/domains`;
        map<anydata> queryParam = {"statuses": statuses, "statusGroups": statusGroups, "limit": 'limit, "marker": marker, "includes": includes, "modifiedDate": modifiedDate};
        map<Encoding> queryParamEncoding = {"statuses": {style: FORM, explode: false}, "statusGroups": {style: FORM, explode: false}, "includes": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DomainSummary[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the legal agreement(s) required to purchase the specified TLD and add-ons
    #
    # + xMarketId - Unique identifier of the Market used to retrieve/translate Legal Agreements 
    # + tlds - list of TLDs whose legal agreements are to be retrieved 
    # + privacy - Whether or not privacy has been requested 
    # + forTransfer - Whether or not domain tranfer has been requested 
    # + return - Request was successful 
    remote isolated function getAgreement(string[] tlds, boolean privacy, string xMarketId = "en-US", boolean? forTransfer = ()) returns LegalAgreement[]|error {
        string resourcePath = string `/v1/domains/agreements`;
        map<anydata> queryParam = {"tlds": tlds, "privacy": privacy, "forTransfer": forTransfer};
        map<Encoding> queryParamEncoding = {"tlds": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"X-Market-Id": xMarketId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LegalAgreement[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Determine whether or not the specified domain is available for purchase
    #
    # + domain - Domain name whose availability is to be checked 
    # + checkType - Optimize for time ('FAST') or accuracy ('FULL') 
    # + forTransfer - Whether or not to include domains available for transfer. If set to True, checkType is ignored 
    # + return - Request was successful 
    remote isolated function getDomainAvailability(string domain, string checkType = "FAST", boolean forTransfer = false) returns DomainAvailableResponse|error {
        string resourcePath = string `/v1/domains/available`;
        map<anydata> queryParam = {"domain": domain, "checkType": checkType, "forTransfer": forTransfer};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DomainAvailableResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Determine whether or not the specified domains are available for purchase
    #
    # + checkType - Optimize for time ('FAST') or accuracy ('FULL') 
    # + payload - Domain names for which to check availability 
    # + return - Request was successful 
    remote isolated function getDomainsAvailabilityBulk(string[] payload, string checkType = "FAST") returns DomainAvailableBulk|DomainAvailableBulkMixed|error {
        string resourcePath = string `/v1/domains/available`;
        map<anydata> queryParam = {"checkType": checkType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DomainAvailableBulk|DomainAvailableBulkMixed response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Validate the request body using the Domain Contact Validation Schema for specified domains.
    #
    # + xPrivateLabelId - PrivateLabelId to operate as, if different from JWT 
    # + marketId - MarketId in which the request is being made, and for which responses should be localized 
    # + payload - An instance document expected for domains contacts validation 
    # + return - No response was specified 
    remote isolated function validateContacts(DomainsContactsBulk payload, int xPrivateLabelId = 1, string marketId = "en-US") returns http:Response|error {
        string resourcePath = string `/v1/domains/contacts/validate`;
        map<anydata> queryParam = {"marketId": marketId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Private-Label-Id": xPrivateLabelId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Purchase and register the specified Domain
    #
    # + xShopperId - The Shopper for whom the domain should be purchased 
    # + payload - An instance document expected to match the JSON schema returned by `./schema/{tld}` 
    # + return - Request was successful 
    remote isolated function purchaseDomain(DomainPurchase payload, string? xShopperId = ()) returns DomainPurchaseResponse|error {
        string resourcePath = string `/v1/domains/purchase`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DomainPurchaseResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the schema to be submitted when registering a Domain for the specified TLD
    #
    # + tld - The Top-Level Domain whose schema should be retrieved 
    # + return - Request was successful 
    remote isolated function retrieveSchema(string tld) returns JsonSchema|error {
        string resourcePath = string `/v1/domains/purchase/schema/${getEncodedUri(tld)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        JsonSchema response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Validate the request body using the Domain Purchase Schema for the specified TLD
    #
    # + payload - An instance document expected to match the JSON schema returned by `./schema/{tld}` 
    # + return - Request was successful 
    remote isolated function validateRequestBody(DomainPurchase payload) returns http:Response|error {
        string resourcePath = string `/v1/domains/purchase/validate`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Suggest alternate Domain names based on a seed Domain, a set of keywords, or the shopper's purchase history
    #
    # + xShopperId - Shopper ID for which the suggestions are being generated 
    # + query - Domain name or set of keywords for which alternative domain names will be suggested 
    # + country - Two-letter ISO country code to be used as a hint for target region<br/><br/> NOTE: These are sample values, there are many <a href="http://www.iso.org/iso/country_codes.htm">more</a> 
    # + city - Name of city to be used as a hint for target region 
    # + sources - Sources to be queried<br/><br/><ul> <li><strong>CC_TLD</strong> - Varies the TLD using Country Codes</li> <li><strong>EXTENSION</strong> - Varies the TLD</li> <li><strong>KEYWORD_SPIN</strong> - Identifies keywords and then rotates each one</li> <li><strong>PREMIUM</strong> - Includes variations with premium prices</li></ul> 
    # + tlds - Top-level domains to be included in suggestions<br/><br/> NOTE: These are sample values, there are many <a href="http://www.godaddy.com/tlds/gtld.aspx#domain_search_form">more</a> 
    # + lengthMax - Maximum length of second-level domain 
    # + lengthMin - Minimum length of second-level domain 
    # + 'limit - Maximum number of suggestions to return 
    # + waitMs - Maximum amount of time, in milliseconds, to wait for responses If elapses, return the results compiled up to that point 
    # + return - Request was successful 
    remote isolated function suggestDomainNames(string? xShopperId = (), string? query = (), string? country = (), string? city = (), string[]? sources = (), string[]? tlds = (), int? lengthMax = (), int? lengthMin = (), int? 'limit = (), int waitMs = 1000) returns DomainSuggestion[]|error {
        string resourcePath = string `/v1/domains/suggest`;
        map<anydata> queryParam = {"query": query, "country": country, "city": city, "sources": sources, "tlds": tlds, "lengthMax": lengthMax, "lengthMin": lengthMin, "limit": 'limit, "waitMs": waitMs};
        map<Encoding> queryParamEncoding = {"sources": {style: FORM, explode: false}, "tlds": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DomainSuggestion[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieves a list of TLDs supported and enabled for sale
    #
    # + return - Request was successful 
    remote isolated function listTLDs() returns TldSummary[]|error {
        string resourcePath = string `/v1/domains/tlds`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TldSummary[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve details for the specified Domain
    #
    # + xShopperId - Shopper ID expected to own the specified domain 
    # + domain - Domain name whose details are to be retrieved 
    # + return - Request was successful 
    remote isolated function getDomainDetail(string domain, string? xShopperId = ()) returns DomainDetail|error {
        string resourcePath = string `/v1/domains/${getEncodedUri(domain)}`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DomainDetail response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Cancel a purchased domain
    #
    # + domain - Domain to cancel 
    # + return - Request was successful 
    remote isolated function cancelDomain(string domain) returns http:Response|error {
        string resourcePath = string `/v1/domains/${getEncodedUri(domain)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Update details for the specified Domain
    #
    # + domain - Domain whose details are to be updated 
    # + xShopperId - Shopper for whom Domain is to be updated. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + payload - Changes to apply to existing Domain 
    # + return - Request was successful 
    remote isolated function updateDomain(string domain, DomainUpdate payload, string? xShopperId = ()) returns http:Response|error {
        string resourcePath = string `/v1/domains/${getEncodedUri(domain)}`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Update domain
    #
    # + xShopperId - Shopper for whom domain contacts are to be updated. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + domain - Domain whose Contacts are to be updated. 
    # + payload - Changes to apply to existing Contacts 
    # + return - No response was specified 
    remote isolated function updateContacts(string domain, DomainContacts payload, string? xShopperId = ()) returns http:Response|error {
        string resourcePath = string `/v1/domains/${getEncodedUri(domain)}/contacts`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Submit a privacy cancellation request for the given domain
    #
    # + xShopperId - Shopper ID of the owner of the domain 
    # + domain - Domain whose privacy is to be cancelled 
    # + return - Request was successful 
    remote isolated function cancelPrivacy(string domain, string? xShopperId = ()) returns http:Response|error {
        string resourcePath = string `/v1/domains/${getEncodedUri(domain)}/privacy`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Purchase privacy for a specified domain
    #
    # + xShopperId - Shopper ID of the owner of the domain 
    # + domain - Domain for which to purchase privacy 
    # + payload - Options for purchasing privacy 
    # + return - Request was successful 
    remote isolated function purchasePrivacy(string domain, PrivacyPurchase payload, string? xShopperId = ()) returns DomainPurchaseResponse|error {
        string resourcePath = string `/v1/domains/${getEncodedUri(domain)}/privacy/purchase`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DomainPurchaseResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Replace all DNS Records for the specified Domain
    #
    # + xShopperId - Shopper ID which owns the domain. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + domain - Domain whose DNS Records are to be replaced 
    # + payload - DNS Records to replace whatever currently exists 
    # + return - Request was successful 
    remote isolated function replaceDNSRecords(string domain, DNSRecord[] payload, string? xShopperId = ()) returns http:Response|error {
        string resourcePath = string `/v1/domains/${getEncodedUri(domain)}/records`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Add the specified DNS Records to the specified Domain
    #
    # + xShopperId - Shopper ID which owns the domain. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + domain - Domain whose DNS Records are to be augmented 
    # + payload - DNS Records to add to whatever currently exists 
    # + return - Request was successful 
    remote isolated function addDNSRecord(string domain, ArrayOfDNSRecord payload, string? xShopperId = ()) returns http:Response|error {
        string resourcePath = string `/v1/domains/${getEncodedUri(domain)}/records`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve DNS Records for the specified Domain, optionally with the specified Type and/or Name
    #
    # + xShopperId - Shopper ID which owns the domain. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + domain - Domain whose DNS Records are to be retrieved 
    # + 'type - DNS Record Type for which DNS Records are to be retrieved 
    # + name - DNS Record Name for which DNS Records are to be retrieved 
    # + offset - Number of results to skip for pagination 
    # + 'limit - Maximum number of items to return 
    # + return - Request was successful 
    remote isolated function getDNSRecord(string domain, string 'type, string name, string? xShopperId = (), int? offset = (), int? 'limit = ()) returns DNSRecord[]|error {
        string resourcePath = string `/v1/domains/${getEncodedUri(domain)}/records/${getEncodedUri('type)}/${getEncodedUri(name)}`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DNSRecord[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Replace all DNS Records for the specified Domain with the specified Type and Name
    #
    # + xShopperId - Shopper ID which owns the domain. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + domain - Domain whose DNS Records are to be replaced 
    # + 'type - DNS Record Type for which DNS Records are to be replaced 
    # + name - DNS Record Name for which DNS Records are to be replaced 
    # + payload - DNS Records to replace whatever currently exists 
    # + return - Request was successful 
    remote isolated function replaceDNSRecordTypeName(string domain, string 'type, string name, DNSRecordCreateTypeName[] payload, string? xShopperId = ()) returns http:Response|error {
        string resourcePath = string `/v1/domains/${getEncodedUri(domain)}/records/${getEncodedUri('type)}/${getEncodedUri(name)}`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete all DNS Records for the specified Domain with the specified Type and Name
    #
    # + xShopperId - Shopper ID which owns the domain. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + domain - Domain whose DNS Records are to be deleted 
    # + 'type - DNS Record Type for which DNS Records are to be deleted 
    # + name - DNS Record Name for which DNS Records are to be deleted 
    # + return - Request was successful 
    remote isolated function deleteDNSRecordTypeName(string domain, string 'type, string name, string? xShopperId = ()) returns http:Response|error {
        string resourcePath = string `/v1/domains/${getEncodedUri(domain)}/records/${getEncodedUri('type)}/${getEncodedUri(name)}`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Replace all DNS Records for the specified Domain with the specified Type
    #
    # + xShopperId - Shopper ID which owns the domain. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + domain - Domain whose DNS Records are to be replaced 
    # + 'type - DNS Record Type for which DNS Records are to be replaced 
    # + payload - DNS Records to replace whatever currently exists 
    # + return - Request was successful 
    remote isolated function replaceDNSRecordType(string domain, string 'type, DNSRecordCreateType[] payload, string? xShopperId = ()) returns http:Response|error {
        string resourcePath = string `/v1/domains/${getEncodedUri(domain)}/records/${getEncodedUri('type)}`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Renew the specified Domain
    #
    # + xShopperId - Shopper for whom Domain is to be renewed. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + domain - Domain to renew 
    # + payload - Options for renewing existing Domain 
    # + return - Request was successful 
    remote isolated function renewDomain(string domain, DomainRenew payload, string? xShopperId = ()) returns DomainPurchaseResponse|error {
        string resourcePath = string `/v1/domains/${getEncodedUri(domain)}/renew`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DomainPurchaseResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Purchase and start or restart transfer process
    #
    # + xShopperId - The Shopper to whom the domain should be transfered 
    # + domain - Domain to transfer in 
    # + payload - Details for domain transfer purchase 
    # + return - Request was successful 
    remote isolated function startOrRestartTransferInProcess(string domain, DomainTransferIn payload, string? xShopperId = ()) returns DomainPurchaseResponse|error {
        string resourcePath = string `/v1/domains/${getEncodedUri(domain)}/transfer`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DomainPurchaseResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Re-send Contact E-mail Verification for specified Domain
    #
    # + xShopperId - Shopper for whom domain contact e-mail should be verified. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + domain - Domain whose Contact E-mail should be verified. 
    # + return - Request was successful 
    remote isolated function verifyEmail(string domain, string? xShopperId = ()) returns http:Response|error {
        string resourcePath = string `/v1/domains/${getEncodedUri(domain)}/verifyRegistrantEmail`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve the forwarding information for the given fqdn
    #
    # + customerId - The Customer identifier<br/> Note: For API Resellers, performing actions on behalf of your customers, you need to specify the Subaccount you're operating on behalf of; otherwise use your shopper id. 
    # + fqdn - The fully qualified domain name whose forwarding details are to be retrieved. 
    # + includeSubs - Optionally include all sub domains if the fqdn specified is a domain and not a sub domain. 
    # + return - Request was successful 
    remote isolated function getDomainsForwards(string customerId, string fqdn, boolean? includeSubs = ()) returns DomainForwarding[]|error {
        string resourcePath = string `/v2/customers/${getEncodedUri(customerId)}/domains/forwards/${getEncodedUri(fqdn)}`;
        map<anydata> queryParam = {"includeSubs": includeSubs};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DomainForwarding[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Modify the forwarding information for the given fqdn
    #
    # + customerId - The Customer identifier<br/> Note: For API Resellers, performing actions on behalf of your customers, you need to specify the Subaccount you're operating on behalf of; otherwise use your shopper id. 
    # + fqdn - The fully qualified domain name whose forwarding details are to be modified. 
    # + payload - Domain forwarding rule to create or replace on the fqdn 
    # + return - Request was successful 
    remote isolated function putDomainsForwards(string customerId, string fqdn, DomainForwardingCreate payload) returns http:Response|error {
        string resourcePath = string `/v2/customers/${getEncodedUri(customerId)}/domains/forwards/${getEncodedUri(fqdn)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Submit a forwarding cancellation request for the given fqdn
    #
    # + customerId - The Customer identifier<br/> Note: For API Resellers, performing actions on behalf of your customers, you need to specify the Subaccount you're operating on behalf of; otherwise use your shopper id. 
    # + fqdn - The fully qualified domain name whose forwarding details are to be deleted. 
    # + return - Request was successful 
    remote isolated function deleteDomainsForwards(string customerId, string fqdn) returns http:Response|error {
        string resourcePath = string `/v2/customers/${getEncodedUri(customerId)}/domains/forwards/${getEncodedUri(fqdn)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
}
