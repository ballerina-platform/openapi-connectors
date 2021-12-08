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

public type ErrorModelReference record {
    # A description of the error
    string? _error;
};

public type ViewLedgerAccount record {
    # The name of the ledger account.
    string? ledgerAccountName?;
    # The resulting worktags configured for an account posting rule.
    WorkTagSummary[]? resultingWorktags?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

# collection something or other
public type InlineResponse2001 record {
    ViewLedgerAccount[]? data?;
    int? total?;
};

public type InstanceModelReference record {
    # wid / id / reference id
    string? id;
    # A description of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
};

public type CurrencySummary record {
    # ID
    string? code?;
    # Precision
    int? precision?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

# collection something or other
public type InlineResponse200 record {
    CurrencySummary[]? data?;
    int? total?;
};

public type MultipleInstanceModelReference record {
    int? total?;
    InstanceModelReference[]? data?;
};

public type WorkTagSummary record {
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type ValidationErrorModelReference record {
    *ErrorModelReference;
    # An array of validation errors
    ErrorModelReference[]? errors?;
};
