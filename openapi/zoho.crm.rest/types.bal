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

# Represents the name, ID, and email ID of the record owner.
public type Owner record {
    # Name
    string name?;
    # Owner ID
    string id?;
    # Email
    string email?;
};

public type RecordsdataInfo record {
    int per_page?;
    int count?;
    int page?;
    boolean more_records?;
};

public type LeadResponse record {
    string Contacts?;
    string? Deals?;
    string Account?;
};

public type ResponseData record {
    string code?;
    ResponseDetails details?;
    string message?;
    string status?;
};

public type ConvertLeadResponse record {
    LeadResponse[] data?;
};

public type Response record {
    ResponseData[] data?;
};

public type LeadData record {
    Lead[] data?;
};

public type By record {
    string name?;
    string id?;
};

public type RecordsData record {
    Record[] data?;
    RecordsdataInfo info?;
};

public type Lead record {
    # Specify if the Lead details must be overwritten in the Contact/Account/Deal based on lead conversion mapping configuration.
    boolean overwrite?;
    # Specify whether the lead owner must get notified about the lead conversion via email.
    boolean notify_lead_owner?;
    # Specify whether the user to whom the contact/account is assigned to must get notified about the lead conversion via email.
    boolean notify_new_entity_owner?;
    # Use this key to associate an account with the lead being converted. Pass the unique and valid account ID.
    string Accounts?;
    # Use this key to associate a contact with the lead being converted. Pass the unique and valid contact ID.
    string Contacts?;
    # Use this key to assign record owner for the new contact and account. Pass the unique and valid user ID.
    string assign_to?;
    LeadDeals Deals?;
    record {} carry_over_tags?;
};

public type Record record {
    # Represents the name, ID, and email ID of the record owner.
    Owner Owner?;
    # Represents the symbol of the currency of the organization. For instance, '₹'.
    string '\$currency\_symbol?;
    # Represents if the record is a part of review process.
    boolean '\$process\_flow?;
    # Represents the exchange rate set for the organization.
    int Exchange_Rate?;
    # Represents the currency of the organization.
    string Currency?;
    # Represents if the current record is approved.
    boolean '\$approved?;
    # Represents the details of the approval process.
    record {} '\$approval?;
    # Represents the date and time at which the record was created.
    string Created_Time?;
    # Represents the date and time at which the record was last modified.
    string Modified_Time?;
    # Represents if the user can edit records in the current module.
    boolean '\$editable?;
    # Represents the name, ID, and email of the user who created the current record.
    record {} Created_By?;
    # Represents the name, ID, and email of the user who last modified the record.
    record {} Modified_By?;
    # Represents if the current record is a part of orchestration.
    boolean? '\$orchestration?;
};

public type ResponseDetails record {
    string Modified_Time?;
    By Modified_By?;
    string Created_Time?;
    string id?;
    By Created_By?;
};

public type LeadDeals record {
    string Deal_Name;
    string Closing_Date;
    string Stage;
};
