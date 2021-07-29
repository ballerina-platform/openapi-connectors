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

public type InlineResponse200 record {
    # The currency code you supplied as base in your request
    string base?;
    # The date these exchange rates are for
    string date?;
    # Each supported currency code in terms of the base currency
    record {} rates?;
    # The epoch time this set of exchange rates was generated
    int time_last_updated?;
};

public type InlineResponse404 record {
    string error_type?;
    string result?;
};
