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

public type GETPaymentRunResponse record {
    # Whether the operation is successful.
    boolean success?;
    # The ID of the payment run in Advanced Payment Manager.
    int id?;
    # The status of the payment run.
    string status?;
    # The target date of the payment run, in the format of YYYY-MM-DD.
    string target_date?;
    # The filter that is used for the payment run.
    string filter?;
    # The ID of the payment run schedule. If this is not a scheduled payment run, the value is **Adhoc**.
    string payment_run_schedule_id?;
    # Invoices that are held by the payment run for manual processing.
    record {} invoices_held?;
    # Metrics of the payment runs after completion.
    record {} metrics?;
    # Errors that occur in the operation. Available only when **success** is **false**.
    anydata[] errors?;
};

# The pagination information.
public type ResultsPagination record {
    # The current page.
    int page?;
    # The number of result on each page.
    int page_length?;
    # The link to the next page of results.
    string next_page?;
};

public type GetstatementsettingsresponseTemplates record {
    # The name of the template.
    string name?;
};

public type POSTPaymentRunResponse record {
    # The ID of the payment run in Advanced Payment Manager.
    int id?;
    # Whether the operation is successful.
    boolean success?;
    # Errors that occur in the operation. Available only when **success** is **false**.
    string[] errors?;
};

public type GETActiveDebitMemoCycleResponse record {
    # An array containing information of all active retry cycles for a debit memo. See the schema and example for details.
    GETDebitMemoCycleElementResponse[] cycles?;
};

public type NotesobjectwithcommentData record {
    # The ID of the Notes object.
    int id?;
    # The type of the object. It can be "Accounts" or "Invoices" for Collections Window.
    string 'object?;
    # The ID of the notes object. It is an account number (32-digit hex) for Accounts object type, and an invoice number for Invoices object type.
    string notesId?;
    # The ID of the parent object. For "Accounts" object, this parameter is the account name that the Notes object is created for.
    string notesParentId?;
    # The time and date when this Notes object is created.
    string createdAt?;
    # The last time and date when the Notes object is updated.
    string updatedAt?;
    # The array of comments for this Notes object.
    NotesComment[] comments?;
};

public type GETInvoiceCycleElementResponse record {
    # The ID of the customer account.
    string account_id?;
    # The ID of the invoice.
    string invoice_id?;
    # The ID of the payment method.
    string payment_method_id?;
    # The type of the currency used.
    string currency?;
    # The status of the retry cycle.
    string status?;
    # The number of the current retry attempt.
    decimal current_attempt_number?;
    # The date and time of the next retry attempt, in `yyyy-mm-dd hh:mm:ss` format.
    string next_attempt?;
    # The name of the customer group.
    string customer_group?;
    # An array containing information of the retry attempts that have been made. See the schema and example for details.
    GETCycleElementAttemptResponse[] attempts?;
};

public type CollectionsInfo record {
    # The number of accounts that are in collections.
    int accounts_in_collections?;
    # The home currency of the tenant.
    string home_currency?;
    # The total debt of all accounts that are in collections.
    decimal total_debt?;
    # The five largest debts that are in collections.
    string[] largest_debts?;
    # The five oldest debts that are in collections.
    string[] oldest_debts?;
    CollectionsinfoStatuses statuses?;
};

public type NotesReply record {
    # The ID of the reply.
    int id?;
    # The body of the reply.
    string body?;
    # The link to the image file. The value is null if no image files are available.
    string image?;
    # The link to the attachment. The value is null if no attachments are available.
    string attachment?;
    # The time and date when the reply is created.
    string createdAt?;
    # The last time and date when the reply is updated.
    string updatedAt?;
    NotesUser user?;
};

public type GETAccountCycleElementResponse record {
    # The ID of the customer account.
    string account_id?;
    # The ID of the invoice.
    string invoice_id?;
    # The ID of the debit memo.
    string debit_memo_id?;
    # The ID of the payment method.
    string payment_method_id?;
    # The type of the currency used.
    string currency?;
    # The status of the retry cycle.
    string status?;
    # The number of the current retry attempt.
    decimal current_attempt_number?;
    # The date and time of the next retry attempt, in `yyyy-mm-dd hh:mm:ss` format.
    string next_attempt?;
    # The name of the customer group.
    string customer_group?;
    # An array containing information of the retry attempts that have been made. See the schema and example for details.
    GETCycleElementAttemptResponse[] attempts?;
};

