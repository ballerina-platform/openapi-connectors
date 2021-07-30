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

public type InputNumberRange record {
    # Start of range
    decimal 'start;
    # End of range
    decimal end;
};

public type InputConvertDistance record {
    decimal input;
    string 'source;
    string target;
};

public type InputConvertAngle record {
    decimal input;
    string 'source;
    string target;
};

public type InputConvertDuration record {
    decimal input;
    string 'source;
    string target;
};

public type InputCalculateNumber record {
    # Numeric value to calculate
    decimal input;
    # Round to number of decimal places
    decimal decimals;
};

public type InputConvertEnergy record {
    decimal input;
    string 'source;
    string target;
};

public type InputCalculateMinMax record {
    # Colllection of values to calculate
    decimal[] input;
    # Minimum or Maximum
    string 'type;
};

public type InputConvertSpeed record {
    decimal input;
    string 'source;
    string target;
};

public type InputCalculatePower record {
    # Number to raise
    decimal input;
    # Power
    decimal power;
    # Round to number of decimal places
    decimal decimals;
};

public type OutputNumber record {
    # Result
    decimal result?;
};

public type InputConvertTemperature record {
    decimal input;
    string 'source;
    string target;
};

public type InputConvertArea record {
    decimal input;
    string 'source;
    string target;
};

public type InputConvertPower record {
    decimal input;
    string 'source;
    string target;
};

public type InputConvertVolume record {
    decimal input;
    string 'source;
    string target;
};

public type InputConvertWeight record {
    decimal input;
    string 'source;
    string target;
};

public type InputCalculateNumbers record {
    # Numeric value
    decimal input;
    # Addend, subtrahend, factor, divisor or radicand
    decimal value;
    # Round to number of decimal places
    decimal decimals;
};

public type InputCalculateSeries record {
    # Colllection of values to calculate
    decimal[] input;
    # Round to number of decimal places
    decimal decimals;
};
