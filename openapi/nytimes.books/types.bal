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

public type InlineResponse2003ResultsBooks record {
    string age_group?;
    string author?;
    string contributor?;
    string contributor_note?;
    string created_date?;
    string description?;
    int price?;
    string primary_isbn10?;
    string primary_isbn13?;
    string publisher?;
    int rank?;
    string title?;
    string updated_date?;
};

public type InlineResponse200Results record {
    string amazon_product_url?;
    int asterisk?;
    string bestsellers_date?;
    InlineResponse200BookDetails[] book_details?;
    int dagger?;
    string display_name?;
    InlineResponse2001Isbns[] isbns?;
    string list_name?;
    string published_date?;
    int rank?;
    int rank_last_week?;
    InlineResponse2001Reviews[] reviews?;
    int weeks_on_list?;
};

public type InlineResponse200BookDetails record {
    string age_group?;
    string author?;
    string contributor?;
    string contributor_note?;
    string description?;
    int price?;
    string primary_isbn10?;
    string primary_isbn13?;
    string publisher?;
    string title?;
};

public type InlineResponse2004Results record {
    string bestsellers_date?;
    InlineResponse2004ResultsBooks[] books?;
    record {}[] corrections?;
    string display_name?;
    string list_name?;
    int normal_list_ends_at?;
    string published_date?;
    string updated?;
};

public type InlineResponse2003Results record {
    string bestsellers_date?;
    InlineResponse2003ResultsLists[] lists?;
    string published_date?;
};

public type InlineResponse200 record {
    string copyright?;
    string last_modified?;
    int num_results?;
    InlineResponse200Results[] results?;
    string status?;
};

public type InlineResponse2005Results record {
    string book_author?;
    string book_title?;
    string byline?;
    string[] isbn13?;
    string publication_dt?;
    string summary?;
    string url?;
};

public type InlineResponse2001Results record {
    string age_group?;
    string author?;
    string contributor?;
    string contributor_note?;
    string description?;
    InlineResponse2001Isbns[] isbns?;
    int price?;
    string publisher?;
    InlineResponse2001RanksHistory[] ranks_history?;
    InlineResponse2001Reviews[] reviews?;
    string title?;
};

public type InlineResponse2002Results record {
    string display_name?;
    string list_name?;
    string list_name_encoded?;
    string newest_published_date?;
    string oldest_published_date?;
    string updated?;
};

public type InlineResponse2001Isbns record {
    string isbn10?;
    string isbn13?;
};

public type InlineResponse2003ResultsLists record {
    InlineResponse2003ResultsBooks[] books?;
    string display_name?;
    int list_id?;
    string list_image?;
    string list_name?;
    string updated?;
};

public type InlineResponse2001Reviews record {
    string article_chapter_link?;
    string book_review_link?;
    string first_chapter_link?;
    string sunday_review_link?;
};

public type InlineResponse2001RanksHistory record {
    int asterisk?;
    string bestsellers_date?;
    int dagger?;
    string display_name?;
    string list_name?;
    string primary_isbn10?;
    string primary_isbn13?;
    string published_date?;
    int rank?;
    anydata? ranks_last_week?;
    int weeks_on_list?;
};

public type InlineResponse2001 record {
    string copyright?;
    int num_results?;
    InlineResponse2001Results[] results?;
    string status?;
};

public type InlineResponse2003 record {
    string copyright?;
    int num_results?;
    InlineResponse2003Results results?;
    string status?;
};

public type InlineResponse2002 record {
    string copyright?;
    int num_results?;
    InlineResponse2002Results[] results?;
    string status?;
};

public type InlineResponse2005 record {
    string copyright?;
    int num_results?;
    InlineResponse2005Results[] results?;
    string status?;
};

public type InlineResponse2004 record {
    string copyright?;
    string last_modified?;
    int num_results?;
    InlineResponse2004Results results?;
    string status?;
};

public type InlineResponse2004ResultsBooks record {
    string age_group?;
    string amazon_product_url?;
    string article_chapter_link?;
    int asterisk?;
    string author?;
    string book_image?;
    string book_review_link?;
    string contributor?;
    string contributor_note?;
    int dagger?;
    string description?;
    string first_chapter_link?;
    InlineResponse2001Isbns[] isbns?;
    int price?;
    string primary_isbn10?;
    string primary_isbn13?;
    string publisher?;
    int rank?;
    int rank_last_week?;
    string sunday_review_link?;
    string title?;
    int weeks_on_list?;
};
