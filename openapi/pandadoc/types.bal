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

public type DocumentAttachmentResponseArr DocumentAttachmentResponse[];

public type TemplateListResponse record {
    TemplatelistresponseResults[] results?;
};

public type DocumentcreaterequestImages record {
    string[] urls;
    string name;
};

public type DocumentcreaterequestContentPlaceholders record {
    # Content placeholder block id
    string block_id?;
    DocumentcreaterequestContentLibraryItems[] content_library_items?;
};

public type TemplatesFolderRenameRequest record {
    # Provide a new name for the folder.
    string name;
};

public type DocumentTransferAllOwnershipRequest record {
    # A unique identifier of a workspace member from whom you want to transfer ownership.
    string from_membership_id?;
    # A unique identifier of a workspace member to whom you want to transfer ownership.
    string to_membership_id?;
};

public type TemplatelistresponseResults record {
    string id?;
    string name?;
    string date_created?;
    string date_modified?;
    string 'version?;
};

public type DocumentcreatebytemplaterequestContentPlaceholders record {
    DocumentcreatebytemplaterequestContentLibraryItems[] content_library_items?;
    string block_id;
};

public type DocumentdetailsresponseGrandTotal record {
    string amount?;
    string currency?;
};

public type ContentlibraryitemresponseCreatedBy record {
    string id?;
    string email?;
    string first_name?;
    string last_name?;
    string? avatar?;
};

public type DocumentlistresponseResults record {
    string id?;
    string name?;
    string status?;
    string date_created?;
    string date_modified?;
    string? expiration_date?;
    string 'version?;
};

public type DocumentattachmentresponseCreatedBy record {
    string id?;
    string email?;
    string first_name?;
    string last_name?;
    string? avatar?;
};

public type DocumentcreaterequestContentLibraryItems record {
    # Content library item id
    string id;
    PricingTableRequest[] pricing_tables?;
    record {} fields?;
    DocumentcreatebytemplaterequestRecipients[] recipients?;
};

public type DocumentsFolderRenameRequest record {
    # Provide a new name for the folder.
    string name;
};

public type DocumentAttachmentRequest record {
    # Binary file to be attached to a document
    string file?;
    # URL link to the file to be attached to a document
    string 'source?;
    # Optional name to set for uploaded file
    string name?;
};

public type OAuth2AccessTokenResponse record {
    string access_token?;
    string token_type?;
    decimal expires_in?;
    string scope?;
    string refresh_token?;
};

public type DocumentcreatebytemplaterequestContentLibraryItems record {
    string id;
    record {} fields?;
    PricingTableRequest[] pricing_tables?;
    DocumentcreatebytemplaterequestRecipients[] recipients?;
};

public type ContactUpdateRequest record {
    string email?;
    string? first_name?;
    string? last_name?;
    string? company?;
    string? job_title?;
    string? phone?;
    string? state?;
    string? street_address?;
    string? city?;
    string? postal_code?;
};

public type TemplatedetailsresponseImages record {
    string? name?;
    string block_uuid?;
    string[] urls?;
};

public type DocumentsFolderListResponse record {
    DocumentsfolderlistresponseResults[] results?;
};

public type TemplatesFolderListResponse record {
    TemplatesfolderlistresponseResults[] results?;
};

public type DocumentAttachmentResponse record {
    string uuid?;
    string date_created?;
    DocumentattachmentresponseCreatedBy created_by?;
    string? name?;
};

public type LinkedObjectListResponse record {
    LinkedObjectCreateResponse[] linked_objects?;
};

public type TemplatedetailsresponseTokens record {
    string name?;
    string value?;
};

public type MemberListResponse record {
    MemberDetailsResponse[] results?;
};

public type ContentlibraryitemlistresponseResults record {
    string id?;
    string name?;
    string date_created?;
    string date_modified?;
    string 'version?;
};

public type ApiloglistresponseResults record {
    string id?;
    string url?;
    int status?;
    string request_time?;
    string response_time?;
};

