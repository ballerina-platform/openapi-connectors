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

public type TopicSentiment record {
    Topic topic?;
    Sentiment sentiment?;
    string sentence?;
};

public type ValidationErrors record {
    ValidationError[] detail?;
};

public type Post record {
    # id of the post.
    string id?;
    # the text to be analysed.
    string text;
    # language_code of the text.
    string language;
};

public type Prediction record {
    # the predicted label.
    string prediction;
    # the probability of the predicted label.
    decimal probability;
};

public type PredictionResults PostPredicted[];

public type LanguageDetectionRequest LanguageDetection[64];

public type PostPredicted record {
    # id of the post.
    string id?;
    # the list of predictions.
    Prediction[] predictions;
};

public type LanguageDetectionResponse LanguagePredicted[];

public type Sentiment record {
    int 'start?;
    int end?;
    string text?;
    boolean positive?;
    float scale?;
    string category?;
    string parentCategory?;
    string negationTerm?;
};

public type TopicSentimentOutput record {
    string id?;
    string text?;
    string language?;
    TopicSentiment[] topicSentiments?;
    Sentiment[] sentiments?;
    Topic[] topics?;
};

public type PostRequest Post[32];

public type LanguageDetection record {
    # id of the text.
    string id?;
    # the text itself.
    string text;
};

public type TopicSentimentResponse TopicSentimentOutput[];

public type ValidationError record {
    string[] loc;
    string msg;
    string 'type;
};

public type Topic record {
    int 'start?;
    int end?;
    string topic?;
    string text?;
    string category?;
    float polarity?;
};

public type LanguagePredicted record {
    # id of the post.
    string id?;
    # the detected language_code corresponding to the input text.
    string detected_language;
};
