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

public type ApiKeysConfig record {
    map<string> apiKeys;
};

# This is a generated connector for [GoDaddy Abuse API v1](https://developer.godaddy.com/doc/endpoint/abuse) OpenAPI specification.
# <strong>GoDaddy Abuse API Terms of Use:</strong><p>GoDaddy’s Abuse API is provided to simplify and standardize the abuse 
# reporting experience. To help us streamline the review of abuse reports, you acknowledge and agree that your use of 
# GoDaddy’s Abuse API is subject to the following quality metrics and terms of use.</p><p>GoDaddy may, in its sole and 
# absolute discretion, change or modify these terms, and such changes or modifications shall be effective immediately upon 
# notice to you. Your use of GoDaddy’s Abuse API after such changes or modifications shall constitute your acceptance of 
# these terms as last revised. If you do not agree to be bound by these terms as last revised, do not use (or continue to use) 
# our Abuse API.</p><p>As an Abuse API user, you must only submit abuse reports via the API portal and cease all email 
# submissions, including but not limited, to phishing@godaddy.com, netabuse@godaddy.com, malware@godaddy.com, or spam@godaddy.com, 
# etc.  Any additional or duplicate submission outside of the API portal will be deprioritized for review. Submissions related 
# to trademark, copyright or content issues may still be sent to trademarkclaims@godaddy.com, coyprightclaims@godaddy.com,
#  and contentcomplaints@godaddy.com, respectively. Our [Front of Site](https://supportcenter.godaddy.com/AbuseReport) 
# also describes other scenarios not covered by the API.</p><p>When you submit abuse reports via GoDaddy’s Abuse API, 
# you must ensure that you accurately categorize the abuse type of each report to match our definitions in the API 
# documentations provided to you. Any submission that fails to match our definitions or is miscategorized will be marked 
# as a false positive. Examples include, but are not limited to, submissions of trademark complaints marked as phishing 
# or malware, or submissions of copyright complaints marked as phishing or malware, etc.</p><p>If, at any time, the false 
# positive rate of submissions exceeds 40% of your total submissions, as determined by GoDaddy, GoDaddy may in its sole 
# discretion deprioritize any subsequent reports submitted by you and/or your organization.</p><p>You acknowledge and 
# agree that submitting every URL for a single domain is not necessary and will not expedite the review process. If your 
# submissions exceed five (5) URLs for a single domain, your report will be marked as a duplicate submission taking into 
# account that the final outcome of such submissions would yield the same result as the original report. GoDaddy may in 
# its sole discretion deprioritize reports submitted by you and/or your organization in the event more than 20% of your 
# submissions are classified as duplicate submissions.</p><p>You further acknowledge and agree that our Customer Support 
# lines are not intended to address abuse reporting matters or your use of GoDaddy’s Abuse API. Contacting Customer 
# Support will not expedite the review process and may result in abuse reports being deprioritized, to be determined in 
# our sole discretion.</p><p>Should you have any questions about GoDaddy’s Abuse API or any of the terms and conditions 
# set forth above, please contact abuseapisupport@godaddy.com.</p>
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.  Create a [GoDaddy account](https://sg.godaddy.com/) and obtain tokens by following [this guide](https://developer.godaddy.com/getstarted).
    #
    # + apiKeyConfig - Provide your API Key as `Authorization`. Eg: {Authorization : sso-key [<API_KEY>]:[<API_SECRET>]}
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "//api.ote-godaddy.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
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
        string  path = string `/v1/abuse/tickets`;
        map<anydata> queryParam = {"type": 'type, "closed": closed, "sourceDomainOrIp": sourceDomainOrIp, "target": target, "createdStart": createdStart, "createdEnd": createdEnd, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AbuseTicketList response = check self.clientEp-> get(path, accHeaders, targetType = AbuseTicketList);
        return response;
    }
    # Creates a new abuse ticket.
    #
    # + payload - The endpoint which allows the Reporter to create a new abuse ticket
    # + return - No response was specified
    remote isolated function createTicket(AbuseTicketCreate payload) returns http:Response|error {
        string  path = string `/v1/abuse/tickets`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Returns the abuse ticket data for a given ticket id.
    #
    # + ticketId - A unique abuse ticket identifier
    # + return - Success
    remote isolated function getTicketInfo(string ticketId) returns AbuseTicket|error {
        string  path = string `/v1/abuse/tickets/${ticketId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AbuseTicket response = check self.clientEp-> get(path, accHeaders, targetType = AbuseTicket);
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