public type ContactDetailsResponse record {
    string id?;
    string email?;
    string? first_name?;
    string? last_name?;
    string? company?;
    string? job_title?;
    string? phone?;
    string? state?;
    string? street_address?;
    string? city?;
    string? postal_code?;
};

public type DocumentSendResponse record {
    string id?;
    string name?;
    string status?;
    string date_created?;
    string date_modified?;
    string expiration_date?;
    string 'version?;
    string uuid?;
    string shared_link?;
};

public type InlineResponse4001 record {
    string 'type?;
    record {} detail?;
};

public type DocumentSendRequest record {
    # A message that will be sent by email with a link to a document to sign.
    string message?;
    # Value that will be used as the email subject.
    string subject?;
    # Disables sent, viewed, comment, and completed email notifications for document recipients and the document sender. By default, notifications emails are sent for specific actions. If set as true, it won't affect the "Approve document" email notification sent to the Approver.
    boolean silent?;
};

public type InlineResponse4002 record {
    string 'type?;
    record {} detail?;
};

public type DocumentCreateByTemplateRequest record {
    # Name the document you are creating.
    string name;
    # The ID of a template you want to use. You can copy it from an in app template url such as `https://app.pandadoc.com/a/#/templates/{ID}/content`. A template ID is also obtained by listing templates.
    string template_uuid;
    string folder_uuid?;
    # The list of recipients you're sending the document to. Every object must contain the email parameter. The `role`, `first_name` and `last_name` parameters are optional. If the `role` parameter passed, a person is assigned all fields matching their corresponding role. If not passed, a person will receive a read-only link to view the document. If the `first_name` and `last_name` not passed the system 1. creates a new contact, if none exists with the given `email`; or 2. gets the existing contact with the given `email` that already exists.
    DocumentcreatebytemplaterequestRecipients[] recipients;
    # You can pass a list of tokens/values to pre-fill tokens used in a template. Name is a token name in a template. Value is a real value you would like to replace a token with.
    DocumentcreatebytemplaterequestTokens[] tokens?;
    # You can pass a list of fields/values to pre-fill fields used in a template. Note that the Signature field can't be pre-filled.
    record {} fields?;
    # You can pass arbitrary data in the key-value format to associate custom information with a document. This information is returned in any API requests for the document details by id.
    record {} metadata?;
    # Mark your document with one or several tags.
    string[] tags?;
    # You can pass a list of images to image blocks (one image in one block) for replacement.
    DocumentcreatebytemplaterequestImages[] images?;
    # Information to construct or populate a pricing table can be passed when creating a document. All product information must be passed when creating a new document. Products stored in PandaDoc cannot be used to populate table rows at this time. Keep in mind that this is an array, so multiple table objects can be passed to a document. Make sure that "Automatically add products to this table" is enabled in the PandaDoc template pricing tables you wish to populate via API.
    PricingTableRequest[] pricing_tables?;
    # You may replace Content Library Item Placeholders with a few content library items each and pre-fill fields/variables values, pricing table items, and assign recipients to roles from there.
    DocumentcreatebytemplaterequestContentPlaceholders[] content_placeholders?;
};

public type DocumentCreateLinkRequest record {
    # The email address for the recipient you're creating a document link for.
    string recipient;
    # Provide the number of seconds that a document link should be valid for. Default is 3600 seconds.
    decimal lifetime?;
};

public type PricingTableRequest record {
    string name;
    # When set to true all field names in data rows must be passed as external names defined in the template.
    boolean data_merge?;
    PricingtablerequestOptions options?;
    PricingtablerequestSections[] sections?;
};

public type MemberDetailsResponse record {
    # A unique identifier of the user in the organization.
    string user_id?;
    # A unique identifier of the user in the workspace.
    string membership_id?;
    # A user's email address.
    string email?;
    # A user's first name.
    string first_name?;
    # A user's last name.
    string last_name?;
    # A boolean value that identifies if a member is active in the workspace.
    boolean is_active?;
    # A name of the user's current active workspace.
    string workspace?;
    # A unique identifier of the user's current active workspace.
    string workspace_name?;
    # A boolean value that identifies if the email is verified.
    boolean emails_verified?;
    # A member's role in the workspace.
    string role?;
    # A user license in the organization.
    string user_license?;
    # A date when a member was added to the workspace.
    string date_created?;
    # Last modified date of a member.
    string date_modified?;
};

