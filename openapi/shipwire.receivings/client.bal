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
public type ClientConfig record {|
    # Configurations related to client authentication
    http:CredentialsConfig auth;
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

# This is a generated connector for [Shipwire Receivings API v3.0](https://www.shipwire.com/developers/receiving) OpenAPI specification.
# Allows managing inventory at Shipwire and Shipwire Anywhere warehouses using receiving orders.
@display {label: "Shipwire Receivings", iconPath: "resources/shipwire.receivings.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Shipwire account](https://www.shipwire.com) and obtain tokens by following [this guide](https://www.shipwire.com/developers/getting-started).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.shipwire.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Get list of advance ship notices
    #
    # + expand - Expand receivings data in the response, instead of accessing directly via a URL (comma separated list). See resources `Holds`, `Instruction Recipients`, `Items`, `Shipments`, `labels` and `Trackings` for information on the data model returned by this parameter. 
    # + commerceName - Filter by commerceName (comma separated list) 
    # + transactionId - Filter by transactionId (comma separated list) 
    # + externalId - Filter by externalId (comma separated list) 
    # + orderId - Filter by orderId (comma separated list) 
    # + orderNo - Filter by orderNo (comma separated list) 
    # + status - Filter by status (comma separated list) 
    # + updatedAfter - Only show resources updated after this date (ISO 8601 format, ex: "2014-05-30T13:08:29-07:00") 
    # + warehouseId - Filter by warehouseId (comma separated list) 
    # + warehouseExternalId - Filter by warehouseExternalId (comma separated list) 
    # + vendorId - Filter by vendorId 
    # + vendorExternalId - Filter by vendorExternalId 
    # + return - OK 
    remote isolated function getReceivings(string[]? expand = (), string? commerceName = (), string? transactionId = (), string? externalId = (), string? orderId = (), string? orderNo = (), string? status = (), string? updatedAfter = (), string? warehouseId = (), string? warehouseExternalId = (), string? vendorId = (), string? vendorExternalId = ()) returns GetListOfAdvanceShipNoticesResponse|error {
        string  path = string `/api/v3/receivings`;
        map<anydata> queryParam = {"expand": expand, "commerceName": commerceName, "transactionId": transactionId, "externalId": externalId, "orderId": orderId, "orderNo": orderNo, "status": status, "updatedAfter": updatedAfter, "warehouseId": warehouseId, "warehouseExternalId": warehouseExternalId, "vendorId": vendorId, "vendorExternalId": vendorExternalId};
        path = path + check getPathForQueryParam(queryParam);
        GetListOfAdvanceShipNoticesResponse response = check self.clientEp-> get(path, targetType = GetListOfAdvanceShipNoticesResponse);
        return response;
    }
    # Create an advance ship notice
    #
    # + payload - CreateAnAdvanceShipNotice request 
    # + expand - Expand receivings data in the response, instead of accessing directly via a URL (comma separated list). See resources `Holds`, `Instruction Recipients`, `Items`, `Shipments`, `labels` and `Trackings` for information on the data model returned by this parameter. 
    # + return - OK 
    remote isolated function postReceivings(CreateAnAdvanceShipNoticeRequest payload, string[]? expand = ()) returns PostListOfAdvanceShipNoticesResponse|error {
        string  path = string `/api/v3/receivings`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PostListOfAdvanceShipNoticesResponse response = check self.clientEp->post(path, request, targetType=PostListOfAdvanceShipNoticesResponse);
        return response;
    }
    # Get advance ship notice
    #
    # + id - The advance ship notice's ID. 
    # + expand - Expand receivings data in the response, instead of accessing directly via a URL (comma separated list). See resources `Holds`, `Instruction Recipients`, `Items`, `Shipments`, `labels` and `Trackings` for information on the data model returned by this parameter. 
    # + return - OK 
    remote isolated function getReceivingsById(string id, string[]? expand = ()) returns GetAdvanceShipNoticeResponse|error {
        string  path = string `/api/v3/receivings/${id}`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        GetAdvanceShipNoticeResponse response = check self.clientEp-> get(path, targetType = GetAdvanceShipNoticeResponse);
        return response;
    }
    # Update an advance ship notice
    #
    # + id - The advance ship notice's ID. 
    # + payload - CreateAnAdvanceShipNotice request 
    # + expand - Expand receivings data in the response, instead of accessing directly via a URL (comma separated list). See resources `Holds`, `Instruction Recipients`, `Items`, `Shipments`, `labels` and `Trackings` for information on the data model returned by this parameter. 
    # + return - OK 
    remote isolated function putReceivingsById(string id, CreateAnAdvanceShipNoticeRequest payload, string[]? expand = ()) returns GetAdvanceShipNoticeResponse|error {
        string  path = string `/api/v3/receivings/${id}`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetAdvanceShipNoticeResponse response = check self.clientEp->put(path, request, targetType=GetAdvanceShipNoticeResponse);
        return response;
    }
    # Cancel a receiving order
    #
    # + id - The advance ship notice's ID. 
    # + return - OK 
    remote isolated function postReceivingsCancelById(string id) returns CancelAReceivingOrderResponse|error {
        string  path = string `/api/v3/receivings/${id}/cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        CancelAReceivingOrderResponse response = check self.clientEp-> post(path, request, targetType = CancelAReceivingOrderResponse);
        return response;
    }
    # Cancel a receiving label
    #
    # + id - The advance ship notice's ID. 
    # + return - OK 
    remote isolated function postReceivingsLabelsCancelById(string id) returns CancelAReceivingLabelResponse|error {
        string  path = string `/api/v3/receivings/${id}/labels/cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        CancelAReceivingLabelResponse response = check self.clientEp-> post(path, request, targetType = CancelAReceivingLabelResponse);
        return response;
    }
    # Get holds detail
    #
    # + id - The advance ship notice's ID. 
    # + includeCleared - When set to 1, response includes holds that have been cleared. 
    # + return - OK 
    remote isolated function getReceivingsHoldsById(string id, int? includeCleared = ()) returns GetHoldDetailsResponse|error {
        string  path = string `/api/v3/receivings/${id}/holds`;
        map<anydata> queryParam = {"includeCleared": includeCleared};
        path = path + check getPathForQueryParam(queryParam);
        GetHoldDetailsResponse response = check self.clientEp-> get(path, targetType = GetHoldDetailsResponse);
        return response;
    }
    # Get instructions and the recipients contact details
    #
    # + id - The advance ship notice's ID. 
    # + return - OK 
    remote isolated function getReceivingsInstructionsRecipientsById(string id) returns GetInstructionsRecipientsDetailsResponse|error {
        string  path = string `/api/v3/receivings/${id}/instructionsRecipients`;
        GetInstructionsRecipientsDetailsResponse response = check self.clientEp-> get(path, targetType = GetInstructionsRecipientsDetailsResponse);
        return response;
    }
    # Get receiving extended attributes
    #
    # + id - The receiving's ID. 
    # + return - OK 
    remote isolated function getReceivingsExtendedAttributesById(string id) returns GetReceivingExtendedAttributesResponse|error {
        string  path = string `/api/v3/receivings/${id}/extendedAttributes`;
        GetReceivingExtendedAttributesResponse response = check self.clientEp-> get(path, targetType = GetReceivingExtendedAttributesResponse);
        return response;
    }
    # Get items detail
    #
    # + id - The advance ship notice's ID. 
    # + return - OK 
    remote isolated function getReceivingsItemsById(string id) returns GetItemsDetailResponse|error {
        string  path = string `/api/v3/receivings/${id}/items`;
        GetItemsDetailResponse response = check self.clientEp-> get(path, targetType = GetItemsDetailResponse);
        return response;
    }
    # Get shipment details
    #
    # + id - The advance ship notice's ID. 
    # + return - OK 
    remote isolated function getReceivingsShipmentsById(string id) returns GetShipmentDetailsResponse|error {
        string  path = string `/api/v3/receivings/${id}/shipments`;
        GetShipmentDetailsResponse response = check self.clientEp-> get(path, targetType = GetShipmentDetailsResponse);
        return response;
    }
    # Get trackings detail
    #
    # + id - The advance ship notice's ID. 
    # + return - OK 
    remote isolated function getReceivingsTrackingsById(string id) returns GetTrackingsDetailResponse|error {
        string  path = string `/api/v3/receivings/${id}/trackings`;
        GetTrackingsDetailResponse response = check self.clientEp-> get(path, targetType = GetTrackingsDetailResponse);
        return response;
    }
    # Get labels detail
    #
    # + id - The advance ship notice's ID. 
    # + return - OK 
    remote isolated function getReceivingsLabelsById(string id) returns GetLabelsDetailResponse|error {
        string  path = string `/api/v3/receivings/${id}/labels`;
        GetLabelsDetailResponse response = check self.clientEp-> get(path, targetType = GetLabelsDetailResponse);
        return response;
    }
    # Mark the receiving completed
    #
    # + id - The advance ship notice's ID. 
    # + return - OK 
    remote isolated function postReceivingsMarkCompleteById(string id) returns MarkTheReceivingCompletedResponse|error {
        string  path = string `/api/v3.1/receivings/${id}/markComplete`;
        http:Request request = new;
        //TODO: Update the request as needed;
        MarkTheReceivingCompletedResponse response = check self.clientEp-> post(path, request, targetType = MarkTheReceivingCompletedResponse);
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
