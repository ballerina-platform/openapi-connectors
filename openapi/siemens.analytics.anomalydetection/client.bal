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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_1_1;
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
    # Proxy server related options
    http:ProxyConfig? proxy = ();
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://oauth.simple.api/token";
|};

# This is a generated connector from [Siemens Analytics Anomaly Detection API](https://developer.mindsphere.io/apis/analytics-anomalydetection/api-anomalydetection-overview.html) OpenAPI Specification.
# The Anomaly Detection Service aims to automatically detect unexpected behaviour of processes and assets using time series data and provides API to train model and use it for anomaly detection. In the Interactive mode Analytic Model Management service is used as model storage. Model expiration date is set to 14 days.
@display {label: "Siemens Analytics Anomaly Detection", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Siemens MindSphere](https://siemens.mindsphere.io/en) account and obtain tokens by following [this guide](https://developer.mindsphere.io/concepts/concept-roles-scopes.html#iot-file-service). For accessing this service you need to have the respective roles listed in [Analytics roles and scopes](https://developer.mindsphere.io/concepts/concept-roles-scopes.html#analytics-services)
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Anomaly Detection batch reasoning
    #
    # + payload - Request data to launch reasoning job. 
    # + return - Accepted 
    remote isolated function detectAnomaliesbatchreasoning(SubmitReasoningRequest payload) returns ReasoningJobInfo|error {
        string resourcePath = string `/detectAnomaliesJobs`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ReasoningJobInfo response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get job status.
    #
    # + id - ID of the job to get status for. 
    # + return - OK 
    remote isolated function getJobStatus(string id) returns ReasoningJobInfo|error {
        string resourcePath = string `/detectAnomaliesJobs/${getEncodedUri(id)}`;
        ReasoningJobInfo response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Cancel job.
    #
    # + id - ID of the job to get status for. 
    # + return - Accepted 
    remote isolated function canceljob(string id) returns http:Response|error {
        string resourcePath = string `/detectAnomaliesJobs/${getEncodedUri(id)}/cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Anomaly Detection batch model training
    #
    # + payload - Request data to launch training job 
    # + return - Accepted 
    remote isolated function detectAnomalyBatchModelTraining(SubmitTrainingRequest payload) returns TrainingJobInfo|error {
        string resourcePath = string `/trainModelJobs`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TrainingJobInfo response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get job status.
    #
    # + id - ID of the job to get status for. 
    # + return - OK 
    remote isolated function getJobStatusTrainModelJobs(string id) returns TrainingJobInfo|error {
        string resourcePath = string `/trainModelJobs/${getEncodedUri(id)}`;
        TrainingJobInfo response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Cancel job.
    #
    # + id - ID of the job to get status for. 
    # + return - Accepted 
    remote isolated function cancelJobTrainModelJob(string id) returns http:Response|error {
        string resourcePath = string `/trainModelJobs/${getEncodedUri(id)}/cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Train model
    #
    # + epsilon - Threshold for the distance to check if point belongs to cluster. 
    # + minPointsPerCluster - Minimum cluster size. Positive. Minimum is 2. 
    # + distanceMeasureAlgorithm - Name of the distance measure algorithm. 
    # + name - Human-friendly name of the model. If a name is provided, it must not be an empty string. Maximum length is 255 characters. Only ASCII characters are allowed. Example 'Test Model 
    # + payload - An array containing the time series items. Data to train a model. Data must contain 10 variables at max. Each timeseries item must have equal number of variables. 
    # + return - Created 
    remote isolated function trainModel(float epsilon, int minPointsPerCluster, Timeseries[] payload, string distanceMeasureAlgorithm = "EUCLIDEAN", string name = "model") returns Model|error {
        string resourcePath = string `/models`;
        map<anydata> queryParam = {"epsilon": epsilon, "minPointsPerCluster": minPointsPerCluster, "distanceMeasureAlgorithm": distanceMeasureAlgorithm, "name": name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Model response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Anomaly detection
    #
    # + modelID - ID of the model to use. 
    # + payload - An array containing the time series items. Data to performs detection on. Data must contain 10 variables at max. Each timeseries item must have equal number of variables. Variables must be the same as the ones used to train the model (the same number of variables and the same names). 
    # + return - OK 
    remote isolated function detectAnomalies(string modelID, Timeseries[] payload) returns Anomaly[]|error {
        string resourcePath = string `/detectanomalies`;
        map<anydata> queryParam = {"modelID": modelID};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Anomaly[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Train model in direct integration with IoT time series
    #
    # + epsilon - Threshold for the distance to check if point belongs to cluster. 
    # + minPointsPerCluster - Minimum cluster size. Positive. Minimum is 2. 
    # + distanceMeasureAlgorithm - Name of the distance measure algorithm. 
    # + name - Human-friendly name of the model. If a name is provided, it must not be an empty string. Maximum length is 255 characters. Only ASCII characters are allowed. Example 'Test Model 
    # + assetId - unique identifier of the asset (entity) 
    # + aspectName - Name of the aspect (property set). 
    # + 'from - Beginning of the time range to be retrieved (exclusive). 
    # + to - End of the time range to be retrieved (exclusive). 
    # + return - Created 
    remote isolated function trainModelDirectIntegration(float epsilon, int minPointsPerCluster, string assetId, string aspectName, string 'from, string to, string distanceMeasureAlgorithm = "EUCLIDEAN", string name = "model") returns Model|error {
        string resourcePath = string `/modelsDirect`;
        map<anydata> queryParam = {"epsilon": epsilon, "minPointsPerCluster": minPointsPerCluster, "distanceMeasureAlgorithm": distanceMeasureAlgorithm, "name": name, "assetId": assetId, "aspectName": aspectName, "from": 'from, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Model response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Anomaly detection in direct integration with IoT time series
    #
    # + modelID - ID of the model to use. 
    # + assetId - unique identifier of the asset (entity) 
    # + aspectName - Name of the aspect (property set). 
    # + 'from - Beginning of the time range to be retrieved (exclusive). 
    # + to - End of the time range to be retrieved (exclusive). 
    # + return - OK 
    remote isolated function detectAnomaliesDirectIntegration(string modelID, string assetId, string aspectName, string 'from, string to) returns Anomaly[]|error {
        string resourcePath = string `/detectanomaliesDirect`;
        map<anydata> queryParam = {"modelID": modelID, "assetId": assetId, "aspectName": aspectName, "from": 'from, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Anomaly[] response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get model
    #
    # + id - ID of the model to get. Model ID corresponds ID from Analytic Model Management service. 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getModel(string id) returns Model|error {
        string resourcePath = string `/models/${getEncodedUri(id)}`;
        Model response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete model
    #
    # + id - ID of the model to delete. Model ID corresponds ID from Analytic Model Management service. 
    # + return - No content 
    # 
    # # Deprecated
    @deprecated
    remote isolated function deleteModel(string id) returns http:Response|error {
        string resourcePath = string `/models/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
