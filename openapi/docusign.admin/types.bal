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

public type OrganizationAccountSettingsImportResponseArr OrganizationAccountSettingsImportResponse[];

# Methods and objects to get account information.
public type AccountSettingsExport record {
};

# A list of accounts to close for a user.
public type DeleteMembershipsRequest record {
    # A list of accounts to close for a user.
    DeleteMembershipRequest[] accounts;
};

# 
public type AddUserResponse record {
    # 
    string id?;
    # 
    int site_id?;
    # The full name of the user.
    string user_name?;
    # The user's first name.
    string first_name?;
    # The user's last name.
    string last_name?;
    # The email address.
    string email?;
    # The language and culture of the user.
    # 
    #   * Chinese Simplified: `zh_CN`
    #   * Chinese Traditional: `zh_TW`
    #   * Dutch: `nl`
    #   * English: `en`
    #   * French: `fr`
    #   * German: `de`
    #   * Italian: `it`
    #   * Japanese: `ja`
    #   * Korean: `ko`
    #   * Portuguese: `pt`
    #   * Portuguese Brazil: `pt_BR`
    #   * Russian: `ru`
    #   * Spanish: `es`
    string language_culture?;
    # The user's federated status. One of:
    # 
    # - `RemoveStatus`
    # - `FedAuthRequired`
    # - `FedAuthBypass`
    # - `Evicted`
    string federated_status?;
    # 
    AddUserResponseAccountProperties[] accounts?;
};

# DS Group add data
public type DSGroupAddRequest record {
    # Group name
    string group_name;
    # Description
    string description?;
};

# A change email request.
public type UpdateUsersEmailRequest record {
    # A list of users whose email address to change.
    UpdateUserEmailRequest[] users?;
};

# Methods to manage users in an account.
public type Users record {
};

# Information about a newly created user.
public type NewUserResponseAccountProperties record {
    # The user's unique ID.
    string id?;
    # The site ID of the account.
    int site_id?;
    # This object is an individual permission profile response.
    PermissionProfileResponse permission_profile?;
    # A list of groups that the user belongs to.
    MemberGroupResponse[] groups?;
    # The user's company name.
    string company_name?;
    # The job title of the user.
    string job_title?;
};

# Product permission profile data
public type ProductPermissionProfilesRequest record {
    # Prouct permission profiles
    ProductPermissionProfileRequest[] product_permission_profiles;
};

# A list of users whose information you want to change.
public type UpdateUsersRequest record {
    # A list of users whose information you want to change.
    UpdateUserRequest[] users?;
};

# Results of closing accounts.
public type DeleteMembershipResponse record {
    # The ID of an account that could not be closed.
    string id?;
    # Errors.
    ErrorDetails error_details?;
};

# 
public type AddDSGroupUsersResponse record {
    # 
    boolean is_success?;
    # 
    int TotalCount?;
    # A list of users.
    DSGroupUserResponse[] users?;
};

# Information about a SAML 2.0 identity provider.
public type Saml2IdentityProviderResponse record {
    # The name of the certificate issuer.
    string issuer?;
    # A list of settings.
    SettingResponse[] settings?;
    # A list of certificates responses.
    CertificateResponse[] certificates?;
    # A list of attribute mappings.
    RequiredAttributeMappingResponse[] attribute_mappings?;
};

# Information about a list of users.
public type UsersDrilldownResponse record {
    # A list of users.
    UserDrilldownResponse[] users?;
};

# Organization list.
public type OrganizationsResponse record {
    # A list of organizations of which the  authenticated user is a member.
    OrganizationResponse[] organizations?;
};

# Enables you to specify the kind of export request.
public type OrganizationExportRequest record {
    # The type of export requested. One of:
    # 
    # - `organization_domain_users_export`: All users of the reserved domains.
    # - `organization_external_memberships_export`: Users whose email address domain is *not* linked to the organization. 
    # - `organization_memberships_export`: Every user in every account in the organization. Users in multiple accounts will appear more than once.
    # - `organization_account_settings_export`: This value only applies to requests to export account settings.
    string 'type?;
    # Organization export accounts
    OrganizationExportAccount[] accounts?;
    # Organization export domains
    OrganizationExportDomain[] domains?;
};

# A list of permission profiles for a given account.
public type PermissionsResponse record {
    # An array of permission profile responses.
    PermissionProfileResponse[] permissions?;
};

