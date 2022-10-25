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

# This is a generated connector for [GoDaddy Certificates API v1](https://developer.godaddy.com/doc/endpoint/certificates) OpenAPI specification.
# <strong>GoDaddy Abuse API Terms of Use:</strong><p>GoDaddy’s Abuse API is provided to simplify and standardize the abuse reporting experience. To help us streamline the review of abuse reports, you acknowledge and agree that your use of GoDaddy’s Abuse API is subject to the following quality metrics and terms of use.</p><p>GoDaddy may, in its sole and absolute discretion, change or modify these terms, and such changes or modifications shall be effective immediately upon notice to you. Your use of GoDaddy’s Abuse API after such changes or modifications shall constitute your acceptance of these terms as last revised. If you do not agree to be bound by these terms as last revised, do not use (or continue to use) our Abuse API.</p><p>As an Abuse API user, you must only submit abuse reports via the API portal and cease all email submissions, including but not limited, to phishing@godaddy.com, netabuse@godaddy.com, malware@godaddy.com, or spam@godaddy.com, etc.  Any additional or duplicate submission outside of the API portal will be deprioritized for review. Submissions related to trademark, copyright or content issues may still be sent to trademarkclaims@godaddy.com, coyprightclaims@godaddy.com, and contentcomplaints@godaddy.com, respectively. Our [Front of Site](https://supportcenter.godaddy.com/AbuseReport) also describes other scenarios not covered by the API.</p><p>When you submit abuse reports via GoDaddy’s Abuse API, you must ensure that you accurately categorize the abuse type of each report to match our definitions in the API documentations provided to you. Any submission that fails to match our definitions or is miscategorized will be marked as a false positive. Examples include, but are not limited to, submissions of trademark complaints marked as phishing or malware, or submissions of copyright complaints marked as phishing or malware, etc.</p><p>If, at any time, the false positive rate of submissions exceeds 40% of your total submissions, as determined by GoDaddy, GoDaddy may in its sole discretion deprioritize any subsequent reports submitted by you and/or your organization.</p><p>You acknowledge and agree that submitting every URL for a single domain is not necessary and will not expedite the review process. If your submissions exceed five (5) URLs for a single domain, your report will be marked as a duplicate submission taking into account that the final outcome of such submissions would yield the same result as the original report. GoDaddy may in its sole discretion deprioritize reports submitted by you and/or your organization in the event more than 20% of your submissions are classified as duplicate submissions.</p><p>You further acknowledge and agree that our Customer Support lines are not intended to address abuse reporting matters or your use of GoDaddy’s Abuse API. Contacting Customer Support will not expedite the review process and may result in abuse reports being deprioritized, to be determined in our sole discretion.</p><p>Should you have any questions about GoDaddy’s Abuse API or any of the terms and conditions set forth above, please contact abuseapisupport@godaddy.com.</p>
@display {label: "GoDaddy Abuse", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.  Create a [GoDaddy account](https://sg.godaddy.com/) and obtain tokens by following [this guide](https://developer.godaddy.com/getstarted).
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
    # Lists all abuse tickets ids that match user provided filters
    #
    # + 'type - The type of abuse. 
    # + closed - Is this abuse ticket closed? 
    # + sourceDomainOrIp - The domain name or ip address the abuse originated from 
    # + target - The brand/company the abuse is targeting. ie: brand name/bank name 
    # + createdStart - The earliest abuse ticket creation date to pull abuse tickets for 
    # + createdEnd - The latest abuse ticket creation date to pull abuse tickets for 
    # + 'limit - Number of abuse ticket numbers to return. 
    # + offset - The earliest result set record number to pull abuse tickets for 
    # + return - Success 
    remote isolated function getTickets(string? 'type = (), boolean closed = false, string? sourceDomainOrIp = (), string? target = (), string? createdStart = (), string? createdEnd = (), int 'limit = 100, int offset = 0) returns AbuseTicketList|error {
        string resourcePath = string `/v1/abuse/tickets`;
        map<anydata> queryParam = {"type": 'type, "closed": closed, "sourceDomainOrIp": sourceDomainOrIp, "target": target, "createdStart": createdStart, "createdEnd": createdEnd, "limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AbuseTicketList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates a new abuse ticket.
    #
    # + payload - The endpoint which allows the Reporter to create a new abuse ticket 
    # + return - No response was specified 
    remote isolated function createTicket(AbuseTicketCreate payload) returns AbuseTicketId|error? {
        string resourcePath = string `/v1/abuse/tickets`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AbuseTicketId? response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns the abuse ticket data for a given ticket id.
    #
    # + ticketId - A unique abuse ticket identifier 
    # + return - Success 
    remote isolated function getTicketInfo(string ticketId) returns AbuseTicket|error {
        string resourcePath = string `/v1/abuse/tickets/${getEncodedUri(ticketId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AbuseTicket response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
