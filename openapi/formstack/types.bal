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

public type Forms record {
    # Forms details
    Form[] forms?;
    # Total forms
    int total?;
};

public type FieldRequest record {
    # Field type
    string field_type?;
    # Field label
    string label?;
    # Flag to show or hide the label
    boolean hide_label?;
    # Field description (shown below field)
    string description?;
    # Flag to show the description in a callout box
    boolean description_callout?;
    # Initial value for the field
    string default_value?;
    # Array of option labels
    Option[] options?;
};

public type SuccessOperation record {
    # Operation status
    string success?;
    # Form ID
    string id?;
};

public type Form record {
    # Form ID
    string id?;
    string created?;
    string db?;
    string deleted?;
    string folder?;
    string language?;
    string num_columns?;
    string progress_meter?;
    string timezone?;
    string rss_url?;
    string viewkey?;
    string? thumbnail_url?;
    boolean can_access_1q_feature?;
    boolean is_workflow_form?;
    boolean inactive?;
    string submit_button_title?;
    int permissions?;
    string submissions_unread?;
    boolean should_display_one_question_at_a_time?;
    string views?;
    boolean has_approvers?;
    boolean can_edit?;
    string url?;
    boolean is_workflow_published?;
    int submissions_today?;
    boolean encrypted?;
    string submissions?;
    string name?;
    string edit_url?;
    string updated?;
    string data_url?;
    string summary_url?;
    string last_submission_id?;
    string last_submission_time?;
};

public type FormRequest record {
    # The form name
    string name?;
    # Flag to disable or enable submissions to be saved in our database. Value 1 if true and 0 if false
    boolean db?;
    # Template ID for the template you want to use
    string template?;
    # Number (1-4) of columns the form layout will have
    int num_columns?;
    # Sets the default field label position. Possible values are top and left
    string label_position?;
    # Sets the submit button title
    string submit_button_title?;
    # Sets a password for the form
    string password?;
    # Flag to disable or enable SSL (only available on accounts that have security features)
    boolean use_ssl?;
    # Sets the timezone for the form
    string timezone?;
    # Sets the language for the form - use ISO 639-1 language codes
    string language?;
    # Flag to make the form active/inactive
    boolean active?;
    # The message to show when the form is inactive
    string disabled_message?;
};

public type Operation record {
    # Form ID
    string id?;
};

public type Folder record {
    # Form ID
    string id?;
    string name?;
    string parent?;
    string permissions?;
    Folder[] subfolders?;
};

public type Field record {
    string id?;
    string label?;
    string hide_label?;
    string description?;
    string name?;
    string 'type?;
    string required?;
    Option[] options?;
};

public type FolderRequest record {
    # Folder name
    string name?;
};

public type Fields Field[];

public type HtmlForm record {
    # Form ID
    string id?;
    # HTML form representation
    string html?;
};

public type Folders record {
    # Folders details
    Folder[] folders?;
    # Total forms
    int total?;
};

public type Option record {
    string label?;
    string value?;
    string? imageUrl?;
};