# The results of closing a user's account.
public type DeleteMembershipsResponse record {
    # If **true**, the request to close the accounts succeeded.
    boolean success?;
    # A list of accounts that were closed.
    DeleteMembershipResponse[] accounts?;
};

# 
public type OrganizationExportTaskResponse record {
    # 
    string id?;
    # 
    int site_id?;
    # 
    string url?;
    # 
    int number_rows?;
    # 
    int size_bytes?;
    # 
    OetrErrordetails error_details?;
};

# Error result of attempting to change a user's email address.
public type UserUpdateResponse record {
    # The ID of the user whose email address has been updated.
    string id?;
    # The site ID.
    int site_id?;
    # The email address.
    string email?;
    # Errors.
    ErrorDetails error_details?;
};

# 
public type ProductPermissionProfileRequest record {
    # 
    string product_id;
    # 
    string permission_profile_id;
};

# Information about a newly created user.
public type NewUserResponse record {
    # The ID of the added user
    string id?;
    # The site ID of the added user.
    int site_id?;
    # The full name of the user.
    string user_name?;
    # The user's first name.
    string first_name?;
    # The user's last name.
    string last_name?;
    # The primary email address of the user.
    string email?;
    # The language and culture of the user.
    # 
    #   * Chinese Simplified: `zh_CN`
    #   * Chinese Traditional: `zh_TW`
    #   * Dutch: `nl`
    #   * English: `en`
    #   * French: `fr`
    #   * German: `de`
    #   * Italian: `it`
    #   * Japanese: `ja`
    #   * Korean: `ko`
    #   * Portuguese: `pt`
    #   * Portuguese Brazil: `pt_BR`
    #   * Russian: `ru`
    #   * Spanish: `es`
    string language_culture?;
    # The user's federated status. One of:
    # 
    # - `RemoveStatus`
    # - `FedAuthRequired`
    # - `FedAuthBypass`
    # - `Evicted`
    string federated_status?;
    # A list of accounts the user belongs to.
    NewUserResponseAccountProperties[] accounts?;
};

# Methods to import users.
public type UserImport record {
};

# An ID object.
public type OrganizationSimpleIdObject record {
    # The ID.
    string id?;
};

# 
public type OrganizationAccountSettingsImportResultResponse record {
    # 
    string id?;
    # 
    int site_id?;
    # 
    string url?;
    # 
    int number_processed_accounts?;
    # 
    OasirrErrordetails error_details?;
    # 
    OasirrOrganizationaccountsettingserrordataresponse[] processing_issues_by_account?;
    # 
    int number_unprocessed_accounts?;
};

# Information about a new user.
public type NewUserRequest record {
    # A list of accounts the user will belong to.
    NewUserRequestAccountProperties[] accounts;
    # The full name of the user.
    string user_name?;
    # The user's first name.
    string first_name?;
    # The user's last name.
    string last_name?;
    # The email address.
    string email;
    # The account ID of the user's default account.
    string default_account_id?;
    # The language and culture of the user.
    # 
    #   * Chinese Simplified: `zh_CN`
    #   * Chinese Traditional: `zh_TW`
    #   * Dutch: `nl`
    #   * English: `en`
    #   * French: `fr`
    #   * German: `de`
    #   * Italian: `it`
    #   * Japanese: `ja`
    #   * Korean: `ko`
    #   * Portuguese: `pt`
    #   * Portuguese Brazil: `pt_BR`
    #   * Russian: `ru`
    #   * Spanish: `es`
    string language_culture?;
    # Selected languages
    string selected_languages?;
    # The access code that the user needs to activate an account.
    string access_code?;
    # The user's federated status. One of:
    # 
    # - `RemoveStatus`
    # - `FedAuthRequired`
    # - `FedAuthBypass`
    # - `Evicted`
    string federated_status?;
    # If **true**, the user's account is activated automatically.
    boolean auto_activate_memberships?;
};

# An individual new account user.
public type NewUserRequestAccountProperties record {
    # The account ID.
    string id;
    # A permission profile.
    PermissionProfileRequest permission_profile?;
    # The new user's requested groups.
    GroupRequest[] groups?;
    # The user's company name.
    string company_name?;
    # The user's job title.
    string job_title?;
};

# Results of deleting a user identity.
public type UserIdentityResponse record {
    # The ID of the result.
    string id?;
    # The ID of the identity provider.
    string provider_id?;
    # The user ID.
    string user_id?;
    # A unique ID to identify the removed user.
    string immutable_id?;
    # Errors.
    ErrorDetails error_details?;
};

