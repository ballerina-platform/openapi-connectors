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

public type TicketArr Ticket[];

public type ContactArr Contact[];

public type Ticket record {
    string[]? cc_emails?;
    string[]? fwd_emails?;
    string[]? reply_cc_emails?;
    boolean fr_escalated?;
    boolean spam?;
    int? email_config_id?;
    int? group_id?;
    int priority?;
    int 'source?;
    string description?;
    int status?;
    string subject?;
    int id?;
    string? 'type?;
    string due_by?;
    string fr_due_by?;
    boolean is_escalated?;
    string description_text?;
    string created_at?;
    string updated_at?;
    string[] tags?;
    string? source_additional_info?;
    string? nr_due_by?;
    boolean nr_escalated?;
    int? company_id?;
    int requester_id?;
    int? responder_id?;
};

public type TicketPayload record {
    string description?;
    string subject?;
    string email?;
    int priority?;
    int status?;
    string[] cc_emails?;
};

public type Contact record {
    boolean active?;
    string? address?;
    int? company_id?;
    boolean? view_all_tickets?;
    boolean deleted?;
    string? description?;
    string email?;
    int id?;
    string? job_title?;
    string language?;
    string? mobile?;
    string name?;
    string[]? other_emails?;
    string? phone?;
    string[]? tags?;
    string time_zone?;
    string? twitter_id?;
    string? unique_external_id?;
    string created_at?;
    string updated_at?;
};
