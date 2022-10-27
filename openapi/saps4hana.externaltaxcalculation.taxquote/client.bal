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

# This is a generated connector for [SAP S/4HANA Integration with External Tax Calculation Engine API- Tax Determination and Calculation via Integration Flow API v1.0.0](https://api.sap.com/api/taxquote/overview) OpenAPI specification. 
# Your external tax engine sends tax calculation results to the SAP S/4HANA Cloud system via communication scenario SAP_COM_0249.
# This API is consumed by the [SAP S/4HANA Integration with External Tax Calculation Engines Integration Package](https://api.sap.com/package/SAPS4HANAIntegrationwithExternalTaxCalculationEngines) endpoint.
@display {label: "SAPS4HANA Tax Determination and Calculation", iconPath: "icon.png"}
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
    # Determines and calculates indirect taxes.
    #
    # + xCorrelationid - An ID that uniquely identifies an HTTP request. The SAP Cloud Integration generates a new correlation ID when you do not send the X-CorrelationID parameter on the HTTP request header. 
    # + xRoutingKey - The tax engine that you want to use to calculate taxes in a certain transaction (if you have configured multiple engines). 
    # + payload - The request payload as per the model schema provided. 
    # + return - OK 
    remote isolated function taxquote1(ApiV0SchemaTaxrequest payload, string? xCorrelationid = (), string? xRoutingKey = ()) returns ApiV0SchemaTaxresponse|error {
        string resourcePath = string `/quote`;
        map<any> headerValues = {"X-CorrelationID": xCorrelationid, "X-Routing-Key": xRoutingKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiV0SchemaTaxresponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