# This object is an individual permission profile response.
public type PermissionProfileResponse record {
    # The ID of the permission profile.
    int id?;
    # The name of the permission profile. 
    # 
    # Example: `DocuSign Sender`
    string name?;
};

# A link to a useful URL.
public type LinkResponse record {
    # The kind of linked item.
    string rel?;
    # The URL of the linked item.
    string href?;
};

# A response containing information about users.
public type OrganizationUsersResponse record {
    # A list of users.
    OrganizationUserResponse[] users?;
    # Contains information about paging through the results.
    PagingResponseProperties paging?;
};

# 
public type UserProductPermissionProfilesResponse record {
    # 
    string user_id?;
    # Select users that are members of the specified account. At least one of `email`, `account_id` or `organization_reserved_domain_id` must be specified.
    string account_id?;
    # 
    ProductPermissionProfileResponse[] product_permission_profiles?;
};

# Methods for working with organizations.
public type Organization record {
};

# 
public type DSGroupAndUsersResponse record {
    # 
    DSGroupResponse group?;
    # 
    DSGroupUsersResponse group_users?;
};

# A response about reserved domains.
public type DomainsResponse record {
    # Information about reserved domains.
    DomainResponse[] reserved_domains?;
};

public type BulkUsersAddBody record {
    # CSV file.
    string 'file\.csv;
};

# Errors.
public type ErrorDetails record {
    # The code for the error.
    string 'error?;
    # A description of the error.
    string error_description?;
};

# 
public type DSGroupResponse record {
    # 
    string ds_group_id?;
    # Select users that are members of the specified account. At least one of `email`, `account_id` or `organization_reserved_domain_id` must be specified.
    string account_id?;
    # 
    string source_product_name?;
    # 
    string group_id?;
    # 
    string group_name?;
    # 
    string description?;
    # 
    boolean is_admin?;
    # 
    string last_modified_on?;
    # 
    int user_count?;
    # 
    int external_account_id?;
    # 
    string account_name?;
};

# Methods and objects to update account settings.
public type AccountSettingsImport record {
};

# 
public type OrganizationExportAccount record {
    # Select users that are members of the specified account. At least one of `email`, `account_id` or `organization_reserved_domain_id` must be specified.
    string account_id?;
};

# 
public type DSGroupUserResponse record {
    # 
    string user_id?;
    # Select users that are members of the specified account. At least one of `email`, `account_id` or `organization_reserved_domain_id` must be specified.
    string account_id?;
    # The full name of the user.
    string user_name?;
    # The user's first name.
    string first_name?;
    # The user's last name.
    string last_name?;
    # 
    string middle_name?;
    # Status.
    string status?;
    # Errors.
    ErrorDetails error_details?;
};

# 
public type OasirrOrganizationaccountsettingserrordataresponse record {
    # Select users that are members of the specified account. At least one of `email`, `account_id` or `organization_reserved_domain_id` must be specified.
    string account_id?;
    # 
    string account_name?;
    # The error number.
    string 'error?;
    # 
    string error_key?;
    # 
    string setting_key?;
};

# Information about a reserved domain.
public type DomainResponse record {
    # The ID of the reserved domain.
    string id?;
    # The status of the request. One of:
    # 
    # - `unknown`
    # - `pending`
    # - `active`
    # - `deactivated`
    # - `rejected`
    string status?;
    # The host name of the reserved domain.
    string host_name?;
    # A token  in form of text of the reserved domain.
    string txt_token?;
    # The identity provider ID of the reserved domain.
    string identity_provider_id?;
    # A list of settings for the reserved domain.
    SettingResponse[] settings?;
    # A list of useful links.
    LinkResponse[] links?;
};

