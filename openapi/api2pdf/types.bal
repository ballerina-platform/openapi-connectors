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

public type WkHtmlToPdfAdvancedOptions record {
    string orientation?;
    string pageSize?;
};

public type WkHtmlToPdfUrlToPdfRequest record {
    string fileName?;
    boolean inlinePdf?;
    WkHtmlToPdfAdvancedOptions options?;
    string url;
};

public type ApiResponseFailure record {
    # The reason for the PDF generation failure
    string reason?;
    # Will be false if the operation failed
    boolean success?;
};

public type ChromeUrlToPdfRequest record {
    string fileName?;
    boolean inlinePdf?;
    ChromeAdvancedOptions options?;
    string url;
};

public type MergeRequest record {
    string fileName?;
    boolean inlinePdf?;
    string[] urls;
};

public type LibreOfficeConvertRequest record {
    string fileName?;
    boolean inlinePdf?;
    string url;
};

public type ChromeAdvancedOptions record {
    string landscape?;
    boolean printBackground?;
};

public type ChromeHtmlToPdfRequest record {
    string fileName?;
    string html;
    boolean inlinePdf?;
    ChromeAdvancedOptions options?;
};

public type ApiResponseSuccess record {
    # Cost of the operation (mbIn + mbOut) * $.001
    decimal cost?;
    # The amount of megabytes of bandwidth used to process the pdf
    decimal mbIn?;
    # The amount of megabytes of bandwidth generated from the resulting pdf
    decimal mbOut?;
    # A url to the PDF that will exist only for 24 hours
    string pdf?;
    # Will be true if the operation suceeded
    boolean success?;
};

public type WkHtmlToPdfHtmlToPdfRequest record {
    string fileName?;
    string html;
    boolean inlinePdf?;
    WkHtmlToPdfAdvancedOptions options?;
};