public type GETBaselineMetricsResponse record {
    # The percentage of successful payment attempts for all customer groups on this Configurable Payment Retry instance so far.
    # 
    # Retry Success Rate = Number of successful retry payment attempts / Total number of retry payments attempted
    # 
    # Payment attempts here are any payment attempts executed by Configurable Payment Retry, excluding the initial payment run.
    decimal retry_success_rate?;
    # The trend of change in Retry Success Rate over the last 30 days.
    string retry_success_rate_trend?;
    # The percentage of billing documents that are successfully collected, for all customer groups on this Configurable Payment Retry instance so far.
    # 
    # Document Success Rate = Number of billing documents collected / Total number of billing documents attempted
    # 
    # Billing documents collected are any invoices and debit memos that were paid through the payment attempt initiated by Configurable Payment Retry.
    decimal document_success_rate?;
    # The trend of change in Document Success Rate over the last 30 days.
    string document_success_rate_trend?;
    # The average number of days invoices and debit memos are unpaid before collection, for all customer groups on this Configurable Payment Retry instance so far.
    decimal average_days_outstanding?;
    # The trend of change in Average Days Outstanding over the last 30 days.
    string average_days_outstanding_trend?;
    # Indicates whether the metrics are retrieved successfully.
    # 
    # If no data is loaded yet, a 200 response code will be returned with the success field set to `true`. All expected fields will be present but the value will be `null`.
    boolean success?;
};

public type NotesTasks record {
    # The ID of the task.
    int id?;
    # The title of the task.
    string task?;
    # Additional details about the task.
    string description?;
    # The due date and time of the task.
    string dueDate?;
    # The date and time when this task is created.
    string createdAt?;
    # The last date and time when the task is updated.
    string updatedAt?;
    # The data and time when a reminder about this task needs to be sent.
    string reminderDate?;
    # The message to be sent as notifications. It can be null if no message is defined.
    string notifications?;
    # The status of the task.
    string status?;
    # The comment about the task.
    string comment?;
    # The automatic escalation setting for the task.
    string autoEscalation?;
    NotesUser createdBy?;
    NotesUser assignTo?;
};

public type DELETEPaymentRunScheduleResponse record {
    # Whether the operation is successful.
    boolean success?;
    # Errors that occur in the operation. Available only when **success** is **false**.
    string[] errors?;
};

public type NotesGroup record {
    # The ID of the Notes group.
    int id?;
    # The name of the group.
    string name?;
    # Additional information about the group.
    string description?;
    # The date and time when the group was created.
    string created_at?;
    # The last date and time when the group was updated.
    string updated_at?;
    # A list of all users in the group.
    NotesUser[] users?;
};

public type PUTPaymentRunSchedule record {
    # The frequency of payment runs in the schedule.
    string frequency?;
    # The day of a month when payment runs need to be performed. Required only if **frequency** is **Monthly**. Allowed values are 1-31 or **L** (the last day of a month).
    string day?;
    # An array of days in a week when payment runs need to be performed. Required only if **frequency** is **Weekly**. Allowed integers are 1-7. 1 stands for Monday. 2 stands for Tuesday, etc.
    int[] day_of_week?;
    # The hour of a day when payment runs need to be performed. Allowed values are 1-23.
    int hour?;
    # A bill run name that is used to determine what receivables should be included in payment runs in this schedule. Valid only if the custom filter is not used.
    string billrun?;
    # A batch name that is used to determine what receivables should be included in payment runs in this schedule. Valid only if the custom filter is not used.
    string batch?;
    # A three-character currency code that is used to determine what receivables should be included in payment runs in this schedule. Valid only if the custom filter is not used.   
    string currency?;
    # A payment gateway name that is used to determine what receivables should be included in payment runs in this schedule. Valid only if the custom filter is not used.
    string payment_gateway?;
    # A bill cycle day value that is used to determine what receivables should be included in payment runs in this schedule. Valid only if the custom filter is not used.
    string bill_cycle_day?;
    # A custom ZOQL query that is used to determine what receivables should be included in payment runs in this schedule. It cannot be used with other filters.
    string custom?;
};

