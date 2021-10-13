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

public type WorldBankResponse (PaginationData|IndicatorInformation[]?)[];

public type PaginationData record {
    int page;
    int pages;
    int per_page;
    int total;
    string? sourceid;
    string? sourcename;
    string? lastupdated;
};

# Represent country population.
public type IndicatorInformation record {
    # Data indicator
    Indicator indicator;
    # Represent a Country
    Country country;
    # Date-range by year, month or quarter that scopes the result-set.
    string date;
    # Country population
    int? value;
    # Country ISO3 Code
    string countryiso3code;
    # Unit of measure
    string unit;
    # Decimal
    decimal 'decimal;
    # OBS Status
    string obs_status?;
};

# Represent a Country
public type Country record {
    # Country code
    string id;
    # Country name
    string value;
};

# Data indicator
public type Indicator record {
    # Id of the indicator
    string id;
    # Value represent by the indicator
    string value;
};

type JsonArr json[];

type ErrorResponse record {
    ErrorMessage[] message;
};

type ErrorMessage record {
    string id;
    string 'key;
    string value;
};
