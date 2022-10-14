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

import ballerina/constraint;

public type ImageClassificationResponse record {
    string 'object?;
    LabelResult[] probabilities?;
    # Value passed in when the prediction call was made. Returned only if the sampleId request parameter is provided.
    string sampleId?;
};

# label
public type LabelResult record {
    # Probability lable for the input. 
    string label?;
    # Probability value for the input. Values are between 0�1.
    float probability?;
};

# Train dataset payload
public type LanguageTrainBody record {
    # Algorithm used for train
    string algorithm?;
    # ID of the dataset to train.
    int datasetId?;
    # Number of training iterations for the neural network. Optional.
    @constraint:Int {minValue: 1, maxValue: 1000}
    int epochs?;
    # N/A for intent or sentiment models.
    decimal learningRate?;
    # Name of the model. Maximum length is 180 characters.
    @constraint:String {maxLength: 180}
    string name?;
    # JSON that contains parameters that specify how the model is created
    V2LanguageTrainParams trainParams?;
};

# Contains additional attributes related to the task parameter. If the task parameter is table, the row and column IDs for the detected text are returned. If the task parameter is contact, the detected entity tags will be returned.
public type Attributes record {
    # Location information
    CellLocation cellLocation?;
    # Language of the key and value. Defaults to English. Only English is currently supported. Returned only when the task parameter value is form.
    string language?;
    # Page that contains the identified text. The model always returns 1, except when you send in a multi-page PDF.
    string pageNumber?;
    # Entity that the model predicts for the detected text.
    string tag?;
    # Contains the detected text of the data that was entered in the form field. For example, in a driver's license, the value might be 09/13/1999 for issue date. Returned only when the task parameter value is form
    EntityObject value?;
};

# Contains information about the label with which the example is associated.
public type Label record {
    # ID of the dataset that the label belongs to.
    int datasetId;
    # ID of the label.
    int id?;
    # Name of the label.
    string name;
    # Number of examples that have the label.
    int numExamples?;
};

# Create dataset payload
public type DatasetsUploadBody record {
    # Path to the .csv, .tsv, or .json file on the local drive (FilePart).
    string data?;
    # Name of the dataset. Optional. If this parameter is omitted, the dataset name is derived from the file name.
    string name?;
    # URL of the .csv, .tsv, or .json file.
    string path?;
    # Type of dataset data.
    string 'type?;
};

# Create dataset payload
public type UploadSyncBody1 record {
    # Path to the .zip file on the local drive (FilePart).
    string data?;
    # Name of the dataset. Optional. If this parameter is omitted, the dataset name is derived from the .zip file name.
    string name?;
    # URL of the .zip file.
    string path?;
    # Type of dataset data.
    string 'type?;
};

public type ExampleList record {
    Example[] data?;
    string 'object?;
};

public type Metrics record {
    string algorithm?;
    # Date and time that the model was created.
    string createdAt?;
    # Model Id
    string id?;
    string language?;
    # Model metrics values.
    record {} metricsData?;
    string 'object?;
};

# Object detection payload
public type ObjectDetectionRequest record {
    # ID of the model that makes the detection.
    string modelId;
    # The image contained in a base64 string.
    string sampleBase64Content?;
    # String that you can pass in to tag the prediction. Optional. Can be any value, and is returned in the response.
    string sampleId?;
    # URL of the image file.
    string sampleLocation?;
};

public type TrainResponse record {
    # Algorithm used to create the model. Returned only when the modelType is image-detection.
    string algorithm?;
    # Date and time that the model was created.
    string createdAt?;
    # ID of the dataset trained to create the model.
    int datasetId;
    # Not available yet
    int datasetVersionId;
    # Number of epochs used during training.
    int epochs?;
    # Reason the dataset training failed. Returned only if the training status is FAILED.
    string failureMsg?;
    # Model language inherited from the dataset language. For image datasets, default is N/A. For text datasets, default is en_US.
    string language;
    # Learning rate used during training.
    decimal learningRate?;
    # ID of the model. Contains letters and numbers.
    string modelId;
    # Type of data from which the model was created.
    string modelType?;
    # Name of the model.
    string name;
    # Object returned; in this case, training.
    string 'object?;
    # How far the dataset training has progressed. Values are between 0�1.
    decimal progress;
    # Where the training job is in the queue. This field appears in the response only if the status is QUEUED.
    int queuePosition?;
    # Status of the model.
    string status;
    # Training parameters passed into the request.
    string trainParams?;
    # Returns null when you train a dataset. Training statistics are returned when the status is SUCCEEDED or FAILED.
    string trainStats?;
    # Date and time that the model was last updated.
    string updatedAt?;
};

