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

import ballerina/constraint;

public type BusinessContext record {
    # Business System
    @constraint:String {maxLength: 255}
    string businessSystem?;
    # The type of business object whose business partners are screened. Possible values are `SO` for _Sales Order_, `OD` for _Outbound Delivery_, `PO` for _Purchase Order_, `PC` for _Purchase Contract_, `PA` for _Purchase Scheduling Agreement_, `SC` for _Sales Contract_, `SA` for _Sales Scheduling Agreement_, `APMPAYMENTREQUEST` for _Payment_, `SQ` for _Sales Quotation_, `ID` for _Inbound Delivery_ and `PR` for _Purchase Requisition_.
    @constraint:String {maxLength: 255}
    string businessObjectType?;
    # Document ID
    @constraint:String {maxLength: 255}
    string documentId?;
};

public type BusinessPartner record {
    @constraint:String {maxLength: 255}
    string name?;
    @constraint:String {maxLength: 255}
    string street?;
    @constraint:String {maxLength: 255}
    string city?;
    @constraint:String {maxLength: 2}
    string countryISOCode?;
    @constraint:String {maxLength: 255}
    string postalCode?;
    @constraint:String {maxLength: 255}
    string inputKey?;
    boolean logicalDelete?;
    # Date on which the record was logically deleted in UTC
    string logicalDeleteOn?;
};

public type Error record {
    # Error code
    string code?;
    # Error text
    string message?;
};

public type DeletionResult record {
    # Number of (logically) deleted records
    int number?;
    # Description of deletion result
    string text?;
};

public type ScreeningDecision record {
    # Externally provided Key of Business Partner Input
    @constraint:String {maxLength: 255}
    string inputKey?;
    # Screening Hit Decision [ N - No Hit, C - Confirmed Hit, P - Possible Hit]
    @constraint:String {maxLength: 1}
    string status?;
};

# Business Partners
public type BusinessPartners BusinessPartner[];

# Screening Decisions
public type ScreeningDecisions ScreeningDecision[];
