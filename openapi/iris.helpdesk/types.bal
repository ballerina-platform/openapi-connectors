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

public type InlineResponse20060Arr InlineResponse20060[];

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

public type CheckListRequest record {
    # Checklist item index
    int index?;
    string[] files?;
    int[] attached_files?;
    # Flag checklist are item completed
    boolean completed?;
    # Comment for checklist item
    string comment?;
};

public type BriefTicketComments record {
    # Comment id
    int id?;
    # Ticket id
    int ticketId?;
    # Comment text
    string comment?;
    # Comment created date
    string created?;
    # Comment creator id
    int createdBy?;
    # Comment modified date
    string modified?;
    # Id of user who left comment
    int modifiedBy?;
    File[] files?;
    File[] preview_images?;
    # Indicates if the comment is visible to Merchant users
    boolean merchantVisible?;
};

public type Ticket record {
    # Ticket id
    int id?;
    # Ticket subject
    string subject?;
    # Ticket description
    string description?;
    TicketStatus status?;
    TicketType 'type?;
    TicketGroup 'group?;
    TicketPriority priority?;
    # Assigned Lead ID
    int lead_id?;
    # Assigned Merchant ID
    int mid?;
    # Indicates if the ticket is visible to Merchant users
    boolean merchantVisible?;
};

public type BriefTicketChecklistInfo record {
    # Checklist item Id
    int id?;
    # Checklist template Id
    int template_id?;
    # Checklist item name
    string name?;
    # Index in list
    int index?;
    # Flag is checklist are required
    boolean required?;
    # Flag is checklist file are required
    boolean fileRequired?;
    # Flag is comment are required to resolve ticket
    boolean commentRequiredToDoneTicket?;
    # Flag is checklist are required to resolve checklist item
    boolean commentRequiredToDoneItem?;
    # Datetime when user have commented checklist item
    anydata commentedAt?;
    # User Id of user who have commented checklist item
    int commentedBy?;
};

public type InlineResponse20061 record {
    string status?;
    string fileId?;
};

public type InlineResponse20060 record {
    boolean active?;
    string 'source?;
    string date?;
    decimal user?;
    decimal assigned_by?;
};

public type InlineResponse20063 record {
    string message?;
    string movedTickets?;
};

public type InlineResponse20062 record {
    BriefTicketTypeInfo[] data?;
    Links links?;
    Meta meta?;
};

public type TicketCreatedBlock record {
    # Ticket created date
    string created?;
    # Ticket creator id
    int created_by?;
};

public type TicketPriority record {
    # Priority id
    int id?;
    # Priority name
    string name?;
};

public type BrieftickettypeinfoAssignees record {
    int[] everyTime?;
    int[] roundRobin?;
};

public type BriefTicketTypeInfo record {
    # Ticket type id
    int id?;
    # Ticket type name
    string name?;
    # Ticket type description
    string description?;
    # Days to Resolve
    int daysToResolve?;
    # Calculate only business days
    boolean only_business_days?;
    TicketStatus status?;
    TicketPriority priority?;
    # Ticket type created date
    string created?;
    # Ticket type creator id
    int createdBy?;
    # Ticket type modified date
    string modified?;
    # Id of user who made last change
    int modifiedBy?;
    # Ticket type order
    int 'order?;
    int[] permissions?;
    # Ticket due date
    string due_date?;
    BrieftickettypeinfoAssignees assignees?;
};

public type TicketGroup record {
    # Group id
    int id?;
    # Group name
    string name?;
};

public type InlineResponse20032 record {
    BriefUserInfoWithClass[] data?;
    Links links?;
    Meta meta?;
};

public type ChecklistFullInfo record {
    *BriefTicketChecklistInfo;
    # Flag is checklist are done
    boolean completed?;
    # User ID who compleated the checklist
    int completed_by?;
    # Datetime when user have completed the checklist item
    anydata completed_at?;
    File[] files?;
};

