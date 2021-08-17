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

public type ErrorField record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # Human-readable, English description of the problem with the contents of the field
    string message?;
    # JSONPath referring to a field containing an error OR JSONPath referring to a field that refers to an object containing an error, with more detail in `pathRelated`
    string path;
    # JSONPath referring to a field containing an error, which is referenced by `path`
    string pathRelated?;
};

public type Secret record {
    # The secret value used to set a subaccount's password
    string secret?;
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

public type ShopperId record {
    # Identifier for the Customer record associated with this Shopper record. This is an alternate identifier that some systems use to identify an individual shopper record
    string customerId?;
    string shopperId;
};

public type ShopperUpdate record {
    string email?;
    int externalId?;
    string marketId?;
    string nameFirst?;
    string nameLast?;
};

public type PasswordError record {
    # Response type, always 'error'
    string 'type?;
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code?;
    # Human-readable, English description of the error
    string message?;
};

public type ShopperStatus record {
    # Indicates the billing state of the Shopper.<br />ABANDONED: The shopper has not been billed in at least 10 years and has no active subscriptions.<br />INACTIVE: The shopper has been billed within the last 10 years but has no active subscriptions.<br />ACTIVE: The shopper has at least one active subscription.
    string billingState?;
};

public type Error record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # List of the specific fields, and the errors found with their contents
    ErrorField[] fields?;
    # Human-readable, English description of the error
    string message?;
};

public type Shopper record {
    # Identifier for the Customer record associated with this Shopper record. This is an alternate identifier that some systems use to identify an individual shopper record
    string customerId?;
    string email;
    int externalId?;
    string marketId;
    string nameFirst;
    string nameLast;
    string shopperId;
};

public type SubaccountCreate record {
    string email;
    int externalId?;
    string marketId?;
    string nameFirst;
    string nameLast;
    string password;
};
