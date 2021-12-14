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

public type ProjectUser record {
    # Identifier of the user of the project.
    string userId?;
    # Full name of the user.
    string name?;
    # Email address of the user.
    string email?;
};

public type Task record {
    # Identifier of the task.
    string taskId?;
    # Name of the task.
    string name?;
    Amount rate?;
    # Can be `TIME`, `FIXED` or `NON_CHARGEABLE`, defines how the task will be charged. Use `TIME` when you want to charge per hour and `FIXED` to charge as a fixed amount. If the task will not be charged use `NON_CHARGEABLE`.
    ChargeType chargeType?;
    # An estimated time to perform the task
    float estimateMinutes?;
    # Identifier of the project task belongs to.
    string projectId?;
    # Total minutes which have been logged against the task. Logged by assigning a time entry to a task
    float totalMinutes?;
    Amount totalAmount?;
    # Minutes on this task which have been invoiced.
    float minutesInvoiced?;
    # Minutes on this task which have not been invoiced.
    float minutesToBeInvoiced?;
    # Minutes logged against this task if its charge type is `FIXED`.
    float fixedMinutes?;
    # Minutes logged against this task if its charge type is `NON_CHARGEABLE`.
    float nonChargeableMinutes?;
    Amount amountToBeInvoiced?;
    Amount amountInvoiced?;
    # Status of the task. When a task of ChargeType is `FIXED` and the rate amount is invoiced the status will be set to `INVOICED` and can't be modified. A task with ChargeType of `TIME` or `NON_CHARGEABLE` cannot have a status of `INVOICED`. A `LOCKED` state indicates that the task is currently changing state (for example being invoiced) and can't be modified.
    string status?;
};

public type Tasks record {
    Pagination pagination?;
    Task[] items?;
};

public type TaskCreateOrUpdate record {
    # Name of the task. Max length 100 characters.
    string name;
    Amount rate;
    # Can be `TIME`, `FIXED` or `NON_CHARGEABLE`, defines how the task will be charged. Use `TIME` when you want to charge per hour and `FIXED` to charge as a fixed amount. If the task will not be charged use `NON_CHARGEABLE`.
    ChargeType chargeType;
    # Estimated time to perform the task. EstimateMinutes has to be greater than 0 if provided.
    int estimateMinutes?;
};

public type Amount record {
    # 3 letter alpha code for the ISO-4217 currency code, e.g. USD, AUD.
    CurrencyCode currency?;
    float value?;
};

public type TimeEntryCreateOrUpdate record {
    # The xero user identifier of the person logging the time.
    string userId;
    # Identifier of the task that time entry is logged against.
    string taskId;
    # Date time entry is logged on. UTC Date Time in ISO-8601 format.
    string dateUtc;
    # Number of minutes to be logged. Duration is between 1 and 59940 inclusively.
    int duration;
    # An optional description of the time entry, will be set to null if not provided during update.
    string description?;
};

public type Projects record {
    Pagination pagination?;
    Project[] items?;
};

public type Error record {
    # Exception message
    string message?;
    # Array of Elements of validation Errors
    record {} modelState?;
};

public type ProjectCreateOrUpdate record {
    # Identifier of the contact this project was created for.
    string contactId?;
    # Name of the project.
    string name;
    float estimateAmount?;
    # Deadline for the project. UTC Date Time in ISO-8601 format.
    string deadlineUtc?;
};

# 3 letter alpha code for the ISO-4217 currency code, e.g. USD, AUD.
public type CurrencyCode string;

public type Project record {
    # Identifier of the project.
    string projectId?;
    # Identifier of the contact this project was created for.
    string contactId?;
    # Name of the project.
    string name;
    # 3 letter alpha code for the ISO-4217 currency code, e.g. USD, AUD.
    CurrencyCode currencyCode?;
    # A total of minutes logged against all tasks on the Project.
    int minutesLogged?;
    Amount totalTaskAmount?;
    Amount totalExpenseAmount?;
    Amount estimateAmount?;
    # Minutes which have not been invoiced across all chargeable tasks in the project.
    int minutesToBeInvoiced?;
    Amount taskAmountToBeInvoiced?;
    Amount taskAmountInvoiced?;
    Amount expenseAmountToBeInvoiced?;
    Amount expenseAmountInvoiced?;
    Amount projectAmountInvoiced?;
    Amount deposit?;
    Amount depositApplied?;
    Amount creditNoteAmount?;
    # Deadline for the project. UTC Date Time in ISO-8601 format.
    string deadlineUtc?;
    Amount totalInvoiced?;
    Amount totalToBeInvoiced?;
    Amount estimate?;
    # Status for project
    ProjectStatus status?;
};

public type Pagination record {
    # Set to 1 by default. The requested number of the page in paged response - Must be a number greater than 0.
    int page?;
    # Optional, it is set to 50 by default. The number of items to return per page in a paged response - Must be a number between 1 and 500.
    int pageSize?;
    # Number of pages available
    int pageCount?;
    # Number of items returned
    int itemCount?;
};

public type ProjectUsers record {
    Pagination pagination?;
    ProjectUser[] items?;
};

# Status for project
public type ProjectStatus string;

public type TimeEntry record {
    # Identifier of the time entry.
    string timeEntryId?;
    # The xero user identifier of the person who logged time.
    string userId?;
    # Identifier of the project, that the task (which the time entry is logged against) belongs to.
    string projectId?;
    # Identifier of the task that time entry is logged against.
    string taskId?;
    # The date time that time entry is logged on. UTC Date Time in ISO-8601 format.
    string dateUtc?;
    # The date time that time entry is created. UTC Date Time in ISO-8601 format. By default it is set to server time.
    string dateEnteredUtc?;
    # The duration of logged minutes.
    int duration?;
    # A description of the time entry.
    string description?;
    # Status of the time entry. By default a time entry is created with status of `ACTIVE`. A `LOCKED` state indicates that the time entry is currently changing state (for example being invoiced). Updates are not allowed when in this state. It will have a status of INVOICED once it is invoiced.
    string status?;
};

# Can be `TIME`, `FIXED` or `NON_CHARGEABLE`, defines how the task will be charged. Use `TIME` when you want to charge per hour and `FIXED` to charge as a fixed amount. If the task will not be charged use `NON_CHARGEABLE`.
public type ChargeType string;

public type TimeEntries record {
    Pagination pagination?;
    TimeEntry[] items?;
};

public type ProjectPatch record {
    # Status for project
    ProjectStatus status;
};
