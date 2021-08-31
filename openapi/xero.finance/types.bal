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

public type CashValidationResponseArr CashValidationResponse[];

public type StatementBalanceResponse record {
    # Total closing balance of the account. This includes both reconciled and unreconciled bank statement lines. The closing balance will always be represented as a positive number, with it’s debit/credit status defined in the statementBalanceDebitCredit field.
    float value?;
    # The DEBIT or CREDIT status of the account. Cash accounts in credit have a negative balance.
    string? 'type?;
};

public type BalanceSheetResponse record {
    # Balance date of the report
    string? balanceDate?;
    BalanceSheetAccountGroup asset?;
    BalanceSheetAccountGroup liability?;
    BalanceSheetAccountGroup equity?;
};

public type TrialBalanceResponse record {
    # Start date of the report
    string? startDate?;
    # End date of the report
    string? endDate?;
    # Refer to the accounts section below
    TrialBalanceAccount[]? accounts?;
};

public type ReportHistoryModel record {
    # Report code or report title
    string? reportName?;
    # The date or date range of the report
    string? reportDateText?;
    # The system date time that the report was published
    string publishedDateUtc?;
};

public type CashflowResponse record {
    # Start date of the report
    string startDate?;
    # End date of the report
    string endDate?;
    CashBalance cashBalance?;
    # Break down of cash and cash equivalents for the period
    CashflowActivity[]? cashflowActivities?;
};

public type CashflowActivity record {
    # Name of the cashflow activity type. It will be either Operating Activities, Investing Activities or Financing Activities
    string? name?;
    # Total value of the activity type
    float total?;
    CashflowType[]? cashflowTypes?;
};

public type PnlAccountType record {
    # Total movement on this account type
    float total?;
    # Name of this account type, it will be either Trading Income or Other Income for Revenue section / Direct Cost or Operating Expenses for Expense section
    string? title?;
    # A list of the movement on each account detail during the query period. Refer to the account detail element below
    PnlAccount[]? accounts?;
};

public type TrialBalanceEntry record {
    # Net movement or net balance in the account
    float value?;
    # Sign (Debit/Credit) of the movement of balance in the account
    string? entryType?;
};

public type CurrentStatementResponse record {
    # Looking at the most recent bank statement, this field indicates the first date which transactions on this statement pertain to. This date is represented in ISO 8601 format.
    string? startDate?;
    # Looking at the most recent bank statement, this field indicates the last date which transactions on this statement pertain to. This date is represented in ISO 8601 format.
    string? endDate?;
    # Looking at the most recent bank statement, this field indicates the balance before the transactions on the statement are applied (note, this is not always populated by the bank in every single instance (~10%)).
    float startBalance?;
    # Looking at the most recent bank statement, this field indicates the balance after the transactions on the statement are applied (note, this is not always populated by the bank in every single instance (~10%)).
    float endBalance?;
    # Looking at the most recent bank statement, this field indicates when the document was imported into Xero.  This date is represented in ISO 8601 format.
    string? importedDateTimeUtc?;
    # Looking at the most recent bank statement, this field indicates the source of the data (direct bank feed, indirect bank feed, file upload, or manual keying).
    string? importSourceType?;
};

public type CashflowAccount record {
    # ID of the account
    string accountId?;
    # The type of the account. See <a href='https://developer.xero.com/documentation/api/types#AccountTypes'>Account Types</a>
    string? accountType?;
    # The class of the account. See <a href='https://developer.xero.com/documentation/api/types#AccountClassTypes'>Account Class Types</a>
    string? accountClass?;
    # Account code
    string? code?;
    # Account name
    string? name?;
    # Reporting code used for cash flow classification
    string? reportingCode?;
    # Total amount for the account
    float total?;
};

public type PnlAccountClass record {
    # Total revenue/expense value
    float total?;
    # Contains trading income and other income for revenue section / operating expenses and direct cost for expense section if the data is available for each section. Refer to the account type element below
    PnlAccountType[]? accountTypes?;
};

public type BalanceSheetAccountType record {
    # The type of the account. See <a href='https://developer.xero.com/documentation/api/types#AccountTypes'>Account Types</a>
    string? accountType?;
    # A list of all accounts of this type. Refer to the Account section below for each account element detail.
    BalanceSheetAccountDetail[]? accounts?;
    # Total value of all the accounts in this type
    float total?;
};

