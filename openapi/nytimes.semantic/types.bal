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

public type Concept record {
    ConceptRelation[] ancestors?;
    ConceptArticleList article_list?;
    ConceptCombinations[] combinations?;
    string concept_created?;
    int concept_id?;
    string concept_name?;
    string concept_status?;
    string concept_type?;
    string concept_updated?;
    ConceptRelation[] descendants?;
    int is_times_tag?;
    ConceptLinks[] links?;
    ConceptScopeNotes[] scope_notes?;
    string search_api_query?;
    ConceptTaxonomy[] taxonomy?;
    string vernacular?;
};

public type ConceptTaxonomy record {
    int source_concept_id?;
    string source_concept_name?;
    string source_concept_type?;
    string source_concept_vernacular?;
    int target_concept_id?;
    string target_concept_name?;
    string target_concept_type?;
    string target_concept_vernacular?;
    string taxonomic_relation?;
    string taxonomic_verification_status?;
};

public type ConceptArticleListConcepts record {
    string[] nytd_des?;
    string[] nytd_org?;
    string[] nytd_per?;
};

public type ConceptLinks record {
    int concept_id?;
    string concept_name?;
    string concept_status?;
    string concept_type?;
    int is_times_tag?;
    string link?;
    int link_id?;
    string link_type?;
    string mapping_type?;
    string relation?;
};

public type ConceptScopeNotes record {
    string scope_note?;
    string scope_note_name?;
    string scope_note_type?;
};

public type ConceptArticleListResults record {
    string body?;
    string byline?;
    ConceptArticleListConcepts concepts?;
    string date?;
    string document_type?;
    string title?;
    string type_of_material?;
    string url?;
};

public type ConceptCombinations record {
    string combination_note?;
    int combination_source_concept_id?;
    string combination_source_concept_name?;
    string combination_source_concept_type?;
    int combination_target_concept_id?;
    string combination_target_concept_name?;
    string combination_target_concept_type?;
};

public type ConceptArticleList record {
    ConceptArticleListResults[] results?;
    int total?;
};

public type ConceptRelation record {
    string concept_created?;
    int concept_id?;
    string concept_name?;
    string concept_status?;
    string concept_type?;
    string concept_updated?;
    int? is_times_tag?;
    string vernacular?;
};

public type InlineResponse2001 record {
    string copyright?;
    int num_results?;
    ConceptRelation[] results?;
    string status?;
};

public type InlineResponse200 record {
    string copyright?;
    int num_results?;
    Concept[] results?;
    string status?;
};
