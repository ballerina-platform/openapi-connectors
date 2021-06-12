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

# Data indicator
public type Indicator record {
    # Id of the indicator
    string id?;
    # Value represent by the indicator
    string value?;
};

# Represent a Country
public type Country record {
    # Country code
    string id?;
    # Country name
    string value?;
};

# Represent access to electricity
public type AccessToElectricity record {
    # World bank indicator
    Indicator indicator?;
    # Country
    Country country?;
    # Date-range by year, month or quarter that scopes the result-set.
    string date?;
    # Population percentage having electricity
    float? value?;
};

# Represent youth literacy rate
public type YouthLiteracyRate record {
    # World bank indicator
    Indicator indicator?;
    # Country
    Country country?;
    # Date-range by year, month or quarter that scopes the result-set.
    string date?;
    # Youth literacy rate
    float? value?;
};

# Represent gross domestic product
public type GrossDomesticProduct record {
    # World bank indicator
    Indicator indicator?;
    # Country
    Country country?;
    # Date-range by year, month or quarter that scopes the result-set.
    string date?;
    # Gross domestic product
    float? value?;
};

# Represent primary education expenditure
public type PrimaryEducationExpenditure record {
    # World bank indicator
    Indicator indicator?;
    # Country
    Country country?;
    # Date-range by year, month or quarter that scopes the result-set.
    string date?;
    # Primary education expenditure
    float? value?;
};

# Represent country population.
public type CountryPopulation record {
    # World bank indicator
    Indicator indicator?;
    # Country
    Country country?;
    # Date-range by year, month or quarter that scopes the result-set.
    string date?;
    # Country population
    int? value?;
};
