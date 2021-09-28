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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector from [Apideck Proxy API v5.3.0](https://developers.apideck.com/apis/proxy/reference) OpenAPI specification.
# You can use this API to access all Proxy API endpoints.
@display {label: "Apideck Proxy", iconPath: "resources/apideck.proxy.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Unify API accounts have sandbox mode and live mode API keys. To change modes just use the appropriate key to get a live or test object. 
    # You can find your API keys on the unify settings of your Apideck app.Your Apideck application_id can also be found on the same page.
    # Obtain API keys following [this guide](https://developers.apideck.com/apis/proxy/reference#section/Authorization).
    #
    # + apiKeyConfig - Provide your API key as `Authorization`. Eg: `{"Authorization" : "<API key>"}` 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://unify.apideck.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # GET
    #
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + xApideckDownstreamUrl - Downstream URL 
    # + xApideckDownstreamAuthorization - Downstream authorization header. This will skip the Vault token injection. 
    # + return - Ok 
    remote isolated function getProxy(string xApideckConsumerId, string xApideckAppId, string xApideckServiceId, string xApideckDownstreamUrl, string? xApideckDownstreamAuthorization = ()) returns json|error {
        string  path = string `/proxy`;
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "x-apideck-downstream-url": xApideckDownstreamUrl, "x-apideck-downstream-authorization": xApideckDownstreamAuthorization, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # PUT
    #
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + xApideckDownstreamUrl - Downstream URL 
    # + payload - Depending on the verb/method of the request this will contain the request body you want to POST/PATCH/PUT. 
    # + xApideckDownstreamAuthorization - Downstream authorization header. This will skip the Vault token injection. 
    # + return - Ok 
    remote isolated function putProxy(string xApideckConsumerId, string xApideckAppId, string xApideckServiceId, string xApideckDownstreamUrl, PutProxyRequest payload, string? xApideckDownstreamAuthorization = ()) returns json|error {
        string  path = string `/proxy`;
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "x-apideck-downstream-url": xApideckDownstreamUrl, "x-apideck-downstream-authorization": xApideckDownstreamAuthorization, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, headers = accHeaders, targetType=json);
        return response;
    }
    # POST
    #
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + xApideckDownstreamUrl - Downstream URL 
    # + payload - Depending on the verb/method of the request this will contain the request body you want to POST/PATCH/PUT. 
    # + xApideckDownstreamAuthorization - Downstream authorization header. This will skip the Vault token injection. 
    # + return - Ok 
    remote isolated function postProxy(string xApideckConsumerId, string xApideckAppId, string xApideckServiceId, string xApideckDownstreamUrl, PostProxyRequest payload, string? xApideckDownstreamAuthorization = ()) returns json|error {
        string  path = string `/proxy`;
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "x-apideck-downstream-url": xApideckDownstreamUrl, "x-apideck-downstream-authorization": xApideckDownstreamAuthorization, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType=json);
        return response;
    }
    # DELETE
    #
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + xApideckDownstreamUrl - Downstream URL 
    # + xApideckDownstreamAuthorization - Downstream authorization header. This will skip the Vault token injection. 
    # + return - Ok 
    remote isolated function deleteProxy(string xApideckConsumerId, string xApideckAppId, string xApideckServiceId, string xApideckDownstreamUrl, string? xApideckDownstreamAuthorization = ()) returns json|error {
        string  path = string `/proxy`;
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "x-apideck-downstream-url": xApideckDownstreamUrl, "x-apideck-downstream-authorization": xApideckDownstreamAuthorization, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # PATCH
    #
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + xApideckDownstreamUrl - Downstream URL 
    # + payload - Depending on the verb/method of the request this will contain the request body you want to POST/PATCH/PUT. 
    # + xApideckDownstreamAuthorization - Downstream authorization header. This will skip the Vault token injection. 
    # + return - Ok 
    remote isolated function patchProxy(string xApideckConsumerId, string xApideckAppId, string xApideckServiceId, string xApideckDownstreamUrl, PatchProxyRequest payload, string? xApideckDownstreamAuthorization = ()) returns json|error {
        string  path = string `/proxy`;
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "x-apideck-downstream-url": xApideckDownstreamUrl, "x-apideck-downstream-authorization": xApideckDownstreamAuthorization, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=json);
        return response;
    }
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
