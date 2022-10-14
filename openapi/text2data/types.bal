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

public type Category record {
    string CategoryName?;
    decimal Score?;
};

public type DocumentResult record {
    Category[] AutoCategories?;
    SentencePart[] Citations?;
    string CloudTagHTML?;
    Sentence[] CoreSentences?;
    string DetectedLanguage?;
    string DocSentimentPolarity?;
    string DocSentimentResultString?;
    decimal DocSentimentValue?;
    SentencePart[] Entities?;
    string ErrorMessage?;
    SentencePart[] Keywords?;
    decimal Magnitude?;
    PartOfSpeech[] PartsOfSpeech?;
    string ResultTextHtml?;
    SlangWord[] SlangWords?;
    int Status?;
    StorageInfo StorageInfo?;
    string Subjectivity?;
    SlangWord[] SwearWords?;
    SentencePart[] Themes?;
    int Timestamp?;
    int TransactionCurrentDay?;
    int TransactionDailyLimit?;
    int TransactionTotalCreditsLeft?;
    string TransactionUseByDate?;
    Category[] UserCategories?;
};

public type StorageInfo record {
    string CreateDate?;
    string DocumentText?;
    string IP?;
    boolean IsExcel?;
    boolean IsGSExcel?;
    boolean IsTwitterMode?;
    string PrivateKey?;
    string RequestIdentifier?;
    string UserCategoryModelName?;
};

public type ApiConfig record {
    string APIPrivateKey?;
    string APISecret?;
    string[] BlacklistedWords?;
    string ErrorMessage?;
    boolean IsRequestStatusOK?;
};

public type PartOfSpeech record {
    string Action?;
    string Object?;
    string ObjectSentimentPolarity?;
    string ObjectSentimentResultString?;
    decimal ObjectSentimentValue?;
    string Subject?;
    string Text?;
};

public type SentencePart record {
    string KeywordType?;
    decimal Magnitude?;
    int Mentions?;
    string SentencePartType?;
    string SentenceText?;
    string SentimentPolarity?;
    string SentimentResult?;
    decimal SentimentValue?;
    string Text?;
};

public type Document record {
    string DocumentLanguage?;
    string DocumentText;
    boolean IsTwitterContent?;
    string PrivateKey;
    string RequestIdentifier?;
    string Secret?;
    int SerializeFormat?;
    string UserCategoryModelName?;
};

public type Sentence record {
    decimal Magnitude?;
    int SentenceNumber?;
    string SentimentPolarity?;
    string SentimentResultString?;
    decimal SentimentValue?;
    string Text?;
};

public type SlangWord record {
    string SlangWordText?;
    string SlangWordTranslation?;
};
