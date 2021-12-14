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

public type PayeeLocation record {
    string id;
    string payee_id;
    string latitude;
    string longitude;
    # Whether or not the payee location has been deleted.  Deleted payee locations will only be included in delta requests.
    boolean deleted;
};

public type Account record {
    string id;
    string name;
    # The type of account. Note: payPal, merchantAccount, investmentAccount, and mortgage types have been deprecated and will be removed in the future.
    string 'type;
    # Whether this account is on budget or not
    boolean on_budget;
    # Whether this account is closed or not
    boolean closed;
    string note?;
    # The current balance of the account in milliunits format
    int balance;
    # The current cleared balance of the account in milliunits format
    int cleared_balance;
    # The current uncleared balance of the account in milliunits format
    int uncleared_balance;
    # The payee id which should be used when transferring to this account
    string transfer_payee_id;
    # Whether or not the account is linked to a financial institution for automatic transaction import.
    boolean direct_import_linked?;
    # If an account linked to a financial institution (direct_import_linked=true) and the linked connection is not in a healthy state, this will be true.
    boolean direct_import_in_error?;
    # Whether or not the account has been deleted.  Deleted accounts will only be included in delta requests.
    boolean deleted;
};

public type SaveAccountWrapper record {
    SaveAccount account;
};

public type MonthSummary record {
    string month;
    string note?;
    # The total amount of transactions categorized to 'Inflow: Ready to Assign' in the month
    int income;
    # The total amount budgeted in the month
    int budgeted;
    # The total amount of transactions in the month, excluding those categorized to 'Inflow: Ready to Assign'
    int activity;
    # The available amount for 'Ready to Assign'
    int to_be_budgeted;
    # The Age of Money as of the month
    int age_of_money?;
    # Whether or not the month has been deleted.  Deleted months will only be included in delta requests.
    boolean deleted;
};

public type TransactionsresponseData record {
    TransactionDetail[] transactions;
    # The knowledge of the server
    int server_knowledge;
};

public type ScheduledtransactionresponseData record {
    ScheduledTransactionDetail scheduled_transaction;
};

public type HybridTransaction record {
    *TransactionSummary;
    # Whether the hybrid transaction represents a regular transaction or a subtransaction
    string 'type;
    # For subtransaction types, this is the id of the parent transaction.  For transaction types, this id will be always be null.
    string parent_transaction_id?;
    string account_name;
    string payee_name?;
    string category_name?;
};

public type AccountsresponseData record {
    Account[] accounts;
    # The knowledge of the server
    int server_knowledge;
};

public type ErrorDetail record {
    string id;
    string name;
    string detail;
};

public type SaveCategoryResponse record {
    SavecategoryresponseData data;
};

public type SaveMonthCategoryWrapper record {
    SaveMonthCategory category;
};

public type PayeelocationresponseData record {
    PayeeLocation payee_location;
};

public type SavetransactionsresponseData record {
    # The transaction ids that were saved
    string[] transaction_ids;
    TransactionDetail 'transaction?;
    # If multiple transactions were specified, the transactions that were saved
    TransactionDetail[] transactions?;
    # If multiple transactions were specified, a list of import_ids that were not created because of an existing `import_id` found on the same account
    string[] duplicate_import_ids?;
    # The knowledge of the server
    int server_knowledge;
};

public type BudgetSummaryResponse record {
    BudgetsummaryresponseData data;
};

public type BudgetDetail record {
    *BudgetSummary;
    Account[] accounts?;
    Payee[] payees?;
    PayeeLocation[] payee_locations?;
    CategoryGroup[] category_groups?;
    Category[] categories?;
    MonthDetail[] months?;
    TransactionSummary[] transactions?;
    SubTransaction[] subtransactions?;
    ScheduledTransactionSummary[] scheduled_transactions?;
    ScheduledSubTransaction[] scheduled_subtransactions?;
};

public type SaveMonthCategory record {
    # Budgeted amount in milliunits format
    int budgeted;
};

public type CategoryGroupWithCategories record {
    *CategoryGroup;
    # Category group categories.  Amounts (budgeted, activity, balance, etc.) are specific to the current budget month (UTC).
    Category[] categories;
};

public type BudgetsettingsresponseData record {
    BudgetSettings settings;
};

public type BudgetdetailresponseData record {
    BudgetDetail budget;
    # The knowledge of the server
    int server_knowledge;
};

public type TransactionsResponse record {
    TransactionsresponseData data;
};

public type CategoriesresponseData record {
    CategoryGroupWithCategories[] category_groups;
    # The knowledge of the server
    int server_knowledge;
};

public type TransactionsImportResponse record {
    TransactionsimportresponseData data;
};