# Information about the next retry attempt.
public type GetcycleelementattemptresponseRetryInfo record {
    # The date and time of the next retry attempt as determined by `criteria`, in `yyyy-mm-dd hh:mm:ss` format.
    string next?;
    # The criteria defined in the retry configuration in the CPR UI, to specify whether the next retry will occur in an incremental time or at a specific time or day.
    string criteria?;
};

public type POSTAdhocStatementRunResponse record {
    # Whether the operation is successful.
    boolean success?;
    # The response code.
    int code?;
    # The response message.
    string message?;
    # The number of the statement.
    string statement_number?;
};

public type GETAccountCycleHistoryResponse record {
    # An array containing information of all completed retry cycles for an account. See the example for details.
    GETAccountCycleElementResponse[] cycles?;
};

public type CustomerGroups record {
    int id?;
    string name?;
    string smart_retry?;
    string document_success_rate?;
    string document_success_rate_trend?;
    string retry_success_rate?;
    string average_attempts?;
};

public type NotesUser record {
    # The ID of the Notes user.
    int id?;
    # The user name.
    string username?;
    # The connect ID of the user. It must be a 32-digit hex number.
    string connectIdentity?;
    # The email address of the user.
    string email?;
    # The first name.
    string firstName?;
    # The last name.
    string lastName?;
    # The full name of the user.
    string fullName?;
    # The Platform role of the user.
    string platformRole?;
    # The time zone setting for the user.
    string timeZone?;
    # The time and date when this user record is created.
    string createdAt?;
    # The last time and date when the user record is updated.
    string updatedAt?;
    # The full name of the user that is configured to handle escalations for the current user.
    string escalationUser?;
    # The ID of the escalation user. It must be a 32-digit hex number.
    string escalationUserId?;
    # The amount of money that this user is allowed to approve.
    decimal approvalAmount?;
    # The link to the avatar image file for the user.
    string avatar?;
};

public type GETActiveAccountCycleResponse record {
    # An array containing information of all active retry cycles for an account. See the schema and example for details.
    GETAccountCycleElementResponse[] cycles?;
};

public type NotesGroupsResponse record {
    # Whether this operation is successful.
    boolean success?;
    NotesGroup[] groups?;
};

public type NotesobjectData record {
    # The ID of the Notes object.
    int id?;
    # The type of the object. It can be "Accounts" or "Invoices" for Collections Window.
    string 'object?;
    # The ID of the Notes object. It is an account number (32-digit hex) for Accounts object type, and an invoice number for Invoices object type.
    string notesId?;
    # The ID of the parent object. For "Accounts" object, this parameter is the account name that the Notes object is created for.
    string notesParentId?;
    # The time and date when this Notes object is created.
    string createdAt?;
    # The last time and date when the Notes object is updated.
    string updatedAt?;
};

public type POSTPaymentRun record {
    # The target date of the payment run to be created, in the format of YYYY-MM-DD.
    string target_date?;
    # A bill run name that is used to determine what receivables should be included in the payment run. Valid only if the custom filter is not used.
    string billrun?;
    # A batch name that is used to determine what receivables should be included in the payment run. Valid only if the custom filter is not used.
    string batch?;
    # A three-character currency code that is used to determine what receivables should be included in the payment run. Valid only if the custom filter is not used.   
    string currency?;
    # A payment gateway name that is used to determine what receivables should be included in the payment run. Valid only if the custom filter is not used.
    string payment_gateway?;
    # A bill cycle day value that is used to determine what receivables should be included in the payment run. Valid only if the custom filter is not used.
    string bill_cycle_day?;
    # A custom ZOQL query that is used to determine what receivables should be included in the payment run. It cannot be used with other filters.
    string custom?;
};

