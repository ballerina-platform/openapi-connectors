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

# This is a generated connector for [GoDaddy Domains API v1](https://developer.godaddy.com/doc/endpoint/domains) OpenAPI specification. 
# The GoDaddy Domains API provides capability to access GoDaddy operations related to domains.
@display {label: "Godaddy Domains", iconPath: "resources/godaddy.domains.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.  Create a [GoDaddy](https://sg.godaddy.com/) and 
    # obtain tokens by following [this guide](https://developer.godaddy.com/getstarted).  
    #
    # + apiKeyConfig - Provide your API Key as `Authorization`. Eg: {Authorization : sso-key [<API_KEY>]:[<API_SECRET>]} 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "//api.ote-godaddy.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
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
        string  path = string `/v1/domains`;
        map<anydata> queryParam = {"statuses": statuses, "statusGroups": statusGroups, "limit": 'limit, "marker": marker, "includes": includes, "modifiedDate": modifiedDate};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DomainSummary[] response = check self.clientEp-> get(path, accHeaders, targetType = DomainSummaryArr);
        return response;
    }
    # Retrieve the legal agreement(s) required to purchase the specified TLD and add-ons
    #
    # + tlds - list of TLDs whose legal agreements are to be retrieved 
    # + privacy - Whether or not privacy has been requested 
    # + xMarketId - Unique identifier of the Market used to retrieve/translate Legal Agreements 
    # + forTransfer - Whether or not domain tranfer has been requested 
    # + return - Request was successful 
    remote isolated function getAgreement(string[] tlds, boolean privacy, string xMarketId = "en-US", boolean? forTransfer = ()) returns LegalAgreement[]|error {
        string  path = string `/v1/domains/agreements`;
        map<anydata> queryParam = {"tlds": tlds, "privacy": privacy, "forTransfer": forTransfer};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Market-Id": xMarketId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        LegalAgreement[] response = check self.clientEp-> get(path, accHeaders, targetType = LegalAgreementArr);
        return response;
    }
    # Determine whether or not the specified domain is available for purchase
    #
    # + domain - Domain name whose availability is to be checked 
    # + checkType - Optimize for time ('FAST') or accuracy ('FULL') 
    # + forTransfer - Whether or not to include domains available for transfer. If set to True, checkType is ignored 
    # + return - Request was successful 
    remote isolated function getDomainAvailability(string domain, string checkType = "FAST", boolean forTransfer = false) returns DomainAvailableResponse|error {
        string  path = string `/v1/domains/available`;
        map<anydata> queryParam = {"domain": domain, "checkType": checkType, "forTransfer": forTransfer};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DomainAvailableResponse response = check self.clientEp-> get(path, accHeaders, targetType = DomainAvailableResponse);
        return response;
    }
    # Determine whether or not the specified domains are available for purchase
    #
    # + payload - Domain names for which to check availability 
    # + checkType - Optimize for time ('FAST') or accuracy ('FULL') 
    # + return - Request was successful 
    remote isolated function getDomainsAvailabilityBulk(string[] payload, string checkType = "FAST") returns DomainAvailableBulk|error {
        string  path = string `/v1/domains/available`;
        map<anydata> queryParam = {"checkType": checkType};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DomainAvailableBulk response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DomainAvailableBulk);
        return response;
    }
    # Validate the request body using the Domain Contact Validation Schema for specified domains.
    #
    # + payload - An instance document expected for domains contacts validation 
    # + xPrivateLabelId - PrivateLabelId to operate as, if different from JWT 
    # + marketId - MarketId in which the request is being made, and for which responses should be localized 
    # + return - No response was specified 
    remote isolated function validateContacts(DomainsContactsBulk payload, int xPrivateLabelId = 1, string marketId = "en-US") returns http:Response|error {
        string  path = string `/v1/domains/contacts/validate`;
        map<anydata> queryParam = {"marketId": marketId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Private-Label-Id": xPrivateLabelId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Purchase and register the specified Domain
    #
    # + payload - An instance document expected to match the JSON schema returned by `./schema/{tld}` 
    # + xShopperId - The Shopper for whom the domain should be purchased 
    # + return - Request was successful 
    remote isolated function purchaseDomain(DomainPurchase payload, string? xShopperId = ()) returns DomainPurchaseResponse|error {
        string  path = string `/v1/domains/purchase`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DomainPurchaseResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DomainPurchaseResponse);
        return response;
    }
    # Retrieve the schema to be submitted when registering a Domain for the specified TLD
    #
    # + tld - The Top-Level Domain whose schema should be retrieved 
    # + return - Request was successful 
    remote isolated function retrieveSchema(string tld) returns JsonSchema|error {
        string  path = string `/v1/domains/purchase/schema/${tld}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        JsonSchema response = check self.clientEp-> get(path, accHeaders, targetType = JsonSchema);
        return response;
    }
    # Validate the request body using the Domain Purchase Schema for the specified TLD
    #
    # + payload - An instance document expected to match the JSON schema returned by `./schema/{tld}` 
    # + return - Request was successful 
    remote isolated function validateRequestBody(DomainPurchase payload) returns http:Response|error {
        string  path = string `/v1/domains/purchase/validate`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
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
        string  path = string `/v1/domains/suggest`;
        map<anydata> queryParam = {"query": query, "country": country, "city": city, "sources": sources, "tlds": tlds, "lengthMax": lengthMax, "lengthMin": lengthMin, "limit": 'limit, "waitMs": waitMs};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DomainSuggestion[] response = check self.clientEp-> get(path, accHeaders, targetType = DomainSuggestionArr);
        return response;
    }
    # Retrieves a list of TLDs supported and enabled for sale
    #
    # + return - Request was successful 
    remote isolated function listTLDs() returns TldSummary[]|error {
        string  path = string `/v1/domains/tlds`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        TldSummary[] response = check self.clientEp-> get(path, accHeaders, targetType = TldSummaryArr);
        return response;
    }
    # Retrieve details for the specified Domain
    #
    # + domain - Domain name whose details are to be retrieved 
    # + xShopperId - Shopper ID expected to own the specified domain 
    # + return - Request was successful 
    remote isolated function getDomainDetail(string domain, string? xShopperId = ()) returns DomainDetail|error {
        string  path = string `/v1/domains/${domain}`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DomainDetail response = check self.clientEp-> get(path, accHeaders, targetType = DomainDetail);
        return response;
    }
    # Cancel a purchased domain
    #
    # + domain - Domain to cancel 
    # + return - Request was successful 
    remote isolated function cancelDomain(string domain) returns http:Response|error {
        string  path = string `/v1/domains/${domain}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update details for the specified Domain
    #
    # + domain - Domain whose details are to be updated 
    # + payload - Changes to apply to existing Domain 
    # + xShopperId - Shopper for whom Domain is to be updated. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + return - Request was successful 
    remote isolated function updateDomain(string domain, DomainUpdate payload, string? xShopperId = ()) returns http:Response|error {
        string  path = string `/v1/domains/${domain}`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Update domain
    #
    # + domain - Domain whose Contacts are to be updated. 
    # + payload - Changes to apply to existing Contacts 
    # + xShopperId - Shopper for whom domain contacts are to be updated. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + return - No response was specified 
    remote isolated function updateContacts(string domain, DomainContacts payload, string? xShopperId = ()) returns http:Response|error {
        string  path = string `/v1/domains/${domain}/contacts`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Submit a privacy cancellation request for the given domain
    #
    # + domain - Domain whose privacy is to be cancelled 
    # + xShopperId - Shopper ID of the owner of the domain 
    # + return - Request was successful 
    remote isolated function cancelPrivacy(string domain, string? xShopperId = ()) returns http:Response|error {
        string  path = string `/v1/domains/${domain}/privacy`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Purchase privacy for a specified domain
    #
    # + domain - Domain for which to purchase privacy 
    # + payload - Options for purchasing privacy 
    # + xShopperId - Shopper ID of the owner of the domain 
    # + return - Request was successful 
    remote isolated function purchasePrivacy(string domain, PrivacyPurchase payload, string? xShopperId = ()) returns DomainPurchaseResponse|error {
        string  path = string `/v1/domains/${domain}/privacy/purchase`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DomainPurchaseResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DomainPurchaseResponse);
        return response;
    }
    # Replace all DNS Records for the specified Domain
    #
    # + domain - Domain whose DNS Records are to be replaced 
    # + payload - DNS Records to replace whatever currently exists 
    # + xShopperId - Shopper ID which owns the domain. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + return - Request was successful 
    remote isolated function replaceDNSRecords(string domain, DNSRecord[] payload, string? xShopperId = ()) returns http:Response|error {
        string  path = string `/v1/domains/${domain}/records`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Add the specified DNS Records to the specified Domain
    #
    # + domain - Domain whose DNS Records are to be augmented 
    # + payload - DNS Records to add to whatever currently exists 
    # + xShopperId - Shopper ID which owns the domain. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + return - Request was successful 
    remote isolated function addDNSRecord(string domain, ArrayOfDNSRecord payload, string? xShopperId = ()) returns http:Response|error {
        string  path = string `/v1/domains/${domain}/records`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Retrieve DNS Records for the specified Domain, optionally with the specified Type and/or Name
    #
    # + domain - Domain whose DNS Records are to be retrieved 
    # + 'type - DNS Record Type for which DNS Records are to be retrieved 
    # + name - DNS Record Name for which DNS Records are to be retrieved 
    # + xShopperId - Shopper ID which owns the domain. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + offset - Number of results to skip for pagination 
    # + 'limit - Maximum number of items to return 
    # + return - Request was successful 
    remote isolated function getDNSRecord(string domain, string 'type, string name, string? xShopperId = (), int? offset = (), int? 'limit = ()) returns DNSRecord[]|error {
        string  path = string `/v1/domains/${domain}/records/${'type}/${name}`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DNSRecord[] response = check self.clientEp-> get(path, accHeaders, targetType = DNSRecordArr);
        return response;
    }
    # Replace all DNS Records for the specified Domain with the specified Type and Name
    #
    # + domain - Domain whose DNS Records are to be replaced 
    # + 'type - DNS Record Type for which DNS Records are to be replaced 
    # + name - DNS Record Name for which DNS Records are to be replaced 
    # + payload - DNS Records to replace whatever currently exists 
    # + xShopperId - Shopper ID which owns the domain. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + return - Request was successful 
    remote isolated function replaceDNSRecordTypeName(string domain, string 'type, string name, DNSRecordCreateTypeName[] payload, string? xShopperId = ()) returns http:Response|error {
        string  path = string `/v1/domains/${domain}/records/${'type}/${name}`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Delete all DNS Records for the specified Domain with the specified Type and Name
    #
    # + domain - Domain whose DNS Records are to be deleted 
    # + 'type - DNS Record Type for which DNS Records are to be deleted 
    # + name - DNS Record Name for which DNS Records are to be deleted 
    # + xShopperId - Shopper ID which owns the domain. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + return - Request was successful 
    remote isolated function deleteDNSRecordTypeName(string domain, string 'type, string name, string? xShopperId = ()) returns http:Response|error {
        string  path = string `/v1/domains/${domain}/records/${'type}/${name}`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Replace all DNS Records for the specified Domain with the specified Type
    #
    # + domain - Domain whose DNS Records are to be replaced 
    # + 'type - DNS Record Type for which DNS Records are to be replaced 
    # + payload - DNS Records to replace whatever currently exists 
    # + xShopperId - Shopper ID which owns the domain. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + return - Request was successful 
    remote isolated function replaceDNSRecordType(string domain, string 'type, DNSRecordCreateType[] payload, string? xShopperId = ()) returns http:Response|error {
        string  path = string `/v1/domains/${domain}/records/${'type}`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Renew the specified Domain
    #
    # + domain - Domain to renew 
    # + payload - Options for renewing existing Domain 
    # + xShopperId - Shopper for whom Domain is to be renewed. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + return - Request was successful 
    remote isolated function renewDomain(string domain, DomainRenew payload, string? xShopperId = ()) returns DomainPurchaseResponse|error {
        string  path = string `/v1/domains/${domain}/renew`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DomainPurchaseResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DomainPurchaseResponse);
        return response;
    }
    # Purchase and start or restart transfer process
    #
    # + domain - Domain to transfer in 
    # + payload - Details for domain transfer purchase 
    # + xShopperId - The Shopper to whom the domain should be transfered 
    # + return - Request was successful 
    remote isolated function startOrRestartTransferInProcess(string domain, DomainTransferIn payload, string? xShopperId = ()) returns DomainPurchaseResponse|error {
        string  path = string `/v1/domains/${domain}/transfer`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DomainPurchaseResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DomainPurchaseResponse);
        return response;
    }
    # Re-send Contact E-mail Verification for specified Domain
    #
    # + domain - Domain whose Contact E-mail should be verified. 
    # + xShopperId - Shopper for whom domain contact e-mail should be verified. NOTE: This is only required if you are a Reseller managing a domain purchased outside the scope of your reseller account. For instance, if you're a Reseller, but purchased a Domain via http://www.godaddy.com 
    # + return - Request was successful 
    remote isolated function verifyEmail(string domain, string? xShopperId = ()) returns http:Response|error {
        string  path = string `/v1/domains/${domain}/verifyRegistrantEmail`;
        map<any> headerValues = {"X-Shopper-Id": xShopperId, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Retrieve the forwarding information for the given fqdn
    #
    # + customerId - The Customer identifier<br/> Note: For API Resellers, performing actions on behalf of your customers, you need to specify the Subaccount you're operating on behalf of; otherwise use your shopper id. 
    # + fqdn - The fully qualified domain name whose forwarding details are to be retrieved. 
    # + includeSubs - Optionally include all sub domains if the fqdn specified is a domain and not a sub domain. 
    # + return - Request was successful 
    remote isolated function getDomainsForwards(string customerId, string fqdn, boolean? includeSubs = ()) returns DomainForwarding[]|error {
        string  path = string `/v2/customers/${customerId}/domains/forwards/${fqdn}`;
        map<anydata> queryParam = {"includeSubs": includeSubs};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DomainForwarding[] response = check self.clientEp-> get(path, accHeaders, targetType = DomainForwardingArr);
        return response;
    }
    # Modify the forwarding information for the given fqdn
    #
    # + customerId - The Customer identifier<br/> Note: For API Resellers, performing actions on behalf of your customers, you need to specify the Subaccount you're operating on behalf of; otherwise use your shopper id. 
    # + fqdn - The fully qualified domain name whose forwarding details are to be modified. 
    # + payload - Domain forwarding rule to create or replace on the fqdn 
    # + return - Request was successful 
    remote isolated function putDomainsForwards(string customerId, string fqdn, DomainForwardingCreate payload) returns http:Response|error {
        string  path = string `/v2/customers/${customerId}/domains/forwards/${fqdn}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Submit a forwarding cancellation request for the given fqdn
    #
    # + customerId - The Customer identifier<br/> Note: For API Resellers, performing actions on behalf of your customers, you need to specify the Subaccount you're operating on behalf of; otherwise use your shopper id. 
    # + fqdn - The fully qualified domain name whose forwarding details are to be deleted. 
    # + return - Request was successful 
    remote isolated function deleteDomainsForwards(string customerId, string fqdn) returns http:Response|error {
        string  path = string `/v2/customers/${customerId}/domains/forwards/${fqdn}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
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