public type PnlAccount record {
    # ID of the account
    string accountID?;
    # The type of the account. See <a href='https://developer.xero.com/documentation/api/types#AccountTypes'>Account Types</a>
    string? accountType?;
    # Account code
    string? code?;
    # Account name
    string? name?;
    # Reporting code (Shown if set)
    string? reportingCode?;
    # Total movement on this account
    float total?;
};

public type BalanceSheetAccountDetail record {
    # Accounting code
    string? code?;
    # ID of the account
    string accountID?;
    # Account name
    string? name?;
    # Reporting code
    string? reportingCode?;
    # Total movement on this account
    float total?;
};

public type AccountUsage record {
    # The month this usage item contains data for
    string? month?;
    # The account this usage item contains data for
    string accountId?;
    # The currency code this usage item contains data for
    string? currencyCode?;
    # Total received
    float? totalReceived?;
    # Count of received
    int? countReceived?;
    # Total paid
    float? totalPaid?;
    # Count of paid
    int? countPaid?;
    # Total value of manual journals
    float? totalManualJournal?;
    # Count of manual journals
    int? countManualJournal?;
    # The name of the account
    string? accountName?;
    # Shown if set
    string? reportingCode?;
    # Shown if set
    string? reportingCodeName?;
    # Last modified date UTC format
    string? reportCodeUpdatedDateUtc?;
};

public type CashValidationResponse record {
    # The Xero identifier for an account
    string accountId?;
    StatementBalanceResponse statementBalance?;
    # UTC Date when the last bank statement item was entered into Xero. This date is represented in ISO 8601 format.
    string? statementBalanceDate?;
    BankStatementResponse bankStatement?;
    CashAccountResponse cashAccount?;
};

public type LockHistoryResponse record {
    # The requested Organisation to which the data pertains
    string organisationId?;
    # The end date of the report
    string? endDate?;
    LockHistoryModel[]? lockDates?;
};

public type BankStatementResponse record {
    StatementLinesResponse statementLines?;
    CurrentStatementResponse currentStatement?;
};

public type StatementLinesResponse record {
    # Sum of the amounts of all statement lines where both the reconciled flag is set to FALSE, and the amount is positive.
    float unreconciledAmountPos?;
    # Sum of the amounts of all statement lines where both the reconciled flag is set to FALSE, and the amount is negative.
    float unreconciledAmountNeg?;
    # Count of all statement lines where the reconciled flag is set to FALSE.
    int unreconciledLines?;
    # Sum-product of age of statement line in days multiplied by transaction amount, divided by the sum of transaction amount - in for those statement lines in which the reconciled flag is set to FALSE, and the amount is positive. Provides an indication of the age of unreconciled transactions.
    float avgDaysUnreconciledPos?;
    # Sum-product of age of statement line in days multiplied by transaction amount, divided by the sum of transaction amount - in for those statement lines in which the reconciled flag is set to FALSE, and the amount is negative. Provides an indication of the age of unreconciled transactions.
    float avgDaysUnreconciledNeg?;
    # UTC Date which is the earliest transaction date of a statement line for which the reconciled flag is set to FALSE.  This date is represented in ISO 8601 format.
    string? earliestUnreconciledTransaction?;
    # UTC Date which is the latest transaction date of a statement line for which the reconciled flag is set to FALSE.  This date is represented in ISO 8601 format.
    string? latestUnreconciledTransaction?;
    # Sum of the amounts of all deleted statement lines.  Transactions may be deleted due to duplication or otherwise.
    float deletedAmount?;
    # Sum of the amounts of all statement lines.  This is used as a metric of comparison to the unreconciled figures above.
    float totalAmount?;
    DataSourceResponse dataSource?;
    # UTC Date which is the earliest transaction date of a statement line for which the reconciled flag is set to TRUE.  This date is represented in ISO 8601 format.
    string? earliestReconciledTransaction?;
    # UTC Date which is the latest transaction date of a statement line for which the reconciled flag is set to TRUE.  This date is represented in ISO 8601 format.
    string? latestReconciledTransaction?;
    # Sum of the amounts of all statement lines where both the reconciled flag is set to TRUE, and the amount is positive.
    float reconciledAmountPos?;
    # Sum of the amounts of all statement lines where both the reconciled flag is set to TRUE, and the amount is negative.
    float reconciledAmountNeg?;
    # Count of all statement lines where the reconciled flag is set to TRUE
    int reconciledLines?;
    # Sum of the amounts of all statement lines where the amount is positive
    float totalAmountPos?;
    # Sum of the amounts of all statement lines where the amount is negative.
    float totalAmountNeg?;
};

