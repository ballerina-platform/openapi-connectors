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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
#
# + authConfig - Configurations related to client authentication
# + secureSocketConfig - SSL/TLS-related configurations
public type ClientConfig record {
    http:BearerTokenConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# This is a generated connector for [Sendgrid API v3](https://docs.sendgrid.com/api-reference/how-to-use-the-sendgrid-v3-api/) OpenAPI Specification. 
# The Beta endpoints for the new Email Activity APIs - functionality is subject to change without notice. You may not have access to this Beta endpoint.
# Email Activity offers filtering and search by event type for two days worth of data. There is an optional add-on to store 60 days worth of data. This add-on also gives you access to the ability to download a CSV of the 60 days worth of email event data.
@display {label: "Sendgrid Client"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Sendgrid](https://sendgrid.com/) account and obtain an API Key visiting [Settings -> APIKeys](https://app.sendgrid.com/settings/api_keys). Use the obtained API Key as the token at connector initialization. Configure [required permissions](https://docs.sendgrid.com/ui/account-and-settings/api-keys) when generating the API Key.
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.sendgrid.com/v3") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Send Mail
    #
    # + payload - Mail content
    # + return - No Content
    @display {label: "Send Email"}
    remote isolated function sendMail(@display {label: "Email Content"} SendEmailRequest payload) returns http:Response|error {
        string  path = string `/mail/send`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Retrieve all alerts
    #
    # + onBehalfOf - The subuser's username. This header generates the API call as if the subuser account was making the call.
    # + return - Details related to alerts
    @display {label: "Get All Alerts"}
    remote isolated function getAlerts(@display {label: "Subuser's Username"} string? onBehalfOf = ()) returns AlertResponse[]|error {
        string  path = string `/alerts`;
        map<any> headerValues = {"on-behalf-of": onBehalfOf};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AlertResponse[] response = check self.clientEp-> get(path, accHeaders, targetType = AlertResponseArr);
        return response;
    }
    # Create a new Alert
    #
    # + payload - Alert Content
    # + onBehalfOf - The subuser's username. This header generates the API call as if the subuser account was making the call.
    # + return - Created alert details
    @display {label: "Create Alert"}
    remote isolated function postAlerts(@display {label: "Alert Content"} PostAlertsRequest payload, @display {label: "Subuser's Username"} string? onBehalfOf = ()) returns PostAlertsResponse|error {
        string  path = string `/alerts`;
        map<any> headerValues = {"on-behalf-of": onBehalfOf};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PostAlertsResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PostAlertsResponse);
        return response;
    }
    # Delete an alert
    #
    # + alertId - The ID of the alert you would like to retrieve.
    # + onBehalfOf - The subuser's username. This header generates the API call as if the subuser account was making the call.
    # + return - Succesful - No Content
    @display {label: "Delete Alert by Id"}
    remote isolated function deleteAlertById(@display {label: "Alert Id"} int alertId, @display {label: "Subuser's Username"} string? onBehalfOf = ()) returns http:Response|error {
        string  path = string `/alerts/${alertId}`;
        map<any> headerValues = {"on-behalf-of": onBehalfOf};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update an alert
    #
    # + alertId - The ID of the alert you would like to retrieve.
    # + payload - Alert content to update
    # + onBehalfOf - The subuser's username. This header generates the API call as if the subuser account was making the call.
    # + return - Updated alert details
    @display {label: "Update Alert by Id"}
    remote isolated function updateAlertbyId(@display {label: "Alert Id"} int alertId, UpdateAlertbyIdRequest payload, @display {label: "Subuser's Username"} string? onBehalfOf = ()) returns UpdateAlertbyIdResponse|error {
        string  path = string `/alerts/${alertId}`;
        map<any> headerValues = {"on-behalf-of": onBehalfOf};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UpdateAlertbyIdResponse response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=UpdateAlertbyIdResponse);
        return response;
    }
    # List all Subusers
    #
    # + username - The username of this subuser.
    # + 'limit - The number of results you would like to get in each request.
    # + offset - The number of subusers to skip.
    # + return - List of Subusers
    @display {label: "List All Subusers"}
    remote isolated function getSubusers(@display {label: "Username"} string? username = (), @display {label: "Limit"} int? 'limit = (), @display {label: "Offset"} int? offset = ()) returns Subuser[]|error {
        string  path = string `/subusers`;
        map<anydata> queryParam = {"username": username, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        Subuser[] response = check self.clientEp-> get(path, targetType = SubuserArr);
        return response;
    }
    # Create Subuser
    #
    # + payload - New subuser details
    # + return - Created subuser's details
    remote isolated function postSubusers(@display {label: "New Subuser Details"} PostSubusersRequest payload) returns SubuserPost|error {
        string  path = string `/subusers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SubuserPost response = check self.clientEp->post(path, request, targetType=SubuserPost);
        return response;
    }
    # Delete a subuser
    #
    # + subuserName - Subuser name
    # + return - Successful - No Content
    @display {label: "Update Subuser by Subuser Name"}
    remote isolated function deleteSubuserByName(@display {label: "Subuser Name"} string subuserName) returns http:Response|error {
        string  path = string `/subusers/${subuserName}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Retrieve all blocks
    #
    # + startTime - Refers start of the time range in unix timestamp when a blocked email was created (inclusive).
    # + endTime - Refers end of the time range in unix timestamp when a blocked email was created (inclusive).
    # + 'limit - Limit the number of results to be displayed per page.
    # + offset - The point in the list to begin displaying results.
    # + onBehalfOf - The subuser's username. This header generates the API call as if the subuser account was making the call.
    # + return - List of all blocks
    @display {label: "Get Suppression Blocks"}
    remote isolated function getSuppressionBlocks(@display {label: "Start Time"} int? startTime = (), @display {label: "End Time"} int? endTime = (), @display {label: "Limit"} int? 'limit = (), @display {label: "Offset"} int? offset = (), @display {label: "Subuser's Username"} string? onBehalfOf = ()) returns SuppressionBlocks[]|error {
        string  path = string `/suppression/blocks`;
        map<anydata> queryParam = {"start_time": startTime, "end_time": endTime, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"on-behalf-of": onBehalfOf};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SuppressionBlocks[] response = check self.clientEp-> get(path, accHeaders, targetType = SuppressionBlocksArr);
        return response;
    }
    # Retrieve all spam reports
    #
    # + startTime - Refers start of the time range in unix timestamp when a spam report was created (inclusive).
    # + endTime - Refers end of the time range in unix timestamp when a spam report was created (inclusive).
    # + 'limit - Limit the number of results to be displayed per page.
    # + offset - Paging offset. The point in the list to begin displaying results.
    # + onBehalfOf - The subuser's username. This header generates the API call as if the subuser account was making the call.
    # + return - Received spam reports
    @display {label: "Get Suppression Spam Reports"}
    remote isolated function getSuppressionSpamReports(@display {label: "Start Time"} int? startTime = (), @display {label: "End Time"} int? endTime = (), @display {label: "Limit"} int? 'limit = (), @display {label: "Offset"} int? offset = (), @display {label: "Subuser's Username"} string? onBehalfOf = ()) returns SpamReportDetails[]|error {
        string  path = string `/suppression/spam_reports`;
        map<anydata> queryParam = {"start_time": startTime, "end_time": endTime, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"on-behalf-of": onBehalfOf};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SpamReportDetails[] response = check self.clientEp-> get(path, accHeaders, targetType = SpamReportDetailsArr);
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