# 
public type OrganizationImportResponse record {
    # 
    string id?;
    # 
    string 'type?;
    # 
    OrganizationImportResponseRequestor requestor?;
    # 
    string created?;
    # 
    string last_modified?;
    # Status.
    string status?;
    # 
    int user_count?;
    # 
    int processed_user_count?;
    # 
    int added_user_count?;
    # 
    int updated_user_count?;
    # 
    int closed_user_count?;
    # 
    int no_action_required_user_count?;
    # 
    int error_count?;
    # 
    int warning_count?;
    # 
    string invalid_column_headers?;
    # 
    string imports_not_found_or_not_available_for_accounts?;
    # 
    string imports_failed_for_accounts?;
    # 
    string imports_timed_out_for_accounts?;
    # 
    string imports_not_found_or_not_available_for_sites?;
    # 
    string imports_failed_for_sites?;
    # 
    string imports_timed_out_for_sites?;
    # 
    OrganizationImportResponseErrorRollup[] file_level_error_rollups?;
    # 
    OrganizationImportResponseErrorRollup[] user_level_error_rollups?;
    # 
    OrganizationImportResponseWarningRollup[] user_level_warning_rollups?;
    # 
    boolean has_csv_results?;
    # 
    string results_uri?;
};

# 
public type OrganizationAccountRequest record {
    # Select users that are members of the specified account. At least one of `email`, `account_id` or `organization_reserved_domain_id` must be specified.
    string account_id;
};

# 
public type OasirrErrordetails record {
    # The error number.
    string 'error?;
    # A longer description of the error.
    string error_description?;
};

# Methods to manage eSignature users in an account.
public type ESignUserManagement record {
};

# A key/value list of settings.
public type SettingResponse record {
    # The key of the setting.
    string 'key?;
    # The value of the setting.
    record {} value?;
    # The type of the setting. One of:
    # 
    # - `unknown`
    # - `guid`
    # - `text`
    # - `integer`
    # - `boolean`
    # - `datetime`
    # - `enumeration`
    string 'type?;
};

# Information about group membership.
public type MembershipResponse record {
    # The email address.
    string email?;
    # The ID of the account.
    string account_id?;
    # The external account ID.
    string external_account_id?;
    # The name of the account.
    string account_name?;
    # If **true**,
    # this is an external account.
    boolean is_external_account?;
    # The status of the user's membership.
    string status?;
    # This object is an individual permission profile response.
    PermissionProfileResponse permission_profile?;
    # The date the user's account was created.
    string created_on?;
    # A list of groups the user is a member of in this account,
    MemberGroupResponse[] groups?;
    # If **true**,
    # the user has administration 
    # privileges on the account.
    boolean is_admin?;
};

# 
public type DSGroupUsersResponse record {
    # The page number.
    int page?;
    # The number of items per page.
    int page_size?;
    # 
    int total_count?;
    # A list of users.
    DSGroupUserResponse[] users?;
};

# Contains information about paging through the results.
public type PagingResponseProperties record {
    # The number of items in a result set (page)
    int result_set_size?;
    # The index position of the first result in this set
    int result_set_start_position?;
    # The index position of the last result in this set
    int result_set_end_position?;
    # The total number of results
    int total_set_size?;
    # A URL to the next set of results
    string next?;
    # A URL to the previous set of results
    string previous?;
};

# 
public type OrganizationImportResponseRequestor record {
    # 
    string name?;
    # 
    string id?;
    # 
    string 'type?;
    # The email address.
    string email?;
};

# Information about a user.
public type UserDrilldownResponse record {
    # The user's unique ID.
    string id?;
    # The site ID of the organization.
    int site_id?;
    # The site name of the account.
    string site_name?;
    # The full name of the user.
    string user_name?;
    # The user's first name.
    string first_name?;
    # The user's last name.
    string last_name?;
    # The user's status. One of:
    # 
    # - `active`
    # - `created`
    # - `closed`
    string user_status?;
    # The ID of the user's default account.
    string default_account_id?;
    # The name of the user's default account.
    string default_account_name?;
    # The language and culture of the user.
    # 
    #   * Chinese Simplified: `zh_CN`
    #   * Chinese Traditional: `zh_TW`
    #   * Dutch: `nl`
    #   * English: `en`
    #   * French: `fr`
    #   * German: `de`
    #   * Italian: `it`
    #   * Japanese: `ja`
    #   * Korean: `ko`
    #   * Portuguese: `pt`
    #   * Portuguese Brazil: `pt_BR`
    #   * Russian: `ru`
    #   * Spanish: `es`
    string language_culture?;
    # Selected language
    string selected_languages?;
    # The user's federated status. One of:
    # 
    # - `RemoveStatus`
    # - `FedAuthRequired`
    # - `FedAuthBypass`
    # - `Evicted`
    string federated_status?;
    # If **true**, the user has organization administration privileges.
    boolean is_organization_admin?;
    # The date the user's account was created.
    string created_on?;
    # The last time the user logged in.
    string last_login?;
    # A list of organizations that have groups that the user is a member of.
    MembershipResponse[] memberships?;
    # A list of identities associated with the user.
    UserIdentityResponse[] identities?;
    # Device verification enabled
    boolean device_verification_enabled?;
};

