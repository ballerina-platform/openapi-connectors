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

import ballerina/constraint;

public type ProductCodes record {
    @constraint:String {maxLength: 40}
    string productCode?;
    @constraint:String {maxLength: 2}
    string productCodeTypeCode?;
};

public type ResponseNotFoundMessage record {
    string message?;
    string 'error?;
    string timestamp?;
};

public type ResponseProductMessage record {
    string externalid?;
    string message?;
    string timestamp?;
};

public type ProductUnitOfMeasureConversion record {
    int quantityDenominator?;
    int quantityNumerator?;
    ProductCodes[] productCodes;
    string measurementUnit?;
};

public type ResponseForbiddenMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type Product record {
    string baseUnitOfMeasure;
    @constraint:String {maxLength: 4}
    string brand?;
    @constraint:Int {maxValue: 20}
    int businessSystem?;
    boolean isMarkedForDeletion?;
    @constraint:String {maxLength: 40}
    string externalId;
    ProductDescription[] description;
    @constraint:String {maxLength: 9}
    string groupCode?;
    @constraint:String {maxLength: 18}
    string externalHierarchyId?;
    ProductUnitOfMeasureConversion[] unitOfMeasureConversions?;
};

public type ProductDescription record {
    string description?;
    @constraint:String {maxLength: 2, minLength: 2}
    string languageKey?;
};

public type ResponseDeleteMessage record {
    string message?;
    string timestamp?;
};

public type ResponseMessage record {
    string 'error?;
    string message?;
    string timestamp?;
    string uri?;
};

public type ResponseUnauthorizedMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type ResponseProductDeleteMessage record {
    string externalid?;
    string message?;
    string timestamp?;
};
