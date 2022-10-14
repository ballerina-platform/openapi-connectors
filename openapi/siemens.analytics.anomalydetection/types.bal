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

public type AnomalyArr Anomaly[];

public type SubmitTrainingRequest record {
    # Name of the entity in IoT Timeseries service to read data for.
    string asset?;
    # Name of the property set in IoT Timeseries service to read data for.
    string aspect?;
    # List of variables to take from property set in IoT Timeseries service. Only those variables which are both in this list and in the propertySet will be taken. List must contain up to 10 variables.
    string variables?;
    # Beginning of the time range to read (exclusive) from IoT Timeseries service. Date must follow the specified format 'YYYY-MM-DDThh:mm:ss'.
    string 'from?;
    # End of the time range to read (inclusive) from IoT Timeseries service. Date must follow the specified format 'YYYY-MM-DDThh:mm:ss'.
    string to?;
    # Anomaly Detection threshold for the distance to check if point belongs to cluster.
    decimal epsilon?;
    # Anomaly detection minimum cluster size. Positive. Minimum is 2.
    decimal minPointsPerCluster?;
    # Name of the Anomaly Detection distance measure algorithm.
    string distanceMeasureAlgorithm?;
    # ID of the folder in Data Exchange Service to save results to. Must not be empty.
    string resultFolderId?;
};

public type Timeseries record {
    # time
    string _time;
};

public type WrongArgumentException record {
    string logref?;
    string message?;
};

public type NotFoundException record {
    string logref?;
    string message?;
};

public type Error record {
    string logref?;
    string message?;
};

public type ReasoningjobinfoParameters record {
    # Name of the entity in IoT Timeseries service to read data for.
    string asset?;
    # Name of the property set in IoT Timeseries service to read data for.
    string aspect?;
    # List of variables to take from property set in IoT Timeseries service. Only those variables which are both in this list and in the propertySet will be taken.
    string variables?;
    # Beginning of the time range to read (exclusive) from IoT Timeseries service. Date must follow the specified format 'YYYY-MM-DDThh:mm:ss'.
    string 'from?;
    # End of the time range to read (inclusive) from IoT Timeseries service. Date must follow the specified format 'YYYY-MM-DDThh:mm:ss'.
    string to?;
    # ID of the folder in Data Exchange Service to get model from. Must not be empty.
    string modelFolderId?;
    # ID of the folder in Data Exchange Service to save results to. Must not be empty.
    string resultFolderId?;
};

public type JobProcessingException record {
    string logref?;
    string message?;
};

public type ReasoningJobInfo record {
    # unique identifier of the job
    string id?;
    # job status
    string status?;
    # job creation time
    string timestamp?;
    ReasoningjobinfoParameters parameters?;
};

public type Model record {
    # ID of the created Model.
    string id?;
    # Timestamp model was created at.
    string creationTimestamp?;
    # Variables used to train the model (variables from input json).
    string variables?;
    # Human-friendly name of the model, not an empty string. Maximum length is 255 characters. Only ASCII characters.
    string name?;
};

public type TrainingJobInfo record {
    # unique identifier of the job
    string id?;
    # job status
    string status?;
    # job creation time
    string timestamp?;
    TrainingjobinfoParameters parameters?;
};

public type Anomaly record {
    # Extent of anomaly at this point
    decimal anomalyExtent?;
    # time
    string _time?;
};

public type SubmitReasoningRequest record {
    # Name of the entity in IoT Timeseries service to read data for.
    string asset?;
    # Name of the property set in IoT Timeseries service to read data for.
    string aspect?;
    # List of variables to take from property set in IoT Timeseries service. Only those variables which are both in this list and in the propertySet will be taken. Also this list must be the same as the one used to train the model, in other words training and reasoning must be performed over the same variables.
    string variables?;
    # Beginning of the time range to read (exclusive) from IoT Timeseries service. Date must follow the specified format 'YYYY-MM-DDThh:mm:ss'.
    string 'from?;
    # End of the time range to read (inclusive) from IoT Timeseries service. Date must follow the specified format 'YYYY-MM-DDThh:mm:ss'.
    string to?;
    # ID of the folder in Data Exchange Service to get model from. Must not be empty.
    string modelFolderId?;
    # ID of the folder in Data Exchange Service to save results to. Must not be empty.
    string resultFolderId?;
};

public type TrainingjobinfoParameters record {
    # Name of the entity in IoT Timeseries service to read data for.
    string asset?;
    # Name of the property set in IoT Timeseries service to read data for.
    string aspect?;
    # List of variables to take from property set in IoT Timeseries service. Only those variables which are both in this list and in the propertySet will be taken.
    string variables?;
    # Beginning of the time range to read (exclusive) from IoT Timeseries service. Date must follow the specified format 'YYYY-MM-DDThh:mm:ss'.
    string 'from?;
    # End of the time range to read (inclusive) from IoT Timeseries service. Date must follow the specified format 'YYYY-MM-DDThh:mm:ss'.
    string to?;
    # Anomaly Detection threshold for the distance to check if point belongs to cluster.
    decimal epsilon?;
    # Anomaly detection minimum cluster size. Positive. Minimum is 2.
    decimal minPointsPerCluster?;
    # Name of the Anomaly Detection distance measure algorithm.
    string distanceMeasureAlgorithm?;
    # ID of the folder in Data Exchange Service to save results to. Must not be empty.
    string resultFolderId?;
};