public type Example record {
    # Date and time that the example was created.
    string createdAt?;
    # ID of the example.
    int id;
    # Contains information about the label with which the example is associated.
    Label label?;
    # URL of the image in the dataset. This is a temporary URL that expires in 30 minutes. This URL can be used to display images that were uploaded to a dataset in a UI.
    string location?;
    # Name of the example.
    string name;
    # Object returned; in this case, example.
    string 'object?;
};

public type IntentPredictRequest record {
    # Text for which you want to return an intent prediction.
    string document;
    # ID of the model that makes the prediction. The model must have been created from a dataset with a type of text-sentiment.
    string modelId;
    # Number of probabilities to return. 
    @constraint:Int {minValue: 1}
    int numResults?;
    # String that you can pass in to tag the prediction. Optional. Can be any value, and is returned in the response.
    string sampleId?;
};

# Create dataset feedback payload
public type LanguageFeedbackBody record {
    # Intent or sentiment string to add to the dataset.
    string document?;
    # Correct label for the example. Must be a label that exists in the dataset.
    string expectedLabel?;
    # ID of the model that misclassified the image. The feedback example is added to the dataset associated with this model.
    string modelId?;
    # Name of the example. Optional. Maximum length is 180 characters.
    @constraint:String {maxLength: 180}
    string name?;
};

# Contains the detected text of the data that was entered in the form field. For example, in a driver's license, the value might be 09/13/1999 for issue date. Returned only when the task parameter value is form
public type EntityObject record {
    # Contains the coordinates for the bounding box that encloses the detected text.
    BoundingBox boundingBox?;
    # Entity
    string entity?;
    # The data value for the specified key. For example, For example, in a driver's license, if key text is 4a iss, the value text might be 09/13/1999.
    string text?;
};

# Retrain dataset payload
public type LanguageRetrainBody record {
    # Algorithm used for train
    string algorithm?;
    # Number of training iterations for the neural network. Optional.
    @constraint:Int {minValue: 1, maxValue: 1000}
    int epochs?;
    # N/A for intent or sentiment models.
    float learningRate?;
    # ID of the model to be updated from the training.
    string modelId?;
    # JSON that contains parameters that specify how the model is created
    V2LanguageTrainParams trainParams?;
};

public type PlanData record {
    int amount?;
    string plan?;
    string 'source?;
};

public type DatasetList record {
    Dataset[] data?;
    string 'object?;
};

# Create dataset payload
public type UploadSyncBody record {
    # Path to the .csv, .tsv, or .json file on the local drive (FilePart).
    string data?;
    # Name of the dataset. Optional. If this parameter is omitted, the dataset name is derived from the file name.
    string name?;
    # URL of the .csv, .tsv, or .json file.
    string path?;
    # Type of dataset data.
    string 'type?;
};

# Dataset upload payload
public type DatasetidUploadBody record {
    # Path to the .csv, .tsv, or .json file on a local drive. 
    string data?;
    # URL of the .csv, .tsv, or .json file.
    string 'type?;
};

# label
public type DetectionResult record {
    # Contains the coordinates for the bounding box that encloses the detected text.
    BoundingBox boundingBox?;
    # Probability lable for the input. 
    string label?;
    # Probability value for the input. Values are between 0�1.
    float probability?;
};

public type GenerateAccessTokenResponse record {
    string access_token?;
    string expires_in?;
    string refresh_token?;
    string token_type?;
};

public type SentimentPredictResponse record {
    string 'object?;
    LabelResult[] probabilities?;
    # Value passed in when the prediction call was made. Returned only if the sampleId request parameter is provided.
    string sampleId?;
};

public type ApiUsage record {
    string endsAt?;
    string id?;
    string licenseId?;
    string 'object?;
    string organizationId?;
    PlanData[] planData?;
    int predictionsMax?;
    int predictionsUsed?;
    string startsAt?;
};

# Contains the labels array that contains all the labels for the dataset.
public type LabelSummary record {
    # Contains information about the label with which the example is associated.
    Label[] labels?;
};

# Detect OCR prediction payload.
public type VisionOcrBody record {
    # ID of the model that makes the prediction. Valid values are OCRModel and tabulatev2.
    string modelId?;
    # Binary content of image file uploaded as multipart/form-data. Optional.
    string sampleContent?;
    # String that you can pass in to tag the prediction. Optional. Can be any value, and is returned in the response.
    string sampleId?;
    # URL of the image file. Use this parameter when sending in a file from a web location. Optional.
    string sampleLocation?;
    # Optional. Designates the type of data in the image. Default is text. Valid values: contact, table, and text.
    string task?;
};

public type PredictionErrorResponse record {
    string message?;
    string 'object?;
};

