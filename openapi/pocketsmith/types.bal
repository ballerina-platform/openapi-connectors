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

public type InstitutionArr Institution[];

public type AccountArr Account[];

public type TransactionAccountArr TransactionAccount[];

public type TransactionArr Transaction[];

public type CategoryArr Category[];

public type CategoryRuleArr CategoryRule[];

public type BudgetAnalysisPackageArr BudgetAnalysisPackage[];

public type AttachmentArr Attachment[];

public type Account record {
    # The unique identifier of the account.
    int id?;
    # The title of the account.
    string title?;
    # The currency code for the account.
    string currency_code?;
    # The type of the account.
    AccountType 'type?;
    # Whether the account is a net worth asset.
    boolean is_net_worth?;
    TransactionAccount primary_transaction_account?;
    Scenario primary_scenario?;
    # All transaction accounts that compose the account, including the primary.
    TransactionAccount[] transaction_accounts?;
    # All scenarios that compose the account, including the primary.
    Scenario[] scenarios?;
    # When the account was created.
    string created_at?;
    # When the account was last updated.
    string updated_at?;
    # The current balance of the account.
    decimal current_balance?;
    # The date of the current balance.
    string current_balance_date?;
    # The current balance of the account in the user's base currency.
    decimal current_balance_in_base_currency?;
    # The exchange rate between the account's currency and the user's base currency, when different. If the currencies are the same, null is returned.
    decimal current_balance_exchange_rate?;
    # The current safe balance, if safe balance is activated on the account. If safe balance is not activated, then null is returned.
    decimal safe_balance?;
    # The current safe balance in the user's base currency, if safe balance is activated on the account. If safe balance is not activated, then null is returned.
    decimal safe_balance_in_base_currency?;
};

public type User record {
    # The unique identifier of the user.
    int id?;
    # The user's username.
    string login?;
    # The full name of the user, although not all users will have a name set.
    string name?;
    # The user's email address.
    string email?;
    # The URL to the user's avatar.
    string avatar_url?;
    # Whether the user has opted in to beta features.
    boolean beta_user?;
    # The user's time zone.
    string time_zone?;
    # The day of the week the user wishes their calendars to start on. A number between 0 and 6, where 0 is Sunday and 6 is Saturday.
    int week_start_day?;
    # The user's base currency.
    string base_currency_code?;
    # Whether the user wants to see all accounts in their base currency instead of the native account currency.
    boolean always_show_base_currency?;
    # When the user signed up.
    string created_at?;
    # When the user was last updated.
    string updated_at?;
    # Whether the user has multiple currencies in use across their account.
    boolean using_multiple_currencies?;
    # When the user last logged into PocketSmith.
    string last_logged_in_at?;
    # When the user last interacted with PocketSmith, via any application or the API.
    string last_activity_at?;
};

public type Category record {
    # The unique identifier of the category.
    int id?;
    # The title of the category.
    string title?;
    # The colour for the category.
    string colour?;
    # The category's child categories.
    Category[] children?;
    # The unique identifier of the parent category of this category, or null if this category has no parent (i.e. is a top-level category)
    int parent_id?;
    # When the category was created.
    string created_at?;
    # When the category was last updated.
    string updated_at?;
    # Whether this category has been marked as a transfer category.
    boolean is_transfer?;
};

public type CategoryRule record {
    Category category?;
    # The unique identifier of the category rule.
    int id?;
    # The keyword/s to match the transactions payees.
    string payee_matches?;
    # When the category rule was created.
    string created_at?;
    # When the category rule was last updated.
    string updated_at?;
};

public type Body12 record {
    # The new title of the attachment. If the title is blank or not provided, the server will derive a title from the file name.
    string title?;
};

public type Body11 record {
    # The keyword/s to match the transaction payees.
    string payee_matches;
    # Apply the created category rule to all uncategorised transactions.
    boolean apply_to_uncategorised?;
    # Apply the created category rule to all transactions.
    boolean apply_to_all?;
};

public type Attachment record {
    # The unique identifier of the attachment
    int id?;
    # The title of the attachment. If blank or not provided, the title will be derived from the file name.
    string title?;
    # The file name of the attachment
    string file_name?;
    # The type of attachment
    string 'type?;
    # The content type of the attachment.
    string content_type?;
    AttachmentContentTypeMeta content_type_meta?;
    # The url of the attachment
    string original_url?;
    AttachmentVariants variants?;
    # When the attachment was created
    string created_at?;
    # When the attachment was last updated
    string updated_at?;
};