public type GETPaymentRunScheduleResponse record {
    # Whether the operation is successful.
    boolean success?;
    # The ID of the payment run schedule in Advanced Payment Manager.
    int id?;
    # The status of the payment run schedule.
    string status?;
    # The filter that is defined in the payment run schedule.
    string filter?;
    # The schedule that is defined for this payment run schedule.
    string schedule?;
    # Errors that occur in the operation. Available only when **success** is **false**.
    anydata[] errors?;
};

public type GETCycleElementAttemptResponse record {
    # The number of the retry attempt.
    decimal attempt_number?;
    # The ID of the payment in Zuora Payments.
    string zuora_payment_id?;
    # The date and time when the retry attempt was made, in `yyyy-mm-dd hh:mm:ss` format.
    string time_of_execution?;
    # The number of the failed payment run.
    string 'source?;
    # Indicates whether the first retry attempt was generated by Configurable Payment Retry. 
    # 
    # `true` for the cases of the first retry attempt generated by CPR and the second or later attempt.
    # 
    # `false` for the cases that the retry attempt was made by the payment run or an external source during retry cycles.
    boolean cpr_generated?;
    # Indicates whether the retry attempt is successful.
    boolean success?;
    # The amount collected in this retry attempt.
    decimal amount_collected?;
    # Information about the action of the retry attempt.
    GetcycleelementattemptresponseActionInfo action_info?;
    # Information about the next retry attempt.
    GetcycleelementattemptresponseRetryInfo retry_info?;
    # Information about the response code mapping for the retry attempt.
    GetcycleelementattemptresponseMappingInfo mapping_info?;
    # Information about the payment gateway.
    GetcycleelementattemptresponseGatewayInfo gateway_info?;
};

public type GETActiveInvoiceCycleResponse record {
    # An array containing information of all active retry cycles for an invoice. See the schema and example for details.
    GETInvoiceCycleElementResponse[] cycles?;
};

public type GETCollectionAccountsResponse record {
    # The array of accounts.
    CollectionAccount[] accounts?;
    # The pagination information.
    ResultsPagination pagination?;
};

public type GETStatementsResponse record {
    # An array containing the requested number of statements of the specified account. Every object contains an Amazon S3 link. You can click the links to view and download the statements. The links will expire in 10 minutes.
    record {}[] statements?;
    # Whether the operation is successful.
    boolean success?;
    # The number of statements retrieved.
    int count?;
};

public type NotesTasksResponse record {
    # Whether this operation is successful.
    boolean success?;
    # The actual tasks data.
    NotestasksresponseData data?;
    NotestasksresponsePagination pagination?;
};

public type GETStatementSettingsResponse record {
    # Whether the operation is successful.
    boolean success?;
    # An array containing all available templates.
    GetstatementsettingsresponseTemplates[] templates?;
    # Whether Invoice Settlement is enabled on the tenant.
    boolean advanced_ar?;
    # The name of the default template.
    string default_template?;
    # The statement cycle being used.
    string default_cycle?;
};

public type NotesUpdateGroupBody record {
    # The new name of the group.
    string name?;
    # The new description about the group.
    string description?;
};

public type InlineResponse2008 record {
    # Indicates whether the operation is successful.
    boolean success?;
    # The response message.
    string message?;
};

public type GETDocumentSuccessRateByCustomerGroupResponse record {
    # An array containing the Document Success Rate timeseries for each customer group represented by the customer group ID.
    # A timeseries over the past 6 months is present in the format of `<month_year>: <document_success_rate>`. The data of the current month is not included. For example, if it is April 15th today, the data for April will not be included. Data for March and earlier will be shown.
    CustomerGroupsDetail[] customer_groups?;
    # Indicates whether the metrics are retrieved successfully.
    # 
    # If no data is loaded yet, a 200 response code will be returned with the success field set to `true`. All expected fields will be present but the value will be `null`.
    boolean success?;
};

public type CollectionagentAccountStatuses record {
    # The number of accounts that are in collections.
    int 'In\ Collections?;
    # The number of accounts that are pending.
    int Pending?;
    # The number of accounts that are in dispute.
    int 'In\ Disputes?;
    # The number of accounts that have paid in full.
    int 'Paid\ in\ Full?;
};

