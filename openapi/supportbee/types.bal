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

# The data required to create a comment.
public type CommentRequest record {
    # Specifies the content of the comment. Either text or html must be present.
    CommentRequestContent? content?;
};

# The data required to assign a ticket to a user.
public type AssignUserRequest record {
    # The data required to assign a ticket to a user.
    UserAssignmentRequest? user_assignment?;
};

# Specifies the content of the comment.
public type CommentContent record {
    # Specifies the text content of the comment.
    string? text?;
    # Specifies the html content of the comment.
    string? html?;
    # Specifies the attachments of the comment.
    Attachment[]? attachments?;
};

# User object
public type User record {
    # Email ID
    int? id?;
    # Email address
    string? email?;
    # Name
    string? name?;
    # Agent status
    boolean? agent?;
    # Picture object
    Picture? picture?;
};

# A reply object.
public type ReplyObject record {
    # Reply object
    Reply? reply?;
};

# Label object.
public type Label record {
    # Label ID.
    int? id?;
    # Label name.
    string? label?;
    # Ticket ID.
    int? ticket?;
};

# Specifies the attachment object.
public type Attachment record {
    # Attachment ID
    int? id?;
    # Created at
    string? created_at?;
    # Filename
    string? filename?;
    # Content type
    string? content_type?;
    # URL object
    Url? url?;
};

# The data required to create a reply.
public type CreateReplyRequest record {
    # The data required to create a reply.
    ReplyRequest? reply?;
};

# Created comment.
public type CreatedComment record {
    # Comment object
    Comment? comment?;
};

# An object with a property users which is an array of User objects.
public type Users record {
    # An array of User objects.
    UserObject[]? users?;
};

# The data required to create a ticket.
public type TicketRequest record {
    # Specifies the subject of the ticket.
    string? subject?;
    # Specifies the name of the requester of the ticket.
    string? requester_name?;
    # Specifies the email of the requester of the ticket.
    string? requester_email?;
    # Specifies the CC email addresses included in the ticket. If there are multiple emails, pass them comma separated. Up to 25 addresses are allowed.
    string[]? cc?;
    # Specifies the BCC email addresses included in the ticket. If there are multiple emails, pass them comma separated. Up to 25 addresses are allowed.
    string[]? bcc?;
    # If true, a copy of the ticket is sent to the requester and all email addresses in CC and BCC. An auto-response is not sent when this parameter is true (even if it's enabled in the settings). The sender name in this copy is taken from the forwarding address used to create the ticket.
    boolean? notify_requester?;
    # Specifies the content of the ticket. Either text or html must be present.
    Content? content?;
    # Specifies the attachment IDs of the ticket.
    int[]? attachment_ids?;
    # This optional parameter lets you specify the email address/name to be used for sending out replies/auto-responses to the customer. You can find the forwarding address id by editing the desired forwarding address and copying the id from the URL once you are on the edit page (we are working on making this more straight forward). If you are using a SMTP server for delivering emails, it's important that you send this parameter and use the correct email address to avoid any delivery issues.
    string? forwarding_address_id?;
};

# Source of the ticket
public type Source record {
    # Email address
    string? email?;
};

# URL object
public type Url record {
    # Original URL
    string? original?;
    # Thumbnail URL
    string? thumb?;
};

# The assigned user object
public type AssignedUserObject record {
    # User assignment ID
    int? id?;
    # Created at
    string? created_at?;
    # User assignment ticket object
    UserAssignmentTicket? ticket?;
    # Assignee object
    Assignee? assignee?;
};

# Created label.
public type CreatedLabel record {
    # Label object.
    Label? label?;
};

# Requester object
public type Requester record {
    # Email ID
    int? id?;
    # Email address
    string? email?;
    # Name
    string? name?;
    # Role
    string? role?;
    # Agent status
    boolean? agent?;
    # Picture object
    Picture? picture?;
};

# Replier object
public type Replier record {
    # Replier ID
    int? id?;
    # Email address
    string? email?;
    # Name
    string? name?;
    # Agent status
    boolean? agent?;
    # Picture object
    Picture? picture?;
};

# User assignment ticket object
public type UserAssignmentTicket record {
    # User assignment ticket ID
    int? id?;
};

# Picture object
public type Picture record {
    # Thumb 20
    string? thumb20?;
    # Thumb 24
    string? thumb24?;
    # Thumb 32
    string? thumb32?;
    # Thumb 48
    string? thumb48?;
    # Thumb 64
    string? thumb64?;
    # Thumb 128
    string? thumb128?;
};

# Specifies the content of the reply. Either text or html must be present.
public type ReplyRequestContent record {
    # Specifies the text content of the ticket.
    string? text?;
    # Specifies the html content of the ticket.
    string? html?;
    # Specifies the attachment IDs of the ticket.
    int[]? attachment_ids?;
};

# An object with a property tickets which is an array of Ticket objects.
public type Tickets record {
    # Total tickets
    int? total?;
    # Current page count
    int? current_page?;
    # Per page count
    int? per_page?;
    # Total pages count
    int? total_pages?;
    # An array of Ticket objects.
    Ticket[]? tickets?;
};

# Team object
public type Team record {
    # Email ID
    int? id?;
    # Name
    string? name?;
    # Picture object
    Picture? picture?;
};

# Specifies the content of the ticket.
public type TicketContent record {
    # Specifies the text content of the ticket.
    string? text?;
    # Specifies the html content of the ticket.
    string? html?;
    # Specifies the attachments of the ticket.
    Attachment[]? attachments?;
};

# An object with a property replies which is an array of Reply objects.
public type Replies record {
    # An array of Reply objects.
    Reply[]? replies?;
};

