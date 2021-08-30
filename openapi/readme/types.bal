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

public type Version record {
    # Dubbed name of version
    string codename?;
    # Semantic Version to use as the base fork
    string 'from;
    boolean is_beta?;
    # Should this be deprecated? Only allowed in PUT operations
    boolean is_deprecated?;
    # Should this be publically accessible?
    boolean is_hidden?;
    # Should this be the **main** version
    boolean is_stable?;
    # Semantic Version
    string 'version;
};

public type CustomPage record {
    # Body formatted in Markdown (displayed by default).
    string body?;
    # Visibility of the custom page
    boolean hidden?;
    # Body formatted in HTML (sanitized, only displayed if `htmlmode` is **true**).
    string html?;
    # **true** if `html` should be displayed, **false** if `body` should be displayed.
    boolean htmlmode?;
    # Title of the custom page
    string title;
};

public type Doc record {
    # Body content of the page, formatted in ReadMe or Github flavored Markdown. Accepts long page content, for example, greater than 100k characters
    string body?;
    # Category ID of the page, which you can get through https://docs.readme.com/developers/reference/categories#getcategory 
    string category;
    # Visibility of the page
    boolean hidden?;
    # For a subpage, specify the parent doc ID, which you can get through https://docs.readme.com/developers/reference/docs#getdoc
    string parentDoc?;
    # Title of the page
    string title;
    # Type of the page. The available types all show up under the /docs/ URL path of your docs project (also known as the "guides" section). Can be "basic" (most common), "error" (page desribing an API error), or "link" (page that redirects to an external link)
    string 'type?;
};

public type Changelog record {
    # Body content of the changelog
    string body;
    # Visibility of the changelog
    boolean hidden?;
    # Title of the changelog
    string title;
    string 'type?;
};

public type File record {
    # OpenAPI/Swagger file
    string spec?;
};
