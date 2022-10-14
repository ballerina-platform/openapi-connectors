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

public type Status record {
    # Transaction ID.
    string TransactionID?;
    # Return code.
    int ReturnCode?;
    # Message.
    string Message?;
};

public type ApprovalsPayload record {
    # Numeric module reference ID.
    string moduleID?;
    # Name of module, also type of object to be approved.
    string moduleName?;
    # Globally unique database-level identifier of object. This is the ID used for the drill down call. Not visible to end users.
    string ID?;
    ApprovalsAttributes Attributes?;
    # Ok if response is OK.
    string Status?;
    # All ok if response is OK.
    string Details?;
    # Ok if response is OK.
    string ActivityID?;
};

public type Approvals record {
    ApprovalsHeader HEADER?;
    ApprovalsPayload[] PAYLOAD?;
};

public type Error string;

public type ApprovalsAttributes record {
    # Object ID, visible to end users.
    string ref?;
    # 3-character currency code.
    string uom?;
    # Name of object as defined by user.
    string name?;
    # Start date.
    string startDate?;
    # End date.
    string endDate?;
    # Amount to be approved.
    string amount?;
    # Revision number of object to be approved.
    int refVersion?;
    # Always returns false.
    boolean validObject?;
    # Recorded start date of object to be approved. Logical value is module dependent.
    string createDate?;
    # Creator name.
    string creatorName?;
    # Unique name.
    string uniqueName?;
    # Unique name.
    string emailId?;
    # Ok if response is OK.
    string status?;
    # Source link.
    string sourceLink?;
    # Additional data captured in SAP Fieldglass for the object. Full list of data is module and configuration-dependent and should be consumed/presented as extrinsic.
    record {} others?;
};

public type ApprovalsHeader record {
    # API version.
    string appVersion?;
    # API version
    string OSUAStr?;
    # Number of records returned in the payload.
    int numRecs?;
    # Status of the API call.
    string status?;
    # Always All Ok for successful responses.
    string details?;
};
