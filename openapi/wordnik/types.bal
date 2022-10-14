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

public type WordListArr WordList[];

public type AudioFileArr AudioFile[];

public type DefinitionArr Definition[];

public type StringArr string[];

public type SyllableArr Syllable[];

public type BigramArr Bigram[];

public type TextPronArr TextPron[];

public type RelatedArr Related[];

public type WordListWordArr WordListWord[];

public type WordObjectArr WordObject[];

public type ApiTokenStatus record {
    int expiresInMillis?;
    int remainingCalls?;
    int resetsInMillis?;
    string token?;
    int totalRequests?;
    boolean valid?;
};

public type AuthenticationToken record {
    string token?;
    int userId?;
    string userSignature?;
};

public type Category record {
    int id;
    string name?;
};

public type User record {
    string displayName?;
    string email?;
    string faceBookId?;
    int id?;
    string password?;
    int status?;
    string userName?;
    string username?;
};

public type ContentProvider record {
    int id?;
    string name?;
};

public type FrequencySummary record {
    anydata[] frequency?;
    string frequencyString?;
    int totalCount?;
    int unknownYearCount?;
    string word?;
};

public type Label record {
    string text?;
    string 'type?;
};

public type TextPron record {
    string raw?;
    string rawType?;
    int seq?;
};

public type FacetValue record {
    int count?;
    string value?;
};

public type SimpleExample record {
    int id?;
    string text?;
    string title?;
    string url?;
};

public type Example record {
    int documentId?;
    int exampleId?;
    int id?;
    ContentProvider provider?;
    float rating?;
    ScoredWord score?;
    Sentence sentence?;
    string text?;
    string title?;
    string url?;
    string word?;
    int year?;
};

public type SimpleDefinition record {
    string note?;
    string partOfSpeech?;
    string 'source?;
    string text?;
};

public type ExampleUsage record {
    string text?;
};

public type PartOfSpeech record {
    anydata[] allCategories?;
    anydata[] roots?;
    string[] storageAbbr?;
};

public type Citation record {
    string cite?;
    string 'source?;
};

public type WordListWord record {
    string createdAt?;
    int id;
    int numberCommentsOnWord?;
    int numberLists?;
    int userId?;
    string username?;
    string word?;
};

public type StringValue record {
    string word?;
};

public type WordOfTheDay record {
    string category?;
    ContentProvider contentProvider?;
    string createdAt?;
    string createdBy?;
    anydata[] definitions?;
    anydata[] examples?;
    string htmlExtra?;
    int id;
    string note?;
    string parentId?;
    string publishDate?;
    string word?;
};

public type Sentence record {
    string display?;
    int documentMetadataId?;
    boolean hasScoredWords?;
    int id?;
    int rating?;
    anydata[] scoredWords?;
};

public type Syllable record {
    int seq?;
    string text?;
    string 'type?;
};

public type Facet record {
    anydata[] facetValues?;
    string name?;
};

public type Root record {
    anydata[] categories?;
    int id;
    string name?;
};

public type Bigram record {
    int count?;
    string gram1?;
    string gram2?;
    decimal mi?;
    decimal wlmi?;
};

public type Definition record {
    string attributionText?;
    string attributionUrl?;
    anydata[] citations?;
    anydata[] exampleUses?;
    string extendedText?;
    anydata[] labels?;
    anydata[] notes?;
    string partOfSpeech?;
    anydata[] relatedWords?;
    float score?;
    string seqString?;
    string sequence?;
    string sourceDictionary?;
    string text?;
    anydata[] textProns?;
    string word?;
};

public type ScoredWord record {
    decimal baseWordScore?;
    int docTermCount?;
    int id?;
    string lemma?;
    string partOfSpeech?;
    int position?;
    float score?;
    int sentenceId?;
    boolean stopword?;
    string word?;
    string wordType?;
};

public type WordList record {
    string createdAt?;
    string description?;
    int id;
    string lastActivityAt?;
    string name?;
    int numberWordsInList?;
    string permalink?;
    string 'type?;
    string updatedAt?;
    int userId?;
    string username?;
};

public type WordSearchResults record {
    anydata[] searchResults?;
    int totalResults?;
};

public type AudioFile record {
    string attributionText?;
    string attributionUrl?;
    string audioType?;
    int commentCount?;
    string createdAt?;
    string createdBy?;
    string description?;
    decimal duration?;
    string fileUrl?;
    int id;
    float voteAverage?;
    int voteCount?;
    float voteWeightedAverage?;
    string word?;
};

public type Related record {
    string gram?;
    string label1?;
    string label2?;
    string label3?;
    string label4?;
    string relationshipType?;
    string[] words?;
};

public type WordObject record {
    string canonicalForm?;
    int id;
    string originalWord?;
    string[] suggestions?;
    string vulgar?;
    string word?;
};

public type DefinitionSearchResults record {
    anydata[] results?;
    int totalResults?;
};

public type Note record {
    string[] appliesTo?;
    string noteType?;
    int pos?;
    string value?;
};

public type Long record {
    int value?;
};

public type WordSearchResult record {
    int count?;
    decimal lexicality?;
    string word?;
};

public type AudioType record {
    int id?;
    string name?;
};

public type Frequency record {
    int count?;
    int year?;
};

public type ExampleSearchResults record {
    anydata[] examples?;
    anydata[] facets?;
};
