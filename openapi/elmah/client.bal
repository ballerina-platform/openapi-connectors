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

# Visit [here](https://docs.elmah.io/where-is-my-api-key/) to get information on obtaining API key
#
# + apiKeys - Provide your API key as `api_key`. Eg: `{"api_key" : "<API key>"}` 
public type ApiKeysConfig record {
    map<string> apiKeys;
};

# This is the public REST API for elmah.io. All of the integrations communicates with elmah.io through this API.<br/><br/>For additional help getting started with the API, visit the following help articles:<br/><ul><li>[Using the REST API](https://docs.elmah.io/using-the-rest-api/)</li><li>[Where is my API key?](https://docs.elmah.io/where-is-my-api-key/)</li><li>[Where is my log ID?](https://docs.elmah.io/where-is-my-log-id/)</li><li>[How to configure API key permissions](https://docs.elmah.io/how-to-configure-api-key-permissions/)</li></ul>
public client class Client {
    http:Client clientEp;
    map<string> apiKeys;
    
    # The HTTP client initialization requires setting the API credentials. Please create an [Elmah account](https://elmah.io) and obtain tokens following [this guide](https://docs.elmah.io/where-is-my-api-key/). Configure the API key to have the [required permission](https://docs.elmah.io/how-to-configure-api-key-permissions/).
    #
    # + apiKeyConfig - Provide your API key as `api_key`. Eg: `{"api_key" : "<API key>"}`
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Error at failure of client initialization
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.elmah.io") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys;
    }
    # Fetch a list of deployments.
    #
    # + return - Request for deployments successful.
    remote isolated function deploymentsGetAll() returns Deployment[]|error {
        string  path = string `/v3/deployments`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        Deployment[] response = check self.clientEp-> get(path, targetType = DeploymentArr);
        return response;
    }
    # Create a new deployment.
    #
    # + payload - The deployment object to create.
    # + return - Deployment was created.
    remote isolated function deploymentsCreate(CreateDeployment payload) returns CreateDeploymentResult|error {
        string  path = string `/v3/deployments`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateDeploymentResult response = check self.clientEp->post(path, request, targetType=CreateDeploymentResult);
        return response;
    }
    # Fetch a deployment by its ID.
    #
    # + id - The ID of the deployment to fetch.
    # + return - Request for deployment successful.
    remote isolated function deploymentsGet(string id) returns Deployment|error {
        string  path = string `/v3/deployments/${id}`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        Deployment response = check self.clientEp-> get(path, targetType = Deployment);
        return response;
    }
    # Delete a deployment by its ID.
    #
    # + id - The ID of the deployment to delete.
    # + return - Deployment was deleted.
    remote isolated function deploymentsDelete(string id) returns http:Response|error {
        string  path = string `/v3/deployments/${id}`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Create a new heartbeat.
    #
    # + id - The ID of the heartbeat check.
    # + logId - The ID of the log containing the heartbeat check.
    # + payload - The details of the heartbeat.
    # + return - Heartbeat was created.
    remote isolated function heartbeatsCreate(string id, string logId, CreateHeartbeat payload) returns http:Response|error {
        string  path = string `/v3/heartbeats/${logId}/${id}`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Fetch a list of logs.
    #
    # + return - Request for logs successful.
    remote isolated function logsGetAll() returns Log[]|error {
        string  path = string `/v3/logs`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        Log[] response = check self.clientEp-> get(path, targetType = LogArr);
        return response;
    }
    # Create a new log.
    #
    # + payload - The log object to create.
    # + return - Log where successfully created.
    remote isolated function logsCreate(CreateLog payload) returns CreateLogResult|error {
        string  path = string `/v3/logs`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateLogResult response = check self.clientEp->post(path, request, targetType=CreateLogResult);
        return response;
    }
    # Fetch a log by its ID.
    #
    # + id - The ID of the log to fetch.
    # + return - Request for log successful.
    remote isolated function logsGet(string id) returns Log|error {
        string  path = string `/v3/logs/${id}`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        Log response = check self.clientEp-> get(path, targetType = Log);
        return response;
    }
    # Disable a log by its ID.
    #
    # + id - The ID of the log to disable.
    # + return - Log was disabled.
    remote isolated function logsDisable(string id) returns http:Response|error {
        string  path = string `/v3/logs/${id}/_disable`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Enable a log by its ID.
    #
    # + id - The ID of the log to enable.
    # + return - Log was enabled.
    remote isolated function logsEnable(string id) returns http:Response|error {
        string  path = string `/v3/logs/${id}/_enable`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Fetch messages from a log.
    #
    # + logId - The ID of the log containing the messages.
    # + pageIndex - The page number of the result.
    # + pageSize - The number of messages to load (max 100) or 15 if not set.
    # + query - A full-text or Lucene query to limit the messages by.
    # + 'from - A start date and time to search from (not included).
    # + to - An end date and time to search to (not included).
    # + includeHeaders - Include headers like server variables and cookies in the result (slower).
    # + return - Log found and may contain messages.
    remote isolated function messagesGetAll(string logId, int pageIndex = 0, int pageSize = 15, string? query = (), string? 'from = (), string? to = (), boolean includeHeaders = false) returns MessagesResult|error {
        string  path = string `/v3/messages/${logId}`;
        map<anydata> queryParam = {"pageIndex": pageIndex, "pageSize": pageSize, "query": query, "from": 'from, "to": to, "includeHeaders": includeHeaders, api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        MessagesResult response = check self.clientEp-> get(path, targetType = MessagesResult);
        return response;
    }
    # Create a new message.
    #
    # + logId - The ID of the log which should contain the new message.
    # + payload - The message object to create.
    # + return - Message was not created.
    remote isolated function messagesCreate(string logId, CreateMessage payload) returns CreateMessageResult|error {
        string  path = string `/v3/messages/${logId}`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateMessageResult response = check self.clientEp->post(path, request, targetType=CreateMessageResult);
        return response;
    }
    # Deletes a list of messages by logid and query.
    #
    # + logId - The ID of the log containing the message.
    # + payload - A search object containing query, time filters etc.
    # + return - Messages where deleted.
    remote isolated function messagesDeleteAll(string logId, Search payload) returns http:Response|error {
        string  path = string `/v3/messages/${logId}`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->delete(path, request, targetType=http:Response);
        return response;
    }
    # Create one or more new messages.
    #
    # + logId - The ID of the log which should contain the new messages.
    # + payload - The messages to create.
    # + return - Zero or more messages where successfully created. Check the response body for details.
    remote isolated function messagesCreateBulk(string logId, CreateMessage[] payload) returns CreateBulkMessageResult[]|error {
        string  path = string `/v3/messages/${logId}/_bulk`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateBulkMessageResult[] response = check self.clientEp->post(path, request, targetType=CreateBulkMessageResultArr);
        return response;
    }
    # Fetch a message by its ID.
    #
    # + id - The ID of the message to fetch.
    # + logId - The ID of the log containing the message.
    # + return - Message found.
    remote isolated function messagesGet(string id, string logId) returns Message|error {
        string  path = string `/v3/messages/${logId}/${id}`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        Message response = check self.clientEp-> get(path, targetType = Message);
        return response;
    }
    # Delete a message by its ID.
    #
    # + id - The ID of the message to delete.
    # + logId - The ID of the log containing the message.
    # + return - Message where deleted.
    remote isolated function messagesDelete(string id, string logId) returns http:Response|error {
        string  path = string `/v3/messages/${logId}/${id}`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Fix a message by its ID.
    #
    # + id - The ID of the message to fix.
    # + logId - The ID of the log containing the message.
    # + markAllAsFixed - If set to true, all instances of the log message are set to fixed.
    # + return - Message was fixed.
    remote isolated function messagesFix(string id, string logId, boolean markAllAsFixed = false) returns http:Response|error {
        string  path = string `/v3/messages/${logId}/${id}/_fix`;
        map<anydata> queryParam = {"markAllAsFixed": markAllAsFixed, api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Hide a message by its ID.
    #
    # + id - The ID of the message to hide.
    # + logId - The ID of the log containing the message.
    # + return - Message was hidden.
    remote isolated function messagesHide(string id, string logId) returns http:Response|error {
        string  path = string `/v3/messages/${logId}/${id}/_hide`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Fetch a list of uptime checks. Currently in closed beta. Get in contact to get access to this endpoint.
    #
    # + return - Request for uptime checks successful.
    remote isolated function uptimeChecksGetAll() returns UptimeCheck[]|error {
        string  path = string `/v3/uptimechecks`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        UptimeCheck[] response = check self.clientEp-> get(path, targetType = UptimeCheckArr);
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
