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

public type UoMResponseDTO record {
    string languageKey?;
    string unitDescription?;
    string unitText?;
};

public type ResponseNotFoundMessage record {
    string message?;
    string 'error?;
    string timestamp?;
};

public type UoMStoreDTO record {
    string businessSystem?;
    string languageKey?;
    int numberOfDecimals?;
    string unitDescription?;
    string unitOfMeasureCode?;
    string unitOfMeasureCodeISO?;
    string unitText?;
};

public type ResponseForbiddenMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type ResponseUoMMessage record {
    string langKey?;
    string message?;
    string timestamp?;
    string unitOfMeasureISO?;
};

public type ResponseMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type ResponseDeleteAll record {
    int count?;
    string message?;
    string timestamp?;
};

public type ResponseUnauthorizedMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type UoMStoreResponse record {
    string message?;
    string timestamp?;
    UoMStoreDTO[] uomStoreData?;
};