public type GETInvoiceCycleHistoryResponse record {
    # An array containing information of all completed retry cycles for an invoice. See the example for details.
    GETInvoiceCycleElementResponse[] cycles?;
};

public type InlineResponse200 record {
    # Whether the operation is successful.
    boolean success?;
};

public type GETCollectionAgentsResponse record {
    CollectionAgent accounts?;
    # The pagination information.
    ResultsPagination pagination?;
};

public type POSTCustomStatementRun record {
    # The starting date of the time period for which the statement is generated, in the format of MM-DD-YYYY.
    string starting_date;
    # The ending date of the time period for which the statement is generated, in the format of MM-DD-YYYY.
    string ending_date;
    # The billing batch of accounts the statements need to be generated for.
    string batch;
    # The mode in which the run has to be executed.
    string mode;
};

public type GETCustomerGroupMetricsResponse record {
    # An array containing the following information for each customer group.
    #   - Customer group ID
    #   - Customer group name
    #   - Whether Smart Retry is enabled for this customer group
    #   - Document Success Rate indicating the percentage of billing documents that are successfully collected
    #   - The trend of change in Document Success Rate over the last 30 days
    #   - Retry Success Rate indicating the percentage of the successful payment attempts
    #   - Average Attempts indicating the average number of attempts required to recover funds
    CustomerGroups[] customer_groups?;
    # Indicates whether the metrics are retrieved successfully.
    # 
    # If no data is loaded yet, a 200 response code will be returned with the success field set to `true`. All expected fields will be present but the value will be `null`.
    boolean success?;
};

public type GETPaymentRunSchedulesResponse record {
    # An array containing all available schedules.
    record {}[] schedules?;
    # The number of schedules retrieved.
    int size?;
    # Whether the operation is successful.
    boolean success?;
    # Errors that occur in the operation. Available only when **success** is **false**.
    anydata[] errors?;
};

public type NotestasksresponsePagination record {
    # The number of the current page.
    int page?;
    # The number of results on each page.
    int per_page?;
    # The total number of filtered records.
    int total_filtered_records?;
    # The total number of records.
    int total_records?;
};

public type POSTAdhocStatementRun record {
    # The starting date of the time period for which the statement is generated, in the format of MM-DD-YYYY.
    string starting_date;
    # The ending date of the time period for which the statement is generated, in the format of MM-DD-YYYY.
    string ending_date;
    # The name of the template to be used in the statement run.
    string template_name;
    # Specifies whether Invoice Settlement is enabled on the tenant.   
    boolean advanced_ar;
    # The ID of the account for which the statement run is created.
    string account_id;
    # Indicates whether the generated statement is attached to the account.
    boolean attach_to_account?;
};

# Information about the response code mapping for the retry attempt.
public type GetcycleelementattemptresponseMappingInfo record {
    # The response code label, can be `Hard Decline`, `Soft Decline`, `System Error`, or custom labels.
    string label?;
    # The response code level for the payment gateway, can be `Code` or `Description`.
    string level?;
    # The ID of the customer group.
    decimal customer_group_id?;
};

public type GETAmountRecoveredResponse record {
    # An array containing the following information for each available currency.
    # If no payment of a given currency has been processed over the last 30 days, the currency will not appear in the array.
    #   - The total amount recovered to date
    #   - The amount recovered over the last 30 days
    string[] currency?;
    # Indicates whether the metrics are retrieved successfully.
    # 
    # If no data is loaded yet, a 200 response code will be returned with the success field set to `true`. All expected fields will be present but the value will be `null`.
    boolean success?;
};

# Information about the action of the retry attempt.
public type GetcycleelementattemptresponseActionInfo record {
    # The action taken in the retry attempt.
    string action?;
};