public type TemplatesfolderlistresponseResults record {
    string uuid?;
    string name?;
    string date_created?;
    boolean has_folders?;
    boolean has_items?;
};

public type DocumentsFolderCreateRequest record {
    # Name the folder for the Documents you are creating.
    string name;
    # ID of the parent folder. To create a new folder in the root folder, remove this parameter in the request.
    string parent_uuid?;
};

public type DocumentsFolderRenameResponse record {
    string uuid?;
    string name?;
    string date_created?;
};

public type InlineResponse401 record {
    string 'type?;
    string detail?;
};

public type PricingTableRequestRowDataTaxSecond record {
    decimal value?;
    string 'type?;
};

public type InlineResponse400 record {
    string 'error?;
};

public type InlineResponse403 record {
    string 'type?;
    string detail?;
};

public type ContentLibraryItemResponse record {
    string id?;
    string name?;
    string date_created?;
    string date_modified?;
    ContentlibraryitemresponseCreatedBy created_by?;
    record {} metadata?;
    record {}[] tokens?;
    record {}[] fields?;
    PricingTablesResponse pricing?;
    string[] tags?;
    record {}[] roles?;
    string 'version?;
    record {}[] content_placeholders?;
    record {}[] images?;
};

public type OAuth2RefreshAccessTokenRequest record {
    # This value must be set to `refresh_token`.
    string grant_type;
    # Client ID that is automatically generated after application creation in the Developer Dashboard.
    string client_id;
    # Client secret that is automatically generated after application creation in the Developer Dashboard.
    string client_secret;
    # `refresh_token` you received and stored from the server when initially creating an `access_token`.
    string refresh_token;
    # Requested permissions. Use `read+write` as our default value to send documents.
    string scope?;
};

public type ContactListResponse record {
    ContactDetailsResponse[] results?;
};

public type InlineResponse404 record {
    string 'type?;
    string detail?;
};

public type TemplatesFolderCreateResponse record {
    string uuid?;
    string name?;
    string date_created?;
};

public type TemplatedetailsresponseRoles record {
    string id?;
    string name?;
    string? signing_order?;
    TemplatedetailsresponsePreassignedPerson? preassigned_person?;
};

public type PricingtablerequestSections record {
    string title;
    boolean default?;
    boolean multichoice_enabled = false;
    PricingtablerequestRows[] rows?;
};

public type DocumentTransferOwnershipRequest record {
    # A unique identifier of a workspace member.
    string membership_id?;
};

public type TemplatedetailsresponseContentPlaceholders record {
    string uuid?;
    string block_id?;
    string description?;
};

public type PricingTableRequestRowDataTaxFirst record {
    decimal value?;
    string 'type?;
};

public type OAuth2CreateAccessTokenRequest record {
    # This value must be set to `authorization_code`.
    string grant_type;
    # Client ID that is automatically generated after application creation in the Developer Dashboard.
    string client_id;
    # Client secret that is automatically generated after application creation in the Developer Dashboard.
    string client_secret;
    # `auth_code` from the server on the previous step (Authorize a PandaDoc User).
    string code;
    # Requested permissions. Use `read+write` to create, send, delete, and download documents, and `read` to view templates and document details.
    string scope?;
};

public type DocumentStatusRequestEnum int;

public type DocumentcreateresponseLinks record {
    string rel?;
    string href?;
    string 'type?;
};

public type APILogDetailsResponse record {
    string id?;
    string url?;
    string method?;
    int status?;
    string request_time?;
    string response_time?;
    record {} response_body?;
    string query_params_string?;
    record {} query_params_object?;
    record {} request_body?;
    string token_type?;
    string? application?;
    string 'key?;
    string request_id?;
    string user_email?;
    string user_id?;
};

public type TemplatesFolderRenameResponse record {
    string uuid?;
    string name?;
    string date_created?;
};