# JSON that contains parameters that specify how the model is created
public type V2VisionTrainParams record {
    # Lets you specify the ratio of data used to train the dataset and the data used to test the model.
    float trainSplitRatio?;
    # Lets you specify that feedback examples are included in the data to be trained to create the model.
    boolean withFeedback?;
    # Lets you specify that a global dataset is used in addition to the specified dataset to create the model.
    int withGlobalDatasetId?;
};

public type OCRPredictResponse record {
    string 'object?;
    OCRResult[] probabilities?;
    # Same value as request parameter. Returned only if the sampleId request parameter is provided.
    string sampleId?;
    # Same value as request parameter. Returns text if the request parameter isn't supplied.
    string task?;
};

# Image prediction payload.
public type ImageClassificationRequest record {
    # ID of the model that makes the prediction.
    string modelId;
    # Number of probabilities to return.
    @constraint:Int {minValue: 1}
    int numResults?;
    # The image contained in a base64 string.
    string sampleBase64Content?;
    # String that you can pass in to tag the prediction. Optional. Can be any value, and is returned in the response.
    string sampleId?;
    # URL of the image file.
    string sampleLocation?;
};

# Create dataset example payload
public type DatasetidExamplesBody record {
    # Location of the local image file to upload.
    string data?;
    # ID of the label to add to the example.
    int labelId?;
    # Name of the example. Maximum length is 180 characters.
    @constraint:String {maxLength: 180}
    string name?;
};

# Array of probabilities for the prediction.
public type OCRResult record {
    # Contains additional attributes related to the task parameter. If the task parameter is table, the row and column IDs for the detected text are returned. If the task parameter is contact, the detected entity tags will be returned.
    Attributes attributes?;
    # Contains the coordinates for the bounding box that encloses the detected text.
    BoundingBox boundingBox?;
    # Content of the detected text.
    string label?;
    # Probability value for the input. Values are between 0�1.
    float probability?;
};

public type ObjectDetectionResponse record {
    string 'object?;
    DetectionResult[] probabilities?;
    # Value passed in when the prediction call was made. Returned only if the sampleId request parameter is provided.
    string sampleId?;
};

public type LearningCurveList record {
    LearningCurve[] data?;
    string 'object?;
};

# Train dataset payload
public type VisionTrainBody record {
    # Specifies the algorithm used to train the dataset. Optional. Use this parameter only when training a dataset with a type of image-detection. Valid values are object-detection-v1 and retail-execution.
    string algorithm?;
    # ID of the dataset to train.
    int datasetId?;
    # Number of training iterations for the neural network. Optional.
    @constraint:Int {minValue: 1, maxValue: 1000}
    int epochs?;
    # Specifies how much the gradient affects the optimization of the model at each time step. Optional.
    decimal learningRate?;
    # Name of the model. Maximum length is 180 characters.
    @constraint:String {maxLength: 180}
    string name?;
    # JSON that contains parameters that specify how the model is created
    V2VisionTrainParams trainParams?;
};

# Create feedback payload.
public type VisionBulkfeedbackBody record {
    # Local .zip file to upload. The maximum .zip file size you can upload from a local drive is 50 MB.
    string data?;
    # ID of the model that misclassified the images. The feedback examples are added to the dataset associated with this model.
    string modelId?;
};

public type ModelList record {
    Model[] data?;
    string 'object?;
};

# JSON that contains parameters that specify how the model is created
public type V2LanguageTrainParams record {
    # Lets you specify the ratio of data used to train the dataset and the data used to test the model.
    float trainSplitRatio?;
    # Lets you specify that feedback examples are included in the data to be trained to create the model.
    boolean withFeedback?;
    # Lets you specify that a global dataset is used in addition to the specified dataset to create the model.
    int withGlobalDatasetId?;
};

# Contains the coordinates for the bounding box that encloses the detected text.
public type BoundingBox record {
    # X-coordinate of the left side of the bounding box. The origin of the coordinate system is the top-left of the image. Number of pixels from the left edge of the image.
    int maxX?;
    # Y-coordinate of the top of the bounding box. Number of pixels from the top edge of the image.
    int maxY?;
    # X-coordinate of the right side of the bounding box. Number of pixels from the left edge of the image.
    int minX?;
    # Y-coordinate of the bottom of the bounding box. Number of pixels from the top edge of the image.
    int minY?;
};

# Sentiment predict payload
public type SentimentPredictRequest record {
    # Text for which you want to return a sentiment prediction.
    string document;
    # ID of the model that makes the prediction. The model must have been created from a dataset with a type of text-sentiment.
    string modelId;
    # Number of probabilities to return. 
    @constraint:Int {minValue: 1}
    int numResults?;
    # String that you can pass in to tag the prediction. Optional. Can be any value, and is returned in the response.
    string sampleId?;
};

