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

public type LegalAgreementArr LegalAgreement[];

public type ErrorField record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # Human-readable, English description of the problem with the contents of the field
    string message?;
    # <ul>
    # <li style='margin-left: 12px;'>JSONPath referring to a field containing an error</li>
    # <strong style='margin-left: 12px;'>OR</strong>
    # <li style='margin-left: 12px;'>JSONPath referring to a field that refers to an object containing an error, with more detail in `pathRelated`</li>
    # </ul>
    string path;
    # JSONPath referring to a field containing an error, which is referenced by `path`
    string pathRelated?;
};

public type LegalAgreement record {
    # Unique identifier for the legal agreement
    string agreementKey;
    # Contents of the legal agreement, suitable for embedding
    string content;
    # Title of the legal agreement
    string title;
    # URL to a page containing the legal agreement
    string url?;
};

public type ErrorLimit record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # List of the specific fields, and the errors found with their contents
    ErrorField[] fields?;
    # Human-readable, English description of the error
    string message?;
    # Number of seconds to wait before attempting a similar request
    int retryAfterSec;
};

public type Error record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # List of the specific fields, and the errors found with their contents
    ErrorField[] fields?;
    # Human-readable, English description of the error
    string message?;
};
