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

# Contains details about Zip Information
public type ZipInfo record {
    # Size of this Zip Code
    string AreaSquareMiles?;
    # City corresponding to this Zip Code
    string City?;
    # Five-digit Zip Code
    string Code?;
    # Credits Remaining
    string Credits?;
    # Elderly household percentage this Zip Code
    string ElderlyHouseholdPercent?;
    # Farmer household percentage in this Zip Code
    string FarmerHouseholdPercent?;
    # Percentage of income greater than $100k in this Zip Code
    string IncomePercent100k?;
    # Percentage of income greater than $200k in this Zip Code
    string IncomePercent200k?;
    # Percentage of income greater than $50k in this Zip Code
    string IncomePercent50k?;
    # Latitude centroid coordinate for this Zip Code
    string Latitude?;
    # Longitude centroid coordinate for this Zip Code
    string Longitude?;
    # Married household percentage in this Zip Code
    string MarriedHouseholdPercent?;
    # Population of this Zip Code
    string Population?;
    # State corresponding to this Zip Code
    string State?;
    # Five-digit Zip Code
    string ZipCode?;
};
