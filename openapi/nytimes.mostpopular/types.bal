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

public type ArticlewithcounttypeMedia record {
    string caption?;
    string copyright?;
    ArticlewithcounttypeMediametadata[] 'media\-metadata?;
    string subtype?;
    string 'type?;
};

public type Article record {
    string 'abstract?;
    string byline?;
    string? column?;
    DesFacet des_facet?;
    GeoFacet? geo_facet?;
    anydata[] media?;
    OrgFacet? org_facet?;
    PerFacet? per_facet?;
    string published_date?;
    string section?;
    string 'source?;
    string title?;
    string url?;
};

public type InlineResponse2001 record {
    string copyright?;
    int num_results?;
    Article[] results?;
    string status?;
};

public type PerFacet anydata[];

public type InlineResponse200 record {
    string copyright?;
    int num_results?;
    ArticleWithCountType[] results?;
    string status?;
};

public type ArticleWithCountType record {
    string 'abstract?;
    string byline?;
    string? column?;
    string count_type?;
    DesFacet des_facet?;
    GeoFacet? geo_facet?;
    ArticlewithcounttypeMedia[] media?;
    OrgFacet? org_facet?;
    PerFacet? per_facet?;
    string published_date?;
    string section?;
    string 'source?;
    string title?;
    string url?;
};

public type InlineResponse400 record {
    string copyright?;
    string[] errors?;
    anydata[] results?;
    string status?;
};

public type GeoFacet anydata[];

public type OrgFacet anydata[];

public type ArticlewithcounttypeMediametadata record {
    string format?;
    int height?;
    string url?;
    int width?;
};

public type DesFacet anydata[];
