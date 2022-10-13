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

# Details of a specific currency
public type AvailableCurrency record {
    # ISO 4217 currency three-letter code associated with the country
    string ISOCurrencyCode?;
    # Symbol associated with the currency
    string CurrencySymbol?;
    # Full name of the currency
    string CurrencyEnglishName?;
    # Name of the country
    string CountryName?;
    # Three-letter ISO 3166-1 country code
    string CountryThreeLetterCode?;
    # Two-letter ISO 3166-1 country code
    string CountryISOTwoLetterCode?;
    # True if this country is currently a member of the European Union (EU), false otherwise
    boolean IsEuropeanUnionMember?;
};

# Result of performing an enumerate currencies operation
public type AvailableCurrencyResponse record {
    # List of available currencies from the API
    AvailableCurrency[] Currencies?;
};

# Result of performing a get exchange rate operation
public type ExchangeRateResult record {
    # The exchange rate from the source to the destination currency
    decimal ExchangeRate?;
};

# Result of performing a Convert Currency operation
public type ConvertedCurrencyResult record {
    # The converted price in the destination currency
    decimal ConvertedPrice?;
    # ISO 4217 currency three-letter code of destination price
    string ISOCurrencyCode?;
    # Destination currency symbol
    string CurrencySymbol?;
    # Formatted price in the destination currency as a string
    string FormattedPriceAsString?;
};
