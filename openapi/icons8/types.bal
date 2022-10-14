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

public type Meta anydata;

public type TotalsresponseResult record {
    anydata[] total?;
};

# Task
public type Task record {
    # Task arguments
    TaskArguments arguments?;
};

# URLs to icon sources in different vector formats; private; depend on the current user and could be opened in user's browser only
public type Compacticonv3itemVector record {
    # absolute URL to file in EPS format
    string eps?;
    # absolute URL to file in PDF format
    string pdf?;
    # absolute URL to original SVG file
    string 'svg\-editable?;
    # absolute URL to compressed and simplified SVG file
    string 'svg\-simplified?;
};

public type Category record {
    CategoryParameters parameters?;
    CategoryResult result?;
};

public type CategoryV3Item record {
    string category_code?;
    string category_name?;
    anydata[] subcategory?;
};

public type CompactCategoryV3Item record {
    string api_code;
    string name;
};

public type IconV3Item record {
    *CompactIconV3Item;
    string category?;
    # identifier for group of the same icons in different styles; i.e. id of all "home" icons
    decimal common_icon_id;
    # date (ISO8601 format) of icon was published
    string created;
    # internal service attribute; internal information about icon features; private; depend on the rights of the current user
    Compacticonv3itemFeatures features;
    # unique icon identifier
    decimal id;
    # icon name
    string name;
    # icon style
    string platform_code;
    # internal service attribute; some links to spread the world
    Compacticonv3itemShare share?;
    Compacticonv3itemSubcategory subcategory?;
    # plain SVG content of icon
    string svg;
    # internal service attribute; the meaning of this attribute is "Identifier of thread at Disquss"
    string url?;
    # URLs to icon sources in different vector formats; private; depend on the current user and could be opened in user's browser only
    Compacticonv3itemVector vector?;
};

# internal service attribute; some links to spread the world
public type Compacticonv3itemShare record {
    # some raster images for share the icon
    anydata[] png?;
    # short URL to use in twitter
    string url?;
};

public type CreatedItem record {
    anydata[] messages?;
    CreateditemResult result?;
};

public type Compacticonv3itemSubcategory record {
    string api_code;
    string name;
};

public type TotalsresponseParameters record {
    string since?;
};

public type CreateditemResultResults record {
    string zip?;
};

public type WebFonts anydata;

# Authorization
public type Auth record {
    # Authorization hash
    string hash;
};

public type Search anydata;

public type LatestIcons record {
    IconParameters parameters?;
    LatesticonsResult result?;
};

public type CategoriesResult record {
    anydata[] categories?;
};

public type CreateditemResult record {
    # human readable description
    string description?;
    # task identifier
    string id;
    CreateditemResultResults results?;
    # task status
    string status;
    # task type
    string 'type;
};

public type TaskresultResults record {
    # URL to webfont files in ZIP format
    string zip?;
};

public type CategoriesParameters record {
    string language?;
    string platform?;
};

# internal service attribute; internal information about icon features; private; depend on the rights of the current user
public type Compacticonv3itemFeatures record {
    # "Could user use images in bitmap / raster formats in any size ?"
    decimal bitmap;
    # "Could user use images without any link to Icons8 ?"
    decimal nolink;
    # "Could user use images in vector formats ?"
    decimal vector;
};

public type CompactIconV3Item record {
    string category?;
    # identifier for group of the same icons in different styles; i.e. id of all "home" icons
    decimal common_icon_id;
    # date (ISO8601 format) of icon was published
    string created;
    # internal service attribute; internal information about icon features; private; depend on the rights of the current user
    Compacticonv3itemFeatures features;
    # unique icon identifier
    decimal id;
    # icon name
    string name;
    # icon style
    string platform_code;
    # internal service attribute; some links to spread the world
    Compacticonv3itemShare share?;
    Compacticonv3itemSubcategory subcategory?;
    # plain SVG content of icon
    string svg;
    # internal service attribute; the meaning of this attribute is "Identifier of thread at Disquss"
    string url?;
    # URLs to icon sources in different vector formats; private; depend on the current user and could be opened in user's browser only
    Compacticonv3itemVector vector?;
};

public type Categories record {
    CategoriesParameters parameters?;
    CategoriesResult result?;
};

public type CollectionWebFontTaskArguments record {
    CollectionwebfonttaskargumentsArguments arguments?;
};

public type TaskError record {
    # error code
    string code;
    # human readable error message
    string description;
};

public type CollectionwebfonttaskargumentsArguments record {
    # collection identifier
    string collection;
    # prefix for CSS rules, used to generate LESS/SCSS
    string css_prefix?;
    # glyph names conversion rule
    string css_rules_case?;
    # template for glyph selector; placeholder {{glyph}} will be replaced with glyph names
    string css_selector?;
    # name of iconic webfont
    string font_name;
};

public type AuthArgument record {
    # Authorization hash
    string hash;
};

# Task arguments
public type TaskArguments record {
    # collection identifier
    string collection;
    # prefix for CSS rules, used to generate LESS/SCSS
    string css_prefix = "icons8";
    # glyph names conversion rule
    string css_rules_case = "lowercase";
    # template for glyph selector; placeholder {{glyph}} will be replaced with glyph names
    string css_selector = ".icons8-{{glyph}}";
    # name of iconic webfont
    string font_name;
};

public type LatesticonsResult record {
    anydata[] latest?;
};

public type CategoryResult record {
    anydata[] category?;
};

public type CategoryParameters record {
    decimal amount?;
    string category?;
    string language?;
    string offset?;
    string platform?;
    string subcategory?;
};

public type TotalsResponse record {
    TotalsresponseParameters parameters?;
    TotalsresponseResult result?;
};

public type TaskResult record {
    # human readable description
    string description?;
    # task identifier
    string id;
    TaskresultResults results?;
    # task status
    string status;
    # task type
    string 'type;
};

public type Icon record {
    IconParameters parameters?;
    IconResult result?;
};

public type IconParameters record {
    decimal amount?;
    string language?;
    string offset?;
    string platform?;
    string term?;
};

public type IconResult record {
    anydata[] search?;
};

public type TotalV3Item record {
    # icons style code; in other places it named `plarform` or `platform_api_code`
    string api_code;
    string name;
    decimal total;
};