public type ScheduledSubTransaction record {
    string id;
    string scheduled_transaction_id;
    # The scheduled subtransaction amount in milliunits format
    int amount;
    string memo?;
    string payee_id?;
    string category_id?;
    # If a transfer, the account_id which the scheduled subtransaction transfers to
    string transfer_account_id?;
    # Whether or not the scheduled subtransaction has been deleted.  Deleted scheduled subtransactions will only be included in delta requests.
    boolean deleted;
};

public type PayeeLocationsResponse record {
    PayeelocationsresponseData data;
};

public type ScheduledTransactionDetail record {
    *ScheduledTransactionSummary;
    string account_name;
    string payee_name?;
    string category_name?;
    # If a split scheduled transaction, the subtransactions.
    ScheduledSubTransaction[] subtransactions;
};

public type PayeeresponseData record {
    Payee payee;
};

public type SaveTransaction record {
    string account_id;
    # The transaction date in ISO format (e.g. 2016-12-01).  Future dates (scheduled transactions) are not permitted.  Split transaction dates cannot be changed and if a different date is supplied it will be ignored.
    string date;
    # The transaction amount in milliunits format.  Split transaction amounts cannot be changed and if a different amount is supplied it will be ignored.
    int amount;
    # The payee for the transaction.  To create a transfer between two accounts, use the account transfer payee pointing to the target account.  Account transfer payees are specified as `tranfer_payee_id` on the account resource.
    string payee_id?;
    # The payee name.  If a `payee_name` value is provided and `payee_id` has a null value, the `payee_name` value will be used to resolve the payee by either (1) a matching payee rename rule (only if `import_id` is also specified) or (2) a payee with the same name or (3) creation of a new payee.
    string payee_name?;
    # The category for the transaction.  To configure a split transaction, you can specify null for `category_id` and provide a `subtransactions` array as part of the transaction object.  If an existing transaction is a split, the `category_id` cannot be changed.  Credit Card Payment categories are not permitted and will be ignored if supplied.
    string category_id?;
    string memo?;
    # The cleared status of the transaction
    string cleared?;
    # Whether or not the transaction is approved.  If not supplied, transaction will be unapproved by default.
    boolean approved?;
    # The transaction flag
    string flag_color?;
    # If specified, the new transaction will be assigned this `import_id` and considered "imported".  We will also attempt to match this imported transaction to an existing "user-entered" transation on the same account, with the same amount, and with a date +/-10 days from the imported transaction date.<br><br>Transactions imported through File Based Import or Direct Import (not through the API) are assigned an import_id in the format: 'YNAB:[milliunit_amount]:[iso_date]:[occurrence]'. For example, a transaction dated 2015-12-30 in the amount of -$294.23 USD would have an import_id of 'YNAB:-294230:2015-12-30:1'.  If a second transaction on the same account was imported and had the same date and same amount, its import_id would be 'YNAB:-294230:2015-12-30:2'.  Using a consistent format will prevent duplicates through Direct Import and File Based Import.<br><br>If import_id is omitted or specified as null, the transaction will be treated as a "user-entered" transaction. As such, it will be eligible to be matched against transactions later being imported (via DI, FBI, or API).
    string import_id?;
    # An array of subtransactions to configure a transaction as a split.  Updating `subtransactions` on an existing split transaction is not supported.
    SaveSubTransaction[] subtransactions?;
};

public type BulkresponseDataBulk record {
    # The list of Transaction ids that were created.
    string[] transaction_ids;
    # If any Transactions were not created because they had an `import_id` matching a transaction already on the same account, the specified import_id(s) will be included in this list.
    string[] duplicate_import_ids;
};

public type SaveAccount record {
    # The name of the account
    string name;
    # The account type
    string 'type;
    # The current balance of the account in milliunits format
    int balance;
};

public type SaveSubTransaction record {
    # The subtransaction amount in milliunits format.
    int amount;
    # The payee for the subtransaction.
    string payee_id?;
    # The payee name.  If a `payee_name` value is provided and `payee_id` has a null value, the `payee_name` value will be used to resolve the payee by either (1) a matching payee rename rule (only if import_id is also specified on parent transaction) or (2) a payee with the same name or (3) creation of a new payee.
    string payee_name?;
    # The category for the subtransaction.  Credit Card Payment categories are not permitted and will be ignored if supplied.
    string category_id?;
    string memo?;
};

public type MonthDetailResponse record {
    MonthdetailresponseData data;
};

public type MonthDetail record {
    *MonthSummary;
    # The budget month categories.  Amounts (budgeted, activity, balance, etc.) are specific to the {month} parameter specified.
    Category[] categories;
};

public type AccountResponse record {
    AccountresponseData data;
};

