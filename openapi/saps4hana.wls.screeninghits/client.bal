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

# This is a generated connector for [SAPS4HANA SAP Watch List Screening Hits API v1.7](https://api.sap.com/api/ScreeningHits/resource) OpenAPI specification. 
# This microservice manages Screening Hits created by the Screening microservice and enables users to decide whether they are true matches or false positives. The Screening Hits are grouped in Screening Hit Collections. The Screening Hit Collection refers to a Business Context e.g. a Sales Order and contains one or more Screened Addresses.
@display {label: "SAPS4HANA Watch List Screening Hits", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create and configure an OAuth2 client credentials by following [this guide](https://help.sap.com/viewer/b865ed651e414196b39f8922db2122c7/LATEST/en-US/7aefa21a65f94b25b7e639c3931b6f83.html).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl) returns error? {
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
    # With the parameter screeningRequestKey as input, this API provides the current decision status of a ScreeningHitCollection. This is essential for either blocking or releasing the business transaction.
    #
    # + filter - Filter containing the UUID of the screening request, for example `screeningRequestKey eq 'be9828a4-6992-11e8-adc0-fa7ae01bbebc'` 
    # + return - Screening Decisions 
    remote isolated function get(string filter) returns ScreeningDecisions|error {
        string resourcePath = string `/screeningDecisions`;
        map<anydata> queryParam = {"$filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ScreeningDecisions response = check self.clientEp->get(resourcePath);
        return response;
    }
    # In some cases, you may want to post the initial screening request without the businessContext and add it later on. For example, when you screen your business document before it has been persisted, it may not have a documentId yet, and you may want to amend that once saving has been completed. PUT the /screeningHitCollections resource with the screeningRequestKey received in response to the screeningRequest to set the businessContext.
    #
    # + screeningRequestKey - UUID of the screening request 
    # + payload - Business context 
    # + return - Business context in the screening hit collection updated 
    remote isolated function put(string screeningRequestKey, BusinessContext payload) returns http:Response|error {
        string resourcePath = string `/screeningHitCollections`;
        map<anydata> queryParam = {"screeningRequestKey": screeningRequestKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # To remove old screening hits whose business purpose is fullfilled, you need to delete screeningHitCollections that are older than the effective date and also have the status `Completed`. Use the query parameter logicalDelete to remove the hits physically from storage (logicalDelete=false) or only logically (logicalDelete=true), meaning they are still there but no longer displayed in the user interfaces.
    #
    # + date - Screening hits created before this date are deleted (effective date, format YYYY-MM-DD (ISO8601) in UTC). 
    # + logicalDelete - Screening hits are logically deleted 
    # + return - Deletion successful 
    remote isolated function delete(string date, boolean logicalDelete) returns DeletionResult|error {
        string resourcePath = string `/screeningHitCollections`;
        map<anydata> queryParam = {"date": date, "logicalDelete": logicalDelete};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DeletionResult response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get Business Partner Data
    #
    # + name - Name of the business partner 
    # + street - Street 
    # + city - City 
    # + countryISOCode - Country ISO Code 
    # + postalCode - Postal Code 
    # + logicalDeleteIncluded - Include logically deleted business partners 
    # + return - Business Partner 
    remote isolated function getBPData(string name, string? street = (), string? city = (), string? countryISOCode = (), string? postalCode = (), boolean logicalDeleteIncluded = false) returns BusinessPartners|error {
        string resourcePath = string `/businessPartnerData`;
        map<anydata> queryParam = {"name": name, "street": street, "city": city, "countryISOCode": countryISOCode, "postalCode": postalCode, "logicalDeleteIncluded": logicalDeleteIncluded};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BusinessPartners response = check self.clientEp->get(resourcePath);
        return response;
    }
}