public type AccountUsageResponse record {
    # The requested Organisation to which the data pertains
    string organisationId?;
    # The start month of the report
    string? startMonth?;
    # The end month of the report
    string? endMonth?;
    AccountUsage[]? accountUsage?;
};

public type TrialBalanceMovement record {
    # Debit amount
    float debits?;
    # Credit amount
    float credits?;
    TrialBalanceEntry movement?;
    # Value of movement. Expense and Asset accounts code debits as positive. Revenue, Liability, and Equity accounts code debits as negative
    float signedMovement?;
};

public type BalanceSheetAccountGroup record {
    BalanceSheetAccountType[]? accountTypes?;
    # Total value of all the accounts in this type
    float total?;
};

public type CashBalance record {
    # Opening balance of cash and cash equivalents
    float openingCashBalance?;
    # Closing balance of cash and cash equivalents
    float closingCashBalance?;
    # Net movement of cash and cash equivalents for the period
    float netCashMovement?;
};

public type UserActivitiesResponse record {
    # The requested Organisation to which the data pertains
    string organisationId?;
    # The month of the report
    string? dataMonth?;
    UserResponse[]? users?;
};

public type ReportHistoryResponse record {
    # The requested Organisation to which the data pertains
    string organisationId?;
    # The end date of the report
    string? endDate?;
    ReportHistoryModel[]? reports?;
};

public type UserResponse record {
    # The Xero identifier for the user
    string userId?;
    # Timestamp of user creation.
    string? userCreatedDateUtc?;
    # Timestamp of user last login
    string? lastLoginDateUtc?;
    # User is external partner.
    boolean isExternalPartner?;
    # User has Accountant role.
    boolean hasAccountantRole?;
    # Month period in format  yyyy-MM.
    string? monthPeriod?;
    # Number of times the user has logged in.
    int numberOfLogins?;
    # Number of documents created.
    int numberOfDocumentsCreated?;
    # Net value of documents created.
    float? netValueDocumentsCreated?;
    # Absolute value of documents created.
    float? absoluteValueDocumentsCreated?;
    PracticeResponse[]? attachedPractices?;
    HistoryRecordResponse[]? historyRecords?;
};

public type LockHistoryModel record {
    # Date the account hard lock was set
    string? hardLockDate?;
    # Date the account soft lock was set
    string? softLockDate?;
    # The system date time that the lock was updated
    string? updatedDateUtc?;
};

public type TrialBalanceAccount record {
    # ID of the account
    string accountId?;
    # The type of the account. See <a href='https://developer.xero.com/documentation/api/types#AccountTypes'>Account Types</a>
    string? accountType?;
    # Customer defined alpha numeric account code e.g 200 or SALES
    string? accountCode?;
    # The class of the account. See <a href='https://developer.xero.com/documentation/api/types#AccountClassTypes'>Account Class Types</a>
    string? accountClass?;
    # Accounts with a status of ACTIVE can be updated to ARCHIVED. See <a href='https://developer.xero.com/documentation/api/types#AccountStatusCodes'>Account Status Codes</a>
    string? status?;
    # Reporting code (Shown if set)
    string? reportingCode?;
    # Name of the account
    string? accountName?;
    TrialBalanceEntry balance?;
    # Value of balance. Expense and Asset accounts code debits as positive. Revenue, Liability, and Equity accounts code debits as negative
    float signedBalance?;
    TrialBalanceMovement accountMovement?;
};

public type HistoryRecordResponse record {
    # The type of change recorded against the document
    string? changes?;
    # UTC date that the history record was created
    string? dateUTCString?;
    # UTC date that the history record was created
    string dateUTC?;
    # The users first and last name
    string? user?;
    # Description of the change event or transaction
    string? details?;
};

