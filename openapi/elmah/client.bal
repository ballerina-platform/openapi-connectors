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
    # All requests on the elmah.io API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be <code>api_key</code>.<br/><br/>Additional resources:<br/><ul><li>[Where is my API key?](https://docs.elmah.io/where-is-my-api-key/)</li><li>[How to configure API key permissions](https://docs.elmah.io/how-to-configure-api-key-permissions/)</li></ul>
    string apiKey;
|};

# This is a generated connector for [Elmah.io REST API v3](https://elmah.io) OpenAPI Specification.
# The public REST API for elmah.io. All of the integrations communicates with elmah.io through this API.
# For additional help getting started with the API, visit the following help articles:
# <ul><li>[Using the REST API](https://docs.elmah.io/using-the-rest-api/)</li><li>[Where is my API key?](https://docs.elmah.io/where-is-my-api-key/)</li><li>[Where is my log ID?](https://docs.elmah.io/where-is-my-log-id/)</li><li>[How to configure API key permissions](https://docs.elmah.io/how-to-configure-api-key-permissions/)</li></ul>
@display {label: "Elmah", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Elmah account](https://elmah.io) and obtain tokens following [this guide](https://docs.elmah.io/where-is-my-api-key/).
    # Configure the API key to have the [required permission](https://docs.elmah.io/how-to-configure-api-key-permissions/).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.elmah.io") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Fetch a list of deployments.
    #
    # + return - Request for deployments successful. 
    remote isolated function deploymentsGetAll() returns Deployment[]|error {
        string resourcePath = string `/v3/deployments`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Deployment[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new deployment.
    #
    # + payload - The deployment object to create. 
    # + return - Deployment was created. 
    remote isolated function deploymentsCreate(CreateDeployment payload) returns CreateDeploymentResult|error {
        string resourcePath = string `/v3/deployments`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/*+json");
        CreateDeploymentResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch a deployment by its ID.
    #
    # + id - The ID of the deployment to fetch. 
    # + return - Request for deployment successful. 
    remote isolated function deploymentsGet(string id) returns Deployment|error {
        string resourcePath = string `/v3/deployments/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Deployment response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a deployment by its ID.
    #
    # + id - The ID of the deployment to delete. 
    # + return - Deployment was deleted. 
    remote isolated function deploymentsDelete(string id) returns http:Response|error {
        string resourcePath = string `/v3/deployments/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Create a new heartbeat.
    #
    # + id - The ID of the heartbeat check. 
    # + logId - The ID of the log containing the heartbeat check. 
    # + payload - The details of the heartbeat. 
    # + return - Heartbeat was created. 
    remote isolated function heartbeatsCreate(string id, string logId, CreateHeartbeat payload) returns http:Response|error {
        string resourcePath = string `/v3/heartbeats/${getEncodedUri(logId)}/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/*+json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch a list of logs.
    #
    # + return - Request for logs successful. 
    remote isolated function logsGetAll() returns Log[]|error {
        string resourcePath = string `/v3/logs`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Log[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new log.
    #
    # + payload - The log object to create. 
    # + return - Log where successfully created. 
    remote isolated function logsCreate(CreateLog payload) returns CreateLogResult|error {
        string resourcePath = string `/v3/logs`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/*+json");
        CreateLogResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch a log by its ID.
    #
    # + id - The ID of the log to fetch. 
    # + return - Request for log successful. 
    remote isolated function logsGet(string id) returns Log|error {
        string resourcePath = string `/v3/logs/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Log response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Disable a log by its ID.
    #
    # + id - The ID of the log to disable. 
    # + return - Log was disabled. 
    remote isolated function logsDisable(string id) returns http:Response|error {
        string resourcePath = string `/v3/logs/${getEncodedUri(id)}/_disable`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Enable a log by its ID.
    #
    # + id - The ID of the log to enable. 
    # + return - Log was enabled. 
    remote isolated function logsEnable(string id) returns http:Response|error {
        string resourcePath = string `/v3/logs/${getEncodedUri(id)}/_enable`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
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
        string resourcePath = string `/v3/messages/${getEncodedUri(logId)}`;
        map<anydata> queryParam = {"pageIndex": pageIndex, "pageSize": pageSize, "query": query, "from": 'from, "to": to, "includeHeaders": includeHeaders, "api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        MessagesResult response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new message.
    #
    # + logId - The ID of the log which should contain the new message. 
    # + payload - The message object to create. 
    # + return - Message was not created. 
    remote isolated function messagesCreate(string logId, CreateMessage payload) returns CreateMessageResult|error {
        string resourcePath = string `/v3/messages/${getEncodedUri(logId)}`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/*+json");
        CreateMessageResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Deletes a list of messages by logid and query.
    #
    # + logId - The ID of the log containing the message. 
    # + return - Messages where deleted. 
    remote isolated function messagesDeleteAll(string logId) returns http:Response|error {
        string resourcePath = string `/v3/messages/${getEncodedUri(logId)}`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Create one or more new messages.
    #
    # + logId - The ID of the log which should contain the new messages. 
    # + payload - The messages to create. 
    # + return - Zero or more messages where successfully created. Check the response body for details. 
    remote isolated function messagesCreateBulk(string logId, CreateMessage[] payload) returns CreateBulkMessageResult[]|error {
        string resourcePath = string `/v3/messages/${getEncodedUri(logId)}/_bulk`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/*+json");
        CreateBulkMessageResult[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Fetch a message by its ID.
    #
    # + id - The ID of the message to fetch. 
    # + logId - The ID of the log containing the message. 
    # + return - Message found. 
    remote isolated function messagesGet(string id, string logId) returns Message|error {
        string resourcePath = string `/v3/messages/${getEncodedUri(logId)}/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Message response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a message by its ID.
    #
    # + id - The ID of the message to delete. 
    # + logId - The ID of the log containing the message. 
    # + return - Message where deleted. 
    remote isolated function messagesDelete(string id, string logId) returns http:Response|error {
        string resourcePath = string `/v3/messages/${getEncodedUri(logId)}/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Fix a message by its ID.
    #
    # + id - The ID of the message to fix. 
    # + logId - The ID of the log containing the message. 
    # + markAllAsFixed - If set to true, all instances of the log message are set to fixed. 
    # + return - Message was fixed. 
    remote isolated function messagesFix(string id, string logId, boolean markAllAsFixed = false) returns http:Response|error {
        string resourcePath = string `/v3/messages/${getEncodedUri(logId)}/${getEncodedUri(id)}/_fix`;
        map<anydata> queryParam = {"markAllAsFixed": markAllAsFixed, "api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Hide a message by its ID.
    #
    # + id - The ID of the message to hide. 
    # + logId - The ID of the log containing the message. 
    # + return - Message was hidden. 
    remote isolated function messagesHide(string id, string logId) returns http:Response|error {
        string resourcePath = string `/v3/messages/${getEncodedUri(logId)}/${getEncodedUri(id)}/_hide`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Fetch a list of uptime checks. Currently in closed beta. Get in contact to get access to this endpoint.
    #
    # + return - Request for uptime checks successful. 
    remote isolated function uptimeChecksGetAll() returns UptimeCheck[]|error {
        string resourcePath = string `/v3/uptimechecks`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UptimeCheck[] response = check self.clientEp->get(resourcePath);
        return response;
    }
}