public type CategoryResponse record {
    CategoryresponseData data;
};

public type Payee record {
    string id;
    string name;
    # If a transfer payee, the `account_id` to which this payee transfers to
    string transfer_account_id?;
    # Whether or not the payee has been deleted.  Deleted payees will only be included in delta requests.
    boolean deleted;
};

public type TransactionSummary record {
    string id;
    # The transaction date in ISO format (e.g. 2016-12-01)
    string date;
    # The transaction amount in milliunits format
    int amount;
    string memo?;
    # The cleared status of the transaction
    string cleared;
    # Whether or not the transaction is approved
    boolean approved;
    # The transaction flag
    string flag_color?;
    string account_id;
    string payee_id?;
    string category_id?;
    # If a transfer transaction, the account to which it transfers
    string transfer_account_id?;
    # If a transfer transaction, the id of transaction on the other side of the transfer
    string transfer_transaction_id?;
    # If transaction is matched, the id of the matched transaction
    string matched_transaction_id?;
    # If the Transaction was imported, this field is a unique (by account) import identifier.  If this transaction was imported through File Based Import or Direct Import and not through the API, the import_id will have the format: 'YNAB:[milliunit_amount]:[iso_date]:[occurrence]'.  For example, a transaction dated 2015-12-30 in the amount of -$294.23 USD would have an import_id of 'YNAB:-294230:2015-12-30:1'.  If a second transaction on the same account was imported and had the same date and same amount, its import_id would be 'YNAB:-294230:2015-12-30:2'.
    string import_id?;
    # Whether or not the transaction has been deleted.  Deleted transactions will only be included in delta requests.
    boolean deleted;
};

public type ScheduledTransactionsResponse record {
    ScheduledtransactionsresponseData data;
};

public type PayeelocationsresponseData record {
    PayeeLocation[] payee_locations;
};

public type BudgetDetailResponse record {
    BudgetdetailresponseData data;
};

public type PayeesresponseData record {
    Payee[] payees;
    # The knowledge of the server
    int server_knowledge;
};

public type User record {
    string id;
};

public type Category record {
    string id;
    string category_group_id;
    string name;
    # Whether or not the category is hidden
    boolean hidden;
    # If category is hidden this is the id of the category group it originally belonged to before it was hidden.
    string original_category_group_id?;
    string note?;
    # Budgeted amount in milliunits format
    int budgeted;
    # Activity amount in milliunits format
    int activity;
    # Balance in milliunits format
    int balance;
    # The type of goal, if the category has a goal (TB='Target Category Balance', TBD='Target Category Balance by Date', MF='Monthly Funding', NEED='Plan Your Spending')
    string goal_type?;
    # The month a goal was created
    string goal_creation_month?;
    # The goal target amount in milliunits
    int goal_target?;
    # The original target month for the goal to be completed.  Only some goal types specify this date.
    string goal_target_month?;
    # The percentage completion of the goal
    int goal_percentage_complete?;
    # The number of months, including the current month, left in the current goal period.
    int goal_months_to_budget?;
    # The amount of funding still needed in the current month to stay on track towards completing the goal within the current goal period.  This amount will generally correspond to the 'Underfunded' amount in the web and mobile clients except when viewing a category with a Needed for Spending Goal in a future month.  The web and mobile clients will ignore any funding from a prior goal period when viewing category with a Needed for Spending Goal in a future month.
    int goal_under_funded?;
    # The total amount funded towards the goal within the current goal period.
    int goal_overall_funded?;
    # The amount of funding still needed to complete the goal within the current goal period.
    int goal_overall_left?;
    # Whether or not the category has been deleted.  Deleted categories will only be included in delta requests.
    boolean deleted;
};

public type PayeesResponse record {
    PayeesresponseData data;
};

public type UpdateTransaction record {
    string id;
    *SaveTransaction;
};

public type BulkresponseData record {
    BulkresponseDataBulk bulk;
};

public type SubTransaction record {
    string id;
    string transaction_id;
    # The subtransaction amount in milliunits format
    int amount;
    string memo?;
    string payee_id?;
    string payee_name?;
    string category_id?;
    string category_name?;
    # If a transfer, the account_id which the subtransaction transfers to
    string transfer_account_id?;
    # If a transfer, the id of transaction on the other side of the transfer
    string transfer_transaction_id?;
    # Whether or not the subtransaction has been deleted.  Deleted subtransactions will only be included in delta requests.
    boolean deleted;
};

public type AccountresponseData record {
    Account account;
};

public type SaveTransactionsResponse record {
    SavetransactionsresponseData data;
};

public type TransactionResponse record {
    TransactionresponseData data;
};

