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
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig auth;
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

# This is a generated connector for [eBay Compliance API v1.4.1](https://developer.ebay.com) OpenAPI specification.
# Service for providing information to sellers about their listings being non-compliant, or at risk for becoming non-compliant, against eBay listing policies.
@display {label: "eBay Compliance", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create [eBay developer account](https://developer.ebay.com/join/) and obtain tokens by following [this guide](https://developer.ebay.com/api-docs/static/oauth-tokens.html).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.ebay.com/sell/compliance/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # This call returns listing violation counts for a seller. A user can pass in one or more compliance types through the compliance_type query parameter. See ComplianceTypeEnum for more information on the supported listing compliance types. Listing violations are returned for multiple marketplaces if the seller sells on multiple eBay marketplaces. Note: Only a canned response, with counts for all listing compliance types, is returned in the Sandbox environment. Due to this limitation, the compliance_type query parameter (if used) will not have an effect on the response.
    #
    # + xEbayCMarketplaceId - Use this header to specify the eBay marketplace identifier. Supported values for this header can be found in the MarketplaceIdEnum type definition. Note that Version 1.4.0 of the Compliance API is only supported on the US, UK, Australia, Canada {English), and Germany sites. 
    # + complianceType - A user passes in one or more compliance type values through this query parameter. See ComplianceTypeEnum for more information on the supported compliance types that can be passed in here. If more than one compliance type value is used, delimit these values with a comma. If no compliance type values are passed in, the listing count for all compliance types will be returned. Note: Only a canned response, with counts for all listing compliance types, is returned in the Sandbox environment. Due to this limitation, the compliance_type query parameter (if used) will not have an effect on the response. 
    # + return - Success 
    remote isolated function getListingViolationsSummary(string? xEbayCMarketplaceId = (), string? complianceType = ()) returns ComplianceSummary|error? {
        string resourcePath = string `/listing_violation_summary`;
        map<anydata> queryParam = {"compliance_type": complianceType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-EBAY-C-MARKETPLACE-ID": xEbayCMarketplaceId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ComplianceSummary? response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # This call returns specific listing violations for the supported listing compliance types. Only one compliance type can be passed in per call, and the response will include all the listing violations for this compliance type, and listing violations are grouped together by eBay listing ID. See ComplianceTypeEnum for more information on the supported listing compliance types. This method also has pagination control. Note: A maximum of 2000 listing violations will be returned in a result set. If the seller has more than 2000 listing violations, some/all of those listing violations must be corrected before additional listing violations will be retrieved. The user should pay attention to the total value in the response. If this value is '2000', it is possible that the seller has more than 2000 listing violations, but this field maxes out at 2000. Note: In a future release of this API, the seller will be able to pass in a specific eBay listing ID as a query parameter to see if this specific listing has any violations. Note: Only mocked non-compliant listing data will be returned for this call in the Sandbox environment, and not specific to the seller. However, the user can still use this mock data to experiment with the compliance type filters and pagination control.
    #
    # + xEbayCMarketplaceId - This header is required and is used to specify the eBay marketplace identifier. Supported values for this header can be found in the MarketplaceIdEnum type definition. Note that Version 1.4.0 of the Compliance API is only supported on the US, UK, Australia, Canada {English), and Germany sites. 
    # + complianceType - A seller uses this query parameter to retrieve listing violations of a specific compliance type. Only one compliance type value should be passed in here. See ComplianceTypeEnum for more information on the compliance types that can be passed in here. If the listing_id query parameter is used, the compliance_type query parameter {if passed in) will be ignored. This is because all of a listing's policy violations {each compliance type) will be returned if a listing_id is provided. Either the listing_id or a compliance_type query parameter must be used, and if the seller only wants to view listing violations of a specific compliance type, both of these parameters can be used. Note: The listing_id query parameter is not yet available for use, so the seller does not have the ability to retrieve listing violations for one or more specific listings. Until the listing_id query parameter becomes available, the compliance_type query parameter is required with each getListingViolations call. 
    # + offset - The integer value input into this field controls the first listing violation in the result set that will be displayed at the top of the response. The offset and limit query parameters are used to control the pagination of the output. For example, if offset is set to 10 and limit is set to 10, the call retrieves listing violations 11 thru 20 from the resulting set of violations. Note: This feature employs a zero-based index, where the first item in the list has an offset of 0. If the listing_id parameter is included in the request, this parameter will be ignored. Default: 0 {zero) 
    # + listingId - Note: This query parameter is not yet supported for the Compliance API. Please note that until this query parameter becomes available, the compliance_type query parameter is required with each getListingViolations call. This query parameter is used if the user wants to view all listing violations for one or more eBay listings. The string value passed into this field is the unique identifier of the listing, sometimes referred to as the Item ID. Either the listing_id or a compliance_type query parameter must be used, and if the seller only wants to view listing violations of a specific compliance type, both of these parameters can be used. Up to 50 listing IDs can be specified with this query parameter, and each unique listing ID is separated with a comma. 
    # + 'limit - This query parameter is used if the user wants to set a limit on the number of listing violations that are returned on one page of the result set. This parameter is used in conjunction with the offset parameter to control the pagination of the output. For example, if offset is set to 10 and limit is set to 10, the call retrieves listing violations 11 thru 20 from the collection of listing violations that match the value set in the compliance_type parameter. Note: This feature employs a zero-based index, where the first item in the list has an offset of 0. If the listing_id parameter is included in the request, this parameter will be ignored. Default: 100 Maximum: 200 
    # + filter - This filter allows a user to retrieve only listings that are currently out of compliance, or only listings that are at risk of becoming out of compliance. Although other filters may be added in the future, complianceState is the only supported filter type at this time. The two compliance 'states' are OUT_OF_COMPLIANCE and AT_RISK. Below is an example of how to set up this compliance state filter. Notice that the filter type and filter value are separated with a colon (:) character, and the filter value is wrapped with curly brackets. filter=complianceState:{OUT_OF_COMPLIANCE} 
    # + return - Success 
    remote isolated function getListingViolations(string xEbayCMarketplaceId, string? complianceType = (), string? offset = (), string? listingId = (), string? 'limit = (), string? filter = ()) returns PagedComplianceViolationCollection|error? {
        string resourcePath = string `/listing_violation`;
        map<anydata> queryParam = {"compliance_type": complianceType, "offset": offset, "listing_id": listingId, "limit": 'limit, "filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-EBAY-C-MARKETPLACE-ID": xEbayCMarketplaceId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PagedComplianceViolationCollection? response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # This call suppresses a listing violation for a specific listing. Only listing violations in the AT_RISK state (returned in the violations.complianceState field of the getListingViolations call) can be suppressed. Note: At this time, the suppressViolation call only supports the suppressing of ASPECTS_ADOPTION listing violations in the AT_RISK state. In the future, it is possible that this method can be used to suppress other listing violation types. A successful call returns a http status code of 204 Success. There is no response payload. If the call is not successful, an error code will be returned stating the issue.
    #
    # + payload - This type is the base request type of the SuppressViolation method. 
    # + return - Success 
    remote isolated function suppressViolation(SuppressViolationRequest payload) returns http:Response|error {
        string resourcePath = string `/suppress_listing_violation`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
