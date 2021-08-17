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

public type ErrorField record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # Human-readable, English description of the problem with the contents of the field
    string message?;
    # JSONPath referring to the field within the submitted data containing an error
    string path;
};

public type ErrorLimit record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # List of the specific fields, and the errors found with their contents
    ErrorField[] fields?;
    # Human-readable, English description of the error
    string message?;
    # Number of seconds to wait before attempting a similar request
    int retryAfterSec;
    # Stack trace indicating where the error occurred.<br/>
    # NOTE: This attribute <strong>MAY</strong> be included for Development and Test environments.
    # However, it <strong>MUST NOT</strong> be exposed from OTE nor Production systems
    string[] stack?;
};

public type ArrayOfCountrySummary CountrySummary[];

public type State record {
    # The localized name of the state, province, or territory
    string label?;
    # The state code
    string stateKey?;
};

public type Country record {
    # The calling code prefix used for phone numbers in this country
    string callingCode?;
    # The ISO country-code
    string countryKey?;
    # The localized name of the country
    string label?;
    # List of states/provinces in this country
    State[] states?;
};

public type Error record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # List of the specific fields, and the errors found with their contents
    ErrorField[] fields?;
    # Human-readable, English description of the error
    string message?;
    # Stack trace indicating where the error occurred.<br/>
    # NOTE: This attribute <strong>MAY</strong> be included for Development and Test environments.
    # However, it <strong>MUST NOT</strong> be exposed from OTE nor Production systems
    string[] stack?;
};

public type ArrayOfCountry Country[];

public type CountrySummary record {
    # The calling code prefix used for phone numbers in this country
    string callingCode?;
    # The ISO country-code
    string countryKey?;
    # The localized name of the country
    string label?;
};
