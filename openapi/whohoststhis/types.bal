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

public type ConversionParameters record {
    # An optional base url parameter can be used together with html to resolve relative paths from the html string
    string base_url?;
    # The raw html string that will be converted to PDF
    string html?;
    # The license key required to use the API
    string 'key;
    # Bottom margin of the generated PDF document in points (1 point = 1/72 inch)
    int margin_bottom?;
    # Left margin of the generated PDF document in points (1 point = 1/72 inch)
    int margin_left?;
    # Right margin of the generated PDF document in points (1 point = 1/72 inch)
    int margin_right?;
    # Top margin of the generated PDF document in points (1 point = 1/72 inch)
    int margin_top?;
    # Specifies the page orientation of the generated pdf document
    string page_orientation?;
    # Specifies the page size of the generated pdf document
    string page_size?;
    # The url that will be converted to PDF
    string url?;
};
