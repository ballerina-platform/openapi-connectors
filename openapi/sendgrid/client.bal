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
import  ballerina/url;
import  ballerina/lang.'string;

public type ClientConfig record {
    http:BearerTokenConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# Client endpoint for Sendgrid API
#
# + clientEp - Connector http endpoint
@display {label: "Sendgrid Client"}
public client class Client {
    http:Client clientEp;
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
    remote isolated function sendMail(@display {label: "Email Content"} SendMailRequest payload) returns error? {
        string  path = string `/mail/send`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
         _ = check self.clientEp-> post(path, request, targetType=http:Response);
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
    # + alert_id - The ID of the alert you would like to retrieve.
    # + onBehalfOf - The subuser's username. This header generates the API call as if the subuser account was making the call.
    # + return - Succesful - No Content
    @display {label: "Delete Alert by Id"}
    remote isolated function deleteAlertById(@display {label: "Alert Id"} int alert_id, @display {label: "Subuser's Username"} string? onBehalfOf = ()) returns error? {
        string  path = string `/alerts/${alert_id}`;
        map<any> headerValues = {"on-behalf-of": onBehalfOf};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, headers = accHeaders, targetType=http:Response);
    }
    # Update an alert
    #
    # + alert_id - The ID of the alert you would like to retrieve.
    # + payload - Alert content to update
    # + onBehalfOf - The subuser's username. This header generates the API call as if the subuser account was making the call.
    # + return - Updated alert details
    @display {label: "Update Alert by Id"}
    remote isolated function updateAlertbyId(@display {label: "Alert Id"} int alert_id, UpdateAlertbyIdRequest payload, @display {label: "Subuser's Username"} string? onBehalfOf = ()) returns UpdateAlertbyIdResponse|error {
        string  path = string `/alerts/${alert_id}`;
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
    # + subuser_name - Subuser name
    # + return - Successful - No Content
    @display {label: "Update Subuser by Subuser Name"}
    remote isolated function deleteSubuserByName(@display {label: "Subuser Name"} string subuser_name) returns error? {
        string  path = string `/subusers/${subuser_name}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
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
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
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
isolated function  getMapForHeaders(map<any>   headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