public type Body10 record {
    # A title for the category.
    string title;
    # A CSS-style hex colour for the category.
    string colour?;
    # The unique identifier of a category to be the parent of this category.
    int parent_id?;
};

public type Institution record {
    # The currency code of the institution.
    string currency_code?;
    # The title of the institution.
    string title?;
    # When the institution was last updated.
    string updated_at?;
    # When the institution was created.
    string created_at?;
    # The unique identifier of the institution.
    int id?;
};

public type TransactionAccount record {
    int id?;
    string name?;
    string number?;
    decimal current_balance?;
    string current_balance_date?;
    # The current balance of the transaction account in the user's base currency.
    decimal current_balance_in_base_currency?;
    # The exchange rate between the transaction account's currency and the user's base currency, when different. If the currencies are the same, null is returned.
    decimal current_balance_exchange_rate?;
    # The current safe balance, if safe balance is activated and available for the transaction account. If safe balance is not available, then null is returned.
    decimal safe_balance?;
    # The current safe balance in the user's base currency, if safe balance is activated and available for the transaction account. If safe balance is not available, then null is returned.
    decimal safe_balance_in_base_currency?;
    decimal starting_balance?;
    string starting_balance_date?;
    string created_at?;
    string updated_at?;
    Institution institution?;
    # The currency that the account is in. This is determined by the account that the transaction account belongs to.
    string currency_code?;
    # The type of the transaction account.
    TransactionAccountType 'type?;
};

public type Body14 record {
    # The unique identifier of the attachment.
    int attachment_id?;
};

public type Body13 record {
    # The title of the attachment. If the title is blank or not provided, the title will derived from the file name.
    string title?;
    # The file name of the attachment.
    string file_name?;
    # The base64-encoded contents of the source file. The supported file types are png, jpg, pdf, xls, xlsx, doc, docx.
    string file_data?;
};

# Update information
public type Body record {
    # A new email address for the user.
    string email?;
    # A new name for the user.
    string name?;
    # A new time zone for the user.
    string time_zone?;
    # The day of the week the user wishes their calendars to start on. A number between 0 and 6, where 0 is Sunday and 6 is Saturday.
    int week_start_day?;
    # Whether the user is a beta user, and wishes to try out new features.
    boolean beta_user?;
    # A new base currency code for the user.
    string base_currency_code?;
    # Whether the user wishes to have all monetary values converted to their base currency.
    boolean always_show_base_currency?;
};

public type AttachmentContentTypeMeta record {
    # The content type title of the attachment
    string title?;
    # The content type description of the attachment
    string description?;
    # The extension type of the attachment
    string extension?;
};

public type BudgetAnalysis record {
    # The start date of the budget analysis.
    string start_date?;
    # The end date of the budget analysis.
    string end_date?;
    # The total actual (transactions) amount across all periods.
    decimal total_actual_amount?;
    # The average actual (transactions) amount across all periods.
    decimal average_actual_amount?;
    # The total budgeted amount across all periods.
    decimal total_forecast_amount?;
    # The average budgeted amount across all periods.
    decimal average_forecast_amount?;
    # The total amount the budget was exceeded across all periods.
    decimal total_over_by?;
    # The total amount the budget was under by across all periods.
    decimal total_under_by?;
    # The period analyses that this budget analysis comprises.
    Period[] periods?;
};

public type Body8 record {
    # The payee/merchant of the transaction.
    string payee;
    # The amount of the transaction. A positive amount is a credit, and a negative amount is a debit.
    decimal amount;
    # The date when the transaction occurred.
    string date;
    # Whether the transaction should be indicated as a transfer.
    boolean is_transfer?;
    # A set of comma-separated labels for the transaction.
    string labels?;
    # The unique identifier of a category for the transaction.
    int category_id?;
    # A note for the transaction.
    string note?;
    # A memo for the transaction.
    string memo?;
    # A cheque number for the transaction.
    string cheque_number?;
};

public type Body9 record {
    # A new title for the category.
    string title?;
    # A new CSS-style hex colour for the category.
    string colour?;
    # The unique identifier of a parent category for the category, making this category a child of that category.
    int parent_id?;
};

public type Body6 record {
    # The unique identifier of a new institution for the transaction account.
    int institution_id?;
};