public type DocumentStatusEnum string;

public type InlineResponse409 record {
    string id?;
    string status?;
    string info_message?;
};

public type PricingtablerequestRows record {
    PricingTableRequestRowOptions options?;
    PricingTableRequestRowData data?;
    record {} custom_fields?;
};

public type PricingTableRequestRowData record {
    string name;
    string? description?;
    decimal price;
    decimal cost?;
    int qty;
    string? sku?;
    PricingTableRequestRowDataDiscount? discount?;
    PricingTableRequestRowDataTaxFirst? tax_first?;
    PricingTableRequestRowDataTaxSecond? tax_second?;
};

public type PricingTableRequestRowOptions record {
    boolean qty_editable?;
    boolean optional_selected?;
    boolean optional?;
};

public type DocumentdetailsresponseLinkedObjects record {
    string provider?;
    string entity_type?;
    string entity_id?;
};

public type DocumentListResponse record {
    DocumentlistresponseResults[] results?;
};

public type ContactCreateRequest record {
    string email;
    string? first_name?;
    string? last_name?;
    string? company?;
    string? job_title?;
    string? phone?;
    string? state?;
    string? street_address?;
    string? city?;
    string? postal_code?;
};

public type PricingtablerequestOptions record {
    string currency?;
    PricingtablerequestOptionsDiscount? discount?;
    PricingtablerequestOptionsTaxFirst? tax_first?;
    PricingtablerequestOptionsTaxSecond? tax_second?;
};

public type PricingtablesresponseTables record {
    string name?;
    string id?;
    string total?;
    boolean is_included_in_total?;
    PricingtablesresponseSummary? summary?;
    PricingtablesresponseItems[] items?;
    string currency?;
};

public type TemplateDetailsResponse record {
    string id?;
    string name?;
    string date_created?;
    string date_modified?;
    ContentlibraryitemresponseCreatedBy created_by?;
    record {} metadata?;
    TemplatedetailsresponseTokens[] tokens?;
    record {}[] fields?;
    PricingTablesResponse pricing?;
    string[] tags?;
    TemplatedetailsresponseRoles[] roles?;
    string 'version?;
    TemplatedetailsresponseContentPlaceholders[] content_placeholders?;
    TemplatedetailsresponseImages[] images?;
};

public type DocumentCreateRequest record {
    # Name the document you are creating.
    string name?;
    # ID of the template you want to use. You can copy it from an in-app template URL such as `https://app.pandadoc.com/a/#/templates/{ID}/content`. A template ID is also obtained by listing templates.
    string template_uuid?;
    # ID of the folder where the created document should be stored.
    string folder_uuid?;
    # The list of recipients you're sending the document to. Every object must contain the `email` parameter. The `role`, `first_name` and `last_name` parameters are optional. If the `role` parameter is passed, a person is assigned all fields matching their corresponding role. If a role was not passed, a person receives a read-only link to view the document. If the `first_name` and `last_name` are not passed, the system does this 1. Creates a new contact, if none exists with the given `email`; or 2. Gets the existing contact with the given `email` that already exists.
    DocumentcreaterequestRecipients[] recipients?;
    # You can pass a list of tokens/values to pre-fill tokens used in a template. Name is a token name in a template. Value is a real value you would like to replace a token with.
    DocumentcreatebytemplaterequestTokens[] tokens?;
    # You can pass a list of fields/values to pre-fill fields used in a template. Please note Signature field can't be pre-filled.
    record {} fields?;
    # You can pass arbitrary data in the key-value format to associate custom information with a document. This information is returned in any API requests for the document details by id.
    record {} metadata?;
    # Mark your document with one or several tags.
    string[] tags?;
    # You can pass a list of images to image blocks (one image in one block) for replacement.
    DocumentcreaterequestImages[] images?;
    # Information to construct or populate a pricing table can be passed when creating a document. All product information must be passed when creating a new document. Products stored in PandaDoc cannot be used to populate table rows at this time. Keep in mind that this is an array, so multiple table objects can be passed to a document.
    PricingTableRequest[] pricing_tables?;
    # You may replace Content Library Item Placeholders with a few content library items each and pre-fill fields/variables values, pricing table items, and assign recipients to roles from there.
    DocumentcreaterequestContentPlaceholders[] content_placeholders?;
    # Use a URL to specify the PDF. We support only URLs starting with https.
    string url?;
    # Set this parameter as true if you create a document from a PDF with form fields and as false if you upload a PDF with field tags.
    boolean parse_form_fields?;
};

