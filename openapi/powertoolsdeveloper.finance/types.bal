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

public type OutputMarketIndex record {
    # Date
    string date?;
    # Index symbol
    string symbol?;
    # Market exchange
    string exchange?;
    # Open value
    decimal open?;
    # High value
    decimal high?;
    # Low value
    decimal low?;
    # Close value
    decimal close?;
    # Trading volume
    decimal volume?;
    # Adjusted open value
    decimal adj_open?;
    # Adjusted high value
    decimal adj_high?;
    # Adjusted low value
    decimal adj_low?;
    # Adjusted close value
    decimal adj_close?;
    # Adjusted trading volume
    decimal adj_volume?;
};

public type InputMarketIndex record {
    # Market index
    string symbol;
    # Date (yyyy-MM-dd, leave empty for last trading day)
    string date?;
};

public type OutputString record {
    # Result
    string result?;
};

public type InputCurrencyFormat record {
    # Amount to format
    decimal input;
    string target;
};

public type InputCurrencyConversion record {
    # Amount to convert
    decimal input;
    string 'source;
    string target;
};

public type OutputstockpriceResult record {
    # Date
    string date?;
    # Ticker symbol
    string symbol?;
    # Stock exchange
    string exchange?;
    # Open
    decimal open?;
    # High
    decimal high?;
    # Low
    decimal low?;
    # Close
    decimal close?;
    # Volume
    decimal volume?;
};

public type OutputNumber record {
    # Result
    decimal result?;
};

public type OutputStockPrice record {
    # Stock price information
    OutputstockpriceResult[] result?;
};

public type InputStockPrices record {
    # Stock ticker symbols (comma-separated, max 20)
    string symbols;
    # Date (yyyy-MM-dd, leave empty for latest)
    string date?;
    # Stock exchange
    string exchange?;
};