public type ImportsAccountSettingsBody record {
    # CSV file.
    string 'file\.csv;
};

# 
public type OrganizationSalesforceAccountManagersResponse record {
    # Select users that are members of the specified account. At least one of `email`, `account_id` or `organization_reserved_domain_id` must be specified.
    string account_id?;
    # 
    string account_name?;
    # 
    string account_type?;
    # 
    OsamrContact account_owner?;
    # 
    OsamrContact account_manager?;
    # 
    OrganizationSalesforceAccountManagersResponse parent_account?;
};

# Methods for exporting a user list.
public type UserExport record {
};

# 
public type OrganizationAccountsRequest record {
    # 
    OrganizationAccountRequest[] accounts?;
};

# A group for a user to belong to.
public type GroupRequest record {
    # The ID of the group.
    int id;
    # The name of the group.
    string name?;
    # The type of group. One of:
    # 
    # - `invalid`
    # - `admin_group`
    # - `everyone_group`
    # - `custom_group`
    string 'type?;
};

# And individual change of email.
public type UpdateUserEmailRequest record {
    # The ID of the users whose email address you want to change.
    string id;
    # The site ID.
    int site_id;
    # The new email address.
    string email;
};

# 
public type ProductPermissionProfileResponse record {
    # 
    string product_id?;
    # 
    string product_name?;
    # 
    Permissionprofileresponse21[] permission_profiles?;
    # 
    string error_message?;
};

# User identity,
public type UserIdentityRequest record {
    # The ID of the identity.
    string id?;
};

# Request to delete a user's identities,
public type DeleteUserIdentityRequest record {
    # A list of identities.
    UserIdentityRequest[] identities;
};

# 
public type OrganizationExportDomain record {
    # 
    string domain?;
};

# 
public type AddDSGroupAndUsersResponse record {
    # 
    DSGroupResponse group?;
    # 
    AddDSGroupUsersResponse group_users?;
};

public type BulkUsersAddBody1 record {
    # CSV file.
    string 'file\.csv;
};

# A response.
public type UpdateResponse record {
    # The status of the request.
    string status?;
};

# 
public type DSGroupRequest record {
    # 
    string ds_group_id;
};

# 
public type OrganizationImportResponseWarningRollup record {
    # 
    string warning_type?;
    # 
    int count?;
};

# 
public type OrganizationImportsResponse record {
    # 
    OrganizationImportResponse[] imports?;
};

# 
public type OrgReportRequest record {
    # 
    string report_type?;
    # 
    string report_date_range?;
    # 
    string[] account_ids?;
    # 
    string custom_start_date?;
    # 
    string custom_end_date?;
};

# A new user request.
public type NewAccountUserRequest record {
    # A permission profile.
    PermissionProfileRequest permission_profile?;
    # The new user's requested groups.
    GroupRequest[] groups?;
    # The full name of the user.
    string user_name?;
    # The user's first name.
    string first_name?;
    # The user's last name.
    string last_name?;
    # The email address of the user.
    string email;
    # The account ID of the user's default account.
    string default_account_id?;
    # The language and culture of the user.
    # 
    #   * Chinese Simplified: `zh_CN`
    #   * Chinese Traditional: `zh_TW`
    #   * Dutch: `nl`
    #   * English: `en`
    #   * French: `fr`
    #   * German: `de`
    #   * Italian: `it`
    #   * Japanese: `ja`
    #   * Korean: `ko`
    #   * Portuguese: `pt`
    #   * Portuguese Brazil: `pt_BR`
    #   * Russian: `ru`
    #   * Spanish: `es`
    string language_culture?;
    # Selected languages
    string selected_languages?;
    # The access code that the user needs to activate an account.
    string access_code?;
    # The user's federated status. One of:
    # 
    # - `RemoveStatus`
    # - `FedAuthRequired`
    # - `FedAuthBypass`
    # - `Evicted`
    string federated_status?;
    # If **true**, the user's account is activated automatically.
    boolean auto_activate_memberships?;
};

