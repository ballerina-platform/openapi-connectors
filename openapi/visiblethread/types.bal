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

public type DocumentListSummaryArr DocumentListSummary[];

public type ScanResponseSummaryArr ScanResponseSummary[];

public type NewscanresponseWeburls record {
    string url;
    int id;
};

public type ScanDetailed record {
    string title;
    WebUrl[] webUrls;
    Stats stats;
};

public type VerylongsentencesInner record {
    int 'start?;
    int end?;
    int wordCount?;
};

public type ScanResponseDetailed record {
    int id?;
    string started?;
    string eta?;
    string completed?;
    ScanDetailed scan?;
};

public type PassivesInner record {
    int 'start?;
    int end?;
    string verb?;
    string passivePiece?;
};

public type DocumentListSummary record {
    int id?;
    string name?;
};

public type NewscanScansettings record {
    int longSentenceWordCount?;
    int veryLongSentenceWordCount?;
};

public type Passives PassivesInner[];

public type HiddenVerbs HiddenverbsInner[];

public type ScanResponseSummary record {
    int id?;
    string started?;
    string eta?;
    string completed?;
    ScanSummary scan?;
};

public type LongSentences LongsentencesInner[];

public type VeryLongSentences VerylongsentencesInner[];

public type DocumentResponseDetailed record {
    int id?;
    string started?;
    string eta?;
    string completed?;
    string title?;
    Stats stats?;
    NewdocumentresponseScansettings scanSettings?;
    DocumentresponsedetailedParagraphs[] paragraphs?;
};

public type Search record {
    int docId;
    int dictId;
};

public type LongsentencesInner record {
    int 'start?;
    int end?;
    int wordCount?;
};

public type Adverbs AdverbsInner[];

public type WebResponseNotReady record {
    int id?;
    string started?;
    string eta?;
};

public type DocumentResponseNotReady record {
    int id?;
    string started?;
    string eta?;
};

public type NewscanWeburls record {
    string url;
};

public type HiddenverbsInner record {
    int 'start?;
    int end?;
    string noun?;
    string text?;
};

public type NewScanResponse record {
    int id;
    string title;
    NewscanresponseWeburls[] webUrls;
};

public type WebUrl record {
    *WebUrlHeader;
    Analysis analysis;
};

public type WebUrlDetail record {
    string title;
    string url;
    Stats stats;
    DocumentresponsedetailedParagraphs[] paragraphs?;
};

public type NewDocumentResponse record {
    int docId;
    string task;
    NewdocumentresponseScansettings scanSettings;
};

public type DocumentresponsedetailedParagraphs record {
    string text?;
    int paragraphIndex?;
    int paragraphCounter?;
    DocumentresponsedetailedStats stats?;
};

public type AdverbsInner record {
    int 'start?;
    int end?;
    string text?;
};

public type NewScan record {
    string title;
    NewscanWeburls[] webUrls;
    NewscanScansettings scanSettings?;
};

public type DocumentresponsedetailedStats record {
    LongSentences[] longSentences?;
    Passives[] passives?;
    VeryLongSentences[] veryLongSentences?;
    HiddenVerbs[] hiddenVerbs?;
    Adverbs[] adverbs?;
};

public type ScanSummary record {
    string title;
    WebUrlHeader[] webUrls;
};

public type Analysis record {
    string title?;
    Stats stats?;
};

public type WebUrlHeader record {
    int id;
    string url;
};

public type Stats record {
    int avgSentenceLength?;
    int fleschReadingLevel?;
    int wordCount?;
    int sentenceCount?;
    int longSentenceCount?;
    float fleschKincaidGradeLevel?;
    int passiveSentenceCount?;
};

public type NewdocumentresponseScansettings record {
    int longSentenceWordCount?;
    int veryLongSentenceWordCount?;
};