public type HybridtransactionsresponseData record {
    HybridTransaction[] transactions;
};

public type MonthdetailresponseData record {
    MonthDetail month;
};

public type MonthSummariesResponse record {
    MonthsummariesresponseData data;
};

public type TransactionDetail record {
    *TransactionSummary;
    string account_name;
    string payee_name?;
    string category_name?;
    # If a split transaction, the subtransactions.
    SubTransaction[] subtransactions;
};

public type BulkTransactions record {
    SaveTransaction[] transactions;
};

public type HybridTransactionsResponse record {
    HybridtransactionsresponseData data;
};

public type BudgetSummary record {
    string id;
    string name;
    # The last time any changes were made to the budget from either a web or mobile client
    string last_modified_on?;
    # The earliest budget month
    string first_month?;
    # The latest budget month
    string last_month?;
    # The date format setting for the budget.  In some cases the format will not be available and will be specified as null.
    DateFormat date_format?;
    # The currency format setting for the budget.  In some cases the format will not be available and will be specified as null.
    CurrencyFormat currency_format?;
    # The budget accounts (only included if `include_accounts=true` specified as query parameter)
    Account[] accounts?;
};

public type ScheduledTransactionSummary record {
    string id;
    # The first date for which the Scheduled Transaction was scheduled.
    string date_first;
    # The next date for which the Scheduled Transaction is scheduled.
    string date_next;
    string frequency;
    # The scheduled transaction amount in milliunits format
    int amount;
    string memo?;
    # The scheduled transaction flag
    string flag_color?;
    string account_id;
    string payee_id?;
    string category_id?;
    # If a transfer, the account_id which the scheduled transaction transfers to
    string transfer_account_id?;
    # Whether or not the scheduled transaction has been deleted.  Deleted scheduled transactions will only be included in delta requests.
    boolean deleted;
};

public type TransactionsimportresponseData record {
    # The list of transaction ids that were imported.
    string[] transaction_ids;
};

public type AccountsResponse record {
    AccountsresponseData data;
};

public type ScheduledtransactionsresponseData record {
    ScheduledTransactionDetail[] scheduled_transactions;
    # The knowledge of the server
    int server_knowledge;
};

public type MonthsummariesresponseData record {
    MonthSummary[] months;
    # The knowledge of the server
    int server_knowledge;
};

# The currency format setting for the budget.  In some cases the format will not be available and will be specified as null.
public type CurrencyFormat record {
    # ISO code
    string iso_code;
    # Example format
    string example_format;
    # Decimal digits
    int decimal_digits;
    # Decimal separator
    string decimal_separator;
    # Symbol first
    boolean symbol_first;
    # Group separator
    string group_separator;
    # Currency symbol
    string currency_symbol;
    # Display symbol
    boolean display_symbol;
};

public type CategoryresponseData record {
    Category category;
};

public type BulkResponse record {
    BulkresponseData data;
};

public type TransactionresponseData record {
    TransactionDetail 'transaction;
};

public type BudgetSettingsResponse record {
    BudgetsettingsresponseData data;
};

public type PayeeResponse record {
    PayeeresponseData data;
};

public type PayeeLocationResponse record {
    PayeelocationresponseData data;
};

public type UserresponseData record {
    User user;
};

public type BudgetsummaryresponseData record {
    BudgetSummary[] budgets;
    BudgetSummary? default_budget?;
};

public type SaveTransactionsWrapper record {
    SaveTransaction 'transaction?;
    SaveTransaction[] transactions?;
};

public type ErrorResponse record {
    ErrorDetail _error;
};

public type CategoriesResponse record {
    CategoriesresponseData data;
};

public type UserResponse record {
    UserresponseData data;
};

public type UpdateTransactionsWrapper record {
    UpdateTransaction[] transactions;
};

public type SavecategoryresponseData record {
    Category category;
    # The knowledge of the server
    int server_knowledge;
};

# The date format setting for the budget.  In some cases the format will not be available and will be specified as null.
public type DateFormat record {
    # Date format setting for the budget
    string format;
};

public type ScheduledTransactionResponse record {
    ScheduledtransactionresponseData data;
};

public type BudgetSettings record {
    # The date format setting for the budget.  In some cases the format will not be available and will be specified as null.
    DateFormat date_format;
    # The currency format setting for the budget.  In some cases the format will not be available and will be specified as null.
    CurrencyFormat currency_format;
};

public type SaveTransactionWrapper record {
    SaveTransaction 'transaction;
};

public type CategoryGroup record {
    string id;
    string name;
    # Whether or not the category group is hidden
    boolean hidden;
    # Whether or not the category group has been deleted.  Deleted category groups will only be included in delta requests.
    boolean deleted;
};
