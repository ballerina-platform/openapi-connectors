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

# This is a generated connector for [Shipwire Receivings API v3.0](https://www.shipwire.com/developers/receiving) OpenAPI specification.
# Allows managing inventory at Shipwire and Shipwire Anywhere warehouses using receiving orders.
@display {label: "Shipwire Receivings", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Shipwire account](https://www.shipwire.com) and obtain tokens by following [this guide](https://www.shipwire.com/developers/getting-started).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.shipwire.com/") returns error? {
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
        string resourcePath = string `/api/v3/receivings`;
        map<anydata> queryParam = {"expand": expand, "commerceName": commerceName, "transactionId": transactionId, "externalId": externalId, "orderId": orderId, "orderNo": orderNo, "status": status, "updatedAfter": updatedAfter, "warehouseId": warehouseId, "warehouseExternalId": warehouseExternalId, "vendorId": vendorId, "vendorExternalId": vendorExternalId};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GetListOfAdvanceShipNoticesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an advance ship notice
    #
    # + expand - Expand receivings data in the response, instead of accessing directly via a URL (comma separated list). See resources `Holds`, `Instruction Recipients`, `Items`, `Shipments`, `labels` and `Trackings` for information on the data model returned by this parameter. 
    # + payload - CreateAnAdvanceShipNotice request 
    # + return - OK 
    remote isolated function postReceivings(CreateAnAdvanceShipNoticeRequest payload, string[]? expand = ()) returns PostListOfAdvanceShipNoticesResponse|error {
        string resourcePath = string `/api/v3/receivings`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PostListOfAdvanceShipNoticesResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get advance ship notice
    #
    # + id - The advance ship notice's ID. 
    # + expand - Expand receivings data in the response, instead of accessing directly via a URL (comma separated list). See resources `Holds`, `Instruction Recipients`, `Items`, `Shipments`, `labels` and `Trackings` for information on the data model returned by this parameter. 
    # + return - OK 
    remote isolated function getReceivingsById(string id, string[]? expand = ()) returns GetAdvanceShipNoticeResponse|error {
        string resourcePath = string `/api/v3/receivings/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GetAdvanceShipNoticeResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an advance ship notice
    #
    # + id - The advance ship notice's ID. 
    # + expand - Expand receivings data in the response, instead of accessing directly via a URL (comma separated list). See resources `Holds`, `Instruction Recipients`, `Items`, `Shipments`, `labels` and `Trackings` for information on the data model returned by this parameter. 
    # + payload - CreateAnAdvanceShipNotice request 
    # + return - OK 
    remote isolated function putReceivingsById(string id, CreateAnAdvanceShipNoticeRequest payload, string[]? expand = ()) returns GetAdvanceShipNoticeResponse|error {
        string resourcePath = string `/api/v3/receivings/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetAdvanceShipNoticeResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Cancel a receiving order
    #
    # + id - The advance ship notice's ID. 
    # + return - OK 
    remote isolated function postReceivingsCancelById(string id) returns CancelAReceivingOrderResponse|error {
        string resourcePath = string `/api/v3/receivings/${getEncodedUri(id)}/cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        CancelAReceivingOrderResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Cancel a receiving label
    #
    # + id - The advance ship notice's ID. 
    # + return - OK 
    remote isolated function postReceivingsLabelsCancelById(string id) returns CancelAReceivingLabelResponse|error {
        string resourcePath = string `/api/v3/receivings/${getEncodedUri(id)}/labels/cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        CancelAReceivingLabelResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get holds detail
    #
    # + id - The advance ship notice's ID. 
    # + includeCleared - When set to 1, response includes holds that have been cleared. 
    # + return - OK 
    remote isolated function getReceivingsHoldsById(string id, int? includeCleared = ()) returns GetHoldDetailsResponse|error {
        string resourcePath = string `/api/v3/receivings/${getEncodedUri(id)}/holds`;
        map<anydata> queryParam = {"includeCleared": includeCleared};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GetHoldDetailsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get instructions and the recipients contact details
    #
    # + id - The advance ship notice's ID. 
    # + return - OK 
    remote isolated function getReceivingsInstructionsRecipientsById(string id) returns GetInstructionsRecipientsDetailsResponse|error {
        string resourcePath = string `/api/v3/receivings/${getEncodedUri(id)}/instructionsRecipients`;
        GetInstructionsRecipientsDetailsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get receiving extended attributes
    #
    # + id - The receiving's ID. 
    # + return - OK 
    remote isolated function getReceivingsExtendedAttributesById(string id) returns GetReceivingExtendedAttributesResponse|error {
        string resourcePath = string `/api/v3/receivings/${getEncodedUri(id)}/extendedAttributes`;
        GetReceivingExtendedAttributesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get items detail
    #
    # + id - The advance ship notice's ID. 
    # + return - OK 
    remote isolated function getReceivingsItemsById(string id) returns GetItemsDetailResponse|error {
        string resourcePath = string `/api/v3/receivings/${getEncodedUri(id)}/items`;
        GetItemsDetailResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get shipment details
    #
    # + id - The advance ship notice's ID. 
    # + return - OK 
    remote isolated function getReceivingsShipmentsById(string id) returns GetShipmentDetailsResponse|error {
        string resourcePath = string `/api/v3/receivings/${getEncodedUri(id)}/shipments`;
        GetShipmentDetailsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get trackings detail
    #
    # + id - The advance ship notice's ID. 
    # + return - OK 
    remote isolated function getReceivingsTrackingsById(string id) returns GetTrackingsDetailResponse|error {
        string resourcePath = string `/api/v3/receivings/${getEncodedUri(id)}/trackings`;
        GetTrackingsDetailResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get labels detail
    #
    # + id - The advance ship notice's ID. 
    # + return - OK 
    remote isolated function getReceivingsLabelsById(string id) returns GetLabelsDetailResponse|error {
        string resourcePath = string `/api/v3/receivings/${getEncodedUri(id)}/labels`;
        GetLabelsDetailResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Mark the receiving completed
    #
    # + id - The advance ship notice's ID. 
    # + return - OK 
    remote isolated function postReceivingsMarkCompleteById(string id) returns MarkTheReceivingCompletedResponse|error {
        string resourcePath = string `/api/v3.1/receivings/${getEncodedUri(id)}/markComplete`;
        http:Request request = new;
        //TODO: Update the request as needed;
        MarkTheReceivingCompletedResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
}