public type Body7 record {
    # A new memo for the transaction.
    string memo?;
    # A new cheque number for the transaction.
    string cheque_number?;
    # A new payee for the transaction.
    string payee?;
    # A new amount for the transaction.
    decimal amount?;
    # A new date for the transaction.
    string date?;
    # Whether the transaction is a transfer or not.
    boolean is_transfer?;
    # The unique identifier of a new category for the transaction.
    int category_id?;
    # A new note for the transaction.
    string note?;
};

public type Body4 record {
    # List the account objects in their new display order.
    Account[] accounts;
};

public type Body5 record {
    # The ID of the institution to create this account in.
    int institution_id;
    # A title for the account.
    string title;
    # A currency code for the account.
    string currency_code;
    # The type of the account.
    Body5Type 'type;
};

public type Body2 record {
    # A title for the institution.
    string title;
    # A currency code for the institution.
    string currency_code;
};

public type Body3 record {
    # A new title for the account.
    string title?;
    # A new currency code for the account.
    string currency_code?;
};

public type Period record {
    # The start date of the period.
    string start_date?;
    # The end date of the period.
    string end_date?;
    # The sum of all actuals (transactions) in the period.
    decimal actual_amount?;
    # The sum of all forecast sources (budget events) in the period, for comparison against the actual amount.
    decimal forecast_amount?;
    # This attribute tracks the amount that has been refunded or deducted to the actual amount. When a category is set to "always expense", any credit transactions are treated as refunds and when set to "always income", any debit transactions are treated as deductions.
    decimal refund_amound?;
    # Whether this period is current, such that the current date (in the user's time zone) falls within the date range.
    boolean current?;
    # Whether the budget has been exceeded in the period.
    boolean over_budget?;
    # Whether the budget has not been exceeded in the period.
    boolean under_budget?;
    # How much the budget has been exceeded by in the period.
    decimal over_by?;
    # How much there is left in the budget for the period.
    decimal under_by?;
    # The percentage of the budget that has been used in the period.
    decimal percentage_used?;
};

public type Error record {
    # A message describing the error that occurred.
    string _error?;
};

public type Scenario record {
    # The unique identifier of the scenario.
    int id?;
    # The title of the scenario.
    string title?;
    # A short description of what the scenario is modelling.
    string description?;
    # The amount of interest to apply to the balance. Will apply periodically depending on what `interest_rate_repeat_id` is set to.
    decimal interest_rate?;
    # A number representing how often the interest should be applied. 0 is used for no interest, 2 is weekly, 3 is fortnightly, 4 is monthly, 5 is yearly and 7 for quarterly.
    int interest_rate_repeat_id?;
    # The type of the scenario.
    ScenarioType 'type?;
    decimal 'minimum\-value?;
    decimal 'maximum\-value?;
    # For goals, the date that they should be achieved by.
    string achieve_date?;
    # The starting balance of the scenario.
    decimal starting_balance?;
    # The date of the starting balance.
    string starting_balance_date?;
    # The closing balance of the scenario.
    decimal closing_balance?;
    # The date of the closing balance.
    string closing_balance_date?;
    # The current balance of the scenario.
    decimal current_balance?;
    # The date of the current balance.
    string current_balance_date?;
    # The current balance of the scenario in the user's base currency.
    decimal current_balance_in_base_currency?;
    # The exchange rate between the scenario's currency and the user's base currency, when different. If the currencies are the same, null is returned.
    decimal current_balance_exchange_rate?;
    # The current safe balance in the user's base currency, if safe balance is activated on the account associated with the scenario. If safe balance is not activated, then null is returned.
    decimal safe_balance?;
    # The current safe balance in the user's base currency, if safe balance is activated on the account associated with the scenario. If safe balance is not available, then null is returned.
    decimal safe_balance_in_base_currency?;
    # When the scenario was created.
    string created_at?;
    # When the scenario was last updated.
    string updated_at?;
};

public type BudgetAnalysisPackage record {
    Category category?;
    # Whether the expense budget analysis looks like a transfer to the income budget analysis, based on a number of heuristics.
    boolean is_transfer?;
    BudgetAnalysis expense?;
    BudgetAnalysis income?;
};

public type Transaction record {
    string cheque_number?;
    # Whether the transaction is a debit or a credit
    TransactionType 'type?;
    string memo?;
    # The payee/merchant of the transaction.
    string payee?;
    decimal amount?;
    # The date the transaction took place.
    string date?;
    # Whether the transaction was a transfer.
    boolean is_transfer?;
    Category category?;
    string note?;
    string[] labels?;
    # The unique identifier of the transaction.
    int id?;
    # The payee the transaction was created with.
    string original_payee?;
    # Where the transaction came from.
    string upload_source?;
    # The closing balance of the account at the transaction.
    decimal closing_balance?;
    TransactionAccount transaction_account?;
    # The status of the transaction. Pending transactions are temporary and may be superseded later by their posted counterparts, which are permanent.
    TransactionStatus status?;
};

