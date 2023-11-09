// Copyright (c) 2022, WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

# The term in which charges were incurred.
public type AcademicPeriod record {
    # The global identifier for the Academic Period.
    string id;
};

# The accounting code of the funding destination associated with the student charge.
public type FundingDestination record {
    # The global identifier for the Funding Destination.
    string id;
};

# Metadata about the JSON payload
public type Metadata record {
    # The name of the originator (user or system) of the data. This is informational only, do not use in business logic!
    string createdBy?;
    # The date and time when the entity instance was created
    string|string createdOn?;
    # The name of the modifier (user or system) of the data. This is informational only, do not use in business logic!
    string modifiedBy?;
    # The date and time when the entity instance was last modified
    string|string modifiedOn?;
};

# Charges incurred by a student.
public type StudentCharges record {
    # Metadata about the JSON payload
    Metadata metadata?;
    # The global identifier of the student charge.
    string id;
    # The person (student) who incurred the charge.
    Student student;
    # The accounting code of the funding source associated with the student charge.
    record {
        # The global identifier for the Funding Source.
        string id;
    } fundingSource?;
    # The accounting code of the funding destination associated with the student charge.
    FundingDestination fundingDestination;
    # The term in which charges were incurred.
    AcademicPeriod academicPeriod;
    # The date when the student becomes liable for the charge.
    string chargeableOn;
    # The amount of the charge.
    record {
        # The amount of the charge.
        record {
            # The monetary value
            decimal value;
            # The ISO 4217 currency code
            string currency;
        } amount;
    }|record {
        # The amount of the charge.
        record {
            # The quantity being charged.
            decimal quantity;
            # Cost of each unit being charged.
            record {
                # The monetary value
                decimal value;
                # The ISO 4217 currency code
                string currency;
            } cost;
        } unitCost;
    } chargedAmount;
    # Attributes specific to the transaction when identified for tax reporting only.
    record {
        # The usage associated with the charge (i.e. tax reporting only).
        string usage;
        # The date the charge originated for consideration in tax report generation.
        string originatedOn;
        # The activity dates (e.g., section start and end date) associated with the charge for tax reporting purposes.
        record {
            # The start date of the activity associated with the charge.
            string startOn;
            # The end date of the activity associated with the charge.
            string endOn;
        } activityDates?;
    } reportingDetail?;
    # The override description associated with the charge.
    string overrideDescription?;
    # The comments associated with the charge.
    string[] comments?;
};

# The person (student) who incurred the charge.
public type Student record {
    # The global identifier for the Student.
    string id;
};