public type TicketStatus record {
    # Status id
    int id?;
    # Status name
    string name?;
};

public type BriefTicketInfo record {
    *Ticket;
    *TicketCreatedBlock;
    # Ticket modified date
    string modified?;
    # Id of user who made last change
    int modified_by?;
    # Ticket resolved date
    string resolved?;
    # Id of user who made last change
    int resolved_by?;
    # Ticket due date
    string due_date?;
    # Ticket SLA
    string due?;
    # Calculate only business days
    boolean only_business_days?;
    # Ticket last comment date
    string last_comment?;
    # Count of ticket files
    int files_count?;
};

public type TicketTypeRequest record {
    # Ticket type name
    string name?;
    # Ticket type description
    string description?;
    # Days to Resolve
    int daysToResolve?;
    # Calculate only business days
    boolean only_business_days?;
    # Status
    string status?;
    # Priority (0 - Normal, 1 - Medium, 2 - Rush)
    int priority?;
    int[] permissions?;
    BrieftickettypeinfoAssignees assignees?;
};

public type BriefUserInfoWithClass record {
    # User Id
    int id?;
    # User username
    string username?;
    # User name
    string full_name?;
    # User email
    string email?;
    # User status
    string status?;
    # User class
    string 'class?;
};

public type InlineResponse20058 record {
    record {*BriefTicketInfo; string created_username?; string modified_username?; string resolved_username?;}[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20059 record {
    string status?;
};

public type Body17 record {
    *TicketTypeRequest;
    record {*BriefTicketChecklistInfo; string[] files?; string[] new_files?;}[] checklist?;
};

public type TicketDetail record {
    File[] general?;
    ChecklistFullInfo[] checklist?;
};

public type Body16 record {
    *TicketTypeRequest;
    record {*BriefTicketChecklistInfo; string[] files?;}[] checklist?;
};

public type Body15 record {
    # Type id
    int 'type?;
    # Ticket subject
    string subject?;
    # Ticket description
    string description?;
    # Ticket status
    string status?;
    # Priority (0 - Normal, 1 - Medium, 2 - Rush)
    int priority?;
    int[] assignedUsers?;
    # Ticket due datetime
    string due_date?;
    # Calculate only business days
    boolean only_business_days?;
    string assignType?;
    int assignTo?;
    string[] files?;
    int[] attached_files?;
    string[] preview_images?;
    int group_id?;
    # Indicates if the ticket is visible to Merchant users
    boolean merchantVisible?;
    record {*CheckListRequest; string[] new_files?; int[] attached_files?;}[] checklist?;
};

public type Body14 record {
    # Comment text
    string comment?;
    int[] notify?;
    string[] files?;
    int[] attached_files?;
    string[] preview_images?;
    # Indicates if the comment is visible to Merchant users
    boolean merchantVisible?;
};

public type Body13 record {
    # Type id
    int 'type;
    # Ticket subject
    string subject;
    # Ticket description
    string description?;
    # Priority (0 - Normal, 1 - Medium, 2 - Rush)
    int priority;
    int[] assignedUsers?;
    string[] files?;
    int[] attached_files?;
    string[] preview_images?;
    string assignType;
    int assignTo;
    int group_id?;
    # Ticket due datetime
    string due_date?;
    # Calculate only business days
    boolean only_business_days?;
    # Notify assigned users
    boolean notify_assigned_users?;
    # Indicates if the ticket is visible to Merchant users
    boolean merchantVisible?;
    CheckListRequest[] checklist?;
};

public type File record {
    int id?;
    string name?;
    int size?;
    # File creation date (Y-m-d\TH:i:sP)
    string created?;
    int created_by?;
};

public type TypeDetail record {
    BriefTicketTypeInfo general?;
    ChecklistFullInfo[] checklist?;
};

public type TicketType record {
    # Type id
    int id?;
    # Ticket type
    string name?;
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
