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

public type ExternalCustomerHierarchyNodeKeyVDTO record {
    @constraint:String {maxLength: 18}
    string customerHierarchyNodeId;
    @constraint:String {maxLength: 2}
    string customerHierarchyTypeCode;
    @constraint:String {maxLength: 20}
    string hierarchyId;
};

public type ResponseNotFoundPromotionDeletionMessage record {
    string externalId?;
    string message?;
    ExternalPromotionDTO promotion?;
    string timestamp?;
};

public type ExternalPromotionReferenceDTO record {
    @constraint:String {maxLength: 20}
    string documentId?;
    @constraint:String {maxLength: 2}
    string documentType?;
};

public type ResponsePromotionDeleteAllMessage record {
    int count?;
    string message?;
    string timestamp?;
};

public type ResponseMessage record {
    string message?;
    string uri?;
    string timestamp?;
};

public type InlineResponse400 ResponseInvalidCustomer|ResponseInvalidDate|ResponseInvalidProduct;

public type ResponseUnauthorizedMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type ResponseInvalidCustomer record {
    string message?;
    string uri?;
    string timestamp?;
};

public type ExternalProductHierarchyNodeKeyVDTO record {
    @constraint:String {maxLength: 20}
    string hierarchyId;
    @constraint:String {maxLength: 18}
    string productHierarchyNodeId;
    @constraint:String {maxLength: 2}
    string productHierarchyTypeCode;
};

public type ResponsePromotionDeletionMessage record {
    string externalId?;
    string message?;
    string timestamp?;
};

public type ResponseExternalPromotionListMessage record {
    string message?;
    ExternalPromotionDTO[] promotions?;
    string timestamp?;
};

public type ResponseInvalidDate record {
    int externalId?;
    string message?;
    string timestamp?;
};

public type ResponseNotFoundMessage record {
    string message?;
    string 'error?;
    string timestamp?;
};

public type ResponseExternalPromotionMessage record {
    string externalId?;
    string message?;
    int count?;
    ExternalPromotionDTO promotion?;
    string timestamp?;
};

public type PromotionTypeCodeV record {
    string promotionTypeCode?;
};

public type ResponsePromotionCreationMessage record {
    int externalId?;
    string message?;
    string timestamp?;
};

public type ExternalPromotionCustomerVDTO record {
    @constraint:String {maxLength: 60}
    string customerExternalId?;
    ExternalCustomerHierarchyNodeKeyVDTO customerHierarchyNodeKey?;
};

public type ExternalPromotionDTO record {
    int businessSystem;
    @constraint:String {maxLength: 240}
    string description?;
    ExternalPromotionReferenceDTO[] documentReferences?;
    @constraint:String {maxLength: 36, minLength: 1}
    string externalId;
    ExternalSalesAreaVDTO externalSalesArea?;
    int id?;
    string internalId?;
    boolean isMarkedForDeletion?;
    ExternalPromotionCustomerVDTO promotionCustomer;
    PromotionDateDTO[] promotionDates;
    ExternalPromotionProductDTO[] promotionProducts;
    string status?;
    PromotionTypeCodeV[] types?;
};

public type ResponseForbiddenMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type ResponseInvalidProduct record {
    string message?;
    string uri?;
    string timestamp?;
};

public type ExternalPromotionProductDTO record {
    @constraint:String {maxLength: 40}
    string productExternalId;
    ExternalProductHierarchyNodeKeyVDTO productHierarchyNodeKey;
};

public type PromotionDateDTO record {
    string promotionDateTypeCode;
    string validFrom;
    string validTo;
};

public type ResponseNotFoundPromotionMessage record {
    string externalId?;
    string message?;
    ExternalPromotionDTO promotion?;
    string timestamp?;
};

public type ExternalSalesAreaVDTO record {
    @constraint:String {maxLength: 2}
    string distributionChannel?;
    @constraint:String {maxLength: 2}
    string salesDivision?;
    @constraint:String {maxLength: 4}
    string salesOrganization?;
};
