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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [Pushcut API v1](https://www.pushcut.io/webapi.html) OpenAPI specification.
# API to send Pushcut notifications, execute Automation Server actions, and register custom webhooks as online actions.
@display {label: "Pushcut", iconPath: "resources/pushcut.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Pushcut account](https://www.pushcut.io) and obtain tokens by following [this guide](https://www.pushcut.io/help).
    #
    # + apiKeyConfig - Provide your API key as `API-Key`. Eg: `{"API-Key" : "<API key>"}` 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.pushcut.io/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Get devices
    #
    # + return - Success 
    remote isolated function getDevices() returns InlineResponse200[]|error {
        string  path = string `/devices`;
        map<any> headerValues = {"API-Key": self.apiKeys["API-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse200[] response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse200Arr);
        return response;
    }
    # Get defined notifications
    #
    # + return - Success 
    remote isolated function getNotifications() returns InlineResponse2001[]|error {
        string  path = string `/notifications`;
        map<any> headerValues = {"API-Key": self.apiKeys["API-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001[] response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001Arr);
        return response;
    }
    # Send a smart notification
    #
    # + notificationName - Notification Name 
    # + payload - Extend and customize the defined notification by providing dynamic content. 
    # + return - Success 
    remote isolated function sendNotification(string notificationName, Notification payload) returns http:Response|error {
        string  path = string `/notifications/${notificationName}`;
        map<any> headerValues = {"API-Key": self.apiKeys["API-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Get a list of all online action subscriptions
    #
    # + return - Success 
    remote isolated function getSubscriptions() returns SubscriptionData[]|error {
        string  path = string `/subscriptions`;
        map<any> headerValues = {"API-Key": self.apiKeys["API-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SubscriptionData[] response = check self.clientEp-> get(path, accHeaders, targetType = SubscriptionDataArr);
        return response;
    }
    # Subscribe to an online action
    #
    # + payload - Subscription request 
    # + return - Success 
    remote isolated function actionExecuted(Subscription payload) returns InlineResponse2002|error {
        string  path = string `/subscriptions`;
        map<any> headerValues = {"API-Key": self.apiKeys["API-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2002 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse2002);
        return response;
    }
    # Remove an online action subscription
    #
    # + subscriptionId - Id that was returned when creating the subscription. 
    # + return - Success 
    remote isolated function deleteSubscription(string subscriptionId) returns http:Response|error {
        string  path = string `/subscriptions/${subscriptionId}`;
        map<any> headerValues = {"API-Key": self.apiKeys["API-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Execute an Automation Server action.
    #
    # + payload - Pass an input or optional configuration with the request. 
    # + shortcut - Shortcut 
    # + homekit - HomeKit scene 
    # + timeout - Timout in seconds, or 'nowait' 
    # + delay - Duration in which this request should be executed. Eg: 10s, 15m, 6h 
    # + identifier - Only used for delayed requests. Use an identifier to overwrite or cancel a scheduled execution. 
    # + return - Success 
    remote isolated function execute(Execute payload, string? shortcut = (), string? homekit = (), string? timeout = (), string? delay = (), string? identifier = ()) returns http:Response|error {
        string  path = string `/execute`;
        map<anydata> queryParam = {"shortcut": shortcut, "homekit": homekit, "timeout": timeout, "delay": delay, "identifier": identifier};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"API-Key": self.apiKeys["API-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Cancel a scheduled Automation Server action.
    #
    # + identifier - Identifier of the request. 
    # + return - Success 
    remote isolated function cancelExecution(string? identifier = ()) returns http:Response|error {
        string  path = string `/cancelExecution`;
        map<anydata> queryParam = {"identifier": identifier};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"API-Key": self.apiKeys["API-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
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
