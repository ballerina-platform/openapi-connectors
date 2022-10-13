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

public type SimilarCompanySearch record {
    string companyName?;
    string website?;
    string employee?;
    string industry?;
    string description?;
    string title?;
    string linkedin?;
    string twitter?;
    Snippet[] snippets?;
};

public type SimilarCompany record {
    string companyName?;
    string website?;
    string employee?;
    string industry?;
    string description?;
    string title?;
    string linkedin?;
    string twitter?;
};

public type ContentProSnippets record {
    string[] description?;
    string[] text?;
    string[] title?;
};

public type Article record {
    string title?;
    string pubdate?;
    string link?;
};

public type SimilarCompanyResponse record {
    SimilarCompany[] companies?;
    InputCompany input_company?;
    string count_remaining?;
    string calls_per_month?;
    string renewal_date?;
};

public type SimilarTextResponse record {
    SimilartextresponseData[] data?;
    string count_remaining?;
    string calls_per_month?;
    string renewal_date?;
};

public type Snippet record {
    string[] description?;
    string[] text?;
    string[] title?;
};

public type ContentProCompany record {
    string companyName?;
    string website?;
    string employee?;
    string industry?;
    string description?;
    string linkedin?;
    string twitter?;
};

public type ContentSearchResponse record {
    SimilartextresponseData[] data?;
    string count_remaining?;
    string calls_per_month?;
    string renewal_date?;
};

public type InputCompany record {
    string companyName?;
    string country?;
    string website?;
    string employee?;
    string industry?;
    string linkedin?;
    string twitter?;
};

public type SearchResponse record {
    SimilarCompanySearch[] companies?;
    string count_remaining?;
    string calls_per_month?;
    string renewal_date?;
};

public type SimilartextresponseData record {
    Article article?;
    ContentProCompany company?;
    ContentProSnippets snippets?;
};