# Specifies the content of the comment. Either text or html must be present.
public type CommentRequestContent record {
    # Specifies the text content of the comment.
    string? text?;
    # Specifies the html content of the comment.
    string? html?;
    # Specifies the attachment IDs of the comment.
    int[]? attachment_ids?;
};

# CC object
public type CC record {
    # Email ID
    int? id?;
    # Email address
    string? email?;
    # Name
    string? name?;
    # Role
    string? role?;
    # Agent status
    boolean? agent?;
    # Picture object
    Picture? picture?;
};

# Current user assignee
public type CurrentUserAssignee record {
    # User object
    User? user?;
};

# Ticket object
public type Ticket record {
    # Ticket ID
    int? id?;
    # Subject of the ticket
    string? subject?;
    # Reply count for the ticket
    int? replies_count?;
    # Comments count for the ticket
    int? comments_count?;
    # Last activity at
    string? last_activity_at?;
    # Created at
    string? created_at?;
    # Unanswered status
    boolean? unanswered?;
    # Archived status
    boolean? archived?;
    # Spam status
    boolean? spam?;
    # Starred status
    boolean? starred?;
    # Summary of the ticket
    string? summary?;
    # Source of the ticket
    Source? 'source?;
    # Specifies the CC email addresses included in the ticket.
    CC[]? cc?;
    # Specifies the BCC email addresses included in the ticket.
    BCC[]? bcc?;
    # Current user assignee
    CurrentUserAssignee? current_user_assignee?;
    # Current team assignee
    CurrentTeamAssignee? current_team_assignee?;
    # Requester object
    Requester? requester?;
    # Specifies the content of the ticket.
    TicketContent? content?;
};

# Current team assignee
public type CurrentTeamAssignee record {
    # Team object
    Team? team?;
};

# Assignee object
public type Assignee record {
    # User object
    User? user?;
};

# Comment object
public type Comment record {
    # Comment ID
    int? id?;
    # Created at
    string? created_at?;
    # Ticket object
    Ticket? ticket?;
    # Commenter object
    Commenter? commenter?;
    # Specifies the content of the comment.
    CommentContent? content?;
};

# BCC object
public type BCC record {
    # Email ID
    int? id?;
    # Email address
    string? email?;
    # Name
    string? name?;
    # Role
    string? role?;
    # Agent status
    boolean? agent?;
    # Picture object
    Picture? picture?;
};

# An object with a property comments which is an array of Comment objects.
public type Comments record {
    # An array of Comment objects.
    Comment[]? comments?;
};

# User object
public type UserObject record {
    # User ID
    int? id?;
    # User type
    string? 'type?;
    # Email address
    string? email?;
    # First name
    string? first_name?;
    # Last name
    string? last_name?;
    # Name
    string? name?;
    # Role
    string? role?;
    # Agent status
    boolean? agent?;
    # Two factor authentication enabled
    boolean? two_factor_authentication_enabled?;
    # Picture object
    Picture? picture?;
    # Can members access group tickets
    boolean? can_members_access_group_tickets?;
    # Members count
    int? members_count?;
    # Active tickets count
    int? active_tickets_count?;
};

# An object with a property labels which is an array of Label objects.
public type Labels record {
    # An array of Label objects.
    LabelObject[]? labels?;
};

# A ticket object.
public type TicketObject record {
    # Ticket object
    Ticket? ticket?;
};

# The data required to assign a ticket to a user.
public type UserAssignmentRequest record {
    # User ID
    int? user_id?;
};

# Specifies the content of the reply.
public type ReplyContent record {
    # Specifies the text content of the reply.
    string? text?;
    # Specifies the html content of the reply.
    string? html?;
    # Specifies the attachments of the reply.
    Attachment[]? attachments?;
};

# Get user object
public type GetUserObject record {
    # User object
    UserObject? user?;
};

# Created reply.
public type CreatedReply record {
    # Reply object
    Reply? reply?;
};

# The data required to create a reply.
public type ReplyRequest record {
    # Specifies the CC email addresses included in the reply. If there are multiple emails, pass them comma separated. Up to 25 addresses are allowed.
    string[]? cc?;
    # Specifies the BCC email addresses included in the reply. If there are multiple emails, pass them comma separated. Up to 25 addresses are allowed.
    string[]? bcc?;
    # Specifies the content of the reply. Either text or html must be present.
    ReplyRequestContent? content?;
};

# The data required to create a comment.
public type CreateCommentRequest record {
    # The data required to create a comment.
    CommentRequest? comment?;
};

# The data required to create a ticket.
public type CreateTicketRequest record {
    # The data required to create a ticket.
    TicketRequest? ticket?;
};

# Specifies the content of the ticket. Either text or html must be present.
public type Content record {
    # Specifies the text content of the ticket.
    string? text?;
    # Specifies the html content of the ticket.
    string? html?;
    # Specifies the attachment IDs of the ticket.
    int[]? attachment_ids?;
};

# Reply object
public type Reply record {
    # Reply ID
    int? id?;
    # Created at
    string? created_at?;
    # Summary of the reply
    string? summary?;
    # Specifies the CC email addresses included in the reply.
    CC[]? cc?;
    # Specifies the BCC email addresses included in the reply.
    BCC[]? bcc?;
    # Ticket object
    Ticket? ticket?;
    # Replier object
    Replier? replier?;
    # Specifies the content of the reply.
    ReplyContent? content?;
};

# Commenter object
public type Commenter record {
    # Replier ID
    int? id?;
    # Email address
    string? email?;
    # Name
    string? name?;
    # Agent status
    boolean? agent?;
    # Picture object
    Picture? picture?;
};

# Label object.
public type LabelObject record {
    # Label name
    string? name?;
    # Label color
    string? color?;
};

# Created ticket.
public type CreatedTicket record {
    # Ticket object
    Ticket? ticket?;
};