# A response about member groups. It contains the groups and paging information.
public type MemberGroupsResponse record {
    # A list of the responses.
    MemberGroupResponse[] groups?;
    # Contains information about paging through the results.
    PagingResponseProperties paging?;
};

# Information about a single identity provider.
public type IdentityProviderResponse record {
    # The unique ID of the identity provider.
    string id?;
    # The human-readable name of the identity provider.
    string friendly_name?;
    # If **true**, users who use this identity provider are automatically provisioned. 
    boolean auto_provision_users?;
    # The type of the identity provider. One of:
    # 
    # - `none`
    # - `saml_20`
    # - `saml_11`
    # - `saml_10`
    # - `ws_federation`
    # - `open_id_connect`
    string 'type?;
    # Information about a SAML 2.0 identity provider.
    Saml2IdentityProviderResponse saml_20?;
    # A list of useful URLs.
    LinkResponse[] links?;
};

# A single attribute mapping response.
public type RequiredAttributeMappingResponse record {
    # The unique ID of the attribute.
    int required_attribute_id?;
    # The name of the attribute.
    string required_attribute_name?;
    # The human-readable name of the attribute.
    string required_attribute_friendly_name?;
    # The name of the substitute attribute.
    string substitute_attribute_name?;
};

# A request to update group membership.
public type UpdateMembershipRequest record {
    # The user's unique ID.
    string account_id;
    # A permission profile.
    PermissionProfileRequest permission_profile?;
    # The user's requested groups.
    GroupRequest[] groups?;
    # The user's company name.
    string company_name?;
    # The user's job title.
    string job_title?;
    # If **true**, send an activation request after the update.
    boolean send_activation?;
    # The access code that the user needs to activate an account.
    string access_code?;
};

# The results of changing a user's information.
public type UsersUpdateResponse record {
    # If **true**, the request to change user information succeeded.
    boolean success?;
    # A list of users whose email addresses have been updated.
    UserUpdateResponse[] users?;
};

# Results of deleting identities.
public type DeleteResponse record {
    # If **true**, the request succeeded.
    boolean success?;
    # A list of identities to delete.
    UserIdentityResponse[] identities?;
};

# Information about an individual organization.
public type OrganizationResponse record {
    # The ID of the organization.
    string id?;
    # The name of the organization.
    string name?;
    # A description of the organization.
    string description?;
    # The default account ID of the organization.
    string default_account_id?;
    # The default permission profile ID of the organization.
    int default_permission_profile_id?;
    # The date the organization's account was created.
    string created_on?;
    # The user who created the organization account.
    string created_by?;
    # The date the organization's account was last updated.
    string last_modified_on?;
    # The user who last updated the organization's account.
    string last_modified_by?;
    # A list of organization accounts.
    OrganizationAccountResponse[] accounts?;
    # A list of the organization accounts users.
    OrganizationSimpleIdObject[] users?;
    # A list of reserved domains for the organization.
    DomainResponse[] reserved_domains?;
    # A list of identity providers for the organization.
    IdentityProvidersResponse[] identity_providers?;
    # A list of links for the organization.
    LinkResponse[] links?;
};

# 
public type OrganizationAccountSettingsImportRequestorResponse record {
    # 
    string id?;
    # 
    string 'type?;
    # 
    string name?;
    # The email address.
    string email?;
};

# And individual group responses,.
public type MemberGroupResponse record {
    # The unique ID of the group.
    int id?;
    # The name of the group.
    string name?;
    # The type of group. One of:
    # 
    # - `invalid`
    # - `admin_group`
    # - `everyone_group`
    # - `custom_group`
    string 'type?;
};

# Request to change a user's information.
public type UpdateUserRequest record {
    # The user's unique ID.
    string id;
    # The site ID.
    int site_id;
    # The full name of the user.
    string user_name?;
    # The user's first name.
    string first_name?;
    # The user's last name.
    string last_name?;
    # The email address.
    string email?;
    # The account ID of the user's default account.
    string default_account_id?;
    # The language and culture of the user.
    # 
    #   * Chinese Simplified: `zh_CN`
    #   * Chinese Traditional: `zh_TW`
    #   * Dutch: `nl`
    #   * English: `en`
    #   * French: `fr`
    #   * German: `de`
    #   * Italian: `it`
    #   * Japanese: `ja`
    #   * Korean: `ko`
    #   * Portuguese: `pt`
    #   * Portuguese Brazil: `pt_BR`
    #   * Russian: `ru`
    #   * Spanish: `es`
    string language_culture?;
    # Selected languages
    string selected_languages?;
    # The user's federated status. One of:
    # 
    # - `RemoveStatus`
    # - `FedAuthRequired`
    # - `FedAuthBypass`
    # - `Evicted`
    string federated_status?;
    # If **true**, the user will be required to change the account password.
    boolean force_password_change?;
    # A list of group membership requests.
    UpdateMembershipRequest[] memberships?;
    # Device verification enabled
    boolean device_verification_enabled?;
};