public type TemplatedetailsresponsePreassignedPerson record {
    string email?;
    string 'type?;
};

public type DocumentOrderingFieldsEnum string;

public type FormListResponse record {
    FormlistresponseResults[] results?;
    boolean has_next_page?;
};

public type InlineResponse429 record {
    string 'type?;
    string detail?;
};

public type DocumentdetailsresponseTemplate record {
    string id?;
    string name?;
};

public type PricingtablesresponseItems record {
    string? id?;
    string? sku?;
    string? qty?;
    string? name?;
    string? cost?;
    string? price?;
    string? description?;
    record {} custom_fields?;
    record {} custom_columns?;
    PricingtablesresponseDiscount? discount?;
    PricingtablesresponseDiscount? tax_first?;
    PricingtablesresponseDiscount? tax_second?;
    string? subtotal?;
    PricingtablesresponseOptions? options?;
    string? sale_price?;
    record {} taxes?;
    record {} discounts?;
    record {} fees?;
    # Will contain all the fields in flat structure with external field names defined in the template.
    record {} merged_data?;
};

public type TemplatesFolderCreateRequest record {
    # Name the folder for Templates you are creating.
    string name;
    # ID of the parent folder. To create a new folder in the root folder, remove this parameter in the request.
    string parent_uuid?;
};

public type PricingtablerequestOptionsTaxFirst record {
    string 'type;
    string name;
    decimal value;
};

public type DocumentsFolderCreateResponse record {
    string uuid?;
    string name?;
    string date_created?;
};

public type PricingtablesresponseSummary record {
    string? subtotal?;
    string? total?;
    string? discount?;
    string? tax?;
};

public type PricingtablesresponseDiscount record {
    string? value?;
    string? 'type?;
};

public type DocumentdetailsresponseRecipients record {
    string recipient_type?;
    string role?;
    string[] roles?;
    string last_name?;
    anydata signing_order?;
    string id?;
    string contact_id?;
    string first_name?;
    string email?;
    boolean has_completed?;
    string shared_link?;
};

public type LinkedObjectCreateRequest record {
    # CRM name (lowercase). See the list above.
    string provider;
    # Entity type. The system validates if the type is supported. See the list for each CRM above.
    string entity_type;
    # Entity unique identifier. The system validates if the entity exists.
    string entity_id;
};

public type DocumentdetailsresponseCreatedBy record {
    string id?;
    string membership_id?;
    string email?;
    string first_name?;
    string last_name?;
    string? avatar?;
};

public type DocumentsfolderlistresponseResults record {
    string uuid?;
    string name?;
    string date_created?;
    boolean has_folders?;
    boolean has_items?;
};

public type PricingtablerequestOptionsDiscount record {
    string 'type;
    string name;
    decimal value;
};

public type APILogListResponse record {
    ApiloglistresponseResults[] results?;
};

public type Oauth2AccessTokenBody OAuth2CreateAccessTokenRequest|OAuth2RefreshAccessTokenRequest;

public type V1DocumentsBody record {
    # Binary PDF File
    string file?;
    # JSON as a multipart/form-data string.
    record {} data?;
};

public type DocumentStatusChangeRequest record {
    DocumentStatusRequestEnum status;
    # Provide “private notes” regarding the manual status change.
    string note?;
    # Send a notification email about the status change to all recipients.
    boolean notify_recipients?;
};

public type DocumentcreatebytemplaterequestImages record {
    string[] urls;
    string name;
};