public type NotestasksresponseDataTasks record {
    # The ID of the task.
    int id?;
    # The title of the task.
    string task?;
    # Additional details about the task.
    string description?;
    # The due date and time of the task.
    string dueDate?;
    # The date and time when this task is created.
    string createdAt?;
    # The last date and time when the task is updated.
    string updatedAt?;
    # The data and time when a reminder about this task needs to be sent.
    string reminderDate?;
    # The message to be sent as notifications. It can be null if no message is defined.
    string notifications?;
    # The status of the task.
    string status?;
    # The comment about the task.
    string comment?;
    # The automatic escalation setting for the task.
    string autoEscalation?;
    NotesUser createdBy?;
    NotesUser assignTo?;
};

public type GETDebitMemoCycleHistoryResponse record {
    # An array containing information of all completed retry cycles for a debit memo. See the example for details.
    GETDebitMemoCycleElementResponse[] cycles?;
};

public type CustomerGroupsDetail string[];

public type GETDebitMemoCycleElementResponse record {
    # The ID of the customer account.
    string account_id?;
    # The ID of the debit memo.
    string debit_memo_id?;
    # The ID of the payment method.
    string payment_method_id?;
    # The type of the currency used.
    string currency?;
    # The status of the retry cycle.
    string status?;
    # The number of the current retry attempt.
    decimal current_attempt_number?;
    # The date and time of the next retry attempt, in `yyyy-mm-dd hh:mm:ss` format.
    string next_attempt?;
    # The name of the customer group.
    string customer_group?;
    # An array containing information of the retry attempts that have been made. See the schema and example for details.
    GETCycleElementAttemptResponse[] attempts?;
};

# The actual tasks data.
public type NotestasksresponseData record {
    NotestasksresponseDataTasks[] tasks?;
};

public type NotesCreateGroupBody record {
    # The name of the group that you want to create.
    string name?;
    # Additional information about the group.
    string description?;
};

# The status of the account.
public type CollectionStatuses record {
    # Whether this account is in collections.
    boolean 'In\ Collections?;
    # Whether this account is pending.
    boolean Pending?;
    # Whether this account is in dispute.
    boolean 'In\ Dispute?;
    # Whether this account has paid in full.
    boolean 'Paid\ In\ Full?;
};

public type CollectionsinfoStatuses record {
    # The number of accounts that are in collections.
    int 'In\ Collection?;
    # The number of accounts that are in pending status.
    int Pending?;
    # The number of accounts that are in dispute.
    int 'In\ Dispute?;
    int 'Paid\ In\ Full?;
};

# Information about the payment gateway.
public type GetcycleelementattemptresponseGatewayInfo record {
    # The ID of the payment gateway.
    string id?;
    # The response code from the gateway.
    string code?;
    # The response message from the gateway.
    string response?;
};

public type NotesComment record {
    # The ID of the comment.
    int id?;
    # The body of the comment.
    string body?;
    # The link to the image file. The value is null if no image files are available.
    string image?;
    # The link to the attachment. The value is null if no attachments are available.
    string attachment?;
    # The time and date when this comment is created.
    string createdAt?;
    # The last time and date when the comment is updated.
    string updatedAt?;
    NotesUser user?;
    # An array of replies.
    NotesReply[] replies?;
};

public type POSTPaymentRunSchedule record {
    # The frequency of payment runs in the schedule.
    string frequency?;
    # The day of a month when payment runs need to be performed. Required only if **frequency** is **Monthly**. Allowed values are 1-31 or **L** (the last day of a month).
    string day?;
    # An array of days in a week when payment runs need to be performed. Required only if **frequency** is **Weekly**. Allowed integers are 1-7. 1 stands for Monday. 2 stands for Tuesday, etc.
    int[] day_of_week?;
    # The hour of a day when payment runs need to be performed. Allowed values are 1-23.
    int hour?;
    # A bill run name that is used to determine what receivables should be included in payment runs in this schedule. Valid only if the custom filter is not used.
    string billrun?;
    # A batch name that is used to determine what receivables should be included in payment runs in this schedule. Valid only if the custom filter is not used.
    string batch?;
    # A three-character currency code that is used to determine what receivables should be included in payment runs in this schedule. Valid only if the custom filter is not used.   
    string currency?;
    # A payment gateway name that is used to determine what receivables should be included in payment runs in this schedule. Valid only if the custom filter is not used.
    string payment_gateway?;
    # A bill cycle day value that is used to determine what receivables should be included in payment runs in this schedule. Valid only if the custom filter is not used.
    string bill_cycle_day?;
    # A custom ZOQL query that is used to determine what receivables should be included in payment runs in this schedule. It cannot be used with other filters.
    string custom?;
};