# 
public type ProductPermissionProfilesResponse record {
    # 
    ProductPermissionProfileResponse[] product_permission_profiles?;
};

# 
public type OrganizationExportsResponse record {
    # 
    OrganizationExportResponse[] exports?;
};

# 
public type OrgReportConfigurationResponse record {
    # 
    boolean is_account_limit_disabled?;
    # 
    boolean custom_dates_enabled?;
    # 
    int[] enabled_report_types?;
};

# 
public type DSGroupListResponse record {
    # The page number.
    int page?;
    # The number of items per page.
    int page_size?;
    # 
    int total_count?;
    # Select users that are members of the specified account. At least one of `email`, `account_id` or `organization_reserved_domain_id` must be specified.
    string account_id?;
    # 
    DSGroupResponse[] ds_groups?;
};

# 
public type OrganizationExportResponse record {
    # 
    string id?;
    # 
    string 'type?;
    # 
    OrganizationExportRequestorResponse requestor?;
    # 
    string created?;
    # 
    string last_modified?;
    # 
    string completed?;
    # 
    string expires?;
    # Status.
    string status?;
    # 
    OrgExportSelectedAccount[] selected_accounts?;
    # 
    OrgExportSelectedDomain[] selected_domains?;
    # 
    string metadata_url?;
    # 
    int percent_completed?;
    # 
    int number_rows?;
    # 
    int size_bytes?;
    # 
    OrganizationExportTaskResponse[] results?;
    # 
    boolean success?;
};

# 
public type OsamrContact record {
    # 
    string name?;
    # The email address.
    string email?;
    # 
    string title?;
};

public type BulkUsersUpdateBody record {
    # CSV file.
    string 'file\.csv;
};

# 
public type DeleteMembershipRequest record {
    # The ID of a user's account you want to close.
    string id;
};

# 
public type OrgreportlistresponseOrgreport record {
    # 
    boolean complete?;
    # 
    string report_correlation_id?;
    # 
    int site_id?;
    # 
    string report_id?;
    # 
    OrgreportlistresponseRequestor requestor?;
    # 
    string created_on?;
    # 
    int account_export_count?;
    # 
    string url?;
    # 
    string report_type_id?;
    # 
    string report_date_range?;
    # 
    string custom_start_date?;
    # 
    string custom_end_date?;
};

# Methods to get a list of identity providers.
public type IdentityProviders record {
};

# 
public type IdentityProvidersResponse record {
    # 
    IdentityProviderResponse[] identity_providers?;
};

# 
public type OrgreportlistresponseRequestor record {
    # 
    string id?;
    # 
    string name?;
};

# 
public type AddUserResponseAccountProperties record {
    # 
    string id?;
    # 
    int site_id?;
    # 
    ProductPermissionProfileResponse[] product_permission_profiles?;
    # 
    DSGroupResponse[] ds_groups?;
    # The user's company name.
    string company_name?;
    # The user's job title.
    string job_title?;
};

# Data to ctivate user memership
public type ForceActivateMembershipRequest record {
    # Site ID
    int site_id;
};

# 
public type DSGroupUsersRemoveRequest record {
    # 
    string[] user_ids;
};

public type BulkUsersUpdateBody1 record {
    # CSV file.
    string 'file\.csv;
};

# Information about an account.
public type OrganizationAccountResponse record {
    # The unique ID of the  account.
    string id?;
    # The name of the account.
    string name?;
    # The external account ID.
    int external_account_id?;
    # The site ID.
    int site_id?;
};

# 
public type Permissionprofileresponse21 record {
    # 
    string permission_profile_id?;
    # 
    string permission_profile_name?;
};

# 
public type OrgReportCreateResponse record {
    # 
    string report_correlation_id?;
};

# 
public type OrgExportSelectedAccount record {
    # Select users that are members of the specified account. At least one of `email`, `account_id` or `organization_reserved_domain_id` must be specified.
    string account_id?;
};