public type DocumentCreateByPdfRequest record {
    # Use a URL to specify the PDF. We support only URLs starting with https.
    string url;
    # The list of recipients you're sending the document to. Every object must contain the email parameter. The `role`, `first_name` and `last_name` parameters are optional. If the `role` parameter passed, a person is assigned all fields matching their corresponding role. If not passed, a person will receive a read-only link to view the document. If the `first_name` and `last_name` not passed the system 1. creates a new contact, if none exists with the given `email`; or 2. gets the existing contact with the given `email` that already exists.
    DocumentcreatebytemplaterequestRecipients[] recipients;
    # Set this parameter as `true` if you create a document from a PDF with form fields and as `false` if you upload a PDF with field tags.
    boolean parse_form_fields?;
    string name?;
    # Mark your document with one or several tags.
    string[] tags?;
    # If you are creating a document from a PDF with field tags, you can pass a list of the fields you'd like to pre-fill in the document. If you are creating a document from a PDF with form fields, list all the fields and provide the `role` parameter so that the fields are assigned to document recipients. You can provide empty value for the field so that it's not pre-filled: "value": "".
    record {} fields?;
    # You can pass arbitrary data in the key-value format to associate custom information with a document. This information is returned in any API requests for the document details by id.
    record {} metadata?;
};

public type PricingtablerequestOptionsTaxSecond record {
    string 'type;
    string name;
    decimal value;
};

public type FormlistresponseResults record {
    string id?;
    string name?;
    string date_created?;
    string date_modified?;
    string status?;
};

public type IdStatusBody record {
    # Binary attachment file
    string file?;
    # JSON as a multipart/form-data string.
    record {} data?;
};

public type DocumentCreateLinkResponse record {
    string id?;
    string expires_at?;
};

public type PricingTableRequestRowDataDiscount record {
    decimal value?;
    string 'type?;
};

public type DocumentDetailsResponse record {
    string id?;
    string name?;
    anydata autonumbering_sequence_name_prefix?;
    string date_created?;
    string date_modified?;
    string? date_completed?;
    DocumentdetailsresponseCreatedBy created_by?;
    DocumentdetailsresponseTemplate? template?;
    anydata expiration_date?;
    record {} metadata?;
    record {}[] tokens?;
    record {}[] fields?;
    PricingTablesResponse pricing?;
    string 'version?;
    string[] tags?;
    anydata sent_by?;
    DocumentdetailsresponseRecipients[] recipients?;
    DocumentdetailsresponseGrandTotal grand_total?;
    DocumentdetailsresponseLinkedObjects[] linked_objects?;
    string status?;
};

public type DocumentStatusResponse record {
    string id?;
    string name?;
    string status?;
    string date_created?;
    string? date_modified?;
    string? date_completed?;
    string? expiration_date?;
    string? 'version?;
    string uuid?;
};

public type LinkedObjectCreateResponse record {
    string id?;
    # CRM name (lowercase). See the list above.
    string provider?;
    # Entity type. The system validates if the type is supported. See the list for each CRM above.
    string entity_type?;
    # Entity unique identifier. The system validates if the entity exists.
    string entiry_id?;
};

public type PricingTablesResponse record {
    PricingtablesresponseTables[] tables?;
    string total?;
};

public type DocumentcreatebytemplaterequestRecipients record {
    string email;
    string first_name?;
    string last_name?;
    string role?;
    int? signing_order?;
};

public type DocumentcreatebytemplaterequestTokens record {
    string name;
    string value;
};

public type ContentLibraryItemListResponse record {
    ContentlibraryitemlistresponseResults[] results?;
};

public type PricingtablesresponseOptions record {
    boolean? optional?;
    boolean? optional_selected?;
    boolean? multichoice_enabled?;
    boolean? multichoice_selected?;
};

public type DocumentCreateResponse record {
    string id?;
    string name?;
    DocumentStatusEnum status?;
    string date_created?;
    string date_modified?;
    string? expiration_date?;
    string uuid?;
    DocumentcreateresponseLinks[] links?;
    string info_message?;
};

public type DocumentcreaterequestRecipients record {
    string email;
    string first_name?;
    string last_name?;
    string role?;
    int signing_order?;
};
