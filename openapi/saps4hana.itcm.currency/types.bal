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

public type ResponseCurrencyMessage record {
    string currencyCode?;
    string langKey?;
    string message?;
    string timestamp?;
};

public type ResponseNotFoundMessage record {
    string message?;
    string 'error?;
    string timestamp?;
};

public type CurrencyCodeResponseDTO record {
    string currencyCode?;
    string currencyText?;
    string languageKey?;
};

public type ResponseForbiddenMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type CurrencyCodeDTO record {
    string currencyCode?;
    string currencyText?;
    string languageKey?;
    int numberOfDecimals?;
    string unitOfMeasureISO?;
};

public type CurrencyCodeResponse record {
    CurrencyCodeResponseDTO[] currencyCodeData?;
    string message?;
    string timestamp?;
};

public type ResponseUnauthorizedMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type ResponseCreatedCurrencyMessage record {
    string currencyCode?;
    string langKey?;
    string message?;
    string timestamp?;
};

public type ResponseDeleteCurrencyMessage record {
    string message?;
    string timestamp?;
};
