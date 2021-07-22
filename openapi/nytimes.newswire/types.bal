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

public type ArticleRelatedUrls record {
    string? suggested_link_text?;
    string? url?;
};

public type Article record {
    string? 'abstract?;
    string? blog_name?;
    string? byline?;
    string? created_date?;
    string[]? des_facet?;
    string[]? geo_facet?;
    string? headline?;
    string? item_type?;
    string? kicker?;
    string? material_type_facet?;
    ArticleMultimedia[]? multimedia?;
    // string? org_facet?;
    string[]? per_facet?;
    string? published_date?;
    ArticleRelatedUrls[]? related_urls?;
    string? section?;
    string? short_url?;
    string? 'source?;
    string? subsection?;
    string? thumbnail_standard?;
    string? title?;
    string? updated_date?;
    string? url?;
};

public type InlineResponse200 record {
    string copyright?;
    int num_results?;
    Article[] results?;
    string status?;
};

public type ArticleMultimedia record {
    string caption?;
    string copyright?;
    string format?;
    int height?;
    string subtype?;
    string 'type?;
    string url?;
    int width?;
};
