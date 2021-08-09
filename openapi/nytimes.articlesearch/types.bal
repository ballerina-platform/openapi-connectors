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

public type DocMultimedia record {
    string? caption?;
    string? copyright?;
    string? format?;
    int? height?;
    string? subtype?;
    string? 'type?;
    string? url?;
    int? width?;
};

public type DocByline record {
    string? organization?;
    string? original?;
    anydata[]? person?;
};

public type Doc record {
    string? _id?;
    string? 'abstract?;
    anydata[]? blog?;
    DocByline? byline?;
    string? document_type?;
    DocHeadline? headline?;
    string? lead_paragraph?;
    DocMultimedia[]? multimedia?;
    string? news_desk?;
    string? print_page?;
    string? pub_date?;
    string? section_name?;
    string? slideshow_credits?;
    string? snippet?;
    string? 'source?;
    string? subsection_name?;
    string? type_of_material?;
    string? web_url?;
};

public type InlineResponse200 record {
    InlineResponse200Response? response?;
};

public type InlineResponse200ResponseMeta record {
    int? hits?;
    int? offset?;
    int? time?;
};

public type InlineResponse200Response record {
    Doc[]? docs?;
    InlineResponse200ResponseMeta? meta?;
};

public type DocHeadline record {
    string? kicker?;
    string? main?;
};
