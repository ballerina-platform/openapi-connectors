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

# Contains details about exchange rate of the currency
public type ExchangeRate record {
    # Status of the response
    string Code?;
    # Country where this currency is in use
    string Country?;
    # Credits remaining for usage of API
    string Credits?;
    # Name of currency
    string Name?;
    # Current rate equal to one US dollar
    string Rate?;
    # Symbol of currency
    string Symbol?;
};
