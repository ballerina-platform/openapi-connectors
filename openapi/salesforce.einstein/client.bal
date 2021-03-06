// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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
import ballerina/mime;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
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

# This is a generated connector for [Einstein Vision and Einstein Language API](https://metamind.readme.io/reference#predictive-vision-service-api) OpenAPI specification. Allows you to access the Einstein Vision and Einstein Language services via the standard REST API calls. Use the APIs to programmatically work with datasets, labels, examples, models, and predictions.
@display {label: "Salesforce Einstein Vision And Lang", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Einstein API Account](https://api.einstein.ai/signup) and obtain tokens by following [this guide](https://metamind.readme.io/docs/generate-an-oauth-token-using-your-key).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.einstein.ai") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get API Isage
    #
    # + return - api usage 
    remote isolated function getApiUsage() returns ApiUsageList|error {
        string resourcePath = string `/v2/apiusage`;
        ApiUsageList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get All Langugae Datasets
    #
    # + offset - Index of the dataset from which you want to start paging 
    # + count - Number of datsets to return. Maximum valid value is 25. If you specify a number greater than 25, the call returns 25 datasets. 
    # + global - If true, returns all global datasets. Global datasets are public datasets that Salesforce provides. 
    # + return - Success 
    remote isolated function listLanguageDatasets(string offset = "0", string count = "25", boolean global = false) returns DatasetList|error {
        string resourcePath = string `/v2/language/datasets`;
        map<anydata> queryParam = {"offset": offset, "count": count, "global": global};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DatasetList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Dataset From a File Asynchronously
    #
    # + payload - Create dataset payload 
    # + return - Upload initiated 
    remote isolated function uploadDatasetAsync(DatasetsUploadBody payload) returns Dataset|error {
        string resourcePath = string `/v2/language/datasets/upload`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        Dataset response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a Dataset From a File Synchronously
    #
    # + payload - Create dataset payload 
    # + return - Upload success 
    remote isolated function uploadDatasetSync(UploadSyncBody payload) returns Dataset|error {
        string resourcePath = string `/v2/language/datasets/upload/sync`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        Dataset response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a Language Dataset
    #
    # + datasetId - Dataset Id 
    # + return - Success 
    remote isolated function getLanguageDataset(string datasetId) returns Dataset|error {
        string resourcePath = string `/v2/language/datasets/${datasetId}`;
        Dataset response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a Langugage Dataset
    #
    # + datasetId - Dataset Id 
    # + return - Success 
    remote isolated function deleteLanguageDataset(string datasetId) returns DeletionResponse|error {
        string resourcePath = string `/v2/language/datasets/${datasetId}`;
        DeletionResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Get All Language Examples
    #
    # + datasetId - Dataset Id 
    # + offset - Index of the example from which you want to start paging. 
    # + count - Number of examples to return. 
    # + 'source - return examples that were created in the dataset as feedback 
    # + return - Success 
    remote isolated function getLanguageExamples(string datasetId, string offset = "0", string count = "100", string? 'source = ()) returns ExampleList|error {
        string resourcePath = string `/v2/language/datasets/${datasetId}/examples`;
        map<anydata> queryParam = {"offset": offset, "count": count, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ExampleList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get All Language Models
    #
    # + offset - Index of the model from which you want to start paging. 
    # + count - Number of models to return. 
    # + datasetId - Dataset Id 
    # + return - Success 
    remote isolated function getTrainedLanguageModels(string datasetId, string offset = "0", string count = "100") returns ModelList|error {
        string resourcePath = string `/v2/language/datasets/${datasetId}/models`;
        map<anydata> queryParam = {"offset": offset, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ModelList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create Examples From a File
    #
    # + datasetId - Dataset Id 
    # + payload - Dataset upload payload 
    # + return - Upload success 
    remote isolated function updateLanguageDatasetAsync(string datasetId, DatasetidUploadBody payload) returns Dataset|error {
        string resourcePath = string `/v2/language/datasets/${datasetId}/upload`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        Dataset response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get Deletion Status of Language Dataset
    #
    # + id - Deletion Id 
    # + return - deletion status 
    remote isolated function getLanguageDatasetDeletionStatus(string id) returns DeletionResponse|error {
        string resourcePath = string `/v2/language/deletion/${id}`;
        DeletionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get All Examples for Label
    #
    # + labelId - Label Id 
    # + offset - Index of the example from which you want to start paging. 
    # + count - Number of examples to return. 
    # + return - Success 
    remote isolated function getExamplesByLabel(string? labelId = (), string offset = "0", string count = "100") returns ExampleList|error {
        string resourcePath = string `/v2/language/examples`;
        map<anydata> queryParam = {"labelId": labelId, "offset": offset, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ExampleList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Language Feedback Example
    #
    # + payload - Create dataset feedback payload 
    # + return - Upload success 
    remote isolated function provideLanguageFeedbackExample(LanguageFeedbackBody payload) returns Example|error {
        string resourcePath = string `/v2/language/feedback`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        Example response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Prediction for Intent
    #
    # + payload - Intent prediction payload 
    # + return - Prediction Result 
    remote isolated function getIntentPrediction(IntentPredictRequest payload) returns IntentPredictResponse|error {
        string resourcePath = string `/v2/language/intent`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IntentPredictResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Language Model Metrics
    #
    # + modelId - Model Id 
    # + return - Model Metrics 
    remote isolated function getTrainedLanguageModelMetrics(string modelId) returns Metrics|error {
        string resourcePath = string `/v2/language/models/${modelId}`;
        Metrics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a Language Model
    #
    # + modelId - Model Id 
    # + return - Deletion submitted 
    remote isolated function deleteLanguageModel(string modelId) returns DeletionResponse|error {
        string resourcePath = string `/v2/language/models/${modelId}`;
        DeletionResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Get Language Model Learning Curve
    #
    # + modelId - Model ID 
    # + offset - Index of the epoch from which you want to start paging 
    # + count - Number of epoch to return. Maximum valid value is 25. 
    # + return - Learning Curve 
    remote isolated function getTrainedLanguageModelLearningCurve(string modelId, string offset = "0", string count = "25") returns LearningCurveList|error {
        string resourcePath = string `/v2/language/models/${modelId}/lc`;
        map<anydata> queryParam = {"offset": offset, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        LearningCurveList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrain a Language Dataset
    #
    # + payload - Retrain language dataset payload. 
    # + return - Training Status 
    remote isolated function retrainLanguageDataset(LanguageRetrainBody payload) returns TrainResponse|error {
        string resourcePath = string `/v2/language/retrain`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        TrainResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Sentiment Prediction
    #
    # + payload - Sentiment prediction payload 
    # + return - Prediction Result 
    remote isolated function getSentimentPrediction(SentimentPredictRequest payload) returns SentimentPredictResponse|error {
        string resourcePath = string `/v2/language/sentiment`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SentimentPredictResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Train a Langugage Dataset
    #
    # + payload - Train dataset payload 
    # + return - Training Status 
    remote isolated function trainLanguageDataset(LanguageTrainBody payload) returns TrainResponse|error {
        string resourcePath = string `/v2/language/train`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        TrainResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Language Training Status
    #
    # + modelId - Model ID 
    # + return - Training Status 
    remote isolated function getLanguageTrainStatusAndProgress(string modelId) returns TrainResponse|error {
        string resourcePath = string `/v2/language/train/${modelId}`;
        TrainResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Generate an OAuth Token
    #
    # + payload - Generate token payload 
    # + return - access token result 
    remote isolated function generateTokenV2(Oauth2TokenBody payload) returns GenerateAccessTokenResponse|error {
        string resourcePath = string `/v2/oauth2/token`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        GenerateAccessTokenResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete a Refresh Token
    #
    # + token - the token to revoke 
    # + return - deleted, with no content returned 
    remote isolated function revokeRefreshTokenV2(string token) returns http:Response|error {
        string resourcePath = string `/v2/oauth2/tokens/${token}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Create Feedback Examples From a Zip File
    #
    # + payload - Create feedback payload. 
    # + return - Update success 
    remote isolated function addFeedbackExamples(VisionBulkfeedbackBody payload) returns Dataset|error {
        string resourcePath = string `/v2/vision/bulkfeedback`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        Dataset response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get All Vision Datasets
    #
    # + offset - Index of the dataset from which you want to start paging 
    # + count - Number of datsets to return. Maximum valid value is 25. If you specify a number greater than 25, the call returns 25 datasets. 
    # + global - If true, returns all global datasets. Global datasets are public datasets that Salesforce provides. 
    # + return - Success 
    remote isolated function listVisionDatasets(string offset = "0", string count = "25", boolean global = false) returns DatasetList|error {
        string resourcePath = string `/v2/vision/datasets`;
        map<anydata> queryParam = {"offset": offset, "count": count, "global": global};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DatasetList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Dataset
    #
    # + payload - Create dataset payload 
    # + return - Creation success 
    remote isolated function createDataset(VisionDatasetsBody payload) returns Dataset|error {
        string resourcePath = string `/v2/vision/datasets`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        Dataset response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a Dataset From a Zip File Asynchronously
    #
    # + payload - Create dataset payload 
    # + return - Upload initiated 
    remote isolated function uploadVisionDatasetAsync(DatasetsUploadBody1 payload) returns Dataset|error {
        string resourcePath = string `/v2/vision/datasets/upload`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        Dataset response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a Dataset From a Zip File Synchronously
    #
    # + payload - Create dataset payload 
    # + return - Upload success 
    remote isolated function uploadVisionDatasetSync(UploadSyncBody1 payload) returns Dataset|error {
        string resourcePath = string `/v2/vision/datasets/upload/sync`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        Dataset response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a Vision Dataset
    #
    # + datasetId - Dataset Id 
    # + return - Success 
    remote isolated function getVisionDataset(string datasetId) returns Dataset|error {
        string resourcePath = string `/v2/vision/datasets/${datasetId}`;
        Dataset response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a Vision Dataset
    #
    # + datasetId - Dataset Id 
    # + return - Success 
    remote isolated function deleteVisionDataset(string datasetId) returns DeletionResponse|error {
        string resourcePath = string `/v2/vision/datasets/${datasetId}`;
        DeletionResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Get All Vision Dataset Examples
    #
    # + datasetId - Dataset Id 
    # + offset - Index of the example from which you want to start paging. 
    # + count - Number of examples to return. 
    # + 'source - return examples that were created in the dataset as feedback 
    # + return - Success 
    remote isolated function getVisionDatasetExamples(string datasetId, string offset = "0", string count = "100", string? 'source = ()) returns ExampleList|error {
        string resourcePath = string `/v2/vision/datasets/${datasetId}/examples`;
        map<anydata> queryParam = {"offset": offset, "count": count, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ExampleList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an Example
    #
    # + datasetId - Dataset Id 
    # + payload - Create dataset example payload 
    # + return - Example created 
    remote isolated function addExample(string datasetId, DatasetidExamplesBody payload) returns Example|error {
        string resourcePath = string `/v2/vision/datasets/${datasetId}/examples`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        Example response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get All Vision Models
    #
    # + offset - Index of the model from which you want to start paging. 
    # + count - Number of models to return. 
    # + datasetId - Dataset Id 
    # + return - Success 
    remote isolated function getTrainedVisionModels(string datasetId, string offset = "0", string count = "100") returns ModelList|error {
        string resourcePath = string `/v2/vision/datasets/${datasetId}/models`;
        map<anydata> queryParam = {"offset": offset, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ModelList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create Examples From a Zip File
    #
    # + datasetId - Dataset Id 
    # + payload - Create dataset example payload 
    # + return - Upload success 
    remote isolated function updateVisionDatasetAsync(string datasetId, DatasetidUploadBody1 payload) returns Dataset|error {
        string resourcePath = string `/v2/vision/datasets/${datasetId}/upload`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        Dataset response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get Deletion Status of Vision Dataset
    #
    # + id - Deletion Id 
    # + return - deletion status 
    remote isolated function getVisionDatasetDeleteionStatus(string id) returns DeletionResponse|error {
        string resourcePath = string `/v2/vision/deletion/${id}`;
        DeletionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Detection with Image File
    #
    # + payload - Object detection payload 
    # + return - Detection Result 
    remote isolated function detectImage(ObjectDetectionRequest payload) returns ObjectDetectionResponse|error {
        string resourcePath = string `/v2/vision/detect`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ObjectDetectionResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get All Vision Examples for Label
    #
    # + labelId - Label Id 
    # + offset - Index of the example from which you want to start paging. 
    # + count - Number of examples to return. 
    # + return - Success 
    remote isolated function getVisionExamplesByLabel(string? labelId = (), string offset = "0", string count = "100") returns ExampleList|error {
        string resourcePath = string `/v2/vision/examples`;
        map<anydata> queryParam = {"labelId": labelId, "offset": offset, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ExampleList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Vision Feedback Example
    #
    # + payload - Create dataset feedback payload 
    # + return - Upload success 
    remote isolated function provideVisionFeedbackExample(VisionFeedbackBody payload) returns Example|error {
        string resourcePath = string `/v2/vision/feedback`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        Example response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Vision Model Metrics
    #
    # + modelId - Model ID 
    # + return - Model Metrics 
    remote isolated function getTrainedVisionModelMetrics(string modelId) returns Metrics|error {
        string resourcePath = string `/v2/vision/models/${modelId}`;
        Metrics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a Vision Model
    #
    # + modelId - Model ID 
    # + return - Deletion submitted 
    remote isolated function deleteVisionModel(string modelId) returns DeletionResponse|error {
        string resourcePath = string `/v2/vision/models/${modelId}`;
        DeletionResponse response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Get Vision Model Learning Curve
    #
    # + modelId - Model ID 
    # + offset - Index of the epoch from which you want to start paging 
    # + count - Number of epoch to return. Maximum valid value is 25. 
    # + return - Learning Curve 
    remote isolated function getTrainedVisionModelLearningCurve(string modelId, string offset = "0", string count = "25") returns LearningCurveList|error {
        string resourcePath = string `/v2/vision/models/${modelId}/lc`;
        map<anydata> queryParam = {"offset": offset, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        LearningCurveList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Detect Text
    #
    # + payload - Detect OCR prediction payload. 
    # + return - OCR Result 
    remote isolated function ocrMultipart(VisionOcrBody payload) returns OCRPredictResponse|error {
        string resourcePath = string `/v2/vision/ocr`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        OCRPredictResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Language Prediction
    #
    # + payload - Image prediction payload. 
    # + return - Prediction Result 
    remote isolated function getVisionPredict(ImageClassificationRequest payload) returns ImageClassificationResponse|error {
        string resourcePath = string `/v2/vision/predict`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ImageClassificationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrain a Vision Dataset
    #
    # + payload - Retrain vision dataset payload. 
    # + return - Training Status 
    remote isolated function retrainVisionDataset(VisionRetrainBody payload) returns TrainResponse|error {
        string resourcePath = string `/v2/vision/retrain`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        TrainResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Train a Vision Dataset
    #
    # + payload - Train dataset payload 
    # + return - Training Status 
    remote isolated function trainVisionDataset(VisionTrainBody payload) returns TrainResponse|error {
        string resourcePath = string `/v2/vision/train`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        TrainResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Vision Training Status
    #
    # + modelId - Model ID 
    # + return - Training Status 
    remote isolated function getVisionTrainStatusAndProgress(string modelId) returns TrainResponse|error {
        string resourcePath = string `/v2/vision/train/${modelId}`;
        TrainResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
