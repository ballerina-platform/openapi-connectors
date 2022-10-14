// Copyright (c) 2021 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

public type ChargebackReplyCreditIssuedRequest record {
    # Credit transaction date
    string credit_date;
    # Credit transaction amount
    string credit_amount;
    # User note
    string user_note;
    # Files to attach
    string[]? file;
};

public type InlineResponse2006 record {
    int? code?;
    string? message?;
};

public type RetrievalReplyCreditIssuedRequest record {
    # Credit transaction date
    string credit_date;
    # Credit transaction amount
    string credit_amount;
    # User note
    string user_note;
    # Files to attach
    string[]? file;
};

public type ChargebackReplyDisputeRequest record {
    # Selected documents
    string selected_doc_types;
    # Other document description
    string other_description?;
    # Compelling document
    string compelling_doc?;
    # Selected compelling
    string selected_compelling?;
    # Digital goods compelling documents
    string selected_digital_goods_04?;
    # Download date
    string download_date?;
    # Download time
    string download_time?;
    # Purchaser IP address
    string purchaser_ip_addr?;
    # Physical location
    string geographical_location?;
    # PhDevice ID
    string device_id?;
    # Device ID
    string device_name?;
    # Purchaser name
    string purchaser_name?;
    # Purchaser email
    string purchaser_email?;
    # ARN
    string arn_04?;
    # Transaction date
    string tran_date_04?;
    # ARN
    string arn_09?;
    # Transaction date
    string tran_date_09?;
    # ARN
    string arn_13?;
    # Transaction date
    string tran_date_13?;
    # IP address
    string ip_address?;
    # Email address
    string email_address?;
    # Phone number
    string phone_number?;
    # Physical address
    string physical_address?;
    # User note
    string user_note;
    # Files to attach
    string[]? file;
};

public type RetrievalReplyResponseRequest record {
    # User note
    string? user_note;
    # Files to attach
    string[]? file;
};