public type PaymentsExecutePaymentsBody record {
    # IDs of accounts.
    string[] account_ids?;
    # IDs of debit memos.
    string[] debit_memo_ids?;
    # IDs of invoices.
    string[] invoice_ids?;
};

public type NotesDeleteGroupBody record {
    # The name of the group that has been deleted.
    string name?;
    # The description of the group.
    string description?;
};

public type NotesCreateGroupResponse record {
    # Whether the operation is successful.
    boolean success?;
    # The ID of the Notes group.
    int id?;
    # The name of the group.
    string name?;
    # Additional information about the group.
    string description?;
    # The date and time when the group was created.
    string created_at?;
    # The last date and time when the group was updated.
    string updated_at?;
    # An array of users in the group.
    NotesUser[] users?;
};

public type PaymentsSubmitFailedPaymentBody record {
    # ID of a failed payment.
    string payment_id?;
};

public type NotesObject record {
    # Whether this operation is successful or not.
    boolean success?;
    NotesobjectData data?;
};

public type InlineResponse2001 record {
    # Indicates whether the operation is successful.
    boolean success?;
    # The response message.
    string message?;
};

public type POSTPaymentRunScheduleResponse record {
    # The ID of the payment run schedule in Advanced Payment Manager.
    int id?;
    # Whether the operation is successful.
    boolean success?;
    # Errors that occur in the operation. Available only when **success** is **false**. 
    string[] errors?;
};

public type InlineResponse2003 record {
    # Indicates whether the operation is successful.
    boolean success?;
    # The response message.
    string message?;
};

public type POSTCustomStatementRunResponse record {
    # Whether the operation is successful.
    boolean success?;
    # The response code.
    int code?;
    # The response message.
    string message?;
    # The serial number of the execution.
    string execution_number?;
    # The URL pointing to the report of the run.
    string report_file?;
};

public type NotesObjectWithComment record {
    # Whether this operation is successful or not.
    boolean success?;
    NotesobjectwithcommentData data?;
};

public type CollectionAccount record {
    # The name of the account.
    string name?;
    # The Zuora ID of the account.
    string zuora_id?;
    # Whether the account is in collections.
    boolean in_collections?;
    # The currency that is currently used by the account.
    string account_currency?;
    # The home currency of the tenant.
    string home_currency?;
    # The amount that is due for the account in the account currency.
    decimal amount_due_account_currency?;
    # The amount that is due for the account in the tenant home currency.
    decimal amount_due_home_currency?;
    # The last open invoice date.
    string last_open_invoice_date?;
    # The average age of all the debt of the account.
    decimal average_debt_age?;
    # The status of the account.
    CollectionStatuses statuses?;
};

public type InlineResponse2002 record {
    # Indicates whether the operation is successful.
    boolean success?;
    # The response message.
    string message?;
};

public type CollectionAgent record {
    # The name of the agent.
    string name?;
    # The email of the agent.
    string email?;
    # The Zuora ID of the agent.
    string zuora_identity_id?;
    # The total amount of debt for accounts that are assigned to the user.
    decimal amount_in_collections?;
    # The number of accounts that are assigned to the user.
    int accounts?;
    CollectionagentAccountStatuses account_statuses?;
};

public type InlineResponse2005 record {
    # Indicates whether the operation is successful.
    boolean success?;
    # The response message.
    string message?;
};

public type InlineResponse2004 record {
    # Indicates whether the operation is successful.
    boolean success?;
    # The response message.
    string message?;
};

public type InlineResponse2007 record {
    # Indicates whether the operation is successful.
    boolean success?;
    # The response message.
    string message?;
};

public type InlineResponse2006 record {
    # Indicates whether the operation is successful.
    boolean success?;
    # The response message.
    string message?;
};