# Methods to get a list of reserved domains.
public type ReservedDomains record {
};

# Multi product user data
public type NewMultiProductUserAddRequest record {
    # Product permission profiles
    ProductPermissionProfileRequest[] product_permission_profiles;
    # DS groups
    DSGroupRequest[] ds_groups?;
    # The full name of the user.
    string user_name?;
    # The user's first name.
    string first_name?;
    # The user's last name.
    string last_name?;
    # The email address.
    string email;
    # Default account ID
    string default_account_id?;
    # The language and culture of the user.
    # 
    #   * Chinese Simplified: `zh_CN`
    #   * Chinese Traditional: `zh_TW`
    #   * Dutch: `nl`
    #   * English: `en`
    #   * French: `fr`
    #   * German: `de`
    #   * Italian: `it`
    #   * Japanese: `ja`
    #   * Korean: `ko`
    #   * Portuguese: `pt`
    #   * Portuguese Brazil: `pt_BR`
    #   * Russian: `ru`
    #   * Spanish: `es`
    string language_culture?;
    # The access code that the user needs to activate an account.
    string access_code?;
    # The user's federated status. One of:
    # 
    # - `RemoveStatus`
    # - `FedAuthRequired`
    # - `FedAuthBypass`
    # - `Evicted`
    string federated_status?;
    # If **true**, the user's account is activated automatically.
    boolean auto_activate_memberships?;
};

# Information about a single certificate.
public type CertificateResponse record {
    # The unique ID of the certificate.
    string id?;
    # The certificate issuer.
    string issuer?;
    # The thumbprint of the certificate.
    string thumbprint?;
    # The date when the certificate expires.
    string expiration_date?;
    # If **true**, the certificate is valid.
    boolean is_valid?;
    # A list of useful links.
    LinkResponse[] links?;
};

# 
public type OrganizationExportRequestorResponse record {
    # 
    string name?;
    # 
    string id?;
    # 
    string 'type?;
    # The email address.
    string email?;
};

# 
public type OetrErrordetails record {
    # The error number.
    string 'error?;
    # A longer description of the error.
    string error_description?;
};

# 
public type OrganizationImportResponseErrorRollup record {
    # 
    string error_type?;
    # 
    int count?;
};

# 
public type OrganizationAccountSettingsImportResponse record {
    # 
    string created?;
    # 
    string last_modified?;
    # 
    string completed?;
    # 
    string expires?;
    # 
    int percent_completed?;
    # 
    int number_processed_accounts?;
    # 
    int number_unprocessed_accounts?;
    # 
    OrganizationAccountSettingsImportResultResponse[] results?;
    # 
    boolean success?;
    # 
    record {} skipped_settings_by_account?;
    # 
    string id?;
    # 
    string organization_id?;
    # Status.
    string status?;
    # 
    string 'type?;
    # 
    OrganizationAccountSettingsImportRequestorResponse requestor?;
};

# Information about a user.
public type OrganizationUserResponse record {
    # The user's unique ID.
    string id?;
    # The full name of the user.
    string user_name?;
    # The user's first name.
    string first_name?;
    # The user's last name.
    string last_name?;
    # The user's status. One of:
    # 
    # - `active`
    # - `created`
    # - `closed`
    string user_status?;
    # The user's membership status. One of:
    # 
    # - `activation_required`
    # - `activation_sent`
    # - `active`
    # - `closed`
    # - `disabled`
    string membership_status?;
    # The email address.
    string email?;
    # The date the user's account was created.
    string created_on?;
    # The date on which the user became a member of the organization.
    string membership_created_on?;
    # DS group response
    DSGroupResponse[] ds_groups?;
    # Membership ID
    string membership_id?;
};

# DG Group user data
public type DSGroupUsersAddRequest record {
    # User IDs
    string[] user_ids;
};

# 
public type OrgReportListResponse record {
    # 
    OrgreportlistresponseOrgreport[] reports?;
};

# A permission profile.
public type PermissionProfileRequest record {
    # The ID of the permission profile.
    int id;
    # The name of the permission profile.
    string name?;
};

# 
public type RemoveDSGroupUsersResponse record {
    # 
    boolean is_success?;
    # 
    DSGroupUserResponse[] failed_users?;
};

# 
public type OrgExportSelectedDomain record {
    # 
    string domain?;
};
