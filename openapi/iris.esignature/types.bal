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

public type BriefApplicationInfoArr BriefApplicationInfo[];

public type Meta record {
    # The current page number of a data set
    int current_page?;
    # The current position of a data set 
    int 'from?;
    # The last page of a data set
    string last_page?;
    # API path
    string path?;
    # A number of records per page
    int per_page?;
    # The last position in a data set
    int to?;
    # Total number of records in a data set
    int total?;
};

public type Apiv1leadsleadidsignaturesapplicationidsendRecipients record {
    # Lead Field Id with email address
    int fieldId?;
    # Recipient Email
    string email?;
    # Recipient Name
    string name?;
};

public type BriefApplicationInfo record {
    # Application Id
    int id?;
    # Application name
    string name?;
    # Is E-Sign available?
    string 'e\-sign?;
};

public type ApplicationfieldInfo record {
    # Field name
    string field_name?;
    # Field type
    string field_type?;
    # Padding from left
    int left?;
    # Padding from right
    int right?;
    # Padding from top
    int top?;
    # Padding from bottom
    int bottom?;
    # Height of field
    int field_height?;
    # Width of field
    int field_width?;
    # Page number
    int page_number?;
    # Page height
    int page_height?;
    # Page width
    int page_width?;
    # Page rotation
    int page_rotation?;
    # Export value
    string export_value?;
    # Field tooltip
    string tooltip?;
    ApplicationfieldDuplicates[] duplicates?;
};

public type ApplicationfieldDuplicates record {
    # Activity Id
    int instance?;
    # Padding from left
    int left?;
    # Padding from right
    int right?;
    # Padding from top
    int top?;
    # Padding from bottom
    int bottom?;
    # Height of field
    int height?;
    # Width of field
    int width?;
    # Page number
    int page_number?;
};

public type InlineResponse20039Data record {
    string status?;
    string url?;
    string templateId?;
    string templateName?;
};

public type InlineResponse20038 record {
    # Result message
    string message?;
    # Id of email what was sent
    int emailId?;
    # E-Sign hash
    string hash?;
    # E-Sign URL
    string url?;
};

public type InlineResponse20037 record {
    # Result message
    string message?;
    # E-Sign hash
    string hash?;
    # E-Sign URL
    string url?;
};

public type InlineResponse20039 record {
    InlineResponse20039Data[] data?;
    Links links?;
    Meta meta?;
};

public type Body9 record {
    # Expire the previously generated application
    boolean expire?;
};

public type InlineResponse20050 record {
    ApplicationField[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20051 record {
    string message?;
};

public type Body10 record {
    Apiv1leadsleadidsignaturesapplicationidsendRecipients[] recipients?;
    # Expire the previously generated application
    boolean expire?;
};

public type ApplicationField record {
    # Application field Id
    int id?;
    # Application field from field Id
    int 'from;
    # Application field record
    int 'record?;
    # Name of mapped field
    string to?;
    # Alt of mapped field
    string toAlt?;
    # Type of mapped field
    string toType?;
    # Special type of mapped field
    string special?;
    ApplicationfieldInfo[] info?;
};

public type Links record {
    # An URL to the first page of the data set
    string first?;
    # An URL to the last page of the data set
    string last?;
    # An URL to the previous page of the data set
    string prev?;
    # An URL to the next page of the data set
    string next?;
};