# Generate token payload
public type Oauth2TokenBody record {
    # encrypted payload to identify yourself
    string assertion?;
    # specify the authentication method desired
    string grant_type?;
    # The refresh token you created previously.
    string refresh_token?;
    # set to `offline` to generate a refresh token
    string scope?;
    # Number of seconds until the access token expires. Default is 60 seconds. Maximum value is 30 days
    int valid_for?;
};

# Create dataset example payload
public type DatasetidUploadBody1 record {
    # Location of the local image file to upload.
    string data?;
    # URL of the .zip file.
    string path?;
};

public type ApiUsageList record {
    ApiUsage[] data?;
    string 'object?;
};

public type DeletionResponse record {
    string deletedObjectId?;
    string id?;
    string message?;
    string 'object?;
    string organizationId?;
    decimal progress?;
    string status?;
    string 'type?;
};

public type LearningCurve record {
    # Epoch to which the metrics correspond.
    record {} epoch?;
    # Prediction results for the set of data used to test the model during training.
    record {} epochResults?;
    # Model metrics values.
    record {} metricsData?;
    # Object returned; in this case, learningcurve.
    string 'object?;
};

# Retrain dataset payload
public type VisionRetrainBody record {
    # Specifies the algorithm used to train the dataset. Optional. Use this parameter only when training a dataset with a type of image-detection. Valid values are object-detection-v1 and retail-execution.
    string algorithm?;
    # Number of training iterations for the neural network. Optional.
    @constraint:Int {minValue: 1, maxValue: 1000}
    int epochs?;
    # Specifies how much the gradient affects the optimization of the model at each time step. Optional.
    float learningRate?;
    # ID of the model to be updated from the training.
    string modelId?;
    # JSON that contains parameters that specify how the model is created
    V2VisionTrainParams trainParams?;
};

public type Dataset record {
    boolean available?;
    # Date and time that the dataset was created.
    string createdAt?;
    int id;
    # Contains the labels array that contains all the labels for the dataset.
    LabelSummary labelSummary?;
    # Dataset language.
    string language?;
    string name;
    # Number of duplicate images. This number includes duplicates in the .zip file from which the dataset was created plus the number of duplicate images from subsequent PUT calls to add images to the dataset.
    int numOfDuplicates?;
    # Object returned; in this case, dataset.
    string 'object?;
    string statusMsg?;
    # Total number of examples in the dataset.
    int totalExamples?;
    # Total number of labels in the dataset.
    int totalLabels?;
    string 'type?;
    string updatedAt?;
};

# Location information
public type CellLocation record {
    # Index of the column that contains the detected text.
    int colIndex?;
    # Index of the row that contains the detected text.
    int rowIndex?;
};

public type IntentPredictResponse record {
    string 'object?;
    LabelResult[] probabilities?;
    # Value passed in when the prediction call was made. Returned only if the sampleId request parameter is provided.
    string sampleId?;
};

public type Model record {
    # Algorithm used to create the model. Returned only when the modelType is image-detection.
    string algorithm?;
    # Date and time that the model was created.
    string createdAt?;
    # ID of the dataset trained to create the model.
    int datasetId;
    # Not available yet
    int datasetVersionId;
    # Reason the dataset training failed. Returned only if the training status is FAILED.
    string failureMsg?;
    # Model language inherited from the dataset language. For image datasets, default is N/A. For text datasets, default is en_US.
    string language?;
    # ID of the model. Contains letters and numbers.
    string modelId;
    # Type of data from which the model was created.
    string modelType?;
    # Name of the model.
    string name;
    # Object returned; in this case, model.
    string 'object?;
    # How far the dataset training has progressed. Values are between 0�1.
    decimal progress;
    # Status of the model.
    string status;
    # Date and time that the model was last updated.
    string updatedAt?;
};

# Create dataset payload
public type DatasetsUploadBody1 record {
    # Path to the .zip file on the local drive (FilePart).
    string data?;
    # Name of the dataset. Optional. If this parameter is omitted, the dataset name is derived from the .zip file name.
    string name?;
    # URL of the .zip file.
    string path?;
    # Type of dataset data.
    string 'type?;
};

# Create dataset payload
public type VisionDatasetsBody record {
    # Optional comma-separated list of labels. If specified, creates the labels in the dataset. Maximum number of labels per dataset is 250.
    string labels?;
    # Name of the dataset. Maximum length is 180 characters.
    @constraint:String {maxLength: 180}
    string name?;
    # Type of dataset data
    string 'type?;
};

# Create dataset feedback payload
public type VisionFeedbackBody record {
    # Local image file to upload.
    string data?;
    # Correct label for the example. Must be a label that exists in the dataset.
    string expectedLabel?;
    # ID of the model that misclassified the image. The feedback example is added to the dataset associated with this model.
    string modelId?;
    # Name of the example. Optional. Maximum length is 180 characters.
    @constraint:String {maxLength: 180}
    string name?;
};