public type CashflowType record {
    # Name of the activity
    string? name?;
    # Total value of the activity
    float total?;
    # List of the accounts in this activity
    CashflowAccount[]? accounts?;
};

public type ProblemType string;

public type DataSourceResponse record {
    # Sum of the amounts of all statement lines where the source of the data was a direct bank feed in to Xero.   This gives an indication on the certainty of correctness of the data.
    float directBankFeed?;
    # Sum of the amounts of all statement lines where the source of the data was a indirect bank feed to Xero (usually via Yodlee).   This gives an indication on the certainty of correctness of the data.
    float indirectBankFeed?;
    # Sum of the amounts of all statement lines where the source of the data was a CSV file upload in to Xero.   This gives an indication on the certainty of correctness of the data.
    float fileUpload?;
    # Sum of the amounts of all statement lines where the source of the data was manually keyed in to Xero.   This gives an indication on the certainty of correctness of the data.
    float manual?;
    # Sum of the amounts of all statement lines where the source of the data was a direct bank feed in to Xero.  This gives an indication on the certainty of correctness of the data.  Only positive transactions are included.
    float directBankFeedPos?;
    # Sum of the amounts of all statement lines where the source of the data was a indirect bank feed to Xero (usually via Yodlee).   This gives an indication on the certainty of correctness of the data. Only positive transactions are included.
    float indirectBankFeedPos?;
    # Sum of the amounts of all statement lines where the source of the data was a CSV file upload in to Xero.   This gives an indication on the certainty of correctness of the data. Only positive transactions are included.
    float fileUploadPos?;
    # Sum of the amounts of all statement lines where the source of the data was manually keyed in to Xero.   This gives an indication on the certainty of correctness of the data. Only positive transactions are included.
    float manualPos?;
    # Sum of the amounts of all statement lines where the source of the data was a direct bank feed in to Xero.   This gives an indication on the certainty of correctness of the data.  Only negative transactions are included.
    float directBankFeedNeg?;
    # Sum of the amounts of all statement lines where the source of the data was a indirect bank feed to Xero (usually via Yodlee).   This gives an indication on the certainty of correctness of the data.  Only negative transactions are included.
    float indirectBankFeedNeg?;
    # Sum of the amounts of all statement lines where the source of the data was a CSV file upload in to Xero.   This gives an indication on the certainty of correctness of the data.  Only negative transactions are included.
    float fileUploadNeg?;
    # Sum of the amounts of all statement lines where the source of the data was manually keyed in to Xero.   This gives an indication on the certainty of correctness of the data.  Only negative transactions are included.
    float manualNeg?;
    # Sum of the amounts of all statement lines where the source of the data was any other category.   This gives an indication on the certainty of correctness of the data.  Only positive transactions are included.
    float otherPos?;
    # Sum of the amounts of all statement lines where the source of the data was any other category.   This gives an indication on the certainty of correctness of the data.  Only negative transactions are included.
    float otherNeg?;
    # Sum of the amounts of all statement lines where the source of the data was any other category.   This gives an indication on the certainty of correctness of the data.
    float other?;
};

public type Problem record {
    ProblemType 'type?;
    string? title?;
    int status?;
    string? detail?;
};

public type PracticeResponse record {
    # Year of becoming a partner.
    int xeroPartnerSince?;
    # Customer tier e.g. Silver
    string? tier?;
    # Country of location.
    string? location?;
    # Organisation count.
    int organisationCount?;
    # Staff certified (true/false).
    boolean staffCertified?;
};

public type CashAccountResponse record {
    # Total value of transactions in the journals which are not reconciled to bank statement lines, and have a positive (debit) value.
    float unreconciledAmountPos?;
    # Total value of transactions in the journals which are not reconciled to bank statement lines, and have a negative (credit) value.
    float unreconciledAmountNeg?;
    # Starting (or historic) balance from the journals (manually keyed in by users on account creation - unverified).
    float startingBalance?;
    # Current cash at bank accounting value from the journals.
    float accountBalance?;
    # Currency which the cashAccount transactions relate to.
    string? balanceCurrency?;
};

public type ProfitAndLossResponse record {
    # Start date of the report
    string startDate?;
    # End date of the report
    string endDate?;
    # Net profit loss value
    float netProfitLoss?;
    PnlAccountClass revenue?;
    PnlAccountClass expense?;
};
