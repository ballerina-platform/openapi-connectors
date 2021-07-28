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

import  ballerina/http;

# Client configuration
#
# + authConfig - OAuth client configuration  
# + secureSocketConfig - SSH configuration  
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# This API is used by partners to create draft listings on eBay for their seller.
# 
# + clientEp - Connector http endpoint
public client class Client {

    http:Client clientEp;
    # Client initialization.
    #
    # + clientConfig - OAuth client configuration
    # + serviceUrl - Service URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.ebay.com/sell/listing/v1_beta") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # This call gives Partners the ability to create an eBay draft of a item for their seller using information from their site.
    # 
    # + xEbayCMarketplaceId - Use this header to specify an eBay marketplace ID. For a list of supported sites, see API Restrictions in the Listing API overview.
    # + payload - The type that defines the fields for the listing details.
    # + contentLanguage - Use this header to specify the natural language of the seller. For details, see Content-Language in HTTP request headers. Required: For EBAY_CA in French. (Content-Language = fr-CA)
    # + return - ItemDraftResponse on success or else error.
    remote isolated function createItemDraft(string xEbayCMarketplaceId, ItemDraft payload, string? contentLanguage = ()) returns ItemDraftResponse|error {
        string  path = string `/item_draft/`;
        map<any> headerValues = {"Content-Language": contentLanguage, "X-EBAY-C-MARKETPLACE-ID": xEbayCMarketplaceId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ItemDraftResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ItemDraftResponse);
        return response;
    }
}

# Generate header map for given header values.
#
# + headerParam - Headers  map
# + return - Returns generated map or error at failure of client initialization
isolated function  getMapForHeaders(map<any>   headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
