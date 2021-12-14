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

public type MappingJobResult MappingJobResultFigiList;

public type BulkMappingJobResult MappingJobResult[];

# For V3: securityType2 is required when idType is BASE_TICKER or ID_EXCH_SYMBOL.  expiration is required when securityType2 is Option or Warrant.  maturity is required when securityType2 is Pool.
public type MappingJob record {
    # Type of third party identifier
    string idType;
    # The value for the represented third party identifier
    string|int idValue;
    # Exchange code of the desired instrument(s) (cannot use in conjunction with micCode)
    string? exchCode?;
    # ISO market identification code(MIC) of the desired instrument(s) (cannot use in conjunction with exchCode)
    string? micCode?;
    # Currency associated to the desired instrument(s)
    string? currency?;
    # Market sector description of the desired instrument(s)
    string? marketSecDes?;
    # Security type of the desired instrument(s)
    string? securityType?;
    # An alternative security type of the desired instrument(s)
    string? securityType2?;
    # Set to true to include equity instruments that are not listed on an exchange
    boolean? includeUnlistedEquities?;
    # Will filter instruments based on option type
    string? optionType?;
    # At least one entry should be non-null.
    NullableNumberInterval? strike?;
    # At least one entry should be non-null.
    NullableNumberInterval? contractSize?;
    # At least one entry should be non-null.
    NullableNumberInterval? coupon?;
    # At least one entry should be non-null.
    NullableDateInterval? expiration?;
    # At least one entry should be non-null.
    NullableDateInterval? maturity?;
    # State code of the desired instrument(s)
    string? stateCode?;
};

public type FigiResult record {
    # FIGI assigned to the instrument
    string figi?;
    # Enum-like attributes of the instrument
    string? securityType?;
    # Enum-like attributes of the instrument
    string? marketSector?;
    # Various attributes of the instrument
    string? ticker?;
    # Various attributes of the instrument
    string? name?;
    # Enum-like attributes of the instrument
    string? exchCode?;
    # Various attributes of the instrument
    string? shareClassFIGI?;
    # Various attributes of the instrument
    string? compositeFIGI?;
    # Enum-like attributes of the instrument
    string? securityType2?;
    # Various attributes of the instrument
    string? securityDescription?;
    # Exists when API is unable to show non-FIGI fields.
    string? metadata?;
};

public type MappingJobResultFigiList record {
    FigiResult[] data?;
};

public type BulkMappingJob MappingJob[];

# At least one entry should be non-null.
public type NullableNumberInterval decimal[2]?;

# At least one entry should be non-null.
public type NullableDateInterval string[2]?;

public type MappingJobResultFigiNotFound record {
    string warning?;
};

public type Values record {
    string[] values?;
};
