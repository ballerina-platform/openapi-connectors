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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `X-Mitto-API-Key`
    string xMittoApiKey;
|};

# This is a generated connector for [Mitto SMS and Bulk SMS APIs v1](https://docs.mitto.ch/sms-api-reference/) OpenAPI specification.
# Send individual SMS reliably and securely, or send them in bulk. 
# You can choose from different servers to test with based on where you want to send a message to.
@display {label: "Mitto SMS", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Mitto account](https://docs.mitto.ch) and obtain tokens by following [this guide](https://docs.mitto.ch/sms-api/#authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://rest.mittoapi.net") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Send an SMS
    #
    # + payload - Request payload 
    # + return - Success. 
    remote isolated function sendSms(SmsBody payload) returns Sms|error {
        string resourcePath = string `/sms`;
        map<any> headerValues = {"X-Mitto-API-Key": self.apiKeyConfig.xMittoApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Sms response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Track Conversions
    #
    # + payload - Request payload 
    # + return - Success 
    remote isolated function trackConversions(SmsConvertedBody payload) returns http:Response|error {
        string resourcePath = string `/sms/converted`;
        map<any> headerValues = {"X-Mitto-API-Key": self.apiKeyConfig.xMittoApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Send SMS in Bulk
    #
    # + payload - Request payload 
    # + return - Success. 
    remote isolated function sendBulkSms(SmsbulkBody payload) returns Smsbulk|error {
        string resourcePath = string `/smsbulk`;
        map<any> headerValues = {"X-Mitto-API-Key": self.apiKeyConfig.xMittoApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Smsbulk response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Usage by Country
    #
    # + payload - Request payload 
    # + return - Success. 
    remote isolated function getUsageByCountry(UsageBycountryBody payload) returns Usage|error {
        string resourcePath = string `/usage/bycountry`;
        map<any> headerValues = {"X-Mitto-API-Key": self.apiKeyConfig.xMittoApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Usage response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
