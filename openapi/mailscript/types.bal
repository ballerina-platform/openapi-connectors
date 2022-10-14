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

public type AddWorkspaceRequest record {
    string workspace;
};

public type AddActionReplyRequest record {
    AddactionreplyrequestConfig config;
    string name;
    string 'type;
};

public type Address record {
    string createdAt;
    string createdBy;
    string displayName?;
    string id;
    string owner;
};

public type AddActionForwardRequest record {
    AddactionforwardrequestConfig config;
    string name;
    string 'type;
};

public type VerificationVerifyBody VerifyEmailRequest|VerifySmsRequest;

public type AddActionCombineRequest record {
    string[] list;
    string name;
};

public type AddActionWebhookRequest record {
    AddactionwebhookrequestConfig config;
    string name;
    string 'type;
};

public type UpdateKeyRequest record {
    string name;
    boolean read;
    boolean write;
};

public type AddActionResponse record {
    string id;
};

public type DomainresponseRecords record {
    string name;
    string 'type;
    string value;
};

public type Trigger record {
    string createdAt;
    string createdBy;
    Criteria criteria;
    string displayName?;
    string id;
    string name;
    string owner;
};

public type SetWorkflowRequest record {
    string id?;
    (KeyValuePair)[] pairs?;
};

public type AddWorkflowRequest record {
    string action;
    boolean active?;
    string input;
    string name;
    string trigger?;
};

public type VerificationsBody AddEmailVerificationRequest|AddSmsVerificationRequest;

public type KeyValuePair record {
    string 'key;
    string value;
};

public type GetAllActionsResponse record {
    (ActionSend|ActionCombine)[] list;
};

public type VerificationEmail record {
    string email?;
    string id?;
    string 'type?;
    boolean verified?;
    string verifiedAt?;
    string verifiedBy?;
};

public type AddactionreplyrequestConfig record {
    string 'from;
    string html?;
    string 'key;
    string text?;
    string 'type;
};

public type Workflow record {
    string action;
    boolean active?;
    string createdAt;
    string createdBy;
    string id;
    string input;
    string name;
    string owner;
    string trigger;
};

public type AddAddressRequest record {
    string address;
};

public type GetAllWorkspacesResponse record {
    (Workspace)[] list;
};

public type AddactionwebhookrequestConfigOpts record {
    record {} headers;
    string method;
};

public type AddEmailVerificationRequest record {
    string email;
    string 'type;
};

public type AddTriggerRequest record {
    Criteria|CriteriaOperand criteria;
    string name;
};

public type AddKeyResponse record {
    string id?;
};

public type AddTriggerResponse record {
    string id;
};

public type MailscriptEmailInput record {
    string address;
    string createdAt;
    string createdBy;
    string id;
    string name;
    string owner;
    string 'type;
};

public type GetAllVerificationsResponse record {
    (VerificationEmail|VerificationSms)[] list;
};

public type UpdateUserRequest record {
    string displayName;
};

public type Key record {
    string createdAt;
    string createdBy;
    string id;
    string name;
    boolean read;
    boolean write;
};

public type AddactionreplyallrequestConfig record {
    string 'from;
    string html?;
    string 'key;
    string text?;
    string 'type;
};

public type AddactionsmsrequestConfig record {
    string number;
    string text;
};

public type SendRequest record {
    string 'from;
    string html?;
    string subject;
    string text?;
    string to;
};

public type User record {
    string createdAt;
    string displayName;
    string email;
    string id;
    string photoURL?;
};

public type AddactionwebhookrequestConfig record {
    string body;
    AddactionwebhookrequestConfigOpts opts;
    string url;
};

public type GetAllAddressesResponse record {
    (Address)[] list;
};

public type InlineResponse200 record {
    string token;
};

public type AddActionSmsRequest record {
    AddactionsmsrequestConfig config;
    string name;
    string 'type;
};

public type Criteria record {
    string domain?;
    string 'from?;
    boolean hasAttachments?;
    string hasTheWords?;
    string sentTo?;
    string subjectContains?;
};

public type ActionSend record {
    ActionsendConfig config;
    string createdAt;
    string createdBy;
    string id;
    string name;
    string output;
    string owner;
};

public type ActionsBody AddActionCombineRequest|AddActionSmsRequest|AddActionWebhookRequest|AddActionDaemonRequest|AddActionSendRequest|AddActionForwardRequest|AddActionForwardRequest|AddActionReplyRequest|AddActionReplyAllRequest|AddActionAliasRequest;

public type CheckDomainVerify record {
    string domain;
    boolean success;
};

public type ActionsActionBody AddActionCombineRequest|AddActionSmsRequest|AddActionWebhookRequest|AddActionDaemonRequest|AddActionSendRequest|AddActionForwardRequest|AddActionForwardRequest|AddActionReplyRequest|AddActionReplyAllRequest|AddActionAliasRequest;

public type AddactionsendrequestConfig record {
    string 'from;
    string html?;
    string 'key;
    string subject;
    string text?;
    string to?;
    string 'type?;
};

public type GetAllWorkflowsResponse record {
    (Workflow)[] list;
};

public type DomainResponse record {
    string domain;
    DomainresponseRecords[] records;
};

public type AddactionforwardrequestConfig record {
    string forward;
    string 'from;
    string 'key;
    string 'type;
};

public type AddActionReplyAllRequest record {
    AddactionreplyallrequestConfig config;
    string name;
    string 'type;
};

public type VerificationSms record {
    string id?;
    string sms?;
    string 'type?;
    boolean verified?;
    string verifiedAt?;
    string verifiedBy?;
};

public type Integration record {
    string createdAt;
    string id;
    string 'type;
};

public type GetAllInputsResponse record {
    (MailscriptEmailInput)[] list;
};

public type CriteriaOperand record {
    string[] and?;
    string[] or?;
};

public type AddActionSendRequest record {
    AddactionsendrequestConfig config;
    string name;
    string 'type;
};

public type AddKeyRequest record {
    string name;
    boolean read;
    boolean write;
};

public type GetAllDomainsResponse record {
    string[] id?;
};

public type GetAllIntegrationsResponse record {
    (Integration)[] list;
};

public type GetAllKeysResponse record {
    (Key)[] list;
};

public type AddActionAliasRequest record {
    AddactionaliasrequestConfig config;
    string name;
    string 'type;
};

public type AddDomainRequest record {
    string domain;
};

public type AddVerificationResponse record {
    string id;
};

public type ErrorResponse record {
    string 'error;
};

public type GetAllTriggersResponse record {
    (Trigger)[] list;
};

public type AddActionDaemonRequest record {
    AddactiondaemonrequestConfig config;
    string name;
    string 'type;
};

public type AddactionaliasrequestConfig record {
    string alias?;
    string 'type?;
};

public type ActionCombine record {
    string createdAt;
    string createdBy;
    string id;
    string[] list?;
    string name;
    string owner;
};

public type AddactiondaemonrequestConfig record {
    string body;
    string daemon?;
};

public type AddSmsVerificationRequest record {
    string sms;
    string 'type;
};

public type VerifySmsRequest record {
    string code;
    string sms;
};

public type ActionsendConfig record {
    string html?;
    string subject;
    string text?;
    string 'type;
};

public type VerifyEmailRequest record {
    string code;
    string email;
};

public type Workspace record {
    string createdAt;
    string createdBy;
    string id;
    string owner;
};
