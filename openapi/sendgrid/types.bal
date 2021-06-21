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

# List of errors
public type Errors record {
    # Error message
    record  { # The field that has the error.
        string? 'field?; # The message the API caller will receive.
        string message?;} [] errors?;
};

# Email details
public type EmailObject record {
    # Email Address
    string email;
    # The name of the person to whom you are sending an email.
    string name?;
};

# Details of the subuser
public type Subuser record {
    # Whether or not the user is enabled or disabled.
    boolean disabled;
    # The email address to contact this subuser.
    string email;
    # The ID of this subuser.
    decimal id;
    # The name by which this subuser will be referred.
    string username;
};

# Alert details
public type AlertResponse record {
    # A Unix timestamp indicating when the alert was created.
    int created_at;
    # The email address that the alert will be sent to.
    string email_to;
    # If the alert is of type stats_notification, this indicates how frequently the stats notifications will be sent. For example, "daily", "weekly", or "monthly".
    string frequency?;
    # The ID of the alert.
    int id;
    # If the alert is of type usage_limit, this indicates the percentage of email usage that must be reached before the alert will be sent.
    int percentage?;
    # The type of alert.
    string 'type;
    # A Unix timestamp indicating when the alert was last modified.
    int updated_at?;
};

# Spam report details
public type SpamReportDetails record {
    # A Unix timestamp indicating when the spam report was made.
    int created;
    # The email address of the recipient who marked your message as spam.
    string email;
    # The IP address that the message was sent on.
    string ip;
};

# Error details
public type ErrorDetails record {
    # The field that generated the error.
    string? 'field?;
    # The error message.
    string message;
};

# Global error response
public type GlobalErrorresponse record {
    # Error details
    ErrorDetails[] errors?;
};

# Details of the blocks
public type SuppressionBlocks record {
    # A Unix timestamp indicating when the email address was added to the blocks list.
    int created;
    # The email address that was added to the block list.
    string email;
    # An explanation for the reason of the block.
    string reason;
    # The status of the block.
    string status;
};

# Created subuser's details
public type SubuserPost record {
    # Authorization tokens
    string authorization_token?;
    # Credit allocations
    record  { string 'type?;}  credit_allocation?;
    # The email address for this subuser.
    string email;
    # Signup session token
    string signup_session_token?;
    # The user ID for this subuser.
    decimal user_id;
    # The username of the subuser.
    string username;
};