public type Body1 record {
    # A new title for the institution.
    string title?;
    # A new currency code for the institution.
    string currency_code?;
};

public type AttachmentVariants record {
    # The url of the large version of the attachment
    string large_url?;
    # The url of the thumb version of the attachment
    string thumb_url?;
};

public enum ListTransactionsUserType {
    LISTTRANSACTIONSUSERTYPE_DEBIT = "debit",
    LISTTRANSACTIONSUSERTYPE_CREDIT = "credit"
}

public enum ListTransactionsAccountType {
    LISTTRANSACTIONSACCOUNTTYPE_DEBIT = "debit",
    LISTTRANSACTIONSACCOUNTTYPE_CREDIT = "credit"
}

public enum GettransactionsType {
    GETTRANSACTIONSTYPE_DEBIT = "debit",
    GETTRANSACTIONSTYPE_CREDIT = "credit"
}

public enum BudgetSummaryPeriod {
    BUDGETSUMMARYPERIOD_WEEKS = "weeks",
    BUDGETSUMMARYPERIOD_MONTHS = "months",
    BUDGETSUMMARYPERIOD_YEARS = "years",
    BUDGETSUMMARYPERIOD_EVENT = "event"
}

public enum TrendAnalysisPeriod {
    TRENDANALYSISPERIOD_WEEKS = "weeks",
    TRENDANALYSISPERIOD_MONTHS = "months",
    TRENDANALYSISPERIOD_YEARS = "years",
    TRENDANALYSISPERIOD_EVENT = "event"
}

public enum AccountType {
    ACCOUNTTYPE_BANK = "bank",
    ACCOUNTTYPE_CREDITS = "credits",
    ACCOUNTTYPE_CASH = "cash",
    ACCOUNTTYPE_STOCKS = "stocks",
    ACCOUNTTYPE_MORTGAGE = "mortgage",
    ACCOUNTTYPE_LOANS = "loans",
    ACCOUNTTYPE_VEHICLE = "vehicle",
    ACCOUNTTYPE_PROPERTY = "property",
    ACCOUNTTYPE_INSURANCE = "insurance",
    ACCOUNTTYPE_OTHERLIABILITY = "other_liability"
}

public enum TransactionAccountType {
    TRANSACTIONACCOUNTTYPE_BANK = "bank",
    TRANSACTIONACCOUNTTYPE_CREDITS = "credits",
    TRANSACTIONACCOUNTTYPE_CASH = "cash",
    TRANSACTIONACCOUNTTYPE_STOCKS = "stocks",
    TRANSACTIONACCOUNTTYPE_MORTGAGE = "mortgage",
    TRANSACTIONACCOUNTTYPE_LOANS = "loans",
    TRANSACTIONACCOUNTTYPE_VEHICLE = "vehicle",
    TRANSACTIONACCOUNTTYPE_PROPERTY = "property",
    TRANSACTIONACCOUNTTYPE_INSURANCE = "insurance",
    TRANSACTIONACCOUNTTYPE_OTHERLIABILITY = "other_liability"
}

public enum Body5Type {
    BODY5TYPE_BANK = "bank",
    BODY5TYPE_CREDITS = "credits",
    BODY5TYPE_LOANS = "loans",
    BODY5TYPE_MORTGAGE = "mortgage",
    BODY5TYPE_STOCKS = "stocks",
    BODY5TYPE_VEHICLE = "vehicle",
    BODY5TYPE_PROPERTY = "property",
    BODY5TYPE_OTHERASSET = "other_asset",
    BODY5TYPE_OTHERLIABILITY = "other_liability"
}

public enum ScenarioType {
    SCENARIOTYPE_NOINTEREST = "no-interest",
    SCENARIOTYPE_SAVINGS = "savings",
    SCENARIOTYPE_DEBT = "debt"
}

public enum TransactionType {
    TRANSACTIONTYPE_DEBIT = "debit",
    TRANSACTIONTYPE_CREDIT = "credit"
}

public enum TransactionStatus {
    TRANSACTIONSTATUS_PENDING = "pending",
    TRANSACTIONSTATUS_POSTED = "posted"
}
